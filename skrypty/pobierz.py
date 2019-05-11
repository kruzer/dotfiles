#!/bin/env python
from bs4 import BeautifulSoup
from skraper import simple_get
from os import path
import re
import urllib.request


#raw_html = open('index.htm','r').read()
raw_html = simple_get('https://4chan.org/wg')
html = BeautifulSoup( raw_html, 'html.parser')

for div in html.select('div'):
    if div.has_attr('class'):
        if 'fileText' in div.attrs['class']:
            linie = [x for x in div.children]
            if 'File: ' == linie[0]:
                liczby = re.findall("[-+]?[.]?[\d]+(?:,\d\d\d)*[\.]?\d*(?:[eE][-+]?\d+)?" , linie[2])
                if(int(liczby[1]) > 1900):
                    url = "http:" + linie[1].attrs['href']
                    plik = url[url.rfind('/')+1:]
                    print("plik:", plik, " url:", url)
                    if(path.isfile(plik)):
                        print("pomijam - już pobrany")
                    else:
                        try:
                            urllib.request.urlretrieve(url, plik)
                        except:
                            print("Oops!",linie[1],linie[2])
                else:
                    print("m   :", linie[2])
