local M = {}

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

function M.toggle_transparency()
  require('onedark').setup({transparent = not vim.g.onedark_config.transparent})
  require('onedark').load()

  if not vim.g.onedark_transparent_background then
    vim.cmd [[ highlight LineNrAbove guibg=#1e2127 guifg=#414855 ]]
    vim.cmd [[ highlight LineNr guifg=#93a2bf ]]
    vim.cmd [[ highlight LineNrBelow guibg=#1e2127 guifg=#414855 ]]
  else
    vim.cmd [[ highlight LineNrAbove guifg=#6c6c6c ]]
    vim.cmd [[ highlight LineNr guifg=#c3c3c3 ]]
    vim.cmd [[ highlight LineNrBelow guifg=#6c6c6c ]]
  end
end

function _G.preserve(cmd)
  cmd = string.format('keepjumps keeppatterns execute %q', cmd)
  local original_cursor = vim.fn.winsaveview()
  vim.api.nvim_command(cmd)
  vim.fn.winrestview(original_cursor)
end

vim.cmd([[command! RodRemoveTrailingSapces lua preserve('%s/\\s\\+$//ge')]])
vim.cmd([[command! RodRemoveHardSpaces lua preserve('%s/\\%xa0/ /g')]])

vim.cmd([[
  let home=expand('~')
  exec 'source' home . '/.config/nvim/lua/rods/vim-funcs/remove_diacritics.vim'
  exec 'source' home . '/.config/nvim/lua/rods/vim-funcs/fold_comments.vim'
  exec 'source' home . '/.config/nvim/lua/rods/vim-funcs/center_cursor.vim'
]])

M.preserve = function(arguments)
    local args = string.format("keepjumps keeppatterns execute %q", arguments)
    -- local original_cursor = vim.fn.winsaveview()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_command(args)
    local lastline = vim.fn.line("$")
    -- vim.fn.winrestview(original_cursor)
    if line > lastline then
        line = lastline
    end
    vim.api.nvim_win_set_cursor({ 0 }, { line, col })
end

_G.rod_squeeze_blank_lines = function()
    -- references: https://vi.stackexchange.com/posts/26304/revisions
    if (vim.bo.filetype ~= 'binary') or (vim.bo.filetype ~= 'diff') then
        local old_query = vim.fn.getreg('/')    -- save search register
        M.preserve('sil! 1,.s/^\\n\\{2,}/\\r/gn') -- set current search count number
        local result = vim.fn.searchcount({maxcount = 1000, timeout = 500}).current
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        M.preserve('sil! keepp keepj %s/^\\n\\{2,}/\\r/ge')
        M.preserve('sil! keepp keepj %s/\\v($\\n\\s*)+%$/\\r/e')
        if result > 0 then
            vim.api.nvim_win_set_cursor({0}, {(line - result), col})
        end
        vim.fn.setreg('/', old_query)           -- restore search register
    end
end

return M
