local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true
config.use_resize_increments = true
config.font = wezterm.font_with_fallback({ "Inconsolata Nerd Font" })
config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"fish",
	"tmux",
	"nu",
	"cmd.exe",
	"pwsh.exe",
	"powershell.exe",
	"wslhost.exe",
	"wsl.exe",
	"conhost.exe",
}

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

if is_linux() then
	config.default_prog = { "/usr/bin/zsh" }
elseif is_windows() then
	config.default_domain = "WSL:Ubuntu"
	config.launch_menu = { { args = { "cmd.exe" }, domain = { DomainName = "local" } } }
	local wsl_domains = wezterm.default_wsl_domains()
	for _, dom in ipairs(wsl_domains) do
		if dom.name == "WSL:Ubuntu-20.04" then
			dom.default_cwd = "~"
		end
		config.wsl_domains = wsl_domains
	end
end

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "ALT",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "ALT",
		action = wezterm.action.Nop,
	},
}

config.keys = {
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "W",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config)

return config
