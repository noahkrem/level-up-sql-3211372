-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

SELECT * FROM Customers
WHERE FirstName = 'Cleo'
  AND LastName = 'Goldwater';
-- Customer ID is 42

SELECT * FROM Dishes
WHERE Name = 'Quinoa Salmon Salad';
-- Dish ID is 9

UPDATE CustomersDishes
SET DishID = 9
WHERE CustomerID = 42;

UPDATE Customers
SET FavoriteDish = (SELECT DishID FROM Dishes WHERE Name = 'Quinoa Salmon Salad')
WHERE CustomerID = 42;

SELECT * FROM Customers
JOIN Dishes ON Customers.FavoriteDish = Dishes.DishID;

  