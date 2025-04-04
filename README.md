<samp>

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

## Setup

```fish
set -x XDG_CONFIG_HOME $HOME/.config && bash ./scripts/setup/dotfile.sh
```

<details>
<summary>Linux Server</summary>

### 1. Setup bashrc

```bash
curl -o $HOME/.bashrc https://raw.githubusercontent.com/grandcolline/dotfiles/main/bashrc && source $HOME/.bashrc
```

### 2. Install development tool

```bash
curl https://raw.githubusercontent.com/grandcolline/dotfiles/main/scripts/setup/linux.sh | bash
```

### 3. Setup dotfiles

```bash
fish
cd ~/develop/src/github.com/grandcolline/dotfiles
set -x XDG_CONFIG_HOME $HOME/.config && bash ./scripts/setup/dotfile.sh
echo "set -x PC_NAME 'リモートPC'" > $HOME/.config/fish/conf.d/remote.local.fish
```

### 4. Create GitHub keys

```bash
ssh-keygen -t ed25519
nvim ~/.ssh/config
# Host github github.com
#   HostName github.com
#   IdentityFile ~/.ssh/id_ed25519
#   User git

chmod 644 ~/.ssh/config
```

and register pub key in [here](https://github.com/settings/keys).

### 4. Install Docker (if you need docker)

```bash
curl https://raw.githubusercontent.com/grandcolline/dotfiles/main/scripts/setup/linux.docker.sh | bash
```

</details>

## Terminal

[Ghostty](https://ghostty.org/) / [wezterm](https://wezfurlong.org/wezterm/)

## Font

[JetBrainsMonoNL Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures)

<!-- [Ricty Diminished with icons](https://github.com/iij/fontmerger/tree/master/sample) -->

</samp>

