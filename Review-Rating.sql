CREATE TABLE Review (
    Review_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Product_ID NUMBER,
    Rating NUMBER(1),
    Review_Text VARCHAR2(500),
    Review_Date DATE
);

table created

CREATE TABLE Rating (
    Rating_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Product_ID NUMBER,
    Rating_Value NUMBER(1),
    Rating_Date DATE
);

table created

INSERT INTO Review VALUES
(1, 101, 201, 5, 'Excellent product', DATE '2026-09-01');

1 row created

INSERT INTO Review VALUES
(2, 102, 202, 4, 'Very good quality', DATE '2026-09-02');

1 row created

INSERT INTO Review VALUES
(3, 103, 203, 3, 'Average product', DATE '2026-09-03');

1 row created

INSERT INTO Review VALUES
(4, 104, 201, 5, 'Very useful product', DATE '2026-09-04');

1 row created

INSERT INTO Review VALUES
(5, 105, 204, 4, 'Good product', DATE '2026-09-05');

1 row created

COMMIT;

INSERT INTO Rating VALUES
(1, 101, 201, 5, DATE '2026-09-01');

1 row created

INSERT INTO Rating VALUES
(2, 102, 202, 4, DATE '2026-09-02');

1 row created

INSERT INTO Rating VALUES
(3, 103, 203, 3, DATE '2026-09-03');

1 row created

INSERT INTO Rating VALUES
(4, 104, 201, 5, DATE '2026-09-04');

1 row created

INSERT INTO Rating VALUES
(5, 105, 204, 4, DATE '2026-09-05');

1 row created

COMMIT;

SELECT
    Review_ID,
    Customer_ID,
    Product_ID,
    Rating,
    Review_Text,
    Review_Date
FROM Review
ORDER BY Review_ID;

SELECT
    Product_ID,
    AVG(Rating_Value) AS Average_Rating
FROM Rating
GROUP BY Product_ID;

SELECT
    Product_ID,
    AVG(Rating_Value) AS Average_Rating
FROM Rating
GROUP BY Product_ID
HAVING AVG(Rating_Value) >= 4;

SELECT
    r.Product_ID,
    COUNT(rt.Rating_ID) AS Total_Ratings,
    AVG(rt.Rating_Value) AS Average_Rating,
    MAX(rt.Rating_Value) AS Highest_Rating,
    MIN(rt.Rating_Value) AS Lowest_Rating
FROM Review r
JOIN Rating rt
ON r.Product_ID = rt.Product_ID
GROUP BY r.Product_ID
ORDER BY Average_Rating DESC;