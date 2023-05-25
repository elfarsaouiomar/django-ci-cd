import mysql.connector
from mysql.connector import Error

try:
    connection = mysql.connector.connect(host='my-mysql-instance.ckuwtrlxa51h.us-east-1.rds.amazonaws.com',
                                         database='testdb',
                                         user='admin',
                                         password='insecurepassword')
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = connection.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()
        print("You're connected to database: ", record)

except Error as e:
    raise("Error while connecting to MySQL", e)
