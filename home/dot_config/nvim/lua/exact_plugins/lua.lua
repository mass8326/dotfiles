return {
  { "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = { "lua_ls" } } },
  { "williamboman/mason-null-ls.nvim", opts = { ensure_installed = { "stylua" } } },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "lua" } },
  },
}
