CREATE DATABASE evu_shop;
USE evu_shop;
DROP TABLE IF EXISTS orders, customers, products;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  full_name VARCHAR(80) NOT NULL,
  city VARCHAR(40) NOT NULL,
  email VARCHAR(120) NULL,
  created_at DATE NOT NULL
);
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(80) NOT NULL,
  category VARCHAR(40) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  product_id INT NOT NULL,
  status VARCHAR(20) NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  ordered_at DATETIME NOT NULL,
  shipped_at DATETIME NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
