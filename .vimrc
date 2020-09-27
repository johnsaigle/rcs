" Auto install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Vim things
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'dense-analysis/ale'

" Prettier for formatting
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Nerdtree file browser
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy file search a la VSCode
Plug 'ctrlpvim/ctrlp.vim'

" Colours
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim'

" Formatting/linting
Plug 'prettier/prettier'

" PHP stuff
Plug 'StanAngeloff/php.vim'
Plug 'https://github.com/garbas/vim-snipmate.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug '2072/php-indenting-for-vim'
Plug 'StanAngeloff/php.vim'
Plug 'gregsexton/matchtag' " Like matchparen, but for HTML tags

"JavaScript stuff
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'


let g:jsx_ext_required = 0
call plug#end()
:syntax on
:syntax enable

" Colours
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

" Highlight very long lines in red
:set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
:set list
match OverLength /\%81v.\+/

" Auto format js files
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
" Open NerdTree right away
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
