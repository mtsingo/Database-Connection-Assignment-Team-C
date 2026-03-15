DATABASE CONNECTION ASSIGNMENT – TEAM C

PROJECT OVERVIEW

This project contains a Python application that connects to a MySQL database and allows users to run predefined queries through a graphical interface.

The application connects to the database called:

college_db_EMA

Users can run queries from the interface instead of writing SQL manually.


SETUP INSTRUCTIONS


1. Install Python

Download Python from:

https://www.python.org/downloads/

During installation make sure you check:

Add Python to PATH


2. Install MySQL

Install the following programs:

MySQL Server  
MySQL Workbench


3. Create the Database

Open MySQL Workbench.

Run the following commands:

CREATE DATABASE college_db_EMA;
USE college_db_EMA;

Then open the file:

college_db_EMA_full.sql

Run the script to create all tables and insert the data.


4. Download the Project

Download or clone the repository.

Open the project folder.


5. Install Required Python Packages

Open a terminal inside the project folder and run:

pip install mysql-connector-python  
pip install python-dotenv


6. Configure the Database Connection

Create a file called:

.env

in the main project folder.

Add the following lines inside the file:

DB_HOST=127.0.0.1  
DB_PORT=3306  
DB_USER=root  
DB_PASSWORD=YOUR_MYSQL_PASSWORD  
DB_NAME=college_db_EMA

Replace:

YOUR_MYSQL_PASSWORD

with the password you use to log into MySQL.

Example:

DB_PASSWORD=MySQL123


7. Run the Application

Open a terminal in the project folder and run:

python src/gui.py

A graphical window will open where you can run the database queries.


AVAILABLE QUERIES

The application supports the following queries:

1. Find all students enrolled in a specific course taught by a particular lecturer  
2. Search for lecturers with expertise in a particular area  
3. List all courses taught by lecturers in a specific department  
4. Find all staff members employed in a specific department  
5. Find all lecturers who work for a particular research project


PROJECT STRUCTURE

database/  
    college_db_EMA_full.sql  

src/  
    app.py  
    config.py  
    db.py  
    gui.py  
    queries.py  
    query_runner.py  

requirements.txt  
README.md  


NOTES

The database schema was provided by the database team.

The Python application implements the software layer that connects to the database and runs the queries.

Each user must configure their own MySQL password inside the .env file.


AUTHOR

Application Team