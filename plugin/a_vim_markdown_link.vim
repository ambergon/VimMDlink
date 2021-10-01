if exists('g:loaded_mdlink')
    finish
endif
let g:loaded_mdlink = 1

":MDlink
command! -range MDlink call a_vim_markdown_link#get(<line1>,<line2>)

