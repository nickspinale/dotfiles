"<>=======================<>
"|| NICK SPINALE'S .vimrc ||
"<>=======================<>

"TODO
"   fix my indenting functions
"   learn vim-latex
"   more plugins (tpope, command-t)
"   pathogen dependancy?
"   clear autocmds before any here? (au!)?
"   deal with ftplugins messing with my options (namely fo)
"   syntax on or enable

" ===== VUNDLE STUFF =====

set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim

filetype off
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-commentary'
Plugin 'gerw/vim-latex-suite'
Plugin 'gerw/vim-tex-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'twilight'

" temporarily disabled plugins

"Plugin 'bling/vim-airline'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'xolox/vim-colorscheme-switcher'

call vundle#end()
filetype plugin on

" ===== OPTIONS =====

set verbose=1        " tell me stuff

set tabstop=4
set shiftwidth=4
set expandtab

set virtualedit=all              " necessary for my indenting scripts further down
set backspace=indent,eol,start   " allow more deletion in insert mode
set formatoptions=               " not familiar with all formatting behavior, so disable it all

set nowrap              " say no to line wrapping
set number              " show line numbers
set colorcolumn=80      " marker at 80 columns
set laststatus=2        " status line always there
set showtabline=2       " tab line always there
set showmatch           " of block delimiter
set wildmenu            " nifty autocomplete in command mode

set spelllang=en_us

set tabline=%t
set statusline=""                    
set statusline+=%m%r%h%w%q                                " flags
set statusline+=\ %F\ [%v\ %l\ %L]                        " file and position
set statusline+=\ %{strftime(\"%m/%d\ %H:%M\")}           " date+time
set statusline+=\ [\ %{v:register}\ ]                     " current register

" ===== MISC =====

syntax enable

set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

let mapleader = " "

" ===== PRE-OTHERSTUFF VIMSCRIPT =====
"
autocmd FileType tex,mail           setlocal spell

autocmd FileType haskell            let b:ncomment = '-- '
autocmd FileType c,cpp,java,scala   let b:ncomment = '// '
autocmd FileType sh,ruby,python     let b:ncomment = '# '
autocmd FileType conf,fstab         let b:ncomment = '# '
autocmd FileType tex                let b:ncomment = '% '
autocmd FileType mail               let b:ncomment = '> '
autocmd FileType vim                let b:ncomment = '" '


" midline indenting. yay haskell
"   opt_reg: regex that marks spot to indent: 0 - '@@', 1 - ncomment, 2 - prompt
"   opt_pos: position of addes spaces relative to regex: 0 - replace, 1 - before, 2 - after
"   opt_col: column to indent to: 0 - furthest of selection (linewise visual), 1 - prompt

fun! Mindent(opt_reg, opt_pos, opt_col)
    if a:opt_reg == 0
        let xeger = '@@'
    elseif a:opt_reg == 1
        let xeger = b:ncomment
    elseif a:opt_reg == 2
        let xeger = input('regex: ')
    endif
    if a:opt_col == 0
        let nmuloc = 80 " TODO this
    elseif a:opt_col == 1
        let nmuloc = input('column: ')
    endif
    let @z = printf("0%s/%s%sD%s|p", a:opt_pos == 0 ? 'd' : '', xeger, a:opt_pos == 2 ? "\r" : "/e\rl", nmuloc)
    execute "normal ".@z
endfunction

" ===== MAPPTINGS =====

" --- some aggressive stuff ---

noremap \ :

inoremap j <esc>
inoremap \\ \
inoremap \j j

" --- lame movement ---

noremap <leader>j 8j
noremap <leader>k 8k
noremap <leader>h 16h
noremap <leader>l 16l

" --- formatting stuff ---

" comments

noremap <leader>fm :s/^/<c-r>=escape(b:ncomment,'\/')<cr>/<cr>
noremap <leader>ffm :s/^<c-r>=escape(b:ncomment,'\/')<cr>//e<cr>

" using mindent

noremap <leader>fs :call Mindent(0, 0, 0)<cr>
noremap <leader>fc :call Mindent(1, 1, 0)<cr>

noremap <leader>fr :call Mindent(2, 0, 0)<cr>
noremap <leader>fb :call Mindent(2, 1, 0)<cr>
noremap <leader>fa :call Mindent(2, 2, 0)<cr>

noremap <leader>ffs :call Mindent(0, 0, 1)<cr>
noremap <leader>ffc :call Mindent(1, 1, 1)<cr>

noremap <leader>ffr :call Mindent(2, 0, 1)<cr>
noremap <leader>ffb :call Mindent(2, 1, 1)<cr>
noremap <leader>ffa :call Mindent(2, 2, 1)<cr>

" --- misc ---

nnoremap <leader>s :%s/

nnoremap <leader>1t :%s/\t/    /g
nnoremap <leader>2t :%s/\t/        /g

" remove trailing whitespace

nnoremap <leader>x :%s/\s\+$//e

" highlight last insert

nnoremap <leader>I `[v`]

" visual mode

vnoremap <leader>z y/<c-r>"<cr>
vnoremap <leader>s y:%s/
vnoremap <leader>a :norm<space> 

" --- file stuff ---

nnoremap <leader>Q :quit!<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>e :edit<space>
nnoremap <leader>r :edit -R<space>
nnoremap <leader>b :shell<cr>

" --- window management ---

nnoremap <leader>n :belowright split<space>
nnoremap <leader>m :belowright vsplit<space>
nnoremap <leader>t :tabnew <space>

" --- toggles ---

nnoremap ,h :set hlsearch!<cr>
nnoremap ,s :setlocal spell!<cr>
nnoremap ,w :setlocal wrap!<cr>
nnoremap ,r :setlocal readonly!<cr>
nnoremap ,d :set digraph<cr>
nnoremap ,l :set wrap<cr>:set nolist<cr>:set linebreak<cr>
nnoremap ,L :set nowrap<cr>:set list<cr>:set nolinebreak<cr>
nnoremap ,g :noremap j gj<cr>:noremap k gk<cr>
nnoremap ,G :unmap j<cr>:unmap k<cr>
nnoremap ,v :set virtualedit=block<cr>
nnoremap ,V :set virtualedit=all<cr>

" --- for plugins ---

nnoremap <leader>u :GundoToggle<cr>

" ===== ABBREVIATIONS =====

" laziness

iabbrev #w where
iabbrev #t type
iabbrev #m import
iabbrev #n instance
iabbrev #e extends
iabbrev #p implements
iabbrev #d #define
iabbrev #i #include

" mistakes

iabbrev teh the
iabbrev NIck Nick
iabbrev NIcholas Nicholas
iabbrev SPinale Spinale
