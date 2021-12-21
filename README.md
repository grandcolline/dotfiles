# dotfiles

my config files...

## Used Things

| Name | What | How to Install |
|:----:|:-----|:---------------|
|[Git](https://github.com/git/git)|version-control system|`nix-env -i git`|
|[FishShell](https://github.com/fish-shell/fish-shell)|main command line shell|`nix-env -i fish`|
|[NeoVim](https://github.com/neovim/neovim)|main editor|`nix-env -i neovim`|
|[tmux](https://github.com/tmux/tmux)|terminal multiplexer|-|
|[zoxide](https://github.com/ajeetdsouza/zoxide)|tool for quick access to directories|`nix-env -iA nixpkgs.zoxide`|
|[fzf](https://github.com/junegunn/fzf)|fuzzy finder for terminal & vim|`nix-env -i fzf`|
|[fd](https://github.com/sharkdp/fd)|file search|`nix-env -i fd`|
|[ripgrep](https://github.com/BurntSushi/ripgrep)|tool for recursively searches directories|`nix-env -i ripgrep`|
|expect||`nix-env -i expect`|
|[gh](https://github.com/cli/cli)|GitHub on the command line|-|
|[mycli](https://github.com/dbcli/mycli)|terminal client for MySQL|`nix-env -i mycli`|


## Setup

```fish
set -x XDG_CONFIG_HOME $HOME/.config && sh ./setup.sh
```

## Terminal

[Alacritty](https://github.com/alacritty/alacritty)

※ 現在、リリース版だと日本語のインライン入力ができないため、masterブランチをビルドする。

```bash
$ git clone git@github.com:alacritty/alacritty.github
$ cd alacritty
$ make app
```

## Font

[JetBrains Mono NL](https://www.jetbrains.com/lp/mono/)
<!-- [Ricty Diminished with icons](https://github.com/iij/fontmerger/tree/master/sample) -->

