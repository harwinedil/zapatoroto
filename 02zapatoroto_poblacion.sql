/*Autor Harwin Perez
 * Script para poblar las tablas de la base de datos zapatoroto
 * 
 * 
 * */

--Poblamos categoria
insert into categoria(id,descripcion) 
				values ('DEV','DEPOSTIVOS HOMBRES');
insert into categoria(id,descripcion) 
				values ('DEM','DEPORTIVOS MUJERES');
insert into categoria(id,descripcion) 
				values ('CLV','CLASICOS HOMBRES');
insert into categoria(id,descripcion) 
				values ('TAM','TACONES MUJERES');

--Poblamos la tabla Color
insert into color(id,descripcion) 
			values ('NEG','NEGRO');
insert into color(id,descripcion) 
			values ('BLA','BLANCO');
insert into color(id,descripcion) 
			values ('AZU','AZUL');
insert into color(id,descripcion) 
			values ('ROJ','ROJO');
insert into color(id,descripcion) 
			values ('MAR','MARRON');

--Poblamos la tabla productos
insert into productos(id, nombre, presentacion, valor, categoria_id, color_id, talla, estado) 
			values ('100NEG36', 'MOCACINES VARON', 'MODELO X', 100, 'CLV', 'NEG', 36, '1');
insert into productos(id, nombre, presentacion, valor, categoria_id, color_id, talla, estado) 
			values ('100NEG40', 'MOCACINES VARON', 'MODELO X', 120, 'CLV', 'NEG', 40, '1');
insert into productos(id, nombre, presentacion, valor, categoria_id, color_id, talla, estado) 
			values ('101MAR40', 'MOCACINES VARON', 'MODELO Z', 200, 'CLV', 'MAR', 40, '1');
insert into productos(id, nombre, presentacion, valor, categoria_id, color_id, talla, estado) 
			values ('150BLA35', 'DEPORTIVOS DAMAS ', 'MODELO A', 400, 'DEM', 'BLA', 35, '1');
insert into productos(id, nombre, presentacion, valor, categoria_id, color_id, talla, estado) 
			values ('160ROJ36', 'TACON PUNTA AGUJA', 'MODELO M', 350, 'TAM', 'ROJ', 36, '1');

--poblamos la tabla pais
insert into pais(id,nombre) 
		values ('BOL','BOLIVIA');
insert into pais(id,nombre) 
		values ('PER','PERU');
insert into pais(id,nombre) 
		values ('COL','COLOMBIA');
insert into pais(id,nombre) 
		values ('MEX','MEXICO');
insert into pais(id,nombre) 
		values ('ARG','ARGENTINA');
insert into pais(id,nombre) 
		values ('BRA','BRASIL');
insert into pais(id,nombre) 
		values ('CHI','CHILE');

--poblamos la tabla clientes
INSERT INTO clientes(id, nombre, fnacimiento, genero, nit, email, telefono, pais_id, estado)
				VALUES('C0001', 'GIOVANNA FERNANDEZ', '1984-04-09', 'F', '6249541', 'giovannafg99@hotmail.com', '75006019', 'BOL', '1');
INSERT INTO clientes(id, nombre, fnacimiento, genero, nit, email, telefono, pais_id, estado)
				VALUES('C0002', 'MATIAS PEREZ', '2006-07-24', 'M', '4738947', 'matias.perezf@gmail.com', '75004149', 'BOL', '1');
INSERT INTO clientes(id, nombre, fnacimiento, genero, nit, email, telefono, pais_id, estado)
				VALUES('C0003', 'XAVIER PEREZ FERNANDEZ', '2009-10-31', 'M','4837246', 'xavier.perezf@gmail.com', '78506041', 'BOL', '1');
INSERT INTO clientes(id, nombre, fnacimiento, genero, nit, email, telefono, pais_id, estado)
				VALUES('C0004', 'RUTH SALINAS', '1960-07-22', 'F', '2976543', 'ruth_salinas60@hotmail.com', '78008179', 'BOL', '1');
INSERT INTO clientes(id, nombre, fnacimiento, genero, nit, email, telefono, pais_id, estado)
				VALUES('C0005', 'HARWIN PEREZ', '1981-04-10', 'M', '4698209', 'harwinedil@gmail.com', '72104018', 'BOL', '1');


--Poblamos la tabla tipomovimiento
insert into tipomovimiento(id,descripcion,multiplo) 
					values('IC','INGRESO POR COMPRAS',1);				
insert into tipomovimiento(id,descripcion,multiplo) 
					values('IA','INGRESO POR AJUSTE',1);
insert into tipomovimiento(id,descripcion,multiplo) 
					values('EA','EGRESO POR AJUSTE',-1);				
insert into tipomovimiento(id,descripcion,multiplo) 
					values('VT','EGRESO POR VENTA',-1);				
			
				
--Poblamos la tabla Inventario
INSERT INTO inventario(movimiento_id, producto_id, fecha, cantidad, estado)
				VALUES('IC', '100NEG36', '2020-06-01', 50, '1');
INSERT INTO inventario(movimiento_id, producto_id, fecha, cantidad, estado)
				VALUES('IC', '100NEG40', '2020-06-01', 30, '1');
