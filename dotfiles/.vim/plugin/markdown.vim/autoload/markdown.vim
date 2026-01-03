
let s:headings_bufname = '<markdown-headings>'

function! markdown#list_headings() abort
    if s:already_in_the_headings_window()
        return
    endif

    call s:analyze_markdown(bufnr('%'))
    call s:create_or_update_headings_window()
endfunction

function! markdown#select_heading() abort
    let selected_line = getline('.')
    if match(selected_line, '^ \+\d\+:.\+$') != -1
        let lnum_in_source_window = trim(split(selected_line, ':')[0])
        execute printf('bwipeout %s', s:headings_bufname)
        execute printf('normal! %dGzt', lnum_in_source_window)
    endif
endfunction

function! markdown#increment_current_heading_level() abort
    if s:current_heading_level < s:max_heading_level
        let s:current_heading_level += 1
        call s:create_or_update_headings_window()
    endif
endfunction

function! markdown#decrement_current_heading_level() abort
    if s:current_heading_level > 1
        let s:current_heading_level -= 1
        call s:create_or_update_headings_window()
    endif
endfunction

function! s:already_in_the_headings_window() abort
    let current_winid = win_getid()
    let headings_winids = s:get_headings_winids()
    return index(headings_winids, current_winid) != -1
endfunction

function! s:get_headings_winids() abort
    let headings_bufnr = bufnr(s:headings_bufname)
    if headings_bufnr == -1
        return []
    endif

    let headings_wininfo_list = filter(
        \ getwininfo(),
        \ {-> v:val.bufnr == headings_bufnr})
    let headings_winids = map(
        \ headings_wininfo_list,
        \ {-> v:val.winid})
    return headings_winids
endfunction

function! s:analyze_markdown(bufnr) abort
    let s:headings = s:get_headings(a:bufnr)
    let s:max_heading_level = s:get_max_heading_level(s:headings)
    let s:current_heading_level = s:max_heading_level
endfunction

function! s:get_headings(bufnr) abort
    let numbered_lines = map(
        \ getbufline(a:bufnr, 1, '$'),
        \ {-> [v:key + 1, v:val]})
    let numbered_heading_lines = filter(
        \ numbered_lines,
        \ {-> match(v:val[1], '^#\+ ') != -1})
    let headings = map(
        \ numbered_heading_lines,
        \ {-> {
            \ 'lnum'  : v:val[0],
            \ 'level' : len(split(v:val[1], ' ')[0]),
            \ 'line'  : v:val[1]
        \ }})
    return headings
endfunction

function! s:get_max_heading_level(headings) abort
    let heading_levels = map(
        \ copy(a:headings),
        \ {-> v:val.level})
    return max(heading_levels)
endfunction

function! s:get_lines_and_lnum_in_heading_window(window_created) abort
    let filtered_headings = filter(
        \ copy(s:headings),
        \ {-> v:val.level <= s:current_heading_level})
    let lines_in_headings_buffer = map(
        \ copy(filtered_headings),
        \ {-> printf('%6d: %s', v:val.lnum, v:val.line)})

    if a:window_created
        let lnum_in_headings_window = s:get_lnum_in_headings_window(
            \ filtered_headings,
            \ trim(split(getline('.'), ':')[0]))
    else
        let lnum_in_headings_window = s:get_lnum_in_headings_window(
            \ filtered_headings,
            \ line('.'))
    endif

    return [lines_in_headings_buffer, lnum_in_headings_window]
endfunction

function! s:create_or_update_headings_window() abort
    let bufnr = bufadd(s:headings_bufname)
    let window_created = bufwinid(bufnr) != -1
    call bufload(bufnr)

    let [lines, lnum] = s:get_lines_and_lnum_in_heading_window(window_created)

    call setbufvar(bufnr, '&modifiable', 1)
    call setbufline(bufnr, 1, lines)
    call deletebufline(bufnr, len(lines) + 1, '$')
    call setbufvar(bufnr, '&modifiable', 0)

    if !window_created
        execute printf('tabnew %s', s:headings_bufname)
        redraw! " clear status line
        set buftype=nofile
        set cursorline
        nnoremap <buffer><silent> q :q<CR>
        nnoremap <buffer> <Enter> <Cmd>call markdown#select_heading()<CR>
        nnoremap <buffer> > <Cmd>call markdown#increment_current_heading_level()<CR>
        nnoremap <buffer> < <Cmd>call markdown#decrement_current_heading_level()<CR>
    endif

    call setpos('.', [bufnr, lnum, 1, 0])
endfunction

function! s:get_lnum_in_headings_window(headings, upper_lnum) abort
    let lnum_in_headings_window = len(a:headings)

    for heading in reverse(copy(a:headings))
        if heading.lnum <= a:upper_lnum
            break
        endif
        let lnum_in_headings_window -= 1
    endfor

    return lnum_in_headings_window
endfunction

