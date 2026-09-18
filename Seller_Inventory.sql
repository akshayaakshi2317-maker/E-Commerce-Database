CREATE TABLE Seller (
    Seller_ID NUMBER PRIMARY KEY,
    Seller_Name VARCHAR2(100) NOT NULL,
    Store_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone_Number VARCHAR2(15) UNIQUE,
    Address VARCHAR2(100)
);
Table created
CREATE TABLE Product (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100) NOT NULL,
    Price NUMBER(10,2),
    Stock NUMBER
);
Table created
CREATE TABLE Inventory (
    Inventory_ID NUMBER PRIMARY KEY,
    Product_ID NUMBER NOT NULL,
    Seller_ID NUMBER NOT NULL,
    Stock_Quantity NUMBER NOT NULL,
    Stock_Status VARCHAR2(20) NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID)
);
Table created
INSERT INTO Seller VALUES
(101, 'Anitha Kumar', 'Elegant Jewels',
'anitha@gmail.com', '9876543210', 'Chennai');
1 row created
INSERT INTO Seller VALUES
(102, 'Priya Sharma', 'Shine Collections',
'priya@gmail.com', '9876543211', 'Bangalore');
1 row created
INSERT INTO Seller VALUES
(103, 'Kavitha Raj', 'Jewel World',
'kavitha@gmail.com', '9876543212', 'Coimbatore');
1 row created
INSERT INTO Seller VALUES
(104, 'Divya Singh', 'Trendy Jewels',
'divya@gmail.com', '9876543213', 'Hyderabad');
1 row created
INSERT INTO Seller VALUES
(105, 'Meena Devi', 'Royal Accessories',
'meena@gmail.com', '9876543214', 'Mumbai');
1 row created
INSERT INTO Inventory VALUES
(1, 1, 101, 50, 'Available');
1 row created
INSERT INTO Inventory VALUES
(2, 2, 102, 30, 'Available');
1 row created
INSERT INTO Inventory VALUES
(3, 3, 103, 0, 'Unavailable');
1 row created
INSERT INTO Inventory VALUES
(4, 4, 104, 25, 'Available');
1 row created
INSERT INTO Inventory VALUES
(5, 5, 105, 0, 'Unavailable');
1 row created
INSERT INTO Product VALUES
(101, 'Gold Plated Necklace', 599.00, 50);
1 row created
INSERT INTO Product VALUES
(102, 'Stone Earrings', 399.00, 30);
1 row created
INSERT INTO Product VALUES
(103, 'Pearl Bracelet', 499.00, 20);
1 row created
INSERT INTO Product VALUES
(104, 'Temple Necklace', 799.00, 25);
1 row created
INSERT INTO Product VALUES
(105, 'Oxidized Jhumka', 299.00, 40);
1 row created
COMMIT;
commit completed
 
SELECT * FROM Seller;

SELECT * FROM PRODUCT;

SELECT * FROM Inventory;

SELECT
    i.Inventory_ID,
    p.Product_Name,
    s.Seller_Name,
    s.Store_Name,
    s.Email,
    s.Phone_Number,
    i.Stock_Quantity,
    i.Stock_Status
FROM Inventory i
JOIN Product p
ON i.Product_ID = p.Product_ID
JOIN Seller s
ON i.Seller_ID = s.Seller_ID;

SELECT
    i.Inventory_ID,
    p.Product_Name,
    s.Store_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Inventory i
JOIN Product p
ON i.Product_ID = p.Product_ID
JOIN Seller s
ON i.Seller_ID = s.Seller_ID
WHERE i.Stock_Status = 'Available';

SELECT
    i.Inventory_ID,
    p.Product_Name,
    s.Store_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Inventory i
JOIN Product p
ON i.Product_ID = p.Product_ID
JOIN Seller s
ON i.Seller_ID = s.Seller_ID
WHERE i.Stock_Status = 'Unavailable';

UPDATE Inventory
SET Stock_Quantity = 20,
    Stock_Status = 'Available'
WHERE Inventory_ID = 3;



SELECT *
FROM Inventory
WHERE Inventory_ID = 3;
