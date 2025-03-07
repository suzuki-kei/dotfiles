
" turn off various options for quiet.
syntax off
language messages C
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
let g:netrw_dirhistmax=0
autocmd VimEnter * ++once echo ''

" options for encoding.
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
set fileformats=unix,dos,mac
set termencoding=utf-8

" options for drawing.
highlight ColorColumn ctermbg=DarkGray
highlight MatchParen cterm=underline ctermbg=NONE
highlight Search ctermbg=LightGray
set ambiwidth=double
set scrolloff=3
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
nnoremap <C-l> 
    \<Cmd>set nohlsearch<CR>
    \<Cmd>set nonumber<CR>
    \<Cmd>set norelativenumber<CR>
    \<Cmd>set nolist<CR>
    \<Cmd>diffupdate<CR>
    \<Esc>
    \<C-l>

" enter search command with selected text.
vnoremap / "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR>
vnoremap ? "vy?\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR>

" highlight a word under the cursor.
nnoremap * <Cmd>let @/ = '\(\<' . escape(expand('<cword>'), '.*+') . '\>\)'<CR><Cmd>set hlsearch<CR>
nnoremap # <Cmd>let @/ = '\(\<' . escape(expand('<cword>'), '.*+') . '\>\)'<CR><Cmd>set hlsearch<CR>
nnoremap g* <Cmd>let @/ = '\(' . escape(expand('<cword>'), '.*+') . '\)'<CR><Cmd>set hlsearch<CR>
nnoremap g# <Cmd>let @/ = '\(' . escape(expand('<cword>'), '.*+') . '\)'<CR><Cmd>set hlsearch<CR>

" highlight a selected text.
vnoremap * "vy<Cmd>let @/ = '\(' . substitute(escape(@v, '\/.*+'), "\n", '\\n', 'g') . '\)'<CR><Cmd>set hlsearch<CR>
vnoremap # "vy<Cmd>let @/ = '\(' . substitute(escape(@v, '\/.*+'), "\n", '\\n', 'g') . '\)'<CR><Cmd>set hlsearch<CR>

" open the same page in vim-jp.org as vim help.
command! OpenVimJp execute 'terminal ++shell ++close ++hidden g ' . shellescape('https://vim-jp.org/vimdoc-ja/' . expand('%:t:r') . '.html')

" konami command.
nnoremap <Up><Up><Down><Down><Left><Right><Left><Right>ba <Cmd>echo '↑↑↓↓←→←→ＢＡ'<CR>

