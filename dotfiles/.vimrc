
language C

" turn off various options.
let g:netrw_dirhistmax=0
set nobackup
set noerrorbells
set nomodeline " prevent CVE-2007-2438
set nonumber
set noruler
set noswapfile
set nowrap
set shortmess+=I
set viminfo=
set viminfofile=NONE
syntax off

" options for encoding.
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
set fileformats=unix,dos,mac
set termencoding=utf-8

" options for drawing.
highlight MatchParen cterm=underline ctermbg=NONE
set ambiwidth=double
set tabstop=4
set wildmenu

" options for editing.
set backspace=indent,eol,start
set expandtab
set noautoindent
set shiftwidth=4
set undolevels=10240

" options for searching.
set hlsearch
set ignorecase
set incsearch
set nowrapscan
set smartcase
set whichwrap=b,s,h,l,<,>

" options for diff mode.
set diffopt=vertical,closeoff,context:77777

" return to normal mode.
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>

" reset before <C-l>.
nnoremap <C-l> <Cmd>nohlsearch<CR><Cmd>set nonumber<CR><Cmd>set nolist<CR><Cmd>diffupdate<CR><C-l>

" enter search command with selected text.
vnoremap / "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR>
vnoremap ? "vy?\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR>

" highlight a word under the cursor.
nnoremap * msHmt`s*`tzt`s
nnoremap # msHmt`s#`tzt`s
nnoremap g* msHmt`sg*`tzt`s
nnoremap g# msHmt`sg#`tzt`s

" searches selected text, but cursor does not move.
" see help "v_y", "/", "c_<C-R>", "/\V", "c_CTRL-R_=", "builtin-functions", "@", "<CR>"
vnoremap * msHmt`s"vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>`tzt`sN
vnoremap # msHmt`s"vy?\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>`tzt`sn

" open the same page in vim-jp.org as vim help.
command! OpenVimJp execute 'terminal ++shell ++close ++hidden g ' . shellescape('https://vim-jp.org/vimdoc-ja/' . expand('%:t:r') . '.html')

" clear status line.
autocmd VimEnter * ++once echo ''

