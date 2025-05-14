CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

CREATE TABLE Suppliers (
    SupplierName VARCHAR(50) PRIMARY KEY,
    SupplierPhone VARCHAR(20)
);

INSERT INTO Suppliers (SupplierName, SupplierPhone) VALUES
('TechWorld', '0712345678'),
('GearHouse', '0798765432');

CREATE TABLE Orders_3NF (
    OrderID INT,
    Product VARCHAR(50),
    SupplierName VARCHAR(50),
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (SupplierName) REFERENCES Suppliers(SupplierName)
);

INSERT INTO Orders_3NF (OrderID, Product, SupplierName) VALUES
(201, 'Laptop', 'TechWorld'),
(202, 'Mouse', 'GearHouse'),
(203, 'Keyboard', 'TechWorld');
