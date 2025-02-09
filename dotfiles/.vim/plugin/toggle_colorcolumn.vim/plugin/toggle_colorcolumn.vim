
if exists('g:toggle_colorcolumn_disable')
    finish
endif

if exists('g:toggle_colorcolumn_loaded')
    finish
else
    let g:toggle_colorcolumn_loaded = 1
endif

nnoremap <C-k> <Cmd>call toggle_colorcolumn#toggle()<CR>

