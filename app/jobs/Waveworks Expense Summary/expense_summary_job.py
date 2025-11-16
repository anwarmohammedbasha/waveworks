from log_config import setup_logging
import logging
from modules.extract import extract, extract_db
from modules.transform import transform
from modules.load import load

setup_logging()
logger = logging.getLogger('ETL_Logger')
logger.info("Main job execution started.")

def main():
    df = extract_db('data/wave_daily.db', 'daily_expenses') #extract('data/daily_expenses')
    tdf = transform(df)
    load(tdf)

if __name__ == "__main__":
    main()
