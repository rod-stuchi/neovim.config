local M = {}
local Z = {}

function M.init(use)
  use {
    'ggandor/lightspeed.nvim'
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'lightspeed')
  if not ok then
    return;
  end

  lib.setup({
    ignore_case = false,
    exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },

    -- s/x
    jump_to_unique_chars = { safety_timeout = 400 },
    match_only_the_start_of_same_char_seqs = true,
    substitute_chars = { ['\r'] = '¬' },
    special_keys = {
      next_match_group = '<space>',
      prev_match_group = '<tab>',
    },

    -- f/t
    limit_ft_matches = 5,
    repeat_ft_with_target_char = true,
  })
end

return M
