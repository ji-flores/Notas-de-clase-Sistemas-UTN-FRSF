# Guía Práctica N°3 - Elasticsearch

**Autores:**

- Flores, José Ignacio
- Pallotti, Francisco Fernando

---

## Ejercicio 1

### Solución

```json
PUT /indice_para_test
{
  "settings": {
    "analysis": {
      "char_filter": {
        "delete_html_header": {
          "type" : "mapping",
          "mappings" : [
            "<h2> =>",
            "</h2> =>"
          ]
        },
        "simbolos" : {
          "type" : "mapping",
          "mappings" : [
            "$ => pesos",
            "% => por ciento"
          ]
        }
      }, 
      "filter": {
        "stop_spanish": {
          "type" : "stop",
          "stopwords" : "_spanish_"
        },
        "sinonimos" : {
          "type" : "synonym",
          "synonyms" : [
            "casa,hogar"
          ]
        }
      }, 
      "analyzer": {
        "mi-analizador" : {
          "type" : "custom",
          "char_filter" : ["delete_html_header","simbolos"],
          "tokenizer" : "whitespace",
          "filter" : ["stop_spanish","sinonimos","lowercase"]
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "descripcion" : {
        "type" : "text",
        "analyzer": "mi-analizador"
      }
    }
  }
}
```

### Comentarios

- `html_strip` no elimina los markings de header `<h2>` y `</h2>`, sino que los reemplaza por un equivalente (saltos de linea). Por esta razon se implementa un filtro de tipo `mapping` que directamente elimina cualquier aparición de las secuencias de caracteres `<h2>` y `</h2>`.

## Ejercicio 2

### Solución

```json
POST /indice_para_test/_doc
{
  "descripcion" : "La empresa ENERFIT tiene 15000000 $ que representan el 3 % del <h2> dinero total </h2>"
}
```

## Ejercicio 3

### Solución

```json
GET /indice_para_test/_analyze
{
  "analyzer" : "mi-analizador",
  "text" : "La empresa ENERFIT tiene 15000000 $ que representan el 3 % del <h2> dinero total </h2>"
}
```

### Salida

```json
{
  "tokens" : [
    {
      "token" : "la",
      "start_offset" : 0,
      "end_offset" : 2,
      "type" : "word",
      "position" : 0
    },
    {
      "token" : "empresa",
      "start_offset" : 3,
      "end_offset" : 10,
      "type" : "word",
      "position" : 1
    },
    {
      "token" : "enerfit",
      "start_offset" : 11,
      "end_offset" : 18,
      "type" : "word",
      "position" : 2
    },
    {
      "token" : "15000000",
      "start_offset" : 25,
      "end_offset" : 33,
      "type" : "word",
      "position" : 4
    },
    {
      "token" : "pesos",
      "start_offset" : 34,
      "end_offset" : 35,
      "type" : "word",
      "position" : 5
    },
    {
      "token" : "representan",
      "start_offset" : 40,
      "end_offset" : 51,
      "type" : "word",
      "position" : 7
    },
    {
      "token" : "3",
      "start_offset" : 55,
      "end_offset" : 56,
      "type" : "word",
      "position" : 9
    },
    {
      "token" : "ciento",
      "start_offset" : 57,
      "end_offset" : 58,
      "type" : "word",
      "position" : 11
    },
    {
      "token" : "dinero",
      "start_offset" : 68,
      "end_offset" : 74,
      "type" : "word",
      "position" : 13
    },
    {
      "token" : "total",
      "start_offset" : 75,
      "end_offset" : 80,
      "type" : "word",
      "position" : 14
    }
  ]
}
```

### Comentarios

- Notar que no aparecen tokens `por` y `ciento`, sino que solo un token `ciento`. Pensamos que esto se debe a que primero se ejecuta el filtro de caracteres que convierte cada aparición del caracter `%` en la cadena `por ciento` y luego el filtro de tokens `stop_spanish` filtra el token `por` por considerarlo una palabra de uso común del idioma Español.

## Ejercicio 4

### Solución

```json
POST /indice_para_test/_doc
{
  "descripcion" : "La casa se reserva el derecho de admisión."
}
```

## Ejercicio 5

### Solución

```json
GET /indice_para_test/_search
{
  "query": {
    "match": {
      "descripcion": "hogar"
    }
  }
}
```

### Salida

```json
{
  "took" : 1,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 1,
      "relation" : "eq"
    },
    "max_score" : 1.065449,
    "hits" : [
      {
        "_index" : "indice_para_test",
        "_type" : "_doc",
        "_id" : "NRbIL4sBTZnSUBhHg9De",
        "_score" : 1.065449,
        "_source" : {
          "descripcion" : "La casa se reserva el derecho de admisión."
        }
      }
    ]
  }
}
```

## Ejercicio 6

Comenzamos cerrando el indice

```jsx
POST /indice_para_test/_close
```

### Solución

