return {
  "xvzc/chezmoi.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>fz",
      function()
        require("fzf-lua").fzf_exec(require("chezmoi.commands").list(), {
          actions = {
            ["default"] = function(selected)
              require("chezmoi.commands").edit({
                targets = { "~/" .. selected[1] },
                args = { "--watch" },
              })
            end,
          },
        })
      end,
      desc = "Find In Chezmoi",
    },
  },
}
