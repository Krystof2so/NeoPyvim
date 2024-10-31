-- *************************************************
-- * ~/.config/nvim/lua/core/keymaps.lua           *
-- *                                               *
-- * Gestion des raccourcis clavier personnalisés. *
-- *************************************************

vim.g.mapleader = ' ' -- Définir la touche leader sur Espace


-- ************************************************************************
-- * Fonction pour définir des mappages avec noremap et silent par défaut *
-- ************************************************************************
local function map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end


-- *******************************************
-- * Groupe de mappage pour le mode 'normal' *
-- *******************************************
local normal_mapping = {
    -- Mapping pour bufferline :
    { '<Tab>', ':BufferLineCycleNext<CR>', 'Buffer suivant' },
    { '<S-Tab>', ':BufferLineCyclePrev<CR>', 'Buffer précédent' },
    { '<leader>bd', ':bd<CR>', "Fermer l'onglet actif" }, 
    -- Mapping pour Lazy.vim :
    {'zz', ':Lazy<CR>'},       -- Ouvrir Lazy
    {'zs', ':Lazy sync<CR>'},  -- Synchroniser
    {'zu', ':Lazy update<CR>'} -- Mettre à jour
}

-- Boucle pour appliquer les mappages :
for _, mapping in ipairs(normal_mapping) do
    map('n', mapping[1], mapping[2], { desc = mapping[3] }) -- mode normal, raccourci clavier, commande, description 
end


