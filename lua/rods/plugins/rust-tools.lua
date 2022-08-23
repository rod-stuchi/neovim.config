local M = {}

function M.init(use)
  use {
    'simrat39/rust-tools.nvim',
    config = function()
      require "rust-tools".setup({})
    end
  }
end

return M
