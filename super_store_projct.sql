-- THIS FILE IS ALL ABOUT DATA PROFILIING (UNDERSTANDING THE DATA, INVESTIGATING DATA, KNOWING THE QUALITY OF THE DATA USING THE SUPERSTORE DATASET)

-- create a database 
create database if not  exists superstore;

-- Activate the Database
use superstore;


-- tottal number of row
SELECT COUNT(*)  AS totlal_row  
FROM rawsuperstore; -- 793 records


-- check for null value per column
SELECT 
     SUM(CASE WHEN 'OrderID' IS NULL THEN 1 ELSE 0 END) AS null_order_id,
     SUM(CASE WHEN 'OrderDate ' IS NULL THEN 1 ELSE 0 END) AS null_order_date,
     SUM(CASE WHEN 'ShipDate' IS NULL THEN 1 ELSE 0 END) AS null_ship_date,
     SUM(CASE WHEN 'ShipMode'IS NULL THEN 1 ELSE 0 END) AS null_ship_mode,
     SUM(CASE WHEN 'CustomerID' IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
     SUM(CASE WHEN 'CustomerName' IS NULL THEN 1 ELSE 0 END) AS null_customer_name,
     SUM(CASE WHEN 'Country' IS NULL THEN 1 ELSE 0 END) AS null_country,
     SUM(CASE WHEN 'City' IS NULL THEN 1 ELSE 0 END) AS null_city,
     SUM(CASE WHEN 'State' IS NULL THEN 1 ELSE 0 END) AS null_state,
     SUM(CASE WHEN 'PostalCode' IS NULL THEN 1 ELSE 0 END) AS null_postal_code,
     SUM(CASE WHEN 'Region' IS NULL THEN 1 ELSE 0 END) AS null_region,
     SUM(CASE WHEN 'ProductID' IS NULL THEN 1 ELSE 0 END) AS null_product_id,
     SUM(CASE WHEN 'Category' IS NULL THEN 1 ELSE 0 END) AS null_category,
     SUM(CASE WHEN 'SubCategory' IS NULL THEN 1 ELSE 0 END) AS null_subcategory,
     SUM(CASE WHEN 'ProductName' IS NULL THEN 1 ELSE 0 END) AS null_product_name,
     SUM(CASE WHEN 'sale' IS NULL THEN 1 ELSE 0 END) AS null_sale,
     SUM(CASE WHEN 'Quantity' IS NULL THEN 1 ELSE 0 END) AS null_quantity,
     SUM(CASE WHEN 'Discount' IS NULL THEN 1 ELSE 0 END) AS null_discount,
     SUM(CASE WHEN 'Profit' IS NULL THEN 1 ELSE 0 END) AS null_profit
FROM rawsuperstore;  -- no missing values  


-- checking for duplicate
SELECT 'OrderID', 'OrderDate', 'ShipDate'
FROM rawsuperstore
WHERE STR_TO_DATE('ShipDate', '%d-%m-%Y') < STR_TO_DATE('OrderDate', '%d-%m-%Y'); -- all order occurred before shipe date





-- checking values for anomalies or outliers
SELECT 
	MIN(Sale) AS min_sale,
	MAX(Sale) AS max_sale,
	AVG(Sale) AS avg_sale
FROM rawsuperstore; -- discover this field contains inappropriate value like  11 x 5-3/4" 


-- checking the distinct values in sale
SELECT DISTINCT Sale
FROM rawsuperstore
ORDER BY Sale DESC; -- discovered 13 text values


-- checking the min, max and avg of the of the quantity column
SELECT
   MIN(Quantity) AS min_qty,
   MAX(Quantity) AS max_qty,
   AVG(Quantity) AS avg_qty
FROM rawsuperstore; -- discovered this column contains inappropriate value like    Sets/Book"


-- checking the distinct values of the quantity column

SELECT DISTINCT Quantity
FROM rawsuperstore
ORDER BY Quantity DESC; -- discovered there are 2 unique text values



-- checking the min, max, and  avg of the column Discount
SELECT 
	MIN(Discount) AS min_discount,
    MAX(Discount) AS max_discount,
    AVG(Discount) AS avg_discount
FROM rawsuperstore; -- there is field contains inappropriate value like /Box" 


-- checking the distinct values of the discount column    
SELECT DISTINCT Discount
FROM rawsuperstore
ORDER BY Discount DESC; -- discovered that there is unique text value /box"


-- checking the min, max, and avg of column profit
SELECT 
	MIN(Profit) AS min_profit,
    MAX(Profit) AS max_profit,
    AVG(Profit) AS avg_profit
FROM rawsuperstore; -- discorvered the column contains negative profit like (-0.2685) which signify loss. 


-- CLEANING THE DATA WILL BE IN THE NEXT FILE