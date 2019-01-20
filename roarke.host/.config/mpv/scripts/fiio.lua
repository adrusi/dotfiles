utils = require 'mp.utils'

local function trim(s)
    s = s:gsub("\n", "")
    return s
end

local function connect()
	local pid = utils.getpid()
	local sink = trim(utils.subprocess({ cancellable = false, args = { "sink-input-by-pid", pid } }).stdout)
	print("'" .. sink .. "'")
	utils.subprocess_detached { cancellable = false, args = { "pacmd", "move-sink-input", sink, "alsa_output.usb-FiiO_FiiO_USB_DAC-E18-01.analog-stereo" } }
end

local function disconnect()
	local pid = utils.getpid()
	local sink = trim(utils.subprocess({ cancellable = false, args = { "sink-input-by-pid", pid } }).stdout)
	utils.subprocess_detached { cancellable = false, args = { "pacmd", "move-sink-input", sink, "alsa_output.pci-0000_00_1b.0.analog-stereo" } }
end

mp.add_key_binding("c", function()
	connect()
end)

mp.add_key_binding("C", function()
	disconnect()
end)
