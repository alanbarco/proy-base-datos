DROP TRIGGER IF EXISTS eliminar_telefono;
DELIMITER $$
CREATE TRIGGER eliminar_telefono
    AFTER DELETE ON Usuario
    FOR EACH ROW BEGIN
	delete from Telefono where Telefono.ID_telefono = ID_telefono;
END$$
DELIMITER ;
call Eliminar_usuario("0643701258");
DROP TRIGGER IF EXISTS ingresar_usuario;
DELIMITER $$
CREATE TRIGGER ingresar_usuario
    BEFORE INSERT ON Usuario
    FOR EACH ROW BEGIN
	IF ( YEAR(new.fecha_de_nacimiento)<1920) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error';
        end if;
END$$
DELIMITER ;
call Ingresar_usuario("0643701258","Coco","Chanel","cocochanel@gmail.com","1800-08-14","Viudo","Matemático","F",13,12);
DROP TRIGGER IF EXISTS verificar_sueldo_positivo;
DELIMITER $$
CREATE TRIGGER verificar_sueldo_positivo
    BEFORE INSERT ON Sueldo_cargo
    FOR EACH ROW BEGIN
	IF ( new.sueldo<0) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error';
        end if;
END$$
DELIMITER ;
call ingresar_Sueldo_cargo(-1,51);