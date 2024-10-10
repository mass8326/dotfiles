local MAX_WIDTHS = {
  abbr = 24,
  menu = 36,
}

---@type LazySpec
return {
  ---@module "cmp"
  "hrsh7th/nvim-cmp",
  opts = {
    formatting = {
      ---@param item vim.CompletedItem
      format = function(_, item)
        for key, max_width in pairs(MAX_WIDTHS) do
          if item[key] ~= nil and string.len(item[key]) > max_width then
            item[key] = vim.fn.strcharpart(item[key], 0, max_width) .. "…"
          end
        end
        return item
      end,
    },
  },
}
