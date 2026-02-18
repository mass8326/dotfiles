alias lock="hyprlock &> /dev/null & systemctl suspend"
function desktop() {
  local envs=()
  if (( $+commands[hyprland] )); then
    envs+=Hyprland
  fi
  if (( $+commands[gnome-session] )); then
    envs+=GNOME
  fi
  if (( $+commands[startplasma-wayland] )); then
    envs+=KDE
  fi
  answer=$(printf "%s\n" $envs  | fzf --prompt="Launch 󰄾 " --height ~50% --layout=reverse --border --select-1)
  case "$answer" in
    "Hyprland")
      uwsm start hyprland-uwsm.desktop
      ;;
    "GNOME")
      gnome-session --no-reexec
      ;;
    "KDE")
      /usr/lib/plasma-dbus-run-session-if-needed \
        /usr/bin/startplasma-wayland
      ;;
    *)
      echo "No desktop environment selected!"
      ;;
  esac
}
