local M = {}

function M.init(use)
  return use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        local fg_color = "#ffffff"
        local bg_color = "#0f2f62"
        local fg_pick = "#ffffff"
        local bg_pick = "#6f0000"
        require('bufferline').setup({
          highlights = {
            buffer_selected = {
              guifg = fg_color,
              guibg = bg_color,
              gui = "bold"
            },
            duplicate_selected = {
              guifg = fg_color,
              guibg = bg_color,
              gui = "italic"
            },
            duplicate_visible = {
              guifg = fg_color,
              guibg = bg_color,
              gui = "italic"
            },
            pick_selected = {
              guifg = fg_pick,
              guibg = bg_pick,
              gui = "bold"
            },
            pick_visible = {
              guifg = fg_pick,
              guibg = bg_pick,
              gui = "bold"
            },
            pick = {
              guifg = fg_pick,
              guibg = bg_pick,
              gui = "bold"
            }
          },
          options = {
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
            numbers = function(opts)
              return string.format('%s', opts.id)
            end,
          },
        })
    end
  }
end

return M
