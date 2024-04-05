# Guía Práctica N°4 - Elasticsearch

**Autores:**

- Flores, José Ignacio
- Pallotti, Francisco Fernando

---

## Ejercicio 1

### Solución

```json
GET /kibana_sample_data_ecommerce/_search
{
   "query": {
    "match": {
      "category.keyword": "Men's Clothing"
    }
  },
  "size": 0,
  "aggs": {
    "cant_productos": {
      "sum": {
        "field": "total_quantity"
      }
    }
  }
}
```

### Salida

```json
{
  "took" : 25,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 2024,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "cant_productos" : {
      "value" : 4471.0
    }
  }
}
```

### Comentarios

## Ejercicio 2

### Solución

```json
GET /kibana_sample_data_ecommerce/_search
{
  "size": 0,
  "aggs": {
    "articulos_por_categoria": {
      "terms": {
        "field": "products.category.keyword"
      },
      "aggs": {
        "cant_prod": {
          "sum": {
            "field": "total_quantity"
          }
        }
      }
    }
  }
}

```

### Salida

```json
{
  "took" : 73,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 4675,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "articulos_por_categoria" : {
      "doc_count_error_upper_bound" : 0,
      "sum_other_doc_count" : 0,
      "buckets" : [
        {
          "key" : "Men's Clothing",
          "doc_count" : 2024,
          "cant_prod" : {
            "value" : 4471.0
          }
        },
        {
          "key" : "Women's Clothing",
          "doc_count" : 1903,
          "cant_prod" : {
            "value" : 4105.0
          }
        },
        {
          "key" : "Women's Shoes",
          "doc_count" : 1136,
          "cant_prod" : {
            "value" : 2540.0
          }
        },
        {
          "key" : "Men's Shoes",
          "doc_count" : 944,
          "cant_prod" : {
            "value" : 2161.0
          }
        },
        {
          "key" : "Women's Accessories",
          "doc_count" : 830,
          "cant_prod" : {
            "value" : 1916.0
          }
        },
        {
          "key" : "Men's Accessories",
          "doc_count" : 572,
          "cant_prod" : {
            "value" : 1316.0
          }
        }
      ]
    }
  }
}
```

### Comentarios

## Ejercicio 3

### Solución

```json
GET /kibana_sample_data_ecommerce/_search
{
  "size": 0,
  "aggs": {
    "compras_cliente": {
      "filter": {
        "term": {
          "customer_full_name.keyword": "Boris Maldonado"
        }
      },
    "aggs":{
      "cant_prod":{
        "sum": {
          "field": "total_quantity"
        }
      }
    }
    }
  }
}
```

### Salida

```json
{
  "took" : 160,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 4675,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "compras_cliente" : {
      "doc_count" : 1,
      "cant_prod" : {
        "value" : 2.0
      }
    }
  }
}
```

### Comentarios

## Ejercicio 4

### Solución

```json
GET /kibana_sample_data_ecommerce/_search
{
  "size": 0,
  "aggs": {
    "maxima_cant_comprada_por_cliente": {
      "max": {
        "field": "total_quantity"
      }
    }
  }
}
```

### Salida

```json
{
  "took" : 3,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 4675,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "maxima_cant_comprada_por_cliente" : {
      "value" : 8.0
    }
  }
}
```

## Ejercicio 5

*BD: moviesdb*

Obtener la cantidad de películas lanzadas en los siguientes períodos: antes del 2000, 2000- 2010, 2010-2020 y a partir del 2020.

### Solución

```json
GET /moviesdb/_search
{
  "size": 0, 
  "aggs": {
    "movies-per-decade": {
      "range": {
        "field": "release_date",
        "ranges": [
          {
            "to" : "2000-01-01"
          },
          {
            "from": "2000-01-01",
            "to": "2010-01-01"
          },
          {
            "from" : "2010-01-01",
            "to" : "2020-01-01"
          },
          {
            "from" : "2020-01-01"
          }
        ]
      }
    }
  }
}
```

### Salida

