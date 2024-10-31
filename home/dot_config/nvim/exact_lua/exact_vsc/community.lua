---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.recipes.vscode" },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "folke/noice.nvim",
    enabled = false,
  },
  config = function()
    vim.opt.cmdheight = "2"
  end,
}
