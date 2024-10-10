# Unidad 4 - Medicion de Software

Si no medimos, no podemos comparar, mejorar y evaluar.

## Calidad de Software

Requerimiento no funcional escencial. De el que dependen todos los otros. El aseguramiento de calidad de SW es el conjunto de actividades planificadas y sistematicas necesarias para controlar que el producto satisface los requisitos de Calidad.

Se logra mediante...

+ Medicion de software: Obtener datos cuantitativos que ayuden a controlar y mejorar la calidad. A partir de metricas.
+ Creacion de modelos de calidad: Organizar a donde vamos a apuntar si queremos evaluar nuestro proceso/proyecto en cierto aspecto. Dsicutir, planificar y obtener indicadores de calidad.
  + Cuando son necesarios?
+ Aplicación de estandares de calidad: Hay estandares que "despliegan el arbol" en virtud del concepto que queremos plantear, que tenemos que medir. Directrices para el aseguramiento externo e interno de la calidad.

No es solamente la calidad de un producto de software. Debe ser también calidad de procesos.

## Medición de SW según Pressman

+ Ayuda a entender el proceso, el proyecto, proveyendo mecanismos para evaluar aspectos de ambos de manera _objetiva_.
  + Dos niveles de evaluación: Proceso/Proyecto.
+ Nos ayuda a conocer el estado del producto.
  + Es el nivel donde más metricas existen, desarrolladas por distintos autores.
+ Si se aplica a proceso, es con la intención de implementa runa mejora continua...

---

En el producto se realizan metricas más puntuales. Proceso/Proyecto implica integrar varias evaluaciónes para sacar

Confiabilidad, Fiabilidad (se condice con requerimientos), Facilidad de Mantenimiento, Uso eficiente de recursos, Tiempo de respuesta.

La calidad del producto **se estima**, no se asegura con certeza.

---

Tener en foco el proceso te obliga a tener en foco los proyectos y productos. El proceso de mejora continua tiene efecto a largo plazo (los cambios a procesos se aplican recien a los "proximos" proyectos, se ve a largo plazo).

Si pongo el foco en el proyecto, se ve a corto plazo.

## Medición segun Pressman (cont.)

Se utiliza a lo largo de un proyecto de SW como apoyo en:

+ La estimación
+ El control de calidad
+ La evaluación de la productividad
+ El control del proyecto

Es aplicada por los Ing. de SW sobre los artefactos

## ¿Por qué medir?

+ Para predecir, estimar: Impacto de cambios, tiempos, costos, esfuerzo...
+ .
+ .

Las mediciones son:

+ Una herramienta de gestión, ayuda a mantener controlado el objeto medido.
+ Ayudan a la toma de decisiones tácticas (inmediatas) según avanza el proyecto.
+ Toma de decisiones estrategicas (a largo plazo) sobre los procesos.

---

+ Genera una cultura de ISW saludable y exitosa.
+ Cuando se inicia el proyecto: Se seleccionan las metricas apropiadas para evaluar la performance y calidad de los resultados. No todos los proyectos evaluan las mismas métricas.
+ Las actividades de medición deben planificarse cuidadosamente.

"Nunca es tarde para empezar a registrar datos".

---

Medidas númericas $\rarr$

+ Facilitan el coocimiento de un fenómeno.
+ Aumentan el conocimiento de un fenómeno.

Métricas de SW $\rarr$

+ Definen qué y cómo medir o evaluar el software, el proyecto en el que fue desarrollado y el proceso utilizado.

## Conceptos

+ Medida: Valor asignado a un concepto o atributo.
+ Medición: Acto o proceso de asignar un número a un concepto o atributo.
+ Métrica: Fórmula que representa el grado en que un sistema, componente, proceso o proyecto posee un atributo determinado.
  + Por si misma no dice nada, se debe llevar a cabo un proceso de medición con la misma para generar medidas.
+ Indicador: Es la interpretación de una métrica o combinación de métricas que proporcionan mayor conocimiento sobre el proceso, el proyecto, o el producto en sí mismo. Es el uso de una métrica para tomar desiciones/evaluar.
  + Sin él no tiene sentido la medición.
+ Entidad: Objeto o elemento que va a ser caracterizado mediante una medición de sus atributos.
  + Puede ser tangible o intangible.
  + Entidades de interes para el dominio de software: Recurso, Proceso, Requerimiento, Producto, Proyecto, Servicios, Documentos.
+ Atributo. Propiedad medible, física o abstracta, de una entidad.
  + Puede ser:
    + **interno**: medido directamente desde la entidad (modulos, lineas de código, lineas de codigo probadas, acoplamiento de modulos, cantidad de paginas). O...
    + **externo**: Medido por la relaión entre la entidad y una necesidad externa definida por el ambiente (comprensibilidad, amigabilidad c/ el usuario, tiempo de respuesta, estabilidad de la especificación de requerimientos).
  
  + Notar que no se habla de "cantidad de...". Eso es una metrica, se esta hablando de una metodología de medición del atributo.
  + Se puede medir por una métrica directa o indirecta (involucra el calculo, se involucra una formula).
+ Concepto calculable: Caracteristica de calidad, requerimiento no funcional. Relación abstracta entre atrivutos de una o más entidades, y una necesidad de información. Concepto que se quiere estimar o evaluar a partir de las mediciones de atributos de entidades.
  + Ej.: Accesibilidad, calidad en uso, confiabilidad, facilidad...
+ Modelo de conceptos o modelo de calidad: Conjunto de subconceptos y relaciones entre ellos, que sirven de base para una evaluación o estimación.
  + Ejemplo: Caracteristicas y/o subcarac (...)
  + Puede ser fijo (existe un estandar que adopto para mi proyecto), propio o mixto.
  + Donde hacer foco para ver si tenemos producto de calidad, si es seguro, si es mantenible. Si queremos muchas cosas juntas, armar un modelo de conceptos que considere prioridades entre estos conceptos calculables. Es un arbol/grafo donde se vinculan conceptos y subconceptos, desglosando para obtener en las hojas atributos.
  + Te asegura que no vas a estar evaluando la calidad de tu producto basado solo en una métrica directa. Para evaluar conceptos de calidad tan amplios nunca alcanza una sola métrica.