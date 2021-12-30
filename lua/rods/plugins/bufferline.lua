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
      buffer_selected             = { gui = "bold", },
      diagnostic_selected         = { gui = "bold", },
      info_selected               = { gui = "bold", },
      info_diagnostic_visible     = { gui = "bold", },
      info_diagnostic_selected    = { gui = "bold", },
      warning_selected            = { gui = "bold", },
      warning_diagnostic_selected = { gui = "bold", },
      error_selected              = { gui = "bold", },
      error_diagnostic_selected   = { gui = "bold", },
      duplicate_selected          = { gui = "italic", },
      duplicate_visible           = { gui = "italic", },
      duplicate                   = { gui = "italic", },
      pick_selected               = { gui = "bold", },
      pick_visible                = { gui = "bold", },
      pick                        = { gui = "bold", }
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
      indicator_icon = '', -- '', '▎'
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
        }
      },
      -- numbers = function(opts)
      --   return string.format('%s|%s', opts.id, opts.lower(opts.ordinal))
      -- end,
      -- numbers = function(opts)
      --   return string.format('%s', opts.lower(opts.id))
      -- end,
      numbers = 'none',
    },
  })
end

return M
