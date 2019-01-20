utils = require "mp.utils"

function open_url()
    url = mp.get_property("path")
    utils.subprocess_detached({ args = { "firefox", url } })
end

mp.add_key_binding("Ctrl+f", open_url)
