import mysql.connector
from config import DbConfig


def get_connection():
    """
    Creates and returns a connection to the MySQL database
    using the configuration defined in the DbConfig class.
    """
    cfg = DbConfig()

    return mysql.connector.connect(
        host=cfg.host,
        port=cfg.port,
        user=cfg.user,
        password=cfg.password,
        database=cfg.database
    )