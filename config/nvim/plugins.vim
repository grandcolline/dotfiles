"========================================
" Dein
"========================================
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('$XDG_CONFIG_HOME/nvim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let g:rc_dir    = expand('$XDG_CONFIG_HOME/nvim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


"========================================
" ColorScheme
"========================================
syntax on
set background=dark
set t_Co=256
autocmd ColorScheme * highlight LineNr ctermfg=245

colorscheme Tomorrow-Night


"========================================
" Lightline
"========================================
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'filename', 'readonly', 'cocstatus', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'filetype': 'MyFiletype',
  \   'fileformat': 'MyFileformat',
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ }


"========================================
" Fugitive
"========================================
set updatetime=200                   " 反映されるまでの時間を変更
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '∙'


"========================================
" GitGutter
"========================================
" defaultのmappingはオフに
" keymapはkeymap.vimに。
let g:gitgutter_map_keys = 0


"========================================
" Fzf
"========================================
" keymapはkeymap.vimに。


"========================================
" EasyMotion
"========================================
" keymapはkeymap.vimに。
let g:EasyMotion_do_mapping = 0       " デフォルトのマッピングをオフ
let g:EasyMotion_smartcase = 1        " 検索時大文字小文字を区別しない
let g:EasyMotion_enter_jump_first = 1 " Enterで直近選択
"let g:EasyMotion_keys = 'wertasdfgyuiophjklzxcvbnm'


"========================================
" Coc
"========================================
" keymapはkeymap.vimに。
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_status_error_sign = "⨉ :"
let g:coc_status_warning_sign = "⚠ :"

"========================================
" Anzu
"========================================
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)

