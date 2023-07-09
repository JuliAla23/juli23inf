#creamos la base de datos
CREATE DATABASE IF NOT EXISTS blog;
USE blog;


CREATE TABLE usuario(
	id INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    telefono INT,
    username VARCHAR(10) NOT NULL,
    email VARCHAR(20) NOT NULL,
    contraseña VARCHAR(8) NOT NULL,
	estado VARCHAR(8) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    avatar VARCHAR(255),
    es_publico BIT NOT NULL,
    es_colaborador BIT NOT NULL, 
    es_admin BIT NOT NULL, 
    CHECK (estado='activo' OR estado='inactivo'),
    PRIMARY KEY(id)
);

CREATE TABLE articulo(
	id_articulo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(30),
    resumen VARCHAR(255),
    contenido TEXT,
    fecha_publicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(8) NOT NULL,
    imagen VARCHAR(100),
    CHECK (estado='activo' OR estado='inactivo'),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);

CREATE TABLE comentario(
	id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_articulo INT NOT NULL,
    contenido TEXT,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(8) NOT NULL,
	CHECK (estado='activo' OR estado='inactivo'),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id),
    FOREIGN KEY(id_articulo) REFERENCES articulo(id_articulo)
);

CREATE TABLE categoria(
	id INT NOT NULL PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre VARCHAR(25),
    descripcion VARCHAR(100),
    imagen VARCHAR(100),
    estado VARCHAR(8) NOT NULL,
    CHECK (estado='activo' OR estado='inactivo'),
    FOREIGN KEY(id_categoria) REFERENCES categoria(id)
);

CREATE TABLE categoria_articulo(
	id_articulo_rel INT NOT NULL,
    id_categoria_rel INT NOT NULL,
    FOREIGN KEY(id_articulo_rel) REFERENCES articulo(id_articulo),
	FOREIGN KEY(id_categoria_rel) REFERENCES categoria(id)
);

#agregar un usuario con rol de administrador bit=0 (false) bit=1 true 
#en el campo es_admin

INSERT INTO usuario(id,nombre,apellido,telefono,username,
	email,contraseña,estado,avatar,es_publico,es_colaborador,es_admin)
VALUES (1,'Ariel','Peralta',34567890,'coco','arielper1@gmail.com','Ar1$','activo',
	'avatar.org.ar',0,0,1)
    
 # agregar 4 usuarios con rol de  colaborador bit=0 (false) bit=1 true 
 #en el campo es_colaborador

VALUES (2,'Pedro','Gomez',34527890,'percar','pedrogo@gmail.com','Pe2$','activo',
	'avatar2.org.ar',0,1,0)
VALUES (3,'Camila','Perez',34527890,'cami3','cami@gmail.com','Ca3$','activo',
	'avatar3.org.ar',0,1,0)
VALUES (4,'José','Almiron',22527890,'Jose234','jose@gmail.com','Jo4$','activo',
	'avatar4.org.ar',0,1,0)
VALUES (5,'Fernanda','Gutierrez',11527890,'Fer5','Fer@gmail.com','Fer5$','activo',
'avatar5.org.ar',0,1,0)

 # agregar 5 usuarios con rol de  público bit=0 (false) bit=1 true 
 #en el campo es_publico
 
VALUES (6,'Lore','Gimenez',55527890,'lore6','lore@gmail.com','Lo6$','activo',
	'avatar6.org.ar',1,0,0)
VALUES (7,'Santi','Koval',77527890,'santi7','santi@gmail.com','San7$','activo',
	'avatar7.org.ar',1,0,0)
VALUES (8,'Mariela','Alvear',88527890,'mari8','mari@gmail.com','ma8$','activo',
	'avatar8.org.ar',1,0,0)
VALUES (9,'Raul','Mendez',99527890,'Ra9','raul@gmail.com','Ra9$','activo',
'avatar9.org.ar',1,0,0)
VALUES (10,'Mirna','Nadal',10527890,'Mi10','mirna@gmail.com','Mi10$','activo',
'avatar10.org.ar',1,0,0)

show usuarios;
