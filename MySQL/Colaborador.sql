# creamos la base de datos blog articulos
CREATE DATABASE BLOG_ARTICULOS;
USE BLOG_ARTICULOS;
# crear tabla de colaboradores
CREATE TABLE colaborador(
	dni INT NOT NULL,
    nombre CHAR(40),
    apellido CHAR(40),
    email CHAR(25),
    estado CHAR(8),
    PRIMARY KEY (dni)   
)

CREATE TABLE articulos(
	id_articulo INT NOT NULL,
    articulo CHAR(30),
    imagen CHAR(255),
    fecha_ publ DATE,
    contenido TEXT,
    resumen CHAR(200),
    nombre_blog CHAR(50), 
    PRIMARY KEY id_articulo
    FOREING KEY (nombre_blog) REFERENCES blog(nombre) 
	FOREING KEY (dni_colaborador) REFERENCES colaborador(dni) 
  )
  
  CREATE TABLE blog(
	nombre CHAR(50),
    url CHAR(255),
    PRIMARY KEY nombre
)