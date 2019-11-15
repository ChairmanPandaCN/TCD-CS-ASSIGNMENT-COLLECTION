import requests
import getpass
import re
import datetime










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

tokenP1 = "695193244278396"
tokenP2 = "dc5a04427f083a0a3a1420e87"
headers = {
    "Accept": "application/vnd.github.cloak-preview",
    "Authorization": "token "+tokenP1+tokenP2
}