```json
{
  "took" : 13,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 10000,
      "relation" : "gte"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "movies-per-decade" : {
      "buckets" : [
        {
          "key" : "*-2000-01-01T00:00:00.000Z",
          "to" : 9.466848E11,
          "to_as_string" : "2000-01-01T00:00:00.000Z",
          "doc_count" : 21874
        },
        {
          "key" : "2000-01-01T00:00:00.000Z-2010-01-01T00:00:00.000Z",
          "from" : 9.466848E11,
          "from_as_string" : "2000-01-01T00:00:00.000Z",
          "to" : 1.262304E12,
          "to_as_string" : "2010-01-01T00:00:00.000Z",
          "doc_count" : 8926
        },
        {
          "key" : "2010-01-01T00:00:00.000Z-2020-01-01T00:00:00.000Z",
          "from" : 1.262304E12,
          "from_as_string" : "2010-01-01T00:00:00.000Z",
          "to" : 1.5778368E12,
          "to_as_string" : "2020-01-01T00:00:00.000Z",
          "doc_count" : 18518
        },
        {
          "key" : "2020-01-01T00:00:00.000Z-*",
          "from" : 1.5778368E12,
          "from_as_string" : "2020-01-01T00:00:00.000Z",
          "doc_count" : 401
        }
      ]
    }
  }
}
```

## Ejercicio 6

*BD: movies*

Obtener el promedio de películas estrenadas cada 4 años.

### Solución

```json
GET /movies/_search
{
  "size" : 0,
  "aggs": {
    "movies-every-4y": {
      "histogram": {
        "field" : "year",
        "interval": 4
      },
      "aggs": {
        "count-movies-every-4y": {
          "value_count": {
            "field": "year"
          }
        }
      }
    },
    "avg-movies-every-4y": {
        "avg_bucket" : {
          "buckets_path" : "movies-every-4y>count-movies-every-4y"
        }
      }
  }
}
```

### Salida

```json
{
  "took" : 6,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 10,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "movies-every-4y" : {
      "buckets" : [
        {
          "key" : 2000.0,
          "doc_count" : 9,
          "count-movies-every-4y" : {
            "value" : 9
          }
        },
        {
          "key" : 2004.0,
          "doc_count" : 0,
          "count-movies-every-4y" : {
            "value" : 0
          }
        },
        {
          "key" : 2008.0,
          "doc_count" : 1,
          "count-movies-every-4y" : {
            "value" : 1
          }
        }
      ]
    },
    "avg-movies-every-4y" : {
      "value" : 5.0
    }
  }
}
```

## Ejercicio 7

*BD: kibana_sample_data_ecommerce*

Obtener una estadística (cantidad de productos, cant. mínima, máxima, etc.) de las compras realizadas por compradores hombres y por compradoras mujeres.

### Solución

```json
GET kibana_sample_data_ecommerce/_search
{
  "size": 0,
  "aggs": {
    "por-genero": {
      "terms": {
        "field" : "customer_gender"
      },
      "aggs": {
        "stats-cantidad-productos": {
          "stats": {"field": "total_quantity"}
        }
      }
    }
  }
}
```

### Salida

```json
{
  "took" : 18,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 4675,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "por-genero" : {
      "doc_count_error_upper_bound" : 0,
      "sum_other_doc_count" : 0,
      "buckets" : [
        {
          "key" : "FEMALE",
          "doc_count" : 2433,
          "stats-cantidad-productos" : {
            "count" : 2433,
            "min" : 1.0,
            "max" : 4.0,
            "avg" : 2.1265926839293052,
            "sum" : 5174.0
          }
        },
        {
          "key" : "MALE",
          "doc_count" : 2242,
          "stats-cantidad-productos" : {
            "count" : 2242,
            "min" : 1.0,
            "max" : 8.0,
            "avg" : 2.1931311329170384,
            "sum" : 4917.0
          }
        }
      ]
    }
  }
}
```

### Comentarios

Para calcular las estadísticas, se toma en cuenta la cantidad de total de productos comprados en una compra (`total_quantity`), contando repetidos (es decir, si alguien esta llevando 2 zapatillas y 1 gorra, se contabilizan 3 productos, por más que solo sean dos “tipos” de productos distintos).

## Ejercicio 8

*BD: accounts*

Obtener el valor promedio de los saldos mensuales de cada estado.

### Solución

```json
GET accounts/_search
{
  "size": 0,
  "aggs": {
    "agrupar-por-estados" : {
      "terms": {
        "field" : "state.keyword",
        "size" : 100
      },
      "aggs" : {
        "promedio-saldos-mensuales" : {
          "avg": {"field" : "balance"}
        },
        "sort-por-promedio" : {
          "bucket_sort": {
            "sort": [{"promedio-saldos-mensuales" : {"order" : "desc"}}]
          }
        }
      }
    }
  }
}
```

