## SQL & ETL using **SQLAlchemy** and **Pandas** 

This repository provides scripts and documentation for fundamental **SQL** and practical **Python ETL** (Extract, Transform, Load) processes using **SQLAlchemy** and **Pandas**.

***

### 1. 📜 SQL Basics (Structured Query Language)
SQL is the standard language used to interact with and manage relational databases. It's the language of data retrieval, manipulation, and definition.

***

### 2. 🐍 Database Connectivity (SQLAlchemy)

* **Purpose:** Connects Python to various databases (e.g., PostgreSQL, SQLite).
* **Usage:** Enables running raw SQL and bulk data operations.

***

### 3. 🔄 ETL Process (Extract, Transform, Load)

* **E (Extract):** Reads data (e.g., from SQLite using Pandas `read_sql()`).
* **T (Transform):** Cleans, validates, and reshapes data (e.g., Pandas operations like `fillna()`).
* **L (Load):** Writes cleaned data to the target database (e.g., to PostgreSQL using Pandas `to_sql()`).

**Bulk CSV Import:**
Use the **`os`** library to iterate through all `.csv` files in a directory, read each one into a Pandas DataFrame, and load them sequentially into the target table.

***

### 4. 🪵 Logging

* **Tool:** Python's built-in **`logging`** module.
* **Function:** Tracks job start/end, progress, and crucial **error** information for monitoring and debugging ETL jobs.