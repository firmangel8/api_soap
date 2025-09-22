import os
from dotenv import load_dotenv
import mysql.connector
from mysql.connector import pooling

# Load .env file
load_dotenv()

# Read env variables
DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
DB_NAME = os.getenv("DB_NAME", "soap_demo")
DB_USER = os.getenv("DB_USER", "root")
DB_PASSWORD = os.getenv("DB_PASSWORD", "")
DB_POOLNAME = os.getenv("DB_POOLNAME", "soap_pool")
POOL_SIZE = int(os.getenv("POOL_SIZE", 5))

# Initialize connection pool
connection_pool = pooling.MySQLConnectionPool(
    pool_name=DB_POOLNAME,
    pool_size=POOL_SIZE,
    pool_reset_session=True,
    host=DB_HOST,
    database=DB_NAME,
    user=DB_USER,
    password=DB_PASSWORD,
)

def get_connection():
    """Get a connection from the pool"""
    return connection_pool.get_connection()
