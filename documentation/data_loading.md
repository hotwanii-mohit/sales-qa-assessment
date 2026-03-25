## Customer Data Loading

- Source file: Customer.xls
- Converted Excel file to CSV format for compatibility
- Imported data using MySQL Workbench Table Data Import Wizard
- Column mapping was verified before import
- Data validation performed using row count and sample queries

## Orders Data Loading

- Source file: Order.csv
- Data imported directly using MySQL Workbench
- Column mapping verified before import
- Product name mapped from 'Item' column

## Shipping Data Loading

- Source file: Shipping.json
- JSON data was converted into CSV format using Python (pandas) for easier ingestion into MySQL
- The transformed CSV file was then imported using MySQL Workbench
- Column mapping was verified before import

## Data Validation

Data validation was performed after loading all datasets to ensure data integrity and consistency before analysis.

### Row Count Validation
Verified that all records were successfully loaded into respective tables.

### Null Value Check
Checked for missing values in key columns to ensure data completeness.

### Duplicate Check
Validated that primary key columns do not contain duplicate records.

### Referential Integrity Check
Validated that all foreign key relationships between tables are consistent.

### Shipping Data Observation
Observed that multiple shipping records exist for a single customer, indicating that shipping data is maintained at customer level rather than order level. This may lead to duplication during joins.
