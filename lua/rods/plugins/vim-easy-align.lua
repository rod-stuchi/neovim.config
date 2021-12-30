local M = {}
local Z = {}

function M.init(use)
  use {
    'junegunn/vim-easy-align',
  }
  return Z;
end

function Z.setup()
  vim.g.easy_align_bypass_fold = 1
end

return M
