# dotfiles

## 手順
```
$ brew update
```
### Ricty for powerlineのインストール
```
$ brew tap sanemat/font
$ brew install --vim-powerline ricty
$ cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
$ fc-cache -vf
```
iTermのフォントをRicty for powerlineにする

### zshをログインシェルに
```
$ chsh -s /bin/zsh
```

### クローン
```
$ cd ~
$ git clone --recursive git@github.com:grandcolline/dotfiles.git ".dotfiles"
$ ~/.dotfiles/setup.sh
```

## zsh関連
prezto。
https://github.com/sorin-ionescu/prezto

`${ZDOTDIR}`が`$HOME`である前提で書かれてます。違うとエラー出るかも...

## vim関連

neoVim

プラグインはdeinで。
