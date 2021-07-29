-- Para cada tabla, una consulta general, en donde se retornen todos los campos (por ejemplo, una consulta para retornar todos los usuarios).

SELECT*FROM Aforo;
SELECT*FROM Tienda;
SELECT*FROM Direccion_domiciliaria;
SELECT*FROM Empleado;
SELECT*FROM Telefono;
SELECT*FROM Usuario;
SELECT*FROM Visita;
SELECT*FROM Consultor_externo;
SELECT*FROM Administrador;
SELECT*FROM Cliente;
SELECT*FROM Empleado_cargo;
SELECT*FROM Sueldo_cargo;





-- Para cada tabla, una consulta de ids, en donde se retorne solamente el id de la tabla (por ejemplo, retornar el id de todos los usuarios).

SELECT ID_aforo FROM Aforo;
SELECT ID_tienda FROM Tienda;
SELECT ID_direccion FROM Direccion_domiciliaria;
SELECT ID_empleado FROM Empleado;
SELECT ID_telefono FROM Telefono;
SELECT cedula_usuario FROM Usuario;
SELECT ID_visita FROM Visita;
SELECT ID_consultor FROM Consultor_externo;
SELECT ID_administrador FROM Administrador;
SELECT ID_cliente FROM Cliente;
SELECT ID_empleado_cargo FROM Empleado_cargo;
SELECT ID_sueldo_cargo FROM Sueldo_cargo;





-- Para cada tabla, una consulta donde se utilice algún tipo de búsqueda (condición where) - (por ejemplo, retornar aquellos usuarios cuyo apellido empieza en 'B').

-- EL ID_aforo que tenga el aforo permitido mayor a 60:
SELECT ID_aforo, aforo_permitido FROM Aforo WHERE aforo_permitido>60;


-- Tiendas cuyo nombre empiecen por P:
SELECT ID_tienda,nombre FROM Tienda WHERE nombre LIKE "P%";


-- Numeracion de las direcciones que queden en el cantón Guayaquil:
SELECT ID_direccion,numeracion FROM Direccion_domiciliaria WHERE canton = "Guayaquil";


-- Empleados con sexo H:
SELECT ID_empleado, nombres, apellidos, sexo FROM Empleado WHERE sexo = 'H';


-- Numero de telefonos que terminen en 5:
SELECT ID_telefono,numero FROM Telefono WHERE numero LIKE "%5";


-- Usuario con sexo F(femenino):
SELECT cedula_usuario, nombres, apellidos, sexo FROM Usuario WHERE sexo="F";


-- Cédula del usuario que haya visitado la tienda con ID=4:
SELECT cedula_usuario, ID_tienda FROM Visita WHERE ID_tienda=4;


-- El nombre de la empresa donde trabaja el consultor que ha solicitado más de 3 reportes:
SELECT nombre_empresa, numero_de_reportes_solicitados FROM Consultor_externo WHERE numero_de_reportes_solicitados>3;


-- El sueldo de los administradores que han generado 10 reportes:
SELECT sueldo, numero_de_reportes_generados FROM Administrador WHERE numero_de_reportes_generados=10;


-- La cédula de los clientes que hayan solicitado menos de 5 reportes:
SELECT cedula_usuario, numero_de_reportes_solicitados FROM Cliente WHERE numero_de_reportes_solicitados<5;


-- Cargos que tengan la letra a en medio:
SELECT ID_empleado_cargo,cargo FROM Empleado_cargo WHERE cargo LIKE "%a%";


-- Sueldos que sean mayor a 700:
SELECT ID_sueldo_cargo, sueldo FROM Sueldo_cargo WHERE sueldo>700;





-- La mitad de los reportes indicados en la documentación.

-- La cantidad de empleados que hay por tienda:
SELECT COUNT(ID_empleado), Tienda.nombre FROM Empleado, Tienda WHERE Empleado.ID_tienda = Tienda.ID_tienda GROUP BY(Tienda.nombre);
 
 
-- La ocupación de los usuarios que han visitado una tienda en el piso 2:
SELECT u.ocupacion, u.cedula_usuario, t.numero_piso FROM Usuario u, Visita v, Tienda t WHERE u.cedula_usuario = v.cedula_usuario AND v.ID_tienda = t.ID_tienda AND t.numero_piso = 2;


-- Nombres de tienda que se encuentran en el primer piso:
SELECT nombre, numero_piso FROM Tienda WHERE numero_piso = 1;


-- Aforo de un día en específico:
SELECT COUNT(cedula_usuario), ID_tienda FROM Visita WHERE fecha_entrada = '2021-01-28' GROUP BY (ID_tienda);


-- El tipo de tiendas que tienen un aforo permitido menor a 50:
SELECT Tienda.tipo, Aforo.aforo_permitido FROM Tienda, Aforo WHERE Tienda.ID_aforo = Aforo.ID_Aforo AND aforo_permitido<50;
