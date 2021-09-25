"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
"

"-----------------------------
" Plugins
"   install: :PlugInstall
"   upgrade: :PlugUpdate
"-----------------------------
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Townk/vim-autoclose'
Plug 'yuttie/comfortable-motion.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hoob3rt/lualine.nvim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/vim-molder'
Plug 'tyru/open-browser.vim'
Plug 'diepm/vim-rest-console'
Plug 'nvim-treesitter/nvim-treesitter'

" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'LeafCage/foldCC.vim'

call plug#end()


"-----------------------------
" General
"-----------------------------
lua <<EOF
EOF

set fenc=utf-8                            " 文字コード
scriptencoding utf-8                      " vimrcの文字コード
set fileencoding=utf-8                    " 保存時の文字コード
set fileencodings=utf-8                   " 読み込み時の文字コードの自動判別. 左側が優先
set fileformats=unix,dos,mac              " 改行コードの自動判別. 左側が優先
set backspace=2                           " more powerful backspacing
set ambiwidth=double

set noswapfile                            " swapファイルを作成しない
set autoread                              " 編集中ファイルが書き換えられたら、自動リロード
set undofile
set undodir=$XDG_CONFIG_HOME/nvim/cache
set backupdir=$XDG_CONFIG_HOME/nvim/cache
set viminfo+=n$XDG_CONFIG_HOME/nvim/cache/nviminfo

set clipboard=unnamed,unnamedplus         " クリップボードとyunk,putを共有（unnamedplusはmacならいらないやも）
" nnoremap x "_x
" nnoremap X "_dd
" nnoremap c "_c
" nnoremap C "_C

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
lua <<EOF
  vim.opt.number      = true    -- 行番号表示
  vim.opt.cursorline  = true    -- 行のハイライト
  vim.opt.signcolumn  = 'yes'   -- 行番号の左側のサイズ固定
  vim.opt.list        = true    -- 不可視文字の表示設定
  vim.opt.tabstop     = 4       -- タブを表示するときの幅
  vim.opt.shiftwidth  = 4       -- タブを挿入するときの幅
  vim.opt.showmode    = false   -- 「-- 挿入 --」とかの非表示
  vim.opt.breakindent = true    -- 折り返しを同じインデントで表示

  -- ------ いらなそうなので一旦コメントアウト ------
  -- vim.opt.showmatch   = true    -- 対応括弧のハイライト
  -- vim.opt.matchtime   = 3       -- 対応括弧のハイライトを3秒に
  -- vim.opt.ruler       = true    -- カーソルが何行目の何列目に置かれているかを表示する
  -- vim.opt.expandtab   = false   -- タブをタブとして扱う(スペースに展開しない)
  -- vim.opt.softtabstop = 0
  -- vim.opt.autoindent  = true
  -- vim.opt.laststatus  = 2       -- ステータスラインの表示
  -- vim.opt.cmdheight   = 1       -- メッセージ表示欄の行数
  -- -------------------------------------------------
EOF


"-----------------------------
" Key Mapping
"-----------------------------
lua <<EOF
  local keymap = vim.api.nvim_set_keymap

  -- 甘えるな、hjklを使え
  keymap('', '<LEFT>',  '<NOP>', { noremap = true })
  keymap('', '<Up>',    '<NOP>', { noremap = true })
  keymap('', '<Right>', '<NOP>', { noremap = true })
  keymap('', '<Down>',  '<NOP>', { noremap = true })

  -- XとCはコピーなしない
  keymap('', 'x', '"_x',  { noremap = true })
  keymap('', 'X', '"_dd', { noremap = true })
  keymap('', 'c', '"_c',  { noremap = true })
  keymap('', 'C', '"_C',  { noremap = true })

  -- 「-」で現在フォルダを開く
  keymap('n', '-', ':e %:h<CR>', { noremap = true, silent = true })

  -- Leaderを使ったキーマッピング
  vim.g.mapleader = " "

  keymap('n', '<LEADER>b', ':Buffers<CR>', {})
  keymap('n', '<LEADER>c', ':call VrcQuery()<CR>', {})
  keymap('n', '<LEADER>d', ':call <SID>show_documentation()<CR>', {})
  keymap('n', '<LEADER>e', '<Plug>(coc-diagnostic-next)', {})
  keymap('n', '<LEADER>E', '<Plug>(coc-diagnostic-prev)', {})
  keymap('n', '<LEADER>f', ':Files<CR>', {})
  keymap('n', '<LEADER>g', '<Plug>(coc-definition)', {})
  keymap('n', '<LEADER>G', '<Plug>(coc-references)', {})
  keymap('n', '<LEADER>h', '<Plug>(GitGutterNextHunk)', {})
  keymap('n', '<LEADER>H', '<Plug>(GitGutterPrevHunk)', {})
  keymap('n', '<LEADER>i', '<Plug>(coc-implementation)', {})
  keymap('',  '<LEADER>k', '<Plug>(openbrowser-smart-search)', {})
  keymap('n', '<LEADER>n', '<Plug>(coc-rename)', {})
  keymap('n', '<LEADER>o', 'mzo<ESC>', {})
  keymap('n', '<LEADER>O', 'mzO<ESC>', {})
  keymap('n', '<LEADER>r', ':Rg<CR>', {})
  keymap('n', '<LEADER>s', ':GFiles?<CR>', {})
  keymap('n', '<LEADER>v', '<Plug>(GitGutterPreviewHunk)', {})

  keymap('n', '<LEADER><Tab>',   '<C-w>w', {})
  keymap('n', '<LEADER>/',       '<Plug>(easymotion-sn)', {})
  keymap('n', '<LEADER><Space>', ':set hlsearch!<CR>', {})
  keymap('n', '<LEADER><BS>',    ':bd<CR>', {})
  keymap('n', '<LEADER><CR>',    ':! ', { noremap = true })
