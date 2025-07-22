vim.treesitter.query.add_directive("inject-go-tmpl!", function(_, _, bufnr, _, metadata)
  local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
  local _, _, ext, _ = string.find(fname, ".*%.(%a+)(%.%a+)")
  metadata["injection.language"] = ext
end, {})

vim.filetype.add({ extension = { tmpl = "gotmpl" } })

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  optional = true,
  opts = function(_, opts)
    if opts.ensure_installed ~= "all" then
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "gotmpl" })
    end
  end,
}
