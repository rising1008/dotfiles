" 通知無効化
set visualbell t_vb=
set noerrorbells
" 起動画面(intro) 無効化
set shortmess+=I
" 行番号表示
set number
set relativenumber
set cursorline
" for light-line
set laststatus=2
set showtabline=2
set noshowmode

set clipboard=unnamed

scriptencoding utf-8

call plug#begin()
" Color Scheme
Plug 'joshdick/onedark.vim'
" 
Plug 'itchyny/lightline.vim'
" Filer
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc-around'
Plug 'LumaKernel/ddc-file'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/ddc-converter_remove_overlap'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/efm-langserver'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'
call plug#end()

let g:defx_icons_enable_syntax_highlight = 0
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''

call defx#custom#column('icon', {
  \ 'directory_icon': '▸ ',
  \ 'opened_icon': '▾ ',
  \ 'root_icon': '',
  \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹ ',
  \ 'Staged'    : '✚ ',
  \ 'Untracked' : '✭ ',
  \ 'Renamed'   : '➜ ',
  \ 'Unmerged'  : '═ ',
  \ 'Ignored'   : '☒ ',
  \ 'Deleted'   : '✖ ',
  \ 'Unknown'   : '? '
  \ })

call defx#custom#column('mark', {
  \ 'readonly_icon': '✗',
  \ 'selected_icon': '✓',
  \ })

" ウィンドウ幅
" 起動時に分割
" 'split': 'vertical',
" ファイルツリーを左側に表示
call defx#custom#option('_', {
  \ 'root_marker': '≡ ',
  \ 'winwidth': 50,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'buffer_name': 'explore',
  \ 'toggle': 1,
  \ 'resume': 1,
  \ 'columns': 'indent:icon:git:icons:filename',
  \ 'ignored_files': '.mypy_cache,.pytest_cache,.git,$XDG_CACHE_HOME,.DS_Store,__pycache__,.sass-cache,*.egg-info,*.pyc,*.swp'
  \ })

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort

  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')

  " ファイルを開く
  nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory() ? defx#do_action('open') :
    \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('multi', [['drop'], 'quit'])
  nnoremap <silent><buffer><expr><nowait> t
    \ defx#do_action('multi', ['quit', ['open', 'tab drop']])

  nnoremap <silent><buffer><expr> E
    \ defx#do_action('multi', ['quit', ['open', 'vsplit']])

  nnoremap <silent><buffer><expr> P
    \ defx#do_action('open', 'pedit')

  "  隠しファイルを表示/非表示する
  nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')

  "  親ディレクトリに移動する
  nnoremap <silent><buffer><expr> <BS>
    \ defx#do_action('cd', ['..'])

  " フォルダopenをトグル
  nnoremap <silent><buffer><expr> l
    \ defx#do_action('open_tree', 'toggle')

  " 【ESC】 / 【q】 defx.nvimを終了する
  nnoremap <silent><buffer><expr> <Esc>
    \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')

  " 【j】 カーソルを下に移動する
  nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'

  " カーソルを上に移動する
  nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
  " 新しいファイルを作成する
  nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')

  " ファイルを削除する
  nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')

  " ファイル/ディレクトリのパスをコピーする
  nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')

  " ファイルを実行する
  nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')

  " ファイル名を変更する
  nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')

  " ファイルをコピーする
  nnoremap <silent><buffer><expr> c
     \ defx#do_action('copy')

  " ファイルを貼り付ける
  nnoremap <silent><buffer><expr> p
     \ defx#do_action('paste')

  " 新しいディレクトリを作成する
  nnoremap <silent><buffer><expr> K
     \ defx#do_action('new_directory')
  " ファイルを移動する
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  
  " ウィンドウを水平分割してファイルを開く
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('open', 'split')
  
  " ウィンドウを垂直分割してファイルを開く
  nnoremap <silent><buffer><expr> v
  \ defx#do_action('open', 'vsplit')
  
  " ホームディレクトリに移動する
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  " Neovim上のカレントディレクトリを変更する
  nnoremap <silent><buffer><expr> -
  \ defx#do_action('change_vim_cwd')
endfunction

let g:lightline = {
\   'colorscheme': 'onedark',
\   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\   'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
\   'active': {
\     'left': [
\       ['mode', 'paste'],
\       ['readonly', 'filename', 'modified']
\     ]
\   }
\ }
let g:lightline.tab = {
\   'active': [ 'tabnum', 'filename', 'modified' ],
\   'inactive': [ 'tabnum', 'filename', 'modified' ]
\ }

let g:lsp_settings = {
    \ 'efm-langserver': {
        \ 'disabled': v:false
    \ },
\ }

call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'vim-lsp',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'vim-lsp': {
 \   'mark': 'LSP', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#enable()

let g:floaterm_title = 'terminal: [$1/$2]'
let g:floaterm_width = 0.7
let g:floaterm_height = 0.7

noremap <silent> <leader>to <C-\><C-n>:FloatermNew<CR>
noremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <leader>to <C-\><C-n>:FloatermNew<CR>
tnoremap <silent> <leader>t] <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <leader>t[ <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <leader>tc <C-\><C-n>:FloatermKill!<CR>
augroup vimrc_floaterm
    autocmd!
    autocmd QuitPre * FloatermKill!
augroup END

" Set Up Color Scheme
autocmd VimEnter * ++nested colorscheme onedark
" Bootstrap Filer
autocmd VimEnter * execute 'Defx'
" カスタムキーマップ
" jj でノーマルモード
inoremap <silent> jj <ESC>
" 行番号表示の絶対・相対のトグル
nnoremap <C-n> :<C-u>setlocal relativenumber!<CR>
" Defxのトグル
nnoremap <silent> <C-f> :<C-u> Defx <CR>

inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
