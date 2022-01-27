local M = {}
local Z = {}

function M.init(use)
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'yioneko/nvim-yati' -- TODO temporary plugin
    },
    run = '<Cmd>TSUpdate',
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    return;
  end

  lib.setup({
    autotag = { enable = true },
    yati = { enable = true },

    context_commentstring = {
      enable = true
    },
    ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "elixir",
      "erlang",
      "go",
      "graphql",
      "http",
      "javascript",
      "json",
      "latex",
      "lua",
      "python",
      "regex",
      "rst",
      "ruby",
      "rust",
      "scss",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      -- https://www.reddit.com/r/neovim/comments/s4ki71/strange_indentation_quirk_when_writing_loops_in/
      -- disable = {'python'}
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        scope_incremental = '<TAB>',
        node_incremental = '<CR>',
        node_decremental = '<S-TAB>',
      }
    },
  })
end

return M
