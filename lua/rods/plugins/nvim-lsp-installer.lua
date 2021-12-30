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
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

function Z.setup()
  diagnostic_signs()

  local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
  if not ok then
    return;
  end

  lsp_installer.on_server_ready(function(server)


    local opts = {
      on_attach = function(client, bufnr)
        if client.name == "tsserver" then
          client.resolved_capabilities.document_formatting = false
        end
        lsp_keymaps(bufnr)
        -- lsp_highlight_document(client)
      end
    }
    -- vim.notify("nvim-lsp-installer::config::on_server_ready", "info")

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

    -- LUA
    if server.name == "sumneko_lua" then
      opts = vim.tbl_deep_extend("force", {
        settings = {
          Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            diagnostics = {globals = {'vim'}},
            workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
            telemetry = {enable = false}
          }
        }
      }, opts)
    end


    -- RUST
    if server.name == "rust_analyzer" then
      -- Initialize the LSP via rust-tools instead
      local ok_rust_tools, rust_tools = pcall(require, 'rust_tools')
      if ok_rust_tools then
        rust_tools.setup {
          -- TODO check `fu_nction` name and try `%`
          -- The "server" property provided in rust-tools setup fu_nction are the
          -- settings rust-tools will provide to lspconfig during init.
          -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
          -- with the user's own settings (opts).
          server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
        }
        server:attach_buffers()
      end
    end

    server:setup(opts)
  end)
end

return M
