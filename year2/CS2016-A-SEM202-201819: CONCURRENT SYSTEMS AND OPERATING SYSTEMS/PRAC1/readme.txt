The object of this simple practical, worth 2%, is to get familiar with using Linux, to the point of being able to compile and run a pthread-based program.

Download the "HelloWorld with bad global variable usage " sample program(a.k.a. sumofhellos.c) from Blackboard.
Modify line 6 (#define USERNAME "username") to replace username with your TCD username
Compile the code - warnings are OK, but there should be no errors:
cc -o sum sumofhellocs.c -pthread
Run the executable (your username should appear seven times, as well as some multiple of 10 at the end):
./sum
Obtain a log of the compilation and running of the program by selecting it from your terminal window, copying it, and pasting in a text file called practical1.log.
Bundle both your source code and logfile into a "tar" archive
tar -r -f P1.tar sumofhellos.c practical1.log
This will create a file called P1.tar.
Submit file P1.tar through Blackboard by the deadline.
See also  "Using Unix" in the Practicals content area.
