-- **********************************************************
-- * ~/.config/nvim/lua/core/options.lua                    *
-- *                                                        *
-- * Options de base de Neovim comme                        *
-- * les numéros de lignes, les formats d'indentation, etc. *
-- **********************************************************

-- lua/core/options.lua

local opt = vim.opt  -- Raccourci pour simplifier la syntaxe

-- Interface utilisateur
opt.number = true           -- Affiche le numéro des lignes
opt.relativenumber = true   -- Numéros relatifs (utile pour les mouvements)
opt.cursorline = true       -- Surligne la ligne actuelle
opt.breakindent = true      -- conserve indentation après cassure de ligne
opt.showmatch = true        -- Surligne les paires correspondantes
opt.termguicolors = true    -- Active les couleurs 24-bit (nécessite un terminal compatible)
opt.scrolloff = 8           -- Garde 8 lignes de marge en haut et en bas lors du scrolling
opt.sidescrolloff = 8       -- Idem pour les colonnes
opt.colorcolumn = "120"      -- ligne verticale

-- Gestion des onglets et de l'indentation
opt.tabstop = 4             -- Taille d'un tab en espaces
opt.shiftwidth = 4          -- Nombre d'espaces utilisés pour chaque niveau d'indentation
opt.expandtab = true        -- Convertit les tabulations en espaces
opt.autoindent = true       -- Copie l'indentation de la ligne précédente lors de l'ajout d'une nouvelle ligne
opt.smartindent = true      -- Active une indentation intelligente pour les structures de code

-- Recherche
opt.ignorecase = true       -- Ignore la casse lors de la recherche
opt.smartcase = true        -- Si une majuscule est utilisée dans la recherche, devient sensible à la casse
opt.incsearch = true        -- Recherche interactive pendant la saisie
opt.hlsearch = true         -- Surligner les résultats de la recherche après validation

-- Performance
opt.updatetime = 300        -- Temps d'attente en millisecondes avant de déclencher des événements
opt.timeoutlen = 500        -- Temps avant qu'une combinaison de touches échoue (en ms)

-- Gestion des fichiers et des sauvegardes
opt.backup = false          -- Désactive les fichiers de sauvegarde
opt.writebackup = false     -- Désactive la création de backups avant l'écriture d'un fichier
opt.swapfile = false        -- Désactive les fichiers d'échange (swap)
opt.fileencoding = "utf-8"  -- encodage

-- Apparence du texte
opt.linebreak = true        -- Casse les lignes de texte seulement aux espaces (utile si wrap est activé)
opt.showbreak = ">> "       -- Indicateur de retour à la ligne
opt.wrap = true             -- Active le retour à la ligne automatique des lignes longues

-- Interface de la ligne de commande
opt.cmdheight = 2           -- Espace supplémentaire pour les messages dans la ligne de commande

-- Splits (fenêtres)
opt.splitright = true       -- Les nouvelles fenêtres verticales s'ouvrent à droite
opt.splitbelow = true       -- Les nouvelles fenêtres horizontales s'ouvrent en dessous

-- Gestion du presse-papiers (optionnel)
opt.clipboard = "unnamedplus" -- Utilise le presse-papiers système pour copier/coller

-- Gestion des couleurs
opt.background = "dark"     -- Définit le thème sur "dark" (si le thème de la configuration le supporte)
opt.termguicolors = true    -- Active l'utilisation des couleurs réelles dans le terminal
