# 30/10 - Apache Cassandra - Introducción

- Los datos se modelan tal cual van a estar almacenados de manera fisica.
- Es util para casos en los que la base de datos reciba mas solicitudes de escritura que de lectura.
- Caracteristicas
    - Distribuidas: Geograficamente.
    - Crecimiento lineal: Por cada nodo que se agrega…
    
    …
    
    - Escalabilidad horizontal: En un Esc. vertical, agregar más espacio → mejorar el hardware (disco, etc.) del servidor. Esc. horizontal significa que puede simplemente agregarse más hardware separado y para el usuario es transparente.
- En Cassandra puede configurarse la importancia que se le da a la consistencia, incluso para cada consulta.

## Modelo de datos

- La columna es la unidad basica de almacenamiento. Son pares nombre-valor.
- **`Row-KEY`:** Hay una clave primaria para cada conjunto de columnas que las asocia a una entidad particular. Equivale a una fila en el modelo relacional.
    - Tiene dos partes: Clave de partición. Cassandra agrupa por particiones conjuntos de filas que tengan el mismo valor para sus columnas, estas tienen la misma clave de aprticion y se almacenan en la misma particion de disco. Clave de agrupamiento. Determina el orden fisico en el que se almacenan las filas
- Familias de columnas: Equivalen a las tablas del MR.
    - Cada fila se identifica y accede mediante una promary key.
    - Las columnas en una familia no son fijas.
- En consecuencia del modelo de datos, es muy caro ordenar por una columna en especifico cuando se realizan consultas.
- Si se quiere insertar una columna con la misma clave primaria, en vez de notificar un error, se realiza un UPSERT (si no existe se inserta y si existe se actualiza o sobreescribe).
-