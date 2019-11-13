import requests
import getpass
import re
from github import Github

# Functions


def readPageNumber(url, headers):
    response = requests.get(url, headers=headers)
    headers = response.headers

    matchObject = re.search(r'\d+>; rel="last"', str(headers["link"]))
    pageNumber = re.search(r'\d+', str(matchObject.group(0)))
    return int(pageNumber.group(0))


def readContributors(url, headers, maxPageNumber):
    pageNumber = 1
    commitNumber = 0
    url = url+"&page="
    while pageNumber <= maxPageNumber:
        tmpUrl = url+str(pageNumber)
        response = requests.get(tmpUrl, headers=headers)
        result = response.json()
        for commit in result:
            commitNumber = commitNumber+1
            getCommitAttributes = commit["commit"]
            getAuthor = getCommitAttributes["author"]
            getAuthorName = getAuthor["name"]
            print(getAuthorName)
            """
            if(contributor.__len__() != 0):
                print(contributor["login"])
            else:
                print("The person who made this commit stay anonymous")
                accountClosed = accountClosed+1
            """
        pageNumber = pageNumber+1
    print("The total number of commits is", commitNumber)
# enterCorrectAccountInfo = False
# print("Pls enter your credentials correctly")
# username = input("Enter your github username:")
# password = getpass.getpass("Enter your password: ")
# user = Github(username, password)
# repo = user.get_repo("996icu/996.ICU")
repoOwner = "996icu"
repoName = "996.ICU"
# up-to-date retrieving commits up to 3019
# https://api.github.com/repos/996icu/996.ICU/commits?author-date:2019-01-01..2019-12-31&per_page=100&page=31
url = "https://api.github.com/repos/" + \
    repoOwner+"/"+repoName + "/commits?"  \
    "author-date:2019-01-01..2019-12-31&per_page=100"
headers = {
    "Accept": "application/vnd.github.cloak-preview",
    "Authorization": "token eca8d1c83d2d62fcbc619dee372c1c6162112cc3"
}


# get the number of requests needed to make to get all the data
#link = str(headers["link"])
#matchObject = re.search(r'\d+>; rel="last"', link)
#maxPageNumber = re.search(r'\d+', str(matchObject.group(0)))
print(readPageNumber(url, headers))
readContributors(url, headers, readPageNumber(url, headers))
"""
response = requests.get(url, headers=headers)
result = response.json()
commits = result.get("items")
accountClosed = 0
for commit in commits:
    contributor = commit["author"]
    if(contributor != None):
        print(contributor["login"])
    else:
        print("The person who made this commit closed his account.")
        accountClosed = accountClosed+1

print("The number of accounts been closed by its owner is %d", accountClosed)
# with open("response.txt", 'wb') as f:
#    f.write(response.json())
# print(response.json())
# print("FUCK U")
"""
print("sss")
