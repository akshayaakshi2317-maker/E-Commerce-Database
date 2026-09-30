CREATE TABLE Payment (
    Payment_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER,
    Payment_Method VARCHAR2(50),
    Payment_Date DATE,
    Payment_Status VARCHAR2(30),
    Payment_Amount NUMBER(10,2),
    FOREIGN KEY (Order_ID) REFERENCES NykaaOrder(Order_ID)
);

Table created

INSERT INTO Payment VALUES
(1, 1001, 'UPI', '20-SEP-2026', 'Paid', 2500.00);

1 row created

INSERT INTO Payment VALUES
(2, 1002, 'Credit Card', '21-SEP-2026', 'Paid', 1800.00);

1 row created

INSERT INTO Payment VALUES
(3, 1003, 'Debit Card', '22-SEP-2026', 'Failed', 3200.00);

1 row created

INSERT INTO Payment VALUES
(4, 1004, 'Cash on Delivery', '23-SEP-2026', 'Pending', 1500.00);

1 row created

INSERT INTO Payment VALUES
(5, 1005, 'UPI', '24-SEP-2026', 'Paid', 2200.00);

1 row created

COMMIT;

SELECT * FROM Payment;

SELECT *
FROM Payment
WHERE Payment_Status = 'Paid';

SELECT *
FROM Payment
WHERE Payment_Status = 'Failed';

UPDATE Payment
SET Payment_Status = 'Paid'
WHERE Payment_ID = 3;

1 row updated

COMMIT;

SELECT * FROM Payment;

SELECT Payment_Method,
       COUNT(*) AS Number_of_Transactions
FROM Payment
GROUP BY Payment_Method;

SELECT Payment_Method,
       SUM(Payment_Amount) AS Total_Amount_Collected
FROM Payment
WHERE Payment_Status = 'Paid'
GROUP BY Payment_Method;

SELECT
    p.Payment_ID,
    p.Order_ID,
    p.Payment_Method,
    p.Payment_Date,
    p.Payment_Status,
    p.Payment_Amount,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Payment p
JOIN NykaaOrder o
ON p.Order_ID = o.Order_ID
ORDER BY p.Payment_ID;