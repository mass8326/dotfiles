---@module "astrocore"

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
    },
    mappings = {
      n = {
        -- Movement
        ["<C-d>"] = { "<C-d>zz", desc = "Scroll Down" },
        ["<C-u>"] = { "<C-u>zz", desc = "Scroll Up" },
        -- Buffer nav
        ["<S-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Prev buffer" },
        ["<S-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["]b"] = { function() require("astrocore.buffer").move(-vim.v.count1) end, desc = "Move buffer left" },
        ["[b"] = { function() require("astrocore.buffer").move(vim.v.count1) end, desc = "Move buffer right" },
      },
    },
  },
}
