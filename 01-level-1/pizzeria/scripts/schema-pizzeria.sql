CREATE DATABASE IF NOT EXISTS pizzeria;

USE pizzeria;

CREATE TABLE Address (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  street VARCHAR(30) NULL,
  house_number INT NULL,
  floor VARCHAR(30) NULL,
  door VARCHAR(11) NULL,
  postal_code VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  province VARCHAR(30) NOT NULL
);

CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NULL,
  phone VARCHAR(30) NOT NULL,
  address_id INT NOT NULL,
  FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Stores (
  store_id INT AUTO_INCREMENT PRIMARY KEY,
  address_id INT NOT NULL,
  FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Roles (
  role_id INT AUTO_INCREMENT PRIMARY KEY,
  role_name VARCHAR(30) NOT NULL
);

CREATE TABLE Employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NULL,
  nif VARCHAR(30) NOT NULL,
  phone VARCHAR(30) NOT NULL,
  store_id INT NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (store_id) REFERENCES Stores(store_id),
  FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  delivery_type VARCHAR(11) NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Deliveries (
  delivery_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  employee_id INT NOT NULL,
  delivery_time DATE NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(30) NOT NULL
);

CREATE TABLE Products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT NOT NULL,
  image_url VARCHAR(2048) NULL,
  price DECIMAL(10, 2) NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  subtotal_price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);