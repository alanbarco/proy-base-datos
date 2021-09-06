-- Vista de la ocupación de los usuarios que han visitado una tienda en el piso 2:
create view Ocupacion_Usuario as SELECT u.ocupacion, u.cedula_usuario, t.numero_piso
 FROM Usuario u, Visita v, Tienda t 
 WHERE u.cedula_usuario = v.cedula_usuario AND v.ID_tienda = t.ID_tienda AND t.numero_piso = 2;
select * from Ocupacion_Usuario;

-- Vista de nombres de tiendas que se encuentran en primer piso
create view Tiendas_Primer_Piso as SELECT nombre, numero_piso FROM Tienda WHERE numero_piso = 1;
select * from Tiendas_Primer_Piso;

-- Vista de la cantidad de empleados que hay por tienda:
create view Cantidad_Empleados as SELECT COUNT(ID_empleado) as Cantidad_Empleados, Tienda.nombre FROM Empleado, Tienda WHERE Empleado.ID_tienda = Tienda.ID_tienda GROUP BY(Tienda.nombre);

-- Vista del tipo de tiendas que tienen un aforo permitido menor a 50:
create view Tipo_tienda as SELECT Tienda.tipo, Aforo.aforo_permitido FROM Tienda, Aforo WHERE Tienda.ID_aforo = Aforo.ID_Aforo AND aforo_permitido<50;

-- Aforo de un día en específico
CREATE VIEW Aforo_dia_especifico AS SELECT COUNT(cedula_usuario) AS Aforo_del_dia, ID_tienda FROM Visita WHERE fecha_entrada = '2021-01-28' GROUP BY (ID_tienda); 

-- Nombres de los empleados que trabajan en una tienda tipo restaurante 
CREATE VIEW Nombres_empleados AS SELECT Empleado.nombres, Empleado.apellidos, Tienda.nombre FROM Empleado, Tienda WHERE Empleado.ID_tienda = Tienda.ID_tienda AND Tienda.tipo = "Comida";