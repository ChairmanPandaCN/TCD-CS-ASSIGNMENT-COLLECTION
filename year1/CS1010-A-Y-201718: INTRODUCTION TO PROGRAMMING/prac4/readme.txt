Write a program which takes keeps taking in numbers from a user on the command line until the user enters "quit" or "exit".  The user should be allowed to enter only one number each time and the system should compute the average and variance of all numbers entered so far each time.  To do this WITHOUT storing all the numbers we must use formulas which allow to compute the average and variance based only on the previous values (of the average and variance) together with the latest number entered.

AVERAGEN = AVERAGEN-1 + (NUMBERN - AVERAGEN-1) / N

VARIANCEN = ((VARIANCEN-1 * (N-1)) + (NUMBERN - AVERAGEN-1) * (NUMBERN - AVERAGEN)) / N

Example interaction:


This program computes the average and variance of all numbers entered.

Enter a number (or type 'exit'): 1

So far the average is 1.0 and the variance is 0.0

Enter another number (or type 'exit'): 2

So far the average is 1.5 and the variance is 0.25

Enter another number (or type 'exit'): 3

So far the average is 2.0 and the variance is 0.6666666666666666

Enter another number (or type 'exit'): 10

So far the average is 4.0 and the variance is 12.5

Enter another number (or type 'exit'): 5

So far the average is 4.2 and the variance is 10.16

Enter another number (or type 'exit'): exit

Goodbye.

Just before you submit your program you need to do a self-assessment exercise to evaluate how well you did... 
Copy the multi line comment below and put it at the top of your program. Put in a mark and a comment for each criterion (even if you have given yourself full marks, otherwise one mark will be deducted per criterion that is missing this information). 
/* SELF ASSESSMENT 
   1. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10: 
   2. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 5: 
   3. Did I indent the code appropriately? 
       Mark out of 10: 
   4. Did I input the numbers one at a time from the command line?
       Mark out of 10:  
   5. Did I check the input to ensure that invalid input was handled appropriately?
       Mark out of 10:  
   6. Did I use an appropriate while or do-while loop to allow the user to enter numbers until they entered exit/quit?
       Mark out of 20:  
   7. Did I implement the loop body correctly so that the average and variance were updated and output appropriately?
       Mark out of 30:  
   8. How well did I complete this self-assessment? 
       Mark out of 5: 
   Total Mark out of 100 (Add all the previous marks): 
*/

 
