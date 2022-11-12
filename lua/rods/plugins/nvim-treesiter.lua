local M = {}
local Z = {}

function M.init(use)
  use {
    'nvim-treesitter/nvim-treesitter',
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
