set nocompatible               " be iMproved

" vundle conf {{{

filetype off                   " required by vundle!
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

" color syntax
syntax on

" set fold color
highlight Folded guibg=blue guifg=grey
highlight FoldColumn guibg=blue guifg=grey
highlight Folded ctermfg=7 ctermbg=0

" Gutter color
highlight SignColumn ctermbg=232

" vsplit color
highlight VertSplit ctermbg=232 ctermfg=0

" remove statusline
set laststatus=0
set statusline=\

" ruler setting
set ruler
set rulerformat=%-50(%=%M%H%R\ %f%<\ (%n)%4(%)%Y:%{&tw}%9(%l,%c%V%)%4(%)%P%)

" put ⋅ for space at the end of line
" | for tabs
" ˽ for non breakable space
set list
set listchars=tab:\|\ ,trail:⋅,nbsp:˽

" statusline color
highlight statusline ctermbg=0 ctermfg=0
highlight StatusLineNC ctermbg=0 ctermfg=0

" remove useless line number set by python-mode
au BufRead,BufNewFile *.py set nonumber

" Language syntax indent
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 expandtab

" Language folding
au Filetype javascript set omnifunc=javascriptcomplete#CompleteJS foldmethod=indent fdl=1
au Filetype vim set foldmethod=marker

" minimum number of line under and above the cursor
set scrolloff=5

" }}}

" Key map and Plugin conf {{{

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
nnoremap <leader>e :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen=1

" usefull for search, centering the result
nnoremap n nzz
nnoremap N Nzz

" tab keys
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<CR>

" paste
set pastetoggle=<leader>p

" don't use arrow keys
map <right> <esc>
map <left> <esc>
map <up> <esc>
map <down> <esc>
imap <right> <esc>
imap <left> <esc>
imap <up> <esc>
imap <down> <esc>

" upload to sprunge.us
command! Sprunge w !curl -F 'sprunge=<-' http://sprunge.us

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
