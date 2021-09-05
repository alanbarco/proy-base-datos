-- Creación de la tabla Aforo

CREATE TABLE IF NOT EXISTS Aforo(
	ID_aforo INTEGER PRIMARY KEY AUTO_INCREMENT,
	aforo_permitido INT(10) NOT NULL,
	aforo_actual INT(10) NOT NULL
);



-- Creación de la tabla Tienda

CREATE TABLE Tienda(
	ID_tienda INT NOT NULL,
    nombre VARCHAR(45) DEFAULT NULL,
    numero_local INT DEFAULT NULL,
    tipo VARCHAR(45) DEFAULT NULL,
    numero_piso INT DEFAULT NULL,
    ID_aforo INT NOT NULL,
    PRIMARY KEY(ID_tienda) ,
    FOREIGN KEY (ID_aforo) REFERENCES Aforo(ID_aforo)
);




-- Creación de la tabla Direccion_domiciliaria

CREATE TABLE IF NOT EXISTS Direccion_domiciliaria(
	ID_direccion INT PRIMARY KEY AUTO_INCREMENT,
    calle_primaria VARCHAR(45),
    calle_secundaria VARCHAR(45),
    numeracion INT,
    canton VARCHAR(45),
    provincia VARCHAR(45)
);



-- Creación de la tabla Empleado

CREATE TABLE IF NOT EXISTS Empleado(
	ID_empleado INT PRIMARY KEY AUTO_INCREMENT,
    cedula VARCHAR(10) NOT NULL,
    nombres VARCHAR(45),
    apellidos VARCHAR(45),
    fecha_nacimiento DATE,
    correo_electronico VARCHAR(45),
    sexo VARCHAR(2),
    ID_tienda INT,
    ID_direccion INT,
    ID_empleado2 INT,
    FOREIGN KEY(ID_tienda) REFERENCES Tienda(ID_tienda),
    FOREIGN KEY(ID_direccion) REFERENCES Direccion_domiciliaria(ID_direccion)
);



-- Creación de la tabla Telefono

CREATE TABLE IF NOT EXISTS Telefono(
	ID_telefono INT PRIMARY KEY AUTO_INCREMENT,
	numero VARCHAR(20) NOT NULL,
    ID_empleado INT NOT NULL,
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID_empleado)
);



-- Creación de la tabla Usuario

CREATE TABLE IF NOT EXISTS Usuario(
	cedula_usuario VARCHAR(20) NOT NULL,
	nombres VARCHAR(50) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	correo_electronico VARCHAR(50) NOT NULL,
	fecha_de_nacimiento DATE NOT NULL,
	estado_civil VARCHAR(30) NOT NULL,
	ocupacion VARCHAR(50) NOT NULL,
	sexo VARCHAR(20) NOT NULL,
    ID_telefono INT(20) NOT NULL,
    ID_direccion INT(20) NOT NULL,
	PRIMARY KEY (cedula_usuario),
	CONSTRAINT fk_id_telefono FOREIGN KEY (ID_telefono) REFERENCES Telefono (ID_telefono),
	CONSTRAINT fk_id_direccion FOREIGN KEY (ID_direccion) REFERENCES Direccion_domiciliaria (ID_direccion)
);



-- Creación de la tabla Visita

CREATE TABLE IF NOT EXISTS Visita(
	ID_visita INTEGER PRIMARY KEY AUTO_INCREMENT,
	fecha_entrada DATE NOT NULL,
	fecha_salida DATE NOT NULL,
	tiempo_duracion DATETIME NOT NULL,
    cedula_usuario VARCHAR(20) NOT NULL,
    ID_tienda INT(20) NOT NULL,
	CONSTRAINT fk_cedula_usuario FOREIGN KEY (cedula_usuario) REFERENCES Usuario (cedula_usuario),
	CONSTRAINT fk_id_tienda FOREIGN KEY (ID_tienda) REFERENCES Tienda (ID_tienda)
);



-- Creación de la tabla Consultor_externo

CREATE TABLE IF NOT EXISTS Consultor_externo(
	ID_consultor INTEGER PRIMARY KEY AUTO_INCREMENT,
	tiempo_de_conexion DATETIME NOT NULL,
	nombre_empresa VARCHAR(50) NOT NULL,
	numero_de_reportes_solicitados INT(100) NOT NULL,
    cedula_usuario VARCHAR(20) NOT NULL,
	CONSTRAINT fk_cedula_usuario_CE FOREIGN KEY (cedula_usuario) REFERENCES Usuario (cedula_usuario)
);



-- Creación de la tabla Administrador

CREATE TABLE IF NOT EXISTS Administrador(
	ID_administrador INTEGER PRIMARY KEY AUTO_INCREMENT,
	sueldo DOUBLE (10,2) NOT NULL,
	horas_trabajadas DATETIME NOT NULL,
	numero_de_reportes_generados INT(100) NOT NULL,
    cedula_usuario VARCHAR(20) NOT NULL,
	CONSTRAINT fk_cedula_usuario_A FOREIGN KEY (cedula_usuario) REFERENCES Usuario (cedula_usuario)
);



-- Creación de la tabla Cliente

CREATE TABLE IF NOT EXISTS Cliente(
	ID_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
	tiempo_de_conexion DATETIME NOT NULL,
	numero_de_reportes_solicitados INT(100) NOT NULL,
    cedula_usuario VARCHAR(20) NOT NULL,
	CONSTRAINT fk_cedula_usuario_C FOREIGN KEY (cedula_usuario) REFERENCES Usuario (cedula_usuario)
);



-- Creación de la tabla Empleado_cargo

CREATE TABLE IF NOT EXISTS Empleado_cargo(
	ID_empleado_cargo INT PRIMARY KEY AUTO_INCREMENT,
    cargo VARCHAR(45),
    ID_empleado INT,
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID_empleado)
);



-- Creación de la tabla Sueldo_cargo

CREATE TABLE IF NOT EXISTS Sueldo_cargo(
	ID_sueldo_cargo INT PRIMARY KEY AUTO_INCREMENT,
    sueldo DOUBLE,
    ID_empleado INT,
    FOREIGN KEY (ID_empleado) REFERENCES Empleado(ID_empleado)
);