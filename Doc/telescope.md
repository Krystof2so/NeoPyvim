# telescope-nvim

**telescope.nvim** est un outil de recherche sur des listes.

#### Dépendances requises
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

#### Dépendances recommandées
- [ripgrep (rg)](https://github.com/BurntSushi/ripgrep)

#### Dépendances optionnelles
- [fd](https://github.com/sharkdp/fd)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [neovim LSP](https://neovim.io/doc/user/lsp.html)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)


## Installation avec *Lazy* :
Installation basique avec son extension `telescope-file-browser` :
```lua 
 {  -- nvim-telescope : recherche dans listes
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    file_browser = {
                        theme = "dropdown",
                        hijack_netrw = true,
                    },
                },
            })
            require("telescope").load_extension("file_browser")
        end,
    },   
```
**POURSUIVRE** [ici](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#checkhealth)



