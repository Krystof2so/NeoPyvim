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

### Recherches avec *git*
Les commandes suivantes permettes d'accédder à certaines fonctionnalités de **git** en restant sur *Neovim*, donc sans avoir besoin d'ouvrir un terminal :

- **git_status** : affiche l'état des fichiers
- **git_commits** : Liste les *commits* et propose un aperçu
- **git_bcommits** : Liste uniquement les *commits* qui ont affecté le *buffer* ouvert (correspond à un historique des modifications du fichier )
- **git_blame** : Cette commande montre pour chaque ligne de code l'auteur, la date, et le hash du commit correspondant.
- **git_branches** : Permet de basculer d'une branche à l'autre

### Outils divers de recherche

- **resume** : relance la dernière recherche
- **builtin** : lancer une recherche en affichant toutes commandes intégrées
- **helptags** : Pour lancer une recherche dans la documentation de *Neovim* et des *plugins* installés
- **manpages** : Afficher des pages de manuel des commandes système
- **colorschemes** : Liste et permet de changer les schémas de couleur de *Neovim*.
- **highlights** : Permet d'effecuer une recherche parmi les groupes de *highlights*
- **commands** : Affiche toutes les commandes disponibles avec *Neovim*
- **command_history** : Affiche l'historique des commandes
- **marks** : Liste les *marks*
- **jumps** : Affiche l'historique des déplacements. Cela permet de revenir aux endroits (lignes et fichiers) précédemments visités
- **changes** : Liste les lignes précédemments modifiées dans le fichier courant
- **registers** : Affiche le contenu des registres (texte copié) et permet de l'insérer là où se situe le curseur
- **autocmds** : Affiche la liste des autocmds (commandes automatiques) actuellement en cours.
- **keymaps** : Affiche la liste des raccourcis claviers définis
- **filetypes** : Affiche la liste des fichiers reconnus par *Neovim*
- **spell_suggest** : Propose des suggestions de correction pour le mot sous le curseur

