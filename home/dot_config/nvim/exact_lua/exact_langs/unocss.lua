return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        unocss = {
          handlers = {
            ["textDocument/documentHighlight"] = function() end,
          },
        },
      }
    },
  },
}
