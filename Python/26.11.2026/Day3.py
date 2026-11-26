# 3.Types of Operators
"""
Operator - Special symbols or keywords used to perform operations on variables and values
"""
"""
Types:
    1. Arithmetic -> +,-,*,/,//,%,**
    2. Comparison -> ==,!=,<,>,<=,>=
    3. Assignment -> =,+=,-=,*=,/=,//=,%=,**=
    4. Logical -> and,or,not
    5. Membership -> in, not in
    6. Identity -> is, is not
    7. Bitwise ->&,|,^,~,<<,>>
"""
#1. Arithmetic Operators
"""
a,b = int(input("Enter a: ")),int(input("Enter b: "))
print("Addition:",a+b)
print("Subtraction:",a-b if a > b else b-a)
print("Multiplication:",a*b)
print("Division:",a/b)
print("Floor:",a//b)
print("Modulus:",a%b)
print("Expo:",a**b)
"""

#2. Comparison Operator
a,b = 10,12
print(a==b)
print(a!=b)
print(a<b)
print(a<=b)
print(a>b)
print(a>=b)