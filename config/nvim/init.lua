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
  {
    'nvim-treesitter/nvim-treesitter',
    branch = "main",
    build = ':TSUpdate',
    init = function()
      vim.treesitter.language.register("bash", "zsh")
    end,
    config = function()
      require("nvim-treesitter").install({
        -- :TSInstallInfo で確認できる
        'bash', 'diff', 'dockerfile', 'fish', 'go', 'gomod', 'graphql', 'hcl', 'http',
        'html', 'json', 'lua', 'make', 'markdown', 'markdown_inline', 'proto',
        'rust', 'sql', 'terraform', 'toml', 'tsx', 'typescript', 'vim', 'yaml',
      })

      -- Highlighting
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
  'kyazdani42/nvim-web-devicons', -- icon
  'rebelot/kanagawa.nvim', -- color scheme
  'hoob3rt/lualine.nvim',  -- status line
  'ntpeters/vim-better-whitespace', -- 行末空白のハイライト

  -- for git
  'lewis6991/gitsigns.nvim',

  -- Filer
  'tamago324/lir.nvim',
  'tamago324/lir-git-status.nvim',

  -- for Fazzy Search
  'vijaymarupudi/nvim-fzf',
  'ibhagwan/fzf-lua',

  -- for LSP
  -- 'neovim/nvim-lspconfig', -- LSP の config 設定読み込み
  'nvimdev/lspsaga.nvim', -- LSP の UI をよくする

  -- 補完
  { 'saghen/blink.cmp', version = '1.*' },

  -- 'hrsh7th/nvim-cmp',
  -- 'hrsh7th/cmp-nvim-lsp',
  -- 'hrsh7th/vim-vsnip',
  -- 'hrsh7th/cmp-buffer',
  -- 'hrsh7th/cmp-path',

  -- for curl
  -- 'hudclark/grpc-nvim',     -- .grcp ファイルのやつ
  -- 'NTBBloodbath/rest.nvim', -- .rest ファイルのやつ

  -- copilot
  "zbirenbaum/copilot.lua",

  -- open browser
  'tyru/open-browser.vim',        -- ブラウザで開く

  -- for test
  -- 'klen/nvim-test', -- テスト実行

  'yuttie/comfortable-motion.vim',  -- ぬるぬるスクロール
})

