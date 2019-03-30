 Write a Java program which repeatedly converts (user entered) plain text to cipher text using a substitution cipher (in which plain text letters are randomly assigned to cipher text letters), and then converts it back again (just to be sure that we can decrypt it).  Note that a Substitution Cipher replaces plaintext with cipher-text. The most common substitution ciphers replace single characters of plaintext with predefined single characters of cipher-text (e.g. the plain-text character `a' might be replaced by cipher text character 'q', 'b' might be replaced by 'x', 'c' by 'k' and so on).  Each plain-text character should be replaced by a different cipher-text character.

As part of your solution you must write and use at least the following functions/methods:

(i)    createCipher() which determines and returns the mapping from plain text to cipher text.  Each plain text character ('a' .. 'z', ' ') must be randomly assigned a cipher-text character;

(ii)   an encrypt() method which takes a plain text phrase (as an array of characters) & the cipher and returns an encrypted version of the phrase according to the substitution cipher;

(iii)  a decrypt() which takes an encrypted phrase (as an array of characters) & the cipher mapping and returns a plain text version of the phrase according to the substitution cipher

Hints:

A 27 element 1-D array (26 letters and the space character) can be used for the mapping where each element is the cipher-text character corresponding to a particular letter.

Given a String called myString you can create an array of characters as follows:

o   char[] characterArray = myString.toCharArray();

To convert back to a String:

o  String anotherString = new String( characterArray );

To convert a String to lowercase:

o   String lowercaseString = myString.toLowerCase();

Just before you submit your program you need to do a self-assessment exercise to evaluate how well you did... 

Copy the multi line comment below and put it at the top of your program. Put in a mark and a comment for each criterion (even if you have given yourself full marks, otherwise one mark will be deducted per criterion that is missing this information).  

/* SELF ASSESSMENT

 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?

        Mark out of 5:  

 2. Did I indent the code appropriately?

        Mark out of 5: 

 3. Did I write the createCipher function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20:  

 4. Did I write the encrypt function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20:  

 5. Did I write the decrypt function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20:  

 6. Did I write the main function body correctly (repeatedly obtaining a string and encrypting it and then decrypting the encrypted version)?

       Mark out of 25  

 7. How well did I complete this self-assessment?

        Mark out of 5:

 Total Mark out of 100 (Add all the previous marks):

*/ 
