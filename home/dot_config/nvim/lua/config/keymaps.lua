-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })

vim.keymap.set("n", ";", ":", { desc = "Open Cmdline" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Quick Leave Insert Mode" })

vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Smart split move" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Smart split move" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Smart split move" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Smart split move" })
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Smart split resize" })
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Smart split resize" })
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Smart split resize" })
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Smart split resize" })
