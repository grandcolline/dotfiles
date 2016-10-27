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
" COLOR
"========================================
" colorscheme monokai
colorscheme edark
let edark_current_line=1
let edark_ime_cursor=1
let edark_insert_status_line=1

syntax enable
highlight PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

"========================================
" VIEW
"========================================
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set display=uhex      " 印字不可能文字を16進数で表示
set foldmethod=marker " folding
set lazyredraw        " コマンド実行中は再描画しない
set ttyfast           " 高速ターミナル接続を行う
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set laststatus=2      " 常にステータスラインを表示
set ruler             " カーソルが何行目の何列目に置かれているかを表示する


"========================================
" INDENT
"========================================
set noautoindent   " 新しい行のインデントを現在の行と同じにする
" set smartindent " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める
set tabstop=2 shiftwidth=2 softtabstop=0

