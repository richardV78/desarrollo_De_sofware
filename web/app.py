from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# Configuración de la base de datos
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'tu_contraseña',
    'database': 'DATA_BASE_WEB_PORTAL_INSCRPTION'
}

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    if not username or not password:
        return jsonify({"error": "Nombre de usuario y contraseña son obligatorios"}), 400

    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor(dictionary=True)

        # Verificar las credenciales
        cursor.execute(
            "SELECT * FROM Estudiantes WHERE Nombre = %s AND Contrasena = %s",
            (username, password)
        )
        user = cursor.fetchone()

        if user:
            return jsonify({"username": user["Nombre"]}), 200
        else:
            return jsonify({"error": "Usuario o contraseña incorrectos"}), 401

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals():
            connection.close()

if __name__ == '__main__':
    app.run(debug=True)
