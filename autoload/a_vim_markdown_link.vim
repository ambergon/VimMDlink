let s:dir = expand('<sfile>:p:h')
let s:py_path = s:dir . '/' . 'a_vim_markdown_link.py'

function! a_vim_markdown_link#get(...) abort
    for n in range(a:1, a:2)
        call cursor( n , 0 )
        execute ':py3file ' . s:py_path
    endfor
endfunction

