set nocompatible               " be iMproved
set modeline

" vundle conf {{{

filetype off                   " required by vundle!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" }}}

" bundles {{{

" required it's vundle!
Plugin 'gmarik/vundle'

" completion {{{
" All completion is managed by deoplete
Plugin 'Shougo/deoplete.nvim'
" Python
Plugin 'zchee/deoplete-jedi'
" JS
Plugin 'carlitux/deoplete-ternjs'
" Golang
Plugin 'zchee/deoplete-go'
" Elm
Plugin 'pbogut/deoplete-elm'
" Rust
Plugin 'racer-rust/vim-racer'
" }}}

" Syntax Checking
"Plugin 'benekastah/neomake'
"Plugin 'benjie/neomake-local-eslint.vim'
Plugin 'w0rp/ale'

" Languages {{{
" C
Plugin 'c.vim'
" Golang
Plugin 'fatih/vim-go'
" Elm
Plugin 'ElmCast/elm-vim'
" Rust
Plugin 'rust-lang/rust.vim'
" JS
Plugin 'pangloss/vim-javascript'
" QML
Plugin 'peterhoeg/vim-qml'
" Less
Plugin 'groenewege/vim-less'
" Coffee Script
Plugin 'kchmck/vim-coffee-script'
" CSS3
Plugin 'hail2u/vim-css3-syntax'
" Kivy KV lang
Plugin 'ajford/vimkivy'
" Crystal lang
Plugin 'rhysd/vim-crystal'
" Arduino
Plugin 'sudar/vim-arduino-syntax'
" Sass - Scss
Plugin 'cakebaker/scss-syntax.vim'
" PlantUML
Plugin 'aklt/plantuml-syntax'
" templates {{{
" Markdown
Plugin 'tpope/vim-markdown'
" Mako template
Plugin 'sophacles/vim-bundle-mako'
" Django template
Plugin 'vim-scripts/django.vim'
" Jade template
Plugin 'statianzo/vim-jade'
" Haml template
Plugin 'tpope/vim-haml'
" Stylus template
Plugin 'wavded/vim-stylus'
" Angular template
Plugin 'curist/vim-angular-template'
" }}}
" }}}

" Fold
" Python - don't forget to rename jpythonfold.vim to python.vim
Plugin 'jpythonfold.vim'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" CVS
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'

" Other tools
" Source tags using Exuberant Ctags
Plugin 'majutsushi/tagbar'
" All 256 xterm colors with their RGB equivalents
Plugin 'guns/xterm-color-table.vim'
" Gramar checker
Plugin 'vim-scripts/LanguageTool'
" Just ask you why you no commit if you don't since xtimes
Plugin 'esneider/YUNOcommit.vim'
" Session management
Plugin 'tpope/vim-obsession'
" Vim Fortune
Plugin 'hobbestigrou/vimtips-fortune'
" Fuzzy finder
Plugin 'junegunn/fzf'
" Paste
Plugin 'javier-lopez/sprunge.vim'
" Hex color preview
Plugin 'lilydjwg/colorizer'

call vundle#end()             " required by vundle!
filetype plugin indent on     " required by vundle!

" }}}

" color and syntax {{{

" colors and syntax
syntax on
set t_Co=256
set wrap       " show long lines on many lines
set title      " update term title
set hidden
se showcmd     " show command
"se autochdir   " auto change dir
se nu         " set number line

" fold text {{{
if has("folding")
    set foldtext=MyFoldText()
    function! MyFoldText()
        " for now, just don't try if version isn't 7 or higher
        if v:version < 701
            return foldtext()
        endif
        " clear fold from fillchars to set it up the way we want later
        let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
        let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
        if &fdm=='diff'
            let l:linetext=''
            let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
            let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
            let l:align = (l:align / 2) + (strlen(l:foldtext)/2)
            " note trailing space on next line
            setlocal fillchars+=fold:\
        elseif !exists('b:foldpat') || b:foldpat==0
            let l:foldtext = ' '.(v:foldend-v:foldstart).' lines folded'.v:folddashes.'|'
            let l:endofline = (&textwidth>0 ? &textwidth : 80)
            let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strlen(l:foldtext))
            let l:align = l:endofline-strlen(l:linetext)
            setlocal fillchars+=fold:-
        elseif b:foldpat==1
            let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
            let l:foldtext = ' '.v:folddashes
            let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
            let l:linetext .= ' ---'.(v:foldend-v:foldstart-1).' lines--- '
            let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
            let l:linetext = strpart(l:linetext,0,l:align-strlen(l:foldtext))
            let l:align -= strlen(l:linetext)
            setlocal fillchars+=fold:-
        endif
        return printf('%s%*s', l:linetext, l:align, l:foldtext)
    endfunction
endif
" }}}

