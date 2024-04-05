# Guía Práctica N°1 - Elasticsearch

**Autor:** Flores, José Ignacio

---

## Ejercicio 1

*Crear el índice **empleados** configurándolo de la siguiente manera:*

- *Shards: 1*
- *Réplicas: 0*

*Modelo de datos:*

| Campo | Tipo de dato |
| --- | --- |
| nombre | text |
| apellido | text |
| edad | integer |
| fecha_ingreso | text |
| profesion | text |

### Comando

```json
PUT /empleados
{
  "settings": {
    "number_of_shards" : 1,
    "number_of_replicas" : 0
  },
  "mappings": {
    "properties": {
      "nombre" : {"type": "text"},
      "apellido" : {"type": "text"},
      "edad" : {"type": "integer"},
      "fecha_ingreso" : {"type": "text"},
      "profesion" : {"type": "text"}
    }
  }
}
```

### Salida

```json
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "empleados"
}
```

## Ejercicio 2

*Utilizando el índice **empleados**, indexar 3 documentos, con los siguientes datos:*

![Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image1.jpeg](Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image1.jpeg)

### Comando

```json
PUT /empleados/_doc/1
{
  "nombre" : "Cecilia",
  "apellido" : "Lopez",
  "edad" : 35,
  "fecha_ingreso" : "18-11-2015",
  "profesion" : "Contadora"
}

PUT /empleados/_doc/2
{
  "nombre" : "Marcos",
  "apellido" : "Gianfelici",
  "edad" : 40,
  "fecha_ingreso" : "01-04-2010",
  "profesion" : "Ingeniero en Sistemas"
}

PUT /empleados/_doc/3
{
  "nombre" : "Geronimo",
  "apellido" : "Blas",
  "edad" : 55,
  "fecha_ingreso" : "01-04-1990",
  "profesion" : "Ingeniero en Sistemas"
}
```

### Salida

```json
# PUT /empleados/_doc/1
{
  "_index" : "empleados",
  "_type" : "_doc",
  "_id" : "1",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 0,
  "_primary_term" : 1
}

# PUT /empleados/_doc/2
{
  "_index" : "empleados",
  "_type" : "_doc",
  "_id" : "2",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 1,
  "_primary_term" : 1
}

# PUT /empleados/_doc/3
{
  "_index" : "empleados",
  "_type" : "_doc",
  "_id" : "3",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 2,
  "_primary_term" : 1
}
```

## Ejercicio 3

*Verificar qué resultado se obtiene con la siguiente petición:*

![Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image2.jpeg](Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image2.jpeg)

### Comando

```json
POST /empleados/_doc/1
{
  "nombre": "Abel",
  "apellido": "Trangoni",
  "edad": 30,
  "fecha_ingreso": "01-05-2019",
  "profesion": "Licenciado en RRHH"
}
```

### Salida

```json
{
  "_index" : "empleados",
  "_type" : "_doc",
  "_id" : "1",
  "_version" : 2,
  "result" : "updated",
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 3,
  "_primary_term" : 1
}
```

### Comentarios

Se actualizo el documento "1", sobrescribiendo los datos en favor de los especificados en el comando. Notar que ha cambiado la versión del documento.

## Ejercicio 4

*Verificar el resultado de la siguiente petición:*

![Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image3.jpeg](Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image3.jpeg)

### Comando

```json
PUT /empleados/_create/1
{
  "nombre": "Abel",
  "apellido": "Trangoni",
  "edad": 30,
  "fecha_ingreso": "01-05-2019",
  "profesion": "Licenciado en RRHH"
}
```

### Salida

```json
{
  "error" : {
    "root_cause" : [
      {
        "type" : "version_conflict_engine_exception",
        "reason" : "[1]: version conflict, document already exists (current version [2])",
        "index_uuid" : "JJEwmP88RfCNeK-WIMMhCw",
        "shard" : "0",
        "index" : "empleados"
      }
    ],
    "type" : "version_conflict_engine_exception",
    "reason" : "[1]: version conflict, document already exists (current version [2])",
    "index_uuid" : "JJEwmP88RfCNeK-WIMMhCw",
    "shard" : "0",
    "index" : "empleados"
  },
  "status" : 409
}
```

