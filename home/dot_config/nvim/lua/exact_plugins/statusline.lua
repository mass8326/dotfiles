---@type LazySpec
return {
  "folke/noice.nvim",
  opts = {
    cmdline = { view = "cmdline" },
    lsp = {
      signature = { enabled = false },
      hover = { enabled = false },
    },
  },
}
