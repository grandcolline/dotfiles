--[[    _
 __   _(_)_ __ ___  _ __ ___
 \ \ / / | '_ ` _ \| '__/ __|
  \ V /| | | | | | | | | (__
 (_)_/ |_|_| |_| |_|_|  \___|
--]]

-------------------------------
-- Packer.nvim
--   再新化 :PackerSync
-------------------------------
vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  use 'cocopon/iceberg.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'airblade/vim-gitgutter'
  use 'Townk/vim-autoclose'
  use 'yuttie/comfortable-motion.vim'
  use 'hoob3rt/lualine.nvim'
  use 'bronson/vim-trailing-whitespace'
  use 'mattn/vim-molder'
  use 'tyru/open-browser.vim'
  use 'diepm/vim-rest-console'

  use 'vijaymarupudi/nvim-fzf'
  use 'ibhagwan/fzf-lua'

  -- use { 'neoclide/coc.nvim', branch = 'release' }

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp' -- builtin LSP client
  use 'hrsh7th/cmp-buffer'   -- buffer words
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
    'phaazon/hop.nvim',
    config = function()
      require'hop'.setup { keys = 'jkletovxqpdygfbzhcisuran' }
    end
  }

  use { 'wbthomason/packer.nvim', opt = true }
end)


-------------------------------
-- General
-------------------------------
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
vim.opt.number         = true     -- 行番号表示
vim.opt.relativenumber = false     -- 相対行表示
vim.opt.cursorline     = true      -- 行のハイライト
vim.opt.signcolumn     = 'yes'     -- 行番号の左側のサイズ固定
vim.opt.list           = true      -- 不可視文字の表示設定
vim.opt.showmode       = false     -- 「-- 挿入 --」とかの非表示
vim.opt.colorcolumn    = '80'        -- 80文字目にラインを入れる
-- vim.opt.showmatch   = true      -- 対応括弧のハイライト
-- vim.opt.matchtime   = 3         -- 対応括弧のハイライトを3秒に
-- vim.opt.ruler       = true      -- カーソルが何行目の何列目に置かれているかを表示する
-- vim.opt.expandtab   = false     -- タブをタブとして扱う(スペースに展開しない)
-- vim.opt.softtabstop = 0
-- vim.opt.autoindent  = true
-- vim.opt.laststatus  = 2         -- ステータスラインの表示
-- vim.opt.cmdheight   = 1         -- メッセージ表示欄の行数

-- インデント設定
vim.opt.tabstop        = 2         -- タブを表示するときの幅
vim.opt.shiftwidth     = 2         -- タブを挿入するときの幅
vim.opt.breakindent    = true      -- 折り返しを同じインデントで表示
vim.opt.expandtab      = true      -- TAB -> Space
vim.cmd('au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4')

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
-- Key Mapping
-------------------------------
local map = vim.api.nvim_set_keymap

-- 甘えるな、hjklを使え
map('', '<LEFT>',  '<NOP>', { noremap = true })
map('', '<Up>',    '<NOP>', { noremap = true })
map('', '<Right>', '<NOP>', { noremap = true })
map('', '<Down>',  '<NOP>', { noremap = true })

-- XとCはコピーなしない
map('', 'x', '"_x',  { noremap = true })
map('', 'X', '"_dd', { noremap = true })
map('', 'c', '"_c',  { noremap = true })
map('', 'C', '"_C',  { noremap = true })

-- 「-」で現在フォルダを開く
map('n', '-', ':e %:h<CR>', { noremap = true, silent = true })

-- Leaderを使ったキーマッピング
vim.g.mapleader = " "

map('n', '<LEADER>b', '<cmd>lua require("fzf-lua").buffers()<CR>', {})
map('n', '<LEADER>c', ':call VrcQuery()<CR>', {})
map('n', '<LEADER>f', '<cmd>lua require("fzf-lua").files()<CR>', {})
map('n', '<LEADER>h', '<Plug>(GitGutterNextHunk)', {})
map('n', '<LEADER>H', '<Plug>(GitGutterPrevHunk)', {})
map('',  '<LEADER>k', '<Plug>(openbrowser-smart-search)', {})
map('n', '<LEADER>o', 'mzo<ESC>', {})
map('n', '<LEADER>O', 'mzO<ESC>', {})
map('n', '<LEADER>r', '<cmd>lua require("fzf-lua").live_grep()<CR>', {})
map('n', '<LEADER>s', '<cmd>lua require("fzf-lua").git_status()<CR>', {})
map('n', '<LEADER>v', '<Plug>(GitGutterPreviewHunk)', {})

map('n', '<LEADER>j',       '<cmd>lua require("hop").hint_words()<cr>', { noremap = true })
map('n', '<LEADER>/',       '<cmd>lua require("hop").hint_patterns()<cr>', { noremap = true })
map('n', '<LEADER><Tab>',   '<C-w>w', {})
map('n', '<LEADER><Space>', ':set hlsearch!<CR>', {})
map('n', '<LEADER><BS>',    ':bd<CR>', {})
map('n', '<LEADER><CR>',    ':! ', { noremap = true })


