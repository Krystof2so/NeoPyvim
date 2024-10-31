# Bufferline-Nvim

Une ligne de *buffers* (avec intégration de la tabulation) pour *Neovim* écrite en *Lua*.

Page [GitHub](https://github.com/akinsho/bufferline.nvim)

## Documentation
- Accès à l'aide complète de **bufferline** : `:h bufferline.nvim`
- Pour la configuration : `:h bufferline-configuration`
- Pour les styles : `:h bufferline-styling`
- *Hover events* : `:help bufferline-hover-events`
- *higlights*  : `:h bufferline-highlights`
- Les groupes : `:help bufferline-groups`
- Les nombres : ̀`:help bufferline-numbers`
- *Custom areas* : `:help bufferline-custom-areas`

## Configuration

- Barre d'onglets avec tous les *buffers* ouverts : Veiller à ce que dans les **options**, **mode** soit défini à **"buffers"** et non **"tabs"**.
- Les icônes de fichiers dans le 'buffer' : Par défaut, l'option `color_icons` est activée, et les icônes des types de fichiers sont colorées pour correspondre à chaque type de fichier, grâce à l'intégration de **nvim-web-devicons**. Cela aide à identifier rapidement le type de fichier de chaque 'buffer'.

## Mapping
- **<Tab>** et **<Shift + Tab>** : passer d'un buffer à l'autre (navigation au niveau des onglets)
- **<Espace + bd>** : fermer le buffer ctif

