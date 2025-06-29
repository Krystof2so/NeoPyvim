# nvim-dap

Un IDE moderne se doit d'avoir sont déboggeur d'intégré. Pour intégrer un déboggeur pour le langage Python, nous allons faire appel aux plugins [nvim-dap](https://github.com/mfussenegger/nvim-dap), [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python), [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) (Un UI pour **nvim-dap**) et [nvim-nio](https://github.com/nvim-neotest/nvim-nio) (bibliothèque pour les IO asynchrones dans **Neovim**).

Nous allons ainsi obtenir un débogage interactif (*breakpoints*, affichage du contenu des variables, etc.).

## Installation et configuration
### Installation
Dans `lua/core/plugins.lua`, on va ajouter les lignes suivantes :

```lua
{
      "mfussenegger/nvim-dap",
      dependencies = {
        "rcarriga/nvim-dap-ui",     -- Interface visuelle pour le débogueur
        "mfussenegger/nvim-dap-python",
        "nvim-neotest/nvim-nio", -- Dépendance obligatoire pour nvim-dap-ui
      },
      config = function()
        require("plugins.dap")
      end,
    },
```

Il nous faut également installer [debugpy](https://github.com/microsoft/debugpy/)

```zsh
$ python3 -m venv ~/.virtualenvs/debugpy
$ ~/.virtualenvs/debugpy/bin/pip install debugpy
```

### Configuration
Dans `lua/plugins/dap.lua` :

```lua
local dap = require("dap")
local dapui = require("dapui")

-- UI configuration
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Python debugger setup (change le chemin si besoin)
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
```

Puis, pour le mapping, dans `lua/core/keymaps` :
```lua
-- **************************************
-- * Groupe de mappage pour le débogage *
-- **************************************
vim.keymap.set("n", "<F5>", function() require("dap").continue() end)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>B", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Breakpoint conditionnel" })
```

## Utilisattion :
- Mettre un *breakpoint* (`<Leader>b`) sur une ligne.
- Lancer le débogage avec `<F5>`.
- Observer les variables à l'aide de `dap-ui` (automatiquement ouvert).
- Utiliser `<F10>`, `<F11>` pour naviguer.


