-- Chargement et configuration de Mason
require("mason").setup()

-- Configuration de Mason LSPconfig pour s'assurer que les serveurs sont installés
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "jdtls", "gopls" }
})

-- Fonction pour attacher les keymaps à chaque serveur
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- Keymaps LSP
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Configuration de chaque serveur LSP
local lspconfig = require("lspconfig")

-- Configuration pour lua_ls
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Configuration pour rust_analyzer
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
})

-- Configuration pour tsserver (TypeScript)
lspconfig.tsserver.setup({
    on_attach = on_attach,
})

-- Configuration pour jdtls (Java)
lspconfig.jdtls.setup({
    on_attach = on_attach,
})

-- Configuration pour gopls (Go)
lspconfig.gopls.setup({
    on_attach = on_attach,
})
