"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
"

"-----------------------------
" Plugins
"   install: :PlugInstall
"-----------------------------
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

Plug 'chriskempson/vim-tomorrow-theme'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Townk/vim-autoclose'
Plug 'yuttie/comfortable-motion.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-dirvish'
Plug 'tyru/open-browser.vim'
Plug 'liuchengxu/vista.vim'
Plug 'leafgarland/typescript-vim' " For typescript syntax
Plug 'ianks/vim-tsx'              " For typescript syntax

call plug#end()


"-----------------------------
" General
"-----------------------------
set fenc=utf-8                            " 文字コード
scriptencoding utf-8                      " vimrcの文字コード
set fileencoding=utf-8                    " 保存時の文字コード
set fileencodings=utf-8                   " 読み込み時の文字コードの自動判別. 左側が優先
set fileformats=unix,dos,mac              " 改行コードの自動判別. 左側が優先
set backspace=2                           " more powerful backspacing

set noswapfile                            " swapファイルを作成しない
set autoread                              " 編集中ファイルが書き換えられたら、自動リロード
set undofile
set undodir=$XDG_CONFIG_HOME/nvim/cache
set backupdir=$XDG_CONFIG_HOME/nvim/cache
set viminfo+=n$XDG_CONFIG_HOME/nvim/cache/nviminfo

set clipboard=unnamed,unnamedplus         " クリップボードとyunk,putを共有（unnamedplusはmacならいらないやも）
nnoremap x "_x
nnoremap X "_dd
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

" set hlsearch                            " 検索文字列をハイライトする
set nohlsearch                            " 検索文字列をハイライトしない
set incsearch                             " インクリメンタルサーチを行う
set ignorecase                            " 大文字と小文字を区別しない
set smartcase                             " 大文字と小文字の混在で検索した場合、大文字と小文字を区別
set wrapscan                              " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault                              " 置換の時 g オプションをデフォルトで有効にする
set inccommand=split                      " 置換のインクリメンタル表示（nvimのみ）


"-----------------------------
" View
"-----------------------------
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


"-----------------------------
" Key Mapping
"-----------------------------
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
nmap <Leader>G <Plug>(coc-references)
" nmap <Leader>G <Plug>(coc-implementation)
nmap <Leader>h <Plug>(GitGutterNextHunk)
nmap <Leader>H <Plug>(GitGutterPrevHunk)
map  <Leader>j <Plug>(easymotion-sn)
map  <Leader>k <Plug>(openbrowser-smart-search)
nmap <Leader>l :Lines<CR>
" nmap <Leader>n <Plug>(coc-rename)
nmap <Leader>o mzo<ESC>
nmap <Leader>O mzO<ESC>
nmap <Leader>r :Rg<CR>
nmap <Leader>s :GFiles?<CR>
nmap <Leader>t :Vista!!<CR>
nmap <Leader>v <Plug>(GitGutterPreviewHunk)

nmap <Leader><Tab> <C-w>w
nmap <Leader><Space> :set hlsearch!<CR>


"-----------------------------
" ColorScheme
"-----------------------------
syntax on
set background=dark
set t_Co=256
autocmd ColorScheme * highlight LineNr ctermfg=245

colorscheme Tomorrow-Night


"-----------------------------
" Lightline
"-----------------------------
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! LightLineFilename()
  return expand('%')
endfunction

let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'filename', 'readonly', 'cocstatus', 'modified', 'method' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'filetype': 'MyFiletype',
  \   'fileformat': 'MyFileformat',
  \   'filename': 'LightLineFilename',
  \   'method': 'NearestMethodOrFunction',
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ }


"-----------------------------
" GitGutter
"-----------------------------
" 反映されるまでの時間を変更
set updatetime=200
" defaultのmappingはオフに
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '∙'


"-----------------------------
" EasyMotion
"-----------------------------
let g:EasyMotion_do_mapping = 0       " デフォルトのマッピングをオフ
let g:EasyMotion_smartcase = 1        " 検索時大文字小文字を区別しない
let g:EasyMotion_enter_jump_first = 1 " Enterで直近選択
"let g:EasyMotion_keys = 'wertasdfgyuiophjklzxcvbnm'


"-----------------------------
" Dirvish
"-----------------------------
let g:dirvish_relative_paths = 1      " 相対パスで表示(検索時に絶対パスになるのを防ぐ)


"-----------------------------
" Coc
"-----------------------------
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_status_error_sign = "E:"
let g:coc_status_warning_sign = "W:"


"-----------------------------
" Vista
"-----------------------------
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 0
let g:vista_close_on_jump = 1
let g:vista_sidebar_width = 60

