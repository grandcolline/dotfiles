--[[    _
 __   _(_)_ __ ___  _ __ ___
 \ \ / / | '_ ` _ \| '__/ __|
  \ V /| | | | | | | | | (__
 (_)_/ |_|_| |_| |_|_|  \___|
--]]

-------------------------------
-- lazy.nvim (Plugin 管理)
-------------------------------
-- :Lazy で管理画面
-- "$HOME/.local/share/nvim/lazy" に実態が入る
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  'nvim-lua/plenary.nvim', -- used by rest.nvim / gitsigns.nvim / avante.lua

  -- 表示関連
  'nvim-treesitter/nvim-treesitter',
  'kyazdani42/nvim-web-devicons', -- icon
  'rebelot/kanagawa.nvim', -- color scheme
  'hoob3rt/lualine.nvim',  -- status line
  'ntpeters/vim-better-whitespace', -- 行末空白のハイライト
  -- 'MeanderingProgrammer/render-markdown.nvim', -- markdown preview

  -- for git
  'lewis6991/gitsigns.nvim',

  -- Filer
  'tamago324/lir.nvim',
  'tamago324/lir-git-status.nvim',

  -- for Fazzy Search
  'vijaymarupudi/nvim-fzf',
  'ibhagwan/fzf-lua',

  -- for LSP
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'nvimdev/lspsaga.nvim', -- LSP の UI をよくする
  -- 'folke/trouble.nvim',   -- LSP でエラーを一覧表示(x)

  -- for curl
  -- 'hudclark/grpc-nvim',     -- .grcp ファイルのやつ
  -- 'NTBBloodbath/rest.nvim', -- .rest ファイルのやつ

  -- copilot
  "zbirenbaum/copilot.lua",

  -- open browser
  'tyru/open-browser.vim',        -- ブラウザで開く
  'tyru/open-browser-github.vim', -- Github を開く `:OpenGithubFile`

  -- for test
  'klen/nvim-test', -- テスト実行

  'windwp/nvim-autopairs',          -- ()
  'yuttie/comfortable-motion.vim',  -- ぬるぬるスクロール

  -- 'mfussenegger/nvim-lint',
})


-------------------------------
-- General
-------------------------------
-- 一般設定
vim.opt.fenc           = 'utf-8'         -- 文字コード
vim.opt.fileencoding   = 'utf-8'         -- 保存時の文字コード
vim.opt.fileencodings  = 'utf-8'         -- 読み込み時の文字コードの自動判別. 左側が優先
vim.opt.fileformats    = 'unix,dos,mac'  -- 改行コードの自動判別. 左側が優先
-- vim.opt.ambiwidth   = 'double'        -- floating windowで枠線が辺になるのでコメントアウト
vim.opt.swapfile       = false           -- swapファイルを作成しない
vim.opt.autoread       = true            -- 編集中ファイルが書き換えられたら、自動リロード
vim.opt.undofile       = true
vim.opt.clipboard      = 'unnamed'       -- クリップボードとyunk,putを共有
vim.opt.history        = 5000            -- 保存するコマンド履歴の数
vim.opt.mouse          = 'a'             -- マウス操作をオンにする
vim.opt.foldmethod     = 'marker'        -- folding
vim.opt.lazyredraw     = true            -- コマンド実行中は再描写しない
vim.opt.ttyfast        = true            -- 高速ターミナル接続
-- vim.cmd('scriptencoding utf-8')       -- vimrcの文字コード

-- コマンドラインモードのファイル名補完
vim.opt.wildmenu       = true
vim.opt.wildmode       = 'list:longest,full'

-- 検索関連設定
vim.opt.hlsearch       = false    -- 検索文字列をハイライトしない
vim.opt.incsearch      = true     -- インクリメンタルサーチを行う
vim.opt.ignorecase     = true     -- 大文字と小文字を区別しない
vim.opt.smartcase      = true     -- 大文字と小文字の混在で検索した場合、大文字と小文字を区別
vim.opt.wrapscan       = true     -- 最後尾まで検索を終えたら次の検索で先頭に移る
vim.opt.gdefault       = true     -- 置換の時 g オプションをデフォルトで有効にする
vim.opt.inccommand     = 'split'  -- 置換のインクリメンタル表示（nvimのみ）

