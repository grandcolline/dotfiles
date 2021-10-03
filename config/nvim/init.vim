"            _
"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
"

"-----------------------------
" Packer.nvim
"   再新化 :PackerSync
"-----------------------------
lua <<EOF
  vim.cmd[[packadd packer.nvim]]

  require'packer'.startup(function()
    use 'cocopon/iceberg.vim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'cocopon/iceberg.vim'
    use 'airblade/vim-gitgutter'
    use 'Townk/vim-autoclose'
    use 'yuttie/comfortable-motion.vim'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'hoob3rt/lualine.nvim'
    use 'bronson/vim-trailing-whitespace'
    use 'mattn/vim-molder'
    use 'tyru/open-browser.vim'
    use 'diepm/vim-rest-console'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use {
      'phaazon/hop.nvim',
      as = 'hop',
      config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }

    -- use 'neovim/nvim-lspconfig'
    -- use 'nvim-lua/completion-nvim'
    -- use 'LeafCage/foldCC.vim'

    use { 'wbthomason/packer.nvim', opt = true }
  end)
EOF


"-----------------------------
" General
"-----------------------------
lua <<EOF
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
EOF

" luaにできなかったもの
" set undodir=$XDG_CONFIG_HOME/nvim/cache
" set backupdir=$XDG_CONFIG_HOME/nvim/cache
" set viminfo+=n$XDG_CONFIG_HOME/nvim/cache/nviminfo


"-----------------------------
" Key Mapping
"-----------------------------
lua <<EOF
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

  map('n', '<LEADER>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', {})
  map('n', '<LEADER>c', ':call VrcQuery()<CR>', {})
  map('n', '<LEADER>d', ':call <SID>show_documentation()<CR>', {})
  map('n', '<LEADER>e', '<Plug>(coc-diagnostic-next)', {})
  map('n', '<LEADER>E', '<Plug>(coc-diagnostic-prev)', {})
  map('n', '<LEADER>f', '<cmd>lua require("telescope.builtin").find_files()<cr>', {})
  map('n', '<LEADER>g', '<Plug>(coc-definition)', {})
  map('n', '<LEADER>G', '<Plug>(coc-references)', {})
  map('n', '<LEADER>h', '<Plug>(GitGutterNextHunk)', {})
  map('n', '<LEADER>H', '<Plug>(GitGutterPrevHunk)', {})
  map('n', '<LEADER>i', '<Plug>(coc-implementation)', {})
  map('n', '<LEADER>j', '<cmd>lua require("hop").hint_patterns()<cr>', {})
  map('',  '<LEADER>k', '<Plug>(openbrowser-smart-search)', {})
  map('n', '<LEADER>n', '<Plug>(coc-rename)', {})
  map('n', '<LEADER>o', 'mzo<ESC>', {})
  map('n', '<LEADER>O', 'mzO<ESC>', {})
  map('n', '<LEADER>r', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {})
  map('n', '<LEADER>s', '<cmd>lua require("telescope.builtin").git_status()<cr>', {})
  map('n', '<LEADER>v', '<Plug>(GitGutterPreviewHunk)', {})
  map('n', '<LEADER><Tab>',   '<C-w>w', {})
  map('n', '<LEADER><Space>', ':set hlsearch!<CR>', {})
  map('n', '<LEADER><BS>',    ':bd<CR>', {})
  map('n', '<LEADER><CR>',    ':! ', { noremap = true })
EOF


"-----------------------------
" ColorScheme
"-----------------------------
lua <<EOF
  vim.cmd('syntax on')
  vim.cmd('colorscheme iceberg')

  vim.cmd('hi Visual  ctermbg=241')      -- Visual(選択範囲)の白を濃くする
  vim.cmd('hi Comment ctermfg=102')      -- コメントちょっと濃く
  vim.cmd('hi LineNr  ctermfg=102')      -- 行番号ちょっと濃く
  vim.cmd('hi CursorLineNr ctermfg=180') -- 現在行番号ハイライト
EOF


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
lua << EOF
  -- 反映されるまでの時間を変更
  vim.opt.updatetime = 200

  vim.g.gitgutter_map_keys      = 0 -- defaultのmappingはオフ
  vim.g.gitgutter_sign_added    = '+'
  vim.g.gitgutter_sign_modified = '∙'
  vim.g.gitgutter_sign_removed  = '-'
  vim.g.gitgutter_sign_modified_removed = '∙'
EOF


"-----------------------------
" Hop
"-----------------------------
lua <<EOF
  vim.cmd('hi HopNextKey ctermfg=198')
EOF


"-----------------------------
" Molder
"-----------------------------
lua << EOF
  -- 隠しファイルも表示
  vim.g.molder_show_hidden = 1
EOF


"-----------------------------
" Coc
"-----------------------------
" FIXME
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

lua << EOF

  -- function _G.show_documentation()
  --   if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
  --     vim.cmd('h ' .. fn.expand(''))
  --   elseif vim.api.nvim_eval('coc#rpc#ready()') then
  --     vim.fn.CocActionAsync('doHover')
  --   else
  --     vim.cmd('! ' .. vim.o.keywordprg .. ' ' .. vim.fn.expand(''))
  --   end
  -- end

  vim.g.coc_status_error_sign = "E:"
  vim.g.coc_status_warning_sign = "W:"
EOF


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
" Telescope
"-----------------------------
lua <<EOF
  require('telescope').setup{
    defaults = {},
    pickers = {
      find_files = {
        theme = "ivy",
      },
      buffers = {
        theme = "ivy",
      },
      git_status = {
        theme = "ivy",
      },
      live_grep = {
        theme = "ivy",
      }
    },
    extensions = {}
  }
EOF


"-----------------------------
" rest-console
"-----------------------------
lua <<EOF
  vim.g.vrc_set_default_mapping = 0
  vim.g.vrc_auto_format_uhex    = 1
  vim.g.vrc_curl_opts = { ['-sS'] = "", ['-i'] = ""}
EOF

