---@type LazySpec
return {
	{ "folke/neodev.nvim", enabled = false },
	---@module "lazydev"
	{
		"folke/lazydev.nvim",
		ft = "lua",
		---@type lazydev.Config
		opts = {
			library = {
				{ path = "lazy.nvim", words = { "LazySpec" } },
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
}