require('blink.cmp').setup({
  keymap = {
    preset = 'none',
    ['<Up>']   = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<CR>']   = { 'select_and_accept', 'fallback' },
  },
  completion = {
    trigger = { show_on_insert = true },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
  },
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
-- vim.opt.lazyredraw  = true            -- Neovim 0.12 で削除済みのため無効化
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

map('n', '<LEADER>A', '<cmd>Lspsaga code_action<CR>', { silent = true }) --------------- a: [LSP] コードアクション (action)
map('n', '<LEADER>b', '<cmd>lua require("fzf-lua").buffers()<CR>', {}) ----------------- b: [FZF] buffer 検索 (buffer)
-- map('n', '<LEADER>c', '<cmd>RestNvim<CR>', {}) ---------------------------------------c: .html で curl 実行 (curl)
map('', '<LEADER>c', '<cmd>lua copy_file_path_with_line()<CR>', {}) -------------------- c: ファイル名と行番号をコピー (copy)
map('n', '<LEADER>e', "<cmd>lua vim.diagnostic.jump({count=1, float=true})<CR>", {}) --- e: [LSP] 後の警告にジャンプして内容を表示 (error)
map('n', '<LEADER>E', "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<CR>", {}) -- E: [LSP] 前の警告にジャンプして内容を表示 (error)
map('n', '<LEADER>f', '<cmd>lua require("fzf-lua").files()<CR>', {}) ------------------- f: [FZF] file 検索 (file)
map('i', '<C-f>',     '<cmd>lua insert_filepath_with_fzf()<CR>', {}) ------------------- Ctrl+f: [FZF] ファイルパス挿入 (file)
map('n', '<LEADER>g', '<cmd>lua vim.lsp.buf.definition()<CR>', {}) --------------------- g: [LSP] 定義ジャンプ (go)
map('n', '<LEADER>G', '<cmd>Lspsaga finder<CR>', { silent = true }) -------------------- G: [LSP] LSP Finder (go)
map('n', '<LEADER>h', ':Gitsigns next_hunk<CR>', {}) ----------------------------------- h: 次の hunk へジャンプ (hunk)
map('n', '<LEADER>H', ':Gitsigns prev_hunk<CR>', {}) ----------------------------------- H: 前の hunk へジャンプ (hunk)
map('',  '<LEADER>k', '<Plug>(openbrowser-smart-search)', {}) -------------------------- k: ブラウザで検索 (kensaku)
map('n', '<LEADER>K', '<cmd>Lspsaga hover_doc<CR>', { silent = true }) ----------------- K: [LSP] ドキュメント表示
map('n', '<LEADER>n', '<cmd>Lspsaga rename<CR>', { silent = true }) -------------------- n: [LSP] リネーム (name)
map('n', '<LEADER>o', 'mzo<ESC>', {}) -------------------------------------------------- o: 下に空行追加 (o)
map('n', '<LEADER>O', 'mzO<ESC>', {}) -------------------------------------------------- O: 上に空行追加 (o)
map('n', '<LEADER>r', '<cmd>lua require("fzf-lua").live_grep()<CR>', {})  -------------- r: [FZF] ripgrep 検索 (rg)
map('i', '<C-r>',     '<cmd>lua insert_grep_result_with_fzf()<CR>', {}) ---------------- Ctrl+r: [FZF] grep 結果挿入 (rg)
map('n', '<LEADER>s', '<cmd>lua require("fzf-lua").git_status()<CR>', {}) -------------- s: [FZF] git status 検索 (status)
map('n', '<LEADER>t', ':TestNearest<CR>', {}) ------------------------------------------ t: 現在行のテスト実行 (test)
map('n', '<LEADER>T', ':TestLast<CR>', {}) --------------------------------------------- T: 最後に行ったテスト実行 (test)
map('n', '<LEADER>v', ':Gitsigns preview_hunk<CR>', {}) -------------------------------- v: git 差分表示 (view)
map('n', '<LEADER>x', ':TroubleToggle<CR>', {}) ---------------------------------------- x: LSP の警告一覧表示 (ばつ)

map('n', '<LEADER><Tab>',   '<C-w>w', {}) ---------------------------------------------- tab: Window 切り替え
map('n', '<LEADER><S-Tab>', '<C-w>W', {}) ---------------------------------------------- tab: Window 切り替え
map('n', '<LEADER><Space>', ':set hlsearch!<CR>', {}) ---------------------------------- Space: 検索のハイライト
map('n', '<LEADER>-',       ':e %:h<CR>', { noremap = true, silent = true }) ----------- -: 現在フォルダを開く
map('n', '<LEADER><BS>',    ':bd!<CR>', {}) -------------------------------------------- Delete: buffer 削除 (delete)
map('n', '<LEADER><CR>',    ':! ', { noremap = true }) --------------------------------- Enter: コマンド入力

-- fzf-lua でファイル検索して、選択したファイルパスをカーソル位置に挿入
function insert_filepath_with_fzf()
  require('fzf-lua').files({
    actions = {
      ['default'] = function(selected)
        if selected and #selected > 0 then
          local path = require('fzf-lua.path')
          local filepath = path.entry_to_file(selected[1]).path
          vim.api.nvim_put({filepath}, 'c', true, true)
        end
      end
    }
  })
end

-- fzf-lua で ripgrep 検索して、選択した結果のファイル名:行数:ポジションをカーソル位置に挿入
function insert_grep_result_with_fzf()
  require('fzf-lua').live_grep({
    actions = {
      ['default'] = function(selected)
        if selected and #selected > 0 then
          local path = require('fzf-lua.path')
          local entry = path.entry_to_file(selected[1])
          local result = entry.path .. ':' .. entry.line .. ':' .. entry.col
          vim.api.nvim_put({result}, 'c', true, true)
        end
      end
    }
  })
end


-------------------------------
-- ColorScheme
-------------------------------
vim.cmd('syntax on')

require("kanagawa").setup({
  transparent = true, -- 背景色を設定しない
})
vim.cmd('colorscheme kanagawa')


-------------------------------
-- TreeSitter
-------------------------------
-- NOTE: tree-sitterが荒ぶったら
--  1. brew upgrade tree-sitter
--  2. :TSUpdate
-- require("nvim-treesitter.configs").setup {
--   highlight = {
--     enable = true, -- syntax highlightを有効に
--     disable = {
--       -- errorが出るものをoffにする
--     },
--   },
--   -- ensure_installed = 'maintained', -- :TSInstall maintainedと同じ
--   ensure_installed = {
--     -- :TSInstallInfo で確認できる
--     'bash', 'diff', 'dockerfile', 'fish', 'go', 'gomod', 'graphql', 'hcl', 'http',
--     'html', 'json', 'lua', 'make', 'markdown', 'markdown_inline', 'proto',
--     'rust', 'sql', 'terraform', 'toml', 'tsx', 'typescript', 'vim', 'yaml',
--   },
--   indent = {
--     enable = true, -- tree-sitterによるインデントを有効に
--     disable = {
--       'javascript',
--     },
--   },
-- }

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
---------------
-- TypeScript
---------------
-- Install: brew install typescript-language-server
if vim.fn.exepath('typescript-language-server') ~= '' then
  vim.lsp.enable('ts_ls')

  -- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ts_ls.lua
  vim.lsp.config.ts_ls= {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' },
  }
end

-- Install: npm i -g @biomejs/biome
if vim.fn.exepath('biome') ~= '' then
  vim.lsp.enable('biome')

  -- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/biome.lua
  vim.lsp.config.biome = {
    cmd = { 'biome' },
    filetypes = {
      'astro',
      'css',
      'graphql',
      'html',
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'svelte',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
    },
  }
end

---------------
-- Golang
---------------
-- Install: go install golang.org/x/tools/gopls@latest
if vim.fn.exepath('gopls') ~= '' then
  vim.lsp.enable('gopls')

  -- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/gopls.lua
  vim.lsp.config.gopls = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.mod', 'go.work' },
  }
end

-- Install: brew install golangci-lint
-- Install: go install github.com/nametake/golangci-lint-langserver@latest
if vim.fn.exepath('golangci-lint-langserver') ~= '' then
  vim.lsp.enable('golangci_lint_ls')

  -- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/golangci_lint_ls.lua
  vim.lsp.config.golangci_lint_ls = {
    cmd = { 'golangci-lint-langserver' },
    filetypes = { 'go', 'gomod' },
    init_options = {
      command = { 'golangci-lint', 'run', '--output.json.path=stdout', '--show-stats=false' },
    },
    root_markers = {
      '.golangci.yml',
      '.golangci.yaml',
      '.golangci.toml',
      '.golangci.json',
      'go.work',
      'go.mod',
    },
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
-- if vim.fn.exepath('terraform-ls') ~= '' then
--   vim.lsp.enable('terraformls')
-- end

-- Python
-- Install: brew install pyright
-- if vim.fn.exepath('pyright') ~= '' then
--   require('lspconfig').pyright.setup{
--     on_attach = on_attach
--   }
-- end


-------------------------------
-- nvim-cmp
-------------------------------
-- local cmp = require("cmp")
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       vim.fn["vsnip#anonymous"](args.body) -- for `vsnip` users.
--     end,
--   },
--   sources = {
--     { name = "nvim_lsp" },
--     { name = "buffer" },
--     { name = "path" },
--   },
--   mapping = cmp.mapping.preset.insert({
--     -- 一旦コメントアウト
--     -- ['<C-p>'] = cmp.mapping.select_prev_item(),
--     -- ['<C-n>'] = cmp.mapping.select_next_item(),
--     -- ['<C-l>'] = cmp.mapping.complete(),
--     -- ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm { select = true },
--   }),
--   experimental = {
--     ghost_text = true,
--   },
-- })


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

    -- 相対パスをコピー
    ['y'] = function()
      local ctx = require'lir'.get_context()
      -- ctx.dir (現在のディレクトリ) と ctx:current_value() (ファイル名) を結合
      local full_path = ctx.dir .. ctx:current_value()

      -- fnamemodify でカレントディレクトリからの相対パスに変換
      -- ':. ' は Neovim が起動している場所 (cwd) からのパスを作ります
      local relative_path = vim.fn.fnamemodify(full_path, ':.')

      vim.fn.setreg('+', relative_path)
    end,
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

-- -- 保存時に実行
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })


-------------------------------
-- Other Plugin
-------------------------------
-- require("nvim-autopairs").setup {}
require("lir.git_status").setup { show_ignored = false }
-- require("rest-nvim").setup { result_split_in_place = true }
require("fzf-lua").setup { winopts = { preview = { layout = 'vertical' } } }
-- require("nvim-test").setup {}


-------------------------------
-- 独自関数
-------------------------------
-- 現在のファイル名と行番号をコピー
-- Normal モード: "path/file_name.txt:17" の形式
-- Visual モード (複数行): "path/file_name.txt:17-20" の形式
-- Visual モード (1行): "path/file_name.txt:17" の形式
function copy_file_path_with_line()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  local mode = vim.fn.visualmode()

  local result
  if mode ~= '' then
    -- Visual モードで選択されていた場合
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    if start_line == end_line then
      -- 1行だけ選択された場合
      result = path .. ":" .. start_line
    else
      -- 複数行選択された場合
      result = path .. ":" .. start_line .. "-" .. end_line
    end
  else
    -- Normal モードの場合
    local line = vim.fn.line(".")
    result = path .. ":" .. line
  end

  vim.fn.setreg('+', result)
end
