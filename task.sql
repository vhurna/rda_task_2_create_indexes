CREATE DATABASE IF NOT EXISTS ShopDB;

USE ShopDB;

CREATE TABLE IF NOT EXISTS Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(100),
    Price DECIMAL(10, 2),
    WarehouseAmount INT
);

CREATE TABLE IF NOT EXISTS Customers (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Orders (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,  
    Date DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID) ON DELETE CASCADE  
);

CREATE TABLE IF NOT EXISTS OrderItems (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,  
    ProductID INT NOT NULL,  
    FOREIGN KEY (OrderID) REFERENCES Orders(ID) ON DELETE CASCADE,  
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE  
);

CREATE INDEX idx_email ON Customers(Email);  
CREATE INDEX idx_name ON Products(Name);      
CREATE INDEX idx_customer_id ON Orders(CustomerID);  
CREATE INDEX idx_order_id ON OrderItems(OrderID);     
CREATE INDEX idx_product_id ON OrderItems(ProductID); 
