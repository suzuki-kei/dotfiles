
let s:regname = 'v'

function! powersk#enter_visual_mode() abort
    call search('[[:keyword:]]*', 'bc', line('.'))
    normal! v
    call search('[[:keyword:]]\+\|[^[:keyword:]]', 'ce', line('.'))
endfunction

function! powersk#open_command_window_with_ex_commands() abort
    execute printf('normal! "%sy', s:regname)
    let text = getreg(s:regname)
    let lines = filter(map(split(text, "\n"), 'trim(v:val)'), 'v:val != ""')

    let url_commands = []
    let help_commands = []
    let shell_commands = []
    let man_commands = []
    let g_commands = []

    for line in lines
        if match(line, '^https\?://') != -1
            call add(url_commands, 'terminal ++shell ++hidden ++close g ' . shellescape(line))
            continue
        endif

        let words = map(split(line, '[ \t\n]\+'), 'trim(v:val)')

        if s:in_help_tags(words[0])
            call add(help_commands, 'help ' . words[0])
        endif

        if system('compgen -c | grep -xF -- ' . shellescape(words[0])) != ''
            call add(shell_commands, 'terminal ++shell ' . line)
            call add(man_commands, 'terminal ++shell ++close man ' . shellescape(words[0]))
        endif

        call add(g_commands, 'terminal ++shell ++hidden ++close g ' . shellescape(join(words, ' ')))
    endfor

    let commands = []
    let commands += s:unique(help_commands)
    let commands += s:unique(shell_commands)
    let commands += s:unique(man_commands)
    let commands += s:unique(g_commands)
    let commands += s:unique(url_commands)

    " see help "cmdline-special" to know escape '#%'.
    call setreg(s:regname, escape(join(commands, "\n"), '#%'))
    call feedkeys(printf('q:G"%sp0kdgg', s:regname), 'n')
endfunction

function! powersk#quit_command_window() abort
    if win_gettype() != 'command'
        return
    endif

    execute 'q'
endfunction

function! s:in_help_tags(keyword) abort
    let tag_file_path = $VIMRUNTIME . '/doc/tags'
    return system('cut -d" " -f1 ' . tag_file_path . ' | grep -F ' . shellescape(a:keyword)) != ''
endfunction

function! s:unique(values) abort
    let checked_values = {}
    let uniqued_values = []

    for value in a:values
        if !has_key(checked_values, value)
            call add(uniqued_values, value)
            let checked_values[value] = 1
        endif
    endfor

    return uniqued_values
endfunction

