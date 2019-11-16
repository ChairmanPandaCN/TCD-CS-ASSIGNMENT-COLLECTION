# CSU33012-Social-Graph

## Credit
This Project invokes a Dynamic Ranking Visualization tool developed by Jannchie.[Dynamic Ranking Visualization](https://github.com/Jannchie/Historical-ranking-data-visualization-based-on-d3.js/blob/master/readme-en.md)

## Explanation
1. There are 2 graphs shown in this project.Both are Dynamic Ranking Visualization graphs.
2. Even though the number of commits by one doesnt represents his/her contribution and significance to the project,it still demonstrates that one has continually devoted himself into this project.We can find who does such a thing by the first graphs
3. The second graphs shows the active time of the people who work on this project.
For example, people who work on the 996.ICU project are owls,since the number of commits committed at 1am and 2am takes account 1/6 of the total commits number
## Prerequisite 
1. A GitHub authorization token is needed,place the token in the header after the "token" , leave a space between them
2. A Python intepreter is needed

## How this project works    
1. type 'python retrieveCommits.py' in the bash.This file automatically pulls relative date. 
2. Enter the repo owner name 
3. Enter the repo name 
4. Enter 1 to retrieve all the commits ,otherwise retrieve a given range 
5. Specify the starting date of the repo you want to measure from,in the format of yyyy-mm-dd
6. Specify the end date of the measurement in the format yyyy-mm-dd
7. Simple wait until the console pops up "Finished" in the bash. The waiting time depends on the number of commits committed within the given period.It took me 1 hour to get all the commits of the torvalds/linux project from the github.
8.  This program generates a year.csv file and stores all the collected data associate with that year into it.Each row in this file represents the number of commits committed by that date in the name of the author
9.  This program generates a pushedOnGitHub.csv file.Each row in this file represents the number of commits pushed onto the github in the associated hour by that date.
10. Open the "bargraph.html" with your browser
11. Upload the generated "year.csv" file or "pushedOnGitHub.csv" file
12. Finish watching the bar char show  

## Showcase
1. Some files named after the repoOwnerName/repoName have some test data.
2. All the commits are divided into different years,but the continuity of the data exists in those files.
3. Open the "bargraph.html" in your browser
4.  Upload the generated "year.csv" file or "pushedOnGitHub.csv" file
5.  Finish watching the bar char show  