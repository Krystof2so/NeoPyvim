# fzf-lua

Le *plugin* **fzf-lua** pour *Neovim* est un outil de recherche rapide et flexible, qui utilise la bibliothèque [fzf](https://github.com/junegunn/fzf) pour effectuer des recherches et naviguer rapidement dans des fichiers, des *buffers*, des commandes, et bien plus encore.

Page [GitHub](https://github.com/ibhagwan/fzf-lua)


## Commandes 

Deux façon d'y accèder :
1. `:FzfLua commande`
2. `:FzfLua` puis choisir la commande

### Pour rechercher dans les *buffers* et les fichiers

- **buffers** : Affiche les liste des *buffers* ouverts
- **files** : Recherche de fichier dans le répertoire courant
- **oldfiles** : Recherche dans l'historique des fichiers récemments ouverts
- **lines** : Permet d'effectuer des recherches dans les lignes de fichiers ouverts, à partir d'un motif
- **blines** : Recherche dans le fichier actif (à partir d'un motif)
- **treesitter** : Recherche à partir de l'analyse syntaxique du code. Va montrer l'organisation du code
- **tabs** : Affiche les onglets ouverts
- **args** : Va permettre de définir un groupe de fichiers


