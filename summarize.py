from bs4 import BeautifulSoup
import requests
from glob import glob
import re

BASEURL = "https://projecteuler.net/problem="

with open("README.md", "w") as rme:
    for pr in glob("problem*jl"):
        problem_num = int(re.findall("\d+", pr)[0])
        url = "{}{}".format(BASEURL, problem_num)
        req = requests.get(url)
        soup = BeautifulSoup(req.text, "html5lib")
        problem_name = soup.findAll('h2')[0].text
        rme.write("[{}]({}) --- [{}]({})\n\n".format(problem_name, url, pr, pr))

