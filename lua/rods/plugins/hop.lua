local M = {}
local Z = {}

function M.init(use)
  use {
    'phaazon/hop.nvim',
    branch = 'v1.2', -- optional but strongly recommended
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'hop')
  if not ok then
    return;
  end

  lib.setup({ keys = 'asdfghijkl;etovxqpybzcurn' })
end

return M

-- hop keybindings
--{{{ hop
 -- keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
 -- keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
 -- keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
 -- keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
 -- keymap('n', '<space>f', "<Cmd>HopChar1<CR>", {})
 -- keymap('o', '<space>f', "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
 -- keymap('o', '<space>t', "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
 -- keymap('o', '<space>F', "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
 -- keymap('o', '<space>T', "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
 -- keymap('v', '<space>f', "<Cmd>HopChar1<CR>", {})
 -- keymap('n', '<space>df', "<Cmd>HopChar2<CR>", {})
 -- keymap('n', '<space>w', "<Cmd>HopWord<CR>", {})
 -- keymap('n', '<space>fw', "<Cmd>HopWordAC<CR>", {})
 -- keymap('n', '<space>Fw', "<Cmd>HopWordBC<CR>", {})
 -- keymap('n', '<space>/', "<Cmd>HopPattern<CR>", {})
--}}}
