local M = {}
local Z = {}

function M.init(use)
  use {
    'ibhagwan/fzf-lua',
    cmd = { 'FzfLua' },
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons'
    },
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'fzf-lua')
  if not ok then
    return;
  end

  lib.setup({
    winopts = {
      height = 0.8,
    },
    files = {
      prompt = 'Files❯ ',
    },
    fzf_opts = {
      ['--layout'] = 'reverse-list',
    },
  })
end

return M
