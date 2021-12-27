local M = {}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

function M.init(use)
  return use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'lualine'.setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          -- component_separators = { left = '', right = ''},
          component_separators = { left = '▎', right = '▎'},
          -- section_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {'mode'},
          -- lualine_b = {'branch', 'diff',
          lualine_b = { {'b:gitsigns_head', icon = ''}, {'diff', source = diff_source },
                        {'diagnostics', sources={'nvim_diagnostic', 'coc'}}},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
  }
end

return M
