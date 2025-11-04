---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        -- Movement
        ["<C-d>"] = { "<C-d>zz", desc = "Scroll Down" },
        ["<C-u>"] = { "<C-u>zz", desc = "Scroll Up" },
        -- Buffer Nav
        ["<S-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Prev buffer" },
        ["<S-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["]b"] = { function() require("astrocore.buffer").move(-vim.v.count1) end, desc = "Move buffer left" },
        ["[b"] = { function() require("astrocore.buffer").move(vim.v.count1) end, desc = "Move buffer right" },
        -- Splits Nav
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
}
