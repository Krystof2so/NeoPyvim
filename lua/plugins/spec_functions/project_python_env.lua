-- lua/plugins/spec_functions/project_python_env.lua

---@diagnostic disable: undefined-global

local M = {}

local function dir_exists(path)
    local stat = vim.loop.fs_stat(path)
    return stat and stat.type == "directory"
end

function M.create_python_project()
    local project_name = vim.fn.input("Nom du projet : ")
    if project_name == "" then
        print("Le nom du projet ne peut pas être vide.")
        return
    end

    local current_dir = vim.fn.getcwd()
    local project_dir = current_dir .. "/" .. project_name

    -- Vérifie si le répertoire existe déjà
    if not dir_exists(project_dir) then
        local mkdir_success = vim.fn.mkdir(project_dir, "p")
        if mkdir_success ~= 1 then
            print("Erreur lors de la création du répertoire du projet.")
            return
        end
    else
        print("Le répertoire du projet existe déjà.")
    end

    -- Créer l'environnement virtuel
    local venv_success = os.execute("cd " .. project_dir .. " && python3 -m venv .venv/ && rm -Rf .venv/.gitignore")
    if venv_success ~= 0 then
        print("Erreur lors de la création de l'environnement virtuel.")
        return
    end

    -- Contenu du fichier .gitignore
    local gitignore_content = [[
# Environnement virtuel
.venv

# Fichiers Python compilés
__pycache__/

# Fichiers de cache et de logs
*.log
*.cache

# Fichiers de données 
*.csv
*.json
*.sqlite
*.db
]]

    -- Créer le fichier .gitignore
    local gitignore_path = project_dir .. "/.gitignore"
    local gitignore_file = io.open(gitignore_path, "w")
    if gitignore_file then
        gitignore_file:write(gitignore_content)
        gitignore_file:close()
    else
        print("Erreur lors de la création du fichier .gitignore.")
        return
    end

    print("Projet Python créé avec succès : " .. project_dir)
end

return M

