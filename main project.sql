-- Create Database
CREATE DATABASE IF NOT EXISTS project;
USE project;

-- 1. Users
CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    password VARCHAR(255)
);

-- 2. Restaurants
CREATE TABLE IF NOT EXISTS Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    address TEXT,
    phone VARCHAR(15),
    rating FLOAT
);

-- 3. Categories
CREATE TABLE IF NOT EXISTS Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

-- 4. MenuItems
CREATE TABLE IF NOT EXISTS MenuItems (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 5. Orders
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 6. OrderDetails
CREATE TABLE IF NOT EXISTS OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES MenuItems(item_id)
);

-- 7. Delivery
CREATE TABLE IF NOT EXISTS Delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    delivery_address TEXT,
    delivery_status VARCHAR(50),
    estimated_time TIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 8. Payments
CREATE TABLE IF NOT EXISTS Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 9. Reviews
CREATE TABLE IF NOT EXISTS Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    restaurant_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- 10. Admins
CREATE TABLE IF NOT EXISTS Admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255)
);

-- INSERTS
-- Users
INSERT INTO Users (name, email, phone, address, password) VALUES
('Ravi', 'ravi@mail.com', '9999988888', 'Delhi', 'pass123'),
('Anita', 'anita@mail.com', '8888877777', 'Mumbai', 'anita123'),
('Sohan', 'sohan@mail.com', '7777766666', 'Pune', 'sohan321'),
('Meena', 'meena@mail.com', '6666655555', 'Kolkata', 'meena999'),
('Rahul', 'rahul@mail.com', '9999911111', 'Chennai', 'rahul789'),
('Tina', 'tina@mail.com', '7777788888', 'Hyderabad', 'tina456'),
('Arjun', 'arjun@mail.com', '8888844444', 'Bangalore', 'arjun123'),
('Neha', 'neha@mail.com', '6666688888', 'Jaipur', 'neha2024'),
('Rakesh', 'rakesh@mail.com', '9999900000', 'Ahmedabad', 'rakesh999'),
('Simran', 'simran@mail.com', '7777700000', 'Lucknow', 'sim123');

-- Restaurants
INSERT INTO Restaurants (name, address, phone, rating) VALUES
('Food Zone', 'Mumbai', '9898989898', 4.3),
('Spicy Bite', 'Delhi', '8787878787', 4.6),
('Tandoori House', 'Pune', '9898123456', 3.9),
('Burger King', 'Kolkata', '9123456789', 4.2),
('Veggie Delight', 'Chennai', '9234567890', 4.1),
('Hot Grill', 'Bangalore', '9345678901', 3.8),
('Taste Town', 'Ahmedabad', '9456789012', 4.5),
('Quick Eats', 'Lucknow', '9567890123', 4.0),
('Masala Magic', 'Jaipur', '9678901234', 4.7),
('Samosa Stop', 'Hyderabad', '9789012345', 4.4);

-- Categories
INSERT INTO Categories (category_name) VALUES
('Burger'), ('Pizza'), ('Sandwich'), ('Wraps'), ('Drinks'),
('Snacks'), ('Dessert'), ('Rice Bowl'), ('South Indian'), ('North Indian');

-- MenuItems
INSERT INTO MenuItems (restaurant_id, name, description, price, category_id) VALUES
(1, 'Chicken Burger', 'Spicy grilled burger', 150.00, 1),
(2, 'Paneer Pizza', 'Cheesy delight', 200.00, 2),
(3, 'Veg Sandwich', 'Grilled veg sandwich', 120.00, 3),
(4, 'Chicken Wrap', 'Tandoori wrap', 180.00, 4),
(5, 'Lemon Soda', 'Refreshing drink', 50.00, 5),
(6, 'Fries', 'Crispy potato fries', 90.00, 6),
(7, 'Brownie', 'Chocolate dessert', 110.00, 7),
(8, 'Veg Rice Bowl', 'Rice with curry', 140.00, 8),
(9, 'Dosa', 'Crispy South Indian dosa', 130.00, 9),
(10, 'Chole Bhature', 'Punjabi special', 160.00, 10);

