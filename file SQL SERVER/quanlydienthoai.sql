CREATE DATABASE quanlydienthoai;
Go

USE quanlydienthoai;
GO

-- 1. bảng đơn hàng 
CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_name NVARCHAR(100) NOT NULL,
    customer_email VARCHAR(100),
    customer_phone VARCHAR(20) NOT NULL,
    delivery_address NVARCHAR(100) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(12,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    payment_method VARCHAR(50) NOT NULL
);
Go

SELECT * FROM orders;

-- 2. bảng chi tiết đon hàng 
CREATE TABLE order_items (
    item_id INT IDENTITY(1,1) PRIMARY KEY, 
    order_id VARCHAR(20) NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    product_name NVARCHAR(100) NOT NULL,
    product_image VARCHAR(255),
    price DECIMAL(12,2) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

SELECT * FROM order_items;

-- 3. tạo bảng danh sách sp điện thoai
CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name NVARCHAR(100) NOT NULL,
    product_image VARCHAR(255),
    original_price DECIMAL(12,2) NOT NULL,
    discounted_price DECIMAL(12,2) NOT NULL, --giá giảm
    discount_percent INT,
    category VARCHAR(50),
    stock INT DEFAULT 100,
    rating DECIMAL(2,1) DEFAULT 5.0,
    description TEXT
);
GO
SELECT * FROM products;

-- 4. bảng Users
CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(100) NOT NULL,
    fullname NVARCHAR(100),
    email NVARCHAR(100),
    role NVARCHAR(50) DEFAULT 'user',
    created_at DATETIME DEFAULT GETDATE()
);
GO

SELECT * FROM Users;

INSERT INTO Users (username, password, fullname, email, role)
VALUES ('admin', '123456', 'Admin', 'admin@gmail.com', 'admin');

-- Thêm dữ liệu
INSERT INTO products (product_id, product_name, product_image, original_price, discounted_price, discount_percent, category, stock)
VALUES 
	('iphone16pro128', 'iphone 16 Pro 128Gb Chính Hãng VN/A', 'images/a1.png', 28999000, 24490000, 16, 'apple', 300),
	('iphone16pro128_2', 'iphone 16 Pro 128Gb Chính Hãng VN/A', 'images/ip16.png', 26190000, 20952000, 20, 'apple', 1000),
	('iphone16_128', 'iphone 16 128Gb Chính Hãng VN/A', 'images/a4.png', 22990000, 18790000, 15, 'apple', 1500),
	('iphone13pro_128', 'iphone 13 Pro 128Gb Chính Hãng VN/A', 'images/a3.jpg', 18990000, 11590000, 39, 'apple', 2000),
	('samsung_s24plus', 'Samsung Galaxy S24 Plus 12GB/256GB Chính Hãng', 'images/a7.jpg', 26990000, 15990000, 20, 'samsung', 120),
	('samsung_a55', 'Samsung Galaxy A55 5G 8GB/128GB Chính Hãng', 'images/a5.jpg', 9990000, 6790000, 32, 'samsung', 150),
	('samsung_a35_128', 'Samsung Galaxy A35 5G 8GB/128GB Chính Hãng', 'images/a6.jpg', 8290000, 6190000, 25, 'samsung', 165),
	('samsung_m15_128', 'Samsung Galaxy M15 5G 6GB/128GB Chính Hãng', 'images/a8.jpg', 4990000, 4290000, 14, 'samsung', 162),
	('xiaomi_14t_512', 'Xiaomi 14T 12GB/512GB Chính Hãng', 'images/14.jpg', 13990000, 11390000, 19, 'xiaomi', 250),
	('redmi_note14_128', 'Xiaomi Redmi Note 14 6GB/128GB Chính Hãng', 'images/a14.jpg', 4990000, 4090000, 28, 'xiaomi', 400),
	('oppo_a58_128', 'Oppo A58 4G 6GB/128GB Chính Hãng', 'images/16.jpg', 4989000, 3690000, 26, 'other', 234),
	('poco_c75_128', 'Xiaomi Poco C75 6GB/128GB Chính Hãng', 'images/a13.jpg', 3390000, 2690000, 25, 'xiaomi', 199),
	('poco_c75_128_2', 'Xiaomi Poco C75 6GB/128GB Chính Hãng', 'images/13.jpg', 3390000, 2690000, 21, 'xiaomi', 200),
	('oppo_a3x_64', 'OPPO A3x 4GB/64GB Chính Hãng', 'images/a15.jpg', 3590000, 2590000, 28, 'other', 450),
	('realme_note60x', 'Realme Note 60x 3GB/64GB Chính Hãng', 'images/15.jpg', 2690000, 2149000, 20, 'other', 280),
	('redmi_a3_64', 'Xiaomi Redmi A3 3GB/64GB Chính Hãng', 'images/a16.jpg', 2490000, 1890000, 24, 'other', 300);
GO


