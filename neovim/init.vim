filetype plugin on
filetype indent on

set autoread

set wildmenu
set ruler

set cmdheight=2
set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set lazyredraw

set magic

set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has('gui_macvim')
	autocmd GUIEnter * set vb t_vb=
endif

" ===

syntax enable

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set ai
set si
set wrap

" === Keymap

map <space> /
map <c-space> ?

" ===

set laststatus=2
