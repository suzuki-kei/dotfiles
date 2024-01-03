
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

" return to normal mode.
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>

" reset before <C-l>.
nnoremap <C-l> <Cmd>nohlsearch<CR><Cmd>set nonumber<CR><Cmd>set nolist<CR><Cmd>diffupdate<CR><C-l>

" enter search command with selected text.
vnoremap / y/<C-r>"
vnoremap ? y?<C-r>"

" highlight a word under the cursor.
nnoremap * msHmt`s*`tzt`s
nnoremap # msHmt`s#`tzt`s
nnoremap g* msHmt`sg*`tzt`s
nnoremap g# msHmt`sg#`tzt`s

" searches selected text, but cursor does not move.
" see help "v_y", "/", "c_<C-R>", "/\V", "c_CTRL-R_=", "builtin-functions", "@", "<CR>"
vnoremap * msHmt`s"vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>`tzt`sN
vnoremap # msHmt`s"vy?\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>`tzt`sn

" enter visual mode and select a word under the cursor.
nnoremap <S-k> lb<C-v>e

" expand selected text to ex commands and open command-line window.
vnoremap <S-k> "vy<Cmd>call TextToExCommands(@v)<CR>q:G"vpkdgg

function! TextToExCommands(text) abort
    let commands = []
    let lines = filter(map(split(a:text, "\n"), 'trim(v:val)'), 'v:val != ""')
    let words = map(split(a:text, '[ \t\n]\+'), 'trim(v:val)')
    call add(commands, len(words) > 1 ? '' : 'help ' . words[0])
    call add(commands, 'terminal ++shell ' . join(map(copy(lines), function('LineToShellCommand')), '; '))
    call add(commands, len(words) > 1 ? '' : 'terminal ++shell ++close man ' . shellescape(words[0]))
    call add(commands, 'terminal ++shell ++hidden ++close g ' . join(map(uniq(sort(copy(words))), 'shellescape(v:val)'), ' '))
    call add(commands, len(words) > 1 ? '' : 'terminal ++shell ++hidden ++open goo ' . shellescape(words[0]))
    call add(commands, len(words) > 1 ? '' : 'terminal ++shell ++hidden ++open alc ' . shellescape(words[0]))
    " see help "cmdline-special" to know escape '#%'.
    let @v = escape(join(filter(commands, 'v:val != ""'), "\n"), '#%')
endfunction

function! LineToShellCommand(i, line) abort
    if match(a:line, '^https\?://') >= 0
        return "g '" . a:line . "'"
    endif
    return a:line
endfunction

