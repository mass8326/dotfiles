vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.mdoc" },
  command = "set filetype=markdown",
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = { "gitcommit", "markdown", "txt" },
  command = "setlocal spell",
})

---@type LazySpec
return {}
