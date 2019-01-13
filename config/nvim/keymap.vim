" 甘えるな、hjklを使え
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

" ctags
nnoremap <C-]> g<C-]>

" Leaderをスペースに変更
let mapleader = "\<Space>"

" 大きく移動
noremap <leader>j 15j
noremap <leader>k 15k

" ノーマルモードで行追加
nnoremap <leader>o mzo<ESC>
nnoremap <leader>O mzO<ESC>

" Tabでウィンドウ移動
nmap <Leader><Tab> <C-w>w

" ESCでターミナルモードから抜ける
"tnoremap <silent> <ESC> <C-\><C-n>

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>ag :Ag<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

