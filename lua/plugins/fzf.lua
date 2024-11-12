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
            hidden = hidden,  -- Fichiers cachés
        },
    },
}) 