### Comentarios

En contraste al comando del ejercicio anterior, este comando si admite el comportamiento de no sobrescribir documentos con una **_id** determinada si esta ya existe en el índice.

## Ejercicio 5

*Indexar un nuevo documento, con los siguientes datos:*

![Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image4.jpeg](Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image4.jpeg)

### Comando

```json
PUT /empleados/_doc/4
{
  "nombre": "Paula",
  "apellido": "Cassini",
  "edad": 38,
  "fecha_ingreso": "20-03-2006",
  "profesion": "Licenciada en Sistemas",
  "ciudad": "Rosario",
  "codpostal": 2000
}
```

### Salida

```json
{
  "_index" : "empleados",
  "_type" : "_doc",
  "_id" : "4",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 4,
  "_primary_term" : 1
}
```

## Ejercicio 6

*Comprobar qué estructura tiene el índice **empleados**.*

### Comando

```json
GET /empleados/_mappings
```

### Salida

```json
{
  "empleados" : {
    "mappings" : {
      "properties" : {
        "apellido" : {
          "type" : "text"
        },
        "ciudad" : {
          "type" : "text",
          "fields" : {
            "keyword" : {
              "type" : "keyword",
              "ignore_above" : 256
            }
          }
        },
        "codpostal" : {
          "type" : "long"
        },
        "edad" : {
          "type" : "integer"
        },
        "fecha_ingreso" : {
          "type" : "text"
        },
        "nombre" : {
          "type" : "text"
        },
        "profesion" : {
          "type" : "text"
        }
      }
    }
  }
}
```

### Comentarios

Elasticsearch admite mapping dinámico, por lo que al insertar un nuevo documento con más campos que los especificados inicialmente, cambia automáticamente la estructura del índice.

## Ejercicio 7

*Recuperar los datos del documento con id=2.*

### Comando

```json
GET /empleados/_doc/2
```

### Salida

```json
{
  "_index" : "empleados",
  "_type" : "_doc",
  "_id" : "2",
  "_version" : 1,
  "_seq_no" : 1,
  "_primary_term" : 1,
  "found" : true,
  "_source" : {
    "nombre" : "Marcos",
    "apellido" : "Gianfelici",
    "edad" : 40,
    "fecha_ingreso" : "01-04-2010",
    "profesion" : "Ingeniero en Sistemas"
  }
}
```

## Ejercicio 8

*Modificar el documento de id=3 con los siguientes valores:*

- *fecha_ingreso: 01-01-1990*
- *profesion: Ingeniero en Informatica*

### Comando

```json
POST /empleados/_update/3
{
  "doc": {
    "fecha_ingreso" : "01-01-1990",
    "profesion" : "Ingeniero en Informatica"
  }
}
```

### Salida

```json
{
  "_index" : "empleados",
  "_type" : "_doc",
  "_id" : "3",
  "_version" : 2,
  "result" : "updated",
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 5,
  "_primary_term" : 1
}
```

## Ejercicio 9

*Procesar de manera masiva, los siguientes documentos:*

![Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image5.jpeg](Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/image5.jpeg)

### Comando

```json
POST /empleados/_bulk
{"index":{"_id":5}}
{"nombre":"Rafael","apellido":"Lopez","edad":37,"fecha_ingreso":"06-05-2012","profesion":"Analista"}
{"index":{"_id":6}}
{"nombre":"Juan","apellido":"Zanetta","edad":39,"fecha_ingreso":"13-07-2013","profesion":"Ingeniero en Sistemas"}
{"index":{"_id":7}}
{"nombre":"Laura","apellido":"Mendez","edad":50,"fecha_ingreso":"28-10-1995","profesion":"Arquitecta"}
{"delete":{"_id":1}}
{"update":{"_id":2}}
{"doc":{"nombre":"Marcos","apellido":"Gianfelici","edad":42,"fecha_ingreso":"01-04-2010","profesion":"Ingeniero en Sistemas"}}
```

