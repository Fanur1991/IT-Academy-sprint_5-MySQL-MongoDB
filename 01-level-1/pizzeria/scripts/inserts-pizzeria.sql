USE pizzeria;

INSERT INTO Address (street, house_number, floor, door, postal_code, city, province) VALUES
('Via Roma', 10, NULL, NULL, '00184', 'Milan', 'Lazio'),
('Viale Michelangelo', 23, 3, '2A', '50121', 'Rome', 'Tuscany'),
('Corso Vittorio Emanuele II', 78, 4, NULL, '20122', 'Catania', 'Lombardy'),
('Via San Francesco', 12, 1, '1B', '35121', 'Genoa', 'Veneto'),
('Via Garibaldi', 55, NULL, NULL, '10122', 'Rome', 'Piedmont'),
('Piazza del Campo', 45, 2, '3C', '53100', 'Catania', 'Tuscany'),
('Via Partenope', 150, NULL, NULL, '80121', 'Rome', 'Campania'),
('Piazzale Loreto', 3, NULL, NULL, '20131', 'Milan', 'Lombardy'),
('Via Toledo', 156, NULL, NULL, '80134', 'Naples', 'Campania'),
('Viale Regina Margherita', 47, NULL, NULL, '00198', 'Rome', 'Lazio'),
('Via XX Settembre', 40, NULL, NULL, '16121', 'Genoa', 'Liguria'),
('Viale Trastevere', 60, NULL, NULL, '00153', 'Rome', 'Lazio'),
('Corso Italia', 22, NULL, NULL, '95129', 'Catania', 'Sicily');

INSERT INTO Customers (first_name, last_name, phone, address_id) VALUES
('Marco', 'Marino', '3201234567', 1),
('Giovanni', 'Verdi', '3212345678', 2),
('Carla', 'Bruni', '3223456789', 3),
('Davide', 'Silva', '3234567890', 4),
('Chiara', 'Conti', '3245678901', 5),
('Lorenzo', 'Galli', '3256789012', 6),
('Sergio', 'Costa', '3267890123', 7);

INSERT INTO Stores (address_id) VALUES
(8), (9), (10), (11), (12), (13);

INSERT INTO Roles (role_name) VALUES
('Manager'), ('Chef'), ('Pizza Maker'), ('Cashier'), ('Waiter'), ('Delivery Driver');

INSERT INTO Employees (store_id, first_name, last_name, nif, phone, role_id) VALUES
(1, 'Luca', 'Rossi', 'XT123456A', '3201234567', 4),
(2, 'Giulia', 'Bianchi', 'XT123456B', '3201234568', 4),
(3, 'Matteo', 'Ricci', 'XT123456C', '3201234569', 5),
(4, 'Sofia', 'Ferrari', 'XT123456D', '3201234570', 5),
(5, 'Alessandro', 'Romano', 'XT123456E', '3201234571', 6),
(6, 'Francesca', 'Colombo', 'XT123456F', '3201234572', 6);

INSERT INTO Orders (employee_id, customer_id, order_date, delivery_type, total_price) VALUES
(1, 1, CURDATE(), 'Pickup', 10.00),
(5, 2, CURDATE(), 'Delivery', 35.00),
(6, 3, CURDATE(), 'Delivery', 23.50),
(4, 4, CURDATE(), 'Pickup', 39.08),
(5, 5, CURDATE(), 'Delivery', 14.50),
(6, 6, CURDATE(), 'Delivery', 14.50),
(4, 7, CURDATE(), 'Pickup', 38.00);

INSERT INTO Deliveries (order_id, employee_id, delivery_time) VALUES
(2, 5, NOW()),
(3, 6, NOW()),
(5, 5, NOW()),
(6, 6, NOW());

INSERT INTO Categories (category_name) VALUES
('Traditional'), ('Gourmet'), ('Vegetarian'), ('Meat Lover'), ('Seafood'), ('Drinks');

INSERT INTO Products (name, description, image_url, price, category_id) VALUES
('Margherita', 'Traditional pizza with tomatoes and mozzarella cheese', '/images/margherita.jpg', 7.50, 1),
('Capricciosa', 'A classic Italian favourite with artichokes, ham, and olives', '/images/capricciosa.jpg', 9.00, 1),
('Diavola', 'Spicy salami with a fiery tomato sauce and mozzarella cheese', '/images/diavola.jpg', 8.50, 2),
('Quattro Formaggi', 'Four cheese pizza with gorgonzola, mozzarella, parmesan, and pecorino', '/images/quattro_formaggi.jpg', 10.00, 3),
('Frutti di Mare', 'Seafood pizza with fresh shrimp, mussels, and calamari', '/images/frutti_di_mare.jpg', 12.00, 5),
('Coca Cola', 'Classic Coca Cola in a can', '/images/coca_cola.jpg', 2.50, 6),
('Italian Red Wine', 'Fine red wine from Tuscany', '/images/red_wine.jpg', 5.00, 6),
('Mineral Water', 'Natural Italian mineral water', '/images/mineral_water.jpg', 1.50, 6),
('Espresso', 'Authentic Italian espresso coffee', '/images/espresso.jpg', 1.80, 6),
('Lemonade', 'Freshly squeezed lemonade', '/images/lemonade.jpg', 3.00, 6);

INSERT INTO Order_items (order_id, product_id, quantity, subtotal_price) VALUES
(4, 2, 2, 19.00),   -- 2 Capricciosa
(5, 3, 1, 8.50),    -- 1 Diavola
(2, 1, 2, 15.00),   -- 2 Margherita
(6, 5, 1, 12.00),   -- 1 Frutti di Mare
(3, 4, 1, 10.00),   -- 1 Quattro Formaggi
(7, 2, 2, 19.00),   -- 2 Capricciosa
(1, 6, 2, 5.00),    -- 2 Coca Cola
(2, 7, 1, 5.00),    -- 1 Italian Red Wine
(3, 8, 3, 4.50),    -- 3 Mineral Water
(4, 9, 1, 1.80),    -- 1 Espresso
(5, 10, 2, 6.00),   -- 2 Lemonade
(6, 6, 1, 2.50);    -- 1 Coca Cola