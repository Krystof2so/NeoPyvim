-- *********************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/mason.lua *
-- *********************************************************


local mason = require("mason")

mason.setup({
    max_concurrent_installers = 6, -- Autorise jusqu'à 6 installations en parallèle
    ui = { -- Paramètres liés à l'interface
        border = "rounded",  -- Type de bordure
        width = 0.6,         -- Taille largeur
        height = 0.6,        -- Taille hauteur
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
})

