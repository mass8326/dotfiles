local wezterm = require("wezterm")
local utils = require("utils")

local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local index = tab.tab_index
  local pane = tab.active_pane
  local name = utils.basename(pane.foreground_process_name)
  if name == "zsh" then
    name = utils.basename(pane.title)
  end
  local added_chars = 5 + string.len(tostring(index))
  local trunc = wezterm.truncate_right(name, max_width - added_chars)
  local title = " " .. index .. ": " .. trunc .. " "

  local colors = config.colors.tab_bar
  local bg = colors.inactive_tab.bg_color
  if tab.is_active then
    bg = colors.active_tab.bg_color
  end
  local backdrop = colors.background
  local next_tab = tabs[tab.tab_index + 2]
  if next_tab ~= nil then
    if next_tab.is_active then
      backdrop = colors.active_tab.bg_color
    else
      backdrop = colors.inactive_tab.bg_color
    end
  end

  return {
    { Text = title },
    { Background = { Color = backdrop } },
    { Foreground = { Color = bg } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

return {
  tab_bar_at_bottom = true,
  tab_max_width = 24,
  colors = {
    tab_bar = {
      background = "#000",
      active_tab = {
        bg_color = "#444",
        fg_color = "#ccc",
        intensity = "Bold",
      },
      inactive_tab = {
        bg_color = "#111",
        fg_color = "#666",
      },
      inactive_tab_hover = {
        bg_color = "#111",
        fg_color = "#999",
        intensity = "Bold",
        italic = false,
      },
      new_tab = {
        bg_color = "#000",
        fg_color = "#666",
      },
      new_tab_hover = {
        bg_color = "#000",
        fg_color = "#999",
        intensity = "Bold",
      },
    },
  },
  use_fancy_tab_bar = false,
}