-- 表示関連設定
vim.opt.number         = true     -- 行番号表示
vim.opt.relativenumber = false    -- 相対行表示
vim.opt.cursorline     = true     -- 行のハイライト
vim.opt.signcolumn     = 'yes'    -- 行番号の左側のサイズ固定
vim.opt.list           = true     -- 不可視文字の表示設定
vim.opt.showmode       = false    -- 「-- 挿入 --」とかの非表示
vim.opt.colorcolumn    = '80'     -- 80文字目にラインを入れる
-- vim.opt.showmatch   = true     -- 対応括弧のハイライト
-- vim.opt.matchtime   = 3        -- 対応括弧のハイライトを3秒に
-- vim.opt.ruler       = true     -- カーソルが何行目の何列目に置かれているかを表示する
-- vim.opt.expandtab   = false    -- タブをタブとして扱う(スペースに展開しない)
-- vim.opt.softtabstop = 0
-- vim.opt.autoindent  = true
-- vim.opt.laststatus  = 2        -- ステータスラインの表示
-- vim.opt.cmdheight   = 1        -- メッセージ表示欄の行数

-- インデント設定
vim.opt.tabstop        = 2        -- タブを表示するときの幅
vim.opt.shiftwidth     = 2        -- タブを挿入するときの幅
vim.opt.breakindent    = true     -- 折り返しを同じインデントで表示
vim.opt.expandtab      = true     -- TAB -> Space
vim.cmd('au BufNewFile,BufRead *.go set noexpandtab tabstop=2 shiftwidth=2')

-- コマンドタイポ予防
vim.api.nvim_create_user_command('Q',  'q',  {})
vim.api.nvim_create_user_command('W',  'w',  {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})

-- Terminalモード
vim.cmd('autocmd TermOpen * startinsert') -- 常にInsertModeでスタート
vim.cmd('command! -nargs=* Te bo sp | te <args>')
-- vim.api.nvim_create_user_command('Te', 'bo sp | te <args>', { nargs = * })

-- Fold(折りたたみ)
vim.opt.foldtext = [[getline(v:foldstart)]]

-- コマンドの通常時の高さをオフにする
vim.opt.cmdheight = 0

-- 拡張子設定
-- .rest ファイルは http ファイルとして扱う
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.rest",
    command = "set filetype=http"
})

-- 外部からファイルを変更されたら反映する
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

-- 🚀
-- if vim.fn.has('nvim-0.8') == 1 then
-- end

-------------------------------
-- Key Mapping
-------------------------------
local map = vim.api.nvim_set_keymap

-- 甘えるな、hjklを使え
map('', '<LEFT>',  '<NOP>', { noremap = true })
map('', '<Up>',    '<NOP>', { noremap = true })
map('', '<Right>', '<NOP>', { noremap = true })
map('', '<Down>',  '<NOP>', { noremap = true })

-- XとCはコピーしない
map('', 'x', '"_x',  { noremap = true })
map('', 'X', '"_dd', { noremap = true })
map('', 'c', '"_c',  { noremap = true })
map('', 'C', '"_C',  { noremap = true })

