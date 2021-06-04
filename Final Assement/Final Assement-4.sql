SELECT OrderID, ShippedDate, 
(CHOOSE(MONTH(ShippedDate),'Winter', 'Winter', 'Spring', 'Spring', 'Spring', 
 'Summer', 'Summer', 'Summer', 'Autumn', 'Autumn', 'Autumn', 'Winter')) AS ShippedSeason
FROM Dbo.Orders
WHERE ShippedDate IS NOT NULL



SELECT CompanyName,
IIF(Fax IS NULL,'modern','outdated') AS Status
FROM Dbo.Suppliers



SELECT  c.country, sum(A.Quantity) as TotalQuantity
FROM dbo.[Order Details] as A
inner Join Orders as O on O.OrderID = A.OrderID
inner JOIN Customers C on C.CustomerID = O.CustomerID
group by 
    ROLLUP(country)
