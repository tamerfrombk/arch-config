" disable vi compatibility (emulation of old bugs)
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins using vim-plug
call plug#begin('~/.vim/plugged')

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" lightline
Plug 'itchyny/lightline.vim'

" vim colors xcode
Plug 'arzg/vim-colors-xcode'

call plug#end()

set viminfo+=n~/.vim/viminfo

" lightline config
set laststatus=2

" set colorscheme
colorscheme zmrok

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set softtabstop=4    " number of spaces in tab when editing
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" turn syntax highlighting on
set t_Co=256
syntax on

" turn line numbers on
set number

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Searches
set hlsearch
set incsearch

" spell check
set spelllang=en
set spellfile=~/.vim/en.utf-8.add

" Stop vim from redrawing unnecessarily
set lazyredraw

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Now that we've mapped this functionality elsewhere, disable them
nnoremap ^ <nop>
nnoremap $ <nop>
