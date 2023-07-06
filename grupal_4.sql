/*
	CREATE TABLE `db_grupal4`.`ingreso_usuario` (
  `id_ingreso` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NULL,
  `fecha_hora` DATETIME NULL,
  PRIMARY KEY (`id_ingreso`),
  INDEX `id_usuario_ingreso_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario_ingreso`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_grupal4`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
*/

-- Parte 2
UPDATE usuario
SET zona_horaria = CONVERT_TZ(zona_horaria,  '-04:00', '-03:00');

-- Parte 3: Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
UPDATE usuario
SET zona_horaria = CONVERT_TZ(zona_horaria, '-03:00', '-02:00');

-- Parte 4: Creación de registros.

INSERT INTO usuario(nombre, apellido, password, zona_horaria, genero, telefono)
VALUES('Tio', 'Rene', '123abc', CURRENT_TIMESTAMP, 'M', 9999999);

INSERT INTO usuario(nombre, apellido, password, zona_horaria, genero, telefono)
VALUES ('Juan', 'Pérez', 'abc123', CURRENT_TIMESTAMP, 'M', 1234567),
       ('María', 'González', 'qwerty', CURRENT_TIMESTAMP, 'F', 9876543),
       ('Carlos', 'López', 'password1', CURRENT_TIMESTAMP, 'M', 5555555),
       ('Laura', 'Sánchez', 'secure123', CURRENT_TIMESTAMP, 'F', 7777777),
       ('Pedro', 'Ramírez', 'iloveyou', CURRENT_TIMESTAMP, 'M', 8888888),
       ('Ana', 'López', 'p@ssw0rd', CURRENT_TIMESTAMP, 'F', 6666666),
       ('Eduardo', 'Martínez', 'hello123', CURRENT_TIMESTAMP, 'M', 1111111);
       
SELECT * FROM usuario;
       

INSERT INTO ingreso_usuario(id_usuario, fecha_hora) 
values ("2", current_timestamp ),("3" , current_timestamp),('4' , current_timestamp),("5" , current_timestamp),("6" , current_timestamp),("7" , current_timestamp),("8" , current_timestamp),("9" , current_timestamp);

-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
/*
	Justifique cada tipo de dato utilizado en la creación de las tablas
    
    Para id(s) se utilizo el tipo INT para asegurarse de que sea auto incrementable y no se repita el registro,
    Para la fecha-hora se utilizo el tipo DATETIME que convenientemente almacena este tipo de informacion,
    Para el genero se utilizo el tipo CHAR como representacion basica del genero del individuo, sin limitaciones aceptando valores como F, M, O(otros).
    Para la zona hora
    Para el resto de los campos se utilizo el tipo VARCHAR que permite flexibilidad al momento de ingresar informacion como nombres, correos o cualquier cadena de texto.
    
*/

-- Parte 6: Creen una nueva tabla llamada 
-- Contactos (id_contacto, id_usuario, numero de telefono,correo electronico).
-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la
-- tabla Contactos.

CREATE TABLE contacto (
	id_contacto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_usuario INT,
    telefono VARCHAR(15),
    email VARCHAR(50),
    FOREIGN KEY(id_usuario)
    REFERENCES usuario (id_usuario)
);

ALTER TABLE usuario
DROP column telefono;

SELECT * FROM usuario;