-- Orders
INSERT INTO Orders (user_id, status, total_amount) VALUES
(1, 'Delivered', 450.00),
(2, 'Pending', 320.00),
(3, 'Cancelled', 200.00),
(4, 'Delivered', 560.00),
(5, 'Delivered', 230.00),
(6, 'Processing', 390.00),
(7, 'Delivered', 410.00),
(8, 'Pending', 340.00),
(9, 'Delivered', 220.00),
(10, 'Cancelled', 150.00);

-- OrderDetails
INSERT INTO OrderDetails (order_id, item_id, quantity, price) VALUES
(1, 1, 2, 300.00), (1, 5, 1, 50.00), (2, 2, 1, 200.00), (3, 3, 2, 240.00),
(4, 4, 2, 360.00), (5, 6, 1, 90.00), (6, 7, 2, 220.00), (7, 8, 1, 140.00),
(8, 9, 1, 130.00), (9, 10, 1, 160.00);

-- Delivery
INSERT INTO Delivery (order_id, delivery_address, delivery_status, estimated_time) VALUES
(1, 'Delhi', 'Completed', '00:30:00'), (2, 'Mumbai', 'Pending', '00:45:00'),
(3, 'Pune', 'Cancelled', '00:00:00'), (4, 'Kolkata', 'Completed', '00:50:00'),
(5, 'Chennai', 'Completed', '00:40:00'), (6, 'Bangalore', 'Pending', '00:35:00'),
(7, 'Jaipur', 'Completed', '00:25:00'), (8, 'Lucknow', 'Processing', '00:55:00'),
(9, 'Ahmedabad', 'Completed', '00:20:00'), (10, 'Hyderabad', 'Cancelled', '00:00:00');

-- Payments
INSERT INTO Payments (order_id, payment_method, payment_status, payment_date) VALUES
(1, 'Card', 'Completed', NOW()), (2, 'UPI', 'Pending', NOW()),
(3, 'Cash', 'Failed', NOW()), (4, 'Card', 'Completed', NOW()),
(5, 'Wallet', 'Completed', NOW()), (6, 'Card', 'Pending', NOW()),
(7, 'UPI', 'Completed', NOW()), (8, 'Cash', 'Processing', NOW()),
(9, 'Wallet', 'Completed', NOW()), (10, 'UPI', 'Failed', NOW());