INSERT INTO inventario(movimiento_id, producto_id, fecha, cantidad, estado)
				VALUES('IC', '101MAR40', '2020-06-01', 60, '1');		
INSERT INTO inventario(movimiento_id, producto_id, fecha, cantidad, estado)
				VALUES('IC', '150BLA35', '2020-06-01', 100, '1');
INSERT INTO inventario(movimiento_id, producto_id, fecha, cantidad, estado)
				VALUES('IC', '160ROJ36', '2020-06-01', 70, '1');


--Poblamos la tabla facturas y sus respectivas lineas
INSERT INTO facturas(id, fecha, cliente_id, nit, nombre, items, totalbruto, descuentos, totalneto, impuestos, totalpagar, notas, estado)
					VALUES(1, '2020-06-01', 'C0001', '6249541', 'GIOVANNA FERNANDEZ', 4, 1370, 0, 1370, 246.60, 1616.60, 'OK', '1');
INSERT INTO facturas(id, fecha, cliente_id, nit, nombre, items, totalbruto, descuentos, totalneto, impuestos, totalpagar, notas, estado)
					VALUES(2, '2020-06-02', 'C0002', '4738947', 'MATIAS PEREZ', 2, 800, 0, 800, 144, 944, 'OK', '1');
INSERT INTO facturas(id, fecha, cliente_id, nit, nombre, items, totalbruto, descuentos, totalneto, impuestos, totalpagar, notas, estado)
					VALUES(3, '2020-06-03', 'C0003', '4837246', 'XAVIER PEREZ', 1, 300, 0, 300, 54, 354, 'OK', '1');
INSERT INTO facturas(id, fecha, cliente_id, nit, nombre, items, totalbruto, descuentos, totalneto, impuestos, totalpagar, notas, estado)
					VALUES(4, '2020-06-04', 'C0004', '2976543', 'RUTH SALINAS', 2, 750, 0, 750, 135, 885, 'OK', '1');
INSERT INTO facturas(id, fecha, cliente_id, nit, nombre, items, totalbruto, descuentos, totalneto, impuestos, totalpagar, notas, estado)
					VALUES(5, '2020-06-04', 'C0003', '4837246', 'XAVIER PEREZ', 2, 600, 0, 600, 108, 708, 'OK', '1');
INSERT INTO facturas(id, fecha, cliente_id, nit, nombre, items, totalbruto, descuentos, totalneto, impuestos, totalpagar, notas, estado)
					VALUES(6, '2020-06-05', 'C0002', '4738947', 'MATIAS PEREZ', 3, 1250, 0, 1250, 225, 1475, 'OK', '1');
INSERT INTO facturas(id, fecha, cliente_id, nit, nombre, items, totalbruto, descuentos, totalneto, impuestos, totalpagar, notas, estado)
					VALUES(7, '2020-06-05', 'C0001', '6249541', 'GIOVANNA FERNANDEZ', 5, 1690, 0, 1690, 304.20, 1994.20, 'OK', '1');
INSERT INTO facturas(id, fecha, cliente_id, nit, nombre, items, totalbruto, descuentos, totalneto, impuestos, totalpagar, notas, estado)
					VALUES(8, '2020-06-05', 'C0001', '6249541', 'GIOVANNA FERNANDEZ', 4, 1170, 0, 1170, 210.60, 1380.60, 'OK', '1');

--Poblamos la tabla facturas_lineas
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 1	,	1	,'100NEG36',	100	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 1	,	2	,'100NEG40',	120	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 1	,	3	,'150BLA35',	400	,	2);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 1	,	4	,'160ROJ36',	350	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 2	,	1	,'100NEG36',	100	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 2	,	2	,'160ROJ36',	350	,	2);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 3	,	1	,'100NEG36',	100	,	3);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 4	,	1	,'150BLA35',	400	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 4	,	2	,'160ROJ36',	350	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 5	,	1	,'101MAR40',	200	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 5	,	2	,'150BLA35',	400	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 6	,	1	,'100NEG36',	100	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 6	,	2	,'150BLA35',	400	,	2);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 6	,	3	,'160ROJ36',	350	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 7	,	1	,'100NEG36',	100	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 7	,	2	,'100NEG40',	120	,	2);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 7	,	3	,'101MAR40',	200	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 7	,	4	,'150BLA35',	400	,	2);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 7	,	5	,'160ROJ36',	350	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 8	,	1	,'100NEG36',	100	,	3);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 8	,	2	,'100NEG40',	120	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 8	,	3	,'150BLA35',	400	,	1);
insert into facturas_lineas(factura_id,item,producto_id,valor,cantidad)
					values ( 8	,	4	,'160ROJ36',	350	,	1);
					

--Finalmente a partir de los datos de las facturas insertadas, cargamos los respectivos registros de salidas en inventario
insert into inventario(movimiento_id,producto_id,fecha,cantidad,estado)
			select 'VT',d.producto_id,f.fecha,d.cantidad,'1'
			from   facturas f join facturas_lineas d on f.id=d.factura_id; 
