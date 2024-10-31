---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local maps = assert(opts.mappings)

      -- Navigation
      maps.n["<Leader>q"] = function()
        require("vscode-neovim").action("workbench.action.closeEditorsInGroup")
      end
      maps.n["<Leader>bc"] = function()
        require("vscode-neovim").action("workbench.action.closeOtherEditors")
      end
      maps.n["<Leader>ss"] = function()
        require("vscode-neovim").action("workbench.action.replaceInFiles")
      end
      maps.n["[e"] = function()
        require("vscode-neovim").action("editor.action.marker.prev")
      end
      maps.n["]e"] = function()
        require("vscode-neovim").action("editor.action.marker.next")
      end
    end,
  },
}
