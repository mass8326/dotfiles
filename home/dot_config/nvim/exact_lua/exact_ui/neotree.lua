return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = true,
    },
    filesystem = {
      follow_current_file = { enabled = false },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = { "node_modules" },
        never_show = { ".git" },
      },
      window = {
        mappings = {
          ["<Right>"] = "open",
          ["<Left>"] = "close_node",
        },
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        local root = require("astrocore.rooter").detect(nil, false)[1]
        if root ~= nil and root.paths[1] ~= nil then
          vim.api.nvim_set_current_dir(root.paths[1])
        end
        require("neo-tree.command").execute({ action = "show", reveal = true })
      end,
      desc = "Reveal current file in explorer (root)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ action = "show", reveal = true })
      end,
      desc = "Reveal current file in explorer (cwd)",
    },
    {
      "<leader>o",
      function()
        local root = require("astrocore.rooter").detect(nil, false)[1]
        if root ~= nil and root.paths[1] ~= nil then
          vim.api.nvim_set_current_dir(root.paths[1])
        end
        require("neo-tree.command").execute({ action = "show", toggle = true })
      end,
      desc = "Toggle explorer (root)",
    },
    {
      "<leader>O",
      function()
        require("neo-tree.command").execute({ action = "show", toggle = true })
      end,
      desc = "Toggle explorer (cwd)",
    },
  },
}
