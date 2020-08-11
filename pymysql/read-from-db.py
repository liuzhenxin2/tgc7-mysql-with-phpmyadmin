import pymysql
import os

# 1. get the connection
# this connection will be used throughout the application
conn = pymysql.connect(
    host="localhost",
    user=os.environ.get('C9_USER'),
    password="",
    database="classicmodels"
)

# 2. create the cursor
# from the database connection, create the cursor
cursor = conn.cursor(pymysql.cursors.DictCursor)

# 3. store the sql statement in a variable for ease of use
officeCode = input("Which office code? ")
sql = "select * from employees where officeCode='{officeCode}'"

# 4. execute the sql
cursor.execute(sql)

for each_employee in cursor:
    print(f"""Emplyoee Number: {each_employee["employeeNumber"]}
             {each_employee["lastName"]} {each_employee["firstName"]}""")
