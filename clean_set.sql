-- Use superstore Relational Database
USE superstore;

-- Creat a clean copy of the table
CREATE TABLE clean_superstore AS
SELECT * FROM rawsuperstore;

SET SQL_SAFE_UPDATES = 0;


-- Remove Row with invalid Sale values
DELETE FROM clean_superstore
WHERE sale NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';


-- Remove Row with invalid Quantity values
DELETE FROM clean_superstore
WHERE Quantity NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';

-- Remove Row with invalid Discount values
DELETE FROM clean_superstore
WHERE Discount NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';




-- Cast columns to appropriate data type
ALTER TABLE clean_superstore
MODIFY COLUMN Country VARCHAR(255),
MODIFY COLUMN City VARCHAR(255),
MODIFY COLUMN State VARCHAR(255),
MODIFY COLUMN Region VARCHAR(255),
MODIFY COLUMN Category VARCHAR(255),
MODIFY COLUMN Sale FLOAT,
MODIFY COLUMN Quantity INT,
MODIFY COLUMN Discount FLOAT,
MODIFY COLUMN Profit  FLOAT;

SELECT COUNT(*) AS total_rows
FROM clean_superstore; -- 774 records


-- I skipped some of the data cleaning steps becouse I already did some part of the data using EXCEL initially