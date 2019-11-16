import requests
import re
import datetime

# Problem :
# Cant read commits which were commited on the date when a contributor made the last commit to the project.Since there is no date to compare with  [solved]

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
    fo.write("name,type,value,date\n")
    f1 = open("wrongData.csv","w",encoding='utf-8')
    f1.write("name,date\n")
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
                    # Name,Type,Value,Date
                    fo.write(str(elem[0]).replace(",", " ") +
                             ",,"+str(elem[1])+","+date+",\n")

                print(truncatedCommitDate)

                while(str(nextDay(date)) != truncatedCommitDate):
                    if(datetime.datetime(int(date[0:4]), int(date[5:7]), int(date[8:10])) > datetime.datetime(int(truncatedCommitDate[0:4]), int(truncatedCommitDate[5:7]), int(truncatedCommitDate[8:10]))):
                        # The date of a commit is determined by the time it was been pushed onto the github
                        # In the perfect scenario,when Chronologically iterating all the commits in the repo,the date of each commit is either the same date as the previous commit or a/multiple day(s) later than the previous date.
                        # Unfortunately, sometimes it happens for whatever reason,the date of a commit is one day earlier than the previous commit.In this case, write the commit into the alternative file.
                        f1.write(getAuthorName+","+truncatedCommitDate+"\n")
                        break
                    date = nextDay(date)
                    print(date)
                    for elem in listofTuples:
                        # Name,Type,Value,Date
                        fo.write(str(elem[0]).replace(
                            ",", " ")+",,"+str(elem[1])+","+date+",\n")
                    print(date)
                #print("Finish reading the commits committed on that date : " + date)

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
        # Flush the remaining entryies in the dict
    listofTuples = sorted(
        dict.items(), reverse=True, key=lambda x:  x[1])
    for elem in listofTuples:
        fo.write(str(elem[0])+",,"+str(elem[1])+","+date+",\n")
    dict.clear()
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

#tokenP1 = "695193244278396"
#tokenP2 = "dc5a04427f083a0a3a1420e87"
headers = {
    "Accept": "application/vnd.github.cloak-preview",
    "Authorization": "token bed03ec70a8dfe3e193ffea9edc3e8033da6cf22"
}


# get the number of requests needed to make to get all the data
# link = str(headers["link"])
# matchObject = re.search(r'\d+>; rel="last"', link)
# maxPageNumber = re.search(r'\d+', str(matchObject.group(0)))
print("Retrieve the number of pages of commits is " +
      str(readPageNumber(url, headers)))
readCommits(url, headers, readPageNumber(url, headers))
print("Finished")
