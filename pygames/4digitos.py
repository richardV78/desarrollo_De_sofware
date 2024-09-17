# este ejercicio sera para generar contraseñas seguras 
#https://nodd3r.com/blog/top-12-ideas-proyectos-de-python-para-principiantes
# link para lo ejercicios pendientes 
import random #la libreria random para generar carcteres al azar
import re
import itertools
def generador ():
    num = "0123456789"
    base = num  
    longitude = 4
    for _ in range(10):
        muestra = random.sample(base, longitude) # "SAMPLE significa muestra"
        password ="".join(muestra) #"JOIN para concatenar los caracteres de minus"
        print(password)
    return
def main():
    print("Hola, este programa es para decifrar tu contraseña")
    print("ingresa una clave que quieres que decifre ")

    generador_code = generador()
    print("Contraseña generada:", generador_code)

    clave = 0 
    while  True:
        clave = input("Ingrese una clave de 4 dígitos: ")
        if clave.isdigit() and len(clave) == 4:
            if clave == generador_code:
                print("! Hemos decifrado tu clave de 4 dígitos")
                break
            else:
                print(" ! ERROR ")
        else:
            print("La clave debe tener 4 dígitos")