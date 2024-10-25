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
api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#5e81ac", bold = true })  -- Nom dossier / Bleu clair / Gras          
api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#bf616a", bold = true })  -- Dossier racine / rouge clair / gras          
api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#d08770" })  -- Fichiers modifiés (git) / Orange                          
api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#6fbe6a" })  -- Fichiers ajoutés (git) / Vert clair                           
api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#bfa6ff", bold = true })  -- Fichiers spéciaux / Mauve / gras
api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { bg = "#000000" }) -- Dossier ouvert / Fond noir  
-- Erreurs de diagnostic / Fond rouge clair avec texte blanc / Gras :
api.nvim_set_hl(0, "NvimTreeDiagnosticError", { bg = "#bf616a", fg = "#eceff4", bold = true }) 
-- Avertissements de diagnostic / Fond orange clair avec texte noir / Gras :
api.nvim_set_hl(0, "NvimTreeDiagnosticWarning", { bg = "#d08770", fg = "#2e3440", bold = true })

