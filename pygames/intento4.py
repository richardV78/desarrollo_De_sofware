
import random

# Pedimos al usuario que ingrese un número de 4 dígitos
numero_usuario = int(input("Ingresa un número de 4 dígitos: "))

# Verificamos que el número tenga 4 dígitos
while len(str(numero_usuario)) != 4:
    print("Por favor, ingresa un número válido de 4 dígitos.")
    numero_usuario = int(input("Ingresa un número de 4 dígitos: "))

# Inicializamos el número generado
numero_generado = None
intentos = 0

# Iniciamos un ciclo hasta que se genere el mismo número
while numero_generado != numero_usuario:
    numero_generado = random.randint(1000, 9999)
    intentos += 1
    print(f"Número generado: {numero_generado} {intentos}")

print(f"¡Se ha encontrado el número! {numero_usuario} en {intentos} intentos.")
