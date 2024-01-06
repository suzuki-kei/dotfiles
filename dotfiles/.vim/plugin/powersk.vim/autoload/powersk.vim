
function! powersk#prepare_ex_commands_from_text(regname) abort
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
    let commands = commands + powersk#unique(url_commands)
    let commands = commands + powersk#unique(help_commands)
    let commands = commands + powersk#unique(shell_commands)
    let commands = commands + powersk#unique(man_commands)
    let commands = commands + powersk#unique(g_commands)
    let commands = commands + powersk#unique(goo_commands)
    let commands = commands + powersk#unique(alc_commands)

    " see help "cmdline-special" to know escape '#%'.
    call setreg(a:regname, escape(join(commands, "\n"), '#%'))
endfunction

function! powersk#unique(values) abort
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

