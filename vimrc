" use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
set nocompatible
filetype off                " required for vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle managers Vundle
Bundle 'gmarik/vundle'

" Other bundles go here
Bundle 'scrooloose/nerdtree'

" Vundle help
" :BundleList            - List configured bundles
" :BundleInstall(!)     - Install (update) bundles
" :BundleSearch(!) foo  - search (or refresh cache first for foo
" :BundleClean(!)       - Confirm (or auto-approved) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed

filetype plugin indent on   " enable detection, plugins and indenting
syntax on

let mapleader=","  " change leader key to ,
" Quickly reload the vimrc file
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden
set nowrap       " don't wrap lines
set tabstop=2    " tab is two spaces
set expandtab    " expand tab to spaces
set backspace=indent,eol,start
                 " allow backspacing over everything in insert mode
set autoindent   " always set autoindenting on
set copyindent   " copy the previous indentation on autoindenting
set number       " show line numbers
set ruler
set shiftwidth=2 " number of spaces for auto indenting
set shiftround   " use multiple of shiftwidth when indenting with '<' and '
set showmatch    " set show matching parenthesis
set ignorecase   " ignore case when searching
set smartcase    " ignore case if search pattern is all lowercase
                 "     case-sensitive otherwise
set smarttab     " insert tabs on the start of a line according to
                 "     shiftwidth not tabstop
set hlsearch     " highlight search terms
set incsearch    " show search matches as you type

set history=1000 " remember 1000 commands and search history
set undolevels=1000 " use many levels of undos
set wildignore=*.swp,*.bak,*.pyc,*.class
set title        " change the terminal's title
set visualbell   " don't beep
set noerrorbells " don't beep

set backup       " set backup and define directories
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

set list
set listchars=tab:\ \ ,trail:.,extends:#,nbsp:.  " trailing whitespace and exented lines, like this one

set pastetoggle=<F2>  " Switch to paste mode with F2

nmap <silent> ./ :nohlsearch<CR>  " clear search highlighting with ./

" Set color scheme to mustang
if &t_Co > 256 || has("gui_running")
  colorscheme molokai
endif


