---@module "astrocore"

---@type LazySpec
return {
  "mrjones2014/smart-splits.nvim",
  version = ">=1.0.0",
  lazy = false,
  specs = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<C-Left>"] = { require("smart-splits").move_cursor_left, desc = "Smart split move left" },
          ["<C-Down>"] = { require("smart-splits").move_cursor_down, desc = "Smart split move down" },
          ["<C-Up>"] = { require("smart-splits").move_cursor_up, desc = "Smart split move up" },
          ["<C-Right>"] = { require("smart-splits").move_cursor_right, desc = "Smart split move right" },
          ["<A-Left>"] = { require("smart-splits").resize_left, desc = "Smart split resize left" },
          ["<A-Down>"] = { require("smart-splits").resize_down, desc = "Smart split resize down" },
          ["<A-Up>"] = { require("smart-splits").resize_up, desc = "Smart split resize up" },
          ["<A-Right>"] = { require("smart-splits").resize_right, desc = "Smart split resize right" },
        },
      },
    },
  },
}
