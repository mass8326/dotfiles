---@module "astrolsp"
---@module "neominimap.config.meta"

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.fuzzy-finder.fzf-lua" },
  { import = "astrocommunity.lsp.nvim-lint" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.split-and-window.neominimap-nvim" },
  {
    "Isrothy/neominimap.nvim",
    optional = true,
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>m"] = { "<Cmd>Neominimap Toggle<CR>", desc = "Toggle minimap" },
            },
          },
        },
      },
    },
    ---@type Neominimap.UserConfig
    opts = {
      auto_enable = false,
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          gd = {
            function()
              require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
            end,
            desc = "Go to symbol definition",
          },
          grr = {
            function()
              require("fzf-lua").lsp_references()
            end,
            desc = "Go to symbol references",
          },
        },
      },
    },
  },
}
