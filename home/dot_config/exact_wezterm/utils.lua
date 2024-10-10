local wezterm = require("wezterm")

local utils = {}

function utils.deep_merge(mod, ...)
  for _, tbl in ipairs({ ... }) do
    for k, v in pairs(tbl) do
      mod[k] = v
    end
  end
  return mod
end

function utils.append(mod, ...)
  for _, tbl in ipairs({ ... }) do
    table.insert(mod, tbl)
  end
  return mod
end

function utils.is_windows()
  return wezterm.target_triple:find("windows") ~= nil
end

function utils.is_linux()
  return wezterm.target_triple:find("linux") ~= nil
end

function utils.basename(str)
  return string.gsub(str, "(.*[/\\])(.*)", "%2")
end

return utils
