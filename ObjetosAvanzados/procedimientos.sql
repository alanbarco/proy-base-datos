-- Procedimiento para ingrear empleado
DROP PROCEDURE IF EXISTS insertar_empleado;
DELIMITER //
CREATE PROCEDURE insertar_empleado(
in cedula varchar(10),
in nombres varchar(20),
in apellidos varchar(20),
in fecha_nac date,
in correo varchar(45),
in sexo varchar(2),
in id_tienda int,
in id_direccion int,
in id_empleado2 int
)
begin
	insert into Empleado(cedula,nombres, apellidos,fecha_nacimiento,correo_electronico,sexo,ID_tienda,ID_direccion,ID_empleado2)  values(cedula,nombres,apellidos,fecha_nac,correo,sexo,id_tienda,id_direccion,id_empleado2);
END //
DELIMITER ;    
call insertar_empleado('0951701421', "Maria", "Rodriguez", '1995-02-10', "vcvsd@hotmail.com", 'M',36 ,13,9);
-- Procedimiento para actualizar empleado
DROP PROCEDURE IF EXISTS update_empleado;
DELIMITER //
CREATE PROCEDURE update_empleado(
in id int, 
in cedula varchar(10),
in nombres varchar(20),
in apellidos varchar(20),
in fecha_nac date,
in correo varchar(45),
in sexo varchar(2),
in id_tienda int,
in id_direccion int,
in id_empleado2 int
)
begin
	update Empleado
	set 
    cedula = cedula,
    nombres = nombres,
    apellidos = apellidos,
    fecha_nacimiento = fecha_nac,
    correo_electronico = correo,
    sexo = sexo,
    ID_tienda = id_tienda,
    ID_direccion = id_direccion,
    ID_empleado2 = id_empleado2
    where
    ID_empleado = id;
END //
DELIMITER ;  
call update_empleado(21,'0951701421', "Maria", "Rodriguez", '1995-02-10', "vcvsd@hotmail.com", 'M',36 ,13,9);
-- Procedimiento para eliminar empleado
DROP PROCEDURE IF EXISTS delete_empleadoPorID;
DELIMITER //
CREATE PROCEDURE delete_empleadoPorID(
in id int
)
begin
	delete from Empleado where ID_emplado = id;
END //
DELIMITER ;  
call delete_empleadoPorID(21);
-- Procedimiento para ingresar Direccion domiciliaria
DROP PROCEDURE IF EXISTS ingresar_direccion;
DELIMITER //
CREATE PROCEDURE ingresar_direccion(
in calle_prim varchar(45),
in calle_sec varchar(45),
in numeracion int,
in canton varchar(45),
in provincia varchar(45)
)
begin
	insert into Direccion_domiciliaria(calle_primaria, calle_secundaria,numeracion,canton,provincia) values(calle_prim,calle_sec,numeracion,canton,provincia);
END //
DELIMITER ;  
call ingresar_direccion('Av 12', 'Calle asdasd', 144, 'Guayaquil', 'Guayas');

-- Procedimiento para actualizar Direccion domiciliaria
DROP PROCEDURE IF EXISTS update_direccion;
DELIMITER //
CREATE PROCEDURE update_direccion(
in id int,
in calle_prim varchar(45),
in calle_sec varchar(45),
in numeracion int,
in canton varchar(45),
in provincia varchar(45)
)
begin
	update Direccion_domiciliaria
    set
    calle_primaria = calle_prim,
    calle_secundaria = calle_sec,
    numeracion = numeracion,
    canton = canton,
    provincia = provincia
    where
	ID_direccion = id;
END //
DELIMITER ;  
call update_direccion(10,'Av 12', 'Calle asdasd', 144, 'Guayaquil', 'Guayas');
 -- Procedimiento para eliminar Direccion domiciliaria por ID
 DROP PROCEDURE IF EXISTS eliminar_direccion;