### Salida

```json
{
  "took" : 23,
  "errors" : false,
  "items" : [
    {
      "index" : {
        "_index" : "empleados",
        "_type" : "_doc",
        "_id" : "5",
        "_version" : 1,
        "result" : "created",
        "_shards" : {
          "total" : 1,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 9,
        "_primary_term" : 1,
        "status" : 201
      }
    },
    {
      "index" : {
        "_index" : "empleados",
        "_type" : "_doc",
        "_id" : "6",
        "_version" : 1,
        "result" : "created",
        "_shards" : {
          "total" : 1,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 10,
        "_primary_term" : 1,
        "status" : 201
      }
    },
    {
      "index" : {
        "_index" : "empleados",
        "_type" : "_doc",
        "_id" : "7",
        "_version" : 1,
        "result" : "created",
        "_shards" : {
          "total" : 1,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 11,
        "_primary_term" : 1,
        "status" : 201
      }
    },
    {
      "delete" : {
        "_index" : "empleados",
        "_type" : "_doc",
        "_id" : "1",
        "_version" : 4,
        "result" : "deleted",
        "_shards" : {
          "total" : 1,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 12,
        "_primary_term" : 1,
        "status" : 200
      }
    },
    {
      "update" : {
        "_index" : "empleados",
        "_type" : "_doc",
        "_id" : "2",
        "_version" : 3,
        "result" : "updated",
        "_shards" : {
          "total" : 1,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 13,
        "_primary_term" : 1,
        "status" : 200
      }
    }
  ]
}
```

## Ejercicio 10

*Implementar un índice **autos**, de la siguiente manera:*

- *Shards:1*
- *Réplicas: 0*
- *Modelo de datos del índice:*
    - *Nombre_dueño: campo de tipo keyword*
    - *Coches: cada dueño tendrá varios coches*
        - *Marca: campo de tipo keyword*
        - *Modelo: campo de tipo keyword*

### Comando

```json
PUT /autos
{
  "settings": {
    "number_of_shards" : 1,
    "number_of_replicas" : 0
  },
  "mappings": {
    "properties": {
      "nombre_dueño" : {"type": "keyword"},
      "coches" : {
        "type" : "nested",
        "properties": {
          "marca" : {"type" : "keyword"},
          "modelo" : {"type" : "keyword"}
        }
      }
    }
  }
}
```

### Salida

```json
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "autos"
}
```

## Ejercicio 11

*En **autos**, indexar los siguientes documentos:*

![Untitled](Gui%CC%81a%20Pra%CC%81ctica%20N%C2%B01%20-%20Elasticsearch%207daa09d58b264488b1f566c06ae7b72e/Untitled.png)

### Comando

```json
POST /autos/_doc/
{
  "nombre_dueño" : "Juan Valenzuela",
  "coches" : [
    {
      "marca" : "Volkswagen",
      "modelo" : "T-cross"
    },
    {
      "marca" : "Fiat",
      "modelo" : "Cronos"
    }
  ]
}

POST /autos/_doc/
{
  "nombre_dueño" : "Marcela Soler",
  "coches" : [
    {
      "marca" : "Renault",
      "modelo" : "Duster"
    },
    {
      "marca" : "Jeep",
      "modelo" : "Compass"
    }
  ]
}
```

### Comando

```json
# POST /autos/_doc/
{
  "_index" : "autos",
  "_type" : "_doc",
  "_id" : "jtuV8YoB1n32tM362FVc",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 0,
  "_primary_term" : 1
}

# POST /autos/_doc/
{
  "_index" : "autos",
  "_type" : "_doc",
  "_id" : "j9uV8YoB1n32tM362FVv",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 1,
  "_primary_term" : 1
}
```