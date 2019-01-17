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

nmap <leader>a :Ag<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <Leader>h <Plug>GitGutterNextHunk
nmap <Leader>H <Plug>GitGutterPrevHunk
map  <Leader>j <Plug>(signjk-j)
map  <Leader>k <Plug>(signjk-k)
nmap <leader>l :Lines<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>o mzo<ESC>
nmap <leader>O mzO<ESC>
nmap <leader>s :GFiles?<CR>
nmap <leader>t :BTags<CR>
nmap <Leader>v <Plug>GitGutterPreviewHunk
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nmap <Leader><Tab>    <C-w>w
nmap <Leader><Space>  :noh<return>

