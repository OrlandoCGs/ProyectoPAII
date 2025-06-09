-- Crear base de datos
-- CREATE DATABASE bd_determinar_ventas;
--\c bd_determinar_ventas;  -- Conectarse a la base

-- use bd_determinar_ventas;

-- Tabla: clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    tipo_cliente VARCHAR(20),
    zona VARCHAR(50),
    sector_industrial VARCHAR(100),
    frecuencia_compras INT
);

-- Tabla: productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoría VARCHAR(50),
    material_principal VARCHAR(50),
    dimensiones VARCHAR(100),
    precio_unitario DECIMAL(10,2),
    tiempo_fabricación_días INT
);

-- Tabla: ventas
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    producto_id INT REFERENCES productos(producto_id),
    fecha_venta DATE,
    cantidad_vendida INT,
    precio_total DECIMAL(12,2)
);

-- Tabla: cotizaciones
CREATE TABLE cotizaciones (
    cotizacion_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    producto_id INT REFERENCES productos(producto_id),
    fecha_cotizacion DATE,
    cantidad INT,
    estado_cotizacion VARCHAR(20)  -- Pendiente / Aceptado / Rechazado
);

-- Tabla: producción
CREATE TABLE produccion (
    produccion_id SERIAL PRIMARY KEY,
    producto_id INT REFERENCES productos(producto_id),
    fecha_inicio DATE,
    fecha_fin DATE,
    cantidad_producida INT,
    estado_produccion VARCHAR(20)  -- En proceso / Finalizado
);

-- Tabla: materiales
CREATE TABLE materiales (
    material_id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    tipo TEXT,
    unidad TEXT,
    proveedor TEXT,
    costo_unitario NUMERIC(10,2)
);

-- Tabla: demanda_historica
CREATE TABLE demanda_historica (
    demanda_id SERIAL PRIMARY KEY,
    producto_id INT REFERENCES productos(producto_id),
    fecha DATE,
    cantidad_vendida INT,
    precio_unitario NUMERIC(10,2),
    total_venta NUMERIC(10,2)
);

INSERT INTO clientes (nombre, tipo_cliente, zona, sector_industrial, frecuencia_compras) VALUES 
('Rodriguez, Figueroa and Sanchez', 'Empresa', 'Lake Curtis', 'extend e-business applications', 1),
('Johnson-Davis', 'Particular', 'New Carolyn', 'engage 24/365 experiences', 4),
('Gardner, Robinson and Lawrence', 'Empresa', 'Port Lindachester', 'facilitate efficient eyeballs', 3),
('Smith PLC', 'Empresa', 'Port Andrew', 'streamline real-time web services', 5),
('Wheeler, Taylor and Soto', 'Particular', 'New Matthewmouth', 'integrate wireless e-markets', 2),
('Klein-Bennett', 'Empresa', 'Lake Edwardberg', 'architect enterprise eyeballs', 6),
('Lopez, Young and Moore', 'Empresa', 'Lake Nicole', 'e-enable proactive users', 3),
('Wright-Hansen', 'Particular', 'West Tiffanybury', 'expedite user-centric schemas', 1),
('Mitchell Inc', 'Empresa', 'Port Karenshire', 'orchestrate extensible interfaces', 7),
('Garcia, Fisher and Wilson', 'Empresa', 'Lake Justin', 'target interactive paradigms', 3),
('Gibson Ltd', 'Empresa', 'North Sharonstad', 'drive ubiquitous web-readiness', 2),
('Scott-Boyd', 'Particular', 'North Valerie', 'redefine cross-platform markets', 1),
('Gonzalez-Murray', 'Particular', 'East William', 'embrace bleeding-edge users', 4),
('Simmons-Green', 'Empresa', 'Lake Maria', 'generate dot-com infrastructures', 5),
('Watkins and Sons', 'Empresa', 'North Julieport', 'exploit bricks-and-clicks portals', 6),
('Lee, Carter and Allen', 'Empresa', 'North Markview', 'engage turn-key ROI', 2),
('Reed PLC', 'Particular', 'Port Jose', 'maximize extensible web-readiness', 3),
('Vega Inc', 'Empresa', 'Port Haley', 'benchmark cross-platform functionalities', 4),
('Butler-Harrison', 'Particular', 'South Amber', 'orchestrate strategic users', 1),
('Hall, Powell and White', 'Empresa', 'Lake Jason', 'aggregate plug-and-play infrastructures', 5),
('Cruz, Cook and Chandler', 'Empresa', 'Lake Mark', 'syndicate wireless e-services', 2),
('Ward Inc', 'Particular', 'Lake Emily', 'engineer 24/7 bandwidth', 4),
('Bishop-Lawrence', 'Particular', 'West Richard', 'e-enable innovative e-tailers', 1),
('Barnes, Hodge and Munoz', 'Empresa', 'Port Brandon', 'enable scalable applications', 6),
('Foster, Johnson and Burns', 'Particular', 'Lake Nicole', 'optimize proactive solutions', 3),
('Ramirez-Cook', 'Empresa', 'East Linda', 'empower ubiquitous platforms', 2),
('Rivera Group', 'Empresa', 'Port Laurie', 'facilitate mission-critical supply-chains', 5),
('Russell LLC', 'Particular', 'Lake Katelyn', 'productize collaborative partnerships', 1),
('Jennings PLC', 'Empresa', 'New Kevinland', 'recontextualize cross-platform paradigms', 4),
('Ortiz and Sons', 'Empresa', 'Lake Nancy', 'transition cross-media convergence', 3);