-- Reviews
INSERT INTO Reviews (user_id, restaurant_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Amazing food!', CURDATE()), (2, 2, 4, 'Great taste', CURDATE()),
(3, 3, 3, 'Average service', CURDATE()), (4, 4, 5, 'Loved it!', CURDATE()),
(5, 5, 4, 'Good variety', CURDATE()), (6, 6, 2, 'Too spicy', CURDATE()),
(7, 7, 4, 'Nice ambience', CURDATE()), (8, 8, 5, 'Fast delivery', CURDATE()),
(9, 9, 3, 'Could be better', CURDATE()), (10, 10, 4, 'Very good', CURDATE());

-- Admin
INSERT INTO Admins (username, password) VALUES ('admin', 'admin123');



-- 1. List all users
SELECT * FROM Users;

-- 2. List all restaurants with ratings above 4
SELECT * FROM Restaurants WHERE rating > 4;

-- 3. Get all items in the 'Burger' category
SELECT * FROM MenuItems 
WHERE category_id = (SELECT category_id FROM Categories WHERE category_name = 'Burger');

-- 4. Get user orders
SELECT * FROM Orders WHERE user_id = 1;

-- 5. Get details of a specific order
SELECT * FROM OrderDetails WHERE order_id = 2;

-- 6. Get all pending deliveries
SELECT * FROM Delivery WHERE delivery_status = 'Pending';

-- 7. Show all reviews for Restaurant ID 1
SELECT * FROM Reviews WHERE restaurant_id = 1;

-- 8. Show all payments made by user 'Ravi'
SELECT * FROM Payments 
WHERE order_id IN (SELECT order_id FROM Orders WHERE user_id = (SELECT user_id FROM Users WHERE name = 'Ravi'));

-- 9. List all menu items of restaurant 'Food Zone'
SELECT * FROM MenuItems 
WHERE restaurant_id = (SELECT restaurant_id FROM Restaurants WHERE name = 'Food Zone');

-- 10. List users who have ordered more than 3 times
SELECT user_id, COUNT(*) as total_orders 
FROM Orders 
GROUP BY user_id 
HAVING total_orders > 3;

/*
AGGREGATE QUERIES
*/

-- 11. Total number of users
SELECT COUNT(*) FROM Users;

-- 12. Average rating of each restaurant
SELECT R.name, AVG(RV.rating) AS avg_rating 
FROM Reviews RV 
JOIN Restaurants R ON RV.restaurant_id = R.restaurant_id 
GROUP BY R.name;

-- 13. Total revenue generated
SELECT SUM(total_amount) FROM Orders;

-- 14. Most ordered item
SELECT M.name, COUNT(*) as count 
FROM OrderDetails OD 
JOIN MenuItems M ON OD.item_id = M.item_id 
GROUP BY M.name 
ORDER BY count DESC 
LIMIT 1;

-- 15. Number of orders per day
SELECT DATE(order_date) AS order_day, COUNT(*) 
FROM Orders 
GROUP BY order_day;

/* 
JOIN QUERIES
*/

-- 16. Show user name with order details
SELECT U.name, O.order_id, O.total_amount 
FROM Users U 
JOIN Orders O ON U.user_id = O.user_id;

-- 17. Menu items with category names
SELECT M.name AS item_name, C.category_name 
FROM MenuItems M 
JOIN Categories C ON M.category_id = C.category_id;

-- 18. Orders with item names
SELECT O.order_id, M.name AS item_name, OD.quantity 
FROM OrderDetails OD 
JOIN MenuItems M ON OD.item_id = M.item_id 
JOIN Orders O ON OD.order_id = O.order_id;

-- 19. Restaurant and their menu item count
SELECT R.name, COUNT(M.item_id) AS item_count 
FROM Restaurants R 
JOIN MenuItems M ON R.restaurant_id = M.restaurant_id 
GROUP BY R.name;

-- 20. Payment status with user name
SELECT U.name, P.payment_status 
FROM Users U 
JOIN Orders O ON U.user_id = O.user_id 
JOIN Payments P ON O.order_id = P.order_id;

/*
ADVANCED QUERIES
*/

-- 36. Top 3 most ordered items
SELECT M.name, COUNT(*) as total 
FROM OrderDetails OD 
JOIN MenuItems M ON OD.item_id = M.item_id 
GROUP BY M.name 
ORDER BY total DESC 
LIMIT 3;

-- 37. Highest rated restaurant
SELECT R.name, AVG(RV.rating) as avg_rating 
FROM Reviews RV 
JOIN Restaurants R ON RV.restaurant_id = R.restaurant_id 
GROUP BY R.name 
ORDER BY avg_rating DESC 
LIMIT 1;

-- 38. Orders with multiple items
SELECT order_id 
FROM OrderDetails 
GROUP BY order_id 
HAVING COUNT(*) > 1;

-- 39. Users who haven't placed any orders
SELECT * FROM Users 
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM Orders);

-- 40. Total earnings per restaurant
SELECT R.name, SUM(OD.price * OD.quantity) AS earnings 
FROM Orders O
JOIN OrderDetails OD ON O.order_id = OD.order_id
JOIN MenuItems M ON OD.item_id = M.item_id
JOIN Restaurants R ON M.restaurant_id = R.restaurant_id
GROUP BY R.name;
