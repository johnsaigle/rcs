if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'StanAngeloff/php.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
call plug#end()
:syntax on
:syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
let g:seoul256_srgb = 1
let g:seoul256_background = 233
colo seoul256
set nocompatible
:set number
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set cindent
:set smartindent
:set autoindent
:nnoremap <C-h> gT
:nnoremap <C-l> gt
:set hlsearch
:set incsearch

