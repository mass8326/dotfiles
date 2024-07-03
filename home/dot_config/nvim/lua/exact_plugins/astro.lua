---@type LazySpec
return {
  { "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = { "astro" } } },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "astro" } },
  },
}
