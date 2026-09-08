return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = true,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = { "node_modules" },
        never_show = { ".git", ".pnpm" },
        never_show_by_pattern = {
          "**/node_modules/**/node_modules",
        },
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
        vim.cmd("UndotreeHide")
        local bufno = vim.api.nvim_get_current_buf()
        local root = require("astrocore.rooter").detect(bufno, false)[1]
        if root ~= nil and root.paths[1] ~= nil then
          vim.api.nvim_set_current_dir(root.paths[1])
        end
        require("neo-tree.command").execute({ action = "show", toggle = true })
      end,
      desc = "Toggle file explorer",
    },
  },
}
