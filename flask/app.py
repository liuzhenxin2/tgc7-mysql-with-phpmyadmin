from flask import Flask, render_template, request, redirect, url_for
import os
import pymysql
import random

app = Flask(__name__)

conn = pymysql.connect(
    host=os.environ.get('IP'),
    user=os.environ.get('C9_USER'),
    password="",
    database="classicmodels"
)


@app.route('/employees')
def show_employees():
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("select * from employees")
    return render_template('all_employees.template.html', cursor=cursor)


@app.route('/offices')
def show_offices():
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("select * from offices")
    return render_template('all_offices.template.html', offices=cursor)


@app.route('/offices/create')
def show_create_office_form():
    return render_template('create_office.template.html')


@app.route('/offices/create', methods=["POST"])
def process_create_office():
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    officeCode = random.randint(100000, 999999)

    sql = """
          insert into offices (officeCode, city, phone, addressLine1,
            addressLine2, state, country, postalCode, territory)
            values (%s, %s, %s, %s, %s, %s, %s, %s, %s);
    """

    cursor.execute(sql, [
        officeCode,
        request.form.get('city'),
        request.form.get('phone'),
        request.form.get('addressLine1'),
        request.form.get('addressLine2'),
        request.form.get('state'),
        request.form.get('country'),
        request.form.get('postal_code'),
        request.form.get('territory')
    ])

    conn.commit()
    return "done"


# "magic code" -- boilerplate
if __name__ == '__main__':
    app.run(host=os.environ.get('IP'),
            port=int(os.environ.get('PORT')),
            debug=True)
