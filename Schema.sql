-- Amazon project - Advanced SQL project

-- 1. Category table
-- 2. Customer's table
-- 3. Seller's table
-- 4. Product table
-- 5. Order's table
-- 6. order items table
-- 7. Payment table 
-- 8. Inventory table

-- Category table
CREATE TABLE category
(
category_id 	INT PRIMARY KEY,
category_name 	VARCHAR(25)
);


-- Customer's table
CREATE TABLE customers
(
Customer_id 	INT PRIMARY KEY,
first_name 		VARCHAR(20),
last_name 		VARCHAR(20),
state 			VARCHAR(20),
address 		VARCHAR(5) DEFAULT ('xxxx')
);


-- Seller's table
CREATE TABLE sellers
(
seller_id 		INT PRIMARY KEY,	
seller_name		VARCHAR(25),
origin 			VARCHAR(5)
);

-- updating data type for seller COLUMN
ALTER TABLE sellers
ALTER COLUMN origin TYPE VARCHAR(10);

-- Product table
CREATE TABLE products
(
product_id 		INT PRIMARY KEY,
product_name 	VARCHAR(50),
price 			FLOAT, 
cogs 			FLOAT,	
category_id 	INT, --FK
CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);


--Order's table
CREATE TABLE orders
(
order_id 		INT PRIMARY KEY,
order_date 		DATE,
customer_id	 	INT, --FK	
seller_id 		INT, --FK
order_status	VARCHAR(15),
CONSTRAINT orders_fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
CONSTRAINT orders_fk_sellers FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);


-- order items table
CREATE TABLE order_items
(
order_item_id	INT PRIMARY KEY,
order_id		INT, --FK
product_id		INT, --FK
quantity		INT,
price_per_unit 	FLOAT,
CONSTRAINT order_items_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id),
CONSTRAINT order_items_fk_products FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Payment table 

CREATE TABLE payments
(
payment_id 		INT PRIMARY KEY,
order_id 		INT, --FK
payment_date 	DATE,
payment_status 	VARCHAR(20),
CONSTRAINT payments_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- Inventory TABLE
CREATE TABLE inventory
(
inventory_id 		INT PRIMARY KEY,	
product_id			INT,--FK
stock 				INT,
warehouse_id 		INT,
last_stock_date 	DATE,
CONSTRAINT order_items_fk_products FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Shipping table 
CREATE TABLE shippings
(
shipping_id			INT PRIMARY KEY,
order_id 			INT, --FK
shipping_date 		DATE,	
return_date			DATE,
shipping_providers 	VARCHAR(10),	
delivery_status 	VARCHAR(10),
CONSTRAINT shippings_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- end of Schemas 





