DELIMITER //
CREATE PROCEDURE eliminar_direccion(
in id int
)
begin
	delete from Direccion_domiciliaria where ID_direccion = id;
END //
DELIMITER ;  
call eliminar_direccion(10);
-- Procedimiento Ingresar Tienda
DROP PROCEDURE IF EXISTS ingresar_tienda;
DELIMITER //
CREATE PROCEDURE ingresar_tienda(
in id int,
in nombre varchar(45),
in numero_local int,
in tipo varchar(20),
in numero_piso int,
in ID_aforo int
)
begin
	insert into Tienda values(id,nombre,numero_local,tipo,numero_piso,ID_aforo);
END //
DELIMITER ;  
call ingresar_tienda(21,  'Tienda 21', 21, 'Comida', 1,21 );
-- Procedimiento Actualizar Tienda
DROP PROCEDURE IF EXISTS update_tienda;
DELIMITER //
CREATE PROCEDURE update_tienda(
in id int,
in nombre varchar(45),
in numero_local int,
in tipo varchar(20),
in numero_piso int,
in ID_aforo int
)
begin
	update Tienda
    set
    nombre = nombre,
    numero_local = numero_local,
    tipo = tipo,
    numero_piso = numero_piso,
    ID_aforo = ID_aforo
    where 
    ID_tienda = id;
END //
DELIMITER ;  
call update_tienda(12,21,  'Tienda 21', 21, 'Comida', 1,21 );
-- Procedimiento para eliminar datos de Tienda
DROP PROCEDURE IF EXISTS delete_tienda;
DELIMITER //
CREATE PROCEDURE delete_tienda(
in id int
)
begin
	delete from Tienda where ID_tienda = id;
END //
DELIMITER ;  
call delete_tienda(12);
-- Proceso de ingresar telefono
DROP PROCEDURE IF EXISTS ingresar_Telefono;
DELIMITER //
CREATE PROCEDURE ingresar_Telefono(
in id_emp int,
in numero varchar(10)
)
begin
	insert into Telefono(numero, ID_empleado) values(id_emp, numero);
END //
DELIMITER ;  
call ingresar_Telefono('0987753128',45);
-- Procedimiento para actualizar telefono
DROP PROCEDURE IF EXISTS update_Telefono;
DELIMITER //
CREATE PROCEDURE update_Telefono(
in id int,
in id_emp int,
in numero varchar(10)
)
begin
	update Telefono
    set 
    ID_empleado = id_emp,
    numero = numero
    where
	ID_telefono = id;
END //
DELIMITER ;  
call update_Telefono(9,'0987753128',45);
-- Procedimiento para eliminar Telefono
DROP PROCEDURE IF EXISTS eliminar_telefono;
DELIMITER //
CREATE PROCEDURE eliminar_telefono(
in id int
)
begin
	delete from Telefono
    where
	ID_telefono = id;
END //
DELIMITER ;  
call eliminar_telefono(9);
-- Procedimiento para insertar Empleado_cargo
DROP PROCEDURE IF EXISTS ingresar_Empleado_Cargo;
DELIMITER //
CREATE PROCEDURE ingresar_Empleado_Cargo(
in cargo varchar(20),	
in id_emp int
)
begin
	insert into Empleado_cargo(cargo,ID_empleado) values(cargo, id_emp);
END //
DELIMITER ;  
call ingresar_Empleado_Cargo('RRHH',43);
-- Procedimiento para actualizar Empleado_Cargo
DROP PROCEDURE IF EXISTS update_Empleado_Cargo;
DELIMITER //
CREATE PROCEDURE update_Empleado_Cargo(
in id int,
in cargo varchar(20),	
in id_emp int
)
begin
	update Empleado_cargo 
    set 
    cargo = cargo,
    ID_empleado = id_emp
    where 
    ID_empleado_cargo = id;
