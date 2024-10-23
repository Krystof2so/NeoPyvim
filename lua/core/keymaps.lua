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


-- **************************
-- * Mappage pour Lazy.nvim *
-- * Groupe de mappage 'z'  *
-- **************************
local z_mappings = {
    {'zz', ':Lazy<CR>'},       -- Ouvrir Lazy
    {'zs', ':Lazy sync<CR>'},  -- Synchroniser
    {'zu', ':Lazy update<CR>'} -- Mettre à jour
}

-- Boucle pour appliquer les mappages Z
for _, mapping in ipairs(z_mappings) do
    map('n', mapping[1], mapping[2]) -- mode normal, raccourci clavier, commande 
end

