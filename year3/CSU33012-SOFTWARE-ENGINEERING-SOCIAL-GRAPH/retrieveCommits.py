import requests
import re
import datetime
import os

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
    commitsPerAuthor = {}
    commitHour = {}
    relativePath = repoOwner + "/"+repoName+"/"
    year = 0
    date = None
    fo = open(relativePath+"commitsCount.csv",
              "w", encoding='utf-8')
    f2 = open(relativePath+"push.csv",
              "w", encoding='utf-8')
    fo.write("name,type,value,date\n")
    f2.write("name,type,value,date\n")
    authorNameOfLastEntry = ""
    timePushedOntoGithubOfLastEntry = ""
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
            truncatedCommitHour = int(getTimePushedOntoGithub[11:13])
            if(date == None):
                date = truncatedCommitDate

            # If the value of year is different from the truncatedCommitDate[0:4],it means that a new year started when the commit was committed.
            # Split the collected date into associatice parts,depends on which year the commit was committed.
            # Store everything in a large table causes the incapability of visualization.

            # if(year != truncatedCommitDate[0:4]):
                #year = truncatedCommitDate[0:4]
                # fo = open(relativePath+str(year)+".csv",
                # "w", encoding='utf-8')
                # f2 = open(relativePath+str(year)+"pushedOntoGitHub.csv",
                # "w", encoding='utf-8')
                # fo.write("name,type,value,date\n")
                # f2.write("name,type,value,date\n")
            # In the perfect scenario,when Chronologically iterating all the commits in the repo,the date of each commit is either the same date as the previous commit or a/multiple day(s) later than the previous date.Unfortunately, sometimes it happens for whatever reasons,the date of a commit is one day earlier than the previous commit.In this case, pretend the commit was committed at the same date as the previous commit.

            # The date of a commit is assigned to the variable date.
            # If the value stored in date is different from the date of a commit read from the github,it means that the commit was made a day latter than the previous commits.
            date_yyyy = int(date[0:4])
            date_mm = int(date[5:7])
            date_dd = int(date[8:10])
            truncatedCommitDate_yyyy = int(truncatedCommitDate[0:4])
            truncatedCommitDate_mm = int(truncatedCommitDate[5:7])
            truncatedCommitDate_dd = int(truncatedCommitDate[8:10])
            if (date != truncatedCommitDate and len(commitsPerAuthor) != 0):
                if(datetime.datetime(date_yyyy, date_mm, date_dd) < datetime.datetime(truncatedCommitDate_yyyy, truncatedCommitDate_mm, truncatedCommitDate_dd)):
                    # A new day starts,if this commit is the first commit of the day,update
                    print(date)
                    commitsSortedInQuantityOrder = sorted(
                        commitsPerAuthor.items(), reverse=True, key=lambda x:  x[1])
                    for elem in commitsSortedInQuantityOrder:
                        # Name,Type,Value,Date
                        fo.write(str(elem[0]).replace(",", " ") +
                                 ",,"+str(elem[1])+","+date+",\n")

                    for k, v in commitHour.items():
                        f2.write(str(k)+",,"+str(v)+","+date+",\n")

                    print(truncatedCommitDate)
                    # from date a to date b,if no commits commited during this perious,for the smoothness of visualization,using existing data to fill the gap
                    while(str(nextDay(date)) != truncatedCommitDate):
                        date = nextDay(date)

                        for elem in commitsSortedInQuantityOrder:
                            # Name,Type,Value,Date
                            fo.write(str(elem[0]).replace(
                                ",", " ")+",,"+str(elem[1])+","+date+",\n")

                        for k, v in commitHour.items():
                            f2.write(str(k)+",,"+str(v)+","+date+",\n")
                    # print("Finish reading the commits committed on that date : " + date)
                    date = truncatedCommitDate
            if(len(commitsPerAuthor) == 0):
                commitsPerAuthor[getAuthorName] = 1
            else:
                if(getAuthorName in commitsPerAuthor):
                    commitsPerAuthor[getAuthorName] = commitsPerAuthor.get(
                        getAuthorName)+1
                else:
                    commitsPerAuthor[getAuthorName] = 1

            if(len(commitHour) == 0):
                commitHour[truncatedCommitHour] = 1
            else:
                if(truncatedCommitHour in commitHour):
                    commitHour[truncatedCommitHour] = commitHour.get(
                        truncatedCommitHour)+1
                else:
                    commitHour[truncatedCommitHour] = 1

                # NextDay = getCommitDate[0:10]
                # print(getAuthorName)
        maxPageNumber = maxPageNumber-1
        # Flush the remaining entryies in the commitsPerAuthor
    commitsSortedInQuantityOrder = sorted(
        commitsPerAuthor.items(), reverse=True, key=lambda x:  x[1])
    for elem in commitsSortedInQuantityOrder:
        fo.write(str(elem[0]).replace(",", " ") +
                 ",,"+str(elem[1])+","+date+",\n")
    for k, v in commitHour.items():
        f2.write(str(k)+",,"+str(v)+","+date+"\n")
    print("The total number of commits is", commitNumber)


def previousDay(date):
    year = int(date.split('-')[0])
    month = int(date.split('-')[1])
    day = int(date.split('-')[2])
    nextDay = str((datetime.datetime(year, month, day)-datetime.timedelta(1)))
    return nextDay[0:10]


def nextDay(date):
    year = int(date.split('-')[0])
    month = int(date.split('-')[1])
    day = int(date.split('-')[2])
    nextDay = str((datetime.datetime(year, month, day)+datetime.timedelta(1)))
    return nextDay[0:10]


repoOwner = input("Pls input the owner name of the repo : ")
repoName = input("Pls input the name of repo : ")
retrieveAll = input(
    "Enter 1 to retrieve all the commits ,otherwise retrieve a given range : ")
if(retrieveAll == str(1)):
    url = "https://api.github.com/repos/" + \
        repoOwner+"/"+repoName + "/commits?"+"&per_page=100"
else:
    since = input(
        "Input the date the program starts to collect (format : yyyy-mm-dd) : ")
    until = input(
        "Input the date the program ceases collection (format : yyyy-mm-dd) : ")
    url = "https://api.github.com/repos/" + \
        repoOwner+"/"+repoName + "/commits?"  \
        "since="+since + "&" + "until="+until+"&per_page=100"


if(not os.path.exists(repoOwner+'/'+repoName)):
    os.makedirs(repoOwner+'/'+repoName)
# tokenP1 = "695193244278396"
# tokenP2 = "dc5a04427f083a0a3a1420e87"
headers = {
    "Accept": "application/vnd.github.cloak-preview",
    "Authorization": "token 513bdfd44756a1f583fec45471753e1709540754"
}


# get the number of requests needed to make to get all the data
# link = str(headers["link"])
# matchObject = re.search(r'\d+>; rel="last"', link)
# maxPageNumber = re.search(r'\d+', str(matchObject.group(0)))
print("Retrieve the number of pages of commits is " +
      str(readPageNumber(url, headers)))
readCommits(url, headers, readPageNumber(url, headers))
print("Finished")
