-- ****************************************************************************
-- * ~/.config/nvim/lua/plugins/spec_functions/fzf_functions.lua              *
-- *                                                                          *
-- * Fonctions :                                                              *
-- * - search_in_directory : lancer une recherche depuis un répertoire précis *
-- ****************************************************************************

local M = {}


-- **************************************************************************
-- * Demande le chemin d'un répertoire avant de lancer la recherche fzf-lua *
-- **************************************************************************
function M.search_in_directory()
    -- Demande à l'utilisateur de saisir le chemin du répertoire, avec autocomplétion :
    local directory = vim.fn.input("Entrer le chemin du répertoire: ", "", "file")
    -- Vérifie si la saisie est vide :
    if directory == "" then
        print("Chemin non valide. Annulation de la recherche.")
        return
    end
    -- Convertit '~' en chemin absolu si présent :
    directory = vim.fn.expand(directory)
    -- Vérifie si le répertoire spécifié existe :
    local dir_info = vim.loop.fs_stat(directory)
    if not dir_info or dir_info.type ~= "directory" then
        print("Le chemin spécifié n'est pas un répertoire valide. Annulation de la recherche.")
        return
    end
    -- Lancer la recherche avec fzf-lua à partir du répertoire spécifié :
    require('fzf-lua').files({ cwd = directory })
end


return M

