if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'StanAngeloff/php.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/garbas/vim-snipmate.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/isRuslan/vim-es6.git'
Plug '2072/php-indenting-for-vim'
Plug 'StanAngeloff/php.vim'
call plug#end()
let g:ale_php_phpcs_standard = '/var/www/loris/test/LorisCS.xml'
let g:ale_php_phpcbf_standard = '/var/www/loris/test/LorisCS.xml'
let g:ale_php_phpmd_ruleset = '/var/www/loris/test/LorisPHPMD.xml'
let g:ale_php_phan_use_client = 1
:syntax on
:syntax enable
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
:set encoding=utf-8
:set colorcolumn=80
:set list
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
