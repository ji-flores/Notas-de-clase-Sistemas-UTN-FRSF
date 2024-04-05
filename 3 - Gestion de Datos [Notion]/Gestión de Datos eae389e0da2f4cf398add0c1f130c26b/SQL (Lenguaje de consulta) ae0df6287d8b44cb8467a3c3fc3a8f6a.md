# SQL (Lenguaje de consulta)

# SELECT

```sql
SELECT <lista-de-atributos> //Proyección
FROM <lista-de-tablas> //Relación
[WHERE <condicion>] //Selección
```

- El motor procesa primero el bloque FROM, luego el WHERE y por ultimo el SELECT
- `SELECT` devuelve tuplas duplicadas, a diferencia de la Proyección.
- **Ejemplo:**
$\pi_{\text{dni,nombre,apellido}}(\text{Empleado})$$\iff$
    
    `SELECT Dni, Nombre, Apellido
    FROM Empleado`
    
- Si se quiere que el resultado no tenga duplicados, se agrega la palabra clave DISTINCT: `SELECT DISTINCT <lista-de-atributos>`. También, por más que sea el default, hay una forma de expresar explícitamente que se quiere admitir duplicados: `SELECT ALL <lista-de-atributos>`.
- Recuperar todos los valores de las tuplas: `SELECT *`
- La lista de atributos puede contener operaciones aritméticas (+, -, *, /) que operen sobre constantes y/o atributos de las tuplas. Ej: `SELECT Dni, Sexo, Sueldo*0.5`
- **Ejemplo:**
$\sigma_\text{nombre="Juan" AND apellido="Perez"}(\text{Empleado})$$\iff$
`SELECT *
FROM Empleado
WHERE Nombre=”Juan” AND Apellido=”Perez”`
- **Nota:** Para representar intervalos de valores [a,b] en SQL: `a BETWEEN b`
- Si hay más de un argumento en `FROM`, la tabla resultado es el producto cartesiano ($\times$) entre los argumentos. Añadir una condición de join en `WHERE` resultaría en una operación equivalente al Join algebraico ($\bowtie$).
- **Alias:** Cambiar el nombre de una entidad. `ENTIDAD AS ALIAS_ENTIDAD`
Para cuando se pasa la misma tabla como parametro a `FROM`, se le da un alias con `TABLA AS ALIAS_TABLA` para poder diferenciar entre las dos “instancias” de la misma tabla.
- `**ORDER BY**`: Permite ordenar las tuplas del resultado de una consulta por los valores de uno o más atributos. Los atributos van en orden de prioridad. El orden de la tabla en realidad no se cambia (el orden siempre es por inserción), solo se muestra en un cierto orden.
    - El orden predeterminado es ASC, DESC ordena descendentemente.
    - En vez de especificar el nombre de columna, se puede usar el nro. de columna. No es muy usado porque el nro. de columna es dinámico.
    - Es posible ordenar por un campo no proyectado.
- `LIKE` / `NOT LIKE`: Permite realizar comparaciones de patrones sobre cadenas de caracteres. `%` representa cero o más caracteres arbitrarios, `_` un solo caracter.
    - Ej:
    `SELECT *
    FROM Empelado
    WHERE Nombre LIKE ‘A%’`

## Operaciones de conjunto

SQL incorpora **Union**, **Intersect** (intersección), **Except** (diferencia).

- Condiciones de aplicación:
    - Tablas del mismo grado (cantidad de columnas).
    - Cada columna con el mismo dominio.
- El resultado no tiene repetidos, aunque puede forzarse a que los incluya.
- El nombre de cada columna es el del primer operando.

```jsx
//Ejemplo; Empleados que trabajan en proyectos del dpto. 5 pero no del 4.
SELECT DniEmpleado
FROM Trabaja_En AS t, Proyecto AS p
WHERE p.NumDptoProyecto = 5 AND p.NumProyecto = t.NumProy

EXCEPT

SELECT DniEmpleado
FROM Trabaja_En AS t, Proyecto AS p
WHERE p.NumDptoProyecto = 4 AND p.NumProyecto = t.NumProy
```

## Consultas anidadas

Algunas conjuntas requieren obtener valores existentes en la BD para usarlos despues en una condición de comparación.

Operadores de comparación contra un conjunto:

- IN / NOT IN: Comprobar si se es miembro o no de un conjunto, donde el conjunto es una colección de valores es una colección de valores producidos por una clausula SELECT.
- `ANY`, `SOME`, `ALL` (se combinan con =, >, ≥, <, ≤, <>, osea operadores de comparación):
Sintaxis: `<valor> <operador_de_comparacion> (ANY | SOME | ALL) <conjunto>`.
`SOME` y `ANY` son indistintos.

```jsx
//Dos maneras de hacer lo mismo

SELECT * 
FROM Empleado
WHERE sueldo BETWEEN 30000 AND 40000

SELECT *
FROM Empleado
WHERE sueldo IN (
									SELECT sueldo
									FROM Empleado 
									WHERE sueldo BETWEEN 30000 AND 40000
								)

//Ejemplo
SELECT DISTINCT nombre, apellido1, apellido2, dni, numero
FROM Empleado e, Trabaja_En tr
WHERE e.dni = tr.dniEmpleado
AND numProy NOT IN (SELECT numProy
										FROM Empleado e, Trabaja_En tr
										WHERE e.nombre = 'Alberto' AND e.apellido1 = 'Campos')
										
```

- Se resuelve primero la consulta interna.

## `EXISTS` / `NOT EXISTS`

EXISTS se usa para comprobar si el resultado de una consulta anidada correlacionada está vacio o no.

EXISTS devuelve true si la subconsulta devuelve tuplas, de lo contrario false. NOT EXISTS es el contrario.

Normalmente se utilizan en combinación con una consulta anidada correlacionada. Que este correlacionada significa que la subconsulta usa valores de la consulta “padre”. Es parecido a un for anidado donde cada subconsulta se ejecuta cada vez con un parametro distinto.

Es el equivalente a la operación Division.