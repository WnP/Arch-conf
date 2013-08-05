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

" }}}

" My custom {{{ 

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

" Language syntax indent
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2

" Language folding
au Filetype javascript set omnifunc=javascriptcomplete#CompleteJS foldmethod=indent
au Filetype vim set omnifunc=javascriptcomplete#CompleteJS foldmethod=marker

" }}}

" vim: fdm=marker:fdl=0
