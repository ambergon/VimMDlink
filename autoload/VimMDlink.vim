let s:dir = expand('<sfile>:p:h')
let s:py_path = s:dir . '/' . 'VimMDlink.py'

function! VimMDlink#get(...) abort
    for n in range(a:1, a:2)
        call cursor( n , 0 )
        execute ':py3file ' . s:py_path
    endfor
endfunction

