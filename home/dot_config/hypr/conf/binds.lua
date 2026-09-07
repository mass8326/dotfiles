local home = os.getenv("HOME")

local terminal = "foot"
local browser = "brave"
local explorer = "nautilus"
local launcher =
  "pkill rofi || rofi -show drun -theme ~/.config/rofi/launchers/type-1/style-11.rasi -run-command 'uwsm app -- {cmd}'"
local winselect = "rofi -show window -theme ~/.config/rofi/launchers/type-1/style-11.rasi"

-- Lauchers
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("uwsm app -- " .. launcher))
hl.bind("SUPER + T", hl.dsp.exec_cmd("uwsm app -- " .. terminal))
hl.bind("SUPER + B", hl.dsp.exec_cmd("uwsm app -- " .. browser))
hl.bind("SUPER + F", hl.dsp.exec_cmd("uwsm app -- " .. explorer))
hl.bind("SUPER + C", hl.dsp.exec_cmd("uwsm app -- code --ozone-platform=wayland --password-store=gnome-libsecret"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("uwsm app -- discord --ozone-platform=wayland"))

-- Actions
hl.bind("SUPER + L", hl.dsp.exec_cmd("uwsm app -- hyprlock"))
hl.bind("SUPER + U", hl.dsp.exec_cmd("uwsm app -- swaync-client -t"))
hl.bind("ALT + TAB", hl.dsp.exec_cmd("uwsm app -- " .. winselect))
hl.bind("CTRL + ALT + DELETE", hl.dsp.exit())
hl.bind(
  "PRINT",
  hl.dsp.exec_cmd(
    'hyprshot --mode region --freeze --output-folder "'
      .. home
      .. '/Pictures/Screenshots" --filename "$(date \'+%Y.%m.%d-%H.%M.%S\').png"'
  )
)
hl.bind(
  "SHIFT + PRINT",
  hl.dsp.exec_cmd(
    'hyprshot --mode window --freeze --output-folder "'
      .. home
      .. '/Pictures/Screenshots" --filename "$(date \'+%Y.%m.%d-%H.%M.%S\').png"'
  )
)
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprpicker| wl-copy"))

-- Debug
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("pkill -fx/usr/bin/waybar; uwsm app -- waybar"))

-- Manipulation
hl.bind("SUPER + BACKSPACE", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + P", hl.dsp.window.pseudo())

-- Window Focus
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- Window Manipulation
hl.bind("SUPER + M", hl.dsp.layout("fit expand"))
hl.bind("SUPER + CTRL + M", hl.dsp.layout("fit all"))
hl.bind("SUPER + CTRL + Left", hl.dsp.layout("swapcol l"))
hl.bind("SUPER + CTRL + Right", hl.dsp.layout("swapcol r"))

-- Workspace Switching
hl.bind("SUPER + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Workspace Manipulation
hl.bind("SUPER + CTRL + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + CTRL + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + CTRL + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + CTRL + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + CTRL + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + CTRL + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + CTRL + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + CTRL + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + CTRL + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + CTRL + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- Mouse Controls
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
