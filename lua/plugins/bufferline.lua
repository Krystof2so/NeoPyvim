-- **********************************************************
-- * bufferline : ~/.config/nvim/lua/plugins/bufferline.lua *
-- *                                                        *
-- * Gestionnaire de buffers sous forme d'onglets           *
-- **********************************************************

local M = {}

function M.setup()
    require("bufferline").setup({
-- *******************************
-- * Configuration de bufferline *
-- *******************************
        options = {
            themable = true,
            mode = "buffers",                      -- Permet de gérer plusieurs 'buffers'
            numbers = "none",                      -- Pas de numérotation des 'buffers'
            modified_icon = '🖉 ',                  -- Symbolise un fichier modifié et non enregistré
            buffer_close_icon = "",                -- pas d'icône de fermeture de 'buffer' (masqué)
            right_trunc_marker = '»',              -- Pour défiler à droite sur la 'bufferline'
            left_trunc_marker = '«',               -- Idem à gauche
            separator_style = "slant",             -- Utilise des slants
            tab_size = 20,                         -- longueur des onglets
            diagnostics = "nvim_lsp",              -- Affichage des diagnostics "nvim_lsp" si activés par ailleurs
            diagnostics_update_on_event = true,    -- Mise à jour des diagnostics en fonction de l'activité de Neovim
            indicator = { style = 'none', },       -- Supprime l'indicateur de buffer actif
            offsets = {
                {  -- offset pour nvim.tree
                    filetype = "NvimTree",
                    text = "📂 Explorateur",
                    text_align = "center",
                    separator = false,
                },
            },
            close_command = false,  -- Désactive la commande de fermeture par clic à l'emplacement de l'icône de fermeture
        },
    })
end

return M
