return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    local bufferline = require("bufferline")
    opts.options.style_preset = {
      bufferline.style_preset_no_bold,
      bufferline.style_preset_no_italic,
    }
  end,
  keys = {
    { "[b", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
    { "]b", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
    { "[B", vim.NIL },
    { "]B", vim.NIL },
  },
}
