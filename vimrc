"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
"

"========================================
" General
"========================================
set fenc=utf-8                                " 文字コード
set fileencoding=utf-8                        " 保存時の文字コード
set fileencodings=utf-8,ucs-boms,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先
set fileformats=unix,dos,mac                  " 改行コードの自動判別. 左側が優先
set ambiwidth=double                          " □や○が崩れる問題を解決

set nocompatible                              " Use Vim defaults instead of 100% vi compatibility
set backspace=2                               " more powerful backspacing

set noswapfile                                " swapファイルを作成しない
set autoread                                  " 編集中ファイルが書き換えられたら、自動リロード
let g:netrw_dirhistmax=0                      " netrwを履歴しない

set clipboard=unnamed,unnamedplus             " クリップボードとyunk,putを共有
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C

set wildmenu wildmode=list:longest,full       " コマンドラインモードのファイル名タブ補完
set history=5000                              " 保存するコマンド履歴の数

set mouse=a                                   " マウス操作をオンにする

set foldmethod=marker                         " folding
set lazyredraw                                " コマンド実行中は再描写しない
set ttyfast                                   " 高速ターミナル接続

command! Q q                                  " Q => q
command! W w                                  " W => w
command! WQ wq                                " WQ => wq
command! Wq wq                                " Wq => wq

"========================================
" View
"========================================
set number                                    " 行番号表示
set relativenumber                            " 相対行の表示
set cursorline                                " 行のハイライト
"set cursorcolumn                             " 列のハイライト
set showmatch                                 " 対応括弧のハイライト
set matchtime=3                               " 対応括弧のハイライトを3秒に

set list                                      " 不可視文字の表示設定
set list listchars=tab:»_,trail:-
" au BufRead,BufNew * match JpSpace /　/

set tabstop=4                                 " タブを表示するときの幅
set shiftwidth=4                              " タブを挿入するときの幅
set noexpandtab                               " タブをタブとして扱う(スペースに展開しない)
set softtabstop=0
set autoindent

set laststatus=2                              " ステータスラインの表示
set cmdheight=1                               " メッセージ表示欄の行数
"set showtabline=2                            " タブラインの表示
set ruler                                     " カーソルが何行目の何列目に置かれているかを表示する

if has('vim_starting')
  let &t_SI .= "\e[6 q"                       " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_EI .= "\e[2 q"                       " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_SR .= "\e[4 q"                       " 置換モード時に非点滅の下線タイプのカーソル
endif


"========================================
" Search
"========================================
set hlsearch                                  " 検索文字列をハイライトする
set incsearch                                 " インクリメンタルサーチを行う
set ignorecase                                " 大文字と小文字を区別しない
set smartcase                                 " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan                                  " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault                                  " 置換の時 g オプションをデフォルトで有効にする


"========================================
" Key Binds
"========================================
let mapleader = "\<Space>"                   " LeaderをSpaceキーにする
nnoremap <C-]> g<C-]>                        " For ctags


"========================================
" Plugins
"========================================
"=== Dein ===============================
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

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"=== ColorScheme ========================
syntax on
set background=dark
set t_Co=256

autocmd ColorScheme * highlight LineNr ctermfg=245
colorscheme Tomorrow-Night

"=== lightline ==========================
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

"=== NERDTree ===========================
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40               " 横幅の大きさ

"=== fugitive ===========================
set updatetime=200                   " 反映されるまでの時間を変更
nmap <silent><C-h> <Plug>GitGutterNextHunk
"nmap <leader>hn <Plug>GitGutterNextHunk
"nmap <leader>hN <Plug>GitGutterPrevHunk

"=== fzf ================================
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>
nnoremap <leader>tg :BTags<CR>
nnoremap <leader>ag :Ag<CR>

"=== deoplete ===========================
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"

"=== anzu ===============================
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)

"=== comfortable_motion =================
"デフォルトをoff
"let g:comfortable_motion_no_default_key_mappings = 1
" UとDのみ設定
"nnoremap <silent> <C-u> :call comfortable_motion#flick(-150)<CR>
"nnoremap <silent> <C-d> :call comfortable_motion#flick(150)<CR>

"=== nanomap ============================
"let g:nanomap_auto_open_close = 1

"=== ALE ================================
let g:ale_sign_column_always = 1 " 常に左側にスペースを確保
let g:ale_set_highlights = 0     " ハイライトしない
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

"=== easy-align =========================
vmap <Enter> <Plug>(EasyAlign)

"=== gothrough-jk =======================
" jkでなく↑↓に割り当てる
nmap ,j  <Plug>(gothrough-jk-j)
nmap ,k  <Plug>(gothrough-jk-k)
nmap ,gj <Plug>(gothrough-jk-gj)
nmap ,gk <Plug>(gothrough-jk-gk)
nmap <Up> <Plug>(gothrough-jk-k)
nmap <Down> <Plug>(gothrough-jk-j)

"=== tag-bar ============================
nmap <leader>tb :TagbarToggle<CR>

