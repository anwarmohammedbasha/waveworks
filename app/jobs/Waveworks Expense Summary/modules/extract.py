import logging
import os
import glob
import pandas as pd
from sqlalchemy import create_engine, text

logger = logging.getLogger('ETL_Logger')
logger.info("Extracting data from source system.")

def extract(folder_path):

    logger.info("Extracting data from source system.")
    search_pattern = os.path.join(folder_path, "*.csv")
    files = glob.glob(search_pattern)
    logger.info(f"Found {len(files)} files in {folder_path}")
    list_of_df = []
    for file in files:
        df = pd.read_csv(file)
        list_of_df.append(df)
    combined_df = pd.concat(list_of_df)
    logger.info(f"Found {len(combined_df)} rows in {folder_path}")
    return combined_df

def extract_db(path, table_name):
    DATABASE_URL = f"sqlite:///{path}"
    engine = create_engine(DATABASE_URL)
    query = text(f"SELECT * FROM {table_name}")
    df = pd.read_sql(query, engine)
    logger.info(f"Imported {len(df)} rows from db")
    return df