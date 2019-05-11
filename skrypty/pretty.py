#!/bin/env python
from bs4 import BeautifulSoup

raw_html = open('index.htm').read()
html = BeautifulSoup( raw_html, 'html.parser')

print(html.prettify())
