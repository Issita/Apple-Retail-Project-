-- Apple Retails Millons Rows Sales Schemas

-- DROP TABLE command
DROP TABLE IF EXISTS warranty;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS category; -- parent table
DROP TABLE IF EXISTS stores; -- parent table

-- CREATE TABLE commands


CREATE TABLE stores(
Store_ID VARCHAR(5) PRIMARY KEY,
Store_Name VARCHAR(30),
City VARCHAR(25),
Country VARCHAR(25)
);


CREATE TABLE category(
category_id	VARCHAR(10)PRIMARY KEY,
category_name VARCHAR(20)
);


CREATE TABLE products(
product_id VARCHAR(10) PRIMARY KEY,
product_name VARCHAR(35),
category_id VARCHAR(10),
launch_date	DATE,
price FLOAT,
CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE sales(
sale_id	VARCHAR (15) PRIMARY KEY,
sale_date DATE,
store_id VARCHAR(10), -- fk
product_id VARCHAR(10), --fk
quantity INT,
CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES stores(store_id),
CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);


CREATE TABLE warranty(
claim_id VARCHAR(10) PRIMARY KEY,
claim_date DATE,
sale_id	VARCHAR(15),
repair_status VARCHAR(15),
CONSTRAINT fk_orders FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);

-- SUCCESS MESSGAE
SELECT 'Schema created successful' as Success_Message;

