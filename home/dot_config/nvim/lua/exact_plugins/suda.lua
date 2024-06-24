return {
  {
    "lambdalisue/suda.vim",
    event = "CmdlineEnter",
    config = function()
      vim.cmd.cnoreabbrev({ "w!!", "SudaWrite" })
    end,
  },
}
