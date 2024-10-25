-- *********************************************************************
-- * ~/.config/nvim/lua/plugins/spec_functions/nvim_tree_functions.lua *
-- *                                                                   *
-- * Functions utilisées par 'nvim_tree.lua :                          *
-- * - format_root_folder : formatage du nom du dossier racine         *
-- * - confirm_remove : suppression fichier francisée                  *
-- *********************************************************************


-- Ce fichier contient la fonction pour formater le nom du dossier racine en majuscules

local M = {}

-- *********************************************
-- * Formatage du dossier racine en majuscules *
-- *********************************************
M.format_root_folder = function(path)
  local folder_name = vim.fn.fnamemodify(path, ":t") -- Récupère le dernier composant du chemin (nom du dossier)
  return string.upper(folder_name)
end


-- **********************************************************************
-- * Fonction de suppression d'un fichier ou dossier avec la touche 'd' *
-- * Pour franciser l'action                                            *
-- * Redéfinir le mapping de la touche 'd' dans 'nvim-tree.lua'         *
-- **********************************************************************
function M.confirm_remove(node)
  if node.name == ".." then return end

  local function do_remove()
    require("nvim-tree.api").fs.remove(node)
  end

  local prompt_input
  
  while true do
    -- Demande la confirmation :
    prompt_input = "Suppression du fichier '" .. node.absolute_path .. "' (O/N) ?"
    local user_input = string.upper(vim.fn.input(prompt_input)) -- Convertir l'entrée en majuscule

    if user_input == "O" then
      do_remove()  -- Supprime le fichier
      break  -- Sort de la boucle après suppression
    elseif user_input == "N" then
      vim.cmd("echo ''")  -- Vider la ligne de commande
      break  -- Sort de la boucle si l'utilisateur choisit "n"
    end
  end
end


return M

