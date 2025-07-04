-- ********************************************************************************
-- * ~/.config/nvim/lua/plugins/spec_functions/nvim_tree_functions.lua            *
-- *                                                                              *
-- * Functions utilisées par 'nvim_tree.lua :                                     *
-- * - format_root_folder : formatage du nom du dossier racine                    *
-- * - confirm_remove : suppression fichier francisée                             *
-- * - create_file_or_repertory : ajout fichier/répértoire francisé               *
-- *                                                                              *
-- * Pour les api de nvim-tree, voir :                                            *
-- * https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt *
-- * A partir de la ligne 1685 du fichier                                         *
-- ********************************************************************************

---@diagnostic disable: undefined-global
local M = {}

-- *********************************************
-- * Formatage du dossier racine en majuscules *
-- *********************************************
M.format_root_folder = function(path)
  local folder_name = vim.fn.fnamemodify(path, ":t") -- Récupère le dernier composant du chemin (nom du dossier)
  return string.upper(folder_name)
end


-- *****************************
-- * FRANCISATION DE NVIM-TREE *
-- *****************************

-- **********************************************************************
-- * Fonction de suppression d'un fichier ou dossier avec la touche 'd' *
-- * Redéfinit le mapping de la touche 'd' dans 'nvim-tree.lua'         *
-- **********************************************************************
function M.confirm_remove(node)
    -- Pour éviter la suppression accidentelle du répertoire racine :
    if node.name == ".." then
        vim.cmd("echo 'Impossible de suppprimer le répertoire racine depuis nvim-tree'")
        return  -- sortir 
    end
    local path = node.absolute_path  -- Chemin absolu du noeud
    -- Suppression du fichier/répertoire sélectionner :
    while true do
      -- Demande la confirmation (boucle tant que la saisie est différente de 'o' ou 'n') :
        local user_input = vim.fn.input("Suppression du fichier '" .. path .. "' (o/n) ? ")
        user_input = user_input:upper()  -- Permet d'utiliser 'o', 'O', 'n', 'N'
        if user_input == "O" then
            -- Détermine la commande à exécuter en fonction du type :
            local command = (vim.fn.isdirectory(path) == 1) and "rm -rf '" .. path .. "'" or "rm -f '" .. path .. "'"
            local success = os.execute(command)
            vim.cmd("echo '" .. (success and "Suppression de : " or
                                 "Erreur lors de la suppression de : ") .. path .. "'")
            break  -- Sort de la boucle après suppression
        elseif user_input == "N" then
            vim.cmd("echo 'Suppression annulée'")  -- Vider la ligne de commande
            break  -- Sort de la boucle si l'utilisateur choisit "n"
        end
    end
    -- Rafraîchit nvim-tree
    vim.cmd("NvimTreeRefresh")
end

-- **************************************************************
-- * Fonction d'ajout de fichier ou dossier avec la touche 'a'  *
-- * Redéfinit le mapping de la touche 'a' dans 'nvim-tree.lua' *
-- **************************************************************
function M.create_file_or_repertory(node)
    local path = node.absolute_path

    -- Gestion du chemin de base
    if node.name == ".." then
        path = vim.fn.getcwd()
    elseif node.type == "file" then
        path = path:match("(.*/)")
        path = path:sub(1, -2)
    end

    -- Demande le nom à créer
    PROMPT_INPUT = "Créer un fichier ou répertoire ('/' à la fin si répertoire) dans " .. path .. "/"
    local name_file_or_repertory = vim.fn.input(PROMPT_INPUT)

    -- Détermine s'il s'agit d'un répertoire (se termine par un slash)
    local is_directory = name_file_or_repertory:sub(-1) == "/"

    -- Nettoie le nom s'il y a un slash terminal (utile pour validation)
    local clean_name = is_directory and name_file_or_repertory:sub(1, -2) or name_file_or_repertory

    -- Vérifie la validité du nom
    local is_valid_name = false
    if clean_name ~= "" and not clean_name:find("%.%.") then
        is_valid_name = clean_name:match("^[a-zA-Z0-9_.]+[a-zA-Z0-9_.%-]*$")
    end

    -- Si nom invalide
    if not is_valid_name then
        vim.cmd("echo 'Création annulée : chemin invalide.'")
        return
    end

    -- Construit le chemin final
    local new_path = path .. "/" .. clean_name

    -- Vérifie les collisions
    local start_message = "Création impossible via nvim-tree, un"
    local end_message = "porte déjà ce nom."
    if vim.fn.filereadable(new_path) == 1 then
        vim.cmd("echo '" .. start_message .. " fichier " .. end_message .. "'")
        return
    elseif vim.fn.isdirectory(new_path) == 1 then
        vim.cmd("echo '" .. start_message .. " répertoire " .. end_message .. "'")
        return
    end

    -- Crée fichier ou dossier
    local command = is_directory and "mkdir -p '" .. new_path .. "'" or "touch '" .. new_path .. "'"
    local success = os.execute(command)

    vim.cmd("echo '" .. ((success and ((is_directory and "Répertoire") or "Fichier") .. " créé avec succès : ") or
        "Erreur lors de la création : ") .. new_path .. "'")

    -- Rafraîchit nvim-tree
    vim.cmd("NvimTreeRefresh")
end


return M

