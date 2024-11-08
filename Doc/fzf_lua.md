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

### Rechercher des motifs dans les fichiers

- **grep** : Pour trouver du texte ou du code dans un fichier à l'aide d'un motif
- **grep_last** : Relance la dernière recherche (dernier motif) effectuée avec **grep**
- **grep_cword** : Recherche lancer à partir du motif sous le curseur
- **grep_visual** : Recherche le motif sélectionné depuis le mode *visual*
- **grep_project** : Recherche le motif (via Rg) dans toutes les lignes des fichiers du projet
- **grep_curbuf** : Recherche le motif (via Rg) dans toutes les lignes du buffer actif
- **grep_quickfix** : Recherche un motif dans la liste *quickfix* de *Neovim* (erreurs et avertissements)
- **lgrep_curbuf** : Similaire à **grep_curbuf** mais en mode live (bien plus visuel)
- **lgrep_quickfix** : Similaire à **grep_quickfix** mais en mode live (bien plus visuel)
- **grep_live** : Rechercher un motif dans un fichier en mode live
- **grep_live_resume** : Dernière recherche du mode live (permet de repartir avec le même motif)
- **greo_live_native** : Similaire à **grep_live**, mais plus performant pour de grands projets




