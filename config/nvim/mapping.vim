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

nmap <Leader>b :Buffers<CR>
nmap <Leader>d :call <SID>show_documentation()<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gt <Plug>(coc-type-definition)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>h <Plug>GitGutterNextHunk
nmap <Leader>H <Plug>GitGutterPrevHunk
map  <Leader>j 10j
map  <Leader>k 10k
nmap <Leader>l :Lines<CR>
nmap <Leader>n <Plug>(coc-rename)
nmap <Leader>o mzo<ESC>
nmap <Leader>O mzO<ESC>
nmap <Leader>r :Rg<CR>
nmap <Leader>s :GFiles?<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>v <Plug>GitGutterPreviewHunk
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader>/ <Plug>(easymotion-sn)

nmap <Leader><Tab> <C-w>w
nmap <Leader><Space> :set hlsearch!<CR>

