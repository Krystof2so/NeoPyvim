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
        "mfussenegger/nvim-dap-python",  -- Extension spécifique au langage 'Python'
        "nvim-neotest/nvim-nio", -- Dépendance obligatoire pour nvim-dap-ui
      },
      config = function()
        require("plugins.dap")
      end,
},
```

Les extensions spécifiques aux langages fournissent des fonctions prêtes à l’emploi. Elles sont souvent mieux maintenues que des *setups* manuels et gèrent parfois des détails complexes comme les chemins, options, etc. Il est recommandé d’utiliser ces extensions plutôt qu’une configuration manuelle si elles existent. 

Il nous faut également installer un adaptateur **DAP** pour Python : [debugpy](https://github.com/microsoft/debugpy/). **nvim-dap** fournit l'interface, mais pas le débogueur. Ce sont les adaptateurs **DAP** qui font le travail.

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

## Utilisation :
- Mettre un *breakpoint* (`<Leader>b`) sur une ligne.
- Lancer le débogage avec `<F5>`.
- Observer les variables à l'aide de `dap-ui` (automatiquement ouvert).
- Utiliser `<F10>`, `<F11>` pour naviguer.


## *nvim-dap*
[nvim-dap](https://github.com/mfussenegger/nvim-dap) (pour *Neovim Debug Adapter Protocol*) est un *plugin* qui permet d’ajouter des fonctionnalités de débogage interactif à l'éditeur, en s'appuyant sur le protocole **DAP** (*Debug Adapter Protocol*). Ce protocole, introduit par Microsoft, permet d'interfacer un éditeur de texte avec différents débogueurs à travers une API standardisée.

**nvim-dap** permet de :
- Poser des points d'arrêt (*breakpoints*)
- Lancer des programmes en mode débogage
- Suivre l'exécution ligne par ligne
- Consulter les variables locales, globales, la pile d'appels, etc.
- Envoyer des expressions à évaluer à la volée
- Interagir avec différents langages via leurs adaptateurs DAP

### Fonctionnalités principales
| Fonction                                | Description                       |
| --------------------------------------- | --------------------------------- |
| `:lua require'dap'.continue()`          | Lance ou continue le programme    |
| `:lua require'dap'.step_over()`         | Passe à l’instruction suivante    |
| `:lua require'dap'.step_into()`         | Entre dans la fonction            |
| `:lua require'dap'.toggle_breakpoint()` | Active/désactive un point d'arrêt |
| `:lua require'dap'.repl.open()`         | Ouvre le terminal interactif      |

### Flux typique d'Utilisation
1. Définir un point d'arrêt : `require'dap'.toggle_breakpoint()` (commande *Lua*).
2. Lancer la session de débogage : le programme commence à s’exécuter sous le contrôle du débogueur. S’il rencontre un point d’arrêt, il s’arrête là. `require'dap'.continue()` (commande *Lua*).
3. Avancer pas à pas dans le code : `require'dap'.step_over()` (passe à la ligne suivante sans entrer dans les fonctions) ou `require'dap'.step_into()` (entre dans la fonction appelée).

## *nvim-dap-ui*
[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) est un *plugin* qui fournit une interface utilisateur graphique complète pour le débogueur **nvim-dap**. Il transforme **Neovim** de façon à le doter d'un environnement de débogage visuel proche d’un IDE moderne tel que **VSCode** ou **PyCharm**.

Cette interface utilisateur modulaire affiche les informations essentielles du débogage sous forme de fenêtres. Parmi ces informations on retrouve :
- Les *scopes* : Affiche les variables locales/globales visibles.
- Les *stacktrace* : Affiche la pile d'appels courante.
- Les points d'arrêt : Liste tous les points d'arrêt actifs.
- Un REPL intégré : Interface pour interagir avec le débogueur via le terminal.
- Les *threads* et autres informations *runtime*.

Il s'agit d'une UI dynamique qui peut s’ouvrir/fermer automatiquement selon les événements DAP.



