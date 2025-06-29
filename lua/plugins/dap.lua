local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
  -- Champs manquants ajoutés ici ↓↓↓
  element_mappings = {}, -- Définir des mappings propres à chaque élément ici
  expand_lines = true,   -- Permet d’expandre les valeurs multi-lignes (à laisser true)
  force_buffers = true,  -- Force dap-ui à utiliser des buffers (sinon certains bugs UI)
  control = {
    enabled = true,      -- Montre les boutons d'exécution dans la UI
    element = "repl",    -- Où afficher les boutons (ex: dans la REPL)
    icons = {
      pause = "⏸",
      play = "▶️",
      step_into = "⤵️",
      step_over = "⤼",
      step_out = "⤴️",
      step_back = "⏮️",
      run_last = "↻",
      terminate = "⏹",
    },
  },

  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },

  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.4 },
        { id = "breakpoints", size = 0.2 },
        { id = "stacks", size = 0.2 },
        { id = "watches", size = 0.2 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },

  floating = {
    max_height = nil,
    max_width = nil,
    border = "rounded",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },

  windows = { indent = 1 },

  render = {
    max_type_length = nil,
    max_value_lines = 100,
  },
})



-- Ouvre l'UI au démarrage de la session
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- Ferme l'UI à la fin de la session
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Python debugger setup (change le chemin si besoin)
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")


-- Keymaps personnalisés
vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle UI" })
vim.keymap.set("n", "<leader>df", function()
  dapui.float_element("scopes", { enter = true })
end, { desc = "Fenêtre flottante : Scopes" })
vim.keymap.set("n", "<leader>de", function() dapui.eval() end, { desc = "Évaluer expression" })