END //
DELIMITER ;  
call update_Empleado_Cargo(2,'RRHH',43);
-- Procedimiento para eliminar Empleado_Cargo
DROP PROCEDURE IF EXISTS delete_Empleado_Cargo;
DELIMITER //
CREATE PROCEDURE delete_Empleado_Cargo(
in id int
)
begin
	delete from Empleado_cargo where ID_empleado_cargo = id;
END //
DELIMITER ;  
call delete_Empleado_Cargo(2);
-- Procedimiento para ingresar Sueldo_cargo
DROP PROCEDURE IF EXISTS ingresar_Sueldo_Cargo;
DELIMITER //
CREATE PROCEDURE ingresar_Sueldo_cargo(
in sueldo double,	
in id_emp int
)
begin
	insert into Sueldo_cargo(sueldo,ID_empleado)  values(sueldo, id_emp);
END //
DELIMITER ;  
call ingresar_Sueldo_cargo(900,36);
-- Procedimiento para actualizar Sueldo_cargo
DROP PROCEDURE IF EXISTS update_Sueldo_Cargo;
DELIMITER //
CREATE PROCEDURE update_Sueldo_Cargo(
in id int,
in sueldo double,	
in id_emp int
)
begin
	update Sueldo_cargo
    set 
    sueldo = sueldo,
    ID_empleado = id_emp
    where 
    ID_sueldo_cargo = id;
END //
DELIMITER ;  
call update_Sueldo_Cargo(14,900,36);
-- Procedimiento para elimintar Sueldos_cargos
DROP PROCEDURE IF EXISTS delete_Sueldo_Cargo;
DELIMITER //
CREATE PROCEDURE delete_Sueldo_Cargo(
in id int
)
begin
	delete from Sueldo_cargo where ID_sueldo_cargo = id;
END //
DELIMITER ;
call delete_Sueldo_Cargo(14);

-- ********** Tabla Aforo **********
-- Procedimiento para ingresar un aforo.
DROP PROCEDURE IF EXISTS Ingresar_aforo;
DELIMITER //
CREATE PROCEDURE Ingresar_aforo(
	IN aforo_permitido INT(10),
	IN aforo_actual INT(10)
)
BEGIN 
	INSERT INTO Aforo (aforo_permitido,aforo_actual) VALUES (aforo_permitido,aforo_actual);
END //
DELIMITER;
call Ingresar_aforo(30,21);
-- Procedimiento para actualizar un aforo.
DROP PROCEDURE IF EXISTS Actualizar_aforo;
DELMITER //
CREATE PROCEDURE Actualizar_aforo(
	IN ID INT,
	IN aforo_permitido INT(10),
	IN aforo_actual INT(10)
)
BEGIN
	UPDATE Aforo SET aforo_permitido = aforo_permitido, aforo_actual = aforo_actual WHERE ID_aforo = ID;
END //
DELIMITER;
call Actualizar_aforo(4,30,21);
-- Procedimiento para eliminar un aforo.
DROP PROCEDURE IF EXISTS Eliminar_aforo;
DELIMITER //
CREATE PROCEDURE Eliminar_aforo(
	IN ID INT
)
BEGIN
	DELETE FROM Aforo WHERE ID_aforo = ID;
END //
DELIMITER;
call Eliminar_aforo(4);

-- ********** Tabla Visita **********
-- Procedimiento para ingresar una visita.
DROP PROCEDURE IF EXISTS Ingresar_visita;
DELIMITER //
CREATE PROCEDURE Ingresar_visita(
	IN fecha_entrada DATE,
	IN fecha_salida DATE,
	IN tiempo_duracion DATETIME,
	IN cedula_usuario VARCHAR(20),
	IN ID_tienda INT(20)
)
BEGIN 
	INSERT INTO Visita (fecha_entrada,fecha_salida,tiempo_duracion,cedula_usuario,ID_tienda) VALUES (fecha_entrada, fecha_salida, tiempo_duracion, cedula_usuario, ID_tienda);
END //
DELIMITER;

