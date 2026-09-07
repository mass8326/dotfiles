hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,
    resize_on_border = true,
    allow_tearing = false,
    layout = "scrolling",
    col = {
      active_border = "rgb(33ccff)",
      inactive_border = "rgba(595959aa)",
    },
  },
  cursor = {
    no_warps = true,
  },
  misc = {
    disable_splash_rendering = true,
    disable_hyprland_logo = true,
    focus_on_activate = false,
  },
  decoration = {
    rounding = 10,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
  animations = { enabled = true },
  scrolling = { wrap_focus = false, wrap_swapcol = false },
  input = {
    -- Keyboard
    numlock_by_default = true,
    repeat_delay = 200,
    repeat_rate = 50,
    -- Mouse
    follow_mouse = 2,
    sensitivity = 0,
    accel_profile = "flat",
    touchpad = {
      natural_scroll = true,
    },
  },
})
