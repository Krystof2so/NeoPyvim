-- *******************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/mason_lspconfig.lua *
-- *******************************************************************

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = { "pyright", "lua_ls" }, -- Liste des serveurs à installer automatiquement
    automatic_installation = true, -- Installe automatiquement les serveurs spécifiés
})

