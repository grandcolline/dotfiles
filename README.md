# dotfiles

my config files...

## Used Things

| Name                                             | What                                      |
| :----------------------------------------------- | :---------------------------------------- |
| [Git](https://github.com/git/git)                | version-control system                    |
| [Fish](https://github.com/fish-shell/fish-shell) | main command line shell                   |
| [NeoVim](https://github.com/neovim/neovim)       | main editor                               |
| [tmux](https://github.com/tmux/tmux)             | terminal multiplexer                      |
| [zoxide](https://github.com/ajeetdsouza/zoxide)  | tool for quick access to directories      |
| [fzf](https://github.com/junegunn/fzf)           | fuzzy finder for terminal & vim           |
| [fd](https://github.com/sharkdp/fd)              | file search                               |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | tool for recursively searches directories |
| expect                                           |                                           |
| [gh](https://github.com/cli/cli)                 | GitHub on the command line                |
| [mycli](https://github.com/dbcli/mycli)          | terminal client for MySQL                 |
| [zx](https://github.com/google/zx)               | script                                    |

## Setup

```fish
set -x XDG_CONFIG_HOME $HOME/.config && sh ./setup.sh
```

## Terminal

[Alacritty](https://github.com/alacritty/alacritty)

※ 現在、リリース版だと日本語のインライン入力ができないため、master ブランチをビルドする。

```bash
$ git clone git@github.com:alacritty/alacritty.github
$ cd alacritty
$ make app
```

## Font

[JetBrainsMonoNL Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures)

<!-- [JetBrains Mono NL](https://www.jetbrains.com/lp/mono/) -->
<!-- [Ricty Diminished with icons](https://github.com/iij/fontmerger/tree/master/sample) -->

## script for remote server

```bash
curl -sL -o ${HOME}/.vimrc https://raw.githubusercontent.com/grandcolline/dotfiles/main/vimrc
```
