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
-- * - nordic (thème)                                    *
-- * - lualine (barre d'état)                            *
-- * - nvim-tree (explorateur de fichiers)               *
-- * - bufferline (gestionnaire de buffers avec onglets) *
-- *******************************************************

    { -- Thème nordic
      'AlexvZyl/nordic.nvim', lazy = false, priority = 1000, branch = 'main',
      config = function()
        require('nordic').load()
        vim.cmd("colorscheme nordic") -- Activation du thème        
      end
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


-- *************
-- * FINDERS   *
-- *           *
-- * - fzf.lua *
-- *************

    { -- fzf-lua : basé sur la bibliothèque 'fzf'
        'ibhagwan/fzf-lua', lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("plugins.fzf")
        end
    },

}
