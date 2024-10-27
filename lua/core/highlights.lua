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
-- - Cf. doc - ligne 2460      *
-- *****************************
api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#5e81ac", bold = true })  -- Nom dossier / Bleu clair / Gras          
api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#bf616a", bold = true })  -- Dossier racine / Rouge clair / Gras          
api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#d08770" })  -- Fichiers modifiés (git) / Orange                          
api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#6fbe6a" })  -- Fichiers ajoutés (git) / Vert clair                           
api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#bfa6ff", bold = true })  -- Fichiers spéciaux / Mauve / Gras

-- Dossier ouvert / Fond noir, couleur fg dépendante de l'état de git ou par défaut bleu :
api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#5e81ac", bg = "#000000", bold = true })  -- Par défaut Bleu

-- États git appliqués à NvimTreeOpenedFolderName pour conserver le fond noir :
api.nvim_set_hl(0, "NvimTreeOpenedFolderNameDirty", { fg = "#d08770", bg = "#000000" })  -- Modifié / Orange
api.nvim_set_hl(0, "NvimTreeOpenedFolderNameNew", { fg = "#6fbe6a", bg = "#000000" })  -- Nouvellement ajouté / Vert clair

-- Erreurs de diagnostic / Fond rouge clair avec texte blanc / Gras :
api.nvim_set_hl(0, "NvimTreeDiagnosticError", { bg = "#bf616a", fg = "#eceff4", bold = true }) 

-- Avertissements de diagnostic / Fond orange clair avec texte noir / Gras :
api.nvim_set_hl(0, "NvimTreeDiagnosticWarning", { bg = "#d08770", fg = "#2e3440", bold = true })

