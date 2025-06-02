create database car_used;
select* from used_car_dataset;

----- #1----
SELECT Age, AVG(AskPrice) AS AveragePrice
FROM used_car_dataset
GROUP BY Age
ORDER BY Age;

---#2------
SELECT 
    Age, 
    AVG(kmDriven) AS AverageKmDriven
FROM 
    used_car_dataset
GROUP BY 
    Age
ORDER BY 
    Age;

---#3-----
SELECT model, AVG(kmDriven) AS AverageKmDriven
FROM used_car_dataset
GROUP BY model
ORDER BY AverageKmDriven DESC;

---#4-----
SELECT model, COUNT(*) AS ListingsCount
FROM used_car_dataset
GROUP BY model
ORDER BY ListingsCount DESC
LIMIT 5;

---#5-----
SELECT Owner, AVG(AskPrice) AS AveragePrice
FROM used_car_dataset
GROUP BY Owner
ORDER BY AveragePrice DESC;

----#6----
SELECT model, Age, AVG(AskPrice) AS AveragePrice
FROM used_car_dataset
GROUP BY model, Age
ORDER BY model, Age;

---- #6----
SELECT FuelType, COUNT(*) AS FuelCount
FROM used_car_dataset
GROUP BY FuelType
ORDER BY FuelCount DESC;

--- #7----
SELECT model, COUNT(*) AS TotalListings
FROM used_car_dataset
GROUP BY model
ORDER BY TotalListings DESC;

---- #8-----
SELECT model, COUNT(*) AS TotalListings
FROM used_car_dataset
GROUP BY model
ORDER BY TotalListings DESC;

