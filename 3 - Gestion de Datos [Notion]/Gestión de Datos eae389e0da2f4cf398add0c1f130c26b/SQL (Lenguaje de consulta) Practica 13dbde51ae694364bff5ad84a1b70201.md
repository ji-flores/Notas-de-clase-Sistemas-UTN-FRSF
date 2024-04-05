# SQL (Lenguaje de consulta): Practica

```sql
//1.a)
SELECT id_proveedor
FROM PROVEEDOR pvdor, PROVEE pvee
WHERE pvdor.id_proveedor = pvee.id_proveedor AND
			id_articulo = 146

//1.c)

//1.o)

//2.a)
SELECT nombre
FROM EMPLEADO emp, TRABAJA tr, PLANTA plnt
WHERE emp.id_empleado = tr.id_empleado AND
			tr.id_planta = plnt.id_planta AND
			fecha_hasta <> NULL AND
			localidad <> 'Bahia Blanca'

//2.b)
```

## Guia 3

```sql
//1)
SELECT *
FROM Pedido
WHERE fecha_envio IS NULL

//2)
SELECT *
FROM Pedido
WHERE fecha_pedido BETWEEN '30-04-1996' AND '01-06-1996' AND
			fecha_envio IS NULL
ORDER BY fecha_pedido

//3)
SELECT dpd.id_pedido, pr.nombre_producto, dpd.cantidad, dpd.precio_unidad
FROM Detalle_Pedido dpd, Producto pr
WHERE dpd.id_producto = pr.id_producto AND
			dpd.id_pedido IN (SELECT id_pedido
												FROM Pedido pd
												WHERE NOT EXISTS (SELECT *
																					FROM Detalle_Pedido dpdAux
																					WHERE dpdAux.id_pedido = pd.id_pedido AND
																								dpdAux.cantidad NOT BETWEEN 10 AND 12))
/*Primero, se buscan los pedidos que NO tienen productos que
	NO esten entre 10 y 12 unidades (doble negacion)
	Despues simplemente se sacan los datos de detalle_producto*/
ORDER BY dpd.id_pedido

//4)
SELECT id_producto, nombre_producto
FROM Producto
WHERE nombre_producto LIKE 'Queso%'

//5)
SELECT *
FROM Producto
WHERE nombre_producto = 'Queso Cabrales'

//6)
SELECT DISTINCT E.nombre_empresa, C.nombre_categoria
FROM detalle_pedido D, producto Pr, categoria C, pedido Pd, empresa_envio E
WHERE Pr.id_categoria = C.id_categoria AND
			D.id_producto = Pr.id_producto AND
			Pd.id_pedido = D.id_pedido AND
			E.id_empresa_envio = Pd.id_empresa_envio
ORDER BY E.nombre_empresa

//7)
SELECT *
FROM Pedido
WHERE fecha_envio IS NULL
ORDER BY fecha_pedido

//8)
SELECT *
FROM Pedido
WHERE fecha_envio IS NOT NULL
ORDER BY fecha_envio DESC

//9)
SELECT DISTINCT L1.nombre AS localidad_proveedor, L2.nombre AS localidad_cliente
FROM localidad L1, localidad L2, proveedor Pv, cliente C, pedido Pd, detalle_pedido D, producto Pr
WHERE L1.id_localidad = Pv.id_localidad AND
			Pv.id_proveedor = Pr.id_proveedor AND
			Pr.id_producto = D.id_producto AND
			D.id_pedido = Pd.id_pedido AND
			Pd.id_cliente = C.id_cliente AND
			C.id_localidad = L2.id_localidad

//10)
SELECT DISTINCT E.id_empleado, E.nombre, E.apellido
FROM empleado E, pedido P, cliente C, localidad L1, localidad L2
WHERE L1.id_localidad = C.id_localidad AND
			C.id_cliente = P.id_cliente AND
			P.id_empleado = E.id_empleado AND
			E.id_localidad = L2.id_localidad AND
			L1.id_pais = L2.id_pais
ORDER BY E.id_empleado

//11)
SELECT DISTINCT E.id_empleado, E.nombre, E.apellido
FROM empleado E, pedido P, cliente C, localidad L1, localidad L2
WHERE L1.id_localidad = C.id_localidad AND
			C.id_cliente = P.id_cliente AND
			P.id_empleado = E.id_empleado AND
			E.id_localidad = L2.id_localidad AND
			L1.id_pais = L2.id_pais
ORDER BY E.apellido

//12
SELECT DISTINCT E.id_empleado, E.nombre, E.apellido
FROM empleado E, pedido P, cliente C, localidad L1, localidad L2
WHERE L1.id_localidad = C.id_localidad AND
			C.id_cliente = P.id_cliente AND
			P.id_empleado = E.id_empleado AND
			E.id_localidad = L2.id_localidad AND
			L1.id_pais = L2.id_pais
ORDER BY E.apellido DESC

//14
SELECT DISTINCT nombre
FROM localidad
WHERE id_localidad IN ((SELECT DISTINCT L.id_localidad
												FROM proveedor Pv, localidad L
												WHERE Pv.id_localidad = L.id_localidad
												
												UNION
												
												SELECT DISTINCT L.id_localidad
												FROM cliente C, localidad L
												WHERE C.id_localidad = L.id_localidad)
												
												EXCEPT
												
												(SELECT DISTINCT L.id_localidad
												FROM proveedor Pv, localidad L
												WHERE Pv.id_localidad = L.id_localidad
												
												INTERSECT
												
												SELECT DISTINCT L.id_localidad
												FROM cliente C, localidad L
												WHERE C.id_localidad = L.id_localidad))
/*La operacion de conjunto aplicada fue la diferencia simetrica*/
ORDER BY nombre
```