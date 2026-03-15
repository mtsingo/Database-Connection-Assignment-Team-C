import mysql.connector
from config import DbConfig


def get_connection():
    cfg = DbConfig()

    return mysql.connector.connect(
        host=cfg.host,
        port=cfg.port,
        user=cfg.user,
        password=cfg.password,
        database=cfg.database
    )