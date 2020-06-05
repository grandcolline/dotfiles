"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
"        ---- 最小限の設定 ----

"========================================
" General
"========================================
set fenc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-boms,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

set nocompatible
set backspace=2

set noswapfile
set autoread

command! Q q
command! W w
command! WQ wq
command! Wq wq

nnoremap x "_x
nnoremap X "_dd
nnoremap c "_c
nnoremap C "_C

"========================================
" View
"========================================
set number
" set relativenumber
set laststatus=2
set cmdheight=1
set ignorecase
set smartcase
set wrapscan
set gdefault

colorscheme delek

"========================================
" Key Mapping
"========================================
let g:mapleader = "\<Space>"

nmap <Leader>o mzo<ESC>
nmap <Leader>O mzO<ESC>
nmap <Leader><Tab> <C-w>w
nmap <Leader><Space> :set hlsearch!<CR>

