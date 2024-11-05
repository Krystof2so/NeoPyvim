local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- ***************** 
-- * Configuration *
-- *****************

-- Section d'en-tête en ASCII art
vim.cmd([[highlight MyAsciiHeader guifg=#a3be8c]])  -- Définir la couleur de l'en-tête ASCII

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

-- Configuration de la disposition des boutons du menu
dashboard.section.buttons.val = {
    dashboard.button("***", "🔍  Find File"),
    dashboard.button("***", "📄  New File"),
    dashboard.button("***", "📂  Recent Files"),
    dashboard.button("e", "🗃️  Ouvre l'explorateur de fichiers", ":NvimTreeToggle<CR>"),
    dashboard.button("p", "💤  Ouvre le gestionnaire de plugins", ":Lazy<CR>"),
    dashboard.button("q", "❌  Quitter", ":q<CR>"),
}

-- Configuration de la disposition finale, avec un affichage centré
dashboard.opts.layout = {
    dashboard.section.header,      -- En-tête en ASCII art
    { type = "padding", val = 1 }, -- Espacement entre les sections
    dashboard.section.datetime,    -- Affichage de la date et de l'heure
    { type = "padding", val = 2 }, -- Espacement entre la date/heure et le menu
    dashboard.section.buttons      -- Menu des boutons
}


-- **************************************
-- * Initialisation de la configuration *
-- **************************************

alpha.setup(dashboard.opts)  -- Applique le thème 'dashboard' avec la configuration définie ci-dessus.

