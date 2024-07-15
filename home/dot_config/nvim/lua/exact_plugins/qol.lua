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
    }
  },
  -- Conflicts with my desired yanky keymaps
  {
    "stevearc/aerial.nvim",
    opts = {
      keymaps = {},
      on_attach = function(bufnr)
        return false
      end,
    },
  },
  {
    "gbprod/yanky.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      highlight = { timer = 150 },
    },
    keys = {
      {
        "y",
        "<Plug>(YankyYank)",
        mode = { "n", "x" },
        desc = "Yank Text",
      },
      {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = { "n", "x" },
        desc = "Put Yanked Text After Cursor",
      },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "n", "x" },
        desc = "Put Yanked Text Before Cursor",
      },
      {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = { "n", "x" },
        desc = "Put Yanked Text After Selection",
      },
      {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = { "n", "x" },
        desc = "Put Yanked Text Before Selection",
      },
      { "[y", "<Plug>(YankyCycleForward)",              desc = "Cycle Forward Through Yank History" },
      { "]y", "<Plug>(YankyCycleBackward)",             desc = "Cycle Backward Through Yank History" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put Indented After Cursor (Linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put Indented Before Cursor (Linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put Indented After Cursor (Linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put Indented Before Cursor (Linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Put and Indent Right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Put and Indent Left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Put Before and Indent Left" },
      { "=p", "<Plug>(YankyPutAfterFilter)",            desc = "Put After Applying a Filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)",           desc = "Put Before Applying a Filter" },
    },
  },
}
