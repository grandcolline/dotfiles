-------------------------------
-- Plugin
--  再新化 :PackerSync
-------------------------------
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

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- use 'neovim/nvim-lspconfig'
  -- use 'nvim-lua/completion-nvim'

  use { 'wbthomason/packer.nvim', opt = true }
end)

-------------------------------
-- Iceberg
-------------------------------
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
-- Coc
-------------------------------
-- FIXME
-- 参考: https://blog.suzukishouten.co.jp/archives/2360
vim.cmd([[inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"]])
vim.cmd([[inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]])

function _G.check_back_space()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

function _G.show_documentation()
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    cmd('h ' .. vim.fn.expand(''))
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    cmd('! ' .. vim.o.keywordprg .. ' ' .. vim.fn.expand(''))
  end
end

vim.g.coc_status_error_sign = "E:"
vim.g.coc_status_warning_sign = "W:"


-------------------------------
-- nvim-lspconfig
-------------------------------
-- lua << EOF
-- local nvim_lsp = require('lspconfig')
--
-- -- エラー文言を表示しない
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
-- )
--
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   -- Mappings
--   -- refs: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
--   local opts = { noremap=true, silent=true }
--   ---- 定義ジャンプ
--   buf_set_keymap('n', '<Leader>g', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   ---- 定義表示
--   buf_set_keymap('n', '<Leader>d', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   ---- エラージャンプ
--   buf_set_keymap('n', '<Leader>e', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<Leader>E', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--
--   -- 補完設定
--   require'completion'.on_attach(client, bufnr)
-- end
--
-- -- LSPのセットアップ
-- nvim_lsp.gopls.setup{
--   on_attach = on_attach
-- }
-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach
-- }
-- nvim_lsp.rls.setup {
--   on_attach = on_attach,
--   settings = {
--     rust = {
--       unstable_features = true,
--       build_on_save = false,
--       all_features = true,
--     },
--   },
-- }
--
-- EOF
--
-- set completeopt=menuone,noinsert,noselect
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--
-- " Error -> Red
-- highlight LspDiagnosticsSignError        ctermfg=9
-- highlight LspDiagnosticsVirtualTextError ctermfg=9
-- highlight LspDiagnosticsUnderlineError   ctermfg=9
-- " Warning -> Yellow
-- highlight LspDiagnosticsSignWarning        ctermfg=11
-- highlight LspDiagnosticsVirtualTextWarning ctermfg=11
-- highlight LspDiagnosticsUnderlineWarning   ctermfg=11
-- " Info -> Green
-- highlight LspDiagnosticsSignInformation        ctermfg=35
-- highlight LspDiagnosticsVirtualTextInformation ctermfg=35
-- highlight LspDiagnosticsUnderlineInformation   ctermfg=35
-- " Hint -> Purple
-- highlight LspDiagnosticsSignHint        ctermfg=13
-- highlight LspDiagnosticsVirtualTextHint ctermfg=13
-- highlight LspDiagnosticsUnderlineHint   ctermfg=13


-------------------------------
-- Telescope
-------------------------------
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


-------------------------------
-- rest-console
-------------------------------
vim.g.vrc_set_default_mapping = 0
vim.g.vrc_auto_format_uhex    = 1
vim.g.vrc_curl_opts = { ['-sS'] = "", ['-i'] = ""}

