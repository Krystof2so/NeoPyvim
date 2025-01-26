-- ******************************************
-- * ~/.config/nvim/lua/plugins/luasnip.lua *
-- ******************************************

local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

-- Mappings pour naviguer dans les snippets
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })
