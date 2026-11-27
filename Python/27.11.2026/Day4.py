# 4. Control Statements

# What are control / conditional statements?
'''Statements or instructions given to a program
to work based on condition'''

# What is Looping?
'''Looping works repeatedly until the 
condition(s) is/are satisfied.'''

#What is jumping statements?
'''Jumping statements are used to alter
the flow of execution of a program or an 
application.'''

# 1.Conditional statements
# i)simple if
# 1.positive or negative
"""
num = int(input())
if (num >= 0):
    print("Positive number")
"""
# ii)if...else
# 2.positive or negative
"""
num = int(input())
if (num >= 0):
    print("positive")
else:
    print("negative")
"""

# iii) if .. elif .. else
#3.whether we can go for outing or not
"""
weather_type = input("Enter the type of weather to go for beach:")
if (weather_type == "Sunny"):
    print("We can go for beach")
elif (weather_type == "Cloudy"):
    print("We can go for movies")
else:
    print("There's no plans")
"""

# iv) nested if
# 4.withdraw amount from account or not
"""
pin = int(input("Enter your 4 digit PIN:"))
user_acc_bal = 15000
withdrawl = int(input("Enter the amount"))
if (pin == 1234):
    if (withdrawl < user_acc_bal):
        print("Can be withdrawn")
        balance = user_acc_bal - withdrawl
        print("Balance amount:",balance)
    elif (withdrawl == user_acc_bal):
        print("Cannot be withdrawn")
    else:
        print("Insufficient amount")
else:
    print("Incorrect PIN")
"""

#2.Looping - for, while
# i) for loop
"""
for i in range(1,11):
    print(i,end=" ")
"""
"""
for i in range(2,21,2):
    print(i,end=" ")
""" 
"""
for i in range(1,21,2):
    print(i,end=" ")
"""
"""
l1 = [10,20.2,"Jeshu",'D',True]
for i in l1:
    print(i,end=" ")
"""
# for ... else
"""
l1 = [10,20.2,"Jeshu",'D',True]
for i in l1:
    print(i)
else:
    print("Loop completed")
""" 
"""
l1 = [10,20.2,"Jeshu",'D',True]
for i in range(0,len(l1)):
    print("Loop ",i,l1[i])
else:
    print("Loop completed")
"""
# ii) while
"""
i = 1
while i <= 10:
    print(i,end=" ")
    i += 1 # i = i+1
"""

# 3. Jump statements
#break
"""
for i in range(2,51,2):
    print(i,end=" ")
    if i == 30:
        break
"""
#continue
"""
for i in range(2,51,2):
    print(i,end=" ")
    if i == 20:
        continue
"""

#5.Pin number access attempts
"""
attempts = 1
while attempts <= 3:
    pin_no = int(input("Enter 4 digit PIN: "))
    if pin_no != 1253:
        attempts += 1
        print("Wrong PIN, Try Again")
    else:
        print("Access Granted")
        break
else:
    print("Maximum attempts reached")
"""

#Pattern printing
#6.Right angle triangle
"""
n = int(input())
for i in range(1,n): #row
    for j in range(1,i+1): #column
        print("*",end="")
    print()
"""
#7.Inverted right angle triangle 
"""
n = int(input())
for i in range(n,0,-1):
    for j in range(i):
        print("*",end="")
    print()
"""

#8.Pyramid
"""
n = int(input())
for i in range(1,n+1):
    for j in range(n-i):
        print(" ",end="")
    for k in range(2*i-1):
        print("*",end="")
    print()
"""

#9.Inverted Pyramid
"""
n = int(input())
for i in range(n,0,-1):
    for j in range(n-i):
        print(" ",end="")
    for k in range(2*i-1):
        print("*",end="")
    print()
"""