-- Procedimiento para actualizar una visita.
DROP PROCEDURE IF EXISTS Actualizar_visita;
DELIMITER //
CREATE PROCEDURE Actualizar_visita(
	IN ID INT,
	IN fecha_entrada DATE,
	IN fecha_salida DATE,
	IN tiempo_duracion DATETIME,
	IN cedula_usuario VARCHAR(20),
	IN ID_tienda INT(20)
)
BEGIN 
	UPDATE Visita SET fecha_entrada = fecha_entrada, fecha_salida = fecha_salida, tiempo_duracion = tiempo_duracion, cedula_usuario = cedula_usuario, ID_tienda = ID_tienda WHERE ID_visita = ID;
END //
DELIMITER;

-- Procedimiento para eliminar una visita.
DROP PROCEDURE IF EXISTS Eliminar_visita;
DELIMITER //
CREATE PROCEDURE Eliminar_visita(
	IN ID INT
)
BEGIN 
	DELETE FROM Visita WHERE ID_visita = ID;
END //
DELIMITER;


-- ********** Tabla Usuario **********
-- Procedimiento para ingresar un usuario.
DROP PROCEDURE IF EXISTS Ingresar_usuario;
DELIMITER //
CREATE PROCEDURE Ingresar_usuario(
	IN cedula_usuario VARCHAR(20),
	IN nombres VARCHAR(50),
	IN apellidos VARCHAR(50),
	IN correo_electronico VARCHAR(50),
	IN fecha_de_nacimiento DATE,
	IN estado_civil VARCHAR(30),
	IN ocupacion VARCHAR(50),
	IN sexo VARCHAR(20),
	IN ID_telefono INT(20),
	IN ID_direccion INT(20)
)
BEGIN 
	INSERT INTO Usuario VALUES (cedula_usuario, nombres, apellidos, correo_electronico, fecha_de_nacimiento, estado_civil, ocupacion, sexo, ID_telefono, ID_direccion);
END //
DELIMITER;

-- Procedimiento para actualizar un usuario.
CREATE PROCEDURE IF EXISTS Actualizar_usuario;
DELIMITER //
CREATE PROCEDURE Actualizar_usuario(
	IN cedula_usuario VARCHAR(20),
	IN nombres VARCHAR(50),
	IN apellidos VARCHAR(50),
	IN correo_electronico VARCHAR(50),
	IN fecha_de_nacimiento DATE,
	IN estado_civil VARCHAR(30),
	IN ocupacion VARCHAR(50),
	IN sexo VARCHAR(20),
	IN ID_telefono INT(20),
	IN ID_direccion INT(20)
)
BEGIN 
	UPDATE Usuario SET nombres = nombres, apellidos = apellidos, correo_electronico = correo_electronico, fecha_de_nacimiento = fecha_de_nacimiento, estado_civil = estado_civil, ocupacion = ocupacion, sexo = sexo, ID_telefono = ID_telefono, ID_direccion = ID_direccion WHERE cedula_usuario = cedula_usuario; 
END //
DELIMITER;

-- Procedimiento para eliminar un usuario.
DROP PROCEDURE IF EXISTS Eliminar_usuario;
DELIMITER //
CREATE PROCEDURE Eliminar_usuario(
	IN cedula VARCHAR(20)
)
BEGIN 
	DELETE FROM Usuario WHERE cedula_usuario = cedula;
END //
DELIMITER;


-- ********** Tabla Consultor_externo **********
-- Procedimiento para ingresar un consultor externo.
DROP PROCEDURE IF EXISTS Ingresar_consultor_externo;
DELIMITER //
CREATE PROCEDURE Ingresar_consultor_externo(
	IN tiempo_de_conexion DATETIME,
	IN nombre_empresa VARCHAR(50),
	IN numero_de_reportes_solicitados INT(100),
	IN cedula_usuario VARCHAR(20)
)
BEGIN 
 INSERT INTO Consultor_externo (tiempo_de_conexion,nombre_empresa,numero_de_reportes_solicitados,cedula_usuario) VALUES (tiempo_de_conexion, nombre_empresa, numero_de_reportes_solicitados, cedula_usuario);
