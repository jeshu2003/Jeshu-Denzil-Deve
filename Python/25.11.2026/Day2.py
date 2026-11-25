# 2. Variables, Datatypes & Typecasting Input / Output
"""
# Integer
a = 10
b = -99
print(a,b)

# Float
c = 87.33
d = -153.20
print(c,d)

# String
s1 = 'single string'
s2 = "double string"
s3 = '''Triple string'''
print(s1,s2,s3)

# Boolean
is_active = True
is_member = False
print(is_active,is_member)

# Collections
# 1.List --> [v1,v2,..,v-n]
#Allows duplicates, can be modified
cart = [1,"Mobile",56000,2,"Laptop",78000,4.7]

# 2.Tuple --> (v1,v2,...,v-n)
# Allows duplicates but can't modify
# Use it for - bank acc,aadhar,and so on for sensitive datas
details = (1,"HDFC","HDFC245",True)

# 3.Set --> {v1,v2,..,v-n}
# No duplicates aren't allowed
nums = {1,2,3,3,4,1,2}
print(nums)

# 4.Dictionary --> {k1:v1,..,k-n:v-n}
d1 = {
    "u_id":1,
    "name":"Jeshu"
}
print(d1) 
"""


# To find the data type
# print(type(cart))

# Type Conversion
# 1. Implicit
"""
a,b = 10,2.5
r1 = a + b
c,d = 20,15
r2 = c - d
e,f = 2.5,2.5
r3 = e * f
g,h = 100.5,101
r4 = g / h
i,j = 249.9,1.0
r5 = i // j
print(r1,type(r1))
print(r2,type(r2))
print(r3,type(r3))
print(r4,type(r4))
print(r5,type(r5))
"""
# 2. Explicit
# int(), float()
"""
n1 = "526"
n2 = int(n1)
n3 = float(n2)
print(n2,type(n2))
print(n3,type(n3))
"""

#str()
"""
ph_no = 8015012051
msg = "My phone no: " + str(ph_no)
print(msg)
"""

#bool()
"""
print(bool(1))
print(bool(0))
print(bool(""))
print(bool("Python"))
"""

# 3. Input() - for string
# name = input("Enter Your Name: ")

# 4. int(input()) - for integers
# marks = int(input("Enter your marks: "))
"""
print("Name is:",name)
print("Marks is: ",marks)
"""
# Activity for today's class
# 1. Get user's data
"""
name = input("What's your name? ")
course = input("Which course are you going to choose? ")
Total_Mark = int(input("What's your total mark out of 600? "))
Average_Mark = float(input("What's your average marks? "))
is_willing = bool(input("Are you willing to learn this course? "))

print("Name:",name)
print("Course:",course)
print("Your Total marks:",Total_Mark)
print("Your Average marks:",Average_Mark)
print("Is he willing to learn this course:",is_willing) 
"""

#Split()
"""
a,b = input("Enter the numbers = ").split()
print(int(a)+int(b))
"""
#2. Add two numbers
"""
n1,n2 = int(input("Enter n1: ")),int(input("Enter n2: "))
print(n1+n2)

n1,n2 = input("Enter n1 and n2: ").split()
print(int(n1)+int(n2))
"""

#3. Swapping without third variable
"""
a , b = 10 , 15
print("Before swap: a,b = ",a,b)
a , b = b , a
print("After swap: a,b = ",a,b)
"""
#4. Swapping with third variable
"""
a , b = 10 , 15
print("Before swap:a,b = ",a,b)
temp = a
a = b 
b = temp 
print("After swap:a,b = ",a,b)
"""

# 5.Check whether a number is positive or negative
"""
user_input = int(input("Enter the number to check postive or negative: "))
if (user_input >= 0):
    print(user_input,"is positive")
else:
    print(user_input,"is negative")
"""

#6. Add / Subtract a positive and a negative number
"""
a,b = input("A positive and a negative ").split()
print("Sum:",int(a)+int(b))
print("Difference:",int(a)-int(b))
"""

#7. Area of circle
"""
r = int(input("Enter the radius: "))
pi = 3.14
area = pi * r * r
print("Radius of the circle:",r)
print("Pi value:",pi)
print("Area of circle:",area)
"""

#8. Get two string and repeat first string 2 times and second string 3 times
"""
s1,s2 = input().split()
print(s1*2,s2*3)
"""