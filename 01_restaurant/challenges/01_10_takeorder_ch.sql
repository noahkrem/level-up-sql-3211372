-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.


INSERT INTO Orders
  (CustomerID, OrderDate)
VALUES (
  (SELECT 
    CustomerID
  FROM Customers
  WHERE FirstName = 'Loretta'
    AND LastName = 'Hundey'),
  '2022-09-20 ' );

SELECT *
FROM Orders O
JOIN Customers C ON C.CustomerID = O.CustomerID
WHERE FirstName = 'Loretta'
  AND LastName = 'Hundey';

INSERT INTO OrdersDishes 
  (OrderID, DishID)
VALUES
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'Mini Cheeseburgers')),
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'Tropical Blue Smoothie'));

SELECT
  SUM(D.Price)
FROM Dishes D
JOIN OrdersDishes OD ON OD.DishID = D.DishID
WHERE OD.OrderID = 1001;