"""""""""""""""""""
" Help on plugins "
" 
" python : https://github.com/klen/python-mode
"
" html : https://raw.github.com/mattn/zencoding-vim/master/TUTORIAL
"        https://github.com/mattn/zencoding-vim
" 
" snippets: ~/.vim/bundle/snipmate-snippets/snippets/*.snippets
" openerp:  ~/.vim/snippets/python
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bundle list "
"
" - vim-javascript : https://github.com/pangloss/vim-javascript
" - zencoding-vim : https://github.com/mattn/zencoding-vim
" - snipmate-snippets : https://github.com/honza/snipmate-snippets
" - vim-snipmate : https://github.com/garbas/vim-snipmate
"  dep: |- tlib_vim : https://github.com/vim-scripts/tlib.git
"       |- vim-addon-mw-utils : https://github.com/MarcWeber/vim-addon-mw-utils
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python
syntax on
filetype plugin indent on

if has("autocmd")
    filetype plugin on 
endif

" pathogen
call pathogen#infect() 
call pathogen#helptags()

" inprove rope speed
let g:pymode_rope_guess_project = 0

" html indent
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab

" css indent
autocmd FileType css set tabstop=4|set shiftwidth=4|set expandtab

" javascript indent
au FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

:highlight Folded guibg=blue guifg=grey
:highlight FoldColumn guibg=blue guifg=grey
:highlight Folded ctermfg=7 ctermbg=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
" Language: Kivy
" Maintainer: George Sebastian <11george.s@gmail.com>
" Last Change: 2011 May 1

" For version 5.x: Clear all syntax items.
" For version 6.x: Quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match kivyPreProc /#:.*/
syn match kivyComment /#.*/
syn match kivyRule /<\I\i*\(,\s*\I\i*\)*>:/
syn match kivyAttribute /\<\I\i*\>/ nextgroup=kivyValue

syn include @pyth $VIMRUNTIME/syntax/python.vim
syn region kivyValue start=":" end=/$/ contains=@pyth skipwhite

syn region kivyAttribute matchgroup=kivyIdent start=/[\a_][\a\d_]*:/ end=/$/ contains=@pyth skipwhite

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

    HiLink kivyPreproc PreProc
    HiLink kivyComment Comment
    HiLink kivyRule Function
    HiLink kivyIdent Statement
    HiLink kivyAttribute Label
  delcommand HiLink
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end kivy syntax "
"""""""""""""""""""
