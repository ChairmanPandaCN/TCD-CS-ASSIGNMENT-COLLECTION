#CSU33012-Social-Graph

## Credit
This Project invokes a Dynamic Ranking Visualization tool developed by Jannchie.He takes all the credit for dynamic bar chart.[Dynamic Ranking Visualization](https://github.com/Jannchie/Historical-ranking-data-visualization-based-on-d3.js/blob/master/readme-en.md)


## Requisite 
1. A GitHub authorization token is needed,place the token in the header after the "token" , leave a space between them
2. A Python intepreter is needed

## How this project works    
1. type 'python retrieve.py' in the bash
2. Enter the repo owner name 
3. Enter the repo name 
4. Enter 1 to retrieve all the commits ,otherwise retrieve a given range 
5. Specify the starting date of the repo you want to measure from,in the format of yyyy-mm-dd
6. Specify the end date of the measurement 
7. Simple wait until the console pops up "Finished". The waiting time depends on the number of commits committed within the given period.
8. This program generates a "commits.csv" file and stores all the collected data into it.
9.  Open the "Historical-ranking-data-visualization-based-on-d3.js" file
10. Open the "bargraph.html" with your browser
11. Upload the generated "commits.csv" file
12. Finish watching the bar char show  

## Showcase
1. The "commits.csv" contains around 50000 commits,due to github restrictions on the number of requests a single time
2. Open the "bargraph.html" in your browser
3. Upload the generated "commits.csv" file
4. Finish watching the bar char show
