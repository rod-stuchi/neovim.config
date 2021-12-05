local M = {}

local fn = vim.fn

function M.setup()
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  end
end

function M.init()
  return {
    opt_default = false, -- Default to using opt (as opposed to start) plugins
    display = {
      non_interactive = false, -- If true, disable display windows for all operations
      -- TODO map `%`: check bug with the work `function` in the next line
      open_fn  = nil, -- An optional function to open a window for packer's display
      working_sym = '🛠', -- The symbol for a plugin being installed/updated
      error_sym = '🧨', -- The symbol for a plugin with an error in installation/updating
      done_sym = '🎉', -- The symbol for a plugin which has completed installation/updating
      removed_sym = '🔥', -- The symbol for an unused plugin which was removed
      moved_sym = '🚀', -- The symbol for a plugin which was moved (e.g. from opt to start)
      header_sym = '━', -- The symbol for the header line in packer's display
      show_all_info = true, -- Should packer show all update details automatically?
      prompt_border = 'double', -- Border style of prompt popups.
      keybindings = { -- Keybindings for the display window
        quit = 'q',
        toggle_info = '<CR>',
        diff = 'd',
        prompt_revert = 'r',
      }
    }
  }
end

return M
