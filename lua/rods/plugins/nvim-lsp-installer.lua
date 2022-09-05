local M = {}
local Z = {}

function M.init(use)
  use {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig',
  }
  return Z;
end

local function diagnostic_signs()
  -- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local bkeymap = vim.api.nvim_buf_set_keymap

  bkeymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  bkeymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bkeymap(bufnr, 'n', 'gvd', '<cmd>vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bkeymap(bufnr, 'n', 'gsd', '<cmd>sp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bkeymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  bkeymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  bkeymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  bkeymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  bkeymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  bkeymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  bkeymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  bkeymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bkeymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  bkeymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  bkeymap(bufnr, 'n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  bkeymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  bkeymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  bkeymap(bufnr, 'n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  bkeymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

function Z.setup()
  diagnostic_signs()

  local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
  if not ok then
    return;
  end

  local ok_navic, navic = pcall(require, 'nvim-navic')

  lsp_installer.on_server_ready(function(server)

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local opts = {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        if client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
        end
        lsp_keymaps(bufnr)
        if server.name ~= "cssmodules_ls" then
            if ok_navic then
              navic.attach(client, bufnr)
            end
        end
        -- lsp_highlight_document(client)
      end
    }

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

    if server.name == "sumneko_lua" then
      opts = require("rods/plugins/lsp-cfg/lua").config(opts)
    end

    if server.name == "rust_analyzer" then
      require("rods/plugins/lsp-cfg/rust").config(server, opts)
      return
    end

    server:setup(opts)


  end)
end

return M
