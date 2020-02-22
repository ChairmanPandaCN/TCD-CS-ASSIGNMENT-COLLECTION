# Exercise 03

Binary Search Trees

## Prerequisite

Haskell `stack` is installed on the machine you are using.

Program `prfchk` has been installed somewhere on your `$PATH` (or `%PATH%` if on Windows).

Keep the `proof-check` and `CSU24016` files seperate
(don't clone one repo inside any part of the other).


## Task

### Part 1 - Coding (25 marks)

1. Open a command-line window and navigate to CSU34016-1920/Exercise03
2. Enter `stack test`.
3. The tests fail: read the test outcome carefully.
4. Your task is to edit `src/Ex03.hs` to:
  1. Change the first line to contain your name and TCD username
  2. Get all the tests to pass.
  3. Check your changes by running `stack test` again.
5. To submit, see below.

### Part 2 - Proving (15 marks)

1. Open a command-line window and navigate to CSU34016-1920/Exercise03
2. Enter `prfchk Ex03`.
3. The check fails
4. Your task is to edit `data/Ex03.thr` to:
  1. get `prfchk` to report `OK` or `Ok` for all proof steps, with no error `!!` or `??` indications.
     - each `OK` is worth 3 marks
     - each `!!` loses 4 marks
     - each `Ok` is worth 1 mark
     - each `??` loses 1 mark
      
  3. Check your changes by running `prfchk Ex03.thr` again.
5. To submit, see below.

### Submission

Submit both `Ex03.hs` and `Ex03.thr` together.
**Not** inside their `src` and `data` folders,
and **not** in any kind of archive/zip/tar file.

