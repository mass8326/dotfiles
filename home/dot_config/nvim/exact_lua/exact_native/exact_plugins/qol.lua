---@type LazySpec
return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      timeout = 500,
      mappings = {
        i = {
          [","] = {
            h = "<Esc>",
          },
        },
      },
    },
  },
}
