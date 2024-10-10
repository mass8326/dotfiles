local act = require("wezterm").action

return {
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "NONE",
      action = act.DisableDefaultAssignment,
    },
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "ALT",
      action = act.OpenLinkAtMouseCursor,
    },
    {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "ALT",
      action = act.Nop,
    },
  },
}
