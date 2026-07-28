CREATE TABLE Cust3 ( 
    2 Customer_ID NUMBER PRIMARY KEY, 
    3 Customer_Name VARCHAR2(100), 
    4 Email VARCHAR2(100), 
    5 Phone_Number VARCHAR2(15), 
    6 Address VARCHAR2(200), 
    7 Password VARCHAR2(50) 
);
INSERT INTO CUST3 VALUES
(301, 'Anu', 'anu@gmail.com', '9876543210', 'Chennai', 'Anu@123');

INSERT INTO CUST3 VALUES
(302, 'Priya', 'priya@gmail.com', '9876543211', 'Coimbatore', 'Priya@123');

INSERT INTO CUST3 VALUES
(303, 'Divya', 'divya@gmail.com', '9876543212', 'Madurai', 'Divya@123');

INSERT INTO CUST3 VALUES
(304, 'Keerthana', 'keerthana@gmail.com', '9876543213', 'Salem', 'Keerthana@123');

INSERT INTO CUST3 VALUES
(305, 'Nisha', 'nisha@gmail.com', '9876543214', 'Trichy', 'Nisha@123');

INSERT INTO CUST3 VALUES
(306, 'Kavya', 'kavya@gmail.com', '9876543215', 'Vellore', 'Kavya@123');

INSERT INTO CUST3 VALUES
(307, 'Meena', 'meena@gmail.com', '9876543216', 'Erode', 'Meena@123');

INSERT INTO CUST3 VALUES
(308, 'Harini', 'harini@gmail.com', '9876543217', 'Tirunelveli', 'Harini@123');

INSERT INTO CUST3 VALUES
(309, 'Swathi', 'swathi@gmail.com', '9876543218', 'Thanjavur', 'Swathi@123');

INSERT INTO CUST3 VALUES
(310, 'Anitha', 'anitha@gmail.com', '9876543219', 'Kanchipuram', 'Anitha@123');

COMMIT;

INSERT INTO CUST3
VALUES (311, 'Rahul', 'rahul@gmail.com', '9876543220', 'Chennai', 'Rahul@123');

COMMIT;

SELECT * FROM CUST3
WHERE Customer_ID = 301;

UPDATE CUST3
SET Customer_Name = 'Sonakshi',
    Email = 'sonakshi@gmail.com'
WHERE Customer_ID = 307;

COMMIT;

DELETE FROM CUST3
WHERE Customer_ID = 311;

COMMIT;

SELECT * FROM CUST3;
