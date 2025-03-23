-- ********************************************************
-- * nvim-tree : ~/.config/nvim/lua/plugins/nvim-tree.lua *
-- *                                                      *
-- * Explorateur de fichiers                              *
-- ********************************************************

-- Appel du fichier contenant les fonctions développées pour 'nvim-tree' :
local nvim_tree_functions = require('plugins.spec_functions.nvim_tree_functions')

nv_tree = require("nvim-tree")
local api = require("nvim-tree.api")


-- ********************************************************************************
-- * Redéfinition du mapping pour des appels à des fonctions spécifiques          *
-- *                                                                              *
-- * Pour le mapping par défaut, voit :                                           *
-- * https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt *
-- * A partir de la ligne 2338 du fichier                                         *
-- ********************************************************************************
local function my_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Copier les mappings par défaut :
  api.config.mappings.default_on_attach(bufnr)

  -- Supprimer les mapping par défaut pour 'd', 'a' :
  vim.keymap.del('n', 'd', { buffer = bufnr })
  vim.keymap.del('n', 'a', { buffer = bufnr })

  -- Ajout des nouvelles fonctionnalités pour les touches 'd', 'a' : 
  vim.keymap.set("n", "d", function()
      nvim_tree_functions.confirm_remove(api.tree.get_node_under_cursor())
  end, opts("Supprimer (français)"))
  vim.keymap.set("n", "a", function()
      nvim_tree_functions.create_file_or_repertory(api.tree.get_node_under_cursor())
  end, opts("Créer fichier (français)"))
end


-- ************************
-- * Initialise nvim-tree *
-- ************************
nv_tree.setup({
    hijack_cursor = true,  -- Maintient le curseur sur la première lettre du nom du fichier

    sort = { -- tri des dossiers et fichiers pour l'affichage
        sorter = "extension",     -- Tri par les estensions
        folders_first = true,     -- Répertoires en premier
    },

    view = {
        number = true,             -- Active l'affichage des numéros de ligne
        relativenumber = true,     -- Utiliser des numéros relatifs
        signcolumn = "no",         -- Pas d'affichage des signes
        width = 25,                -- Dimensions en largeur de 'nvim-tree' (fixée à 25)
    },

    renderer = { -- Mises en évidence
        add_trailing = true,                                            -- Ajout d'un '/' à la fin d'un nom de dossier    
        full_name = true,                                         -- Affiche les noms longs dans une fenêtre flottante
        root_folder_label = nvim_tree_functions.format_root_folder,     -- Nom dossier racine en majuscules
        special_files = { "README.md", "readme.md", ".gitignore" },     -- Liste de fichiers notés comme spéciaux            
        hidden_display = "all",                                         -- Affiche nombre de fichiers cachés et raison
        highlight_git = "name",                      -- Mise en évidence du nom des fichiers en fonction du statut Git
        highlight_diagnostics = "icon",                      -- Met en évidence les icônes en fonction des diagnostics
        highlight_modified = "icon",                                -- Met en évidence les icônes de fichiers modifiés 
        icons = {
            show = { 
                folder_arrow = true,                               -- Activer les flèches pour les dossiers
                file = true,                                       -- Afficher les icônes de fichiers
                folder = true,                                     -- Afficher les icônes de dossiers
                git = false,                                       -- Afficher les icônes Git
                modified = false,                                  -- Afficher les icônes de fichiers modifiés
                diagnostics = false,                               -- Afficher les diagnostics
            },
            glyphs = {
                folder = {
                    arrow_open = "▼",    -- Flèche pour dossier ouvert
                    arrow_closed = "▶",  -- Flèche pour dossier fermé
                },
            },
        },
        indent_markers = {
            enable = true,  -- Active les marqueurs d'indentation
            icons = {  -- Marqueurs sous forme de symboles définis ci-dessous
                corner = "╰", edge = "│", item = "├", bottom = "─", none = " ",
            },
        },
    },

    update_focused_file = { 
        enable = true,         -- Synchronisation de l'arborescence au regard des fichiers ouverts
        update_cwd = true,     --
    }, 

    git = {
        enable = true,     -- Intégration Git activée
        ignore = false,    -- Affiche les fichiers ignorés par git
    },

    diagnostics = {
        enable = true,                               -- Activer les diagnostics
        debounce_delay = 50,                         -- Délai de mise à jour en ms (interruption si trop long)
        show_on_dirs = true,                         -- Afficher les icônes de diagnostic sur les répertoires parents
        show_on_open_dirs = true,                    -- Afficher les diagnostics sur les répertoires ouverts
        severity = {
            min = vim.diagnostic.severity.WARN,      -- Afficher à partir des avertissements
            max = vim.diagnostic.severity.ERROR,     -- Afficher jusqu'aux erreurs
        },
    },
   
    modified = { enable = true, },         -- Active la détection des fichiers modifiés
    
    notify = { absolute_path = true },     -- Affiche le chemin complet d'un fichier dans les notifications

    ui = {
        confirm = {
            remove = false,          -- Désactiver la confirmation avant suppression
            trash = true,            -- Optionnel : Activer la confirmation avant mise à la corbeille
            default_yes = false,     -- Optionnel : Laisser les réponses par défaut comme "n" (non)
        },
    },

    experimental = {
        actions = {
            open_file = { relative_path = true },  -- Activer l'ouverture de fichiers avec chemins relatifs (:ls)
        },
    },

    on_attach = my_on_attach,     -- Attacher les redéfinitions de mapping

})


-- **************************************************************************
-- * Fonction pour ouvrir automatiquement nvim-tree à l'ouverture de Neovim *
-- **************************************************************************
--local function open_nvim_tree(data)
--    if data.file == "" then api.tree.open()
--    end
--end


-- Attache l'événement VimEnter pour ouvrir nvim-tree :
--vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

