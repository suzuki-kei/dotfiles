
let s:buffer_name = '<markdown-titles>'

function! markdown#list() abort
    " prepare buffer.
    call bufadd(s:buffer_name)
    call bufload(s:buffer_name)

    " setup buffer contents.
    let lines = getline(1, '$')
    let numbered_lines = map(copy(lines), {-> [v:key + 1, v:val]})
    let numbered_title_lines = filter(copy(numbered_lines), {-> match(v:val[1], '^#\+ ') != -1})
    let descriptions = map(copy(numbered_title_lines), {-> printf('%6d: %s', v:val[0], v:val[1])})
    call setbufline(s:buffer_name, 1, descriptions)

    " determine cursor lnum in markdown title window.
    let cursor_lnum_in_markdown_window = len(numbered_title_lines)
    let cursor_lnum_in_current_window = getpos('.')[1]
    for [number, title_line] in reverse(copy(numbered_title_lines))
        if number <= cursor_lnum_in_current_window
            break
        endif
        let cursor_lnum_in_markdown_window = cursor_lnum_in_markdown_window - 1
    endfor

    " open window with buffer.
    let window_ids = win_findbuf(bufnr(s:buffer_name))
    if len(window_ids) == 0
        execute printf('split %s', s:buffer_name)
        call setpos('.', [0, cursor_lnum_in_markdown_window, 1, 0])
        set buftype=nofile
        set cursorline
        nnoremap <buffer><silent> q :q<CR>
        nnoremap <buffer> <Enter> <Cmd>call markdown#title_selected()<CR>
    else
        call win_gotoid(window_ids[0])
        call setpos('.', [window_ids[0], cursor_lnum_in_markdown_window, 1, 0])
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

