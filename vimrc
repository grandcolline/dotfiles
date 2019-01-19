"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
"        ---- 最小限の設定 ----

"========================================
" General
"========================================
set fenc=utf-8                                       " 文字コード
set fileencoding=utf-8                               " 保存時の文字コード
set fileencodings=utf-8,ucs-boms,euc-jp,cp932        " 読み込み時の文字コードの自動判別. 左側が優先
set fileformats=unix,dos,mac                         " 改行コードの自動判別. 左側が優先
set ambiwidth=double                                 " □や○が崩れる問題を解決

set nocompatible                                     " Use Vim defaults instead of 100% vi compatibility
set backspace=2                                      " more powerful backspacing

set noswapfile                                       " swapファイルを作成しない
set autoread                                         " 編集中ファイルが書き換えられたら、自動リロード

nnoremap x "_x
nnoremap c "_c
nnoremap C "_C


"========================================
" View
"========================================
set number                                           " 行番号表示

set laststatus=2                                     " ステータスラインの表示
set cmdheight=1                                      " インクリメンタルサーチを行う
set ignorecase                                       " 大文字と小文字を区別しない
set smartcase                                        " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan                                         " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault                                         " 置換の時 g オプションをデフォルトで有効にする

