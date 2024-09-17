import random #la libreria random para generar carcteres al azar
import re
import itertools

print("dame un codigo de numero de 4 diigitos : ")
code = input()
print("tu clave es= ")
print(code)

while True:
    num = "0123456789"
    base = num  
    longitude = 4
    for _ in range(10):
        muestra = random.sample(base, longitude) # "SAMPLE significa muestra"
        password ="".join(muestra) #"JOIN para concatenar los caracteres de minus"
        print(password)

        if password == code:
            print("I WINE")
        else:
            print("I LOSE")


