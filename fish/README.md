# fish

## fishのオレオレ設定.

### プラグイン

## 初期設定

### fishとfishermanのインストール

```
# fish
$ brew update
$ brew install fish
# fisherman
$ curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
```

### powerlineFontのインストール

```
$ mkdir ~/powerline
$ cd ~/powerline
$ git clone https://github.com/powerline/fonts
$ cd fonts
$ ./install.sh
$ sudo rm -r ~/powerline
```

iTermのFontをpowerlineに対応したのもに変更する

### ログインシェル変更

```
$ which fish
/usr/local/bin/fish
$ sudo vi /etc/shells
# /usr/local/bin/fishを追加
$ chsh -s /usr/local/bin/fish
```

### プラグイン追加

```
$ fisher metro             // powerlineプロンプト 
$ fisher edc/bass　　　　　// bashコマンドを使えるように
$ fisher fishgretel/fasd   // fasdプラグイン
```
### configの設定

```
$ ln -vsfn $HOME/.dotfiles/fish/config.fish $HOME/.config/fish/config.fish
```


