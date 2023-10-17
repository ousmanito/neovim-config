# Configuration Neovim

Ce README décrit la configuration de Neovim de l'utilisateur, en utilisant le fichier `init.lua`. Cette configuration utilise divers plugins pour améliorer l'expérience d'édition dans Neovim.

## Installation

Avant d'utiliser cette configuration, assurez-vous d'avoir Neovim installé sur votre système. Vous pouvez le télécharger depuis [le site officiel](https://neovim.io/).

### Installation des plugins

La configuration de Neovim utilise un gestionnaire de plugins appelé [lazy.nvim](https://github.com/folke/lazy.nvim). Lors de la première utilisation, il s'assurera que les plugins nécessaires sont installés. Pour ce faire, exécutez Neovim et exécutez la commande suivante :

```vim
:PaqInstall
```

Cela téléchargera et installera tous les plugins définis dans le fichier `init.lua`.

## Fonctionnalités clés

### Gestion des fichiers

- Le leader key a été défini comme `<espace>`.
- Utilisation du plugin `nvim-tree` pour gérer les fichiers et dossiers.

### Édition de code

- Utilisation de la complétion automatique avec le plugin `nvim-cmp`.
- Prise en charge des snippets avec `LuaSnip`.
- Prise en charge de LSP (Language Server Protocol) avec `nvim-lspconfig` pour une meilleure intégration avec les langages de programmation.
- Gestion des diagnostics avec des raccourcis clavier définis.

### Interface utilisateur

- Thème Tokyo Night activé avec `tokyonight.nvim`.
- Utilisation de `lualine.nvim` pour personnaliser la ligne d'état.
- Configuration des espaces vides avec `indent-blankline.nvim`.
- Gestion des commentaires avec `Comment.nvim`.
- Recherche rapide de fichiers et de symboles avec `telescope.nvim`.
- Support de la coloration syntaxique et des textobjects avec `nvim-treesitter`.

## Raccourcis clavier

Certains raccourcis clavier utiles sont définis pour améliorer l'efficacité de l'édition de code. Vous pouvez les personnaliser dans votre fichier `init.lua` en fonction de vos préférences.

- `<espace>` est défini comme le leader key.
- Utilisation de `<leader>?` pour trouver les fichiers récemment ouverts avec `telescope`.
- Utilisation de `<leader><espace>` pour trouver des fichiers existants avec `telescope`.
- Utilisation de `<leader>/` pour rechercher dans le fichier en cours avec `telescope`.
- Utilisation de `<leader>gf` pour rechercher des fichiers Git avec `telescope`.
- Utilisation de `<leader>sg` pour rechercher par grep avec `telescope`.
- Utilisation de `<leader>sd` pour rechercher des diagnostics avec `telescope`.
- Utilisation de `<leader>rn` pour renommer avec LSP.
- Utilisation de `<leader>ca` pour les actions de code avec LSP.
- Utilisation de `gd` pour aller à la définition avec LSP.
- Utilisation de `gr` pour rechercher des références avec LSP.
- Utilisation de `gI` pour aller à l'implémentation avec LSP.
- Utilisation de `<leader>D` pour aller à la définition de type avec LSP.
- Utilisation de `<leader>ds` pour rechercher des symboles de document avec LSP.
- Utilisation de `<leader>ws` pour rechercher des symboles de l'espace de travail avec LSP.
- Utilisation de `[d` pour aller au message de diagnostic précédent.
- Utilisation de `]d` pour aller au message de diagnostic suivant.
- Utilisation de `<leader>e` pour ouvrir le message de diagnostic flottant.
- Utilisation de `<leader>q` pour ouvrir la liste de diagnostics.
- Utilisation de `<Tab>` et `<S-Tab>` pour la navigation dans la complétion et les snippets.

## Snippets

La configuration inclut des snippets pour de nombreux langages de programmation. Vous pouvez ajouter vos propres snippets dans le dossier `~/.config/nvim/snippets`.

Pour mettre à jour les snippets, vous pouvez utiliser la commande suivante :

```vim
:source ~/.config/nvim/snippets/all.lua
```

## Conclusion

Cette configuration Neovim offre une expérience d'édition puissante et personnalisée pour les développeurs. N'hésitez pas à explorer et personnaliser davantage selon vos besoins spécifiques.


## Licence

Cette configuration Neovim est sous licence MIT. Vous êtes libre de l'utiliser, de la modifier et de la distribuer conformément à cette licence.

---
