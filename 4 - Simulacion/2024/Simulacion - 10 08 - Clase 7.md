# DES: Recolección de datos y Modelado

## Pasos de un proyecto de M&S: Recopilación de datos

+ **Datos contextuales:** Van a ayudar al modelador y cliente a comprender de manera completa la situación. No se refiere necesariamente a datos numericos. Ej.: Diagramas de proceso, gestión de inventario, datos de compras, comportamiento de clientes.
+ **Datos asociados al modelo conceptual:** Toda la información que necesitemos para que los componentes del modelo pueda funcionar. Se identifican como resultado del proceso de modelado conceptual, ya que en dicho proceso se describen todos los componentes del modelo y los detalles asociados al mismo. Ej.: Tiempos entre arribos...
+ **Datos de validación:** Requeridos para asegurarse que el modelo, en su conjunto, representa el sistema del mundo real con precisión. Se utilizan para comparar los resultados del modelo con los datos del sistema real.

Por mas correcto que este el modelo, si no tengo datos no puede ejecutarlos. Si son datos de modelo conceptual, se clasifican segun disponibilidad:

+ Categoria A: Datos disponibles ya sea porque son conocidos o porque se han recolectado previamente (no por nosotros) (ej.: otros modelos de simulación).
+ Categoría B: _Deben_ ser recolectados. Debe realizarse una tarea de recolección de datos. Deben ser precisos y estar en el formato correcto para ser usados en el modelo.
  + Precision: Se debe investigar la fuente de los datos. Si no esta disponible, se puede usar el conocimiento de expertos para determinar su adecuación al modelo de simulación. Si la muestra se considera imprecisa -> tomar muestras alternativas.
  + Formato: Relacionado con la interpretación de los datos. "Tiempo entre fallas puede ser el tiempo desde el comienzo de una falla hasta el comienzo de la siguiente, o el tiempo entre los finales de cada una.
+ Categoría C: No van a estar disponibles aunque los necesite y no los puedo recolectar. Ej.: Sistemas que no estan implementados. Existen dos formas de tratar estos datos: Estimacion o factor experimental.

### Etapas de recolección de datos.

1. Planificar los experimentos o las observaciones. Tiempo, lugar, cuantas personas, ...
2. Reunir los datos del sistema.
3. Realizar el tratamiento de los datos y seleccionar una distribución de probabilidad que los represente. Si no encuentro, repetir hasta encontrar una distribucion y unos parametros que ajusten.
4. .
5. .

### Sugerencias para recolectar datos

+ Es importante determinar la naturaleza discreta/continua de los datos.
+ Tratar de analizar los datos a medida que se reúnen, para evaluar si son suficientes, adecuados y útiles.
+ No perder el tiempo con datos irrelevantes. Primero, saber las categorias de los datos y no relevar algo que ya existe.
+ Tratar de combinar conjuntos de datos homogeneos. Si se repiten los mismos patrones se pueden juntar los conjuntos (ej.: Si todos los miercoles de 5 a 7 los patrones de llegada al ascensor son los mismos.)

## Modelado conceptual

Es una actividad.

Tomar una situacion del mundo real, y a partir de esta, **diseñar** un modelo es lo que llamamos un modelado conceptual.

Diseñar: Todo es a nivel de abstracciones, no se implementa todavía.

## Modelo conceptual

Es un artefacto.

Es una *descripción* no basada en software del *modelo de simulación computacional* que incluye sus objetivos, entradas, salidas, contenido, suposiciones y simplificaciones.

+ Descripción: Representación simplificada, abstraccion del sistema real.
+ Modelo de simulación computacional: Que será, es o ya ha sido desarrollado. Debe ser pensado independiente del codigo o SW de implementación. No atarse a la herramienta que se usa para implementar.

El proposito es armar una estructura que perdure en el tiempo a partir de la cual el modelo computacional será construido.

### Requerimientos no funcionales para un MC

Una base para determinar si el modelo es apropiado o no.

+ Validez: Que el modelo produzca resultados suficientemente precisos para el proposito en cuestión. Se prueba contra los datos de verificación.
+ Credibilidad: Que el modelo sea creible para los clientes.
+ Utilidad: Que el modelo sea lo suficientemente facil de usar, flexible, visual, rapido de ejecutar.
+ Viabilidad: Que se pueda construir dento de las restricciones de tiempo, dinero, datos, etc. que han sido impuestas al proyecto.

Por ultimo, es fundamental para la calidad que sea **simple**, lo mas posible mientras cumpla los objetivos. Esto se manifiesta en:

+ Se desarrollan más rápido.
+ Son mas flexibles, se ejecutan más rapido y requieren menos datos.
+ Sus resultados son fáciles de interpretar ya que su estructura es facil de comrpender.

Robinson dice: "El 80% de exactitud se obtiene solo con un 20% de complejidad". A medida que aumento la complejidad, no gano tanto en exactitud. Nunca se llegaría a un 100% teorico ya que el modelo degeneraría en una replica exacta del sistema real. Incluso, si se aumenta la complejidad mas de lo recomendado, se pierde exactitud ya que no existe información disponible para probarlo.

### Técnicas de simplificacion

+ Convertir variables en constantes.
+ Eliminar o combinar variables.
+ Suponer linealidad o promedios.
+ Agregar suposiciones y restricciones más "fuertes. Ej.: Suponer que el empleado no tiene descansos.
+ Reducir los limites del sistema. Reducir el objetivo.

