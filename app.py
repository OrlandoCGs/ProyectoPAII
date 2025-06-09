import psycopg2
import sqlparse

# Reemplaza con tu cadena de conexión real
conn = psycopg2.connect(
    "postgresql://bd_determinar_ventas_user:vwF7juXumDbZBcvwScvRf8w2stiSutk1@dpg-d0ovrreuk2gs7395cgb0-a.oregon-postgres.render.com/bd_determinar_ventas",
    sslmode='require'
)

cur = conn.cursor()

try:
    # Leer archivo SQL completo
    with open('script_completo.sql', 'r', encoding='utf-8') as file:
        sql_script = file.read()

    # Dividir el contenido en sentencias SQL individuales
    statements = sqlparse.split(sql_script)

    # Ejecutar cada sentencia
    for stmt in statements:
        stmt = stmt.strip()
        if stmt:  # Asegurarse de que no esté vacía
            cur.execute(stmt)

    conn.commit()
    print("Script SQL ejecutado correctamente.")

except Exception as e:
    print("Error ejecutando el script SQL:", e)

finally:
    cur.close()
    conn.close()
