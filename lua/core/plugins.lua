-- ***************************************
-- * ~/.config/nvim/lua/core/plugins.lua *
-- *                                     *
-- * Plugins installés                   *
-- ***************************************

local api = vim.api

return {

-- *****************************************
-- * INTERFACE                             *
-- *                                       *
-- * - nordic (thème)                      *
-- * - lualine (barre d'état)              *
-- * - nvim-tree (explorateur de fichiers) *
-- *****************************************

    { -- Thème nordic
      'AlexvZyl/nordic.nvim', lazy = false, priority = 1000, branch = 'main',
      config = function()
        require('nordic').load()
        vim.cmd("colorscheme nordic") -- Activation du thème        
      end
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

}
