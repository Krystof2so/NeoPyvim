-- ***************************************
-- * ~/.config/nvim/lua/core/plugins.lua *
-- *                                     *
-- * Plugins installés                   *
-- ***************************************

local api = vim.api

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

    { -- Alpha : page d'accueil
        'goolord/alpha-nvim', lazy = true, event = "VimEnter",
        config = function ()
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


-- *****************************************************************
-- * Language Server Protocol                                      *
-- *                                                               *
-- * mason : gestionnaire serveurs LSP, linters, DAP et formatters *
-- *****************************************************************

    {  -- mason
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- Met à jour automatique des registres de Mason au démarrade de Neovim
        event = "VeryLazy",     -- Charge Mason dès que Neovim est prêt à interagir
        config = function()
            require("plugins.mason")
        end
    },

    {  -- mason-lspconfig
        "williamboman/mason-lspconfig.nvim",
        event = { "VeryLazy" },
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("plugins.mason_lspconfig")
        end,
    },

    {  -- nvim-lspconfig
        "neovim/nvim-lspconfig",
        event = { "VeryLazy" },
        dependencies = { "williamboman/mason-lspconfig.nvim" },
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
            "hrsh7th/cmp-vsnip",     -- Intégration avec un snippet engine
            "hrsh7th/vim-vsnip",     -- Snippet engine (optionnel)
        },
        config = function()
            require("plugins.cmp_nvim")
        end,
    },

-- ******************************************
--                                  *
-- *                                        *
-- * - fzf.lua : findder                    *
-- * - nvim-treesitter : analyse syntaxique *
-- ******************************************

    { -- fzf-lua : basé sur la bibliothèque 'fzf'
        'ibhagwan/fzf-lua', lazy = true, event = "VimEnter",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("plugins.fzf")
        end
    },

    { -- nvim-treesitter : analyseur syntaxique
        'nvim-treesitter/nvim-treesitter', lazy = false,
        build = ':TSUpdate', -- Mettre à jour les parsers après l'installation
        config = function()
            require('nvim-treesitter.configs').setup {}
        end
    },

}
