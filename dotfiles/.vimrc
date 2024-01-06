
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
vnoremap <S-k> "vy<Cmd>call PrepareExCommandsFromText('v')<CR>q:G"vpkdgg

function! PrepareExCommandsFromText(regname) abort
    let text = getreg(a:regname)
    let lines = filter(map(split(text, "\n"), 'trim(v:val)'), 'v:val != ""')

    let url_commands = []
    let help_commands = []
    let shell_commands = []
    let man_commands = []
    let g_commands = []
    let goo_commands = []
    let alc_commands = []

    for line in lines
        if match(line, '^https\?://') != -1
            call add(url_commands, 'terminal ++shell ++hidden ++close g ' . shellescape(line))
            continue
        endif

        let words = map(split(line, '[ \t\n]\+'), 'trim(v:val)')

        if len(taglist(words[0])) != 0
            call add(help_commands, 'help ' . words[0])
        endif

        if system('compgen -c | grep -xF -- ' . shellescape(words[0])) != ''
            call add(shell_commands, 'terminal ++shell ' . line)
            call add(man_commands, 'terminal ++shell ++close man ' . shellescape(words[0]))
        endif

        call add(g_commands, 'terminal ++shell ++hidden ++close g ' . shellescape(join(words, ' ')))

        for word in words
            if match(word, '^[[:keyword:]]\+$') != -1
                call add(goo_commands, 'terminal ++shell ++hidden ++open goo ' . shellescape(word))
                call add(alc_commands, 'terminal ++shell ++hidden ++open alc ' . shellescape(word))
                break
            endif
        endfor
    endfor

    let commands = []
    let commands = commands + Unique(url_commands)
    let commands = commands + Unique(help_commands)
    let commands = commands + Unique(shell_commands)
    let commands = commands + Unique(man_commands)
    let commands = commands + Unique(g_commands)
    let commands = commands + Unique(goo_commands)
    let commands = commands + Unique(alc_commands)

    " see help "cmdline-special" to know escape '#%'.
    call setreg(a:regname, escape(join(commands, "\n"), '#%'))
endfunction

function! Unique(values) abort
    let duplicated = {}
    let uniqued_values = []

    for value in a:values
        if !has_key(duplicated, value)
            call add(uniqued_values, value)
            let duplicated[value] = 1
        endif
    endfor

    return uniqued_values
endfunction

" open the same page in vim-jp.org as vim help.
command! OpenVimJp execute 'terminal ++shell ++close ++hidden g ' . shellescape('https://vim-jp.org/vimdoc-ja/' . expand('%:t:r') . '.html')

