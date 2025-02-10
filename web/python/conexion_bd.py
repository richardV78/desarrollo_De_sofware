import pyodbc

# Configuración de conexión
server = 'DESKTOP-J10UE5V'  # Reemplaza con el nombre o IP del servidor (ej., localhost o 127.0.0.1)
database = 'DATA_BASE_WEB_PORTAL_INSCRPTION'  # Nombre de la base de datos
username = ''  # Usuario del servidor SQL
password = ''  # Contraseña del servidor SQL

# Crear la conexión
try:
    conexion = pyodbc.connect(
        f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
    )
    print("Conexión exitosa a la base de datos.")

    # Crear un cursor para ejecutar consultas
    cursor = conexion.cursor()

    # Ejemplo de consulta: Obtener todos los estudiantes
    consulta = "SELECT * FROM Estudiantes"
    cursor.execute(consulta)

    # Obtener y mostrar los resultados
    for fila in cursor.fetchall():
        print(fila)

    # Cerrar el cursor y la conexión
    cursor.close()
    conexion.close()

except pyodbc.Error as error:
    print("Error al conectar a la base de datos:", error)
