from bs4 import BeautifulSoup
import requests
from glob import glob
import re

base = "https://projecteuler.net/problem="

with open("README.md", "w") as rme:
    rme.write("# [Project Euler](https://projecteuler.net/) Solutions in [Julia](http://julialang.org/)\n")
    rme.write("These aren't the best solutions, but they are mine. If you appropriate the answers to get fake points on projecteuler, your mom will be disappointed.\n\n")
    rme.write("| Problem    | Solution  | Latest Time |\n")
    rme.write("| ---------- | --------  | ----------- |\n")

    for pr in glob("problems/problem*jl"):
        print("summarizing {}...".format(pr))
        problem_num = int(re.findall("\d+", pr)[0])
        url = "{}{}".format(base, problem_num)
        req = requests.get(url)
        soup = BeautifulSoup(req.text, "html5lib")
        problem_name = soup.findAll('h2')[0].text
        rme.write(
                "| [{}]({}) | [{}]({}) | 0 |\n".format(
                    problem_name, url, pr, pr))

