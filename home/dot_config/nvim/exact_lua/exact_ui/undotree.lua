---@type LazySpec
return {
  "mbbill/undotree",
  cmd = {
    "UndotreeFocus",
    "UndotreeHide",
    "UndotreePersistUndo",
    "UndotreeShow",
    "UndotreeToggle",
  },
  dependencies = {
    { "nvim-neo-tree/neo-tree.nvim" },
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>o"] = {
              function()
                require("neo-tree.command").execute({ action = "close", reveal = true })
                vim.cmd("UndotreeShow")
              end,
              desc = "Show undotree",
            },
            ["<Leader>O"] = {
              function()
                vim.cmd("UndotreeHide")
              end,
              desc = "Show undotree",
            },
          },
        },
      },
    },
  },
}