-- terminal mode も esc で抜ける
map('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

-- Leader を使ったキーマッピング
-- なるべくデフォルトのキーマッピングを無くさないように、
-- 独自のマッピングは極力 Leader を使うようにする。
vim.g.mapleader = " "

map('n', '<LEADER>A', '<cmd>Lspsaga code_action<CR>', { silent = true }) ------------------ a: [LSP] コードアクション (action)
map('n', '<LEADER>b', '<cmd>lua require("fzf-lua").buffers()<CR>', {}) -------------------- b: [FZF] buffer 検索 (buffer)
-- map('n', '<LEADER>c', '<cmd>RestNvim<CR>', {}) ------------------------------------------c: .html で curl 実行 (curl)
map('n', '<LEADER>c', ':let @+ = fnamemodify(expand("%"), ":.") . ":" . line(".")<CR>', {}) --c: 現在のファイル名と行番号をクリップボードにコピー (copy)
map('v', '<LEADER>c', ':<C-u>let @+ = fnamemodify(expand("%"), ":.") . ":" . line("\'<") . "-" . line("\'>") <CR>', {}) --c: [Visual] 選択範囲のファイル名と行番号をクリップボードにコピー (copy)
map('n', '<LEADER>e', '<cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true }) --------- e: [LSP] 次の警告にジャンプ (error)
map('n', '<LEADER>E', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { silent = true }) --------- E: [LSP] 前の警告にジャンプ (error)
map('n', '<LEADER>f', '<cmd>lua require("fzf-lua").files()<CR>', {}) ---------------------- f: [FZF] file 検索 (file)
map('n', '<LEADER>g', '<cmd>lua vim.lsp.buf.definition()<CR>', {}) ------------------------ g: [LSP] 定義ジャンプ (go)
map('n', '<LEADER>G', '<cmd>Lspsaga finder<CR>', { silent = true }) ----------------------- G: [LSP] LSP Finder (go)
map('n', '<LEADER>h', ':Gitsigns next_hunk<CR>', {}) -------------------------------------- h: 次の hunk へジャンプ (hunk)
map('n', '<LEADER>H', ':Gitsigns prev_hunk<CR>', {}) -------------------------------------- H: 前の hunk へジャンプ (hunk)
map('',  '<LEADER>k', '<Plug>(openbrowser-smart-search)', {}) ----------------------------- k: ブラウザで検索 (kensaku)
map('n', '<LEADER>K', '<cmd>Lspsaga hover_doc<CR>', { silent = true }) -------------------- K: [LSP] ドキュメント表示
map('n', '<LEADER>n', '<cmd>Lspsaga rename<CR>', { silent = true }) ----------------------- n: [LSP] リネーム (name)
map('n', '<LEADER>o', 'mzo<ESC>', {}) ----------------------------------------------------- o: 下に空行追加 (o)
map('n', '<LEADER>O', 'mzO<ESC>', {}) ----------------------------------------------------- O: 上に空行追加 (o)
map('n', '<LEADER>r', '<cmd>lua require("fzf-lua").live_grep()<CR>', {})  ----------------- r: [FZF] ripgrep 検索 (rg)
map('n', '<LEADER>s', '<cmd>lua require("fzf-lua").git_status()<CR>', {}) ----------------- s: [FZF] git status 検索 (status)
map('n', '<LEADER>t', ':TestNearest<CR>', {}) --------------------------------------------- t: 現在行のテスト実行 (test)
map('n', '<LEADER>T', ':TestLast<CR>', {}) ------------------------------------------------ T: 最後に行ったテスト実行 (test)
map('n', '<LEADER>v', ':Gitsigns preview_hunk<CR>', {}) ----------------------------------- v: git 差分表示 (view)
map('n', '<LEADER>x', ':TroubleToggle<CR>', {}) ------------------------------------------- x: LSP の警告一覧表示 (ばつ)

map('n', '<LEADER><Tab>',   '<C-w>w', {}) ------------------------------------------------- tab: Window 切り替え
map('n', '<LEADER><S-Tab>', '<C-w>W', {}) ------------------------------------------------- tab: Window 切り替え
map('n', '<LEADER><Space>', ':set hlsearch!<CR>', {}) ------------------------------------- Space: 検索のハイライト
map('n', '<LEADER>/',       ':set hlsearch!<CR>', {}) ------------------------------------- /: 検索のハイライト
map('n', '<LEADER>-',       ':e %:h<CR>', { noremap = true, silent = true }) -------------- -: 現在フォルダを開く
map('n', '<LEADER><BS>',    ':bd!<CR>', {}) ----------------------------------------------- Delete: buffer 削除 (delete)
map('n', '<LEADER><CR>',    ':! ', { noremap = true }) ------------------------------------ Enter: コマンド入力


-------------------------------
-- ColorScheme
-------------------------------
vim.cmd('syntax on')

require("kanagawa").setup({
  transparent = true, -- 背景色を設定しない
})
vim.cmd('colorscheme kanagawa')

-- vim.cmd('hi Visual  ctermbg=241')      -- Visual(選択範囲)の白を濃くする
-- vim.cmd('hi Comment ctermfg=102')      -- コメントちょっと濃く
-- vim.cmd('hi LineNr  ctermfg=102')      -- 行番号ちょっと濃く
-- vim.cmd('hi CursorLineNr ctermfg=180') -- 現在行番号ハイライト

-- highlight LspDiagnosticsSignError        ctermfg=9
-- highlight LspDiagnosticsVirtualTextError ctermfg=9
-- highlight LspDiagnosticsUnderlineError   ctermfg=9


-------------------------------
-- TreeSitter
-------------------------------
-- NOTE: tree-sitterが荒ぶったら
--  1. brew upgrade tree-sitter
--  2. :TSUpdate
require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true, -- syntax highlightを有効に
    disable = {
      -- errorが出るものをoffにする
    },
  },
  -- ensure_installed = 'maintained', -- :TSInstall maintainedと同じ
  ensure_installed = {
    -- :TSInstallInfo で確認できる
    'bash', 'diff', 'dockerfile', 'fish', 'go', 'gomod', 'graphql', 'hcl', 'http',
    'html', 'json', 'lua', 'make', 'markdown', 'markdown_inline', 'proto',
    'rust', 'sql', 'terraform', 'toml', 'tsx', 'typescript', 'vim', 'yaml',
  },
  indent = {
    enable = true, -- tree-sitterによるインデントを有効に
    disable = {
      'javascript',
    },
  },
}

