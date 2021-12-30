local M = {}
local Z = {}

local function local_setup()
  local g = vim.g
  g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
  g.nvim_tree_indent_markers = 0 -- 0 by default, this option shows indent markers when folders are open
  g.nvim_tree_git_hl = 0 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
  g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
  g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
  g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
  g.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
  g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
  g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
  g.nvim_tree_symlink_arrow = ' >> ' -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
  g.nvim_tree_respect_buf_cwd = 1 -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
  g.nvim_tree_create_in_closed_folder = 0 -- 1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
  g.nvim_tree_refresh_wait = 500 -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
  g.nvim_tree_window_picker_exclude = {
    filetype = { 'notify', 'packer', 'qf' },
    buftype = { 'terminal' }
  }
  -- Dictionary of buffer option names mapped to a list of option values that indicates to the window picker that the buffer's window should not be selectable.
  g.nvim_tree_special_files = {
    ['README.md'] = 1,
    Makefile = 1,
    MAKEFILE = 1,
  }
  -- -- List of filenames that gets highlighted with NvimTreeSpecialFile
  -- g.nvim_tree_show_icons = {
  --   git = 1,
  --   folders = 1,
  --   files = 1,
  --   folder_arrows = 1,
  -- }
  -- g.nvim_tree_icons = {
  --   default = '',
  --   symlink = '',
  --   git = {
  --     unstaged = "✗",
  --     staged = "✓",
  --     unmerged = "",
  --     renamed = "➜",
  --     untracked = "★",
  --     deleted = "",
  --     ignored = "◌"
  --   },
  --   folder = {
  --     arrow_open = "",
  --     arrow_closed = "",
  --     default = "",
  --     open = "",
  --     empty = "",
  --     empty_open = "",
  --     symlink = "",
  --     symlink_open = "",
  --   }
  -- }

  -- nnoremap <C-n> :NvimTreeToggle<CR>
  -- nnoremap <leader>r :NvimTreeRefresh<CR>
  -- nnoremap <leader>n :NvimTreeFindFile<CR>
  -- " NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
  -- highlight NvimTreeFolderIcon guibg=blue
end

function M.init(use)
  use {
    'kyazdani42/nvim-tree.lua',
    -- cmd = { 'NvimTreeToggle' },
    requires = 'kyazdani42/nvim-web-devicons',
    setup = local_setup()
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'nvim-tree')
  if not ok then
    return;
  end

  lib.setup({
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = true,
      icons = {
        -- Error = " ", Warn = " ", Hint = " ", Info = " ",
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {'.git', '.gitignore', 'node_modules'}
    },
    git = {
      enable = false,
      ignore = false,
      timeout = 500,
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      auto_resize = true,
      mappings = {
        custom_only = false,
        list = {}
      },
      number = false,
      relativenumber = false
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    }
  })
end

return M
