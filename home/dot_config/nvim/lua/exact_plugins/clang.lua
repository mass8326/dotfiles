return {
	"jay-babu/mason-null-ls.nvim",
	opts = function(_, opts)
		opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "clang-format")
	end,
}
