---@type LazySpec
return {
  "Isrothy/neominimap.nvim",
  version = "^3",
  lazy = false,
  init = function()
    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = true,
    }
  end,
}
