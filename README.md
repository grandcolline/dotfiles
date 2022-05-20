# dotfiles

my config files...

## Used Things

|                         Name                          | What                                      | How to Install         |
| :---------------------------------------------------: | :---------------------------------------- | ---------------------- |
|           [Git](https://github.com/git/git)           | version-control system                    | `brew install git`     |
| [FishShell](https://github.com/fish-shell/fish-shell) | main command line shell                   | `brew install fish`    |
|      [NeoVim](https://github.com/neovim/neovim)       | main editor                               | `brew install neovim`  |
|         [tmux](https://github.com/tmux/tmux)          | terminal multiplexer                      | `brew install tmux`    |
|    [zoxide](https://github.com/ajeetdsouza/zoxide)    | tool for quick access to directories      | `brew install zoxide`  |
|        [fzf](https://github.com/junegunn/fzf)         | fuzzy finder for terminal & vim           | `brew install fzf`     |
|          [fd](https://github.com/sharkdp/fd)          | file search                               | `brew install fd`      |
|   [ripgrep](https://github.com/BurntSushi/ripgrep)    | tool for recursively searches directories | `brew install ropgrep` |
|                        expect                         |                                           | `brew install expext`  |
|           [gh](https://github.com/cli/cli)            | GitHub on the command line                | `brew install gh`      |
|        [mycli](https://github.com/dbcli/mycli)        | terminal client for MySQL                 | `brew install mycli`   |
|          [zx](https://github.com/google/zx)           | script                                    | `npm install -g zx`    |

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

## SSH先にとりま設定入れようぜスクリプト

```bash
curl -sL -o ${HOME}/.vimrc https://raw.githubusercontent.com/grandcolline/dotfiles/main/vimrc

```
