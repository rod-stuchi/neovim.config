local M = {}
local Z = {}

function M.init(use)
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'bufferline')
  if not ok then
    return;
  end

  lib.setup({
    highlights = {
      buffer_selected             = { bold = true, italic = false },
      diagnostic_selected         = { bold = true, italic = false },
      info_selected               = { bold = true, italic = false },
      info_diagnostic_visible     = { bold = true, italic = false },
      info_diagnostic_selected    = { bold = true, italic = false },
      warning_selected            = { bold = true, italic = false },
      warning_diagnostic_selected = { bold = true, italic = false },
      error_selected              = { bold = true, italic = false },
      error_diagnostic_selected   = { bold = true, italic = false },
      duplicate_selected          = { italic = true },
      duplicate_visible           = { italic = true },
      duplicate                   = { italic = true },
      pick_selected               = { bold = true, italic = false },
      pick_visible                = { bold = true, italic = false },
      pick                        = { bold = true, italic = false }
    },
    options = {
      diagnostics = "nvim_lsp",
      -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
      diagnostics_indicator = function(_, _, diagnostics_dict, context)
        if context.buffer:current() then
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
              or (e == "warning" and " " or "ℹ " )
            s = s .. n .. sym
          end
          return s
        end
        return " "
      end,
      -- custom_filter = function(buf_number)
      --   if #vim.api.nvim_list_bufs() > 2 then
      --     return true
      --   end
      -- end,
      show_close_icon = false,
      show_buffer_close_icons = false,
      right_mouse_command = '',
      middle_mouse_command = 'bdelete! %d',
      indicator = {
        icon = '▎',
        style = 'icon',
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
        }
      },
      -- numbers = function(opts)
      --   return string.format('%s|%s', opts.id, opts.lower(opts.ordinal))
      -- end,
      numbers = function(opts)
        return string.format('%s', opts.lower(opts.ordinal))
      end,
      -- numbers = 'none',
    },
  })
end

return M
