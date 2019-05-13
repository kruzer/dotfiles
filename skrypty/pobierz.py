#!/bin/env python
from bs4 import BeautifulSoup
from skraper import simple_get
from os import path
from os import system
import re
import urllib.request
import subprocess

#raw_html = open('index.htm','r').read()
raw_html = simple_get('https://4chan.org/wg')
html = BeautifulSoup( raw_html, 'html.parser')

for div in html.select('div'):
    if div.has_attr('class'):
        if 'fileText' in div.attrs['class']:
            linie = [x for x in div.children]
            if 'File: ' == linie[0]:
                liczby = re.findall("[-+]?[.]?[\d]+(?:,\d\d\d)*[\.]?\d*(?:[eE][-+]?\d+)?" , linie[2])
                if(int(liczby[1]) < 2000):
                    print("pomijam - za wąski:", liczby[1],'x', liczby[2])
                    continue
                if(int(liczby[1]) < int(liczby[2])):
                    print("pomijam - za wysoki:", linie[2])
                    continue
                url = "http:" + linie[1].attrs['href']
                plik = url[url.rfind('/')+1:]
                print("plik:", plik, " url:", url)
                if(path.isfile(plik)):
                    print("pomijam - już pobrany")
                    continue
                if(path.splitext(plik)[1] != ".jpg"):
                    print("pomijam - to nie jest jpg")
                    continue
                try:
                    urllib.request.urlretrieve(url, plik)
                    subprocess.run(["mogrify","-strip","-interlace", "Plane", "-resize", "2880x1800^","-gravity", "center", "-crop", "2880x1800+0+0","+repage","-quality", "85%", plik])
                    system('notify-send -a scraper "Pobrano tapetę" "nazwa:{} rozmiar:{}"'.format(linie[1],linie[2]))
                except:
                    print("Oops!",linie[1],linie[2])
                    
