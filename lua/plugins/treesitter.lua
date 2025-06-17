-- lua/plugins/treesitter.lua

local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "lua" }, -- Installe automatiquement le parser Lua
  sync_install = false, -- Synchronise l'installation des parsers
  auto_install = true, -- Installe automatiquement les parsers manquants
  ignore_install = {}, -- Liste des parsers à ignorer
  highlight = {
    enable = true, -- Active la coloration syntaxique
  },
  indent = {
    enable = true, -- Active l'indentation basée sur Tree-sitter
  },
  modules = {}, -- Modules supplémentaires pour Tree-sitter
})

