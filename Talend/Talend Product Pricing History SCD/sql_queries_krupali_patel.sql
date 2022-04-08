--1 - a. How many rows in target table?
select count(*) as TotalRows from [dbo].[ProductCostHistorySCD]


--2 - b. How many unique products are being tracked?
select count (distinct(ProductID)) Total_unique_products_tracked from  [dbo].[ProductCostHistorySCD]


--3 - c. How many products have more than 1 price?
select count(t) as ProductsWithMoreThan1Price from 
(
	select ProductID, count(DIStinct(ProductID)) as t from [dbo].[ProductCostHistorySCD] 
	group by ProductID
	having COUNT(ProductID)>1 
) as CountProducts;



--4 - d. What is the list of current product prices? (list product, price, start date of that price and what price version) 
select ProductName, StandardCost as CurrentProductPrice, scd_start as StartDate, scd_version as PriceVersion 
from [dbo].[ProductCostHistorySCD] 
where scd_active = '1'


--5 - e. What is the product(s) with the maximum price? (list product, price, start date of that price and what price version) 
SELECT ProductName as 'Product', StandardCost as 'Price', scd_start as 'Start Date', scd_version as 'Price Version'
FROM  [dbo].[ProductCostHistorySCD] 
where StandardCost = (SELECT Max(StandardCost) FROM  [dbo].[ProductCostHistorySCD])


--6 - f. What is the product(s) with the minimum price? (list product, price, start date of that price and what price version) 
SELECT ProductName as 'Product', StandardCost as 'Price', scd_start as 'Start Date', scd_version as 'Price Version'
FROM  [dbo].[ProductCostHistorySCD] 
where StandardCost = (SELECT Min(StandardCost) FROM  [dbo].[ProductCostHistorySCD])


--7 - g. What is the price history for “HL Road Frame - Red, 62”? 
select ProductName, StandardCost, scd_start,scd_version from [dbo].[ProductCostHistorySCD] 
where productname= 'HL Road Frame - Red, 62' 



--8 - h. How many products had a price change in 2020? 
select count(*) as NumberOfRecordsWithPriceChangeIn2020 
from dbo.ProductCostHistorySCD 
where scd_version != 1 and YEAR(scd_start)=2020










