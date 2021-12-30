local M = {}

local fn = vim.fn

function M.setup()
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  end
end

function M.init()
  return {
    opt_default = false,
    display = {
      non_interactive = false,
      -- open_fn  = nil,
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
      open_cmd = '65vnew \\[packer\\]',
      working_sym = '⟳',
      error_sym = '✗',
      done_sym = '✓',
      removed_sym = '-',
      moved_sym = '→',
      header_sym = '━',
      show_all_info = true,
      prompt_border = 'double',
      keybindings = {
        quit = 'q',
        toggle_info = '<CR>',
        diff = 'd',
        prompt_revert = 'r',
      }
    }
  }
end

return M
