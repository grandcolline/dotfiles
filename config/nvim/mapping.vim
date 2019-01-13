" 甘えるな、hjklを使え
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

" ctags
nnoremap <C-]> g<C-]>

" ESCでターミナルモードから抜ける
"tnoremap <silent> <ESC> <C-\><C-n>

" 検索にeasymotionを
map / <Plug>(easymotion-sn)


"========================================
" Leaderの設定
"========================================
" Leaderをスペースに変更
let mapleader = "\<Space>"

" easymotion
"map  <Leader><Space> <Plug>(easymotion-bd-w)
"nmap <Leader><Space> <Plug>(easymotion-overwin-w)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"map  <Leader>l <Plug>(easymotion-bd-jk)
"nmap <Leader>l <Plug>(easymotion-overwin-line)

" Tabでウィンドウ移動
nmap <Leader><Tab> <C-w>w

" 大きく移動
map <Leader>j <Plug>(signjk-j)
map <Leader>k <Plug>(signjk-k)

" ノーマルモードで行追加
noremap <leader>o mzo<ESC>
noremap <leader>O mzO<ESC>

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>b :Buffers<CR>
"nnoremap <leader>w :Windows<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>ag :Ag<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

