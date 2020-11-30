# encoding:utf-8

import vim
import urllib
from bs4 import BeautifulSoup
import re
import sys

line = vim.current.line
#line = 'aaa[](https://ambergonslibrary.com/)'
#line = 'aaa[aaa](https://ambergonslibrary.com/)'

r = r'(\[(?P<title>.*?)\](?P<url>\(http.+?\)))'
p = re.compile(r)
m = p.search(line)
if m == None:
    #matchしなかった場合
    print('NO URL')
    #sys.stderr.write('NO URL')
elif m.group('title') == "" :
    #titleが挿入されていない場合のみ
    url = m.group('url').replace('(','').replace(')','')
      
    html = urllib.urlopen(url)
    soup = BeautifulSoup(html,"html.parser")
    text = soup.title.string
    title_text = text.encode('utf-8')

    vim.current.line = re.sub(r'\[\]','[' + title_text + ']',line)
