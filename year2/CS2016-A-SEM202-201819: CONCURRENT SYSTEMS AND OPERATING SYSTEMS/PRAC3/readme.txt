Modelling Dining Philosophers

This practical is worth 6% of your year-end mark. It is due at the start of Week 9 and part of the marking will take place in Labs in Week 9 and Week 10. It is an exercise in using SPIN/Promela to model the Dining Philosophers problem.

You are provided with two starter files: dhpil0.pml and check .

You are provided with an initial attempt to model this, in file dphil0.pml. If you run verification checks you will find that it has no deadlocks, but violates two key assertions. These assertions are true as long as only at most one philosopher can be deemed to be holding any given fork at one time. In the model in dphil0.pml, it is possible for two (or more) philosophers to be holding the same fork.

Your tasks are:

1. to create a file dphil.pml, derived from dphil0.pml, that ensures that any given fork can be held by at most one philosopher at any time, so those assertions are never violated. If successful, verification should not report any assertion violations, but it should report that deadlock is possible. Checking the model for progress cycles should also be done.

2. to extend file check to run all the checks required in part 1 above ("standard" and "progress")

3 to create a file dphil_starve.pml, derived from dphil.pml, that has added into it an LTL formula or never claim that checks if starvation can occur. If it does not occur, then when any philosopher is thinking, it should be the case that eventually they will be eating. (Note that the progress verification in step 1 above does not check this property).

Recent versions of SPIN allow LTL formulas to be written directly into PML files - see the link to UsingSPIN.

You should package  dphil.pml, check, and dphil_starve.pml in a tar archive created using:
 
tar -r -f P3.tar dphil.pml check dphil_starve.pml 

You should then upload P3.tar to Blackboard.







COPY THE CODE FROM SOMEBODY'S GITHUB
