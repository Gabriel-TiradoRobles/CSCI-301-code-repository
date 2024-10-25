#!/usr/bin/env python3

import requests
from bs4 import BeautifulSoup

URL = "https://realpython.github.io/fake-jobs/"
page = requests.get(URL)

# print(page.text)

soup = BeautifulSoup(page.content, "html.parser")
results = soup.find(id="ResultsContainer")

jobElements = results.find_all("div", class_="card-content")

# Filter test
# pythonJobs = results.find_all("h2", string="Python")
pythonJobs = results.find_all("h2", string=lambda text: "python" in text.lower())

pythonJobElements = [
    h2_element.parent.parent.parent for h2_element in pythonJobs
]

for jobElement in pythonJobElements:
	title = jobElement.find("h2", class_="title")
	company = jobElement.find("h3", class_="company")
	location = jobElement.find("p", class_="location")
	links = jobElement.find_all("a")

	print(title.text.strip())
	print(company.text.strip())
	print(location.text.strip())

	for link in links:
		if (link.text.strip() == "Apply"):
			linkUrl = link["href"]
			print("Apply Here: " + link["href"])
	
	print()

# print(len(pythonJobs))