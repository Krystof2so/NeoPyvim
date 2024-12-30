-- ************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/cmp_nvim.lua *
-- ************************************************************

-- Chargement du module `cmp`
local cmp = require("cmp")

cmp.setup({
  -- Sources pour l'autocomplétion
  sources = {
    { name = "nvim_lsp" }, -- Source basée sur le serveur LSP
    { name = "buffer" },   -- Source basée sur le contenu du buffer courant
    { name = "path" },     -- Source basée sur les chemins de fichiers
  },

  -- Mappings pour l'autocomplétion
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),           -- Ouvrir le menu d'autocomplétion
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmer la suggestion sélectionnée
    ["<Tab>"] = cmp.mapping.select_next_item(),       -- Naviguer vers l'élément suivant
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),     -- Naviguer vers l'élément précédent
  }),

  -- Comportement de l'affichage
  window = {
    completion = cmp.config.window.bordered(), -- Fenêtre avec bordure pour l'autocomplétion
    documentation = cmp.config.window.bordered(), -- Fenêtre avec bordure pour la documentation
  },
})

