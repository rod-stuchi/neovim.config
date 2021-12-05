local M = {}

function M.init(use)
  return use {
    'nvim-treesitter/nvim-treesitter',
    run = '<Cmd>TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
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
          enable = true
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
      }

      vim.cmd([[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
      ]])
    end
  }
end

return M

