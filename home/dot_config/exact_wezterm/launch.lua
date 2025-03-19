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
  config.default_prog = { "cmd.exe", "/K", "doskey", "/macrofile=%localappdata%/doskey/macro.txt" }
  config.launch_menu = { { args = config.default_prog, domain = { DomainName = "local" } } }
end

return config
