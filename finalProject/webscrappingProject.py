#!/usr/bin/env python3

import requests
from bs4 import BeautifulSoup

URL = "https://remote.co/remote-jobs/developer/"
page = requests.get(URL)

# print(page.text)

soup = BeautifulSoup(page.content, "html.parser")

job_results = soup.find_all('a', class_="card")

for job_element in job_results:
    # Job Title Filtering
    job_title = job_element.find("span", class_="font-weight-bold larger")

    # Company name Filtering
    name_and_tags = job_element.find("p", class_="m-0 text-secondary")
    name_and_tags = name_and_tags.text.replace("&nbsp;", "")
    name_and_tags = name_and_tags.replace("\n", "")
    name_and_tags = name_and_tags.replace("\xa0", "")
    name_and_tags = name_and_tags.replace("  ", "")
    name_and_tags = name_and_tags.strip()
    name_and_tags = name_and_tags.split("|")

    # Extra Job Info Link Filtering
    link_url = job_element["href"]
    link_url.strip()

    # Job Title
    print("JOB TITLE: " + job_title.text.strip())

    # Company Name
    print("COMPANY: " + name_and_tags[0])

    # Extra Info Link
    print("Job Info and Apply: remote.co" + link_url)

    # All job tags
    print("TAGS:")
    index = 0
    for index, tag in enumerate(name_and_tags, start=0):
        if (index != 0):
            print("\t" + str(index) + ". " + tag)

    

    print("\n")
    

# print(soup)