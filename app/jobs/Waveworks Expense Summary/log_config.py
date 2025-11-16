import logging

def setup_logging():
    """
    Configures the logger once for the entire application.
    """
    # 1. Configuration Settings
    LOG_FILE = 'application_events.log'
    LOG_LEVEL = logging.INFO
    LOG_FORMAT = '%(asctime)s - %(levelname)s - %(name)s - %(message)s'

    # 2. Apply Configuration
    logging.basicConfig(
        level=LOG_LEVEL,
        format=LOG_FORMAT,
        filename=LOG_FILE,
        filemode='a'  # Appends to the log file
    )

    # 3. Get the configured instance and log a startup message
    logger = logging.getLogger('ETL_Logger')
    logger.info("Centralized logging system initialized.")
    return logger

# Note: We return the logger instance, but we primarily access it by name in other files.