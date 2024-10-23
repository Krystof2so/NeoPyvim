-- ********************************************************
-- * nvim-tree : ~/.config/nvim/lua/plugins/nvim-tree.lua *
-- *                                                      *
-- * Explorateur de fichiers                              *
-- ********************************************************

local config_nvim_tree = require("plugins.spec_config.config_nvim_tree")


nv_tree = require("nvim-tree")

nv_tree.setup({
    hijack_cursor = true,  -- Maintient le curseur sur la première lettre du nom du fichier

    sort = { -- tri des dossiers et fichiers pour l'affichage
        sorter = "extension",  -- Tri par les estensions
        folders_first = true, -- Répertoires en premier
    },

    view = {
        number = true,             -- Active l'affichage des numéros de ligne
        relativenumber = true,     -- Utiliser des numéros relatifs
        signcolumn = "no",         -- Pas d'affichage des signes
        width = { -- Dimensions en largeur de 'nvim-tree' (affichage dynamique)
            min = 25,                  -- Largeur minimale de 30 colonnes
            max = -1,                  -- Pas de largeur maximale
            padding = 1,               -- Remplissage à droite de 1
        },
    },

})

