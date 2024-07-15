return {
	"akinsho/bufferline.nvim",
	opts = function(_, opts)
		local bufferline = require("bufferline")
		vim.tbl_deep_extend("force", opts, {
			options = {
				style_preset = {
					bufferline.style_preset_no_bold,
					bufferline.style_preset_no_italic,
				},
			},
		})
	end,
}
