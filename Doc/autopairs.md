# nvim-autopairs

Dépôt [GitHub](https://github.com/windwp/nvim-autopairs)

## Présentation

Le *plugin* **nvim-autopairs** est conçu pour ajouter automatiquement des paires de caractères, comme les parenthèses `()`, les crochets `[]`, les accolades `{}`, ou les guillemets `""` et `''`. Ce *plugin* facilite le codage en réduisant les erreurs liées à la fermeture manuelle de ces caractères.

- Lorsqu'un caractère ouvrant est tapé (comme `(`, `[`, `{`, `"`, ou `'`), le caractère fermant correspondant est automatiquement inséré.
- Lorsque l'on supprime un caractère ouvrant, le caractère fermant correspondant est également supprimé.
- Il est possible de définir des comportements spécifiques pour des caractères ou des situations particulières.
- Il peut être intégré avec nvim-cmp pour gérer les paires dans les complétions automatiques.

## Installation

```lua
{
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {}
  end,
}
```

## Valeurs par défaut

```lua
{
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    -- Désactive le plugin pour les types de fichiers spécifiés (ici "TelescopePrompt" et "spectre_panel").

    disable_in_macro = true,
    -- Désactive le plugin lors de l'enregistrement ou de l'exécution d'une macro.

    disable_in_visualblock = false,
    -- Ne désactive PAS le plugin lors de l'insertion après avoir utilisé le mode "visual block".

    disable_in_replace_mode = true,
    -- Désactive le plugin en mode remplacement.

    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    -- Ignore les caractères suivants après l'insertion d'une paire, pour éviter des conflits.
    -- Par exemple, les mots, %, ', [, ", ., `, $.

    enable_moveright = true,
    -- Permet de déplacer le curseur vers la droite lorsque le caractère de fermeture est déjà présent.

    enable_afterquote = true,
    -- Active l'ajout de paires (comme des parenthèses ou accolades) après une citation (ex. : " ou ').

    enable_check_bracket_line = true,
    -- Vérifie que la paire de parenthèses ou accolades se trouve sur la même ligne.

    enable_bracket_in_quote = true,
    -- Permet d'insérer des paires même si le curseur se trouve à l'intérieur de guillemets.

    enable_abbr = false,
    -- Désactive les abréviations automatiques (non liées aux paires).

    break_undo = true,
    -- Active la séparation des séquences d'annulation pour les règles de base.

    check_ts = false,
    -- Désactive l'intégration avec Treesitter par défaut.

    map_cr = true,
    -- Mappe la touche <CR> (Entrée) pour automatiquement compléter les paires.

    map_bs = true,
    -- Mappe la touche <BS> (Retour arrière) pour supprimer les paires automatiquement.

    map_c_h = false,
    -- Ne mappe PAS la touche <C-h> pour supprimer une paire.

    map_c_w = false,
    -- Ne mappe PAS la touche <C-w> pour supprimer une paire si possible.
}
```

## Intégration entre **nvim-autopairs** et **nvim-cmp**

L’objectif principal est d’ajouter automatiquement des caractères comme `(` après la sélection d'une fonction ou méthode via la complétion.

### Ajout d'un *mapping* à **<CR>**

Cela signifie que lorsque l'on presse la touche Entrée (`<CR>`) pour valider une suggestion de complétion, **nvim-autopairs** insérera automatiquement une paire de parenthèses si l'élément validé est une fonction ou une méthode.