" Colors {{{

" set fold color
highlight Folded ctermfg=DarkBlue ctermbg=234

" Gutter color
highlight SignColumn ctermbg=234

" vsplit color
highlight VertSplit ctermbg=234 ctermfg=234

hi CursorLine   cterm=bold ctermbg=233 ctermfg=None
hi CursorColumn cterm=bold ctermbg=233 ctermfg=None
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

hi ColorColumn ctermbg=DarkBlue ctermfg=white

" visual color
hi Visual  ctermbg=0 ctermfg=Grey

" popup menu color
hi Pmenu ctermbg=11 ctermfg=8
hi PmenuSel ctermbg=8 ctermfg=11

hi FoldColumn ctermbg=0 ctermfg=12

" tab color
hi TabLineFill ctermfg=Black ctermbg=Black
hi TabLine term=reverse cterm=reverse ctermfg=Black ctermbg=DarkBlue
hi TabLineSel ctermfg=Red ctermbg=Black
hi Title ctermfg=LightBlue ctermbg=Black

" parenthesis highlighting color
hi MatchParen term=standout term=Bold ctermbg=2 gui=Bold guibg=SeaGreen

" statusline color
highlight statusline ctermbg=0 ctermfg=0
highlight StatusLineNC ctermbg=DarkYellow ctermfg=234

hi Search term=standout term=Bold ctermbg=2 gui=Bold guibg=SeaGreen

hi DiffAdd term=bold ctermbg=0 ctermfg=12 gui=bold guifg=Blue
hi DiffChange term=bold ctermbg=0 ctermfg=2 gui=bold guifg=SeaGreen
hi DiffDelete term=underline ctermbg=0 ctermfg=130 guifg=Brown
hi DiffText term=bold cterm=bold ctermbg=0 ctermfg=9 ctermbg=0 gui=bold

hi SyntasticError term=bold ctermbg=0 ctermfg=130 gui=bold guifg=Brown
hi SyntasticWarning term=underline ctermbg=0 cterm=underline ctermfg=5 gui=underline guifg=SlateBlue
hi SyntasticStyleError term=bold ctermbg=0 ctermfg=130 gui=bold guifg=Brown
hi SyntasticStyleWarning term=underline ctermbg=0 cterm=underline ctermfg=5 gui=underline guifg=SlateBlue
hi Search ctermfg=252 ctermbg=22

hi SpellBad term=bold cterm=bold ctermfg=9 ctermbg=0 gui=bold guibg=Red
hi SpellRare term=bold cterm=bold ctermfg=9 ctermbg=0 gui=bold guibg=Red
hi SpellCap term=bold cterm=bold ctermfg=9 ctermbg=0 gui=bold guibg=Red
hi SpellLocal term=bold cterm=bold ctermfg=9 ctermbg=0 gui=bold guibg=Red

" }}}

" Editor ui {{{

" remove statusline
set laststatus=0
set statusline=

" ruler setting
set ruler
set rulerformat=%-50(%=%M%H%R\ %f%<\ (%n)%4(%)%Y:%{&tw}%9(%l,%c%V%)%4(%)%P%)
set colorcolumn=80

" put ⋅ for space at the end of line
" | for tabs
" ˽ for non breakable space
set list
set listchars=tab:\|\ ,trail:⋅,nbsp:˽

" always expand tabs to 4 space
" set tabstop=4
" set shiftwidth=4
" set expandtab

" minimum number of line under and above the cursor
set scrolloff=5

set ttyfast " Faster refraw
set showmatch " When a bracket is inserted, briefly jump to the matching one
set iskeyword+=\- " Complete words containing a dash
" Open all cmd args in new tabs
execute ":silent tab all"

set spelllang=fr

" }}}

" language specs {{{

" Language syntax indent
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType elm setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript,sql,json,html,xhtml,css,xml,yaml,yml,htmldjango,mako,stylus,scss,jade,coffee,less setlocal shiftwidth=2 tabstop=2 expandtab
" Language Automatically removing all trailing whitespace
autocmd FileType python,c,javascript,css,html,xml,htmldjango,mako,vim,stylus,scss,jade,coffee,less autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufEnter,BufNew *.Dockerfile setlocal filetype=dockerfile

" Language folding
au Filetype javascript set omnifunc=javascriptcomplete#CompleteJS foldmethod=indent fdl=1
au Filetype go set foldmethod=indent
au Filetype c set foldmethod=syntax
au Filetype vim set foldmethod=marker

" enable :make to run python script in vim
au Filetype python set makeprg=python\ %

" }}}

" }}}

" Key map and Plugin conf {{{

" usefull tricks {{{

" remap the leader default: '\'
let mapleader='\'
" map leader on space only in normal mode
nmap <space> <leader>