END //
DELIMITER;

-- Procedimiento para actualizar un consultor externo.
DROP PROCEDURE IF EXISTS Actualizar_consultor_externo;
DELIMITER //
CREATE PROCEDURE Actualizar_consultor_externo(
	IN ID INT
	IN tiempo_de_conexion DATETIME,
	IN nombre_empresa VARCHAR(50),
	IN numero_de_reportes_solicitados INT(100),
	IN cedula_usuario VARCHAR(20)
)
BEGIN 
	UPDATE Consultor_externo SET tiempo_de_conexion = tiempo_de_conexion, nombre_empresa = nombre_empresa, numero_de_reportes_solicitados = numero_de_reportes_solicitados, cedula_usuario = cedula_usuario WHERE ID_consultor = ID;
END //
DELIMITER;

-- Procedimiento para eliminar un consultor externo.
DROP PROCEDURE IF EXISTS Eliminar_consultor_externo;
DELIMITER //
CREATE PROCEDURE Eliminar_consultor_externo(
	IN ID INT
)
BEGIN 
	DELETE FROM Consultor_externo WHERE ID_consultor = ID;
END //
DELIMITER;


-- ********** Tabla Administrador **********
-- Procedimiento para ingresar un administrador.
DROP PROCEDURE IF EXISTS Ingresar_administrador;
DELIMITER //
CREATE PROCEDURE Ingresar_administrador(
	IN sueldo DOUBLE (10,2),
	IN horas_trabajadas DATETIME,
	IN numero_de_reportes_generados INT(100),
	IN cedula_usuario VARCHAR(20)
)
BEGIN 
	INSERT INTO Administrador (sueldo,horas_trabajadas,numero_de_reportes_generados,cedula_usuario) VALUES (sueldo, horas_trabajadas, numero_de_reportes_generados, cedula_usuario);
END //
DELIMITER;

-- Procedimiento para actualizar un administrador.
DROP PROCEDURE IF EXISTS Actualizar_administrador;
DELIMITER //
CREATE PROCEDURE Actualizar_administrador(
	IN ID INT,
	IN sueldo DOUBLE (10,2),
	IN horas_trabajadas DATETIME,
	IN numero_de_reportes_generados INT(100),
	IN cedula_usuario VARCHAR(20)
)
BEGIN 
	UPDATE Administrador SET sueldo = sueldo, horas_trabajadas = horas_trabajadas, numero_de_reportes_generados = numero_de_reportes_generados, cedula_usuario = cedula_usuario WHERE ID_administrador = ID;
END //
DELIMITER;

-- Procedimiento para eliminar un administrador.
DROP PROCEDURE IF EXISTS Eliminar_administrador;
DELIMITER //
CREATE PROCEDURE Eliminar_administrador(
	IN ID INT
)
BEGIN 
	DELETE FROM Administrador WHERE ID_administrador = ID;
END //
DELIMITER;


-- ********** Tabla Cliente **********
-- Procedimiento para ingresar un cliente.
DROP PROCEDURE IF EXISTS Ingresar_cliente;
DELIMITER //
CREATE PROCEDURE Ingresar_cliente(
	IN tiempo_de_conexion DATETIME,
	IN numero_de_reportes_solicitados INT(100),
	IN cedula_usuario VARCHAR(20)
)
BEGIN 
	INSERT INTO Cliente (tiempo_de_conexion,numero_de_reportes_solicitados,cedula_usuario) VALUES (tiempo_de_conexion, numero_de_reportes_solicitados, cedula_usuario);
END //
DELIMITER;

