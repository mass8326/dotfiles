---@type LazySpec
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
}

---@type LazySpecImport[]
local native = {
  { import = "community" },
  { import = "ui" },
  { import = "langs" },
  { import = "plugins" },
}

---@type LazySpecImport[]
local vscode = {
  { import = "code" },
}

if vim.g.vscode then
  for _, v in ipairs(vscode) do
    table.insert(spec, v)
  end
else
  for _, v in ipairs(native) do
    table.insert(spec, v)
  end
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
