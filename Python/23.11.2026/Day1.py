"""
What is Python?    
    -> high-level,general purpose programming language
    -> famous for readable syntax and broad range of applications
    -> easy for all - from beginner programmer to expert
    
Script mode: file can be saved and output can be viewed in shell mode
Shell mode: program can be written and ran in shell itself
"""

#1. Display your name
print("Jeshu Denzil Deve")

# Variable - named locations used to store data
# 2. Store data in variables for different data type
user_id = 10
name1 = "Jeshu Denzil Deve"
print("User_ID = ",user_id)
print("Name = ",name1)

#Syntax: variable = value/data
#3.Assign Product,Price,Quantity
product = "Laptop"
price = 35000
Quantity = 5
Total = price * Quantity
print(product,price,Quantity,Total)
print("Product = ",product)
print("Price = ",price)
print("Quantity = ",Quantity)
print("Total = ",Total)

"""
1.Starts with Letters or underscores
2.Cannot start with numbers
3.Can contain letters, underscores, digits
4.No space allowed
5.Names are case sensitive
"""

#Multiple values assign
name2,age,city = "Jeshu",23,"Chennai"
print(name2)
print(age)
print(city)

"""
Data Types:
int - numbers
float - decimals
str - string(sentence,words)
char - single character
bool - True or False
"""

#Data Types
roll_no = 1
name = "Sathish"
salary = 45000.255
is_working = True
print(roll_no)
print(name)
print(salary)
print(is_working)

#type(var) - to show the type of data
print(type(roll_no))
print(type(name))
print(type(salary))
print(type(is_working))

a , b = 10 , 20
c = a + b
print(c)