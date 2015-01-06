" +-----------------------+
" | NICK SPINALE'S .vimrc |
" +-----------------------+

" TODO
"   find mapping worthy of <del>
"   clear autocmds before any here? (au!)?
"   deal with ftplugins messing with my options (namely fo)
"   tabular comment function
"       will improve regex to only match last comment phrase in line
"       and not match full-line comments

" ############{VUNDLE STUFF}############

set nocompatible

if has('win32')
    set runtimepath+=$HOME/.vim               " not messing with ~/vimfiles
endif

set runtimepath+=$HOME/.vim/bundle/Vundle.vim

filetype off                                  " required by vundle
call vundle#begin()                           " required by vundle

Plugin 'gmarik/Vundle.vim'                    " vundle has to manage vundle

" Plugin 'sjl/gundo.vim'
Plugin 'SirVer/ultisnips'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
" Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/syntastic'
" Plugin 'gerw/vim-latex-suite'
" Plugin 'gerw/vim-tex-syntax'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()                                " required by vundle
filetype plugin on                               " required by vundle

" ############{MISC}############

" ====== AESTHETICS ======

syntax enable                        " don't override my colors

set background=dark                  " for correct defaults

" don't want to go to the trouble of getting more sophisticated
" colorschemes to work on non-256 terminal emulators.

if has('win32')
    colorscheme nicebox
else
    let g:solarized_termcolors = 256
    colorscheme solarized
endif

" ====== OPTIONS ======

set tabstop=4                                       " may add autocmd to adapt this to filetype
set shiftwidth=4                                    " consistent with tabstop
set expandtab                                       " may add autocmd to adapt this to filetype
set autoindent

set mouse=                                          " not even once
set virtualedit=block                               " sometimes convenient
set backspace=indent,eol,start                      " allow more deletion in insert mode
set formatoptions=""                                " not familiar with all formatting behavior, so disable it all

set nowrap                                          " say no to line wrapping
set number                                          " show line numbers
set showmatch                                       " of block delimiter
set incsearch                                       " sometimes nice

set splitbelow                                      " new splits below
set splitright                                      " new splits to right
set laststatus=2                                    " status line always there
set showtabline=2                                   " tab line always there

set statusline=                                     " clear it
set statusline+=%m%r%h%w%q                          " flags
set statusline+=\ %F\ \ [%v\ %l\ %L]                " file and position
set statusline+=\ \ %{strftime(\"%m/%d\ %H:%M\")}   " date+time

set spelllang=en_us
set wildmenu                                        " nifty autocomplete in command mode

" ====== MISC ======

autocmd FileType * set formatoptions=""             " ftplugins mess up this option often

" UltiSnips mappings

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" for commenting with tabular

let b:ncomment = '#'
autocmd FileType c,cpp,va,scala let b:ncomment = '//'
autocmd FileType haskell let b:ncomment = '--'
autocmd FileType tex let b:ncomment = '%'
autocmd FileType mail let b:ncomment = '>'
autocmd FileType vim let b:ncomment = '"'

" formats visual area with filetype-specific comments with tablular

function! s:tabcomms()
    if exists(':Tabularize')
        execute "'<,'>Tabularize /".b:ncomment
    endif
endfunction

" aligns <bar> tables AS YOU TYPE in insert mode using tabular
" by Tim Pope, not me

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" ############{MAPPINGS}############

" --- Nop's ---

noremap <space> <nop>
noremap <cr> <nop>
noremap , <nop>
noremap S <nop>
noremap Y <nop>

" --- Special ---

inoremap j <esc>
inoremap JJ j

nnoremap S :%s/
nnoremap Y y$

noremap <cr> :

inoremap <c-d> <bs><bs><bs><bs>
inoremap <c-c> <esc>c0

inoremap <bar> <bar><esc>:call <sid>align()<cr>a

" ====== FAKE LEADER ======

" buffer management
nnoremap <space>q :quit<cr>
nnoremap <space>w :write<cr>
nnoremap <space>t :tabedit<space>

" plugins
nnoremap <space>p :CtrlP<cr>
nnoremap <space>g :GundoToggle<cr>
nnoremap <space>i :PluginInstall<cr>
nnoremap <space>u :PluginUpdate<cr>

" v mode stuff
vnoremap <space>n :norm<space>
vnoremap <space>s y:%s/<c-r>"<cr>/
vnoremap <space>c :call <sid>tabcomms()<cr>

" n + v + s mode stuff
noremap <space>z :Tabularize<space>/
noremap <space>m @q
noremap <space>r "r
noremap <space>h "_

" --- misc ---

nnoremap <space>x 4x
nnoremap <space>b :shell<cr>
nnoremap <space>d 78i-<esc>

" remove trailing whitespace
nnoremap <space>l :%s/\s\+$//e<cr>

" highlight last insert
nnoremap <space>v `[v`]

" ====== TOGGLES ======

nnoremap ,s :setlocal spell!<cr>
nnoremap ,w :setlocal wrap!<cr>
nnoremap ,l :setlocal list!<cr>
nnoremap ,b :setlocal linebreak!<cr>

nnoremap ,r :setlocal readonly!<cr>
nnoremap ,d :set digraph<cr>

" one-way toggles
nnoremap ,c :setlocal colorcolumn=80<cr>
nnoremap ,C :setlocal colorcolumn=0<cr>
nnoremap ,v :set virtualedit=all<cr>
nnoremap ,V :set virtualedit=block<cr>
nnoremap ,g :noremap j gj<cr>:noremap k gk<cr>
nnoremap ,G :unmap j<cr>:unmap k<cr>
nnoremap ,m :set mouse=nvi<cr>
nnoremap ,M :set mouse=<cr>

" composite toggles
nmap ,t ,w,b,c,g
nmap ,T ,w,b,C,G

" ############{ABBREVIATIONS}############

" laziness

iabbrev `n newtype
iabbrev `m import
iabbrev `s instance
iabbrev `e extends
iabbrev `p implements
iabbrev `d #define
iabbrev `i #include
iabbrev `- -----

" mistakes

iabbrev teh the
iabbrev THe The
iabbrev NIck Nick
iabbrev SPinale Spinale
