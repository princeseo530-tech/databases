resource "aws_db_instance" "this" {
  identifier = var.identifier

  engine = "postgres"

  db_name  = var.db_name
  username = var.username
  password = var.password

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage

  storage_encrypted   = true
  skip_final_snapshot = true
}


sudo apt update
sudo apt install python3

after downloading some resourse take bit time

then cmd- sudo apt install python3 -pop
it manages file of python

basis cmds

while using vs code save file as .py so it will recognised as python file

on terminal after going to file location just write its name


for example

python3 first.py  here first.py is file name and fter making chnges in file save it every time 



print ("hello world")

use to print statement

here v can assign values to variables

like 

name = "prince"  string should be in inverted commos intiger value do not req
age = 23

myage = age 

if i will type

print (myage)

then result will be 23 

coz myage = age and age = 23

if i want result in singlee line i will type

print (name,age) 

and run



varible name specification

can be A-Z, a-z, 0-9,_, but name can not start from _, int


DATA TYPE

STRING===  "word,sentence"
INT===1234
FLOAT== 34.56, 67.54
BOOLEAN== true false
NONE


how to check  data type 

print(type(___variable__))


Keywords

and , else, in , return, as, except, is, true, assert, finally, lambda, try, 

break , false, nonlocal, with, class, for, none, while, continue, from, not , 

yield, def, global, or, del, if, pass, elif, import, ralse


python = case sensetive lang == apple, APPLE both are differt these are same in sql



COMMENTS IN PYTHON

JO LINE HUM CHAHE KI PROGRAM NA PDHA

SINGLE LINE COMMENT # USE HOTA HAI


"""
MULTI
LINE
COMMENTS
"""

##########OPERATORS##

ARTHMETICS OPERATORS

+ , -, *, /(divide), %(remender), ** a^b mtlb 5 ** 2 = 25


##########RELATIONAL OPERATORS ans in booolen value##########

== for comparing 2 value equal to each other, != values not equal to other, 

<= greater or equal to other value, < greatyer to other value, >= leass or 

equal to outher value, > less than other value


###################ASSIGNMENT OPERATORS###################

NUM = 2
NUM1 = 6

NUM += 5
print (NUM+ NUM1)

WHEN RUN PROGRM =13

NUM ALLREDY = 2 , += THIS MADE name add more value which we provide also we can use all arthmetic operator with =

example  (+=, -=, *=, /=, **=, %=)


###########LOGICAL OPERATORS#####################

 not, and , or

1.  not true = false
    not false = true

2. (and) compare 2 values and ans true only when both are true otherwise give false

(or) used when if we compare 2 value and one of them is true then it will ans true

print (val1 or val2), 
print (val1 and val2)
	print (not(val1==val2))



#######################INPUT#####################
prograam 1

input ("enter your name")
age= int(input("enter your age"))

print (type(age),age)
-------------------------------------------------------------------

program 2

name = input("enter your name : ")
age = int(input("enter your age :"))
marks = float(input("enter your marks :"))

print ("welcome",name)
print  ("your age =",age)
print ("your marks =",marks)


#######string##########

it is a data type that stores sequence of characters

concatenation

hello + world = helloword  

code

chr1 = "hello"
chr2 = "world"

print (chr1 + chr2)

ans = helloworld  


print (chr1 +" "+ chr2)

= hello world 


####length of string##

len(str)

code 

chr1 = "hello"
chr2 = "world"
print (len(chr1))

=5

######indexing###############

it help to access chharacters

apna collag
012345678910

every charecter have its position

space also have

it start from 0 to so on

and if we want to count from back

it will be -1 -2 -3

##code for indexing#####

str = "hello"
       01234  
print (str[4])

=o

#########slicing##################

accessing part of string

str[starting_idx:ending_idx]# ending idx not included

str "apna collage"

str[1:4] =pna

str[:4]= same as [0:4] ans =   apna

str[1:]same as [1:len(str)] = pna collage



############string functions##########################

1.to find ending word or leter of string 

example 

str ="my name is prince."

print (str.endwith("nce."))

retuns true if matches



2.to make capital first  leter of string

cmd- print (str.capitalize())



3.to replace and word  or value 

print (str.replace("old","new"))



4.to find and value we will get that word or character index value

print (str.find("word"))


5.count how many time a word or letter get repeted

print (str.count("word"))



------------------

max() → highest/largest
min() → lowest/smallest
------------


sallary = int(input("enter you sallary sir/mam"))

if sallary <=10000:
    print ("no tax for you")
elif sallary >=10000 <=20000:
    print ("you have to pay tax =",sallary * 10 / 100)
elif sallary >30000:
    print ("you have to pay tax =",sallary * 20 / 100)
else:
    print ("invalid value error")
