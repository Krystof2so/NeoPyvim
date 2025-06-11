-- ***************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/lspconfig.lua   *
-- ***************************************************************

---@diagnostic disable: undefined-global

local lspconfig = require("lspconfig")

-- Configuration des serveurs LSP
local servers = { 'pyright', 'lua_ls', 'texlab', 'ruff' }

--mason_lspconfig.setup({
  --ensure_installed = servers, -- Pour que les serveurs LSP spécifiés dans la table soiennt installés par Mason.
--})

for _, server in ipairs(servers) do
    if server == 'ruff_lsp' then
        lspconfig.ruff_lsp.setup({
            on_attach = function(client, bufnr)
                -- Configuration de l'attachement du client LSP
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local opts = { noremap = true, silent = true }

                -- Keymaps pour Ruff
                buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            end,
            settings = {
                -- Configuration spécifique à Ruff
            },
        })
    else
        lspconfig[server].setup({})  -- Configure chaque serveur LSP avec les options par défaut
    end
end

