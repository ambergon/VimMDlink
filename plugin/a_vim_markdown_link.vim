if exists('g:loaded_a_vim_markdown_link')
    finish
endif
let g:loaded_a_vim_markdown_link = 1

":MDlink
command! -range MDlink call a_vim_markdown_link#get(<line1>,<line2>)

