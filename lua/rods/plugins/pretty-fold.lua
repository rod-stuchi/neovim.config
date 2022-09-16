local M = {}
local Z = {}

function M.init(use)
  use {
    'anuvyklack/pretty-fold.nvim'
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'pretty-fold')
  if not ok then
    return;
  end

  lib.setup({
    sections = {
      left = {
         'content',
      },
      right = {
         ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
         function(config) return config.fill_char:rep(3) end
      }
    },
    matchup_patterns = {
      { '^%s*do$', 'end' }, -- `do ... end` blocks
      { '^%s*if', 'end' },
      { '^%s*for', 'end' },
      { 'function%s*%(', 'end' }, -- 'function(' or 'function ('
      {  '{', '}' },
      { '%(', ')' }, -- % to escape lua pattern char
      { '%[', ']' }, -- % to escape lua pattern char
   },
  })
end

return M
