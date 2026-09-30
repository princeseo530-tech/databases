# , seprated 20 number dalna hai   dalna k  bad print even numbers and odd numbers .

"""numbers = list(map(int, input("Enter 20 numbers: ").split()))

odd = []
even = []

for n in numbers:
    if n % 2 == 0:
        even.append(n)
    else:
        odd.append(n)

print("Even numbers:", even)
print("Odd numbers:", odd)"""

#
try:
    number = int(input("Enter your number: "))

    if number % 2 == 0:
        print("The number is Even")
    else:
         print("The number is odd")

except ValueError:
    print ("invalid input")



