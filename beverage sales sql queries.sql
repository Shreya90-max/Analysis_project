create database beverage_sales_data;
select* from beverage_sales_data;


---#1---
SELECT 
    Category,
    SUM(Total_Price) AS Total_Revenue
FROM 
    beverage_sales_data
GROUP BY 
    Category
ORDER BY 
    Total_Revenue DESC;
    
    ---#2----
    SELECT 
    Region,
    SUM(Total_Price) AS Total_Revenue
FROM 
    beverage_sales_data
GROUP BY 
    Region
ORDER BY 
    Total_Revenue DESC;
    
    ---#3---
    SELECT 
    Product, 
    SUM(Quantity) AS Total_Quantity_Sold
FROM 
    beverage_sales_data
GROUP BY 
    Product
ORDER BY 
    Total_Quantity_Sold DESC;
    
    ---#4----
    SELECT 
    Order_ID, 
    Customer_ID, 
    Region, 
    Total_Price
FROM 
    beverage_sales_data
WHERE 
    Total_Price > 500
ORDER BY 
    Total_Price DESC;
    
    ---#5-----
    SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%d-%m-%Y'), '%Y-%m') AS Month,
    SUM(Total_Price) AS Total_Revenue
FROM 
    beverage_sales_data
GROUP BY 
    Month
ORDER BY 
    Month ASC;
    
    ---#6----
    SELECT 
    Customer_Type, 
    AVG(Discount) AS Average_Discount
FROM 
    beverage_sales_data
GROUP BY 
    Customer_Type
ORDER BY 
    Average_Discount DESC;
    
    ----#7----
    SELECT 
    Region, 
    Product, 
    SUM(Quantity) AS Total_Quantity_Sold
FROM 
    beverage_sales_data
GROUP BY 
    Region, Product
ORDER BY 
    Region ASC, Total_Quantity_Sold DESC;






