# python 2 project
# Guha's page has too many files and they are all word,
# I'm too lazy to download them one by one and convert them
# to pdf manually. So I made this scraper to crawl his page 
# and a powershell batch script to convert them to pdf 


import urllib
from urllib.request import urlopen
from bs4 import BeautifulSoup
import re

url = "http://www.cs.ucf.edu/~dmarino/ucf/cop3503/lectures/"
response = urlopen(url)
soup = BeautifulSoup(response)

downloader = urllib.URLopener()

for link in soup.findAll('a', attrs={'href': re.compile(".doc")}):
	downloadUrl = url + link.get('href')
	filename = "C:/Users/Frango/Desktop/TestFolder/file/" + downloadUrl.split('/')[-1]
	downloader.retrieve(downloadUrl, filename)
#print response.read()
