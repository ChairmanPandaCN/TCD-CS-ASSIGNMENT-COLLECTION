Write a program which takes a date in day/month/year format (e.g. 25/11/2015) from the user and, if the date is valid, then it presents the date in, for example, “Wednesday, 25th November 2015” format.

 

You must write and make use of at least the following functions:

numberEnding() which takes a day number returns “th”, “st”, “nd” or “rd”.
monthName() which takes a month number (1-12) and return “January”, or “February”, …
dayOfTheWeek() which takes a day, month and year and returns “Monday”, or “Tuesday”, …
The day of the week function should use the Gaussian algorithm…

w = (day + floor(2.6 * (((month + 9) % 12) + 1) - 0.2) + y + floor(y/4) + floor(c/4) - 2c) mod 7

where

 Y: year-1 for January or February,

  year for the rest of the year

 y: last 2 digits of Y

 c: first 2 digits of Y

 w: day of week (0=Sunday,..6=Saturday)

  mod 7 needs to return a positive number (even if the

  passed value is negative.

NOTE:  You may incorporate functions from code provided to you within this course but must give appropriate credit.

Just before you submit your program you need to do a self-assessment exercise to evaluate how well you did... 

Copy the multi line comment below and put it at the top of your program. Put in a mark and a comment for each criterion (even if you have given yourself full marks, otherwise one mark will be deducted per criterion that is missing this information).  

/* SELF ASSESSMENT

 1. Did I use appropriate, easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE?

        Mark out of 5:  

 2. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?

        Mark out of 5:  

 3. Did I indent the code appropriately?

        Mark out of 5: 

 4. Did I define the required function correctly (names, parameters & return type) and invoke them correctly?

       Mark out of 20:  

 5. Did I implement the dayOfTheWeek function correctly and in a manner that can be understood?

       Mark out of 20:  

 6. Did I implement the other functions correctly, giving credit for any code that you take from elsewhere?

       Mark out of 20:  

 7. Did I obtain (and process) the input from the user in the correct format (dd/mm/yyyy), and deal with any invalid input properly?       Mark out of 10:

 8. Does the program produce the output in the correct format (e.g. Monday, 25th December 2017)?

       Mark out of 10:  

 9. How well did I complete this self-assessment?

        Mark out of 5:

 Total Mark out of 100 (Add all the previous marks):

*/ 
