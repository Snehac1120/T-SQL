-- Create Table
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(50),
    City VARCHAR(30),
    Product VARCHAR(50),
    Category VARCHAR(30),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    OrderDate DATE,
    PaymentMode VARCHAR(20)
);

INSERT INTO Orders (OrderID, CustomerName, City, Product, Category, Quantity, UnitPrice, OrderDate, PaymentMode)
VALUES
(101, 'Amit Sharma', 'Mumbai', 'Laptop', 'Electronics', 2, 55000.00, '2026-01-05', 'Credit Card'),
(102, 'Priya Patel', 'Ahmedabad', 'Smartphone', 'Electronics', 1, 28000.00, '2026-01-08', 'UPI'),
(103, 'Rahul Verma', 'Delhi', 'Office Chair', 'Furniture', 4, 4500.00, '2026-01-10', 'Cash'),
(104, 'Sneha Joshi', 'Pune', 'Headphones', 'Accessories', 3, 2500.00, '2026-01-12', 'Debit Card'),
(105, 'Karan Mehta', 'Surat', 'Refrigerator', 'Appliances', 1, 32000.00, '2026-01-15', 'Net Banking'),
(106, 'Neha Singh', 'Jaipur', 'Washing Machine', 'Appliances', 1, 27000.00, '2026-01-18', 'UPI'),
(107, 'Vikram Rao', 'Bengaluru', 'Keyboard', 'Accessories', 5, 1200.00, '2026-01-20', 'Credit Card'),
(108, 'Anjali Desai', 'Hyderabad', 'Dining Table', 'Furniture', 1, 18000.00, '2026-01-22', 'Debit Card'),
(109, 'Rohan Kapoor', 'Chennai', 'Tablet', 'Electronics', 2, 22000.00, '2026-01-25', 'Cash'),
(110, 'Meera Nair', 'Kochi', 'Microwave Oven', 'Appliances', 1, 9500.00, '2026-01-28', 'Net Banking');

--1. Display the Top 5 customers who purchased the highest total quantity.
SELECT TOP 5 * FROM ORDERS
ORDER BY Quantity;

--2. Display the Top 3 cities having the maximum number of orders.  
SELECT TOP 3 CITY,COUNT(QUANTITY)  FROM ORDERS
GROUP BY CITY
ORDER BY COUNT(QUANTITY) DESC;

--3. Display the Top 10 products having the highest total revenue.
SELECT TOP 10 PRODUCT,MAX(QUANTITY*UNITPRICE) FROM ORDERS
GROUP BY PRODUCT
ORDER BY MAX(QUANTITY*UNITPRICE) DESC;

--4. Display the Top 5 categories having the highest average unit price. 
SELECT TOP 5 CATEGORY,AVG(UNITPRICE) FROM ORDERS
GROUP BY CATEGORY
ORDER BY AVG(UNITPRICE) DESC;

--5. Display the Top 3 payment modes used most frequently. 
SELECT TOP 3 PAYMENTMODE,COUNT(PAYMENTMODE) FROM ORDERS
GROUP BY PAYMENTMODE
ORDER BY COUNT(PAYMENTMODE) DESC;

--6. Display cities where the total revenue is greater than ₹5,00,000.
SELECT CITY FROM ORDERS
WHERE (QUANTITY*UNITPRICE) > 500000
GROUP BY CITY;

--7. Display categories where the average quantity is greater than 5. 

--8. Display customers who placed at least 5 orders.  
--9. Display products sold in more than 3 cities.  
--10. Display customers who purchased products from more than 2 categories.  
--11. Display cities having more than 10 distinct customers.  
--12. Display payment modes having more than 100 total quantities sold.  
--13. Display the Top 10 products based on the highest average unit price.  
--14. Display categories where the maximum unit price is greater than ₹50,000.  
--15. Display cities where the minimum unit price is less than ₹5,000.  
--16. Display customers whose maximum purchase quantity is greater than 10.  
--17. Display the Top 5 customers having the highest average unit price. 
--18. Display the Top 10 products sold in the highest total quantity. 
--19. Display categories whose total revenue is greater than ₹5,00,000.  
--20. Display the Top 5 cities having the highest average revenue per order.  
--21. Display customers who purchased more than 10 distinct products.  
--22. Display categories having at least 5 diAerent products.  
--23. Display payment modes having more than 5 distinct customers.  
--24. Display cities where both the total quantity sold is greater than 100 and the 
--average unit price is greater than ₹20,000.  
--25. Display the Top 10 customers based on:  
--			Highest total revenue  
--		 If revenue is the same, higher total quantity  
--		 If quantity is also the same, sort alphabetically by customer name.