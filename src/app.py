from db import get_connection


def main():
    """
    Entry point of the application.

    Attempts to establish a connection between the Python
    application and the MySQL database and reports the result.
    """
    print("University RMS - Software Layer Test")
    print("Attempting to connect to database...")

    try:
        conn = get_connection()
        print("Connection successful.")
        conn.close()
    except Exception as e:
        print("Connection failed.")
        print("Error:", e)


if __name__ == "__main__":
    main()