" map jk for exit insert mode
imap jk <ESC>

" usefull for search, centering the result
nnoremap n nzz
nnoremap N Nzz

nnoremap ; :

" buffer next & prev...
" do you realy need C-n and C-p in normal mode?!?
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

" don't use arrow keys
map <right> <nop>
map <left> <nop>
map <up> <nop>
map <down> <nop>
imap <right> <nop>
imap <left> <nop>
imap <up> <nop>
imap <down> <nop>

" " Remap Ctrl-H and Ctrl-L to tabprev and tabnext
noremap <C-J> : tabprev<CR>
noremap <C-K> : tabnext<CR>
" tnoremap <C-H> <C-\><C-n>: tabprev<CR>
" tnoremap <C-L> <C-\><C-n>: tabnext<CR>

" Remap Alt-hkjl to navigate between windows in both terminal
" and normal buffers
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" " Ctrl-e: Go to end of line
" inoremap <C-e> <esc>A
"
" " Ctrl-l: Move word right
" inoremap <C-l> <Right>
" " Ctrl-h: Move word left
" inoremap <C-h> <Left>
" " Ctrl-j: Move cursor down
" inoremap <expr> <C-j> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"
" " Ctrl-k: Move cursor up
" inoremap <expr> <C-k> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"

" }}}

" Plugin keys & nav {{{

" tab keys
nmap <leader>tn :tabnew<cr>
" map <leader>tc :tabclose<CR>

" read all file in hexa
nmap <leader>he :%!xxd<cr>
" return to binary
nmap <leader>He :%!xxd -r<cr>

nmap <leader>h :nohlsearch<cr>

" remap line selection
nmap <leader><Space> V

" paste
set pastetoggle=<leader>p

" upload to sprunge.us
"command! Sprunge w !curl -F 'sprunge=<-' http://sprunge.us


" }}}

" Plugin conf {{{

" FZF fuzzy finder
nnoremap <C-I> :call fzf#run({ 'sink': 'tabe', 'down': '40%' })<CR>
nnoremap <C-O> :call fzf#run({ 'sink': 'split', 'down': '40%' })<CR>
nnoremap <C-P> :call fzf#run({ 'sink': 'vplit', 'down': '40%' })<CR>
nnoremap <C-E> :call fzf#run({ 'sink': 'e', 'down': '40%' })<CR>

" Append --no-height
let $FZF_DEFAULT_OPTS .= ' --no-height'

" Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" " python venv
" let g:virtualenv_auto_activate = 1

" Y U No Commit?
let g:YUNOcommit_after = 40

" don't display fortune on startup
let g:fortune_vimtips_auto_display = 0

let g:languagetool_jar='$HOME/.vim/LanguageTool-2.8/languagetool-commandline.jar'

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" go
" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)
" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" Or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" run, build, test and coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
" go to definition
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

" Rust
set hidden
let g:racer_cmd = "/usr/sbin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"

" let g:go_fmt_fail_silently = 0
" let g:go_fmt_autosave = 1

" By default syntax-highlighting for Functions, Methods and Structs is
" disabled. To change it:
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" }}}

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
set hlsearch

" }}}

" ViM Memo {{{
"
" Register
" ========
"
" list registers                    -> :reg
" record motion to register a       -> qa
" stop recording                    -> q
" play motion in register a         -> @a
" paste register a content          -> "ap
" copy current line to register a   -> "ayy
" append curent line to register a  -> "Ayy
"
" Jumps
" =====
"
" list jumps                        -> :jumps
" go to older jumps                 -> <jump number> C-o
" go to newer jumps                 -> <jump number> C-i
"
" Last edited line                  -> g;
" Previous edited line              -> g,
"
" Marks
" =====
"
" list marks                        -> :marks
" set mark a                        -> ma
" go to line mark a                 -> 'a
" go to caractere in line mark a    -> `a
" previous mark                     -> [' or [`
" next mark                         -> ]' or ]`
"
" Splits
" ======
"
" split horizontaly                 -> :sp
" split verticaly                   -> :vs
" fold horizontal splits            -> <C-w-_>
" fold vertical splits              -> <C-w-|>
" unfold all splits                 -> <C-w-=>
"
" Rename buffer
" =============
"
" to rename a buffer use            -> :file <new buffer name>
"
" Paste to vim command line
" =========================
"
" paste from default register       -> <C-R> "
" paste from another register       -> <C-R> <register>
" paste from clipboard              -> <C-R><C-O> "
"                                or -> <Shift-Insert>
"
" Spell
" =====
"
" start spell check                 -> set spell
" go to previous error              -> [s
" go to next error                  -> ]s
" see suggestions list              -> z=
" add to dictionary                 -> zg
"
" }}}

" vim: set fdm=marker set fenc=utf-8
