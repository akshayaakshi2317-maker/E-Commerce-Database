SELECT COUNT(*) AS TOTAL_ORDERS
FROM Orders;

SELECT SUM(Total_Amount) AS TOTAL_SALES
FROM Orders;

SELECT AVG(Total_Amount) AS AVERAGE_SALES
FROM Orders;

SELECT MIN(Total_Amount) AS MINIMUM_SALES
FROM Orders;

SELECT MAX(Total_Amount) AS MAXIMUM_SALES
FROM Orders;

SELECT
    COUNT(*) AS TOTAL_ORDERS,
    SUM(Total_Amount) AS TOTAL_SALES
FROM Orders;

SELECT
    C.Customer_ID,
    C.Customer_Name,
    COUNT(O.Order_ID) AS TOTAL_ORDERS,
    SUM(O.Total_Amount) AS TOTAL_PURCHASE
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY TOTAL_PURCHASE DESC;

SELECT
    C.Customer_ID,
    C.Customer_Name,
    SUM(O.Total_Amount) AS PURCHASE_AMOUNT
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY PURCHASE_AMOUNT DESC;

SELECT
    P.Product_ID,
    P.Product_Name,
    SUM(OD.Quantity) AS TOTAL_QUANTITY
FROM Product P
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY TOTAL_QUANTITY DESC;

SELECT
    P.Product_ID,
    P.Product_Name,
    SUM(OD.Quantity * OD.Unit_Price) AS SALES_AMOUNT
FROM Product P
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY SALES_AMOUNT DESC;

SELECT
    C.Category_ID,
    C.Category_Name,
    SUM(OD.Quantity * OD.Unit_Price) AS TOTAL_SALES
FROM Category C
JOIN Product P
ON C.Category_ID = P.Category_ID
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY C.Category_ID, C.Category_Name
ORDER BY TOTAL_SALES DESC;

SELECT
    (SELECT COUNT(*)
     FROM Customer) AS TOTAL_CUSTOMERS,

    (SELECT COUNT(*)
     FROM Orders) AS TOTAL_ORDERS,

    (SELECT COUNT(*)
     FROM Product) AS TOTAL_PRODUCTS,

    (SELECT SUM(Quantity)
     FROM Order_Details) AS PRODUCTS_SOLD,

    (SELECT SUM(Total_Amount)
     FROM Orders) AS TOTAL_SALES
FROM DUAL;