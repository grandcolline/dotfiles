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

map('n', '<LEADER>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', {})
map('n', '<LEADER>c', ':call VrcQuery()<CR>', {})
map('n', '<LEADER>d', '<cmd>lua _G.show_documentation()<cr>', {noremap = false, silent = true})
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

