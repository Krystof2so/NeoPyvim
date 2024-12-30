# Mason

## Introduction

**Mason** est un *plugin* **Neovim** qui permet d'installer et gérer facilement les serveurs LSP, les serveurs DAP, les linters et les formateurs à travers une interface unique.

Voir la [liste](https://mason-registry.dev/registry/list) de tous les paquets disponibles.

*Plugins* additionnels recommandés :
- LSP : [lspconfig](https://github.com/neovim/nvim-lspconfig) & [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- DAP : [nvim-dap](https://github.com/mfussenegger/nvim-dap) & [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- *Linters* : [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) ou [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- Formateurs : [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) ou [formatter.nvim](https://github.com/mhartington/formatter.nvim)


Extensions pour **Mason** :
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)
- [mason-update-all](https://github.com/RubixDev/mason-update-all)
- [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)


## Commandes

- `:Mason` - ouvre une fenêtre d'état graphique
- `:MasonUpdate` - met à jour tous les registres gérés
- `:MasonInstall <package> ...` - installe/réinstalle les paquets fournis
- `:MasonUninstall <package> ...` - désinstalle les paquets fournis
- `:MasonUninstallAll` - désinstalle tous les paquets
- `:MasonLog` - ouvre le fichier journal *mason.nvim* dans un nouvel onglet


## Commandes de l'interface

- Déplier/plier un package : `Entrée`
- Installer un package : `i`
- Mettre à jour un package : `u`
- Vérifier la version d'un package : `c`
- Mettre à jour tous les packages : `U` 
- Vérifier les packages obsolètes : `C`
- Désinstaller un package : `X`
- Annuler une installation : `Ctrl + c`
- Appliquer un filtre par langue : `Ctrl + f` 
- Afficher/masquer le journal d'installation : `Entrée` 
- Afficher/masquer l'aide : `g?` 

