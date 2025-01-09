from flask import Flask, jsonify
from flask_cors import CORS  # Aggiungi questa importazione
import mysql.connector

app = Flask(__name__)
CORS(app)  # Abilita CORS per tutte le rotte

def get_db_connection():
    return mysql.connector.connect(
        host="db",
        user="root",
        password="rootpassword",
        database="isyrent_db"
    )
# test app.py
# test branch 
@app.route("/mezzo", methods=["GET"])
def get_users():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT modello,costo,tipo_mezzo FROM mezzo")
        users = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify(users)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