-- Procedimiento para actualizar un cliente.
DROP PROCEDURE IF EXISTS Actualizar_cliente;
DELIMITER //
CREATE PROCEDURE Actualizar_cliente(
	IN ID INT,
	IN tiempo_de_conexion DATETIME,
	IN numero_de_reportes_solicitados INT(100),
	IN cedula_usuario VARCHAR(20)
)
BEGIN 
	UPDATE Cliente SET tiempo_de_conexion = tiempo_de_conexion, numero_de_reportes_solicitados = numero_de_reportes_solicitados, cedula_usuario = cedula_usuario WHERE ID_cliente = ID;
END //
DELIMITER;

-- Procedimiento para eliminar un cliente.
DROP PROCEDURE IF EXISTS Eliminar_cliente;
DELIMITER //
CREATE PROCEDURE Eliminar_cliente(
	IN ID INT
)
BEGIN 
	DELETE FROM Cliente WHERE ID_cliente = ID;
END //
DELIMITER;



-- Consultar informacion de empleado 
DROP PROCEDURE IF EXISTS informacionEmpleado;
DELIMITER //
CREATE PROCEDURE informacionEmpleado(
in id int
)
begin
	select * from Empleado where ID_empleado = id;
END //
DELIMITER ;
call informacionEmpleado(21);
-- Aforo de un dia en especifico
DROP PROCEDURE IF EXISTS ver_Aforo;
DELIMITER //
CREATE PROCEDURE ver_Aforo(
in fecha DATE
)
begin
	select count(cedula_usuario) as Aforo, ID_tienda from Visita where fecha_entrada =fecha group by ID_tienda;
END //
DELIMITER ;
call ver_Aforo("2021-04-01");
-- Nombre del usuario que han realizado visita mayor a 10 minutos
DROP PROCEDURE IF EXISTS usuario_Visita_Mayor_10mins;
DELIMITER //
CREATE PROCEDURE usuario_Visita_Mayor_10mins(
in fecha DATE
)
begin
	select  nombres, apellidos from Usuario u, Visita v where time(v.tiempo_duracion) > '00:10:00' 
	and v.fecha_entrada = fecha and v.cedula_usuario = u.cedula_usuario;END //
DELIMITER ;
call usuario_Visita_Mayor_10mins("2021-07-18");

-- Nombres de tienda que se encuentran en el primer piso
DROP PROCEDURE IF EXISTS tiendas_PrimerPiso;
DELIMITER //
CREATE PROCEDURE tiendas_PrimerPiso(
)
begin
	select * from Tiendas_Primer_Piso;
END //
DELIMITER ;
call tiendas_PrimerPiso;
 -- El tipo de tiendas que tienen un aforo permitido menor a 50 
 DROP PROCEDURE IF EXISTS tipoTienda_Aforo_menor50;
DELIMITER //
CREATE PROCEDURE tipoTienda_Aforo_menor50(
)
begin
	select * from Tipo_tienda;
END //
DELIMITER ;
call tipoTienda_Aforo_menor50();
 -- Nombres de los empleados que trabajan en una tienda tipo ropa 
 DROP PROCEDURE IF EXISTS empleados_Ropa;
DELIMITER //
CREATE PROCEDURE empleados_Ropa(
)
begin
	select e.nombres from Empleado e, Tienda t where t.tipo = 'ropa' and e.ID_tienda = t.ID_tienda;
END //
DELIMITER ;
call empleados_Ropa();
 -- La ocupación de los usuarios que han visitado una tienda en el piso 2
 DROP PROCEDURE IF EXISTS ocupacion_usuario_tiendas_PrimerPiso;
DELIMITER //
CREATE PROCEDURE ocupacion_usuario_tiendas_PrimerPiso(
)
begin
	select * from Ocupacion_Usuario;
END //
DELIMITER ;
call ocupacion_usuario_tiendas_PrimerPiso();
 -- La cantidad de empleados que hay por tienda
DROP PROCEDURE IF EXISTS cantidad_Empleados_PorPiso;
DELIMITER //
CREATE PROCEDURE cantidad_Empleados_PorPiso(
)
begin
	select * from Cantidad_Empleados;
END //
DELIMITER ;
call cantidad_Empleados_PorPiso();



