-- vim: fdm=marker:foldlevel=1:
-- vim.api.nvim_commnad("command! TSRehighlight :write | edit | TSBufEnable hightlight")

local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap
-- P(keymap)


--{{{ customs :: command
keymap('c', '%%', [[getcmdtype() == ':' ? expand('%:h').'/' : '%%' ]], { noremap = true, expr = true })
-- TODO
vim.cmd[[ command W :execute ':silent w !sudo tee % > /dev/null' | :edit! ]]
vim.cmd[[ command! Gqf GitGutterQuickFix | copen ]]
--}}}

--{{{ customs :: normal
keymap('n', 'Q', '<nop>', { noremap = true })

keymap('n', '<Up>', '<C-w><up>', { noremap = false })
keymap('o', '<Up>', '<C-w><up>', { noremap = false })
keymap('n', '<Down>', '<C-w><down>', { noremap = false })
keymap('o', '<Down>', '<C-w><down>', { noremap = false })
keymap('n', '<Left>', '<C-w><left>', { noremap = false })
keymap('o', '<Left>', '<C-w><left>', { noremap = false })
keymap('n', '<Right>', '<C-w><right>', { noremap = false })
keymap('o', '<Right>', '<C-w><right>', { noremap = false })

keymap('n', ';', ':', { noremap = true })
keymap('n', ':', ';', { noremap = true })
keymap('n', '<BS>', '<Cmd>noh<CR>', { noremap = true })
keymap('n', '<C-t>', '<Cmd>lua require("rods/funcs").toggle_transparency()<CR>', { noremap= true })
keymap('n', '<M-o>', '<Cmd>copen<CR>', opts)
keymap('n', '<M-O>', '<Cmd>cclose<CR>', opts)
keymap('n', '<M-[>', '<Cmd>cprevious<CR>', opts)
keymap('n', '<M-]>', '<Cmd>cnext<CR>', opts)
keymap('n', '<M-q>', '<Cmd>set cursorcolumn!<Bar>set cursorline!<CR>', { noremap = true})
keymap('n', '<M-w>', '<Cmd>set number!<Bar>set relativenumber!<CR>', { noremap = true})
keymap('n', '<M-e>', '<Cmd>set list!<CR>', { noremap = true})

-- Math operations in lines, resolves line expression, and SUM, AVG all lines with description on left:
-- abc = 12 ^12
-- cde = 3 * 4 + 2
-- keyboard <F3> key switch with problem (need to be replaced)
keymap('n', '<F4>', '<Cmd>w !/home/rods/.scripts/sum.sh<CR>', opts)

-- insert current date in yyyy-mm-dd format
keymap('n', '<F6>', 'i<C-R>=strftime("%Y-%m-%d")<CR><Esc>l', { noremap = true })

-- insert current date in pt_BR format
-- dd/mmm (ddd), like 15/mar (qui)
keymap('n', '<F7>', ':lang pt_BR.UTF-8<CR>:let @@=strftime("%d/%b (%a)")<CR>:normal! p<esc>o<esc>:lang en_US.UTF-8<CR>', opts)

keymap('n', '<C-w>o', ':mksession! /tmp/vim-session.vim<CR>:wincmd o<CR>', opts)
keymap('n', '<C-w>u', ':source /tmp/vim-session.vim<CR>', opts)


-- moving lines
keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true })
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true })
--}}}

--{{{ customs :: visual
keymap('v', ';', ':', { noremap = true })
keymap('v', ':', ';', { noremap = true })
--}}}

--{{{ customs :: insert
-- inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
keymap('i', '<F6>', '<C-R>=strftime("%Y-%m-%d")<CR>', { noremap = true })
--}}}

--{{{ leader
-- cd directory current path
vim.cmd [[
" cd directory current path
nnoremap <leader>cd :cd %:p:h<CR> :echom "CD to [" . expand("%:p:h") . "]"<CR>

" yank in clipboard file name
" nnoremap <silent> <Leader>yn :let @*=expand("%")<CR> :echom "copied: [" . expand("%") . "] use middle click"<CR>
" yank in clipboard file path
" nnoremap <silent> <Leader>yp :let @*=expand("%:p")<CR> :echom "copied: [" . expand("%:p") . "] use middle click"<CR>

" copy filename clipboard
nnoremap <silent> <Leader>cn :let @+=expand("%")<CR> :echom "copied: [" . expand("%") . "] use ctrl+v"<CR>
" copy file path to clipboard
nnoremap <silent> <Leader>cp :let @+=expand("%:p")<CR> :echom "copied: [" . expand("%:p") . "] use ctrl+v"<CR>

]]
--}}}



