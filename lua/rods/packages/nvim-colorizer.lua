local M = {}

function M.init(use)
  return use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }
end

return M