```json
PUT /indice_para_test/_settings
{
  "settings": {
    "analysis": {
      "char_filter": {
        "filtro_esszet": {
          "type" : "mapping",
          "mappings" : [
            "ß => ss",
            "ẞ => SS"
          ]
        }
      }, 
      "analyzer": {
        "mi_nuevo_analizador" : {
          "type" : "custom",
          "char_filter" : ["filtro_esszet"],
          "tokenizer" : "uax_url_email",
          "filter" : ["asciifolding"]
        }
      }
    }
  }
}
```

Luego abrimos el indice

```jsx
POST /indice_para_test/_open
```

### Comentarios

El filtro de caracterres `filtro esszet` elimina la letra homonima del idioma aleman, reemplazandola por el fonema correspondiente del aleman moderno.

El tokenizador `uax_url_email` funciona de manera similar al standard, con la diferenrencia de que mantiene direcciones de email y urls.

El filtro de tokens `asciifolding` transforma los caracteres que no esten

## Ejercicio 7

### Solución

```json
GET /indice_para_test/_settings
```

Obtenemos los resultados:

```jsx
{
  "indice_para_test" : {
    "settings" : {
      "index" : {
        "routing" : {
          "allocation" : {
            "include" : {
              "_tier_preference" : "data_content"
            }
          }
        },
        "number_of_shards" : "1",
        "provided_name" : "indice_para_test",
        "creation_date" : "1697383969616",
        "analysis" : {
          "filter" : {
            "sinonimos" : {
              "type" : "synonym",
              "synonyms" : [
                "casa,hogar"
              ]
            },
            "stop_spanish" : {
              "type" : "stop",
              "stopwords" : "_spanish_"
            }
          },
          "analyzer" : {
            "mi_nuevo_analizador" : {
              "filter" : [
                "asciifolding"
              ],
              "char_filter" : [
                "filtro_esszet"
              ],
              "type" : "custom",
              "tokenizer" : "uax_url_email"
            },
            "mi-analizador" : {
              "filter" : [
                "stop_spanish",
                "sinonimos",
                "lowercase"
              ],
              "char_filter" : [
                "delete_html_header",
                "simbolos"
              ],
              "type" : "custom",
              "tokenizer" : "whitespace"
            }
          },
          "char_filter" : {
            "delete_html_header" : {
              "type" : "mapping",
              "mappings" : [
                "<h2> =>",
                "</h2> =>"
              ]
            },
            "simbolos" : {
              "type" : "mapping",
              "mappings" : [
                "$ => pesos",
                "% => por ciento"
              ]
            },
            "filtro_esszet" : {
              "type" : "mapping",
              "mappings" : [
                "ß => ss",
                "ẞ => SS"
              ]
            }
          }
        },
        "number_of_replicas" : "1",
        "uuid" : "FBm9D776TIufHqdz1TTmkw",
        "version" : {
          "created" : "7130099"
        }
      }
    }
  }
}
```

### Comentarios

## Ejercicio 8

### Solución

Primero agregamos el campo “texto”

```jsx
PUT /indice_para_test/_mapping
{
  "properties":{
    "texto":{
      "type":"text",
      "analyzer":"mi_nuevo_analizador"
    }
  }
}
```

Luego indexamos los documentos

```jsx

POST /indice_para_test/_doc
{
  "descripcion" : "Der Winter kündigt sich durch Frost an. Draußen ist es sehr kalt und Schnee bedeckt die Landschaft.",
  "texto":"Der Winter kündigt sich durch Frost an. Draußen ist es sehr kalt und Schnee bedeckt die Landschaft ß ß."
}
```

### Comentarios

## Ejercicio 9

### Solución

Realizamos la siguiente consulta del termino `ss`, para buscar las apariciones de la letra eszett.

```json
GET /indice_para_test/_search
{
  "query": {
    "match": {
      "texto":{
        "query": "ss",
        "analyzer": "mi_nuevo_analizador"
      }
    }
  }
}
```

Obtenemos los siguientes resultados

```jsx
{
  "took" : 0,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 1,
      "relation" : "eq"
    },
    "max_score" : 0.39556286,
    "hits" : [
      {
        "_index" : "indice_para_test",
        "_type" : "_doc",
        "_id" : "4UL4M4sBz4cCxUJ_WF6H",
        "_score" : 0.39556286,
        "_source" : {
          "descripcion" : "Der Winter kündigt sich durch Frost an. Draußen ist es sehr kalt und Schnee bedeckt die Landschaft.",
          "texto" : "Der Winter kündigt sich durch Frost an. Draußen ist es sehr kalt und Schnee bedeckt die Landschaft ß ß."
        }
      }
    ]
  }
}
```

### Comentarios

## Ejercicio 10

Asi como se explicó anteriormente, el filtro busca facilitar las consultas sobre textos en idioma alemán, donde es factible la aparición de las letras eszett, las cuales están mayoritariamente deprecadas en la producción de textos modernos, siendo reemplazadas por dos caracteres s.

Al correr la consulta del inciso 9, realizamos la busqueda de los dos caracteres `s`, y el resultado obtenido contiene en sí al documento que se insertó, el cual no tiene apariciones de las letras ss como tal, sino de `ß`

### Comentarios