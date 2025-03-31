-- *******************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/mason_lspconfig.lua *
-- *******************************************************************

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    -- liste des serveurs à installer automatiquement :
    ensure_installed = { "pyright", "lua_ls" },
    automatic_installation = true, -- Installe automatiquement les serveurs spécifiés
})

