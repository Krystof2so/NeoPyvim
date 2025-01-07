-- *************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/autopairs.lua *
-- * Le *plugin* **nvim-autopairs** est conçu pour ajouter     *
-- * automatiquement des paires de caractères, comme les       *
-- * parenthèses `()`, les crochets `[]`, les accolades `{}`,  *
-- * ou les guillemets `""` et `''`.                           *
-- *************************************************************

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