INSERT INTO productos (nombre_producto, categoría, material_principal, dimensiones, precio_unitario, tiempo_fabricación_días) VALUES 
('Towel estructura', 'Liviana', 'Acero', '3x7x10', 1175.00, 11),
('Pizza estructura', 'Pesada', 'Aluminio', '6x2x4', 2670.00, 15),
('Hat estructura', 'Modular', 'Acero', '6x2x3', 2336.00, 11),
('Keyboard estructura', 'Liviana', 'Hierro', '4x5x10', 2674.00, 17),
('Shoes estructura', 'Modular', 'Hierro', '7x10x6', 2470.00, 15),
('Table estructura', 'Modular', 'Aluminio', '4x2x4', 2239.00, 10),
('Mouse estructura', 'Pesada', 'Acero', '3x3x4', 1025.00, 18),
('Chips estructura', 'Pesada', 'Hierro', '9x10x3', 2090.00, 7),
('Soap estructura', 'Modular', 'Hierro', '10x3x2', 2060.00, 8),
('Computer estructura', 'Modular', 'Acero', '3x4x4', 1465.00, 6),
('Pants estructura', 'Pesada', 'Hierro', '10x10x7', 1030.00, 14),
('Shirt estructura', 'Liviana', 'Hierro', '6x2x4', 2257.00, 6),
('Sausages estructura', 'Liviana', 'Aluminio', '2x10x7', 1763.00, 6),
('Keyboard estructura', 'Pesada', 'Hierro', '9x5x5', 1079.00, 11),
('Ball estructura', 'Pesada', 'Hierro', '7x7x2', 1763.00, 9),
('Tuna estructura', 'Pesada', 'Aluminio', '10x10x5', 2797.00, 10),
('Car estructura', 'Modular', 'Hierro', '3x5x6', 1654.00, 10),
('Sausages estructura', 'Pesada', 'Acero', '3x7x5', 1411.00, 19),
('Soap estructura', 'Modular', 'Acero', '4x5x9', 2957.00, 18),
('Shoes estructura', 'Modular', 'Aluminio', '4x2x3', 1074.00, 5);

INSERT INTO ventas (cliente_id, producto_id, fecha_venta, cantidad_vendida, precio_total) VALUES
(23, 2, '2024-07-10', 2, 2104.00),
(29, 2, '2023-09-02', 3, 2160.00),
(17, 8, '2023-07-05', 3, 11960.00),
(16, 7, '2023-07-26', 5, 3167.00),
(24, 19, '2023-11-04', 5, 8744.00),
(8, 16, '2023-04-12', 4, 4119.00),
(4, 4, '2024-06-05', 4, 6804.00),
(14, 14, '2024-05-16', 4, 12945.00),
(2, 4, '2023-08-22', 1, 7596.00),
(24, 11, '2023-12-22', 1, 5073.00),
(7, 7, '2023-09-03', 5, 8350.00),
(5, 14, '2024-12-22', 2, 5563.00),
(15, 8, '2024-08-06', 1, 8260.00),
(26, 18, '2024-12-27', 1, 1828.00),
(21, 18, '2023-02-26', 1, 2528.00),
(30, 8, '2023-01-08', 2, 7658.00),
(16, 16, '2023-12-22', 2, 7570.00),
(29, 2, '2024-04-27', 2, 7209.00),
(1, 13, '2024-03-13', 3, 13846.00),
(26, 15, '2023-03-19', 3, 7930.00),
(23, 18, '2023-02-26', 4, 3536.00),
(7, 10, '2024-02-22', 2, 1958.00);

