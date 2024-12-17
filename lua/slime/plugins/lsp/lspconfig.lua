local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  kym.set("n", "sF", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  kym.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  kym.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  kym.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  kym.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  kym.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  kym.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  kym.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["cpp"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["c"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["python"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["rust"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})