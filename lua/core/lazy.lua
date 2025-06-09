-- ************************************
-- * ~/.config/nvim/lua/core/lazy.lua *
-- *                                  *
-- * Gestionnaire de plugins          *
-- ************************************

---@diagnostic disable: undefined-global
-- Définit le chemin d'installation de lazy.nvim :
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Vérifie l'existence du chemin d'installation (donc si le plugin est installé),
-- Sinon, clone le dépôt depuis GitHub :
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

-- Ajout du chemin du plugin au 'runtimepath' de Neovim pour le charger :
vim.opt.rtp:prepend(lazypath)

-- Configure et initialise lazy.nvim pour gérer la liste de plugins :
require("lazy").setup({
  -- Comportement par défaut
  defaults = {
    lazy = true,         -- Chargement paresseux (sauf si spécifié différemment dans la configuration du plugin)
  },

  spec = {
    import = "core.plugins",  -- Importation de la liste des plugins depuis plugins.lua
  },

  -- Indique le thème à utiliser 
  install = {
    colorscheme = { "nordic" }
  },

  -- Section de vérification des mises à jour
  checker = {
    enabled = true,  -- Active la vérification des mises à jour
  },

  -- Détection des changements dans les fichiers de configuration
  change_detection = {
    -- Verification et recharge de l'interface utilisateur
    enabled = true,
    notify = true, -- Notification lorsque des changements sont relevés
  },

  -- Interface de Lazy
  ui = {
    border = "rounded", -- Les bords toujours arrondis
  },

  -- Optimisation des performances en désactivant certains plugins natifs de Neovim
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",         -- Conversion en HTML
        "tohtml",               -- Commande tohtml
        "getscript",            -- Récupération de scripts depuis une URL
        "getscriptPlugin",      -- Plugin de récupération de scripts
        "gzip",                 -- Support des fichiers gzip
        "logipat",              -- Expressions régulières complexes
        "netrw",                -- Explorateur de fichiers (remplaçable par nvim-tree ou telescope)
        "netrwPlugin",          -- Plugin netrw
        "netrwSettings",        -- Paramètres de netrw
        "netrwFileHandlers",    -- Gestion des fichiers dans netrw
        "matchit",              -- Correspondance des balises
        "tar",                  -- Gestion des fichiers tar
        "tarPlugin",            -- Plugin pour les fichiers tar
        "rrhelper",             -- Rarement utilisé
        "spellfile_plugin",     -- Gestion des dictionnaires d'orthographe
        "vimball",              -- Format pour packager les plugins Vim
        "vimballPlugin",        -- Plugin vimball
        "zip",                  -- Gestion des fichiers zip
        "zipPlugin",            -- Plugin pour les fichiers zip
        "tutor",                -- Tutoriel pour Vim
        "rplugin",              -- Support des plugins Ruby
        "syntax",               -- Fichiers de syntaxe (remplaçable par des plugins)
        "synmenu",              -- Menu de syntaxe
        "optwin",               -- Fenêtre d'options
        "compiler",             -- Support des compilateurs
        "bugreport",            -- Rapport de bugs
        "ftplugin",             -- Plugins spécifiques aux types de fichiers (souvent redéfinis)
      },
    },
  },
})

