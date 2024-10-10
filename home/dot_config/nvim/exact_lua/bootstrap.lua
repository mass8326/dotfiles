---@type LazySpec[]
local spec = {
  {
    ---@module "AstroNvim/AstroNvim"
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
  },
  { import = "common" },
}

local swap = vim.g.vscode and {
  { import = "vsc" },
} or {
  { import = "native" },
  { import = "native/langs" },
  { import = "native/plugins" },
  { import = "native/ui" },
}

for _, val in ipairs(swap) do
  table.insert(spec, val)
end

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
