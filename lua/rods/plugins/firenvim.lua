local M = {}
local Z = {}

function M.init(use)
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'firenvim')
  if not ok then
    return;
  end

  vim.cmd[[
    function! OnUIEnter(event) abort
      if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
        set laststatus=0
        set spell spelllang=en_us,pt
        " set lines=15
        " set columns=300
        autocmd BufRead,BufNewFile * start
      endif
    endfunction
    autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
  ]]

  --lib.setup()
end

return M
