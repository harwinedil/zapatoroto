--Autor Harwin Edil Pérez Salinas
--04/06/2020
/*
Necesitamos registrar la facturación de los productos de la zapatería "El zapato roto". 
Necesitamos poder registrar productos, clientes, facturas e inventario.

El siguiente script crea la base de datos y tablas para postgresql
*/

--Creamos la base de datos
create database zapatoroto;

--Ahora nos conectamos a la nueva base de datos creada y a partir de alli creamos las tablas:

--Creamos una tabla para agrupar los productos en categorias
create table categoria(
	id 			char(4) primary key not null,
	descripcion varchar(32) not null
);


--Creamos una tabla para almacenar colores de los zapatos
create table color(
	id 			char(3) primary key not null,
	descripcion varchar(32) not null
);


--Los productos tendrán como mínimo: Nombre, presentación, valor.
--Creamos una tabla para almacenar productos
create table productos(
	id 			 	varchar(12) primary key not null,
	nombre 		 	varchar(64) not null,
	presentacion	varchar(96),
	valor 			numeric(12,2) not null,
	categoria_id	char(4) references categoria(id),
	color_id		char(3) references color(id),
	talla			smallint,
	estado			char(1) not null    --"1" Habilitado "0" Deshabilitado
);

--Tabla para almacenar los paises
create table pais(
	id 		char(3) primary key not null,  --ISO-3166-1 ALPHA-3
	nombre 	varchar(64) not null
);

--Los clientes tendrán como mínimo: Identificación, nombre, país.
create table clientes(
	id 			varchar(12) primary key not null,
	nombre 		varchar(96) not null,
	fnacimiento timestamp without time zone,
	genero		char(1),
	nit         varchar(12),
	email 		varchar(64),
	telefono	varchar(16),
	pais_id 	char(3) references pais(id),
	estado 		char(1) not null		--"1" Habilitado "0" Deshabilitado
);

--El inventario tendrá como mínimo: producto, tipo de movimiento (entrada o salida), fecha, cantidad.
--Creamos una tabla para los tipos de movimiento
create table tipomovimiento(
	id 			char(2) primary key not null,
	descripcion varchar(32) not null,
	multiplo	int	
);

--Creamos una tabla para el inventario
create table inventario(
	Id 			 	serial primary key not null,
	movimiento_id 	char(2) references tipomovimiento(id),
	producto_id		varchar(12) references productos(id),
	fecha 			timestamp without time zone not null,
	cantidad		numeric(12,2) not null,
	estado			char(1) not null	--"1" Vigente "0" Anulado
);

--La facturación debe tener como mínimo: la información del cliente, los productos comprados, impuestos, descuentos, valor a pagar.
--Creamos la tabla facturas para almacenar la data de cada factura
create table facturas(
	id 				int primary key not null,
	fecha			timestamp without time zone not null,
	cliente_id		varchar(12) references clientes(id),
	nit 			varchar(12),
	nombre          varchar(96) not null,
	items			smallint not null,
	totalBruto		numeric(12,2) not null,
	descuentos		numeric(12,2) not null,
	totalNeto		numeric(12,2) not null,
	impuestos		numeric(12,2) not null,
	totalPagar		numeric(12,2) not null,
	notas			varchar(64),
	estado			char(1) not null	--"1" Vigente "0" Anulado
);

--Creamos la tabla para almacenar los detalles de los productos que se incluye en la factura
create table facturas_lineas(
	factura_id      int references facturas(id),
	item            smallint not null,
	producto_id     varchar(12) references productos(id),
	valor           numeric(12,2) not null,
	cantidad 		numeric(12,2) not null,
	primary key (factura_id,item)
);

