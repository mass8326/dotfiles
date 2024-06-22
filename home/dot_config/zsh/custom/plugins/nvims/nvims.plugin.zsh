function nvims() {
	items=("LazyVim" "AstroNvim" "NvChad")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config 󰄾 " --height=~50% --layout=reverse --border --exit-0)
	case $config in
	"LazyVim") config="" ;;
	"AstroNvim") config="nvim-astro" ;;
	"NvChad") config="nvim-nvchad" ;;
	*)
		echo "Nvim selection aborted"
		return 0
		;;
	esac
	NVIM_APPNAME=$config nvim $@
}
