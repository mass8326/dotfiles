local wezterm = require("wezterm")
local act = wezterm.action

local config = {
  keys = {
    {
      key = "LeftArrow",
      mods = "CTRL|SHIFT",
      action = act.ActivateTabRelative(-1),
    },
    {
      key = "RightArrow",
      mods = "CTRL|SHIFT",
      action = act.ActivateTabRelative(1),
    },
    {
      key = "LeftArrow",
      mods = "CTRL|SHIFT|ALT",
      action = act.MoveTabRelative(-1),
    },
    {
      key = "RightArrow",
      mods = "CTRL|SHIFT|ALT",
      action = act.MoveTabRelative(1),
    },
    {
      key = "UpArrow",
      mods = "CTRL|SHIFT",
      action = act.ScrollToTop,
    },
    {
      key = "DownArrow",
      mods = "CTRL|SHIFT",
      action = act.ScrollToBottom,
    },
    {
      key = "_",
      mods = "CTRL|SHIFT",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "|",
      mods = "CTRL|SHIFT",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "Q",
      mods = "CTRL|SHIFT",
      action = act.CloseCurrentPane({ confirm = true }),
    },
  },
}

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config, { direction_keys = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" } })

return config
