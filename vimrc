syntax on
set number
set nowrap
set backspace=indent,eol,start
set ff=unix
setlocal ff=unix
set incsearch
set showmode
set nocompatible
filetype on
filetype plugin indent on
set wildmenu
set ruler
set lz
set hid
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set cindent
set ai
set si
set cin
set mouse=a
set cursorline
set numberwidth=6

set cino=g2h2N-s
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set noswapfile
set nobackup

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

colo sdac
" colo ron

if has("autocmd")
    augroup c
        autocmd BufReadPre,FileReadPre      *.c,*.h iabbrev /** /**<CR><BACKSPACE>*/<ESC>ka 
    augroup END
    augroup php
        autocmd BufReadPre,FileReadPre      *.php inoremap $this $this->
    augroup END
endif


" kod-relaterat
inoremap {<CR> {<CR>}<ESC>:call BC_AddChar("}")<CR>ko
inoremap { {}<ESC>:call BC_AddChar("}")<CR>i
inoremap ( ()<ESC>:call BC_AddChar(")")<CR>i
inoremap [ []<ESC>:call BC_AddChar("]")<CR>i
imap <C-k> <ESC>:call search(BC_GetChar(), "W")<CR>:noh<CR>A
iabbrev func function

" bajs-relaterat
iabbrev bajs HEHE MAN FOR INTE SKRIVA BAJS !!!!!!!!!!!!!!!!
iabbrev cant can't

" stulet godis
function! BC_AddChar(schar)
  if exists("b:robstack")
    let b:robstack = b:robstack . a:schar
  else
    let b:robstack = a:schar
  endif
endfunction

function! BC_GetChar()
  let l:char = b:robstack[strlen(b:robstack)-1]
  let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
  return l:char
endfunction 

function! Fix_Music_Sheet()
    %s/c-/c/gi
    %s/c#/cs/gi
    %s/d-/d/gi
    %s/d#/ds/gi
    %s/e-/e/gi
    %s/f-/f/gi
    %s/f#/fs/gi
    %s/g-/g/gi
    %s/g#/gs/gi
    %s/a-/a/gi
    %s/a#/as/gi
    %s/b-/b/gi
    %s/---.../halt_all/g
    %s/\.\.\. ../nil/g
    %s/ 0/_/g
endfunction 

let processing_doc_path="i:\\src\\processing\\reference"

autocmd FileType make setlocal noexpandtab

autocmd BufNewFile,BufRead *.fp,*.vp setf glsl

nnoremap q: q

nnoremap ; :

execute pathogen#infect()