if not vim.g.vscode then
  return {}
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    local maps = assert(opts.mappings)

    -- Navigation
    maps.n["<Leader>bc"] = function()
      require("vscode-neovim").action("workbench.action.closeOtherEditors")
    end
  end,
}
