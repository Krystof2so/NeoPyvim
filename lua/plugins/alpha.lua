---@diagnostic disable: undefined-global

local M = {}

function M.setup()
    local fzf_functions = require("plugins.spec_functions.fzf_functions")
    local project_functions = require("plugins.spec_functions.project_python_env")
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Fonction pour créer des boutons
    local function create_button(shortcut, label, command)
        return dashboard.button(shortcut, label, command)
    end

    -- Configuration des sections
    dashboard.section.header.val = {
        [[                                                                                              ]],
        [[  ██████   █████                   ███████████             █████   █████  ███                 ]],
        [[ ░░██████ ░░███                   ░░███░░░░░███           ░░███   ░░███  ░░░                  ]],
        [[  ░███░███ ░███   ██████   ██████  ░███    ░███ █████ ████ ░███    ░███  ████  █████████████  ]],
        [[  ░███░░███░███  ███░░███ ███░░███ ░██████████ ░░███ ░███  ░███    ░███ ░░███ ░░███░░███░░███ ]],
        [[  ░███ ░░██████ ░███████ ░███ ░███ ░███░░░░░░   ░███ ░███  ░░███   ███   ░███  ░███ ░███ ░███ ]],
        [[  ░███  ░░█████ ░███░░░  ░███ ░███ ░███         ░███ ░███   ░░░█████░    ░███  ░███ ░███ ░███ ]],
        [[  █████  ░░█████░░██████ ░░██████  █████        ░░███████     ░░███      █████ █████░███ █████]],
        [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░  ░░░░░          ░░░░░███      ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
        [[                                                 ███ ░███                                     ]],
        [[                                                ░░██████                                      ]],
        [[                                                 ░░░░░░                                       ]],
        [[                                                                                              ]],
    }

    dashboard.section.header.opts = {
        position = "center",
        hl = "MyAsciiHeader"  -- Appliquer la couleur définie
    }

    -- Section pour afficher la date et l'heure en français
    dashboard.section.datetime = {
        type = "text",
        val = function()
            -- Tableaux pour les jours et mois en français :
            local fr_days = { "Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi" }
            local fr_months = { "janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre" }
            -- Récupère le jour de la semaine et le mois et l'année actuels:
            local date = os.date("*t")
            local week_day = fr_days[date.wday]    -- Jour de la semaine
            local month = fr_months[date.month]    -- Mois de l'année
            -- Format final de la date en français :
            return string.format("📅  %s %d %s %d  🕒  %s", week_day, date.day, month, date.year, os.date("%H:%M"))
        end,
        opts = {
            position = "center",
            hl = "Constant"  -- Style de mise en valeur
        }
    }

    -- Configuration des boutons du menu
    dashboard.section.buttons.val = {
        create_button("f", "🔍  Rechercher fichier (répertoire courant)", ":FzfLua files<CR>"),
        create_button("d", "📂  Rechercher fichier dans un répertoire", function()
            fzf_functions.search_in_directory()
        end),
        create_button("r", "⌛  Fichiers récemment ouverts", ":FzfLua oldfiles<CR>"),
        create_button("x", "🔎  Lancer une recherche avec 'fzf'", ":FzfLua builtin<CR>"),
        create_button("e", "🗃️  Ouvre l'explorateur de fichiers", ":NvimTreeToggle<CR>"),
        create_button("c", "🐍  Créer un projet Python (avec 'venv')", function()
            require("pyflowenv").create_python_project()
        end),
        create_button("p", "💤  Ouvre le gestionnaire de plugins", ":Lazy<CR>"),
        create_button("h", "🆘  Aide (recherche avec tags)", ":FzfLua helptags<CR>"),
        create_button("q", "❌  Quitter", ":qa<CR>"),
    }

    -- Configuration des options
    dashboard.opts = {
        layout = {
            dashboard.section.header,
            { type = "padding", val = 1 },
            dashboard.section.datetime,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
        },
        keymap = {
            press = '<CR>',
        },
    }

    vim.cmd([[highlight MyAsciiHeader guifg=#a3be8c]])  -- Définir la couleur de l'en-tête ASCII
    alpha.setup(dashboard.opts)
end


return M

