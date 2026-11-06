DROP DATABASE IF EXISTS lesson_reporting;
CREATE DATABASE lesson_reporting;
USE lesson_reporting;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    product_category VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
);

INSERT INTO orders (order_id, customer_first_name, customer_last_name, city, product_category, product_name, quantity, unit_price, order_date, status) VALUES
(1,  ' Anna ',   'Jensen',    'Copenhagen', 'Books',       'SQL in easy steps',     1, 199.00, '2026-02-01', 'Completed'),
(2,  'Lars',     'Nielsen ',  'Aarhus',     'Electronics', 'Wireless Mouse',        2, 149.50, '2026-02-01', 'Completed'),
(3,  'Mette',    'Hansen',    'Odense',     'Office',      'Notebook Pack',         5,  35.00, '2026-02-02', 'Pending'),
(4,  'Jonas',    'Pedersen',  'Copenhagen', 'Books',       'Database Design Basics',1, 249.00, '2026-02-02', 'Completed'),
(5,  ' Sofie',   'Andersen',  'Aalborg',    'Electronics', 'USB-C Hub',             1, 299.00, '2026-02-03', 'Completed'),
(6,  'Emil',     'Christensen','Esbjerg',   'Office',      'Desk Lamp',             2, 180.00, '2026-02-03', 'Cancelled'),
(7,  'Freja',    'Larsen',    'Aarhus',     'Books',       'Learning SQL',          3, 175.00, '2026-02-04', 'Completed'),
(8,  'Noah',     'Sorensen',  'Odense',     'Electronics', 'Keyboard',              1, 499.00, '2026-02-04', 'Pending'),
(9,  'Ida',      'Rasmussen', 'Copenhagen', 'Office',      'Pen Set',              10,  12.50, '2026-02-05', 'Completed'),
(10, 'William',  'Jorgensen', 'Aalborg',    'Books',       'Query Practice Guide', 2, 145.00, '2026-02-05', 'Completed'),
(11, 'Clara',    'Madsen',    'Esbjerg',    'Electronics', 'Monitor Stand',         1, 220.00, '2026-02-06', 'Completed'),
(12, 'Oliver',   'Kristensen','Copenhagen', 'Office',      'Stapler',               4,  28.00, '2026-02-06', 'Pending'),
(13, ' Alma ',   'Olsen',     'Odense',     'Books',       'MariaDB Starter',       1, 189.00, '2026-02-07', 'Completed'),
(14, 'Malthe',   'Thomsen',   'Aarhus',     'Office',      'Whiteboard Markers',    6,  24.00, '2026-02-07', 'Completed'),
(15, 'Ella',     'Poulsen',   'Aalborg',    'Electronics', 'Webcam',                2, 399.00, '2026-02-08', 'Completed'),
(16, 'Victor',   'Knudsen',   'Esbjerg',    'Books',       'Intro to Data',         1, 159.00, '2026-02-08', 'Cancelled'),
(17, 'Laura',    'Schmidt',   'Copenhagen', 'Electronics', 'Laptop Stand',          1, 275.00, '2026-02-09', 'Completed'),
(18, 'Magnus',   'Mortensen', 'Odense',     'Office',      'Paper Ream',            8,  49.00, '2026-02-09', 'Completed'),
(19, 'Eva',      'Bertelsen', 'Aarhus',     'Books',       'SQL Exercises',         2, 169.00, '2026-02-10', 'Pending'),
(20, 'Felix',    'Dahl',      'Copenhagen', 'Office',      'Desk Organizer',        1,  89.00, '2026-02-10', 'Completed'),
(21, 'Nora',     'Holm',      'Aalborg',    'Books',       'Reporting with SQL',    1, 215.00, '2026-02-11', 'Completed'),
(22, 'August',   'Lund',      'Esbjerg',    'Electronics', 'Headset',               3, 325.00, '2026-02-11', 'Completed'),
(23, 'Karla',    'Eriksen',   'Odense',     'Office',      'Filing Trays',          2, 110.00, '2026-02-12', 'Pending'),
(24, 'Theo',     'Winther',   'Aarhus',     'Electronics', 'Portable SSD',          1, 650.00, '2026-02-12', 'Completed');
