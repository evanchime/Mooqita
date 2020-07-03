Linux challenge - beginner

NOTE: Be careful with this exercise! If you do this wrong you might fill up your disk. Read the instructions to the end before you do anything.

Before starting this exercise let's define the terms: * Whenever there is room for interpretation, make a decision and write a comment about what you think can be interpreted in more than one way and how you decide to interpret the question. * In every step let your reviewer know what your thought process is and why you did something this way. * You can directly upload your solution here or upload it to github and post the link to github as your solution. * Each step described below is meant to separate the thought process, you don't need to have a single solution file for each step. You can comment inside the code file(s), use a separate text file, or explain everything in the solution here. * The following challenge can be done with one script only. If you want to use multiple scripts explain why. * Counting lines in a file refers to the output of "wc -l".

Write a script using /bin/bash that does the following:

    1) Create a series of random numbers and strings of characters and write them to a file, no more than 15 characters for each line. As characters assume the Latin Alphabet, [A-Za-z], without special characters and the numbers 0,1,2,3,4,5,6,7,8,9. Example of a line with 15 characters: 123456789aBcDeF Explain the process how you create the lines in your file.
    2) Control the size of the file. If the file reaches the size of 1 MiB interrupt the creation of more random lines. What is a good way to control the size of a file? Discuss what options you know and why you picked one of them. Come up with two ways in Linux to find the size of a file. This step is there to protect you from filling up your disk. You should write your script in a way that it terminates when reaching a certain size.
    3) Now sort the file. Select a sorting style. Which one did you use? Why? What is the most common command in Linux to sort a file and what happens when you use the default option, i.e. using no specific sorting option?
    4) Remove all lines that start with an “a”, no matter if it is in uppercase or lowercase. Safe the result into a new file. Use regular expressions to do this.
    5) How many lines were removed?

Make sure to make all files available, the script(s) and the resulting two files with the random characters, and in case you have a text file for your explanations, the text file, too. Best practice is a link to your github repository, but again, you can also upload them here. 
