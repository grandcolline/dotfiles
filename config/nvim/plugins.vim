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
  \             [ 'fugitive', 'filename', 'readonly', 'ale', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
  \ },
  \ 'component_function': {
  \   'ale': 'LLAle',
  \   'filetype': 'MyFiletype',
  \   'fileformat': 'MyFileformat',
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '⮀ ', 'right': ' ' },
  \ 'subseparator': { 'left': '⮁ ', 'right': ' ⮃' }
  \ }

if dein#tap('ale')
  function! LLAle()
    let l:count = ale#statusline#Count(bufnr(''))
    let l:errors = l:count.error + l:count.style_error
    let l:warnings = l:count.warning + l:count.style_warning
    return l:count.total == 0 ? '' : '⨉ :' . l:errors . ' ⚠ :' . l:warnings
  endfunction
else
  function! LLAle()
    return ''
  endfunction
endif

" vim-deviconsの設定
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction


"========================================
" NERDTree
"========================================
let g:NERDTreeWinSize = 30                 " 横幅の大きさ
let g:NERDTreeShowHidden = 1               " 不可視ファイルを表示する
let g:NERDTreeDirArrows = 1
" 全て閉じた時にNerdTreeも閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" keymapはkeymap.vimに。


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
" Deoplete
"========================================
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"


"========================================
" Anzu
"========================================
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)


"========================================
" ALE
"========================================
let g:ale_sign_column_always = 1       " 常に左側にスペースを確保
let g:ale_set_highlights = 0           " ハイライトしない
let g:ale_lint_on_text_changed = 0     " 保存時のみ実行する
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
"highlight link ALEWarningSign String
"highlight link ALEErrorSign Title


"========================================
" Easy Align
"========================================
vmap <Enter> <Plug>(EasyAlign)

