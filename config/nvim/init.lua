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

  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').set_icon({
        lir_folder_icon = {
          icon = "",
          color = "#7ebae4",
          name = "LirFolderNode"
        }
      })
    end
  }

  use 'nvim-lua/plenary.nvim' -- used by rest.nvim / gitsigns.nvim

  use 'nvim-treesitter/nvim-treesitter'
  use "rebelot/kanagawa.nvim"

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = {text = '+'},
          change       = {text = '~'},
          delete       = {text = '_'},
          topdelete    = {text = '‾'},
          changedelete = {text = '~'},
        },
        keymaps = {}, -- default mappingはオフ
        sign_priority = 6,
      }
    end
  }

  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end
  }

  use 'Townk/vim-autoclose'
  use 'yuttie/comfortable-motion.vim'
  use 'ntpeters/vim-better-whitespace'
  use 'tamago324/lir.nvim'
  use 'tyru/open-browser.vim'

  -- curl
  use 'diepm/vim-rest-console'
  use {
    'NTBBloodbath/rest.nvim',
    config = function()
      require("rest-nvim").setup({
        result_split_in_place = true,
        env_file = 'vars.http'
      })
    end
  }

  use 'hoob3rt/lualine.nvim'
  -- use 'arkav/lualine-lsp-progress'

  use 'vijaymarupudi/nvim-fzf'
  use {
    'ibhagwan/fzf-lua',
    config = function()
      require'fzf-lua'.setup {
        winopts = {
          preview = {
            layout = 'vertical' -- horizontal|vertical|flex
          }
        }
      }
    end
  }

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
vim.cmd('command! Q q') -- vim.api.nvim_add_user_command('Q', 'q', {})
vim.cmd('command! W w') -- vim.api.nvim_add_user_command('W', 'w', {})
vim.cmd('command! WQ wq') -- vim.api.nvim_add_user_command('WQ', 'wq', {})
vim.cmd('command! Wq wq') -- vim.api.nvim_add_user_command('Wq', 'wq', {})

-- Terminalモード
vim.cmd('autocmd TermOpen * startinsert') -- 常にInsertModeでスタート
vim.cmd('command! -nargs=* Te bo sp | te <args>')
-- vim.api.nvim_add_user_command('Te', 'bo sp | te <args>', { nargs = * })

-- Fold(折りたたみ)
vim.opt.foldtext = [[getline(v:foldstart)]]

-- luaにできなかったもの
-- set undodir=$XDG_CONFIG_HOME/nvim/cache
-- set backupdir=$XDG_CONFIG_HOME/nvim/cache
-- set viminfo+=n$XDG_CONFIG_HOME/nvim/cache/nviminfo

-- 🚀
if vim.fn.has('nvim-0.8') == 1 then
  vim.opt.cmdheight = 0
end
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

-- Leader を使ったキーマッピング
-- なるべくデフォルトのキーマッピングを無くさないように
-- 独自のマッピングは極力 Leader を使うようにする。
vim.g.mapleader = " "

map('n', '<LEADER>b', '<cmd>lua require("fzf-lua").buffers()<CR>', {})
map('n', '<LEADER>c', ':call VrcQuery()<CR>', {})
map('n', '<LEADER>C', '<cmd>lua require("rest-nvim").run()<CR>', {})
map('n', '<LEADER>f', '<cmd>lua require("fzf-lua").files()<CR>', {})
map('n', '<LEADER>h', ':Gitsigns next_hunk<CR>', {})
map('n', '<LEADER>H', ':Gitsigns prev_hunk<CR>', {})
map('',  '<LEADER>k', '<Plug>(openbrowser-smart-search)', {})
map('n', '<LEADER>l', '<cmd>lua require("fzf-lua").lines()<CR>', {})
map('n', '<LEADER>o', 'mzo<ESC>', {})
map('n', '<LEADER>O', 'mzO<ESC>', {})
map('n', '<LEADER>r', '<cmd>lua require("fzf-lua").live_grep()<CR>', {})
map('n', '<LEADER>s', '<cmd>lua require("fzf-lua").git_status()<CR>', {})
map('n', '<LEADER>v', ':Gitsigns preview_hunk<CR>', {})
map('n', '<LEADER>x', ':TroubleToggle<CR>', {})

