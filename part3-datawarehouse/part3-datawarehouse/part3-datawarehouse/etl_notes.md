## ETL Decisions

### Decision 1 – Date Format Standardization  
**Problem:** The raw dataset contained inconsistent date formats such as DD-MM-YYYY and MM/DD/YYYY, making time-based analysis difficult and unreliable.  
**Resolution:** All dates were converted into a standard format (YYYY-MM-DD) before loading into the warehouse. This ensures consistency and allows efficient aggregation by month and year.

---

### Decision 2 – Handling NULL and Missing Values  
**Problem:** Some records had missing values in important fields such as product category or store information, which could lead to inaccurate reporting.  
**Resolution:** Missing values were either replaced with default placeholders (like "Unknown") or removed if critical. Additionally, duplicate and inconsistent records were removed to maintain data quality.

---

### Decision 3 – Category Standardization  
**Problem:** Product categories had inconsistent naming such as "electronics", "Electronics", and "ELECTRONICS", which would break grouping operations and lead to incorrect results.  
**Resolution:** All category values were standardized into a consistent format (e.g., "Electronics", "Clothing", "Groceries") to ensure accurate aggregation and reporting.
