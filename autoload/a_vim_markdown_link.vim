let s:dir = expand('<sfile>:p:h')
let s:py_path = s:dir . '/' . 'a_vim_markdown_link.py'
"pyfileを指定する際にvimの変数は使えない？

function! a_vim_markdown_link#get() abort
    execute ':pyfile ' . s:py_path
endfunction

