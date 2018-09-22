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
" 基本設定
"========================================
" 文字コード
set fenc=utf-8
set fileencoding=utf-8                               " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932        " 読み込み時の文字コードの自動判別. 左側が優先
set fileformats=unix,dos,mac                         " 改行コードの自動判別. 左側が優先
set ambiwidth=double                                 " □や○文字が崩れる問題を解決

" ファイルの保存場所など
set noswapfile                                       " swapファイルを作成しない
set autoread                                         " 編集中ファイルが書き換えられたら、自動リロード
let g:netrw_dirhistmax=0                             " netrwを履歴しない

" TODO: ファイルの保存場所設定を追記？

" クリップボードとyunk,putを共有
set clipboard=unnamed,unnamedplus
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C

" コマンドラインモード
set wildmenu wildmode=list:longest,full              " コマンドラインモードのファイル名タブ補完
set history=5000                                     " 保存するコマンド履歴の数

" マウス操作オン
set mouse=a



"========================================
" VIEW
"========================================
set number                       " 行番号表示
set cursorline                   " 行のハイライト
set showmatch                    " 対応括弧のハイライト
set matchtime=3                  " 対応括弧のハイライトを3秒に

hi clear CursorLine

" 不可視文字の表示設定
" set list
" set listchars=tab:>.,trail:_,extends:>,precedes:<
" highlight JpSpace cterm=underline ctermfg=7 guifg=7
" au BufRead,BufNew * match JpSpace /　/

set tabstop=4                    " タブを表示するときの幅
set shiftwidth=4                 " タブを挿入するときの幅
set noexpandtab                  " タブをタブとして扱う(スペースに展開しない)
set softtabstop=0

set foldmethod=marker            " folding
set lazyredraw                   " コマンド実行中は再描写しない
set ttyfast                      " 高速ターミナル接続

set laststatus=2                 " ステータスラインの表示
set cmdheight=1                  " メッセージ表示欄の行数
"set showtabline=2               " タブラインの表示
set ruler                        " カーソルが何行目の何列目に置かれているかを表示する


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


" =============== 以下、プラグインの設定 ================

"========================================
" dein自身 (dein)
"========================================
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('$HOME/.vim/dein')
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
  let g:rc_dir    = expand('$HOME/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未イã³ストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


"========================================
" カラースキーマ (vim-tomorrow-theme)
"========================================
syntax on
set background=dark
set t_Co=256

autocmd ColorScheme * highlight LineNr ctermfg=245
colorscheme Tomorrow-Night

"========================================
" ステータスライン (lightline)
"========================================
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
" ファイルツリー (NERDTree)
"========================================
" key bind
nnoremap <silent><C-e> :NERDTreeToggle<CR>


"========================================
" ファジー検索 (fzf)
"========================================
" 逆向きに表示
" let g:fzf_layout = { 'up': '~40%' }

" key bind
nnoremap <silent><C-f> :GFiles<CR>
nnoremap <silent><C-s> :GFiles?<CR>
nnoremap <silent><C-b> :Buffers<CR>
nnoremap <silent><C-p> :Ag<CR>

"========================================
" 補完機能 (deoplete)
"========================================
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"

"========================================
" 検索数の表示 (anzu)
"========================================
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)

" "========================================
" " ヌルヌルページ送り (comfortable-motion)
" "========================================
" "デフォルトをoff
" let g:comfortable_motion_no_default_key_mappings = 1
" 
" " UとDのみ設定
" nnoremap <silent> <C-u> :call comfortable_motion#flick(-150)<CR>
" nnoremap <silent> <C-d> :call comfortable_motion#flick(150)<CR>
