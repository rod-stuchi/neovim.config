local M = {}
local Z = {}

function M.init(use)
  use {
    'rcarriga/nvim-notify',
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'notify')
  if not ok then
    return;
  end

  vim.notify = lib;

  vim.notify.setup({
    -- Animation style (see below for details)
    stages = "fade_in_slide_out",

    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    -- Function called when a window is closed
    on_close = nil,

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 2000,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
    -- background_colour = "Normal",
    background_colour = "#1e2127",

    -- Minimum width for notification windows
    minimum_width = 50,

    -- Icons for the different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })
end

return M
