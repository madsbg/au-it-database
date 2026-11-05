INSERT INTO customers VALUES
  (1,'Ada Lovelace','Aarhus','ada@example.com','2024-01-12'),
  (2,'Grace Hopper','Odense',NULL,'2024-02-05'),
  (3,'Alan Turing','Aalborg','aturing@example.com','2024-02-21'),
  (4,'Margaret Hamilton','Aarhus','mhamilton@example.com','2024-03-02'),
  (5,'Edsger Dijkstra','Copenhagen',NULL,'2024-03-18'),
  (6,'Barbara Liskov','Aalborg','bliskov@example.com','2024-04-01');

INSERT INTO products VALUES
  (10,'SSD 1TB','Hardware',899.00),
  (11,'Keyboard (Mechanical)','Hardware',699.00),
  (12,'SQL Book','Books',249.00),
  (13,'Docker Course','Training',1199.00),
  (14,'Mouse','Hardware',299.00);

INSERT INTO orders VALUES
  (1001,1,12,'PAID',249.00,'2024-04-03 10:05','2024-04-04 09:30'),
  (1002,2,10,'PAID',899.00,'2024-04-05 14:10',NULL),
  (1003,3,14,'CANCELLED',299.00,'2024-04-07 08:02',NULL),
  (1004,4,13,'PAID',1199.00,'2024-04-10 16:45','2024-04-12 12:10'),
  (1005,5,11,'PENDING',699.00,'2024-04-12 11:20',NULL),
  (1006,6,10,'PAID',899.00,'2024-04-15 18:05','2024-04-16 10:00');
