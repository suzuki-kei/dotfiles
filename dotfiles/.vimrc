
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

" highlight a word under the cursor when searched by '*' or '#' in normal mode.
nnoremap * msHmt`s*`tzt`s
nnoremap # msHmt`s#`tzt`s

" execute some command before Ctrl+l in normal mode.
nnoremap <C-l> <Cmd>nohlsearch<CR><Cmd>set nonumber<CR><Cmd>set nolist<CR><Cmd>diffupdate<CR><C-l>

" return to normal mode in insert/visual mode.
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>

" search for selected text in visual mode. however, cursor does not move.
" see help "v_y", "/", "c_<C-R>", "/\V", "c_CTRL-R_=", "builtin-functions", "@", "<CR>"
vnoremap * msHmt`s"vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>`tzt`sN
vnoremap # msHmt`s"vy?\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>`tzt`sn

" disable <S-k> in normal mode.
nnoremap <S-k> <C-l>

" execute highlighted text well in visual mode.
vnoremap <S-k> "vy:!<C-r>=TextToShellCommands(@v)<CR><CR>

function! TextToShellCommands(text) abort
    let lines = split(trim(a:text), "\n")
    let commands = map(lines, function('LineToShellCommand'))
    return join(commands, '; ')
endfunction

function! LineToShellCommand(i, line) abort
    if match(a:line, '^https\?://') >= 0
        return "g '" . a:line . "'"
    endif
    return a:line
endfunction

" yank date/datetime string to unnamed register.
command! YankDate let @" = strftime('%Y-%m-%d')
command! YankDateTime let @" = strftime('%Y-%m-%d %H:%M:%S')

