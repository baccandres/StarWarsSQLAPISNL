import sqlalchemy as alch
from dotenv import load_dotenv
import os

load_dotenv()

password = os.getenv('password')
dbName = "Starwars"
connectionData = f"mysql+pymysql://root:{password}@localhost/{dbName}"
engine = alch.create_engine(connectionData)