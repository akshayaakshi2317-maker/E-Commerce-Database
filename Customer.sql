CREATE TABLE CUST (
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(100),
    Email VARCHAR2(100),
    Phone_Number VARCHAR2(15),
    Address VARCHAR2(200),
    Password VARCHAR2(50)
);
INSERT INTO CUST VALUES
(201, 'Rahul', 'rahul@gmail.com', '9123456781', 'Chennai', 'Rahul@123');
INSERT INTO CUST VALUES
(202, 'Sneha', 'sneha@gmail.com', '9123456782', 'Coimbatore', 'Sneha@123');
INSERT INTO CUST VALUES
(203, 'Arun', 'arun@gmail.com', '9123456783', 'Madurai', 'Arun@123');
INSERT INTO CUST VALUES
(204, 'Meena', 'meena@gmail.com', '9123456784', 'Salem', 'Meena@123');
INSERT INTO CUST VALUES
(205, 'Karthik', 'karthik@gmail.com', '9123456785', 'Trichy', 'Karthik@123');
INSERT INTO CUST VALUES
(206, 'Aishwarya', 'aishwarya@gmail.com', '9123456786', 'Erode', 'Aishu@123');
INSERT INTO CUST VALUES
(207, 'Vignesh', 'vignesh@gmail.com', '9123456787', 'Vellore', 'Vignesh@123');
INSERT INTO CUST VALUES
(208, 'Deepika', 'deepika@gmail.com', '9123456788', 'Thanjavur', 'Deepika@123');
INSERT INTO CUST VALUES
(209, 'Sanjay', 'sanjay@gmail.com', '9123456789', 'Tirunelveli', 'Sanjay@123');
INSERT INTO CUST VALUES
(210, 'Thaarisha', 'thaarisha@gmail.com', '9123456790', 'Chengalpattu', 'Thaarisha@123');
COMMIT;
SELECT * FROM CUST;
UPDATE CUST
SET Address = 'Bangalore'
WHERE Customer_ID = 210;
COMMIT;

SELECT * FROM CUST;
DELETE FROM CUST
WHERE Customer_ID = 210;

COMMIT;

SELECT * FROM CUST;