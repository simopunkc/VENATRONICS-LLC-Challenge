CREATE TABLE `companies` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `approval` ENUM('pending', 'accepted', 'rejected') NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `products` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `manufacture` VARCHAR(255) NOT NULL,
  `company_id` INT(10) NOT NULL,
  `approval` ENUM('pending', 'accepted', 'rejected') NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE
);

CREATE TABLE `orders` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `order_number` VARCHAR(255) NOT NULL,
  `buyer_company_id` INT(10) NOT NULL,
  `product_id` INT(10) NOT NULL,
  `status` ENUM('order created', 'order accepted', 'payment done', 'shipped', 'arrived', 'order completed', 'order rejected') NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  FOREIGN KEY (buyer_company_id) REFERENCES companies(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

INSERT INTO `companies` (name, approval) VALUES
('ABC Corporation', 'pending'),
('XYZ Ltd.', 'accepted'),
('123 Industries', 'rejected'),
('Tech Innovators', 'pending'),
('Global Solutions Inc.', 'accepted'),
('Future Enterprises', 'rejected'),
('Infinite Innovations', 'pending'),
('Dynamic Systems', 'accepted'),
('MegaCorp International', 'rejected'),
('Agile Solutions', 'pending');

INSERT INTO `products` (name, manufacture, company_id, approval) VALUES
('Product 1A', 'Manufacturer A', 1, 'pending'),
('Product 1B', 'Manufacturer B', 1, 'accepted'),
('Product 1C', 'Manufacturer C', 1, 'rejected'),
('Product 2X', 'Manufacturer X', 2, 'pending'),
('Product 2Y', 'Manufacturer Y', 2, 'accepted'),
('Product 2Z', 'Manufacturer Z', 2, 'rejected'),
('Product 3M', 'Manufacturer M', 3, 'pending'),
('Product 3N', 'Manufacturer N', 3, 'accepted'),
('Product 3O', 'Manufacturer O', 3, 'rejected'),
('Product 4P', 'Manufacturer P', 4, 'pending'),
('Product 4Q', 'Manufacturer Q', 4, 'accepted'),
('Product 4R', 'Manufacturer R', 4, 'rejected'),
('Product 5D', 'Manufacturer D', 5, 'pending'),
('Product 5E', 'Manufacturer E', 5, 'accepted'),
('Product 5F', 'Manufacturer F', 5, 'rejected'),
('Product 6G', 'Manufacturer G', 6, 'pending'),
('Product 6H', 'Manufacturer H', 6, 'accepted'),
('Product 6I', 'Manufacturer I', 6, 'rejected'),
('Product 7J', 'Manufacturer J', 7, 'pending'),
('Product 7K', 'Manufacturer K', 7, 'accepted'),
('Product 7L', 'Manufacturer L', 7, 'rejected'),
('Product 8S', 'Manufacturer S', 8, 'pending'),
('Product 8T', 'Manufacturer T', 8, 'accepted'),
('Product 8U', 'Manufacturer U', 8, 'rejected'),
('Product 9V', 'Manufacturer V', 9, 'pending'),
('Product 9W', 'Manufacturer W', 9, 'accepted'),
('Product 9X', 'Manufacturer X', 9, 'rejected'),
('Product 10Y', 'Manufacturer Y', 10, 'pending'),
('Product 10Z', 'Manufacturer Z', 10, 'accepted'),
('Product 10A', 'Manufacturer A', 10, 'rejected');

INSERT INTO `orders` (order_number, buyer_company_id, product_id, status, created_at, updated_at) VALUES
('ORD001', 2, 2, 'order created', '2024-01-01 10:00:00', '2024-01-01 10:00:00'),
('ORD002', 3, 2, 'order accepted', '2024-01-02 11:30:00', '2024-01-10 11:30:00'),
('ORD003', 4, 8, 'shipped', '2024-01-05 13:45:00', '2024-01-11 13:45:00'),
('ORD004', 5, 23, 'payment done', '2024-01-05 15:20:00', '2024-01-15 15:20:00'),
('ORD005', 6, 14, 'arrived', '2024-01-10 17:10:00', '2024-01-25 17:10:00'),
('ORD006', 7, 14, 'order rejected', '2024-01-15 19:25:00', '2024-01-20 19:25:00'),
('ORD007', 8, 2, 'order created', '2024-01-20 21:40:00', '2024-01-20 21:40:00'),
('ORD008', 9, 5, 'order accepted', '2024-01-19 23:55:00', '2024-01-27 23:55:00'),
('ORD009', 10, 26, 'shipped', '2024-01-20 02:15:00', '2024-01-26 02:15:00'),
('ORD010', 1, 26, 'order completed', '2024-01-11 04:30:00', '2024-01-26 04:30:00'),
('ORD011', 2, 26, 'order created', '2024-01-21 06:45:00', '2024-01-21 06:45:00'),
('ORD012', 3, 2, 'order accepted', '2024-01-26 09:00:00', '2024-01-28 09:00:00'),
('ORD013', 4, 2, 'shipped', '2024-01-24 11:15:00', '2024-01-27 11:15:00'),
('ORD014', 5, 2, 'order completed', '2024-01-10 13:30:00', '2024-01-27 13:30:00'),
('ORD015', 6, 20, 'arrived', '2024-01-15 15:45:00', '2024-01-27 15:45:00');

UPDATE orders SET updated_at = '2024-02-02 10:00:00' WHERE id = 1;