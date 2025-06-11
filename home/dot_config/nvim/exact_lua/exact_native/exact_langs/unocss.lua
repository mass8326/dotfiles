return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    vim.list_extend(opts.servers, {
      "unocss",
    })
  end,
}
