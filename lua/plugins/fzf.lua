local M = {}

function M.init(use)
  return use {
    'junegunn/fzf.vim',
    requires = 'junegunn/fzf',
    config = function()
    end
  }
end

return M
