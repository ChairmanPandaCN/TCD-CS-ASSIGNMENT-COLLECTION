Condition Variables and Mutexes

This practical is worth 6% of your year-end mark. It is due at the start of Week 6 and part of the marking will take place in Labs in Week 6 and Week 8. It is an exercise in using condition variables and mutexes in a producer/consumer system. 

1. A single producer thread will continuously update a single global variable with a sequence of different non-zero integer values. It will signal completion by setting that global variable to zero. Once set to zero, its value will remain zero.

2. In between each producer update, if the current global variable satisfies a specific predicate (see below) then a consumer thread will read that value and add it into a global variable dedicated for its own use. It will also terminate when the global variable set by the producer has become zero.

When both produce and consumer threads are done, the value of the consumer global variable will be output.

You are given three files:

cond.c - this provides three different functions that compute a condition on their integer input (DO NOT CHANGE)
1to20.txt - this contains numbers from 1 to 20 followed by a zero. It is a convenient way to get data into the main program
practical2.c - the main program. It accepts a stream of integers separated by white space on standard input, and an optional command line argument that specifies which of the condition functions in cond.c should be used (cond1() is the default).
To compile, use cc -o P2 practical2.c -pthread

To run with the default condition: ./P2 < 1to20.txt

To run with  condition cond2():     ./P2 2 < 1to20.txt

To run with condition cond3():       ./P2 3 < 1to20.txt

The program as given launches both a producer and consumer thread, but they use no form of mutual exclusion. Your task is to use mutexes and condition variables to ensure the right answer is produced.

You will need to declare extra global variables, and modify the program mainline, as well as produceT, Produce, consumeT and Consume.

Hint: in Produce and Consume the only modifications required are after the printing of the line starting with "EXIT-".

To submit, just upload your modified practical2.c file (no zip/tar/gzip/log files required).
