-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })

map("n", ";", ":", { desc = "Quick Open Command-line" })
map("i", ",h", "<Esc>", { desc = "Quick Leave Insert Mode" })

map("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<S-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<C-Left>", require("smart-splits").move_cursor_left, { desc = "Smart split move" })
map("n", "<C-Down>", require("smart-splits").move_cursor_down, { desc = "Smart split move" })
map("n", "<C-Up>", require("smart-splits").move_cursor_up, { desc = "Smart split move" })
map("n", "<C-Right>", require("smart-splits").move_cursor_right, { desc = "Smart split move" })
map("n", "<A-Left>", require("smart-splits").resize_left, { desc = "Smart split resize" })
map("n", "<A-Down>", require("smart-splits").resize_down, { desc = "Smart split resize" })
map("n", "<A-Up>", require("smart-splits").resize_up, { desc = "Smart split resize" })
map("n", "<A-Right>", require("smart-splits").resize_right, { desc = "Smart split resize" })
