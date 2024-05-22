-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT
  C.FirstName,
  C.LastName,
  C.Email,
  O.CustomerID,
  COUNT(O.OrderID) OrderCount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY O.CustomerID
ORDER BY OrderCount DESC
LIMIT 20;