execute pathogen#infect()
set term=xterm-256color
filetype plugin indent on
:syntax on
:syntax enable
colorscheme hybrid
set background=dark
set nocompatible
" solarized options 
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized
:set number
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set autoindent
:set smartindent
:nnoremap <C-h> gT
:nnoremap <C-l> gt
:au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
