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
    local path = node.absolute_path  -- Chemin absolu du noeud

    -- Vérification du chemin :
    if node.name == ".." then
        path = vim.fn.getcwd()  -- Chemin = chemin du fichier racine
    elseif node.type == "file" then  -- Si sélection d'un fichier
        path = path:match("(.*/)")
        path = path:sub(1, -2)  -- Supprime le slash final
    end

    -- Demande le chemin du fichier ou répertoire :
    PROMPT_INPUT = "Créer un fichier ou répertoire ('/' à la fin si répertoire) dans " .. path .. "/"
    local name_file_or_repertory = vim.fn.input(PROMPT_INPUT)
    -- Si répertoire :
    local is_directory = name_file_or_repertory:sub(-1) == "/"

    -- Vérification de la saisie de l'utilisateur pour le nom du fichier ou répertoire,
    -- uniquement une chaîne alphanumerique (l'underscore et le point sont aussi admis) : 
    local is_valid_name
    if is_directory then
        -- Le nom du répertoire peut commencer par un point, mais pas en contenir ailleurs, et des underscores.
        is_valid_name = name_file_or_repertory:match("^[_.]?[a-zA-Z0-9_]+/?$") and
                    not name_file_or_repertory:find("%.%.")  -- Pas de double point
    else
        -- Le nom du fichier peut contenir des points et des underscores.
        is_valid_name = name_file_or_repertory:match("^[_.]?[a-zA-Z0-9_.]+[a-zA-Z0-9_.]*[a-zA-Z0-9]+$") and
                    not name_file_or_repertory:find("%.%.")
    end

    -- Si le nom est invalide, annuler la création
    if not is_valid_name or name_file_or_repertory == "" then
        vim.cmd("echo 'Création annulée : chemin invalide.'")
        return
    end

    -- Crée le chemin final :
    local new_path = path .. "/" .. name_file_or_repertory
    if is_directory then
        new_path = new_path:sub(1, -2)  -- Supprime le "/" final pour le répertoire
    end

    -- Vérifie si un fichier ou un répertoire existe déjà avec le même nom :
    local start_message = "Création impossible via nvim-tree, un"
    local end_message = "porte déjà ce nom."
    if vim.fn.filereadable(new_path) == 1 then
        vim.cmd("echo '" .. start_message .. " fichier " .. end_message .. "'")
        return
    elseif vim.fn.isdirectory(new_path) == 1 then
        vim.cmd("echo '" .. start_message .. " répertoire " .. end_message .. "'")
        return
    end

    -- Commandes shell pour créer le fichier ou répertoire :
    local command = is_directory and "mkdir -p '" .. new_path .. "'" or "touch '" .. new_path .. "'"
    local success = os.execute(command)

    vim.cmd("echo '" .. ((success and ((is_directory and "Répertoire") or "Fichier") .. " créé avec succès : ") or
            "Erreur lors de la création : ") .. new_path .. "'")

    -- Rafraîchit nvim-tree
    vim.cmd("NvimTreeRefresh")
end


return M

