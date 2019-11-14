import requests
import getpass
import re
from github import Github
# Problem :
# Cant read commits which were commited on the date when a contributor made the last commit to the project.Since there is no date to compare with

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

    fo = open("commits.csv", "w", encoding='utf-8')
    fo.close()
    fo = open("commits.csv", "a", encoding='utf-8')
    fo.write("name,type,value,date\n")
    while 1 <= maxPageNumber:
        tmpUrl = url+str(maxPageNumber)
        response = requests.get(tmpUrl, headers=headers)
        result = response.json()
        for entry in reversed(result):
            commitNumber = commitNumber+1
            if(entry["author"] != None and len(entry["author"]) != 0):
                getAuthor = entry["author"]
                getAuthorName = getAuthor["login"]
                getCommit = entry["commit"]
                getCommitter = getCommit["committer"]
                getTimePushedOntoGithub = getCommitter["date"]
            else:
                getCommit = entry["commit"]
                getAuthor = getCommit["author"]
                getAuthorName = getAuthor["name"]
                getCommitter = getCommit["committer"]
                getTimePushedOntoGithub = getCommitter["date"]
            # Only take date in this format : yyyy-mm-dd
            truncatedCommitDate = getTimePushedOntoGithub[0:10]
            # The date of a commit is assigned to the variable date.
            # If the value stored in date is different from the date of a commit read from the github,it means that the commit was made a day latter than the previous commits.
            if (date != truncatedCommitDate and len(dict) != 0):
                # A new day starts,if this commit is the first commit of the day,update
                print(date)
                listofTuples = sorted(
                    dict.items(), reverse=True, key=lambda x:  x[1])
                for elem in listofTuples:
                    # fo.write(k+",,"+str(v)+","+date+",\n")
                    fo.write(str(elem[0])+",,"+str(elem[1])+","+date+",\n")
                    # print((str(elem[0])+",,"+str(elem[1])+","))
                # for k, v in dict.items():
                    # fo.write(k+",,"+str(v)+","+date+",\n")

            date = truncatedCommitDate
            if(len(dict) == 0):
                dict[getAuthorName] = 1
            else:
                if(getAuthorName in dict):
                    dict[getAuthorName] = dict.get(getAuthorName)+1
                else:
                    dict[getAuthorName] = 1

            # NextDay = getCommitDate[0:10]
            # print(getAuthorName)
        maxPageNumber = maxPageNumber-1
    print("The total number of commits is", commitNumber)


# enterCorrectAccountInfo = False
# print("Pls enter your credentials correctly")
# username = input("Enter your github username:")
# password = getpass.getpass("Enter your password: ")
# user = Github(username, password)
# repo = user.get_repo("996icu/996.ICU")
repoOwner = input("Pls input the owner name of the repo : ")
repoName = input("Pls input the name of repo : ")
since = input(
    "Input the date the program starts to collect (format : yyyy-mm-dd) :")
until = input(
    "Input the date the program ceases collection (format : yyyy-mm-dd) : ")
# username = input("Enter your username:")
# password = getpass.getpass("Enter your password:")
# up-to-date retrieving commits up to 3019
# https://api.github.com/repos/996icu/996.ICU/commits?author-date:2019-01-01..2019-12-31&per_page=100&page=31
url = "https://api.github.com/repos/" + \
    repoOwner+"/"+repoName + "/commits?"  \
    "since="+since + "&" + "until="+until+"&per_page=100"
# author-date:2019-01-01..2019-12-31
headers = {
    "Accept": "application/vnd.github.cloak-preview",
    "Authorization": "token ecef173256637a6e2f7f22f265c61e251111b906"
}


# get the number of requests needed to make to get all the data
# link = str(headers["link"])
# matchObject = re.search(r'\d+>; rel="last"', link)
# maxPageNumber = re.search(r'\d+', str(matchObject.group(0)))
print(readPageNumber(url, headers))
readCommits(url, headers, readPageNumber(url, headers))
print("sss")
