import logging
from datetime import date, timedelta

logger = logging.getLogger('ETL_Logger')

def transform(df):
    agg_df = df.groupby('department_id').agg(total_expenses=('amount', 'sum')).reset_index()
    department_map = {
        1: "HR",
        2: "Finance",
        3: "Operations",
        4: "Sales",
        5: "IT"
    }

    agg_df['ingest_date'] = date.today() + timedelta(days=1)
    agg_df['department_name'] = agg_df['department_id'].map(department_map)
    agg_df.drop(['department_id'], axis=1, inplace=True)
    agg_df.sort_values(by=['total_expenses'], inplace=True, ascending=False)
    logger.info("Transformed data")
    return agg_df