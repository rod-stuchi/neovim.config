local M = {}

function M.init(use)
  return use {
    'junegunn/fzf.vim',
    requires = 'junegunn/fzf',
    config = function()
      -- global fzf
      vim.cmd [[
        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        " [Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
        let g:fzf_preview_window = ['right:55%', 'ctrl-/']
      ]]

      -- change for Files
      vim.cmd [[
        command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>,
            \ fzf#vim#with_preview({'options': [
            \   '--bind=tab:toggle+up,shift-tab:toggle+down',
            \ ]})
          \, <bang>0)
      ]]

      -- quickfix list
      vim.cmd [[
        function! s:build_quickfix_list(lines)
          call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
          copen
          cc
        endfunction

        let g:fzf_action = {
          \ 'ctrl-q': function('s:build_quickfix_list'),
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit' }

        let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
      ]]

      -- Maps for commands and path completion
      vim.cmd [[
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
        inoremap <expr> <c-x><c-k> fzf#vim#complete(fzf#wrap({
          \ 'prefix': '^.*$',
          \ 'source': 'rg -n ^ --color always',
          \ 'options': '--ansi --delimiter : --nth 3..',
          \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
      ]]

      -- Custom RG function
      vim.cmd [[
        function! RipgrepFzf(query, fullscreen)
          let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
          let initial_command = printf(command_fmt, shellescape(a:query))
          let reload_command = printf(command_fmt, '{q}')
          let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
          call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
        endfunction

        command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
      ]]
    end
  }
end

return M
