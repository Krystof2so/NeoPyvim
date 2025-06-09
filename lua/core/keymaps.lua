-- *************************************************
-- * ~/.config/nvim/lua/core/keymaps.lua           *
-- *                                               *
-- * Gestion des raccourcis clavier personnalisés. *
-- *************************************************

---@diagnostic disable: undefined-global
vim.g.mapleader = ' ' -- Définir la touche leader sur Espace

local fzf_functions = require("plugins.spec_functions.fzf_functions")


-- ************************************************************************
-- * Fonction pour définir des mappages avec noremap et silent par défaut *
-- ************************************************************************
local function map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end


-- ************************************************************************************
-- * Fonction personnalisée pour fermer les buffers, fermer nvim-tree et ouvrir Alpha *
-- ************************************************************************************
local function save_and_close_buffers_open_alpha()
    -- Parcourir tous les buffers ouverts
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) then
            -- Enregistrement du buffer si modifié
            if vim.api.nvim_buf_get_option(bufnr, 'modified') then
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd('write')
                end)
            end
            -- Fermer le buffer
            vim.api.nvim_buf_delete(bufnr, {force = true})
        end
    end
    -- Fermer nvim-tree si ouvert
    if package.loaded['nvim-tree'] then
        require('nvim-tree.api').tree.close()
    end
    -- Ouvrir Alpha-nvim
    if package.loaded['alpha'] then
        require('alpha').start()
    end
end


-- *******************************************
-- * Groupe de mappage pour le mode 'normal' *
-- *******************************************
local normal_mapping = {
    -- Pour lancer Alpha avec enregistrement et fermeture des buffers et de l'explorateur 'nvim-tree' 
    { '<leader>a', save_and_close_buffers_open_alpha },
    -- Mapping pour bufferline :
    { '<Tab>', ':BufferLineCycleNext<CR>', 'Buffer suivant' },
    { '<S-Tab>', ':BufferLineCyclePrev<CR>', 'Buffer précédent' },
    { '<leader>bd', ':bd<CR>', "Fermer l'onglet actif" }, 
    -- Mappind pour fzf-lua :
    { 'ff', ':FzfLua files<CR>', "Rechercher un fichier" },
    { 'fd', fzf_functions.search_in_directory, "Rechercher dans un répertoire spécifié" },
    { 'fg', ':FzfLua live_grep<CR>', 'Rechercher un motif dans un fichier du projet' },
    { 'fh', ':FzfLua helptags<CR>', 'Aide avec recherche sur tags' },
    { 'fx', ':FzfLua builtin<CR>', 'Recherche fzf' },
    -- Mapping pour Lazy.vim :
    {'zz', ':Lazy<CR>'},        -- Ouvrir Lazy
    {'zs', ':Lazy sync<CR>'},   -- Synchroniser
    {'zu', ':Lazy update<CR>'}, -- Mettre à jour
}

-- Boucle pour appliquer les mappages :
for _, mapping in ipairs(normal_mapping) do
    map('n', mapping[1], mapping[2], { desc = mapping[3] }) -- mode normal, raccourci clavier, commande, description 
end


