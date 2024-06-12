-- Single click file tree navigation
require("neo-tree").setup({
  window = {
    mappings = {
      ["<LeftRelease>"] = "toggle_node",
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
  },
})
