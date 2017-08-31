#!/bin/zsh

if [ ! -f "$HOME/.dotfiles/zshrc.local" ]; then
	cp $HOME/.dotfiles/.zshrc.local.defalt $HOME/.dotfiles/zshrc.local
fi

if [ ! -f "$HOME/.dotfiles/gitconfig.local" ]; then
	cp $HOME/.dotfiles/.gitconfig.local.defalt $HOME/.dotfiles/gitconfig.local
fi

if [ ! -d "$HOME/.config" ]; then
	mkdir $HOME/.config
fi

if [ ! -d "$HOME/.dotfiles/.cache" ]; then
	mkdir $HOME/.dotfiles/.cache
	mkdir $HOME/.dotfiles/.cache/vim-undo
	mkdir $HOME/.dotfiles/.cache/vim-backup
	mkdir $HOME/.dotfiles/.cache/dein
	touch $HOME/.dotfiles/.cache/zhistory
	touch $HOME/.dotfiles/.cache/viminfo
fi

if [ ! -d "$HOME/.dotfiles/nvim/dein" ];then
	mkdir -p $HOME/.dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim
	git clone https://github.com/Shougo/dein.vim.git $HOME/.dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim
fi


ln -vsf $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -vsf $HOME/.dotfiles/prezto/runcoms/zlogin $HOME/.zlogin
ln -vsf $HOME/.dotfiles/prezto/runcoms/zpreztorc $HOME/.zpreztorc
ln -vsf $HOME/.dotfiles/prezto/runcoms/zshenv $HOME/.zshenv
ln -vsf $HOME/.dotfiles/prezto/runcoms/zshrc $HOME/.zshrc
ln -vsf $HOME/.dotfiles/prezto/runcoms/zprofile $HOME/.zprofile
ln -vsfn $HOME/.dotfiles/nvim $HOME/.config/nvim
ln -vsfn $HOME/.dotfiles/peco $HOME/.config/peco


brew update
brew tap Homebrew/bundle
brew bundle
