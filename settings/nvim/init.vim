" 設定
" 通知無効化
set visualbell t_vb=
set noerrorbells

" 行番号表示
set number
set relativenumber
set cursorline
set autoindent
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set encoding=utf-8
set hlsearch
set incsearch
set laststatus=2
set shortmess+=I
set nobackup
set noswapfile
" 起動画面(intro)無効化
set shortmess+=I

set clipboard=unnamed
" スペルチェック有効化
" set spell
" set spelllang=en,cjk
" 改行、タブ文字、行末スペースの表示・非表示
" 行末: '$' | タブ: '>...' | 末尾のスペース: '_' 
set listchars=eol:$,tab:>.,trail:_
set list
" 縦分割する際に右に開く
set splitright
" マウス操作有効化
set mouse=a

" leader key 設定
let mapleader = "\<Space>"

" Set Up Pre-Process
" see: https://wiredool.hatenadiary.org/entry/20120618/1340019962
" ファイルタイプの自動検出を無効化
filetype off
" ファイルタイプ関連プラグインの自動読み込みを無効化
filetype plugin indent off

" let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global)/bin/python") || echo -n $(which python3)')

" [begin] プラグイン管理

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:nvim_config_dir = expand('~/.config/nvim')
let s:dein_toml = s:nvim_config_dir . '/dein.toml'
let s:dein_lazy_toml = s:nvim_config_dir . '/dein_lazy.toml'

" existance check & install
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add(s:dein_dir)
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
  call dein#remote_plugins()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

" [end] プラグイン管理

" カスタムキーマップ

inoremap <silent> jj <ESC>
" 行番号表示の絶対・相対のトグル
nnoremap <C-n> :<C-u>setlocal relativenumber!<CR>

" Set Up Post-Process
" ファイルタイプの自動検出/ファイルタイプ関連プラグイン・インデント設定の自動読み込みを有効化
filetype plugin indent on
syntax enable
