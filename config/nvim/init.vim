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
scriptencoding utf-8                      " vimrcの文字コード
set fileencoding=utf-8                    " 保存時の文字コード
set fileencodings=utf-8                   " 読み込み時の文字コードの自動判別. 左側が優先
set fileformats=unix,dos,mac              " 改行コードの自動判別. 左側が優先
" set ambiwidth=double                    " □や○が崩れる問題を解決

set backspace=2                           " more powerful backspacing

set noswapfile                            " swapファイルを作成しない
set autoread                              " 編集中ファイルが書き換えられたら、自動リロード
set undodir=$XDG_CONFIG_HOME/nvim/cache
set backupdir=$XDG_CONFIG_HOME/nvim/cache
set viminfo+=n$XDG_CONFIG_HOME/nvim/cache/nviminfo

set clipboard=unnamed,unnamedplus         " クリップボードとyunk,putを共有（unnamedplusはmacならいらないやも）
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

set pyxversion=3


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
" set hlsearch                            " 検索文字列をハイライトする
set nohlsearch                            " 検索文字列をハイライトしない
set incsearch                             " インクリメンタルサーチを行う
set ignorecase                            " 大文字と小文字を区別しない
set smartcase                             " 大文字と小文字の混在で検索した場合、大文字と小文字を区別
set wrapscan                              " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault                              " 置換の時 g オプションをデフォルトで有効にする
set inccommand=split                      " 置換のインクリメンタル表示（nvimのみ）


"========================================
" Key Mapping
"========================================
" 甘えるな、hjklを使え
noremap <Left>  <Nop>
noremap <Down>  <Nop>
noremap <Up>    <Nop>
noremap <Right> <Nop>

" Leaderを使ったKeyMapping
" デフォルトの設定をなるべく上書かないためにLeaderを使う!
let g:mapleader = "\<Space>"

nmap <Leader>b :Buffers<CR>
nmap <Leader>d :call <SID>show_documentation()<CR>
nmap <Leader>e <Plug>(coc-diagnostic-next)
nmap <Leader>E <Plug>(coc-diagnostic-prev)
nmap <Leader>f :Files<CR>
nmap <Leader>g <Plug>(coc-definition)
nmap <Leader>G <Plug>(coc-implementation)
nmap <Leader>h <Plug>GitGutterNextHunk
nmap <Leader>H <Plug>GitGutterPrevHunk
nmap <Leader>l :Lines<CR>
" nmap <Leader>n <Plug>(coc-rename)
nmap <Leader>o mzo<ESC>
nmap <Leader>O mzO<ESC>
nmap <Leader>r :Rg<CR>
nmap <Leader>s :GFiles?<CR>
nmap <Leader>v <Plug>GitGutterPreviewHunk
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader>/ <Plug>(easymotion-sn)

nmap <Leader><Tab> <C-w>w
nmap <Leader><Space> :set hlsearch!<CR>


"========================================
" Dein
"========================================
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('$XDG_CONFIG_HOME/nvim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let g:rc_dir    = expand('$XDG_CONFIG_HOME/nvim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


"========================================
" ColorScheme
"========================================
syntax on
set background=dark
set t_Co=256
autocmd ColorScheme * highlight LineNr ctermfg=245

colorscheme Tomorrow-Night


