local M = {}

function M.init(use)
  return use {
    'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require('fzf-lua').setup({
        winopts = {
          height = 0.8,
        },
        files = {
          prompt = 'Files❯ ', -- example, not required
        },
        fzf_opts = {
          ['--layout'] = 'reverse-list',
        },
      })
    end
  }
end

return M
