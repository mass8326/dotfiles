local wezterm = require("wezterm")
local utils = require("utils")

local config = wezterm.config_builder()

config.use_resize_increments = true

config.font_size = 11
config.font = wezterm.font_with_fallback({
  "CommitMono Nerd Font",
  "Hack Nerd Font",
  { family = "Inconsolata Nerd Font", scale = 1.2 },
})

config.inactive_pane_hsb = {
  saturation = 0.90,
  brightness = 0.50,
}

return utils.deep_merge(
  config,
  require("appearance/tabs"),
  require("bindings/keys"),
  require("bindings/mouse"),
  require("launch"),
  {} -- Allows trailing comma for easy commenting and nice git diffs
)
