CREATE DATABASE IF NOT EXISTS optica;

USE optica;

CREATE TABLE Address (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  street VARCHAR(30) NULL,
  house_number INT NULL,
  floor VARCHAR(30) NULL,
  door VARCHAR(11) NULL,
  city VARCHAR(30) NOT NULL,
  postal_code VARCHAR(30) NOT NULL,
  country VARCHAR(30) NOT NULL
);

CREATE TABLE Suppliers (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  address_id INT NOT NULL,
  phone VARCHAR(30) NOT NULL,
  fax VARCHAR(30) NOT NULL,
  nif VARCHAR(30) NOT NULL,
  FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  address_id INT NOT NULL,
  phone VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL,
  registration_date DATE NOT NULL,
  referred_by INT NULL,
  FOREIGN KEY (address_id) REFERENCES Address(address_id),
  FOREIGN KEY (referred_by) REFERENCES Customers(customer_id)
);

CREATE TABLE Employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE Brands (
  brand_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE Glasses (
  glasses_id INT AUTO_INCREMENT PRIMARY KEY,
  brand_id INT NOT NULL,
  supplier_id INT NOT NULL,
  graduation VARCHAR(11) NOT NULL,
  frame_type VARCHAR(30) NOT NULL,
  frame_color VARCHAR(30) NOT NULL,
  lens_color VARCHAR(30) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (brand_id) REFERENCES Brands(brand_id),
  FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Sales (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  customer_id INT NOT NULL,
  glasses_id INT NOT NULL,
  sale_date DATE NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (glasses_id) REFERENCES Glasses(glasses_id)
);

