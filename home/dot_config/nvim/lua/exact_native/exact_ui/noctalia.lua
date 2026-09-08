return {
  "RRethy/base16-nvim",
  config = function()
    local success, matugen = pcall(require, "matugen")
    if success then
      matugen.setup()
    end
  end,
}
