-- lua/plugins/treesitter.lua
local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "lua" }, -- Installe automatiquement le parser Lua
  highlight = {
    enable = true, -- Active la coloration syntaxique
  },
  indent = {
    enable = true, -- Active l'indentation basée sur Tree-sitter
  },
})

