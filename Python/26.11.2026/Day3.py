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
a,b = int(input("Enter a: ")),int(input("Enter b: "))
c = a + b
print("Addition:",c)
c = a - b
print("Subtraction:",c)
c = a * b
print("Multiplication:",c)
c = a / b
print("Division:",c)
c = a // b
print("Floor:",c)
c = a % b
print("Modulus:",c)
c = a ** b
print("Expo:",c)