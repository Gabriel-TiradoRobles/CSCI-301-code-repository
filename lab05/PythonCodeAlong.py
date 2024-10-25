#!/usr/bin/env python3

'''
Python tutorial file

Author: M. J. O'Neill

Purpose: Provide a quick introduction to Python for the professional that may be
required to maintain inherited code

Download: Not needed for Ubuntu

Official Reference Site: https://www.python.org/

Created by: Invented by Guido van Rossum in late 1980’s and released in 1991. 
The Python language was named after Monty Python’s Flying Circus, not the snake


Philosophy: "There should be one-- and preferably only one --obvious way to do it." The Zen of Python - https://www.python.org/dev/peps/pep-0020/


Programming Aids:
Interpreter available
IDE: IDLE (Built-in), many third-party IDEs available

No directives (like Set strict on) available

Try-except-finally structure available
source: https://docs.python.org/3/reference/compound_stmts.html#grammar-token-python-grammar-try_stmt


   

Getting started
    - Comments: # - single line, Triple single quotes - multiline 
    - Grouping code
'''

#-----Output  #outputs to console (Run in interpreter mode (python3) for demo)
'''

#print "Hello World" # Python 2 syntax - will cause error
print("Hello World") #does not error



#-----Input (note syntax of assigning variable)
print(f'What is your name?')
myName = input()
print(f'Hello, {myName}')

exit() #don't forget the parenthesis!

'''
#-----Variables

# every variable is an object with at least three properties: value, type, and id)
# Four “primitive” types - Integers, Float, Strings, Boolean
'''
print("42 as a number:\n")
theAnswer = 42
print(theAnswer)
print(type(theAnswer))
print(id(theAnswer))
print(theAnswer + theAnswer)
print("\n")

#--duck typing
print("\n42 as a string:\n\n")
theAnswer = "42"
print(theAnswer)
print(type(theAnswer))
print(theAnswer + theAnswer)
print("\n\n")
'''
#-----Boolean
'''
print(True)
print(type(True))
print(False)
print(type(False))
#print(true)  #throws error - don't forget to capitalize
#print(false) #throws error - don't forget to capitalize


#-----logical operations (note use of string concatenation and expression evaluation)
print("True and True: "+str(True and True)+"\n")
print("True and False: "+str(True and False)+"\n")
print("True or True: "+str(True or True)+"\n")
print("True or False: "+str(True or False)+"\n")
print("\n\n")

'''
#Ternary Operator (AKA immediate IF) 
# source https://www.journaldev.com/17225/python-ternary-operator#:~:text=Python%20ternary%20operator%201%20Python%20ternary%20operator%20was,that%20creates%20a%20ternary%20statement%20or%20conditional%20expression.
#example is adapted from this page
'''
is_fast = True
print("The car is a "+ ("Ferrari" if is_fast else "Sedan"))

#regular if statememt
is_fast = False
if is_fast:
    car = "Ferrari"
else:
    car = "Sedan"
print("The car is a "+ car)

'''
#truthiness and falsiness
'''
print(bool(0)) # 0 is considered False
print(bool(30)) # non-zero is considered True
print(bool(-30)) # non-zero is considered True
print(bool("The Truth")) #non-empty string is considered True
print(bool(""))#empty string is condidered False
print(bool("Pigs fly")) #non-empty string is considered True (whether the statement is true or not)

'''
#String Manipulation

#double quotes  
#source: https://www.w3schools.com/python/python_strings.asp

#double quotes vs single quotes


#--------------------------------------------Part 2--------------------------------------------------------#

#regular expressions
#source: https://docs.python.org/3.8/library/re.html
#online tester:  https://pythex.org/
#tutorial: https://www.w3schools.com/python/python_regex.asp


# Let's see how well regular expressions translate!
import re
filein = open( "Wordle.txt")
Lines = filein.readlines()  
#This pattern was copied from the BASH GREP exercise
#pattern = r"[e][^adiuvenmpch][o][^adieuvnomch][^adiuvnmch]"
pattern = r"[e][^adiuvenmpch][o][^adieuvnomch][^adiuvnmch]"
for line in Lines:                                                       #(K)
    result = re.findall(pattern, line, re.IGNORECASE) 
    if result:
    	print(line)                                          #(N)
filein.close()                                         #(N)


#Read/write text file
# source: https://docs.python.org/3.8/library/functions.html?highlight=open#open
# source: https://docs.python.org/3.8/library/io.html?highlight=readlines%20method#io.IOBase.readlines



#"Alpha and Omega" 
import re
filein = open( "KJV.txt")
Lines = filein.readlines()  
pattern = r"Alpha and Omega"
for line in Lines:                                                       #(K)
    result = re.findall(pattern, line, re.IGNORECASE) 
    if result:
    	print(line)                                          #(N)
filein.close()

# functions (not really called procedures)
#source: (built-in) https://docs.python.org/3/library/functions.html
# (user defined) https://docs.python.org/3/tutorial/controlflow.html#defining-functions



#decision and iteration structures are called compound statements
#source: https://docs.python.org/3/reference/compound_stmts.html

#decision structures

#if
#source: https://docs.python.org/3/reference/compound_stmts.html#grammar-token-python-grammar-if_stmt



#iterations 

#While
#source: https://docs.python.org/3/reference/compound_stmts.html#grammar-token-python-grammar-while_stmt

#for
#source: https://docs.python.org/3/reference/compound_stmts.html#grammar-token-python-grammar-for_stmt


#misc 
#with is commonly used to make sure files are closed 
#try-catch block
#source: https://docs.python.org/3/reference/compound_stmts.html#grammar-token-python-grammar-try_stmt

#match is new with Python 3.10
#source: https://docs.python.org/3/reference/compound_stmts.html#grammar-token-python-grammar-match_stmt


#complex data structures
#class definitions
#source: https://docs.python.org/3/reference/compound_stmts.html#grammar-token-python-grammar-classdef
#tutorial: https://www.w3schools.com/python/python_classes.asp, https://www.w3schools.com/python/python_inheritance.asp


#gotchas and quirks source:https://inventwithpython.com/beyond/chapter8.html