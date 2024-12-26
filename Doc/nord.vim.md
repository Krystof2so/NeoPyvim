# Nord.Vim

**Nord.nvim** est un jeu de couleurs moderne écrit en **Lua** pour **NeoVim**. **Nord.Vim** est également supporté par divers *plugins*.

## Installation avec *lazy*

```shell
    { -- Thème nord
        "shaunsingh/nord.nvim", lazy = false, priority = 1000,
        config = function()
            -- Chargez et configurez le thème Nord
            vim.cmd("colorscheme nord")
            -- ou
            --require("plugins/nord
        end,
    },

```

## Configuration

Voir la fichier `nord.lua`


