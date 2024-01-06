
if exists('g:markdown_plugin_disable')
    finish
endif

if exists('g:markdown_plugin_loaded')
    finish
else
    let g:markdown_plugin_loaded = 1
endif

" 現状は "list<Tab>" で高速に入力できることを優先する.
" "list" から始まるコマンドが増えた場合はプラグイン名をプレフィックスにするように変更する.
command! ListMarkdownTitles call markdown#list()

