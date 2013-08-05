set nocompatible               " be iMproved
filetype off                   " required by vundle!
set laststatus=0
set statusline=\

" vundle conf {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" }}}

" bundles {{{

" required it's vundle! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'vim-scripts/django.vim'

filetype plugin indent on     " required by vundle!

" }}}

" color and syntax {{{ 

" set fold color
highlight Folded guibg=blue guifg=grey
highlight FoldColumn guibg=blue guifg=grey
highlight Folded ctermfg=7 ctermbg=0

" Gutter color
highlight SignColumn ctermbg=232

" vsplit color
highlight VertSplit ctermbg=232 ctermfg=0

highlight statusline ctermbg=0 ctermfg=0

" color syntax
syntax on

" remove useless line number set by python-mode
au BufRead,BufNewFile *.py set nonumber

" Language syntax indent
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2

" Language folding
au Filetype javascript set omnifunc=javascriptcomplete#CompleteJS foldmethod=indent fdl=1
au Filetype vim set foldmethod=marker

" minimum number of line under and above the cursor
set scrolloff=5

" }}}

" Key map {{{

" remap the leader default: '\'
let mapleader='!'

" map jk for exit insert mode
imap jk <ESC>

" GitGutter - navig through git diff
nmap <leader>h <Plug>GitGutterNextHunk
nmap <leader>H <Plug>GitGutterPrevHunk

" UndoTree
nnoremap <leader>u :UndotreeToggle<cr>

" NeerdTree
nnoremap <leader>t :NERDTreeToggle<cr>

" usefull for search, centering the result
nnoremap n nzz
nnoremap N Nzz

" }}}

" persistence {{{
" thanks to TWal https://github.com/TWal

if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backup

" Save swp files to a less annoying place than the current directory.
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=~/.vim/swap//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=~/.vim/undo//
	set undodir=~/.vim/undo//
	set undofile
endif

" }}}

" search {{{

set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching, search case sensitive if at least one upercase in the patern
set incsearch " Incremental search, start searching will typing patern

" }}}

" vim: fdm=marker
