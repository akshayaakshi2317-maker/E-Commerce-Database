CREATE TABLE NykaaOrder (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount NUMBER(10,2),
    Order_Status VARCHAR2(20)
);

Table created

CREATE TABLE NykaaOrder_Item (
    Order_Item_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Product_ID NUMBER NOT NULL,
    Quantity NUMBER NOT NULL,
    Unit_Price NUMBER(10,2) NOT NULL
);

Table created

INSERT INTO NykaaOrder
VALUES (1001, 1, TO_DATE('18-09-2026','DD-MM-YYYY'), 2350.00, 'Delivered');

1 row created

INSERT INTO NykaaOrder
VALUES (1002, 2, TO_DATE('19-09-2026','DD-MM-YYYY'), 1200.00, 'Shipped');

1 row created

INSERT INTO NykaaOrder
VALUES (1003, 3, TO_DATE('20-09-2026','DD-MM-YYYY'), 1099.00, 'Processing');

1 row created

INSERT INTO NykaaOrder
VALUES (1004, 4, TO_DATE('21-09-2026','DD-MM-YYYY'), 999.00, 'Delivered');

1 row created

INSERT INTO NykaaOrder
VALUES (1005, 5, TO_DATE('22-09-2026','DD-MM-YYYY'), 850.00, 'Shipped');

1 row created

SELECT * FROM NykaaOrder;

INSERT INTO NykaaOrder_Item
VALUES (1, 1001, 101, 3, 550.00);

1 row created

INSERT INTO NykaaOrder_Item
VALUES (2, 1001, 102, 1, 700.00);

1 row created

INSERT INTO NykaaOrder_Item
VALUES (3, 1002, 103, 2, 600.00);

1 row created

INSERT INTO NykaaOrder_Item
VALUES (4, 1003, 104, 1, 1099.00);

1 row created

INSERT INTO NykaaOrder_Item
VALUES (5, 1004, 105, 1, 499.00);

1 row created

SELECT * FROM NykaaOrder_Item;

UPDATE NykaaOrder
SET Total_Amount = 2350.00
WHERE Order_ID = 1001;

1 row updated

SELECT Order_ID, Total_Amount
FROM NykaaOrder
WHERE Order_ID = 1001;

UPDATE NykaaOrder
SET Order_Date = TO_DATE('23-09-2026','DD-MM-YYYY')
WHERE Order_ID = 1002;

1 row updated

SELECT Order_ID, Order_Date
FROM NykaaOrder
WHERE Order_ID = 1002;

UPDATE NykaaOrder_Item
SET Quantity = 3
WHERE Order_Item_ID = 1;

1 row updated

SELECT *
FROM NykaaOrder_Item
WHERE Order_Item_ID = 1;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    oi.Product_ID,
    oi.Quantity,
    oi.Unit_Price,
    (oi.Quantity * oi.Unit_Price) AS Item_Total,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
JOIN NykaaOrder o
    ON c.Customer_ID = o.Customer_ID
JOIN NykaaOrder_Item oi
    ON o.Order_ID = oi.Order_ID
ORDER BY c.Customer_ID, o.Order_ID;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Amount
FROM Customer c
JOIN NykaaOrder o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name
ORDER BY c.Customer_ID;

COMMIT;











