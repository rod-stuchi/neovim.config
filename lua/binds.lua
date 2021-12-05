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
keymap('n', ';', ':', { noremap = true })
keymap('n', ':', ';', { noremap = true })
keymap('n', '<C-t>', ':lua require("funcs").toggle_transparency()<CR>', { noremap= true })
keymap('n', '<M-[>', ':cprevious<CR>', opts)
keymap('n', '<M-]>', ':cnext<CR>', opts)

-- moving lines
keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true })
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true })

keymap('n', 'ga', '<Plug>(EasyAlign)', {})
keymap('n', 'gai', '<Plug>(EasyAlignAlign)', {})
--}}}

--{{{ customs :: visual
keymap('v', ';', ':', { noremap = true })
keymap('v', ':', ';', { noremap = true })
keymap('x', 'ga', '<Plug>(EasyAlign)', {})
keymap('x', 'gai', '<Plug>(EasyAlignAlign)', {})
--}}}

--{{{ customs :: insert
-- inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
keymap('i', '<F6>', '<C-R>=strftime("%Y-%m-%d")<CR>', { noremap = true })
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
keymap('n', '<C-M-n>', ':NvimTreeFindFile<CR>', { noremap= true })
-- " NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
--}}}

--{{{ bufferline
keymap('n', '<Leader><space>', ':BufferLinePick<CR>', opts)
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
keymap('n', '<Leader>f', "<Cmd>HopChar1<CR>", {})
keymap('n', '<Leader>df', "<Cmd>HopChar2<CR>", {})
keymap('n', '<Leader>w', "<Cmd>HopWord<CR>", {})
keymap('n', '<Leader>fw', "<Cmd>HopWordAC<CR>", {})
keymap('n', '<Leader>Fw', "<Cmd>HopWordBC<CR>", {})
--}}}

vim.cmd [[
let g:fzf_buffers_jump = 1
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
]]

