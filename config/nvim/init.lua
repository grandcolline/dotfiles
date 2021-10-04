--[[    _
 __   _(_)_ __ ___  _ __ ___
 \ \ / / | '_ ` _ \| '__/ __|
  \ V /| | | | | | | | | (__
 (_)_/ |_|_| |_| |_|_|  \___|
--]]

-- 一般設定
vim.opt.fenc           = 'utf-8'          -- 文字コード
vim.opt.fileencoding   = 'utf-8'          -- 保存時の文字コード
vim.opt.fileencodings  = 'utf-8'          -- 読み込み時の文字コードの自動判別. 左側が優先
vim.opt.fileformats    = 'unix,dos,mac'   -- 改行コードの自動判別. 左側が優先
-- vim.opt.ambiwidth   = 'double'         -- floating windowで枠線が辺になるのでコメントアウト
vim.opt.swapfile       = false            -- swapファイルを作成しない
vim.opt.autoread       = true             -- 編集中ファイルが書き換えられたら、自動リロード
vim.opt.undofile       = true
vim.opt.clipboard      = 'unnamed'        -- クリップボードとyunk,putを共有
vim.opt.history        = 5000             -- 保存するコマンド履歴の数
vim.opt.mouse          = 'a'              -- マウス操作をオンにする
vim.opt.foldmethod     = 'marker'         -- folding
vim.opt.lazyredraw     = true             -- コマンド実行中は再描写しない
vim.opt.ttyfast        = true             -- 高速ターミナル接続
-- vim.cmd('scriptencoding utf-8')        -- vimrcの文字コード

-- コマンドラインモードのファイル名補完
vim.opt.wildmenu       = true
vim.opt.wildmode       = 'list:longest,full'

-- 検索関連設定
vim.opt.hlsearch       = false     -- 検索文字列をハイライトしない
vim.opt.incsearch      = true      -- インクリメンタルサーチを行う
vim.opt.ignorecase     = true      -- 大文字と小文字を区別しない
vim.opt.smartcase      = true      -- 大文字と小文字の混在で検索した場合、大文字と小文字を区別
vim.opt.wrapscan       = true      -- 最後尾まで検索を終えたら次の検索で先頭に移る
vim.opt.gdefault       = true      -- 置換の時 g オプションをデフォルトで有効にする
vim.opt.inccommand     = 'split'   -- 置換のインクリメンタル表示（nvimのみ）

-- nvim文字化け問題
-- vim.opt.ttimeout       = true
-- vim.opt.ttimeoutlen    = 50
-- vim.opt.pyxversion     = 3

-- 表示関連設定
vim.cmd('syntax on')
vim.opt.number         = true      -- 行番号表示
vim.opt.cursorline     = true      -- 行のハイライト
vim.opt.signcolumn     = 'yes'     -- 行番号の左側のサイズ固定
vim.opt.list           = true      -- 不可視文字の表示設定
vim.opt.tabstop        = 4         -- タブを表示するときの幅
vim.opt.shiftwidth     = 4         -- タブを挿入するときの幅
vim.opt.showmode       = false     -- 「-- 挿入 --」とかの非表示
vim.opt.breakindent    = true      -- 折り返しを同じインデントで表示
-- vim.opt.showmatch   = true      -- 対応括弧のハイライト
-- vim.opt.matchtime   = 3         -- 対応括弧のハイライトを3秒に
-- vim.opt.ruler       = true      -- カーソルが何行目の何列目に置かれているかを表示する
-- vim.opt.expandtab   = false     -- タブをタブとして扱う(スペースに展開しない)
-- vim.opt.softtabstop = 0
-- vim.opt.autoindent  = true
-- vim.opt.laststatus  = 2         -- ステータスラインの表示
-- vim.opt.cmdheight   = 1         -- メッセージ表示欄の行数

-- コマンドタイポ予防
vim.cmd('command! Q q')
vim.cmd('command! W w')
vim.cmd('command! WQ wq')
vim.cmd('command! Wq wq')

-- luaにできなかったもの
-- set undodir=$XDG_CONFIG_HOME/nvim/cache
-- set backupdir=$XDG_CONFIG_HOME/nvim/cache
-- set viminfo+=n$XDG_CONFIG_HOME/nvim/cache/nviminfo


-------------------------------
-- Plugin
-------------------------------
require('plugin')

-------------------------------
-- Key Mapping
-------------------------------
require('mapping')

