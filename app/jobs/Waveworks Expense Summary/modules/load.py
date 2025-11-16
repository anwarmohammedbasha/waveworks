from sqlalchemy import create_engine, text
from datetime import date, timedelta
import logging

logger = logging.getLogger('ETL_Logger')

def load(df):
    DATABASE_URL = 'postgresql+psycopg2://postgres:admin@localhost:5432/test_db'
    engine = create_engine(DATABASE_URL)

    del_query = text("""
    DELETE FROM exp_sum
        WHERE ingest_date = :ingest_date
    """)

    ingest_date = date.today() + timedelta(days=1)

    with engine.begin() as conn:
        conn.execute(del_query, {"ingest_date":ingest_date})


    df.to_sql('exp_sum', con=engine, index=False, if_exists='append')
    logger.info('Successfully loaded data')
