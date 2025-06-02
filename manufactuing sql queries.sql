create database MFD;
select* from `manufacturing data`;

------ #1-------
SELECT 
    Buyer, 
    "Cust Code", 
    "Cust Name", 
    "Doc Date", 
    "Doc Num", 
    "Manufactured Qty" 
FROM `manufacturing data`;

---- #2-----
SELECT 
    Buyer, 
    "Cust Code", 
    "Cust Name", 
    "Doc Date", 
    "Doc Num", 
    "Rejected Qty" 
FROM `manufacturing data`;

----- #3 ----
SELECT 
    Buyer, 
    "Cust Code", 
    "Cust Name", 
    "Doc Date", 
    "Doc Num", 
    "Processed Qty" 
FROM `manufacturing data`;

----- #4 ----
SELECT 
    Buyer, 
    "Cust Code", 
    "Cust Name", 
    "Doc Date", 
    "Doc Num", 
    "Processed Qty", 
    "Manufactured Qty", 
    "Rejected Qty", 
    ("Processed Qty" - ("Manufactured Qty" + "Rejected Qty")) AS "Wastage Qty"
FROM `manufacturing data`;

---- #5---
SELECT 
    "Emp Name", 
    "EMP Code", 
    SUM("Rejected Qty") AS "Total Rejected Qty"
FROM `manufacturing data`
GROUP BY "Emp Name", "EMP Code"
ORDER BY "Total Rejected Qty" DESC;

---- #6----
SELECT 
    "Machine Name", 
    "Machine Code", 
    SUM("Rejected Qty") AS "Total Rejected Qty"
FROM `manufacturing data`
GROUP BY "Machine Name", "Machine Code"
ORDER BY "Total Rejected Qty" DESC;

----#7----
SELECT 
    YEAR("Doc Date") AS "Year",
    MONTH("Doc Date") AS "Month",
    SUM("Manufactured Qty") AS "Total Manufactured Qty",
    SUM("Rejected Qty") AS "Total Rejected Qty"
FROM `manufacturing data`
GROUP BY YEAR("Doc Date"), MONTH("Doc Date")
ORDER BY "Year" DESC, "Month" DESC;

----#8----
SELECT 
    SUM("Manufactured Qty") AS "Total Manufactured Qty",
    SUM("Rejected Qty") AS "Total Rejected Qty",
    ROUND((SUM("Rejected Qty") * 100.0) / NULLIF(SUM("Manufactured Qty"), 0), 2) AS "Rejection Percentage"
FROM `manufacturing data`;

---- #9----
SELECT 
    "Department", 
    SUM("Manufactured Qty") AS "Total Manufactured Qty", 
    SUM("Rejected Qty") AS "Total Rejected Qty", 
    ROUND((SUM("Rejected Qty") * 100.0) / NULLIF(SUM("Manufactured Qty"), 0), 2) AS "Rejection Percentage"
FROM `manufacturing data`
GROUP BY "Department"
ORDER BY "Rejection Percentage" DESC;

---- #10----
SELECT 
    "Emp Name", 
    "EMP Code",
    SUM("Rejected Qty") AS "Total Rejected Qty"
FROM `manufacturing data`
GROUP BY "Emp Name", "EMP Code"
ORDER BY "Total Rejected Qty" DESC;
