---@type LazySpec
return {
  "lambdalisue/suda.vim",
  event = "CmdlineEnter",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>W"] = { "<Cmd>SudaWrite<CR>", desc = "Suda Write" },
          },
        },
      },
    },
  },
  config = function()
    vim.cmd.cnoreabbrev({ "w!!", "SudaWrite" })
  end,
}
