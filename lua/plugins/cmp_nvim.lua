-- ************************************************************
-- * Configuration de ~/.config/nvim/lua/plugins/cmp_nvim.lua *
-- ************************************************************

-- Chargement du module `cmp`
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  completion = { completeopt = "menu,menuone" },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)  -- Intégration de LuaSnip avec nvim-cmp
    end,
  },
  sources = {  -- Sources pour l'autocomplétion
    { name = "nvim_lsp" }, -- Source basée sur le serveur LSP
    { name = "luasnip"},   -- Source pour LuaSnip 
    { name = "buffer" },   -- Source basée sur le contenu du buffer courant
    { name = "path" },     -- Source basée sur les chemins de fichiers
  },

  -- Mappings pour l'autocomplétion
  mapping = cmp.mapping.preset.insert({
    ["<C-Tab>"] = cmp.mapping.complete(),           -- Ouvrir le menu d'autocomplétion
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmer la suggestion sélectionnée
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),

  -- Comportement de l'affichage
  window = {
    completion = cmp.config.window.bordered(), -- Fenêtre avec bordure pour l'autocomplétion
    documentation = cmp.config.window.bordered(), -- Fenêtre avec bordure pour la documentation
  },
})

