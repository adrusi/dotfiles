local utils = require 'mp.utils'

mp.set_property('input-ipc-server', '/tmp/' .. utils.to_string(utils.getpid()) .. '.mpv.sock')
