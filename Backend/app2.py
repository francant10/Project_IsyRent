from flask import Flask, jsonify, request
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
# test branch 33


@app.route("/filtra_mezzi", methods=["POST"])
def filtra_mezzi():
    try:
        data = request.get_json()
        tipo_mezzo = data.get("tipo_mezzo")
        data_ora_ritiro = data.get("data_ora_ritiro")
        data_ora_consegna = data.get("data_ora_consegna")

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        query = """
            SELECT * FROM mezzo 
            WHERE tipo_mezzo = %s
            AND id_mezzo NOT IN (
                SELECT id_mezzo FROM prenotazioni 
                WHERE NOT (
                    data_ora_consegna <= %s OR data_ora_ritiro >= %s
                )
            )
        """
        cursor.execute(query, (tipo_mezzo, data_ora_ritiro, data_ora_consegna))
        mezzi_disponibili = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify(mezzi_disponibili)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

