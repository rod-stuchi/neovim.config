local M = {}

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]

function M.setCustomHighLights()
  -- Line Column Colors
  vim.cmd [[ highlight LineNrAbove guibg=#1e2127 guifg=#414855 ]]
  vim.cmd [[ highlight LineNr guifg=#93a2bf ]]
  vim.cmd [[ highlight LineNrBelow guibg=#1e2127 guifg=#414855 ]]
  -- git
  vim.cmd [[ highlight SignColumn  guibg=#1e2127 ]]
  vim.cmd [[ highlight GitSignsAdd  guibg=#1e2127 ]]
  vim.cmd [[ highlight GitSignsChange  guibg=#1e2127 ]]
  vim.cmd [[ highlight GitSignsDelete  guibg=#1e2127 ]]
  -- lsp
  vim.cmd [[ highlight DiagnosticInfo guibg=#1e2127 ]]
  vim.cmd [[ highlight DiagnosticError guibg=#1e2127 ]]
  vim.cmd [[ highlight DiagnosticWarn guibg=#1e2127 ]]
  vim.cmd [[ highlight DiagnosticHint guibg=#1e2127 ]]


-- vim.cmd([[au VimEnter * highlight Folded guifg=#465a7d]])
-- vim.cmd([[au ColorScheme * highlight Folded guifg=#465a7d]])

-- vim.cmd([[au VimEnter * highlight IncSearch guifg=#ab7f54 guibg=#00000000 ]])
-- vim.cmd([[au ColorScheme * highlight IncSearch guifg=#ab7f54 guibg=#00000000 ]])

end

function M.toggle_transparency()
  local theme = vim.g.colors_name
  local hasBackground = vim.api.nvim_get_hl_by_name("Normal", true)['background']
  require(theme).setup({
    unpack(require(theme).config),
    transparent = (hasBackground ~= nil),
    dimInactive = (hasBackground == nil),
  })

  vim.cmd("colorscheme " .. theme)
  M.setCustomHighLights()
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

-- ref:
-- https://dev.to/voyeg3r/my-ever-growing-neovim-init-lua-h0p
-- https://dev.to/voyeg3r/writing-useful-lua-functions-to-my-neovim-14ki
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
