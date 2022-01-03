local M = {}

function M.init(use)
  use {
    'simrat39/rust-tools.nvim',
    -- you need to do this empty setup to avoid errors in initialization
    -- if you call `vim src/main.rs`
    config = function()
      require "rust-tools".setup({})
    end
  }
end

return M
