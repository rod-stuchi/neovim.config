local M = {}
local Z = {}

function M.init(use)
  use {
    'code-biscuits/nvim-biscuits'
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'nvim-biscuits')
  if not ok then
    return;
  end

  lib.setup({
    cursor_line_only = true,
    toggle_keybind = "<leader>cb",
    show_on_start = true,

    default_config = {
      max_length = 30,
      min_distance = 10,
      prefix_string = " 📎 "
    },

    language_config = {
      html = {
        prefix_string = " 🌐 "
      },
      javascript = {
        prefix_string = " ✨ ",
        max_length = 80
      },
      python = {
        disabled = true
      }
    }
  })
end

return M