### Salida

```json
{
  "took" : 4,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 1000,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "agrupar-por-estados" : {
      "doc_count_error_upper_bound" : 0,
      "sum_other_doc_count" : 0,
      "buckets" : [
        {
          "key" : "CO",
          "doc_count" : 14,
          "promedio-saldos-mensuales" : {
            "value" : 32460.35714285714
          }
        },
        {
          "key" : "NE",
          "doc_count" : 16,
          "promedio-saldos-mensuales" : {
            "value" : 32041.5625
          }
        },
        {
          "key" : "AZ",
          "doc_count" : 14,
          "promedio-saldos-mensuales" : {
            "value" : 31634.785714285714
          }
        },
        {
          "key" : "MT",
          "doc_count" : 17,
          "promedio-saldos-mensuales" : {
            "value" : 31147.41176470588
          }
        },
        {
          "key" : "VA",
          "doc_count" : 16,
          "promedio-saldos-mensuales" : {
            "value" : 30600.0625
          }
        },
        {
          "key" : "GA",
          "doc_count" : 19,
          "promedio-saldos-mensuales" : {
            "value" : 30089.0
          }
        },
        {
          "key" : "MA",
          "doc_count" : 24,
          "promedio-saldos-mensuales" : {
            "value" : 29600.333333333332
          }
        },
        {
          "key" : "IL",
          "doc_count" : 22,
          "promedio-saldos-mensuales" : {
            "value" : 29489.727272727272
          }
        },
        {
          "key" : "NM",
          "doc_count" : 14,
          "promedio-saldos-mensuales" : {
            "value" : 28792.64285714286
          }
        },
        {
          "key" : "LA",
          "doc_count" : 17,
          "promedio-saldos-mensuales" : {
            "value" : 28791.823529411766
          }
        },
        {
          "key" : "TN",
          "doc_count" : 25,
          "promedio-saldos-mensuales" : {
            "value" : 28365.4
          }
        },
        {
          "key" : "CT",
          "doc_count" : 16,
          "promedio-saldos-mensuales" : {
            "value" : 28278.4375
          }
        },
        {
          "key" : "RI",
          "doc_count" : 18,
          "promedio-saldos-mensuales" : {
            "value" : 28246.722222222223
          }
        },
        {
          "key" : "OK",
          "doc_count" : 22,
          "promedio-saldos-mensuales" : {
            "value" : 27740.68181818182
          }
        },
        {
          "key" : "MI",
          "doc_count" : 19,
          "promedio-saldos-mensuales" : {
            "value" : 27439.473684210527
          }
        },
        {
          "key" : "AR",
          "doc_count" : 18,
          "promedio-saldos-mensuales" : {
            "value" : 27238.166666666668
          }
        },
        {
          "key" : "NC",
          "doc_count" : 22,
          "promedio-saldos-mensuales" : {
            "value" : 27171.863636363636
          }
        },
        {
          "key" : "DE",
          "doc_count" : 14,
          "promedio-saldos-mensuales" : {
            "value" : 26965.214285714286
          }
        },
        {
          "key" : "KY",
          "doc_count" : 18,
          "promedio-saldos-mensuales" : {
            "value" : 26895.5
          }
        },
        {
          "key" : "UT",
          "doc_count" : 20,
          "promedio-saldos-mensuales" : {
            "value" : 26695.4
          }
        },
        {
          "key" : "ND",
          "doc_count" : 24,
          "promedio-saldos-mensuales" : {
            "value" : 26577.333333333332
          }
        },
        {
          "key" : "SD",
          "doc_count" : 16,
          "promedio-saldos-mensuales" : {
            "value" : 26248.8125
          }
        },
        {
          "key" : "NY",
          "doc_count" : 20,
          "promedio-saldos-mensuales" : {
            "value" : 26181.35
          }
        },
        {
          "key" : "MD",
          "doc_count" : 28,
          "promedio-saldos-mensuales" : {
            "value" : 26161.535714285714
          }
        },
        {
          "key" : "AK",
          "doc_count" : 22,
          "promedio-saldos-mensuales" : {
            "value" : 26131.863636363636
          }
        },
        {
          "key" : "TX",
          "doc_count" : 30,
          "promedio-saldos-mensuales" : {
            "value" : 26073.3
          }
        },
        {
          "key" : "VT",
          "doc_count" : 20,
          "promedio-saldos-mensuales" : {
            "value" : 26038.35
          }
        },
        {
          "key" : "AL",
          "doc_count" : 25,
          "promedio-saldos-mensuales" : {
            "value" : 25739.56
          }
        },
        {
          "key" : "WA",
          "doc_count" : 19,
          "promedio-saldos-mensuales" : {
            "value" : 25460.052631578947
          }
        },
        {
          "key" : "NJ",
          "doc_count" : 17,
          "promedio-saldos-mensuales" : {
            "value" : 25302.823529411766
          }
        },
        {
          "key" : "MO",
          "doc_count" : 23,
          "promedio-saldos-mensuales" : {
            "value" : 25253.652173913044
          }
        },
        {
          "key" : "KS",
          "doc_count" : 18,
          "promedio-saldos-mensuales" : {
            "value" : 25197.222222222223
          }
        },
        {
          "key" : "IA",
          "doc_count" : 19,
          "promedio-saldos-mensuales" : {
            "value" : 25159.842105263157
          }
        },
        {
          "key" : "NH",
          "doc_count" : 21,
          "promedio-saldos-mensuales" : {
            "value" : 24571.04761904762
          }
        },
        {
          "key" : "OH",
          "doc_count" : 19,
          "promedio-saldos-mensuales" : {
            "value" : 24517.36842105263
          }
        },
        {
          "key" : "ID",
          "doc_count" : 27,
          "promedio-saldos-mensuales" : {
            "value" : 24368.777777777777
          }
        },
        {
          "key" : "HI",
          "doc_count" : 22,
          "promedio-saldos-mensuales" : {
            "value" : 24326.545454545456
          }
        },
        {
          "key" : "DC",
          "doc_count" : 24,
          "promedio-saldos-mensuales" : {
            "value" : 23180.583333333332
          }
        },
        {
          "key" : "IN",
          "doc_count" : 15,
          "promedio-saldos-mensuales" : {
            "value" : 23128.933333333334
          }
        },
        {
          "key" : "PA",
          "doc_count" : 23,
          "promedio-saldos-mensuales" : {
            "value" : 23121.08695652174
          }
        },
        {
          "key" : "MS",
          "doc_count" : 22,
          "promedio-saldos-mensuales" : {
            "value" : 22778.5
          }
        },
        {
          "key" : "CA",
          "doc_count" : 17,
          "promedio-saldos-mensuales" : {
            "value" : 22517.882352941175
          }
        },
        {
          "key" : "WI",
          "doc_count" : 18,
          "promedio-saldos-mensuales" : {
            "value" : 22503.722222222223
          }
        },
        {
          "key" : "WY",
          "doc_count" : 25,
          "promedio-saldos-mensuales" : {
            "value" : 21731.52
          }
        },
        {
          "key" : "ME",
          "doc_count" : 25,
          "promedio-saldos-mensuales" : {
            "value" : 21663.0
          }
        },
        {
          "key" : "SC",
          "doc_count" : 13,
          "promedio-saldos-mensuales" : {
            "value" : 21526.153846153848
          }
        },
        {
          "key" : "OR",
          "doc_count" : 16,
          "promedio-saldos-mensuales" : {
            "value" : 21215.875
          }
        },
        {
          "key" : "NV",
          "doc_count" : 13,
          "promedio-saldos-mensuales" : {
            "value" : 20536.23076923077
          }
        },
        {
          "key" : "FL",
          "doc_count" : 18,
          "promedio-saldos-mensuales" : {
            "value" : 20443.444444444445
          }
        },
        {
          "key" : "MN",
          "doc_count" : 19,
          "promedio-saldos-mensuales" : {
            "value" : 19651.842105263157
          }
        },
        {
          "key" : "WV",
          "doc_count" : 17,
          "promedio-saldos-mensuales" : {
            "value" : 17873.882352941175
          }
        }
      ]
    }
  }
}
```

### Comentarios

Adicionalmente se eligió ordenar los estados por promedio de saldo mensual, de manera descendente.