-------------------------------
-- Copilot
-------------------------------
require("copilot").setup {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<Tab>",
      -- accept = "<C-l>",
    },
  },
  panel = { enabled = false },
--   copilot_node_command = 'node'
}

-------------------------------
-- lualine (ステータスライン)
-------------------------------
local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'jellybeans',
    section_separators = {'', ''},
    component_separators = {'|', '|'},
    disabled_filetypes = {},
  },
  -- filename / branch / filetype / location
  sections = {
    lualine_a = {'mode'},
    -- lualine_b = {'diagnostics'},
    lualine_b = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic'},
        -- symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        symbols = {error = 'E:', warn = 'W:', info = 'I:', hint = 'H:'},
      }
    },
    lualine_c = {'filename', 'diff'},
    lualine_x = {}, lualine_y = {}, lualine_z = {}, -- 空にする
  },
  -- inactive_sections = {
  --   lualine_a = {}, lualine_b = {}, lualine_c = {},
  --   lualine_x = {}, lualine_y = {}, lualine_z = {},
  -- },
  -- tabline = {},
  extensions = {'fugitive'}
}


-------------------------------
-- lsp-config
-------------------------------
-- error signを優先して表示
vim.diagnostic.config {
  severity_sort = true
}

-- エラー文言を表示しない
--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
--)


-- LspReference をハイライトする
-- terraorm などでエラーが出るので一旦コメントアウト
-- vim.cmd [[
-- set updatetime=500
-- highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guibg=#104040
-- highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guibg=#104040
-- highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guibg=#104040
-- augroup lsp_document_highlight
--   autocmd!
--   autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
--   autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
-- augroup END
-- ]]


-------------------------------
-- LSP SERVER
-------------------------------
-- TypeScript
-- Install: brew install typescript-language-server
if vim.fn.exepath('typescript-language-server') ~= '' then
  require('lspconfig').ts_ls.setup {
    on_attach = on_attach
  }
end

-- Golang
-- Install: go install golang.org/x/tools/gopls@latest
if vim.fn.exepath('gopls') ~= '' then
  require('lspconfig').gopls.setup{
    on_attach = on_attach
  }
