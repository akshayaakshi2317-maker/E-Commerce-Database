SELECT * FROM N_Product;

SELECT Product_ID, Product_Name, Price
FROM N_Product;

SELECT * FROM N_Product
WHERE Price < 1000;

SELECT * FROM N_Product
WHERE Price > 100;

SELECT * FROM N_Product
ORDER BY Price ASC;

SELECT * FROM N_Product
ORDER BY Price DESC;

SELECT DISTINCT Category_Name
FROM N_Category;

SELECT * FROM N_Product
WHERE Price BETWEEN 100 AND 1000;

SELECT P.Product_Name, P.Price, C.Category_Name
FROM N_Product P
JOIN N_Category C
ON P.Category_ID = C.Category_ID
WHERE C.Category_Name = 'Skincare';

SELECT * FROM N_Customer;

SELECT * FROM N_Customer
WHERE Customer_ID = 1;

SELECT * FROM N_Product
WHERE Price < 1000
AND Availability = 'Yes';

SELECT * FROM N_Product
WHERE Category_ID = 1
OR Category_ID = 2;

SELECT * FROM N_Product
WHERE Category_ID IN (1, 2, 3);

SELECT * FROM N_Product
WHERE Price BETWEEN 100 AND 1000;

SELECT Product_Name, Price
FROM N_Product
ORDER BY Price ASC;

SELECT C.Customer_Name, O.Order_ID, O.Order_Date
FROM N_Customer C
JOIN N_Order O
ON C.Customer_ID = O.Customer_ID;

SELECT P.Product_Name, OI.Order_ID, OI.Quantity
FROM N_Product P
JOIN N_Order_Item OI
ON P.Product_ID = OI.Product_ID;

SELECT C.Customer_ID, C.Customer_Name,
       COUNT(O.Order_ID) AS Total_Orders
FROM N_Customer C
LEFT JOIN N_Order O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name;

SELECT C.Customer_ID, C.Customer_Name,
       SUM(OI.Quantity * P.Price) AS Total_Purchase
FROM N_Customer C
JOIN N_Order O
ON C.Customer_ID = O.Customer_ID
JOIN N_Order_Item OI
ON O.Order_ID = OI.Order_ID
JOIN N_Product P
ON OI.Product_ID = P.Product_ID
GROUP BY C.Customer_ID, C.Customer_Name;