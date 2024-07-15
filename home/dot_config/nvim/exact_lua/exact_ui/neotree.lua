return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		source_selector = {
			winbar = true,
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = { "node_modules" },
				never_show = { ".git" },
			},
			window = {
				mappings = {
					["<Right>"] = "open",
					["<Left>"] = "close_node",
				},
			},
		},
		buffers = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				local root = require("astrocore.rooter").detect(nil, false)[1]
				if root == nil or root.paths[1] == nil then
					require("neo-tree.command").execute({ toggle = true })
				else
					require("neo-tree.command").execute({
						toggle = true,
						dir = root.paths[1],
					})
				end
			end,
			desc = "Toggle explorer (root)",
		},
		{
			"<leader>E",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Toggle explorer (cwd)",
		},
	},
}
