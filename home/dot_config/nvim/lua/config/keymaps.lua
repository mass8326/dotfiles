-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })

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

-- map("n", "<Leader>lA", function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local diagnostics = vim.diagnostic.get(bufnr)
--   local end_line = vim.api.nvim_buf_line_count(bufnr)
--   local end_col = #vim.api.nvim_buf_get_lines(bufnr, end_line - 1, end_line, false)[1] - 1
--   local end_val = { end_line, end_col }
--   print(vim.inspect(end_val))
--   vim.lsp.buf.code_action({
--     context = { diagnostics = diagnostics, only = { "quickfix" } },
--     range = { ["start"] = { 1, 0 }, ["end"] = end_val },
--   })
-- end, { desc = "LSP code action (entire buffer)" })
-- map(
--   "n",
--   "<Leader>lv",
--   '<cmd>lua print(vim.inspect(vim.api.nvim_buf_get_mark(0, "<")), vim.inspect(vim.api.nvim_buf_get_mark(0, ">")))<cr>',
--   {desc = "Failed attempt to figure out why the above binding does not work"}
-- )
