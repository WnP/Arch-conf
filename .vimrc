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
"  dep: |- tlib_vim : https://github.com/MarcWeber/vim-addon-mw-utils
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

" inprove rope speed
let g:pymode_rope_guess_project = 0

" html indent
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab

" css indent
autocmd FileType css set tabstop=4|set shiftwidth=4|set expandtab
