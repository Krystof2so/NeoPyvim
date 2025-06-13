-- ************************************************
-- * Initialisation de la configuration de Neovim *
-- ************************************************

---@diagnostic disable: undefined-global

-- ******************
-- * Désactivations *
-- ******************
vim.g.loaded_perl_provider = 0 -- Désactiver le provider Perl (si Perl non utilisé avec Neovim)

-- Les deux lignes qui suivent désactivent 'Netrw' pour que 'nvim-tree' soit l'unique explorateur de fichiers :
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ************************
-- * Environnement Python *
-- ************************
vim.g.python3_host_prog = "/home/krystof/.venvs/nvim/bin/python"

-- ***************
-- * Activations *
-- ***************
vim.opt.termguicolors = true -- Active le support des couleurs 24 bits

-- Définir l'encodage par défaut à UTF-8
vim.opt.encoding = "utf-8"

-- ***************************
-- * Charegement des modules *
-- ***************************
require("core.options")
require("core.keymaps")
require("core.lazy")
require("core.highlights")
-- Charger le thème Nord au démarrage
require("plugins.nord").set()