EOF


"-----------------------------
" ColorScheme
"-----------------------------
syntax on
set background=dark
" set t_Co=256

" --- Tomorrow Night ---
" autocmd ColorScheme * highlight LineNr ctermfg=245
" colorscheme tomorrow-night

" --- Iceberg ---
colorscheme iceberg
hi Visual  ctermbg=241      " Visual(選択範囲)の白を濃くする
hi Comment ctermfg=102      " コメントちょっと濃く
hi LineNr  ctermfg=102      " 行番号ちょっと濃く
hi CursorLineNr ctermfg=180 " 現在行番号ハイライト


"-----------------------------
" Treesitter
"-----------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true, -- syntax highlightを有効に
    disable = {}   -- 一部の言語では無効に
  },
  ensure_installed = 'maintained', -- :TSInstall maintainedと同じ
  indent = {
    enable = true  -- tree-sitterによるインデントを有効に
  }
}
EOF


"-----------------------------
" lualine
"-----------------------------
lua << EOF

local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'jellybeans',
    -- section_separators = {'', ''},
    section_separators = {'', ''},
    component_separators = {'|', '|'},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename', 'coc#status'},
    -- lualine_c = {
    --   {
    --     'diagnostics',
    --     sources = {"nvim_lsp"},
    --     symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
    --   }
    -- },
	lualine_x = {},
    lualine_y = {'branch', 'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {'fugitive'}
}
EOF


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
let g:EasyMotion_keys = '123456789wertasdfgyuiophjklzxcvbnm'


"-----------------------------
" Molder
"-----------------------------
let g:molder_show_hidden = 1


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
" nvim-lspconfig
"-----------------------------
" lua << EOF
" local nvim_lsp = require('lspconfig')
"
" -- エラー文言を表示しない
" vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"   vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
" )
"
" local on_attach = function(client, bufnr)
"   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"   -- Mappings
"   -- refs: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
"   local opts = { noremap=true, silent=true }
"   ---- 定義ジャンプ
"   buf_set_keymap('n', '<Leader>g', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   ---- 定義表示
"   buf_set_keymap('n', '<Leader>d', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   ---- エラージャンプ
"   buf_set_keymap('n', '<Leader>e', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"   buf_set_keymap('n', '<Leader>E', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"
"   -- 補完設定
"   require'completion'.on_attach(client, bufnr)
" end
"
" -- LSPのセットアップ
" nvim_lsp.gopls.setup{
"   on_attach = on_attach
" }
" nvim_lsp.tsserver.setup {
"   on_attach = on_attach
" }
" nvim_lsp.rls.setup {
"   on_attach = on_attach,
"   settings = {
"     rust = {
"       unstable_features = true,
"       build_on_save = false,
"       all_features = true,
"     },
"   },
" }
"
" EOF
"
" set completeopt=menuone,noinsert,noselect
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" " Error -> Red
" highlight LspDiagnosticsSignError        ctermfg=9
" highlight LspDiagnosticsVirtualTextError ctermfg=9
" highlight LspDiagnosticsUnderlineError   ctermfg=9
" " Warning -> Yellow
" highlight LspDiagnosticsSignWarning        ctermfg=11
" highlight LspDiagnosticsVirtualTextWarning ctermfg=11
" highlight LspDiagnosticsUnderlineWarning   ctermfg=11
" " Info -> Green
" highlight LspDiagnosticsSignInformation        ctermfg=35
" highlight LspDiagnosticsVirtualTextInformation ctermfg=35
" highlight LspDiagnosticsUnderlineInformation   ctermfg=35
" " Hint -> Purple
" highlight LspDiagnosticsSignHint        ctermfg=13
" highlight LspDiagnosticsVirtualTextHint ctermfg=13
" highlight LspDiagnosticsUnderlineHint   ctermfg=13


"-----------------------------
" fzf
"-----------------------------
let g:fzf_layout = { 'down': '30%' }
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**'"


"-----------------------------
" rest-console
"-----------------------------
let g:vrc_set_default_mapping = 0
let g:vrc_auto_format_uhex = 1
let g:vrc_curl_opts = { '-sS': '', '-i': '' }

