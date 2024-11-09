-- *************
-- * 
-- ***********

local fzf = require("fzf-lua")

-- Enregistre fzf-lua comme interface par défaut pour vim.ui.select
require('fzf-lua').register_ui_select()

fzf.setup({})
