local M = {}

function M.init(use)
  return use {
    'phaazon/hop.nvim',
    branch = 'v1.2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'asdfghijkl;etovxqpybzcurn' }
    end
  }
end

return M
