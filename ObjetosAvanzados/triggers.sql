DROP TRIGGER IF EXISTS eliminar_telefono;
DELIMITER $$
CREATE TRIGGER eliminar_telefono
    AFTER DELETE ON Usuario
    FOR EACH ROW BEGIN
	delete from Telefono where Telefono.ID_telefono = ID_telefono;
END$$
DELIMITER ;

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
