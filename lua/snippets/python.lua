-- ******************************************
-- * ~/.config/nvim/lua/snippets/python.lua *
-- *                                        *
-- * Snippets personnalisés pour Python     *
-- ******************************************

local ls = require("luasnip") -- Récupère LuaSnip
local s = ls.snippet          -- Crée un nouveau snippet
local t = ls.text_node        -- Insère du texte
local i = ls.insert_node      -- Point d'insertion

-- Définir des snippets pour Python
local snippets = {
    s("def", {                -- Le trigger est "def"
        t("def "),            -- Texte fixe
        i(1, "function_name"), -- Champ d'édition 1 : Nom de la fonction
        t("("),
        i(2, "args"),         -- Champ d'édition 2 : Arguments
        t("):"),              -- Texte fixe
        t({"", "    "}),      -- Nouvelle ligne avec indentation
        i(3, "pass")          -- Champ d'édition 3 : Contenu par défaut
    }),
}

return snippets
