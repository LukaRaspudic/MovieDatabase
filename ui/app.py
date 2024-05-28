from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',
        user='yourusername',
        password='yourpassword',
        database='MovieDB'
    )
    return connection

@app.route('/')
def index():
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute('SELECT Title, ReleaseYear FROM Movies')
    movies = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('index.html', movies=movies)

if __name__ == '__main__':
    app.run(debug=True)
