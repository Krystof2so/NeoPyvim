-- ************************************************
-- * Initialisation de la configuration de Neovim *
-- ************************************************


-- ******************
-- * Désactivations *
-- ******************
vim.g.loaded_perl_provider = 0 -- Désactiver le provider Perl (si Perl non utilisé avec Neovim)

-- Les deux lignes qui suivent désactivent 'Netrw' pour que 'nvim-tree' soit l'unique explorateur de fichiers :
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- ***************
-- * Activations *
-- ***************
vim.opt.termguicolors = true -- Active le support des couleurs 24 bits


-- ***************************
-- * Charegement des modules *
-- ***************************
require("core.options")
require("core.keymaps")
require("core.lazy")
require("core.highlights")
