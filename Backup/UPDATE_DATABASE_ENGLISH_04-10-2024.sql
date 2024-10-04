CREATE DATABASE Login_Restaurant;

USE Login_Restaurant;

CREATE TABLE `tables` (
  table_id INT PRIMARY KEY,
  capacity INT,
  table_number VARCHAR(20)
);

CREATE TABLE menu (
  menu_id INT PRIMARY KEY,
  dish_name VARCHAR(255),
  `description`TEXT,
  price_detail TEXT
);

CREATE TABLE users (
  id INT PRIMARY KEY,
  email VARCHAR(120),
  `password` VARCHAR(40)
);


CREATE TABLE reservation (
  reservation_id INT PRIMARY KEY,
  `date` DATE,
  user_id INT,
  table_id INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (table_id) REFERENCES tables(table_id)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  user_id INT,
  `date` DATE,
  total DECIMAL(10,2),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_details (
  order_detail_id INT PRIMARY KEY,
  order_id INT,
  menu_id INT,
  quantity INT,
  total DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
);

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_method VARCHAR(255),
  total_paid DECIMAL(10,2),
  payment_date DATE,
  total DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO users (user_id, first_name, last_name, email, `password`)
VALUES 
(1, 'John', 'Smith', 'john.smith@gmail.com', '1234'),
(2, 'Marlon', 'Moncayo', 'marlon.moncayo@gmail.com', 'abcd'),
(3, 'Luis', 'Martinez', 'luis.martinez@gmail.com', 'xyz123');


INSERT INTO tables (table_id, capacity, table_number)
VALUES 
(1, 4, 'Mesa 1'),
(2, 2, 'Mesa 2'),
(3, 6, 'Mesa 3');


INSERT INTO menu (menu_id, dish_name, `description`, price_detail)
VALUES 
(1, 'Pizza', 'Pizza con salsa de tomate, mozzarella y peperoni ', '1000'),
(2, 'Ensalada',  'Lechuga, queso parmesano, crutones y aderezo', '7500'),
(3, 'Spaghetti', 'Pasta con huevo, queso y pimienta', '12000');


INSERT INTO reservation (reservation_id, `date`, user_id, table_id)
VALUES 
(1, '2024-09-11', 1, 1),
(2, '2024-09-12', 2, 2),
(3, '2024-09-13', 3, 3);


INSERT INTO orders (order_id, user_id, `date`, total)
VALUES 
(1, 1, '2024-09-11', 17500),
(2, 2, '2024-09-12', 10000),
(3, 3, '2024-09-13', 22000);


INSERT INTO order_details (order_detail_id, order_id, menu_id, quantity, price)
VALUES 
(1, 1, 1, 1, 10000),
(2, 1, 2, 1, 7500),
(3, 2, 1, 1, 10000),
(4, 3, 3, 1, 12000),
(5, 3, 2, 2, 10000);


INSERT INTO payments (payment_id, order_id, payment_method, total_paid, payment_date)
VALUES 
(1, 1, 'Credit Card', 17500, '2024-09-11'),
(2, 2, 'Cash', 10000, '2024-09-12'),
(3, 3, 'PayPal', 22000, '2024-09-13');