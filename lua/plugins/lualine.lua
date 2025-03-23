-- ****************************************************
-- * lualine : ~/.config/nvim/lua/plugins/lualine.lua *
-- *                                                  *
-- * Barre d'état                                     *
-- ****************************************************

local lualine = require("lualine")


-- ***********************************
-- * Fonction pour récupérer l'heure *
-- ***********************************
local function get_time()
    return os.date('%H:%M')  -- Format de l'heure : heures:minutes
end


-- ****************************
-- * Configuration de lualine *
-- ****************************
lualine.setup({

    options = { -- Aspects visuels de la barre d'état
        theme = 'nord',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = { -- Composants de la barre d'état
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'filename',  -- Nom du fichier
                path = 0,  -- Affiche uniquement le nom du fichier
                shorting_target = 30,  -- limite l'affichage du chemin à 30 caractères  
                symbols = {
                    modified = "●",   -- Pour indiquer un fichier modifié
                    readonly = "🔒",  -- Pour indiquer que le fichier est seulement en lecture
                },
            },
        },
        lualine_x = {
            'encoding', 'filesize',
            {'filetype', icon_only = true} -- Affichage uniquement de l'icône
        },
        lualine_y = {'selectioncount', 'progress', 'location'},
        lualine_z = { -- Utilisation de la fonction locale pour afficher l'heure dans lualine_z + icône horloge
            { get_time, icon = ' ' },
        },
    },

})

