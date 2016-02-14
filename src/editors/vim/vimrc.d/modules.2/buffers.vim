set hidden
set splitbelow
set splitright

fun s:nrbufs()
  let i = bufnr('$')
  let j = 0
  while i > 0
    if buflisted(i)
      let j += i
    endif
    let i -= 1
  endwhile
  return j
endfun

fun s:wipeout_out()
  let n = s:nrbufs()
  write
  bwipeout
  if n == 1
    quit
  endif
endfun

command Wipeout call <sid>wipeout_out()

inoremap <c-z> <esc>:Wipeout<cr>
noremap <c-z> :Wipeout<cr>

nnoremap <space>j :bprev<cr>
nnoremap <space>k :bnext<cr>
nnoremap <space>d :bwipeout<cr>

nnoremap <space>q :quit<cr>
nnoremap <space>w :write<cr>
nnoremap <space>e :edit<cr>
nnoremap <space>t :tabedit<cr>
nnoremap <space>y :quit!<cr>

let s:last_tab = 1
fun! s:last_tab()
  exe 'tabn '.s:last_tab
endfun
au TabLeave * let s:last_tab = tabpagenr()

let s:last_buf = 1
fun! s:last_buf()
  exe 'buffer '.s:last_buf
endfun
au BufLeave * let s:last_buf = bufnr('%')

nnoremap <tab> :call <sid>last_buf()<cr>

fun s:buflist()
  redir => ls
  silent ls
  redir END
  let clean = []
  for buf in split(ls, '\n')
    call add(clean, split(buf, 'line')[0])
  endfor
  return clean
endfun

fun s:bufopen(line)
  exec 'buffer' matchstr(a:line, '^[ 0-9]*')
endfun

fun s:bufdelete(line)
  exec 'bwipeout' matchstr(a:line, '^[ 0-9]*')
endfun

fun s:fzf_select_buf(action)
  call fzf#run( { 'source': reverse(<sid>buflist())
              \ , 'sink': function(a:action)
              \ , 'options': '+m'
              \ , 'down': len(<sid>buflist()) + 2
              \ })
endfun

nnoremap <silent> <space>l :call <sid>fzf_select_buf('<sid>bufopen')<cr>
nnoremap <silent> <space>; :call <sid>fzf_select_buf('<sid>bufdelete')<cr>
