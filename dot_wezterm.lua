local wezterm = require("wezterm")
local config = wezterm.config_builder()

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

if is_linux() then
	config.default_prog = { "/usr/bin/zsh" }
end

return config
