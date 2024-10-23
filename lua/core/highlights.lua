-- ******************************************
-- * ~/.config/nvim/lua/core/highlights.lua *
-- *                                        *
-- * Couleurs de mise en évidence           *
-- ******************************************

local api = vim.api


-- *****************************
-- * Couleurs au niveau global *
-- *****************************

-- Couleur des numéros de ligne :
api.nvim_set_hl(0, 'LineNr', { fg = '#81a1c1', bg = '#2e3440' })                    -- Numéros de ligne inactifs
api.nvim_set_hl(0, 'CursorLineNr', { fg = '#2e3440', bg = '#5e81ac', bold = true }) -- Numéros de ligne actifs

vim.api.nvim_set_hl(0, "Comment", { fg = "#564453", italic = true })                -- Commentaires


-- *****************************
-- * Couleurs pour 'nvim-tree' *
-- *****************************
api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#5e81ac", bold = true })          
api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#5e81ac", bold = true })    
api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#bf616a", bold = true })          
api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#d08770" })                        
api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#a3be8c" })                          
api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#b48ead" })                      
