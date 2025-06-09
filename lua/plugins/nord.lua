-- Configurations pour Nord.Nvim

---@diagnostic disable: undefined-global
-- Définir les options globales
vim.g.nord_contrast = false                   -- Activer un fond différent pour les barres latérales (Valeur par défaut)
vim.g.nord_borders = false                    -- Désactiver les bordures visibles entre les fenêtres (Valeur par défaut)
vim.g.nord_disable_background = false         -- Utilise le fond du terminal
vim.g.nord_cursorline_transparent = false     -- Garder la cursorline transparente (Valeur par défaut)
vim.g.nord_enable_sidebar_background = false  -- Activer le fond pour les barres latérales (Valeur par défaut)
vim.g.nord_italic = true                      -- Activer les textes en italique (Valeur par défaut)
vim.g.nord_uniform_diff_background = true     -- Activer un fond uniforme pour le mode diff
vim.g.nord_bold = true                        -- Activer les textes en gras (Valeur par défaut)

-- Charger le thème Nord
require('nord').set()

