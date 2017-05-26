#!/bin/zsh
###############################
##        リンク貼る         ##
###############################
# Vim関連
DOT_FILES=(gitconfig vimrc vim gvimrc)
for file in ${DOT_FILES[@]}
do
	ln -s -f $HOME/.dotfiles/$file $HOME/.$file
done

# zsh, prezto関連
z_DOT_FILES=(zlogin preztorc zshenv zshrc zprofile)
for zfile in ${z_DOT_FILES[@]}
do
	ln -s -f $HOME/.dotfiles/prezto/runcoms/$zfile $HOME/.$zfile
done


###############################
##       ファイル作成        ##
###############################
# PCごとに管理するファイルのコピー
cp $HOME/.dotfiles/zshrc.local.defalt $HOME/.dotfiles/zshrc.local
cp $HOME/.dotfiles/gitconfig.local.defalt $HOME/.dotfiles/gitconfig.local

# PCごとに管理するファイルの作成
mkdir $HOME/.dotfiles/.cache
mkdir $HOME/.dotfiles/.cache/vim-undo
mkdir $HOME/.dotfiles/.cache/vim-backup
mkdir $HOME/.dotfiles/.cache/dein
#touch $HOME/.dotfiles/.cache/chpwd-recent-dirs
#touch $HOME/.dotfiles/.cache/peco-cd-file
touch $HOME/.dotfiles/.cache/zhistory
touch $HOME/.dotfiles/.cache/viminfo

# dein
mkdir -p $HOME/.dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git $HOME/.dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim


###############################
##       インストール        ##
###############################
# 必要なものをbrew install
brew update
brew install peco
brew install tree
brew install fasd
brew install rmtrash
brew install jq
# brew install tig


###############################
##          neoVim           ##
###############################
# brew install
brew install neovim/neovim/neovim
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim


