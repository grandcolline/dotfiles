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
preztoを利用しています。
https://github.com/sorin-ionescu/prezto

**`$HOME`と`${ZDOTDIR}`が一致している前提で書かれています！**

## vim関連
TODO

