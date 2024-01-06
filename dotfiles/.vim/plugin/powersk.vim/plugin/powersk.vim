
if exists('g:powersk_plugin_disable')
    finish
endif

if exists('g:powersk_plugin_loaded')
    finish
else
    let g:powersk_plugin_loaded = 1
endif

" enter visual mode and select a word under the cursor.
nnoremap <S-k> <Cmd>call powersk#visual_select()<CR>

function! powersk#visual_select() abort
    call search('[[:keyword:]]*', 'bc', line('.'))
    normal! v
    call search('[[:keyword:]]\+\|[^[:keyword:]]', 'ce', line('.'))
endfunction

" expand selected text to ex commands and open command-line window.
vnoremap <S-k> "vy<Cmd>call powersk#prepare_ex_commands_from_text('v')<CR>q:G"vp0kdgg

