# este ejercicio sera para generar contraseñas seguras 
#https://nodd3r.com/blog/top-12-ideas-proyectos-de-python-para-principiantes
# link para lo ejercicios pendientes 
import random #la libreria random para generar carcteres al azar

print("Hola, este es tu generador de contraseñas :)")

minus = "abcdefghijklmnopqrstuvwxyz"
mayus = minus.upper() # "UPER para pasar a mayuscula la variable anterior"
num = "0123456789"
caracter = "@*-_?¿#/"
base = minus + mayus + num + caracter
longitude = 12
for _ in range (10):
    muestra = random.sample(base, longitude) # "SAMPLE significa muestra"
    password ="".join(muestra) #"JOIN para concatenar los caracteres de minus"
    print(password)

