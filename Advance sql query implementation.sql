SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price > (SELECT AVG(Price)
               FROM Product);

SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price < (SELECT AVG(Price)
               FROM Product);

SELECT C.Customer_ID,
       C.Customer_Name,
       SUM(O.Total_Amount) AS Total_Purchase
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name;

SELECT MAX(Total_Purchase)
FROM
(
    SELECT Customer_ID,
           SUM(Total_Amount) AS Total_Purchase
    FROM Orders
    GROUP BY Customer_ID
);

SELECT
    C.Customer_ID,
    C.Customer_Name,
    SUM(O.Total_Amount) AS Total_Purchase
FROM Customer C
JOIN Orders O
    ON C.Customer_ID = O.Customer_ID
GROUP BY
    C.Customer_ID,
    C.Customer_Name
HAVING SUM(O.Total_Amount) =
(
    SELECT MAX(Total_Purchase)
    FROM
    (
        SELECT SUM(Total_Amount) AS Total_Purchase
        FROM Orders
        GROUP BY Customer_ID
    )
);

SELECT Customer_ID,
       Customer_Name
FROM Customer
WHERE Customer_ID IN
(
    SELECT Customer_ID
    FROM Orders
    WHERE Total_Amount >
    (
        SELECT AVG(Total_Amount)
        FROM Orders
    )
);

SELECT P.Product_ID,
       P.Product_Name,
       SUM(OD.Quantity * P.Price) AS Total_Sales
FROM Product P
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY P.Product_ID, P.Product_Name
HAVING SUM(OD.Quantity * P.Price) >
(
    SELECT AVG(Product_Sales)
    FROM
    (
        SELECT SUM(OD.Quantity * P.Price) AS Product_Sales
        FROM Product P
        JOIN Order_Details OD
        ON P.Product_ID = OD.Product_ID
        GROUP BY P.Product_ID
    )
);

SELECT C.Customer_ID,
       C.Customer_Name,
       COUNT(O.Order_ID) AS Total_Orders,
       SUM(O.Total_Amount) AS Total_Purchase,
       AVG(O.Total_Amount) AS Average_Order
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Total_Purchase DESC;

SELECT P.Product_ID,
       P.Product_Name,
       COUNT(DISTINCT OD.Order_ID) AS Total_Orders,
       SUM(OD.Quantity) AS Total_Quantity,
       P.Price,
       SUM(OD.Quantity * P.Price) AS Total_Sales
FROM Product P
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY P.Product_ID, P.Product_Name, P.Price
ORDER BY Total_Sales DESC;

SELECT C.Category_ID,
       C.Category_Name,
       COUNT(DISTINCT P.Product_ID) AS Total_Products,
       SUM(OD.Quantity) AS Total_Quantity,
       SUM(OD.Quantity * P.Price) AS Total_Sales
FROM Category C
JOIN Product P
ON C.Category_ID = P.Category_ID
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY C.Category_ID, C.Category_Name
ORDER BY Total_Sales DESC;