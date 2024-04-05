# 19/09 - Introducción y CRUD

***Elasticsearch*** es una base de datos, pero que funciona como un **motor de búsqueda**.

Funciona muy bien para trabajar con **campos de texto**.

Los **motores de búsqueda** surgieron debido a la necesidad de organizar, clasificar y gestionar la información de internet ya que cada vez surgen mas sitios web llenos de contenido.

- Permiten a los usuarios buscar información mediante claves o frases.
- Devuelven muy rápidamente los resultados.

De las text-based, es la primera en el ranking de las BD mas usadas.

### Características

- Basada en documentos JSON.
- Desarrollada en Java, y es código abierto.
- Basada en el motor de indexación Apache Lucene (1999).
- Facil comunicacion a traves de la API Rest, nos comunicamos con ella mediante el protocolo http.
- Libre de esquemas, aunque permite definirlos en caso de ser necesario. *Esquemas: Definición de tipos de datos para los campos.*
- Arquitectura distribuida, escalable y con alta disponibilidad.

### Composición

ElasticSearch esta compuesta por

- Sistema distribuido: Implementa la logica de coordinacion de los nodos de un cluster y el mantenimiento de sus datos.
- El motor de indexación o trabaja todo Lucene.

Los datos son almacenados como documentos JSON.

Un conjunto de documentos forma un Indice (no el indice tradicional, sino una agrupación logica de documentos equivalente a una tabla (SQL) o una colección (Mongo))

Dentro de un indice, los documentos no tienen porque tener la misma estructura.

Los esquemas (indices) son definidos dinámicamente.

**Documentos JSON:** Compuestos por pares campo valor:

```json
{
	"field1": "value1",
	"field2": "value2",
	...
	"fieldN": "valueN"
}
```

Los índices son estructuras de datos independientes

- **No** pueden relacionarse índices con otros.
- Al contrario que en un modelo de datos relacional en el que existen claves externas entre diferentes tablas.

## Indexación de documentos

- Proceso de añadir información a ElasticSearch
- Los datos de cada campo se indexan
- Los datos de texto se almacenan en índices invertidos.

**Índice invertido:** Estructura de datos que relaciona términos con los documentos que los contienen. Estos términos se almacenan en un diccionario (o tabla de dispersión) ordenado, lo que hace que sea muy rápido de encontrarlos y averiguar los documentos relacionados.

//Ejemplo

## Lucene

- Elasticsearch esta construido sobre Lucene, una libreria de busqueda de texto desarrollada en java y basada en indices invertidos.
- Un indice de Elasticsearch

## Sistema distribuido

Solo tiene sentido trabajar con muchos nodos si cada uno esta en un hardware o computadora distinta, porque si todos los nodos estan en una computadora y esta falla, fallan todos los nodos y no se obtiene alta disponibilidad.

Cada uno de los nodos contiene la misma información?

Los documentos se almacenana en indices, los indices se dividen en shards, que pueden ser.

- Lectura/escritura: Donde se escriben los datos.
- Solo lectura: Son replicas de los datos.

La fragmentación no tiene un tamaño predefinido.

Las ventajas son:

- Poder escalar horizontalmente su volumen de datos (es decir, el nro de documentos a almacenar)
- Consultas distrbuidas
- …

### Replicacion

- ¿Que sucede si el nodo donde se almacena un fragmento tiene una falla de disco?
- ElasticSearch admite la replicacion de fragmentos (la cantidad de replicas por defecto es una)
- La replicacion crea copias de los fragmentos que contiene un indice → réplicas.
- Un fragmneto que ha sido replicado

### Estados de un cluster

- Verde: Los shards y sus respectivas replicas se han podido asignar en todos los nodos.
- Amarillo: Los shards primarios se han asignado a los nodos pero una o mas replicas no se pudieron asignar.
- Rojo: Uno o mas shards primarios no se pudieron asignar.

### Gestion de clusters

Ante la caida de un nodo se reasignan los shards a un nodo caido. Si no se tienen nodos, la información se pierde (es muy posible que haya una replica para salvar la situación).

## Indices

### Mapeo

Podemos no hacer el mapeo explicitamente y dejar que Elasticsearch defina los tipos basado en los documentos que haya cargados.

No puede cambiarse el tipo de dato de un campo una vez creado, si puede “cambiarse el nombre” de un campo creando un nuevo campo **alias.**

```json
"properties": {
	"alias-field" : {"type" : "alias",
									 "path" : "field-con-nombre-muy-largo"}
}
```

---

*Desde este punto empece a anotar solo lo que dice Fernanda, completar con diapositiva…*

### Indexación de documentos

- A traves de su propia API.
- Si indexas un documento en un indice que no existe, se crea el indice.
- Version del documento: Aumenta cada vez que se hacen cambios sobre el doc.
- Numero de secuencia enumera las operaciones realizadas sobre el indice.
- Primary term: Shard primario encargado de la indexación
- `PUT/<index>/_doc/<x>` sobre escribe el documento con id `<x>` si ya existe, si se quiere evitar otro debe utilizarse `PUT/<index>/_create/<x>`

### Obtener documentos

- Parece que todos los documentos arrancan con sus metadatos. Si solo se quiere ver el “source” o el payload, `GET/<index>/_source/<id>/`

### Consultas de documentos

- Consultar todos los documentos en un indice: `GET/<index>/_search`

`_search` también arranca con metadatos. Además, para cada documento devuelve:

- `score`: indica cuanto se ajusta cada documento a la búsqueda realizada, cuanto mayor el numero más relevante.

Al final del documento se encuentra `max_score` que es la puntuación del documento más relevante.

### Actualización de documentos

```json
POST/<index>/_update/<id>
{
	"doc" : {"field0":"new-value0",
					 ...,
					 "fieldN":"new-valueN"}
}
```

### Eliminación de documentos

```json
POST/<index>/_delete/<id>
```

- Consiste en un borrado lógico
- Cuando a Elasticsearch le parece lo borra físicamente.

**Eliminación en el contexto de un cluster**

1. Se genera la solicitud
2. El cluster lle el id del documento a borrar y determina en que shard primario se encuentra
3. Borra el documento del shard primario
4. Luego, la operacion se propaga en las replicas.

### Indexación de documentos en masa

- Realizar multiples operaciones (Indexar, crear, actualizar, eliminar) sobre un indice en una sola solicitud.
- Reduce el overhead (el ida y vuelta) de la red.
- Incrementa significativamente la velocidad de indexación

```json
POST/<index>/_bulk
//Leer de la diapositiva
```

### Actualizar la configuración del indice

- Campos `keyword`: Son campos de texto que no se analizan, se utilizan para clasificación.
    - ElasticSearch permite guardar un campo de texto como `text` y `keyword`. Se usa uno u otro dependiendo de lo que se tenga que hacer.

### Keyword

…

### Object

-