"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
"

"========================================
" General
"========================================
set fenc=utf-8                            " 文字コード
set fileencoding=utf-8                    " 保存時の文字コード
set fileencodings=utf-8                   " 読み込み時の文字コードの自動判別. 左側が優先
set fileformats=unix,dos,mac              " 改行コードの自動判別. 左側が優先
" set ambiwidth=double                      " □や○が崩れる問題を解決

set nocompatible                          " Use Vim defaults instead of 100% vi compatibility
set backspace=2                           " more powerful backspacing

set noswapfile                            " swapファイルを作成しない
set autoread                              " 編集中ファイルが書き換えられたら、自動リロード
set undodir=$XDG_CONFIG_HOME/nvim/cache
set backupdir=$XDG_CONFIG_HOME/nvim/cache
set viminfo+=n$XDG_CONFIG_HOME/nvim/cache/nviminfo

set clipboard=unnamed,unnamedplus         " クリップボードとyunk,putを共有
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C

set wildmenu wildmode=list:longest,full   " コマンドラインモードのファイル名タブ補完
set history=5000                          " 保存するコマンド履歴の数

set mouse=a                               " マウス操作をオンにする

set foldmethod=marker                     " folding
set lazyredraw                            " コマンド実行中は再描写しない
set ttyfast                               " 高速ターミナル接続

command! Q q                              " Q => q
command! W w                              " W => w
command! WQ wq                            " WQ => wq
command! Wq wq                            " Wq => wq

set ttimeout                              " neoVim文字化け問題
set ttimeoutlen=50


"========================================
" View
"========================================
set number                                " 行番号表示
"set relativenumber                       " 相対行の表示
set cursorline                            " 行のハイライト
"set cursorcolumn                         " 列のハイライト
set showmatch                             " 対応括弧のハイライト
set matchtime=3                           " 対応括弧のハイライトを3秒に

set list                                  " 不可視文字の表示設定
" set list listchars=tab:»_,trail:-
" au BufRead,BufNew * match JpSpace /　/

set tabstop=4                             " タブを表示するときの幅
set shiftwidth=4                          " タブを挿入するときの幅
set noexpandtab                           " タブをタブとして扱う(スペースに展開しない)
set softtabstop=0
set autoindent
set breakindent                           " 折り返しを同じインデントで表示

set signcolumn=yes                        " 行番号の左側のサイズ固定

set laststatus=2                          " ステータスラインの表示
set noshowmode                            " 「-- 挿入 --」とかの非表示
set cmdheight=1                           " メッセージ表示欄の行数
"set showtabline=2                        " タブラインの表示
set ruler                                 " カーソルが何行目の何列目に置かれているかを表示する


"========================================
" Search
"========================================
set hlsearch                              " 検索文字列をハイライトする
set incsearch                             " インクリメンタルサーチを行う
set ignorecase                            " 大文字と小文字を区別しない
set smartcase                             " 大文字と小文字の混在で検索した場合、大文字と小文字を区別
set wrapscan                              " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault                              " 置換の時 g オプションをデフォルトで有効にする
set inccommand=split                      " 置換のインクリメンタル表示（nvimのみ）


"========================================
" Key Mapping
"========================================
source $XDG_CONFIG_HOME/nvim/mapping.vim

"========================================
" Plugins
"========================================
source $XDG_CONFIG_HOME/nvim/plugins.vim

