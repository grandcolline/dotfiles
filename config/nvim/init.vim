"========================================
" 初期設定
"========================================
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup



"========================================
" プラグイン(dein)
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
  let g:rc_dir    = expand('$XDG_CONFIG_HOME/nvim/rc')
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
" 基本設定
"========================================
" 文字コード
set fenc=utf-8
set fileencoding=utf-8                          " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932   " 読み込み時の文字コードの自動判別. 左側が優先
set fileformats=unix,dos,mac                    " 改行コードの自動判別. 左側が優先
set ambiwidth=double                            " □や○文字が崩れる問題を解決

" ファイルの保存場所など
set noswapfile                                  " swapファイルを作成しない
set autoread                                    " 編集中ファイルが書き換えられたら、自動リロード
set undodir=$HOME/.cache/vim-undo     " undo(test.txt.un~)
set backupdir=$HOME/.cache/vim-backup " bachup(test.txt~)
set viminfo+=n$HOME/.cache/nviminfo   " viminfo

" クリップボードとyunk,putを共有
set clipboard=unnamed,unnamedplus
"set clipboard+=unnamedplus

" 削除キーではyunkしない
"nnoremap D "_D
"nnoremap d "_d
nnoremap x "_x
nnoremap C "_C
nnoremap c "_c

set wildmenu wildmode=list:longest,full         " コマンドラインモードのファイル名タブ補完
set history=5000                                " 保存するコマンド履歴の数

set ttimeout                                    " neoVim文字化け問題
set ttimeoutlen=50


"========================================
" カラースキーマ
"========================================
syntax enable
"set background=dark

autocmd ColorScheme * highlight LineNr ctermfg=245
colorscheme Tomorrow-Night
"colorscheme nefertiti
"colorscheme amcolors
"colorscheme lucius


"========================================
" 検索関連
"========================================
set hlsearch      " 検索文字列をハイライトする
set incsearch     " インクリメンタルサーチを行う
set ignorecase    " 大文字と小文字を区別しない
set smartcase     " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan      " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault      " 置換の時 g オプションをデフォルトで有効にする


"========================================
" Key Binds
"========================================
" マッチウインドウ
nnoremap <C-]> g<C-]>
" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>


"========================================
" VIEW
"========================================
set number             " 行番号表示
set cursorline         " 行のハイライト
"hi clear CursorLine
set showmatch          " 対応括弧のハイライト

set list               " 不可視文字表示
" set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
" highlight JpSpace cterm=underline ctermfg=7 guifg=7 " 全角スペースの可視化
" au BufRead,BufNew * match JpSpace /　/

set display=uhex       " 印字不可能文字を16進数で表示

set tabstop=4          " タブを表示するときの幅
set shiftwidth=4       " タブを挿入するときの幅
set noexpandtab        " タブをタブとして扱う(スペースに展開しない)
set softtabstop=0

set foldmethod=marker  " folding
set lazyredraw         " コマンド実行中は再描写しない
set ttyfast            " 高速ターミナル接続

set laststatus=2       " ステータスラインの表示
set cmdheight=1        " メッセージ表示欄の行数
"set showtabline=2     " タブラインの表示
set ruler              " カーソルが何行目の何列目に置かれているかを表示する


" プロンプトの設定
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }



"========================================
" ctrl + p
"========================================
" マッチウインドウ 「下部に表示, 大きさ10行で固定, 検索結果100件」
let g:ctrlp_match_window = 'order:ttb,min:10,max:10,results:100'
let g:ctrlp_show_hidden = 1    " ドットファイルも検索対象に



