-- ***************************************
-- * ~/.config/nvim/lua/core/plugins.lua *
-- *                                     *
-- * Plugins installés                   *
-- ***************************************

return {

-- *******************************************************
-- * INTERFACE                                           *
-- *                                                     *
-- * - nord (thème)                                    *
-- * - lualine (barre d'état)                            *
-- * - nvim-tree (explorateur de fichiers)               *
-- * - bufferline (gestionnaire de buffers avec onglets) *
-- *******************************************************

    { -- Thème nord
        "shaunsingh/nord.nvim", lazy = false, priority = 1000,
        config = function()
            require("plugins.nord")
        end,
    },

    { -- Thème Catppuccin
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "latte", -- Utilisez le thème clair par défaut
            })
        end,
    },

    { -- Alpha : page d'accueil
        'goolord/alpha-nvim', lazy = true, event = "VimEnter",
        config = function()
	        require("plugins.alpha")
        end,
	},

    { -- Lualine : pour la barre d'état
      'nvim-lualine/lualine.nvim', lazy = false,
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('plugins.lualine')
      end 
    },

    { -- nvim-tree : explorateur de fichiers
      "nvim-tree/nvim-tree.lua", version = "*", lazy = false, -- Pour suivre la version stable
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("plugins.nvim-tree")
      end
    },

    { -- bufferline : gestionnaire de buffers sous forme d'onglets
        'akinsho/bufferline.nvim', version = "*", lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("plugins.bufferline")
        end
    },

    { -- nvim-web-devicons
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },

    {  --telescope-nvim : outil de recherche sur des listes
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,  -- Abreviation 'Lazy' qui appelle automatiquement require("telescope").setup() avec les valeurs par défaut.
    },


-- ************************************************************
-- * Configuration des plugins liés au LSP                    *
-- * La configuration de tous les plugins (nvim-lspconfig,    *
-- * mason.nvim, mason-lspconfig.nvim) se fait dans une seule *
-- * définition de dépendance.                                *
-- ************************************************************
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },

{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
          "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
          require("plugins.mason")
        end,
      },
    },
    config = function()
      require("plugins.lspconfig")
    end,
},


-- **********************************************************************
-- * Configuration de nvim-cmp (autocomplétion) avec ses dépendances    *
-- **********************************************************************

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- Charge nvim-cmp lorsqu'on entre en mode insertion
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",  -- Source pour l'autocomplétion LSP
            "hrsh7th/cmp-buffer",    -- Source pour l'autocomplétion dans le buffer courant
            "hrsh7th/cmp-path",      -- Source pour l'autocomplétion des chemins

        },
        config = function()
            require("plugins.cmp_nvim")
        end,
    },


-- **********************************
-- * Luasnip : Gestion des snippets *
-- **********************************

    {
	    "L3MON4D3/LuaSnip",
	    version = "v2.*",                                 -- Suivre la dernière version
        dependencies = {"rafamadriz/friendly-snippets"},  -- Snippets de style VSCode
        config = function()
            require("plugins.luasnip_nvim")
        end,
    },


-- ************
-- * Débogage *
-- ************

    {
      "mfussenegger/nvim-dap",
      dependencies = {
        "rcarriga/nvim-dap-ui",     -- Interface visuelle pour le débogueur
        "mfussenegger/nvim-dap-python",
        "nvim-neotest/nvim-nio", -- Dépendance obligatoire pour nvim-dap-ui
      },
      config = function()
        require("plugins.dap")
      end,
    },


-- ************************************************************
-- * Installation d'outils divers                             *
-- *                                                          *
-- * - nvim-autopairs : fermeture automatique des parenthèses *                       
-- * - fzf.lua : findder                                      *
-- * - nvim-treesitter : analyse syntaxique                   *
-- * - pyflowenv-nvim : créer des projets Python              *
-- ************************************************************

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.autopairs")
        end,
    },


    { -- fzf-lua : basé sur la bibliothèque 'fzf'
        'ibhagwan/fzf-lua', lazy = true, event = "VimEnter",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("plugins.fzf")
        end
    },

    { -- nvim-treesitter : analyseur syntaxique
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate', -- Mettre à jour les parsers après l'installation
        config = function()
            require('plugins.treesitter')
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-file-browser.nvim",
                config = function()
                    require("telescope").load_extension("file_browser")
                end,
            },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    file_browser = {
                        hijack_netrw = true,
                    },
                },
            })
        end,
    },

    {  -- pyflowenv : créer des projets Python
        "Krystof2so/pyflowenv-nvim",
        config = function()
            require("pyflowenv").setup()
        end,
        lazy = false,
    },

}
