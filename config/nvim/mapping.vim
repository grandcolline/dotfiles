" 甘えるな、hjklを使え
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>


"========================================
" Leaderの設定
"========================================
" Leaderをスペースに変更
let g:mapleader = "\<Space>"

nmap <leader>b :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <Leader>h <Plug>GitGutterNextHunk
nmap <Leader>H <Plug>GitGutterPrevHunk
map  <Leader>j 10j
map  <Leader>k 10k
nmap <leader>l :Lines<CR>
nmap <leader>o mzo<ESC>
nmap <leader>O mzO<ESC>
nmap <leader>r :Rg<CR>
nmap <leader>s :GFiles?<CR>
nmap <leader>t :BTags<CR>
nmap <Leader>v <Plug>GitGutterPreviewHunk
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader>/ <Plug>(easymotion-sn)

nmap <Leader><Tab> <C-w>w
nmap <Leader><Space> :set hlsearch!<CR>

