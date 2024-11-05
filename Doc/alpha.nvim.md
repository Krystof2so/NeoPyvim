# alpha.nvim

Page [GitHub](https://github.com/goolord/alpha-nvim)

*greeter screen* (écran d'accueil, avec menu d'actions) rapide et entièrement programmable.

Exemples de [thèmes personnalisés](https://github.com/goolord/alpha-nvim/blob/main/doc/alpha.txt)

## Commandes

- `:Alpha` : pour lancer **alpha.nvim**  (*buffer* séparé)

## Configuration

### Configuration minimale pour un premier démarrage

Dans `~/.config/nvim/lua/plugins/alpha.lua` :

```lua
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- ***************** 
-- * Configuration *
-- *****************

-- Configuration de base avec un en-tête
dashboard.section.header.val = { -- Définit l’en-tête en ASCII art
    [[                                                                       ]],
    [[  ██████   █████                   █████   █████  ███                  ]],
    [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
    [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
    [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
    [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
    [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
    [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
    [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
    [[                                                                       ]],
    [[                                                                       ]],
}

-- Configuration de la disposition :
dashboard.section.buttons.val = { -- Configure des boutons de menu 
    dashboard.button("***", "🔍  Find File"),
    dashboard.button("***", "📄  New File"),
    dashboard.button("***", "📂  Recent Files"),
    dashboard.button("***", "❌  Quit"),
}


-- **************************************
-- * Initialisation de la configuration *
-- **************************************

alpha.setup(dashboard.opts)  -- Applique le thème 'dashboard' avec la configuration définie ci-dessus.
```
 
