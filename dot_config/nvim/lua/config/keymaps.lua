-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Tab to confirm completion
local cmp = require("cmp")
local config = cmp.get_config()
config.mapping["<Tab>"] = { i = cmp.mapping.confirm({ select = true }) }
cmp.setup(config)

-- Single click file tree navigation
require("neo-tree").setup({
  window = {
    mappings = {
      ["<LeftRelease>"] = "open",
    },
  },
})
