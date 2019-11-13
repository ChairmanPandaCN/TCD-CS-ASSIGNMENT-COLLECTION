import requests
import getpass
import re
from github import Github

# Functions Prototype

# Retrieve the number of pages need to read to iterate over all the commits


def readPageNumber(url, headers):
    response = requests.get(url, headers=headers)
    header = response.headers
    matchObject = re.search(r'\d+>; rel="last"', str(header["link"]))
    pageNumber = re.search(r'\d+', str(matchObject.group(0)))
    return int(pageNumber.group(0))

# Read each commit information including author name,the date of the commit


def readCommits(url, headers, maxPageNumber):
    commitNumber = 0
    url = url+"&page="
    date = None
    dict = {}
    while 1 <= maxPageNumber:
        tmpUrl = url+str(maxPageNumber)
        response = requests.get(tmpUrl, headers=headers)
        result = response.json()
        for commit in reversed(result):
            commitNumber = commitNumber+1
            getCommitAttributes = commit["commit"]
            getAuthor = getCommitAttributes["author"]
            getAuthorName = getAuthor["name"]
            getCommitDate = getAuthor["date"]
            # Only take date in this format : yyyy-mm-dd
            truncatedCommitDate = getCommitDate[0:10]
            # The date of a commit is assigned to the variable date.
            # If the value stored in date is different from the date of a commit read from the github,it means that the commit was made a day latter than the previous commits.
            if (date != truncatedCommitDate):
                # A new day starts,if this commit is the first commit of the day,update this value.
                date = truncatedCommitDate
                fo = open(truncatedCommitDate+".csv", "w", encoding='utf-8')
                for entry in dict.items():
                    fo.write(str(entry))
                dict.clear()

            if(len(dict) == 0):
                dict[getAuthorName] = 1
            else:
                if(getAuthorName in dict):
                    dict[getAuthorName] = dict.get(getAuthorName)+1
                else:
                    dict[getAuthorName] = 1

            NextDay = getCommitDate[0:10]
            # print(getAuthorName)
            """
            if(contributor.__len__() != 0):
                print(contributor["login"])
            else:
                print("The person who made this commit stay anonymous")
                accountClosed = accountClosed+1
            """
        maxPageNumber = maxPageNumber-1
    print("The total number of commits is", commitNumber)


# enterCorrectAccountInfo = False
# print("Pls enter your credentials correctly")
# username = input("Enter your github username:")
# password = getpass.getpass("Enter your password: ")
# user = Github(username, password)
# repo = user.get_repo("996icu/996.ICU")
repoOwner = "996icu"
repoName = "996.ICU"
#username = input("Enter your username:")
#password = getpass.getpass("Enter your password:")
# up-to-date retrieving commits up to 3019
# https://api.github.com/repos/996icu/996.ICU/commits?author-date:2019-01-01..2019-12-31&per_page=100&page=31
url = "https://api.github.com/repos/" + \
    repoOwner+"/"+repoName + "/commits?"  \
    "author-date:2019-01-01..2019-12-31&per_page=100"
headers = {
    "Accept": "application/vnd.github.cloak-preview",
    "Authentication": "lf0c8c0e09865eb1b7ae7aa1e660888bbb587cdedsk"
}


# get the number of requests needed to make to get all the data
#link = str(headers["link"])
#matchObject = re.search(r'\d+>; rel="last"', link)
#maxPageNumber = re.search(r'\d+', str(matchObject.group(0)))
print(readPageNumber(url, headers))
readCommits(url, headers, readPageNumber(url, headers))
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
