-- *************************************************
-- * ~/.config/nvim/lua/core/keymaps.lua           *
-- *                                               *
-- * Gestion des raccourcis clavier personnalisés. *
-- *************************************************

---@diagnostic disable: undefined-global
vim.g.mapleader = ' ' -- Définir la touche leader sur Espace

local fzf_functions = require("plugins.spec_functions.fzf_functions")
local nord = require("plugins.nord")

-- ************************************************************************
-- * Fonction pour définir des mappages avec noremap et silent par défaut *
-- ************************************************************************
local function map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end


-- *******************************************
-- * Fonction pour basculer entre les thèmes *
-- *******************************************
local function toggle_theme()
    local current_theme = vim.g.colors_name
    if current_theme == "nord" then
        vim.cmd('colorscheme catppuccin')
    else
        nord.set()
    end
end


-- *******************************************
-- * Groupe de mappage pour le mode 'normal' *
-- *******************************************
local normal_mapping = {
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
    -- Pour basculer entre les thèmes :
    {'mt', toggle_theme, 'Basculer entre les thèmes Nord et Nord-Light'}
}

-- Boucle pour appliquer les mappages :
for _, mapping in ipairs(normal_mapping) do
    map('n', mapping[1], mapping[2], { desc = mapping[3] }) -- mode normal, raccourci clavier, commande, description 
end


