local utils = require 'mp.utils'
local msg = require 'mp.msg'

local function shell_escape(s)
    local escaped = s:gsub("'", "'\\''")
    return "'" .. escaped .. "'"
end

mp.register_event('start-file', function (event)
    -- respect audio-display setting
    local audio_display = mp.get_property('audio-display')
    if audio_display == "no" then
        return
    end

    -- have to determine whether this is a bandcamp url
    local path = mp.get_property('path')

    if not path:match('^https?://') then
        msg.log("debug", "Not a bandcamp stream")
        return -- not a webpage; can't be bandcamp
    end

    if not path:match('^https?://[^%.]+%.bandcamp%.com/') then
        -- It's not a .bandcamp.com host, but it could be a custom domain bandcamp still
        local proc = utils.subprocess({
            args = {
                'sh', '-c',
                'curl -sLI ' .. shell_escape(path) .. " | grep '^Set-Cookie:.*domain=\\.bandcamp\\.com[[:space:]]*$'"
            },
            cancellable = true,
            max_size = 1024
        })

        if proc.status ~= 0 then
            msg.log("debug", "Not a bandcamp stream")
            return
        end

        -- At this point we know that this site at least set bandcamp cookies, so let's assume it's bandcamp
    end

    msg.log("debug", "Detected Bandcamp stream")

    local proc = utils.subprocess({
        args = {
            'sh', '-c',
            'curl -sL ' .. shell_escape(path) .. ' | grep \'<meta property="og:image"\' | head -n1'
        },
        cancellable = true,
        max_size = 1024
    })

    if proc.error ~= nil then
        msg.log("warn", "Failed to locate album artwork URI")
        return
    end

    local meta_tag = proc.stdout
    local artwork_uri = meta_tag:gsub('^%s*<meta property="og:image" content="([^"]+)">%s*$', '%1')

    local old_external_files = mp.get_property_native('external-files')
    local new_external_files = { table.unpack(old_external_files) }

    table.insert(new_external_files, artwork_uri)
    mp.set_property_native('external-files', new_external_files)

    local old_vid = mp.get_property('vid')
    mp.set_property('vid', '1')

    local old_image_display_duration = mp.get_property('image-display-duration')
    mp.set_property('image-display-duration', 'inf')

    mp.set_property_number('time-pos', 0)

    local function reset(event)
        mp.set_property_native('external-files', old_external_files)
        mp.set_property('vid', old_vid)
        mp.set_property('image-display-duration', old_image_display_duration)
        
        mp.unregister_event(reset)
    end

    mp.register_event('end-file', reset)
end)
