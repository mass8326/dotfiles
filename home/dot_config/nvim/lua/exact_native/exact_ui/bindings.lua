---@type LazySpec
return {
  { "mrjones2014/smart-splits.nvim", enabled = false },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          -- Movement
          ["<C-d>"] = { "<C-d>zz", desc = "Scroll Down" },
          ["<C-u>"] = { "<C-u>zz", desc = "Scroll Up" },
          -- Buffer Nav
          ["<S-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Move buffer left" },
          ["<S-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Move buffer right" },
          ["]b"] = { function() require("astrocore.buffer").move(-vim.v.count1) end, desc = "Move buffer left" },
          ["[b"] = { function() require("astrocore.buffer").move(vim.v.count1) end, desc = "Move buffer right" },
          -- Splits Nav
          ["<C-Left>"] = { "<C-w>h", desc = "Move to left split" },
          ["<C-Down>"] = { "<C-w>j", desc = "Move to below split" },
          ["<C-Up>"] = { "<C-w>k", desc = "Move to above split" },
          ["<C-Right>"] = { "<C-w>l", desc = "Move to right split" },
        },
      },
    },
  },
}
