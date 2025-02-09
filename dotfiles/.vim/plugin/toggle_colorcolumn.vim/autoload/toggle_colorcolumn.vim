
if &colorcolumn == ''
    let g:toggle_colorcolumn_value = 80
else
    let g:toggle_colorcolumn_value = &colorcolumn
endif

function! toggle_colorcolumn#toggle() abort
    if &colorcolumn == ''
        execute 'set colorcolumn=' . g:toggle_colorcolumn_value
    else
        let g:toggle_colorcolumn_value = &colorcolumn
        set colorcolumn=
    endif
endfunction

