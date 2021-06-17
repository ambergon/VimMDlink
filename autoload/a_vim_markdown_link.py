# encoding:utf-8

import vim
#import urllib
import urllib3
from bs4 import BeautifulSoup
import re
import sys

line = vim.current.line

line_parts = re.split(r'(\[.*?\]\(http.*?\))',line)
result = ""
for line_str in  line_parts :
    if line_str == "":
        continue

    r = r'\[(?P<title>)\](?P<url>\(http.+?\))'
    p = re.compile(r)
    m = p.search(line_str)
    
    if m == None:
        #matchしなかった場合
        #print('NO URL')
        #sys.stderr.write('NO URL')
        result = result + line_str
        continue
    elif m.group('title') == "" :
        #titleが挿入されていない場合のみ
        url = m.group('url').replace('(','').replace(')','')






        #html = urllib.urlopen(url)
        req = urllib3.PoolManager()
        get_result = req.request('GET',url)
        soup = BeautifulSoup(get_result.data, 'html.parser')
        #soup = BeautifulSoup(html,"html.parser")
        #text = soup.title.string
        text = soup.find('title').text
        #title_text = text.encode('utf-8')

        #xxx = re.sub(r'\[\]','[' + title_text + ']',line_str ,count=1)
        xxx = re.sub(r'\[\]','[' + text + ']',line_str ,count=1)
        result = result + xxx

    else :
        result = result + line_str

#print result
vim.current.line = result

