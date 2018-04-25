if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'StanAngeloff/php.vim'
Plug 'altercation/vim-colors-solarized'
call plug#end()
:syntax on
:syntax enable
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
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
:au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
:set hlsearch
:set incsearch

