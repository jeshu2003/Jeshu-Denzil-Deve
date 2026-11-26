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
"""
a,b = 10,12
print(a==b)
print(a!=b)
print(a<b)
print(a<=b)
print(a>b)
print(a>=b)
"""

#1. Username and password
"""
user_name = input("Username: ")
password = input("Password: ")
if (user_name == "Jeshu" and password == "2003"):
    print("Login Success")
else:
    print("Check your credentials")
"""

#2.Check voter id
"""
age = 16
voter_id = True
if(age >= 18 or voter_id == True):
    print("Eligible to vote")
else:
    print("Not Eligible")
"""

#3.Discount Calculation
#Note - bool(input()) -> value - True, empty - False
"""
amount = int(input("Enter the amount "))
coupon = input("Do you have the coupon? ")
if (amount >= 5000 and coupon == "Yes"):
    discount = 0.05 * amount
    total = amount - discount
    print("Discounted Price:",total)
elif (amount >= 4000 and coupon == "Yes"):
    discount = 0.04 * amount
    total = amount - discount
    print("Discounted Price:",total)
elif (amount >= 3000 and coupon == "Yes"):
    discount = 0.03 * amount
    total = amount - discount
    print("Discounted Price:",total)
else:
    print("No discounts")
"""
#4.Greatest of three numbers
"""
a,b,c = input("Enter a,b,c: ").split()
a,b,c = int(a),int(b),int(c)
if (a>=b and a>=c):
    print("A is greater")
elif (b>a and b>c):
    print("B is greater")
else:
    print("C is greater")
"""

# 3.Assignment Operators
#5. Account balance / credit
"""
acc_bal = 10000
acc_bal += acc_bal
print("total = ",acc_bal)
"""

# 4.Membership Operator
#6. Cart items check
"""
cart = ["mobile","lap","tv","tab","head_set","watch"]
print("mobile" in cart)
print("Shoes" not in cart)
"""

# 5. Identity Operator
"""
a = 15
b = 25
c = a
print(a is b)
print(a is not b)
print(a is c)
print(c is not a)
"""

# 6.Bitwise Operator

print(bin(5),bin(3),5&3,bin(5&3))
print(bin(5),bin(3),5|3,bin(5|3))
print(bin(5),bin(3),5^3,bin(5^3))
print(bin(5),~5,bin(~5))
print(bin(5),5<<1,bin(5<<1))
print(bin(5),5>>1,bin(5>>1))