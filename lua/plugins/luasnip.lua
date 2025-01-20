-- ******************************************
-- * ~/.config/nvim/lua/plugins/luasnip.lua *
-- *                                        *
-- * Plugin pour la gestion des snippets    *
-- ******************************************

--require("luasnip")

-- Chargement des snippets personnalisés
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

-- Optionnel : Ajouter des raccourcis pour naviguer dans les snippets
vim.api.nvim_set_keymap("i", "<Tab>", [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']], { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", { silent = true })

