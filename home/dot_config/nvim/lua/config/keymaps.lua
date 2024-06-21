-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })

local wk = require("which-key")
wk.register({
  t = {
    name = "telescope",
    n = { "<cmd>Telescope notify<cr>", "Show notifications" },
  },
}, { prefix = "<leader>" })

-- Tab to confirm completion
local cmp = require("cmp")
local config = cmp.get_config()
config.mapping["<Tab>"] = { i = cmp.mapping.confirm({ select = true }) }
cmp.setup(config)