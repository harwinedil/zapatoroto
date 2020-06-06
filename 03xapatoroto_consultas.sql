
/*
Autor Harwin Perez
Pobla la base de datos con suficiente información para realizar algunas consultas y crea las siguientes:
 */
					
--1. Consulta la facturación de un cliente en específico.
-- Consultamos por las facturas del cliente: GIOVANNA FERNANDEZ
	
select *
from facturas f 
where f.cliente_id ='C0001';

/*
id|fecha              |cliente_id|nit    |nombre            |items|totalbruto|descuentos|totalneto|impuestos|totalpagar|notas|estado|
--|-------------------|----------|-------|------------------|-----|----------|----------|---------|---------|----------|-----|------|
 1|2020-06-01 00:00:00|C0001     |6249541|GIOVANNA FERNANDEZ|    4|   1370.00|      0.00|  1370.00|   246.60|   1616.60|OK   |1     |
 7|2020-06-05 00:00:00|C0001     |6249541|GIOVANNA FERNANDEZ|    5|   1690.00|      0.00|  1690.00|   304.20|   1994.20|OK   |1     |
 8|2020-06-05 00:00:00|C0001     |6249541|GIOVANNA FERNANDEZ|    4|   1170.00|      0.00|  1170.00|   210.60|   1380.60|OK   |1     |
 * */


--2. Consulta la facturación de un producto en específico.
--Consultamos las facturas donde haya el producto: TACON PUNTA AGUJA
select f.*,d.*
from  facturas f join facturas_lineas d on f.id =d.factura_id 
where producto_id ='160ROJ36';

/*
id|fecha              |cliente_id|nit    |nombre            |items|totalbruto|descuentos|totalneto|impuestos|totalpagar|notas|estado|factura_id|item|producto_id|valor |cantidad|
--|-------------------|----------|-------|------------------|-----|----------|----------|---------|---------|----------|-----|------|----------|----|-----------|------|--------|
 1|2020-06-01 00:00:00|C0001     |6249541|GIOVANNA FERNANDEZ|    4|   1370.00|      0.00|  1370.00|   246.60|   1616.60|OK   |1     |         1|   4|160ROJ36   |350.00|    1.00|
 2|2020-06-02 00:00:00|C0002     |4738947|MATIAS PEREZ      |    2|    800.00|      0.00|   800.00|   144.00|    944.00|OK   |1     |         2|   2|160ROJ36   |350.00|    2.00|
 4|2020-06-04 00:00:00|C0004     |2976543|RUTH SALINAS      |    2|    750.00|      0.00|   750.00|   135.00|    885.00|OK   |1     |         4|   2|160ROJ36   |350.00|    1.00|
 6|2020-06-05 00:00:00|C0002     |4738947|MATIAS PEREZ      |    3|   1250.00|      0.00|  1250.00|   225.00|   1475.00|OK   |1     |         6|   3|160ROJ36   |350.00|    1.00|
 7|2020-06-05 00:00:00|C0001     |6249541|GIOVANNA FERNANDEZ|    5|   1690.00|      0.00|  1690.00|   304.20|   1994.20|OK   |1     |         7|   5|160ROJ36   |350.00|    1.00|
 8|2020-06-05 00:00:00|C0001     |6249541|GIOVANNA FERNANDEZ|    4|   1170.00|      0.00|  1170.00|   210.60|   1380.60|OK   |1     |         8|   4|160ROJ36   |350.00|    1.00| 
 */


--3. Consulta la facturación de un rango de fechas.
--Consultamos las facturas en el rango 02/06/20 al 04/02/20 
select *
from facturas f 
where f.fecha between '2020-06-02' and '2020-06-04';

/*
id|fecha              |cliente_id|nit    |nombre      |items|totalbruto|descuentos|totalneto|impuestos|totalpagar|notas|estado|
--|-------------------|----------|-------|------------|-----|----------|----------|---------|---------|----------|-----|------|
 2|2020-06-02 00:00:00|C0002     |4738947|MATIAS PEREZ|    2|    800.00|      0.00|   800.00|   144.00|    944.00|OK   |1     |
 3|2020-06-03 00:00:00|C0003     |4837246|XAVIER PEREZ|    1|    300.00|      0.00|   300.00|    54.00|    354.00|OK   |1     |
 4|2020-06-04 00:00:00|C0004     |2976543|RUTH SALINAS|    2|    750.00|      0.00|   750.00|   135.00|    885.00|OK   |1     |
 5|2020-06-04 00:00:00|C0003     |4837246|XAVIER PEREZ|    2|    600.00|      0.00|   600.00|   108.00|    708.00|OK   |1     | 
*/

--4. De la facturación, consulta los clientes únicos (es decir, se requiere el listado de los clientes que han comprado por lo menos una vez, pero en el listado no se deben repetir los clientes)
					
--Opcion 1) con una subconsulta 
select c.id,c.nombre,c.nit,c.telefono,c.email,c.pais_id 
from clientes c 
where id in (select cliente_id from facturas);

/*
id   |nombre                |nit    |telefono|email                     |pais_id|
-----|----------------------|-------|--------|--------------------------|-------|
C0001|GIOVANNA FERNANDEZ    |6249541|75006019|giovannafg99@hotmail.com  |BOL    |
C0002|MATIAS PEREZ          |4738947|75004149|matias.perezf@gmail.com   |BOL    |
C0003|XAVIER PEREZ FERNANDEZ|4837246|78506041|xavier.perezf@gmail.com   |BOL    |
C0004|RUTH SALINAS          |2976543|78008179|ruth_salinas60@hotmail.com|BOL    |
 */

--Opcion 2) con un join distintivo entre factura y clienete; tambien adicionamos un recuento de facturas por cada cliente
select distinct c.id,c.nombre,c.nit,c.telefono,c.email,c.pais_id,count(*) as facturas 
from  facturas f join clientes c on f.cliente_id =c.id
group by c.id,c.nombre,c.nit,c.telefono,c.email,c.pais_id ;

/*
id   |nombre                |nit    |telefono|email                     |pais_id|facturas|
-----|----------------------|-------|--------|--------------------------|-------|--------|
C0002|MATIAS PEREZ          |4738947|75004149|matias.perezf@gmail.com   |BOL    |       2|
C0001|GIOVANNA FERNANDEZ    |6249541|75006019|giovannafg99@hotmail.com  |BOL    |       3|
C0004|RUTH SALINAS          |2976543|78008179|ruth_salinas60@hotmail.com|BOL    |       1|
C0003|XAVIER PEREZ FERNANDEZ|4837246|78506041|xavier.perezf@gmail.com   |BOL    |       2|  
*/

