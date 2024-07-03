---@type LazySpec
return {
  { "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = { "svelte" } } },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "svelte" } },
  },
}
