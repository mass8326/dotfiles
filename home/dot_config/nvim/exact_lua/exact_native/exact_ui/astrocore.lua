---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = true,
    },
    rooter = {
      detector = { ".git", { "lua", "MakeFile", "package.json" } },
      autochdir = false,
      notify = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
      g = {
      },
    },
    mappings = {
      n = {
        -- Movement
        ["<C-d>"] = { "<C-d>zz", desc = "Scroll Down" },
        ["<C-u>"] = { "<C-u>zz", desc = "Scroll Up" },
        -- Smart splits
        ["<C-Left>"] = { require("smart-splits").move_cursor_left, desc = "Smart split move left" },
        ["<C-Down>"] = { require("smart-splits").move_cursor_down, desc = "Smart split move down" },
        ["<C-Up>"] = { require("smart-splits").move_cursor_up, desc = "Smart split move up" },
        ["<C-Right>"] = { require("smart-splits").move_cursor_right, desc = "Smart split move right" },
        ["<A-Left>"] = { require("smart-splits").resize_left, desc = "Smart split resize left" },
        ["<A-Down>"] = { require("smart-splits").resize_down, desc = "Smart split resize down" },
        ["<A-Up>"] = { require("smart-splits").resize_up, desc = "Smart split resize up" },
        ["<A-Right>"] = { require("smart-splits").resize_right, desc = "Smart split resize right" },
        -- Buffer nav
        ["<S-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Prev buffer" },
        ["<S-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["]b"] = { function() require("astrocore.buffer").move(-vim.v.count1) end, desc = "Move buffer left" },
        ["[b"] = { function() require("astrocore.buffer").move(vim.v.count1) end, desc = "Move buffer right" },
      },
    },
  },
}
