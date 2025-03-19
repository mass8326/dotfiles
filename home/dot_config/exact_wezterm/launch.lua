local wezterm = require("wezterm")
local utils = require("utils")

local config = {
  initial_cols = 128,
  initial_rows = 36,
  skip_close_confirmation_for_processes_named = {
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
  },
}

if utils.is_linux() then
  config.default_prog = { "/usr/bin/zsh" }
elseif utils.is_windows() then
  config.launch_menu = { { args = { "cmd.exe" }, domain = { DomainName = "local" } } }
  local wsl_domains = wezterm.default_wsl_domains()
  for _, dom in ipairs(wsl_domains) do
    if dom.name == "WSL:Ubuntu-20.04" then
      config.default_domain = "WSL:Ubuntu-20.04"
      dom.default_cwd = "~"
    end
    if dom.name == "WSL:Ubuntu" then
      config.default_domain = "WSL:Ubuntu"
      dom.default_cwd = "~"
    end
  end
end

return config