## Relación entre modelado conceptual y recolección de datos

Tienen una interacción constante.

Dependiendo de la disponibilidad de los datos cambia el modelo, por ej. El modelo estaba bien logrado pero los datos no se pueden conseguir. No es viable.

---

Recien luego de estas etapas paralelas. Se traduce el modelo a computacional.

## Modelado conceptual (cont.)

+ **Objetivos**: No son los del proyecto, los objetivos del modelo. Un objetivo del proyecto podría ser reducir el tiempo de espera pero el del modelo es estudiar los tiempos de espera de los clientes. Dirigen el desarrollo, especificando las entradas y salidas. Determinan...
+ **Entradas**: Elemento que no es propio de lcontenido del modelo, pudiendo referir a una cantidad de replicas de un elemento (cantidad de empelados, mostradores), una caracteristica de un elemento (tiempo de servicio) o una regla de negocio (cantidad de surtidores abiertos en el turno noche de una estación de servicio). Pueden ser:
  + **Factores experimentales**: Entrada que define un elemento que puede ser modificado para lograr un impacto en el funcionamiento del sistema. Nota: Diseñar modelo para que pueda respondar a estos cambios, ej.: cambiar la cantidad de empleados. Nota: Tipicamente datos de Categoria C son FE.
  + **Parametro**: Entrada que define un elemento fijo que configura el modelo a fin de que logre imitar el comportamiento requerido.
  + La diferencia es el conocimiento que tengo del sistema real. Ej.: Se considera cambiar la cantidad de empleados, lo puedo considerar como factor experimental. En una estacion de servicio el dueño me dice que no quiere añadir mas surtidores, que sería una posible solución, entonces es parametro.
+ Contenido del modelo: Se definen partiendo de las entradas, y sus caracteristicas deben proveer los resultados especificados.
  + Alcance:
  + Nivel de detalle:
+ Resultados o salidas.

Es un proceso iterativo.

### Artefactos vinculados al modelado conceptual

El paso de modelo conceptual a computacional.

(fig. Robinson - Problem domain & Model domain)

Modelo de diseño: Diseño de los elementos y la logica que se utilizará para el modelo computacional según el tipo de simulación.

### Abstraccion del modelo

+ Descripción del sistem. Se relaciona con el dominio del problema, describiendo el problema y los elementos del mundo real, tal como son entendidos por el modelador.
+ Modelo conceptual: Se relaciona con el dominio del modelo, describiendo las partes de la descripcion del ssitema a ser incluidas en el modelo de simulación con su nivel de detalle.

Es comun no asbtraer lo suficiente en el paso entre la descripción y el modelo.

### Suposición vs. Simplificación

+ Suposicion: Hipotesis sobre el mundo real que surgen cuando se tiene un conocimeitno limitado, pudiendo referir a incertidubres/creencias sobre el mismo. Relacionada al conocimiento del sistema. Completan nuestra **falla de conocimiento** (intriseca o deliberada) del mundo real.
+ Simplificación: Relacionadas a la abstracción del modelo. Decisiones que tomamos para modelar el mundo de forma más sencilla. Decisiones que reducen la complejidad del modelo permitiendo un desarrollo más rapido.

## Actividades del modelo conceptual

### ¿Que debe hacer el modelador?

Entender la naturaleza del sistema.

+ Desarrollar un entendimiento del problema.
+ Determinar los objetivos del modelo.
+ Diseñar el contenido del modelo conceptual.

### Representando un MC

Es importante tener un mecanismo de representación, lista de componentes, diagramas UML de flujo, logica o actividad, lista de suposiciones y simplicaciones. Cualquier combinación de ellos.

No hay un estandar para modelos conceptuales de simulación. Para el curso se propone un framework: Una tabla de documentación.

## Framework

### 1. Desarrollar un entendimiento del problema

Buscamos tener conocimiento al entender la estrucutra y la dinámica del sistema en relación con un problema.

+ Descripción del sistema: Una manera es usando texto.
+ Estructura: Describir los elementos en un diagrama UML.
+ Dinamica: Describir el comportamiento dinamico de cada uno de los elementos. Tambien diagrama UML
+ Suposiciones: Lo que no logro conocer o mas aun que no me interesa estudiarlo.

### 2. Determinar objetivos del modelo

Buscamos delimitar el objetivo del modelo de simulación, cuales son las salidas requeridas para alcanzar el objetivo y cuáles son las entradas básicas.

+ Salidas: ...
+ Entradas: Pensar que información del mundo real requiero para tener esas salidas. Indicar si es parametro o factor experimental.

### 3. Diseñar el contenido del modelo conceptual

Buscamos determinar los componentes que formaran parte del modelo de simulación. Recordar que hasta ahora fue una descripción del modelo, lo más completa posible.

+ Alcance del modelo: Evaluación de los elemento sde la estructura del sistema en relación con los objetivos del modelo de simulación. Se debe argumentar haciendo uso de las entradas o salidas ya definidas, porque no se vincula con el objetivo, o por ejemplo, usando simplificaciones.
+ Nivel de detalle: Que caractersiticas o propiedades de cada elemento se incluye. De vuelta, debo justificar la inclusión de cada caracteristica.

### 4. Diagrama de flujo

Especificar como se relacionan esos elementos. Hay que elegir los elementos que fluyen por el sistema. En el caso del ejemplo, los pasajeros.