INSERT INTO cotizaciones (cliente_id, producto_id, fecha_cotizacion, cantidad, estado_cotizacion) VALUES 
(24, 15, '2024-05-30', 9, 'Rechazado'),
(14, 18, '2023-03-22', 1, 'Pendiente'),
(3, 5, '2024-12-30', 9, 'Pendiente'),
(27, 12, '2024-11-13', 10, 'Rechazado'),
(5, 14, '2023-04-15', 3, 'Pendiente'),
(10, 12, '2023-07-25', 1, 'Aceptado'),
(7, 8, '2023-03-31', 2, 'Aceptado'),
(25, 18, '2024-11-22', 7, 'Rechazado'),
(24, 5, '2023-03-25', 4, 'Pendiente'),
(26, 6, '2024-07-30', 7, 'Pendiente'),
(6, 11, '2024-03-05', 7, 'Rechazado'),
(28, 8, '2023-05-01', 5, 'Pendiente'),
(26, 4, '2023-07-31', 7, 'Pendiente'),
(28, 16, '2023-08-07', 4, 'Pendiente'),
(27, 15, '2024-04-14', 6, 'Aceptado'),
(27, 8, '2023-06-13', 4, 'Pendiente'),
(22, 7, '2024-07-11', 7, 'Aceptado'),
(9, 3, '2023-09-24', 5, 'Aceptado'),
(21, 17, '2023-06-08', 7, 'Rechazado'),
(27, 18, '2024-06-17', 6, 'Pendiente');

INSERT INTO produccion (producto_id, fecha_inicio, fecha_fin, cantidad_producida, estado_produccion) VALUES
(10, '2024-01-15', '2024-01-25', 15, 'Completado'),
(5, '2024-02-10', '2024-02-20', 10, 'En progreso'),
(3, '2024-03-05', '2024-03-15', 20, 'Completado'),
(8, '2024-04-01', '2024-04-12', 12, 'Completado'),
(12, '2024-05-18', '2024-05-28', 18, 'Cancelado'),
(1, '2024-06-20', '2024-06-30', 25, 'Completado'),
(7, '2024-07-10', '2024-07-20', 30, 'En progreso'),
(15, '2024-08-15', '2024-08-25', 10, 'Completado'),
(2, '2024-09-05', '2024-09-15', 22, 'Completado'),
(20, '2024-10-01', '2024-10-11', 15, 'En progreso'),
(18, '2024-11-12', '2024-11-22', 20, 'Completado'),
(4, '2024-12-05', '2024-12-15', 18, 'Cancelado'),
(13, '2023-12-01', '2023-12-11', 16, 'Completado'),
(6, '2023-11-20', '2023-11-30', 14, 'Completado'),
(9, '2023-10-10', '2023-10-20', 12, 'Completado');

INSERT INTO materiales (nombre, tipo, unidad, proveedor, costo_unitario) VALUES
('Acero estructural', 'Metal', 'kg', 'Aceros del Norte SAC', 25.50),
('Aluminio reforzado', 'Metal', 'kg', 'Metales Perú S.A.', 18.40),
('Hierro forjado', 'Metal', 'kg', 'Hierros del Sur', 12.75),
('Pintura anticorrosiva', 'Químico', 'litros', 'Química Andina', 9.80),
('Soldadura MIG', 'Consumible', 'kg', 'Industrias SoldaFácil', 14.00),
('Tornillos de anclaje', 'Accesorio', 'unidad', 'FixPro EIRL', 0.85),
('Planchas galvanizadas', 'Metal', 'unidad', 'Acero Express SAC', 42.00),
('Tubos estructurales', 'Metal', 'm', 'MetalTubos S.R.L.', 8.60),
('Protección epóxica', 'Químico', 'litros', 'Protecquim Perú', 15.30),
('Remaches de acero', 'Accesorio', 'caja (100 unds)', 'FerroUnion SAC', 7.25);

INSERT INTO demanda_historica (producto_id, fecha, cantidad_vendida, precio_unitario, total_venta) VALUES
(1, '2023-01-15', 10, 1175.00, 11750.00),
(2, '2023-02-10', 5, 2670.00, 13350.00),
(3, '2023-03-05', 8, 2336.00, 18688.00),
(4, '2023-04-01', 6, 2674.00, 16044.00),
(5, '2023-05-10', 9, 2470.00, 22230.00),
(6, '2023-06-12', 7, 2239.00, 15673.00),
(7, '2023-07-18', 11, 1025.00, 11275.00),
(8, '2023-08-22', 5, 2090.00, 10450.00),
(9, '2023-09-05', 3, 2060.00, 6180.00),
(10, '2023-10-11', 12, 1465.00, 17580.00),
(11, '2023-11-20', 6, 1030.00, 6180.00),
(12, '2023-12-02', 4, 2257.00, 9028.00),
(13, '2024-01-09', 7, 1763.00, 12341.00),
(14, '2024-02-14', 5, 1079.00, 5395.00),
(15, '2024-03-21', 3, 1763.00, 5289.00),
(16, '2024-04-10', 8, 2797.00, 22376.00),
(17, '2024-05-05', 10, 1654.00, 16540.00),
(18, '2024-06-13', 6, 1411.00, 8466.00),
(19, '2024-07-07', 4, 2957.00, 11828.00),
(20, '2024-08-01', 9, 1074.00, 9666.00);

