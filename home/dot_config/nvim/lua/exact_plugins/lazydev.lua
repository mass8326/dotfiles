---@module "lazydev"
---@type LazySpec
return {
  "folke/lazydev.nvim",
  ft = "lua",
  cmd = "LazyDev",
  ---@type lazydev.Config
  opts = {
    library = {
      { path = "luvit-meta/library", words = { "vim%.uv" } },
      { path = "LazyVim", words = { "LazyVim" } },
      { path = "lazy.nvim", words = { "LazyVim", "LazySpec", "LazySpec" } },
      { path = "AstroNvim/astrocore", words = { "AstroCoreOpts" } },
      { path = "mini.ai", words = { "Mini.ai.region" } },
    },
  },
}
