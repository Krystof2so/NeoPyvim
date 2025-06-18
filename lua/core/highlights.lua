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

vim.api.nvim_set_hl(0, "Comment", { fg = "#d08770", italic = true })                -- Commentaires


-- *****************************
-- * Couleurs pour 'nvim-tree' *
-- - Cf. doc - ligne 2460      *
-- *****************************
local function apply_nvim_tree_highlights()
    -- Couleurs pour nvim-tree
    api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#5e81ac", bold = true })  -- Nom dossier / Bleu clair / Gras
    api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#bf616a", bold = true })  -- Dossier racine / Rouge clair / Gras
    api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#d08770" })  -- Fichiers modifiés (git) / Orange
    api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#6fbe6a" })  -- Fichiers ajoutés (git) / Vert clair
    api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#bfa6ff", bold = true })  -- Fichiers spéciaux / Mauve / Gras

    -- Dossier ouvert : couleur fg dépendante de l'état de git ou par défaut bleu :
    api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#5e81ac", bold = true })  -- Par défaut Bleu

    -- États git appliqués à NvimTreeOpenedFolderName :
    api.nvim_set_hl(0, "NvimTreeOpenedFolderNameGitDirty", { fg = "#d08770" })   -- Modifié / Orange
    api.nvim_set_hl(0, "NvimTreeOpenedFolderNameGitNew", { fg = "#6fbe6a" })     -- Nouvellement ajouté / Vert clair
    api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#bf616a", bg = "#d8dee9" }) -- Fichiers ignorés / bg blanc et fg rouge

    -- Erreurs de diagnostic / Fond rouge clair avec texte blanc / Gras :
    api.nvim_set_hl(0, "NvimTreeDiagnosticError", { bg = "#bf616a", fg = "#eceff4", bold = true })

    -- Avertissements de diagnostic / Fond orange clair avec texte noir / Gras :
    api.nvim_set_hl(0, "NvimTreeDiagnosticWarning", { bg = "#d08770", fg = "#2e3440", bold = true })
end

-- Appliquer les couleurs de nvim-tree au démarrage
return {
    apply_nvim_tree_highlights = apply_nvim_tree_highlights
}
