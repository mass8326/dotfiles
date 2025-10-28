---@module "astronvim"

---@type LazySpec
local astro = {
  "AstroNvim/AstroNvim",
  version = "^4",
  import = "astronvim.plugins",
  ---@type AstroNvimOpts
  opts = {
    mapleader = " ",
    maplocalleader = ",",
    icons_enabled = true,
    pin_plugins = nil,
    update_notifications = true,
  },
}

---@type LazySpec[]
local spec = vim.g.vscode and {
  astro,
  { import = "common" },
  { import = "vsc" },
} or {
  astro,
  { import = "common" },
  { import = "native" },
  { import = "native/langs" },
  { import = "native/plugins" },
  { import = "native/ui" },
}

---@type LazyConfig
local config = {
  install = { colorscheme = { "astrodark" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
}

require("lazy").setup(spec, config)