--{{{ vim-mark
keymap('n', '<Leader>M', '<Plug>MarkToggle', { noremap = false })
keymap('n', '<Leader>N', '<Plug>MarkConfirmAllClear', { noremap = false })
keymap('n', '<Leader>+*', '<Plug>MarkSearchUsedGroupNext', { noremap = false })
keymap('n', '<Leader>-*', '<Plug>MarkSearchUsedGroupPrev', { noremap = false })
keymap('x', '<Leader>*', '<Plug>MarkIWhiteSet', { noremap = false })
--}}}

--{{{ nvim-tree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap= true })
keymap('n', '<C-M-r>', ':NvimTreeRefresh<CR>', { noremap= true })
keymap('n', '<C-M-n>', ':NvimTreeFindFileToggle<CR>', { noremap= true })
-- " NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
--}}}

--{{{ bufferline
keymap('n', '<space><space>', ':BufferLinePick<CR>', opts)
keymap('n', 'gx', ':BufferLinePickClose<CR>', opts)
keymap('n', '<A-,>', '<Cmd>BufferLineMovePrev<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferLineMoveNext<CR>', opts)

keymap('n', '<Leader>.1', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
keymap('n', '<Leader>.2', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
keymap('n', '<Leader>.3', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
keymap('n', '<Leader>.4', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
keymap('n', '<Leader>.5', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
keymap('n', '<Leader>.6', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
keymap('n', '<Leader>.7', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
keymap('n', '<Leader>.8', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
keymap('n', '<Leader>.9', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
--}}}

--{{{ harpoon
keymap('n', '<Leader>a', '<Cmd>lua require("harpoon.mark").add_file()<CR>', opts)
keymap('n', '<Leader>s', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

keymap('n', '<Leader>0', '<Cmd>lua require("harpoon.ui").nav_file(0)<CR>', opts)
keymap('n', '<Leader>1', '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap('n', '<Leader>2', '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap('n', '<Leader>3', '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap('n', '<Leader>4', '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)
keymap('n', '<Leader>5', '<Cmd>lua require("harpoon.ui").nav_file(5)<CR>', opts)
keymap('n', '<Leader>6', '<Cmd>lua require("harpoon.ui").nav_file(6)<CR>', opts)
keymap('n', '<Leader>7', '<Cmd>lua require("harpoon.ui").nav_file(7)<CR>', opts)
keymap('n', '<Leader>8', '<Cmd>lua require("harpoon.ui").nav_file(8)<CR>', opts)
keymap('n', '<Leader>9', '<Cmd>lua require("harpoon.ui").nav_file(9)<CR>', opts)
--}}}

--{{{ hop
keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
keymap('n', '<space>f', "<Cmd>HopChar1<CR>", {})
keymap('o', '<space>f', "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
keymap('o', '<space>t', "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
keymap('o', '<space>F', "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
keymap('o', '<space>T', "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
keymap('v', '<space>f', "<Cmd>HopChar1<CR>", {})
keymap('n', '<space>df', "<Cmd>HopChar2<CR>", {})
keymap('n', '<space>w', "<Cmd>HopWord<CR>", {})
keymap('n', '<space>fw', "<Cmd>HopWordAC<CR>", {})
keymap('n', '<space>Fw', "<Cmd>HopWordBC<CR>", {})
keymap('n', '<space>/', "<Cmd>HopPattern<CR>", {})
--}}}

--{{{ fzf
-- keymap('n', '<Leader>f', '<Cmd>FzfLua files<CR>', { noremap = true })
-- keymap('n', '<Leader>b', '<Cmd>FzfLua buffers<CR>', { noremap = true })
-- keymap('n', '<Leader>g', '<Cmd>FzfLua git_files<CR>', { noremap = true })
keymap('n', '<Leader>b', '<Cmd>Buffers<CR>', { noremap = true })
keymap('n', '<Leader>f', '<Cmd>Files<CR>', { noremap = true })
keymap('n', '<Leader>g', '<Cmd>GFiles<CR>', { noremap = true })
vim.cmd [[
  nnoremap <silent> <Leader>rg :Rg \b<C-R><C-W>\b<CR>
  autocmd VimEnter * nnoremap <silent> <Leader>d :Files <C-R>=expand('%:h')<CR><CR>
]]
--}}}

--{{{ EasyAlign
-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap('x', 'ga', '<Plug>(EasyAlign)', {})
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap('n', 'ga', '<Plug>(EasyAlign)', {})
--}}
