
let s:buffer_name = '<markdown-titles>'

function! markdown#list() abort
    " prepare buffer.
    call bufadd(s:buffer_name)
    call bufload(s:buffer_name)

    " setup buffer contents.
    let lines = getline(1, '$')
    let numbered_lines = map(lines, {-> [v:key + 1, v:val]})
    let numbered_title_lines = filter(numbered_lines, {-> match(v:val[1], '^#\+ ') != -1})
    let descriptions = map(numbered_title_lines, {-> printf('%6d: %s', v:val[0], v:val[1])})
    call setbufline(s:buffer_name, 1, descriptions)

    " open window with buffer.
    let window_ids = win_findbuf(bufnr(s:buffer_name))
    if len(window_ids) == 0
        execute printf('split %s', s:buffer_name)
        set buftype=nofile
        set cursorline
        nnoremap <buffer><silent> q :q<CR>
        nnoremap <buffer> <Enter> <Cmd>call markdown#title_selected()<CR>
    else
        call win_gotoid(window_ids[0])
    endif
endfunction

function! markdown#title_selected() abort
    let line = getline('.')

    execute printf("bwipeout %s", s:buffer_name)

    if match(line, '^ \+\d\+:.\+$') != -1
        let offset = trim(split(line, ':\t')[0])
        execute printf("normal! %dGzt", offset)
    endif
endfunction

