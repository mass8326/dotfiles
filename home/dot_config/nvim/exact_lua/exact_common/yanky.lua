---@type LazySpec
return {
  -- Conflicts with my desired yanky keymaps
  {
    "stevearc/aerial.nvim",
    opts = {
      keymaps = {},
      on_attach = function()
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
      -- Standard behavior
      {
        "y",
        "<Plug>(YankyYank)",
        mode = { "n", "x" },
        desc = "Yank Text",
      },
      {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = { "n" },
        desc = "Put After",
      },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "n" },
        desc = "Put Before",
      },
      {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = { "n" },
        desc = "Put After And Shift Cursor",
      },
      {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = { "n" },
        desc = "Put Before And Shift Cursor",
      },
      -- Swap v_p and v_P with each other
      {
        "p",
        "<Plug>(YankyPutBefore)",
        mode = { "x" },
        desc = "Put Over Without Replacing Register",
      },
      {
        "P",
        "<Plug>(YankyPutAfter)",
        mode = { "x" },
        desc = "Put Over With Replacing Register",
      },
      {
        "gp",
        "<Plug>(YankyGPutBefore)",
        mode = { "x" },
        desc = "Put Over Without Replacing Register And Shift Cursor",
      },
      {
        "gP",
        "<Plug>(YankyGPutAfter)",
        mode = { "x" },
        desc = "Put Over With Replacing Register And Shift Cursor",
      },
      -- Extended behavior
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" },
    },
  },
}
