set nocompatible

" vundle/plugins {{{

filetype off

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'

" }}}

filetype plugin indent on
syntax on

if &t_Co >= 256 || has("gui_running")
  colorscheme wombat256
endif

" settings {{{

set hidden
set nowrap
set number
set numberwidth=2
set sidescroll=8
set laststatus=2
set ruler
set title
set novisualbell
set noerrorbells
set showmatch

set tabstop=4
set expandtab
set shiftwidth=4
set shiftround
set smarttab
set autoindent

set ignorecase
set smartcase
set incsearch

set list
set listchars=tab:\ \ ,trail:.,extends:#,nbsp:.
set backspace=indent,eol,start
set wildignore=*.swp,*.bak,*.pyc,*.class

set history=1000 " remember 1000 commands and search history
set undolevels=1000 " use many levels of undos

set backup       " set backup and define directories
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

set pastetoggle=<F2>  " Switch to paste mode with F2

" }}}

" mappings {{{

let mapleader="\<space>"
let maplocalleader="\\"

" open and source vimrc
nnoremap <silent> <leader>ev :split $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

nnoremap <silent> ./ :set hlsearch!<CR>

" map j and k to something sane
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" kjk to exit insert and visual mode
inoremap kjk <esc>
inoremap <esc> <nop>
vnoremap kjk <esc>
vnoremap <esc> <nop>

" convert word to uppercase
inoremap <c-u> <esc>viwUea
nnoremap <leader><c-u> viwUe

" surround word in " and '
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

nnoremap <leader>olv :execute "vsplit " . bufname("#")<cr>
nnoremap <leader>olh :execute "split " . bufname("#")<cr>

" highlight trailing spaces as error
nnoremap <silent> <leader>w :match Error /\v\s+$/<cr>
nnoremap <silent> <leader>W :match none<cr>

" start searches in very magic mode
nnoremap / /\v

" }}}

" autocmds {{{

augroup filetype_html
    autocmd!
    autocmd filetype html nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
augroup END

augroup filetype_markdown
    autocmd!
    autocmd filetype markdown onoremap ih :<c-u>execute "normal! ?^[=-]\\{2,}$\r:nohlsearch\rkvg_"<cr>
    autocmd filetype markdown onoremap ah :<c-u>execute "normal! ?^[=-]\\{2,}$\r:nohlsearch\rg_vk0"<cr>
augroup END

augroup filetype_vim
    autocmd!
    autocmd filetype vim setlocal foldmethod=marker
    autocmd filetype vim nnoremap <silent> <buffer> <localleader>st :source %<cr>
augroup END

augroup filetype_c
    autocmd!
    autocmd filetype c nnoremap <buffer> <localleader>cn A// NOTE(tim): 
augroup END

" }}}

" functions {{{
nnoremap <leader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

nnoremap <leader>q :call <SID>QuickfixToggle()<cr>
let s:quickfix_is_open = 0
function! s:QuickfixToggle()
    if s:quickfix_is_open
        cclose
        let s:quickfix_is_open = 0
        execute s:quickfix_return_to_window . "wincmd w"
    else
        let s:quickfix_return_to_window = winnr()
        copen
        let s:quickfix_is_open = 1
    endif
endfunction
" }}}

" autocorrect {{{

iabbrev teh the
iabbrev tehn then
iabbrev taht that
iabbrev adn and
iabbrev wehn when

" }}}