map('n', '<LEADER>j',       '<cmd>lua require("hop").hint_words()<cr>', { noremap = true })
map('n', '<LEADER>/',       '<cmd>lua require("hop").hint_patterns()<cr>', { noremap = true })
map('n', '<LEADER><Tab>',   '<C-w>w', {})
map('n', '<LEADER><Space>', ':set hlsearch!<CR>', {})
map('n', '<LEADER>-', ':e %:h<CR>', { noremap = true, silent = true }) -- 現在フォルダを開く
map('n', '<LEADER><BS>',    ':bd!<CR>', {}) -- buffer 削除
-- map('n', '<LEADER><CR>',    ':Te ', { noremap = true })
map('n', '<LEADER><CR>',    ':! ', { noremap = true })

map('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })


-------------------------------
-- ColorScheme
-------------------------------
vim.cmd('syntax on')

local my_colors = {
  bg = 'none', -- 背景色をなくす
}
require'kanagawa'.setup({ colors = my_colors })
vim.cmd('colorscheme kanagawa')

-- vim.cmd('hi Visual  ctermbg=241')      -- Visual(選択範囲)の白を濃くする
-- vim.cmd('hi Comment ctermfg=102')      -- コメントちょっと濃く
-- vim.cmd('hi LineNr  ctermfg=102')      -- 行番号ちょっと濃く
-- vim.cmd('hi CursorLineNr ctermfg=180') -- 現在行番号ハイライト

-- highlight LspDiagnosticsSignError        ctermfg=9
-- highlight LspDiagnosticsVirtualTextError ctermfg=9
-- highlight LspDiagnosticsUnderlineError   ctermfg=9


-------------------------------
-- Treesitter
-------------------------------
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true, -- syntax highlightを有効に
    disable = {
      -- errorが出るものをoffにする
      'lua',
      'javascript',
      'html',
    }
  },
  -- ensure_installed='maintained' will be removed April 30, 2022. Specify parsers explicitly or use 'all'.
  -- ensure_installed = 'maintained', -- :TSInstall maintainedと同じ
  indent = {
    enable = true, -- tree-sitterによるインデントを有効に
    disable = {
      'javascript',
    }
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
    lualine_b = {
      {
        -- 'diagnostics',
        sources = {'nvim_diagnostic'},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      },
    },
    -- lualine_c = {'lsp_progress'},
    lualine_c = {'filename', 'diff', 'diagnostics'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    -- lualine_c = {'lsp_progress'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}


-------------------------------
-- lsp-config
-------------------------------
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<LEADER>d', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<LEADER>e', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<LEADER>E', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<LEADER>g', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', '<LEADER>i', '<cmd>lua require("fzf-lua").lsp_implementations()<CR>', {})
  map('n', '<LEADER>G', '<cmd>lua require("fzf-lua").lsp_references()<CR>', {})
end

-- エラー文言を表示しない
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- error signを優先して表示
vim.diagnostic.config {
  severity_sort = true
}

-- local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
-- for type, icon in pairs(signs) do
--   local hl = "LspDiagnosticsSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end


----------------------
-- nvim-cmp SETUP
----------------------
local cmp = require'cmp'

vim.opt.completeopt = 'menu,menuone,noselect'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
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


----------------------
-- LSP SERVER SETUP
----------------------
-- TypeScript
-- Install: npm install -g typescript-language-server
nvim_lsp.tsserver.setup {
  on_attach = on_attach
}
-- Golang
-- Install: go install golang.org/x/tools/gopls@latest
nvim_lsp.gopls.setup{
  on_attach = on_attach
}
-- Rust
-- Install: brew install rust-analyzer
nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach
}
-- Terraform
-- Install: brew install hashicorp/tap/terraform-ls
nvim_lsp.terraformls.setup{
  on_attach = on_attach
}


-------------------------------
-- rest-console
-------------------------------
vim.g.vrc_set_default_mapping = 0
vim.g.vrc_auto_format_uhex    = 1
vim.g.vrc_curl_opts = { ['-sS'] = "", ['-i'] = ""}

local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'


-------------------------------
-- lir.nvim
-------------------------------
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'
require'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['<CR>']  = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,

    ['-']     = actions.up,
    ['q']     = actions.quit,
    ['y']     = actions.yank_path,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = true,
      highlight_dirname = true
    },
  },
  hide_cursor = false,
}
