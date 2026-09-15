CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(200)
);
Table Created.

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category_ID INT,
    Price NUMBER(10,2) NOT NULL,
    Stock_Quantity INT NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);
Table Created.

INSERT INTO Category VALUES
(1, 'Skincare', 'Skin care and face care products');
1 row Created
INSERT INTO Category VALUES
(2, 'Makeup', 'Makeup and cosmetic products');
1 row Created
INSERT INTO Category VALUES
(3, 'Haircare', 'Hair care and hair styling products');
1 row Created
INSERT INTO Category VALUES
(4, 'Fragrance', 'Perfumes and body fragrances');
1 row Created

INSERT INTO Product VALUES
(101, 'Face Wash', 1, 299.00, 50);
1 row Created
INSERT INTO Product VALUES
(102, 'Moisturizer', 1, 499.00, 30);
1 row Created
INSERT INTO Product VALUES
(103, 'Lipstick', 2, 699.00, 40);
1 row Created
INSERT INTO Product VALUES
(104, 'Shampoo', 3, 399.00, 25);
1 row Created
INSERT INTO Product VALUES
(105, 'Perfume', 4, 899.00, 20);
1 row Created

SELECT * FROM Category;

SELECT * FROM Product;

UPDATE Product
SET Price = 349.00,
    Stock_Quantity = 60
WHERE Product_ID = 101;

UPDATE Product
  SET Price = 549.00
  WHERE Product_ID = 102;

 DELETE FROM Product
    WHERE Product_ID = 105;

 DELETE FROM Product
   WHERE Product_ID = 103;

SELECT 
    C.Category_Name,
    P.Product_Name,
    P.Price,
    P.Stock_Quantity
FROM Category C
JOIN Product P
ON C.Category_ID = P.Category_ID
ORDER BY C.Category_Name;

SELECT 
    P.Product_ID,
    P.Product_Name,
    P.Price,
    P.Stock_Quantity
FROM Product P
JOIN Category C
ON P.Category_ID = C.Category_ID
WHERE C.Category_Name = 'Skincare';

SELECT 
    C.Category_Name,
    COUNT(P.Product_ID) AS Product_Count
FROM Category C
LEFT JOIN Product P
ON C.Category_ID = P.Category_ID
GROUP BY C.Category_Name;
