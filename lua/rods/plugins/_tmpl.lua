local M = {}
local Z = {}

function M.init(use)
  use {
    'user/plugin'
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'plugin.namespace')
  if not ok then
    return;
  end

  lib.setup()
end

return M
