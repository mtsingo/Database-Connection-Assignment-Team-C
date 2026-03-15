import os
from pathlib import Path
from dotenv import load_dotenv

BASE_DIR = Path(__file__).resolve().parent.parent
load_dotenv(BASE_DIR / ".env")


class DbConfig:
    """
    Configuration class for database connection settings.

    Loads database credentials and connection parameters
    from the .env file using environment variables.
    """

    def __init__(self):
        """
        Initialise database configuration values used to
        connect the application to the MySQL database.
        """
        self.host = os.getenv("DB_HOST", "127.0.0.1")
        self.port = int(os.getenv("DB_PORT", "3306"))
        self.user = os.getenv("DB_USER", "root")
        self.password = os.getenv("DB_PASSWORD", "")
        self.database = os.getenv("DB_NAME", "college_db_EMA")