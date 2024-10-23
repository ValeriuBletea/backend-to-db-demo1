##### you will have the beginning of the code before this line
############# V1 - hardcoded credentials ##############
import mysql.connector

# Establishing a connection to the MySQL server
connection = mysql.connector.connect(
    host="rds-demo-24b.c1ow0y4448pr.us-east-2.rds.amazonaws.com",
    user="admin",
    passwd="yourpassword",
)

# Creating a cursor object to interact with the database
cursor = connection.cursor()

# Creating a new database called demo_app
create_database_query = "CREATE DATABASE demo_app-iphone"
cursor.execute(create_database_query)

# Executing the query to show databases
show_databases_query = "SHOW DATABASES"
cursor.execute(show_databases_query)

# Fetching all the database names from the cursor
databases = cursor.fetchall()

# Printing the list of databases
for database in databases:
    print(database[0])

# Closing the cursor and connection
cursor.close()
connection.close()


##### you will have the rest of the code after this line