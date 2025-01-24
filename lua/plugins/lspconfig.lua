-- ***************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/lspconfig.lua   *
-- ***************************************************************

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require "cmp_nvim_lsp".default_capabilities(capabilities)

-- Gestionnaires automatiques pour chaque serveur détecté
mason_lspconfig.setup_handlers({
    -- Gestionnaire par défaut pour les serveurs LSP
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
    end,

    -- Configuration spécifique pour certains serveurs LSP
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } }, -- Évite les erreurs sur les variables globales "vim"
                    workspace = { checkThirdParty = false },
                },
            },
        })
    end,

--    ["pyright"] = function()
  --      lspconfig.pyright.setup({
    --        capabilities = capabilities,
      --      settings = {
        --        python = {
          --          analysis = {
            --            typeCheckingMode = "strict", -- Vérification stricte des types
              --      },
                --},
           -- },
        --})
   -- end,
})