end
-- Install: brew install golangci-lint
-- Install: go install github.com/nametake/golangci-lint-langserver@latest
if vim.fn.exepath('golangci-lint-langserver') ~= '' then
  require('lspconfig').golangci_lint_ls.setup{
    on_attach = on_attach
  }
end

-- -- Rust
-- -- Install: brew install rust-analyzer
-- if vim.fn.exepath('rust-analyzer') ~= '' then
--   require('lspconfig').rust_analyzer.setup{
--     on_attach = on_attach
--   }
-- end

-- Terraform
-- Install: brew install hashicorp/tap/terraform-ls
if vim.fn.exepath('terraform-ls') ~= '' then
  require('lspconfig').terraformls.setup{
    on_attach = on_attach
  }
end

-- Python
-- Install: brew install pyright
-- if vim.fn.exepath('pyright') ~= '' then
--   require('lspconfig').pyright.setup{
--     on_attach = on_attach
--   }
-- end

-- Biome
-- Install: npm i -g @biomejs/biome
if vim.fn.exepath('biome') ~= '' then
  require('lspconfig').biome.setup{
    on_attach = on_attach
  }
end

-- Typos
-- Install: brew install typos-cli
-- if vim.fn.exepath('typos') ~= '' then
--   require('lspconfig').typos.setup{
--     on_attach = on_attach
--   }
-- end

-- SQL
-- Install: go install github.com/sqls-server/sqls@latest
-- TODO


-------------------------------
-- nvim-cmp
-------------------------------
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- for `vsnip` users.
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    -- 一旦コメントアウト
    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    -- ['<C-l>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})


-------------------------------
-- Lspsaga
-- https://github.com/glepnir/lspsaga.nvim
-------------------------------
require("lspsaga").setup({
  finder = {
    keys = {
      toggle_or_open = '<CR>',
    },
  },
  -- 使う機能以外はオフにしておく
  symbol_in_winbar = { enable = false }, -- 場所の表示をオフ
  beacon = { enable = false }, -- 移動時のハイライトをオフ
  ui = { code_action = '' },  -- コードアクションの電球マーク表示をオフ
})


-------------------------------
-- gitsigns
-------------------------------
require("gitsigns").setup {
  signs = {
    add          = {text = '+'},
    change       = {text = '~'},
    delete       = {text = '_'},
    topdelete    = {text = '‾'},
    changedelete = {text = '~'},
  },
  -- keymaps = {}, -- default mappingはオフ
  sign_priority = 6,
}


-------------------------------
-- lir.nvim (ファイラー)
-------------------------------
local actions = require("lir.actions")
-- local mark_actions = require("lir.mark.actions")
-- local clipboard_actions = require("lir.clipboard.actions")
require("lir").setup {
  show_hidden_files = true,
  devicons = { enable = true },
  mappings = {
    ['<CR>']  = actions.edit,

    ['-'] = actions.up,
    ['S'] = actions.split,
    ['V'] = actions.vsplit,
    -- ['Q'] = actions.quit,
    -- ['Y'] = actions.yank_path,
    -- ['M'] = actions.mkdir,
    -- ['E'] = actions.newfile,
    -- ['N'] = actions.rename,
    -- ['D'] = actions.delete,
    -- ['.'] = actions.toggle_show_hidden,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = true,
      highlight_dirname = true,
    },
  },
  hide_cursor = false,
}


-------------------------------
-- nvim-lint
-- https://github.com/mfussenegger/nvim-lint
-------------------------------
-- require('lint').linters_by_ft = {
--   -- ファイル名調べる: :lua print(vim.bo.filetype)
--   -- markdown = {'vale'}, -- エラー出るから一旦コメントアウト
--   go = {'golangcilint'}, -- Install: brew install golangci-lint
--   -- $ brew install typos-cli
-- }
-- 
-- -- 保存時に実行
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })


-------------------------------
-- Other Plugin
-------------------------------
require("nvim-autopairs").setup {}
require("lir.git_status").setup { show_ignored = false }
-- require("rest-nvim").setup { result_split_in_place = true }
require("fzf-lua").setup { winopts = { preview = { layout = 'vertical' } } }
-- require("nvim-test").setup {}
