-- *************
-- * 
-- ***********

local fzf = require("fzf-lua")

-- Enregistre fzf-lua comme interface par défaut pour vim.ui.select
require('fzf-lua').register_ui_select()

fzf.setup({'fzf-native',  -- Choix du profil 'fzf-native'
    winopts = {
        backdrop = 20,  -- Transparence
        preview = {  -- Configuration de la visualisation
            default = 'bat',
        },
    },
    previewers = {
        bat = {
            cmd = "batcat",
            args = "--color=always --style=numbers,changes",
            theme = 'Nord',  -- définit le thème "Nord" pour bat
        },
        builtin = {
            syntax = true,                   -- active le surlignage syntaxique
            syntax_limit_l  = 500,           -- limite de 500 lignes
            syntax_limit_b  = 1024 * 1024,   -- limite de 1 Mo
            limit_b = 2 * 1024 * 1024        -- limite de taille totale du fichier (2 Mo)
        },
        -- Définition des extensions avec leurs commandes de prévisualisation :
        extensions = {
            ["png"] = { "viu", "-b" },         -- Utilise `viu` pour les PNG en mode bloc (-b)
            ["svg"] = { "chafa", "{file}" },   -- Utilise `chafa` pour les SVG
        },
    },
    files = {
        path_shorten = 6,  -- Nbre de caractères max dans le nom de chaque répertoire d'un chemin
    },

}) 
