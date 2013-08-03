set nocompatible               " be iMproved
filetype off                   " required!

" vundle conf {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" }}}

" bundles {{{

" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-fugitive'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'vim-scripts/django.vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" }}}

" set fold color
:highlight Folded guibg=blue guifg=grey
:highlight FoldColumn guibg=blue guifg=grey
:highlight Folded ctermfg=7 ctermbg=0

" color syntax
syntax on

" map jk for exit insert mode
imap jk <ESC>

" remove useless line number set by python-mode
au BufRead,BufNewFile *.py set nonumber

" vim: fdm=marker:fdl=0
