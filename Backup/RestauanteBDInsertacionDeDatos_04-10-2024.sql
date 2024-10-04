CREATE DATABASE Login_Restaurante1;

USE Login_Restaurante1;


CREATE TABLE mesas (
  id_Mesa INT PRIMARY KEY,
  capacidad INT,
  Numero_Mesa varchar(20)
);


CREATE TABLE menu (
  id_Menu INT PRIMARY KEY,
  nombre_plato VARCHAR(255),
  descripcion TEXT,
  detalle_precio text
);


CREATE TABLE usuarios (
  id_Usuarios INT PRIMARY KEY,
  Name VARCHAR(255),
  lastname VARCHAR(255),
  email VARCHAR(255),
  contrasena VARCHAR(255)
);



CREATE TABLE reserva (
  id_Reserva INT PRIMARY KEY,
  fecha DATE,
  id_Usuarios INT,
  id_Mesa INT,  
  FOREIGN KEY (id_Usuarios) REFERENCES usuarios(id_Usuarios),
  FOREIGN KEY (id_Mesa) REFERENCES mesas(id_Mesa) 
);





CREATE TABLE Pedido (
  id_Pedido INT PRIMARY KEY,
  id_Usuarios INT,
  fecha DATE,
  total DECIMAL(10,2),
  FOREIGN KEY (id_Usuarios) REFERENCES usuarios(id_Usuarios)
  
);


CREATE TABLE detalle_Pedido (
  id_detalle_Pedido  INT PRIMARY KEY,
  id_Pedido INT,
  id_Menu INT,
  cantidad INT,
  precio DECIMAL(10,2),
  FOREIGN KEY (id_Pedido) REFERENCES Pedido(id_Pedido),
  FOREIGN KEY (id_Menu) REFERENCES menu(id_Menu)
);


CREATE TABLE pagos (
  id_Pago INT PRIMARY KEY,
  id_Pedido INT,
  metodo_pago VARCHAR(255),
  total_pagado DECIMAL(10,2),
  fecha_pago DATE,
  FOREIGN KEY (id_Pedido) REFERENCES Pedido(id_Pedido)
);


INSERT INTO usuarios (id_Usuarios, Name, lastname, email, contrasena)
VALUES 
(1, 'Juan', 'Pérez', 'juan.perez@email.com', '1234'),
(2, 'Ana', 'García', 'ana.garcia@email.com', 'abcd'),
(3, 'Luis', 'Martínez', 'luis.martinez@email.com', 'xyz123');

INSERT INTO mesas (id_Mesa, capacidad, Numero_Mesa)
VALUES 
(1, 4, 'Mesa 1'),
(2, 2, 'Mesa 2'),
(3, 6, 'Mesa 3');

INSERT INTO menu (id_Menu, nombre_plato, descripcion, detalle_precio)
VALUES 
(1, 'Pizza Margherita', 'Pizza con salsa de tomate, mozzarella y albahaca', '1.000'),
(2, 'Ensalada', 'Lechuga, queso parmesano, crutones y aderezo César', '7.500'),
(3, 'Spaghetti Carbonara', 'Pasta con huevo, queso, panceta y pimienta', '12.000');

INSERT INTO reserva (id_Reserva, fecha, id_Usuarios, id_Mesa)
VALUES 
(1, '2024-09-11', 1, 1),
(2, '2024-09-12', 2, 2),
(3, '2024-09-13', 3, 3);

INSERT INTO Pedido (id_Pedido, id_Usuarios, fecha, total)
VALUES 
(1, 1, '2024-09-11', 17.500),
(2, 2, '2024-09-12', 10.000),
(3, 3, '2024-09-13', 22.000);

INSERT INTO detalle_Pedido (id_detalle_Pedido, id_Pedido, id_Menu, cantidad, precio)
VALUES 
(1, 1, 1, 1, 10.000),
(2, 1, 2, 1, 7.500),
(3, 2, 1, 1, 10.000),
(4, 3, 3, 1, 12.000),
(5, 3, 2, 2, 10.000);


INSERT INTO pagos (id_Pago, id_Pedido, metodo_pago, total_pagado, fecha_pago)
VALUES 
(1, 1, 'Tarjeta de crédito', 17.50, '2024-09-11'),
(2, 2, 'Efectivo', 10.00, '2024-09-12'),
(3, 3, 'PayPal', 22.00, '2024-09-13');


