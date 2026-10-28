SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
INNER JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

SELECT
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    p.Payment_Mode,
    p.Payment_Amount,
    p.Payment_Status
FROM Orders o
INNER JOIN Payment p
ON o.Order_ID = p.Order_ID;

SELECT
    p.Product_ID,
    p.Product_Name,
    od.Order_ID,
    od.Quantity,
    od.Unit_Price,
    od.Subtotal
FROM Product p
INNER JOIN Order_Details od
ON p.Product_ID = od.Product_ID;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
RIGHT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    p.Product_ID,
    p.Product_Name,
    od.Quantity,
    od.Unit_Price,
    od.Subtotal,
    py.Payment_Mode,
    py.Payment_Amount,
    py.Payment_Status
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
INNER JOIN Product p
    ON od.Product_ID = p.Product_ID
INNER JOIN Payment py
    ON o.Order_ID = py.Order_ID
ORDER BY o.Order_Date DESC;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    p.Product_Name,
    od.Quantity,
    od.Subtotal
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
INNER JOIN Product p
    ON od.Product_ID = p.Product_ID
ORDER BY c.Customer_ID, o.Order_Date;

SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    p.Product_Name,
    od.Quantity,
    od.Subtotal,
    py.Payment_Mode,
    py.Payment_Amount,
    py.Payment_Status
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
INNER JOIN Product p
    ON od.Product_ID = p.Product_ID
INNER JOIN Payment py
    ON o.Order_ID = py.Order_ID
ORDER BY c.Customer_Name, o.Order_Date;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders,
    NVL(SUM(od.Quantity), 0) AS Total_Quantity,
    NVL(SUM(od.Subtotal), 0) AS Total_Sales
FROM Customer c
LEFT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
LEFT JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Sales DESC;

SELECT
    py.Payment_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    py.Payment_Mode,
    py.Payment_Amount,
    py.Payment_Status
FROM Payment py
INNER JOIN Orders o
    ON py.Order_ID = o.Order_ID
INNER JOIN Customer c
    ON o.Customer_ID = c.Customer_ID
ORDER BY py.Payment_ID;