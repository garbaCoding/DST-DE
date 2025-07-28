import psycopg2

conn = psycopg2.connect(database="dst_db",
                        host="localhost",
                        user="daniel",
                        password="datascientest",
                        port="5432")
print(conn)

cur = conn.cursor()
print(cur)
cur.execute("SELECT * FROM Chiens LIMIT 10;")

rows = cur.fetchall()
print(rows)
for row in rows:
    print(row)

cur.close()
conn.close()