return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = " 󰉓 File " },
          { source = "buffers", display_name = " 󰈚 Bufs " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
      },
      filesystem = {
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
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    },
  },
}
