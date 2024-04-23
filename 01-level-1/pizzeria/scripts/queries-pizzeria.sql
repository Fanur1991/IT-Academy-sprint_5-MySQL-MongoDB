USE pizzeria;

-- Query to count the quantity of "Drink" type products sold in Rome
SELECT SUM(oi.quantity) AS total_drinks_sold
FROM Order_items AS oi
JOIN Products AS p ON oi.product_id = p.product_id
JOIN Orders AS o ON oi.order_id = o.order_id
JOIN Deliveries AS d ON o.order_id = d.order_id
JOIN Employees AS e ON d.employee_id = e.employee_id
JOIN Stores AS s ON e.store_id = s.store_id
JOIN Address AS a ON s.address_id = a.address_id
WHERE p.category_id = 6 AND a.city = 'Rome';


-- Query to see sales made by a specific employee (e.g., employee_id = 5)
SELECT e.employee_id, e.first_name, e.last_name, COUNT(o.order_id) AS total_orders
FROM Orders AS o
JOIN Employees AS e ON o.employee_id = e.employee_id
WHERE e.employee_id = 5
GROUP BY e.employee_id, e.first_name, e.last_name;

