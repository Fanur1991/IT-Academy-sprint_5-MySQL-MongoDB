USE optica;

INSERT INTO Address (street, house_number, floor, door, city, postal_code, country) VALUES
('Liberty Ave', 1500, 2, 12, 'New York', '10007', 'USA'),
('Kingsway', 47, NULL, 'B', 'London', 'WC2B 6AA', 'UK'),
('Lenina', 15, NULL, NULL, 'Moscow', '101000', 'Russia'),
('Gran Via', 39, 4, '2B', 'Madrid', '28013', 'Spain'),
('Champs-Élysées', 102, 2, NULL, 'Paris', '75008', 'France'),
('Schildergasse', 72, NULL, NULL, 'Cologne', '50667', 'Germany'),
('Nevsky Prospekt', 28, 3, '12A', 'Saint Petersburg', '191186', 'Russia');

INSERT INTO Suppliers (name, address_id, phone, fax, nif) VALUES 
('Optics World Inc', 1, '12125550101', '12125550102', 'US123456789'),
('Vision & Beyond', 2, '442071833001', '442071833002', 'GB987654321'),
('Lens Crafters LLC', 3, '74951234567', '74957654321', 'RU123456789'),
('Madrid Optics S.L.', 4, '34911234567', '34917654321', 'ES123456789'),
('Parisian Views SARL', 5, '33140345678', '33140765432', 'FR123456789'),
('Köln Lenses GmbH', 6, '492213456789', '492217654321', 'DE123456789'),
('St. Pete Optics', 7, '78121234567', '78127654321', 'RU987654321');

INSERT INTO Customers (name, address_id, phone, email, registration_date, referred_by) VALUES
('John Doe', 5, '16465551234', 'johndoe@example.com', '2023-01-15', NULL),
('Emma Smith', 4, '447795123456', 'emmasmith@example.co.uk', '2023-02-20', NULL),
('Ivan Petrov', 3, '79161234567', 'ivanpetrov@example.ru', '2023-03-05', 1),
('Alicia Gonzalez', 2, '34656123456', 'aliciagonzalez@example.es', '2023-04-18', 2),
('Claire Dubois', 6, '33142345678', 'claredubois@example.fr', '2023-01-28', NULL),
('Lukas Müller', 7, '4915212345678', 'lukasmuller@example.de', '2023-03-15', 1),
('Maria Ivanova', 1, '78126543234', 'mariaivanova@example.ru', '2023-04-10', 3);

INSERT INTO Employees (name) VALUES 
('Elena Rodriguez'),
('James Wilson'),
('Sophia Chen'),
('Anastasia Smirnova'),
('Carlos García'),
('Sarah Johnson');

INSERT INTO Brands (name) VALUES 
('Ray-Ban'),
('Oakley'),
('Gucci'),
('Prada'),
('Versace'),
('Burberry'),
('Armani'),
('Vogue'),
('Polaroid'),
('Saint Laurent');

INSERT INTO Glasses (brand_id, supplier_id, graduation, frame_type, frame_color, lens_color, price) VALUES
(1, 1, '1.5', 'metal', 'black', 'clear', 120.00),
(2, 1, '2.0', 'metal', 'silver', 'blue', 150.00),
(3, 2, '0.5', 'plastic', 'red', 'clear', 100.00),
(4, 3, '1.75', 'plastic', 'black', 'green', 175.00),
(5, 4, '2.25', 'metal', 'gold', 'clear', 200.00),
(6, 5, '1.25', 'plastic', 'blue', 'brown', 90.00),
(7, 6, '2.5', 'metal', 'bronze', 'clear', 220.00),
(8, 7, '1.0', 'plastic', 'green', 'clear', 80.00),
(9, 7, '0.75', 'metal', 'grey', 'blue', 160.00),
(10, 6, '2.0', 'plastic', 'purple', 'clear', 130.00);

INSERT INTO Sales (employee_id, customer_id, glasses_id, sale_date) VALUES
(1, 1, 1, '2023-04-01'),
(2, 2, 3, '2023-04-02'),
(3, 3, 5, '2023-04-03'),
(4, 4, 7, '2023-04-04'),
(5, 5, 9, '2023-04-05'),
(6, 6, 2, '2023-04-06'),
(1, 7, 4, '2023-04-07'),
(2, 1, 6, '2023-04-08'),
(3, 2, 8, '2023-04-09'),
(4, 3, 10, '2023-04-10');