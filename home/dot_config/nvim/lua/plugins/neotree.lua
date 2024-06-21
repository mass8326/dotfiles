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
        window = {
          mappings = {
            ["<LeftRelease>"] = "toggle_node",
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
