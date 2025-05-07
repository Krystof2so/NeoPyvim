-- ***************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/lspconfig.lua   *
-- ***************************************************************

local lspconfig = require("lspconfig")

-- Configuration des serveurs LSP
local servers = { 'pyright', 'lua_ls', 'texlab' }

--mason_lspconfig.setup({
  --ensure_installed = servers, -- Pour que les serveurs LSP spécifiés dans la table soiennt installés par Mason.
--})

for _, server in ipairs(servers) do
  lspconfig[server].setup({})  -- Configure chaque serveur LSP avec les options par défaut
end

