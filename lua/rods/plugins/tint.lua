local M = {} local Z = {}

function M.init(use)
  use {
    'levouh/tint.nvim'
  }
  return Z;
end

function Z.setup()
  -- local ok, lib = pcall(require, 'tint')
  -- if not ok then
  --   return;
  -- end

  -- lib.setup({
  --   bg = false,
  --   amt = -50,
  -- })
end

return M
