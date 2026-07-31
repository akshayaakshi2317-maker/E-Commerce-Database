CREATE TABLE CUST5 (
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(100),
    Email VARCHAR2(100),
    Phone_Number VARCHAR2(15),
    Address VARCHAR2(200),
    Password VARCHAR2(50)
);
INSERT INTO CUST5 VALUES
(501, 'Anu', 'anu@gmail.com', '9876543210', 'Chennai', 'Anu@123');

INSERT INTO CUST5 VALUES
(502, 'Priya', 'priya@gmail.com', '9876543211', 'Coimbatore', 'Priya@123');

INSERT INTO CUST5 VALUES
(503, 'Divya', 'divya@gmail.com', '9876543212', 'Madurai', 'Divya@123');

INSERT INTO CUST5 VALUES
(504, 'Keerthana', 'keerthana@gmail.com', '9876543213', 'Salem', 'Keerthana@123');

INSERT INTO CUST5 VALUES
(505, 'Nisha', 'nisha@gmail.com', '9876543214', 'Trichy', 'Nisha@123');

INSERT INTO CUST5 VALUES
(506, 'Kavya', 'kavya@gmail.com', '9876543215', 'Vellore', 'Kavya@123');

INSERT INTO CUST5 VALUES
(507, 'Meena', 'meena@gmail.com', '9876543216', 'Erode', 'Meena@123');

INSERT INTO CUST5 VALUES
(508, 'Harini', 'harini@gmail.com', '9876543217', 'Tirunelveli', 'Harini@123');

INSERT INTO CUST5 VALUES
(509, 'Swathi', 'swathi@gmail.com', '9876543218', 'Thanjavur', 'Swathi@123');

INSERT INTO CUST5 VALUES
(510, 'Anitha', 'anitha@gmail.com', '9876543219', 'Kanchipuram', 'Anitha@123');

COMMIT;

SELECT * FROM CUST5;

INSERT INTO CUST5
VALUES (511, 'Rahul', 'rahul@gmail.com', '9876543220', 'Chennai', 'Rahul@123');

COMMIT;

SELECT * FROM CUST5
WHERE Customer_ID = 501;

UPDATE CUST5
SET Customer_Name = 'Sonakshi',
    Email = 'sonakshi@gmail.com'
WHERE Customer_ID = 507;

COMMIT;

DELETE FROM CUST5
WHERE Customer_ID = 511;

COMMIT;