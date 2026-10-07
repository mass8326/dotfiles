return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      json5 = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
      xml = { "xmllint" },
    },
  },
}
