
if exists('g:powersk_plugin_disable')
    finish
endif

if exists('g:powersk_plugin_loaded')
    finish
else
    let g:powersk_plugin_loaded = 1
endif

nnoremap <S-k> <Cmd>call powersk#enter_visual_mode()<CR>
vnoremap <S-k> <Cmd>call powersk#open_command_window_with_ex_commands()<CR>
nnoremap <C-c> <Cmd>call powersk#quit_command_window()<CR>

