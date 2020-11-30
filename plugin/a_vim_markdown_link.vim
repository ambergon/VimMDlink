if exists('g:loaded_a_vim_markdown_link')
    finish
endif
let g:loaded_a_vim_markdown_link = 1

":a_link
command! Alink call a_vim_markdown_link#get()

