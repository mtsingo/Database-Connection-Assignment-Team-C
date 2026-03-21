# Database Connection Assignment – Team C

## Project Overview

This project is a Python application that connects to a **MySQL database** and allows users to execute predefined queries through a graphical user interface (GUI).

**Database name:** `college_db_EMA`

---

## Prerequisites

Before setting up the project, ensure you have the following installed:

- [Python](https://www.python.org/downloads/) (v3.7 or higher)
- [MySQL Server](https://dev.mysql.com/downloads/mysql/)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)

---

## Setup Instructions

### 1. Install Python

Download and install Python from [python.org](https://www.python.org/downloads/).

> During installation, make sure to check **"Add Python to PATH"**.

---

### 2. Create the Database

1. Open **MySQL Workbench** and connect to your local MySQL server.
2. Run the following SQL commands:

```sql
CREATE DATABASE college_db_EMA;
USE college_db_EMA;
```

3. Open the file `college_db_EMA_full.sql` and run it to create all tables and insert the data.

---

### 3. Download the Project

Clone the repository or download the ZIP and extract it:

```bash
git clone <repository-url>
cd <project-folder>
```

---

### 4. Install Required Python Packages

Open a terminal inside the project folder and run:

```bash
pip install mysql-connector-python
pip install python-dotenv
```

Or install everything at once using the requirements file:

```bash
pip install -r requirements.txt
```

---

### 5. Configure the Database Connection

Create a file named **`.env`** in the root of the project folder and add the following:

```env
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=root
DB_PASSWORD=YOUR_MYSQL_PASSWORD
DB_NAME=college_db_EMA
```

> 🔑 Replace `YOUR_MYSQL_PASSWORD` with the password you use to log into MySQL.
>
> **Example:**
> ```env
> DB_PASSWORD=MySQL123
> ```

---

### 6. Run the Application

Open a terminal in the project folder and run:

```bash
python src/gui.py
```

A graphical window will open where you can execute the available database queries.

---

## Available Queries

The application supports the following predefined queries:

| # | Query Description |
|---|-------------------|
| 1 | Find all students enrolled in a specific course taught by a particular lecturer |
| 2 | Search for lecturers with expertise in a particular area |
| 3 | List all courses taught by lecturers in a specific department |
| 4 | Find all staff members employed in a specific department |
| 5 | Find all lecturers who work for a particular research project |

---

## Project Structure

```
project-folder/
│
├── database/
│   └── college_db_EMA_full.sql
│
├── src/
│   ├── app.py
│   ├── config.py
│   ├── db.py
│   ├── gui.py
│   ├── queries.py
│   └── query_runner.py
│
├── .env                  ← Created by each user (not committed to version control)
├── requirements.txt
└── README.md
```

---
 
## Testing the Database and Application
 
This section explains how to validate the database structure and confirm the Python application queries are working correctly.
 
### Setup
 
Before running any tests, ensure the following:
 
1. The project is downloaded and the Python environment is configured with all required packages.
2. MySQL Server is running and the database connection in the `.env` file is correctly configured.
 
---
 
### Running the Database Tests
 
1. Open the file `test/test_queries.sql` in **MySQL Workbench**.
2. Execute the queries to validate the database structure, data integrity, and relationships. These tests check for things such as:
   - Students enrolled in multiple courses
   - Lecturers teaching multiple courses
   - Foreign key constraint enforcement
3. Review the results in MySQL Workbench — queries should return correct data or reject invalid inputs as expected.
 
---
 
### Python Application Validation
 
1. Launch the GUI application:
 
```bash
python3 src/gui.py
```
 
2. Select one of the five predefined queries from the interface and enter any required parameters.
3. Confirm that the application returns the expected results in the interface.
 
---
 
### Testing Notes
 
> - If a query fails, check that table names and foreign key relationships are correctly defined in the database.
> - All test cases have been verified to run correctly in `test/test_queries.sql` and through the Python GUI.
> - These tests ensure the system maintains **data integrity**, performs queries **accurately**, and handles **invalid inputs** properly.

## Notes

- The database schema was provided by the **database team**.
- The Python application implements the **software layer** that connects to the database and executes the queries.
- Each team member must configure their **own** `.env` file with their personal MySQL password.
- The `.env` file should **never** be shared or committed to version control.

---

## Authors

**Application Team – Team C**
