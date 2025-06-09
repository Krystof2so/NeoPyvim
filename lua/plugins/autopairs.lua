-- *************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/autopairs.lua *
-- * Le *plugin* **nvim-autopairs** est conçu pour ajouter     *
-- * automatiquement des paires de caractères, comme les       *
-- * parenthèses `()`, les crochets `[]`, les accolades `{}`,  *
-- * ou les guillemets `""` et `''`.                           *
-- *************************************************************

---@diagnostic disable: undefined-global
-- Charge les modules nécessaires
local autopairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

autopairs.setup({  -- Configuration principale de nvim-autopairs
    check_ts = true, -- Active l'intégration avec Treesitter
    ts_config = {  -- Désactivation pour certaines parties du code
        lua = { "string", "source" },      -- Les chaînes de caractères pour le langage Lua
        python = { "string", "comment" },  -- Les chaînes de caractères et commentaires pour le langage Python
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },  -- Désactive pour certains types de fichiers
    fast_wrap = {  -- Raccourci clavier pour entourer une sélection avec une paire (ici, Alt + E)
    map = "<M-p>",
    -- Liste des caractères qui peuvent être utilisés pour entourer une sélection :
    chars = { "{", "[", "(", '"', "'" },
    -- Expression régulière qui définit quel type de caractères peut être utilisé pour la sélection
    -- Ici, tous les caractères de fermeture comme ), ], }, mais aussi la virgule.
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    -- Décalage du curseur après la fermeture de la paire, ici 0 signifie que le curseur restera à la même position
    offset = 0,
    -- La touche qui doit être utilisée pour terminer la paire (ici le curseur se positionne sur le $)
    end_key = "$",
    -- Liste des touches à utiliser pour effectuer le wrapping (toutes les touches de "qwerty" et autres lettres)
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    -- Si true, vérifie s'il y a une virgule avant de faire un wrapping (utile dans les listes par exemple)
    check_comma = true,
    -- Couleur de surlignage de la sélection (ici "Search" correspond à une couleur pré-définie)
    highlight = "Search",
    -- Couleur de surlignage gris pour les éléments qui ne sont pas dans la sélection active 
    -- (ici "Comment" pour un style commenté)
    highlight_grey = "Comment",
    },
})

-- Configuration pour l'intégration avec nvim-cmp
cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done({
        filetypes = {
            -- Règles pour tous les types de fichiers
            ["*"] = {  -- Tous les fichiers
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,  -- Pour les fonctions
                        cmp.lsp.CompletionItemKind.Method,    -- Pour les méthodes
                    },
                    handler = require("nvim-autopairs.completion.handlers")["*"],
                },
            },
            -- Règles spécifiques pour Lua
            lua = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method,
                    },
                    handler = function(char, item, bufnr, rules, commit_character)
                        -- Exemple : Affiche des informations sur l'élément sélectionné
                        print(vim.inspect({ char, item, bufnr, rules, commit_character }))
                    end,
                },
            },
            -- Règles spécifiques pour Python
            python = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method,
                    },
                    handler = require("nvim-autopairs.completion.handlers")["*"],
                },
            },
        },
    })
)

