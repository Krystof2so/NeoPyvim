-- ***************************************
-- 				ALPHA-NVIM
-- Interface de bienvenue personnalisable
-- ***************************************

-- IMPORT DES MODULES :
local alpha = require "alpha" -- Module principal
local dashboard = require "alpha.themes.dashboard" -- Thème fourni par alpha

-- SECTION D'EN-TETE :
-- Formatage date et heure :
local days = {
    "Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"
}
local day_name = days[tonumber(os.date("%w")) + 1] -- 1 = dimanche, 7 = samedi
local date_format = day_name .. " " .. os.date("%d/%m/%Y")
-- Affichage :
dashboard.section.header.val = {
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
  "            ".. date_format .. "               ⏰ " .. os.date("%H:%M"),
  [[                                                                       ]],
}

-- BOUTONS DE L'INTERFACE :
dashboard.section.buttons.val = {
	-- dashboard.button("raccourci bouton", "texte affiché", "commande exécutée")
	dashboard.button("zz", "💤 - Ouvrir Lazy.nvim", "<cmd>:Lazy<CR>"),
    dashboard.button("q", "👋 - Hasta luego NVim...", "<cmd>:qa<CR>"),

}



-- ************************ 
alpha.setup(dashboard.opts) -- Initialisation de la configuration
-- Disable folding on alpha buffer
vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]