-------------------------------
-- ColorScheme
-------------------------------
vim.cmd('syntax on')
vim.cmd('colorscheme iceberg')

vim.cmd('hi Visual  ctermbg=241')      -- Visual(選択範囲)の白を濃くする
vim.cmd('hi Comment ctermfg=102')      -- コメントちょっと濃く
vim.cmd('hi LineNr  ctermfg=102')      -- 行番号ちょっと濃く
vim.cmd('hi CursorLineNr ctermfg=180') -- 現在行番号ハイライト


-------------------------------
-- Treesitter
-------------------------------
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


-------------------------------
-- lualine
-------------------------------
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
  -- filename / branch / filetype / location
  sections = {
    lualine_a = {'mode'},
    -- lualine_b = {'coc#status'},
    lualine_b = {
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        symbols = {error = 'E:', warn = 'W:', info = 'I:', hint = 'H:'}
        -- symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}

      }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filename'},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filename'},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}


-------------------------------
-- GitGutter
-------------------------------
-- 反映されるまでの時間を変更
vim.opt.updatetime = 200

vim.g.gitgutter_map_keys      = 0 -- defaultのmappingはオフ
vim.g.gitgutter_sign_added    = '+'
vim.g.gitgutter_sign_modified = '∙'
vim.g.gitgutter_sign_removed  = '-'
vim.g.gitgutter_sign_modified_removed = '∙'


-------------------------------
-- Hop
-------------------------------
vim.cmd('hi HopNextKey ctermfg=198')


-------------------------------
-- Molder
-------------------------------
-- 隠しファイルも表示
vim.g.molder_show_hidden = 1


-------------------------------
-- lsp-config
-------------------------------
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<LEADER>d', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<LEADER>e', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<LEADER>E', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<LEADER>g', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', '<LEADER>i', '<cmd>lua require("fzf-lua").lsp_implementations()<CR>', {})
  map('n', '<LEADER>G', '<cmd>lua require("fzf-lua").lsp_references()<CR>', {})
end

-- エラー文言を表示しない
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

----------------------
-- LSP SERVER SETUP
----------------------
-- TypeScript
-- Install: npm install -g typescript-language-server
nvim_lsp.tsserver.setup {
  on_attach = on_attach
}
-- Golang
-- Install: go get -u golang.org/x/tools/gopls@latest
nvim_lsp.gopls.setup{
  on_attach = on_attach
}
-- Rust
-- Install: brew install rust-analyzer
-- nvim_lsp.rust_analyzer.setup{
--   on_attach = on_attach
-- }
-- Rust
-- Install: rustup component add rls
nvim_lsp.rls.setup{
  on_attach = on_attach
}

----------------------
-- nvim-cmp SETUP
----------------------
local cmp = require'cmp'

vim.opt.completeopt = 'menu,menuone,noselect'
cmp.setup({
  -- snippet = {
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body)
  --   end,
  -- },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-c>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
-- setup config source
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})


-------------------------------
-- Coc.nvim
-------------------------------
-- 参考: https://blog.suzukishouten.co.jp/archives/2360
-- vim.cmd([[inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"]])
-- vim.cmd([[inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]])
--
-- function _G.check_back_space()
--   local col = vim.api.nvim_win_get_cursor(0)[2]
--   return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
-- end
--
-- function _G.show_documentation()
--   if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
--     cmd('h ' .. vim.fn.expand(''))
--   elseif vim.api.nvim_eval('coc#rpc#ready()') then
--     vim.fn.CocActionAsync('doHover')
--   else
--     cmd('! ' .. vim.o.keywordprg .. ' ' .. vim.fn.expand(''))
--   end
-- end
--
-- vim.g.coc_status_error_sign = "E:"
-- vim.g.coc_status_warning_sign = "W:"
--
-- map('n', '<LEADER>e', '<Plug>(coc-diagnostic-next)', {})
-- map('n', '<LEADER>E', '<Plug>(coc-diagnostic-prev)', {})
-- map('n', '<LEADER>g', '<Plug>(coc-definition)', {})
-- map('n', '<LEADER>G', '<Plug>(coc-references)', {})
-- map('n', '<LEADER>n', '<Plug>(coc-rename)', {})
-- map('n', '<LEADER>i', '<Plug>(coc-implementation)', {})


-------------------------------
-- fzf-lua
-------------------------------
require'fzf-lua'.setup {
  winopts = {
    preview = {
      layout = 'vertical' -- horizontal|vertical|flex
    }
  }
}


-------------------------------
-- rest-console
-------------------------------
vim.g.vrc_set_default_mapping = 0
vim.g.vrc_auto_format_uhex    = 1
vim.g.vrc_curl_opts = { ['-sS'] = "", ['-i'] = ""}

