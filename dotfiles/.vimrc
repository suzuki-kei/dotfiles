
language C

" turn off various options
set nobackup
set noerrorbells
set nomodeline " prevent CVE-2007-2438
set nonumber
set noruler
set noswapfile
set nowrap
set syntax=off
set viminfo=
set viminfofile=NONE

" options for encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
set fileformats=unix,dos,mac
set termencoding=utf-8

" options for drawing
set ambiwidth=double
set tabstop=4

" options for editing
set backspace=indent,eol,start
set expandtab
set noautoindent
set shiftwidth=4
set undolevels=10240

" options for searching
set hlsearch
set ignorecase
set incsearch
set nowrapscan
set smartcase
set whichwrap=b,s,h,l,<,>

" options for diff mode
set diffopt=vertical,closeoff,context:77777

" highlight a word under the cursor when searched by '*' or '#' in normal mode
nnoremap * msHmt's*'tzt's
nnoremap # msHmt's#'tzt's

" execute some command before 'redraw!' when Ctrl+l in normal mode
nnoremap <C-l> <Cmd>nohlsearch<CR><Cmd>diffupdate<CR><Cmd>redraw!<CR>

" discard input and return to normal mode in terminal mode
cnoremap <C-l> <C-u><C-h>

" return to normal mode in insert/visual mode
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>

