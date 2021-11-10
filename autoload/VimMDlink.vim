
function! VimMDlink#get(...) abort
    for n in range(a:1, a:2)
        call cursor( n , 0 )
        execute 'python3 VimMDlinkInst.get_title()'
    endfor
endfunction


python3 << EOF
# -*- coding: utf-8 -*-
import vim
import re
import sys

try:   
    import urllib3
except ImportError:   
    try:
        vim.command("!pip install urllib3")
        import urllib3
    except:   
        print("install error : urllib3")

try:   
    from bs4 import BeautifulSoup
except ImportError:   
    try:
        vim.command("!pip install bs4")
        from bs4 import BeautifulSoup
    except:   
        print("install error : bs4_beautifulsoup4")

class VimMDlink:
    def __init__(self):
        test = ''

    def get_title(self):
        result = ""
        line = vim.current.line
        #一行内に複数ある場合の処理
        line_parts = re.split(r'(\[.*?\]\(http.*?\))',line)
        for line_str in  line_parts :

            r = r'\[(?P<title>)\](?P<url>\(http.+?\))'
            pattern = re.compile(r)
            match = pattern.search(line_str)
            
            if line_str == "":
                continue
            #matchしなかった場合
            if match == None:
                result = result + line_str
                continue

            #titleが挿入されていない場合のみ
            elif match.group('title') == "" :
                url = match.group('url').replace('(','').replace(')','')

                req = urllib3.PoolManager()
                get_result = req.request('GET',url)
                soup = BeautifulSoup(get_result.data, 'html.parser')
                text = soup.find('title').text

                xxx = re.sub(r'\[\]','[' + text + ']',line_str ,count=1)
                result = result + xxx

            else :
                result = result + line_str

        #print result
        vim.current.line = result

VimMDlinkInst = VimMDlink()

EOF
