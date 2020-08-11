from flask import Flask, render_template, request, redirect, url_for
import pymysql
import os

app = Flask(__name__)

conn = pymysql.connect(
    host=os.environ.get('IP'),
    user=os.environ.get('C9_USER'),
    password="",
    database="classicmodels"
)


@app.route('/offices')
def show_offices():
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("select * from offices")
    return {
        "offices": list(cursor)
    }


# "magic code" -- boilerplate
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)
