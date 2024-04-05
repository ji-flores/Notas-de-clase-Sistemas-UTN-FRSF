# 09/08 - Modelos de simulación de sistemas: Conceptos y metodologías

Simulacion:

- Imitación de un sistema. Puede o no involucrar el paso del tiempo. *Esta definición es muy general*.
- Imitación en computadora de un sistema que progresa en el tiempo.

Sistema.

- Conjunto de partes organizadas para un proposito
    - Naturales: Sus origenes se dan a partir del universo. Ej: Sistema hidrico, atmosferico.
    - Diseñados fisicamente: Sistemas fisicos que surgen como resultado de un diseño humano. Ej: Auto, casa.
    - Diseñados abstractos: Sistemas abstractos que surgen como resultado de un diseño humano. Ej: Matematica, literatura.
    - De actividad humana: Surgen de la actividad humana, y consciente o inconscientemente terminan siendo ordenados. Ej: Familia, sistemas politicos.
- Conjunto de partes organizadas para un proposito las cuales exhiben un comportamiento e interactuan entre si a fin de alcanzar ese proposito.

- Estaticos: No se observan cambios en su comportamiento a causa del paso del tiempo.
- Dinamicos: Se observan cambios en el comportamiento con el tiempo.
    - Continuos: Este cambio se da continuamente en el tiempo.
    - Discretos: Los cambios se producen instantaneamente en puntos separados del tiempo (no necesariamente equidistantes). Notar que el tiempo se sigue considerando continuo, solo los cambios en el sistema.
    
    Independientemente de la continuidad de los cambios, los sistemas se pueden comportar como sistemas:
    
    - Determinísticos: Los cambios producen solo un resultado, por lo que la conducta del sistema esta determinada. Ante la misma entrada se da la misma salida, de manera determinística.
    - Estocásticos: Los cambios producen resultados aleatorios más o menos probables.

El objetivo define desde que punto de vista quiero ver el sistema, y es dificil encasillar el sistema en una clasificación, pero casi siempre habra una perspectiva más util dependiendo del objetivo.

### Sistema dinamico

Def: Colección de variables (**variables de estado**) necesarias para describir el sistema en un punto del tiempo. La eleccion es relativa al objetivo de estudio.

- Continuos: El cambio en las variables de estado se da continuamente en el tiempo.
- Discretos: Los cambios en las variables de estado se producen instantáneamente en puntos separados del tiempo (no necesariamente equidistantes). Notar que el tiempo se sigue considerando continuo, solo los cambios en el sistema.

Muy pocos sistemas encajan completamente en alguna de estas dos clasificaciones.

### Simulación (dinámica)

Def: Experimentación con una imitación *simplificada* en computadora de las operaciones de un sistema (real o ficticio) que progresa en el tiempo, con el objetivo de entenderlo y/o mejorarlo.

Es una técnica experimental para estudiar escenarios siguiendo un enfoque del tipo “what-if”.

### Modelo / Modelo de simulación

Abstraccion de la realidad que captura lo esencial para investigar y experimentar sobre un sistema de interes. Un modelo de simulación “imita” un sistema real segun un objetivo.

Modelos de simulación.

- Representación de un sistema en un momento dado.

- Deterministico: No contiene ningun componente probabilistico (la salida es determinada una vez que el conjunto de valores y relaciones de entrada ha sido definido).
- Estocastico: Existe al menos un componente de entrada probabilistico (la salida es aleatoria en si misma, por lo que debe ser tratada como una estimación).

El curso se centra en modelos de simulación dinamicos discretos estocasticos.

Uso de simulación:

- Tener un mejor entendimiento de un sistema.
    - Elaborar hipotesis que ayuden a explicar el comportamiento observado.
    - Predecir un comportamiento si se producen cambios internos o externos
- Identificar posibles mejoras.
    - Resultados de la simulación pueden tomarse como base para procesos de toma de decisiones.

## Modelado y Simulación (M&S)

Def: Proceso de diseñar un modelode un sistema y realizar experimentos con él para entender su comportamiento y/o evaluar estrategias de operación.

El comportamiento del sistema se observa mediante variables de salida.

De todos los metodos en investigación de operaciones, ¿Por qué usar simulación?

Porque es practicamente imposible usar otras tecnicas para predecir el comportamiento de sistemas con

- Variabilidad.
- Interconectividad de componentes: Partes no trabajan de forma aislada sino que se afectan entre si,
- Complejidad
    - Combinacional: Alta cantidad de componentes.
    - Dinamica: La manera de interactuar de los componentes es compleja.

Permite predecir comportamiento, comparar alternatvas de diseño y determinar…

### Experimentación con sistema real o sobre modelos.

En comparacion a experimentar con el sistema real:

- Menores costos de proyecto.
- Mejores tiempos de desarrollo de proyecto.
- Condiciones experimentales.
- El sistema real puede no existir.

Ventajas respecto a metodos de investigación de operaciones:

- Modelado de variabilidad sencillo por medio de componentes estocasticos.
- Suposiciones menos restrictivas.
- …

Ventajas respecto a la gestion de proyectos.

- Fomenta la creatividad del equipo sin riesgo.
- Da conocimiento y entendimiento sobre el sistema.
- Mejor visualización y comunicacion de resultados.
- Desarrollo consensuado por muchos participantes.

Desventajas de la simulacion.

- Enfoque caro respecto herramientas de software.
- Consume mucho tiempo.
- Conlleva un proceso de recolección y tratamiento de datos previo.
- Requiere de mucha experiencia.
- Exceso de confianza porque “todo lo que resuelve una herramienta de software es correcto”.

## Metodos de simulación

### Simulación basada en eventos discretos

El sistema se representa como entidades que fluyen de una actividad a la siguiente teniendo una demora entre actividades consecutivas.

### Simulación de Monte Carlo

El mundo se concibe como un conjunto de distribuciones (probabilisticas) que representan variables que describen las fuentes de los cambios.

### Dinámica de sistemas

Enfoque de simulación continua que representa el mundo como un conjunto de depositos y flujos.

### Simulación basada en agentes

Se modela el sistema con un enfoque “bottom-up” como un conjunto de agentes con comportamientos individuales que interactuan a lo largo del tiempo.

## Pasos en un proyecto M&S

No hay un consenso respecto a la metodologia, se adquiere mucho conocimiento con la practica. Entonces, el proceso descrito puede no siempre usarse a rajatabla.

Un estudio de simulación no es un proceso secuencial simple.

### Formulación del problema

- El objetivo es definir de forma clara y concisa el problema. El analista se debe asegurar que el problema es entendido por todos los participantes.

### Fijar objetivos y plan de proyecto

- Indicar claramente las preguntas a ser respondidas.

Evaluar si el uso de simulacion es la metodología adecuada para el problema descripto ylos objetivos indicados.

El plan de proyecto debe incluir.

- Cantidad de participantes incluidos.
- Costo del estudio.
- Tiempo dias/meses dedicados a cada etapa.
- Resultado esperado de cada etapa.

### Conceptualización del modelo

- Definir el modelo conceptual.

No hay una ciencia exacta para definir modelos. Incluye:

- Abstraer características principales de un problema.
- Seleccionar modificar adecuadamente las suposiciones que caracterizan el sistema.
- Enriquecer y mejorar el modelo hasta que se obtengan aproximaciones de resultados utiles.
- Se involucra generalmente al usuario/cliente. Generalmente lleva a un modelo de mayor calidad y genera confianza del usuario para con el modelo.

### Recolección de datos

- Los objetivos del estudio dictan el tipo de datos.

Seran utilizados para validarel modelo de simulación. Al cambiar la complejidad tambien cambian los datos.

Estas ultimas dos son generalmente simultaneas.

### Traducción del modelo

- La implementación puede darse en un LdP de proposito general o con una herramienta de simulación especifica.

El modelo conceptual se traslada a un modelo computacional. Notar que no deberian hacerse cambios en el modelo en esta etapa, es solo una traducción.

### Verificación

¿El modelo computacional se corresponde con lo que planee que el modelo conceptual tenia que hacer? Chequear…

### Validación

No quita que puedan hacerse validaciones internas en las otras etapas.

Se compara el modelo con el comportamiento del sistema bajo estudio (el mundo real, el problema). Si la respuesta es no, las discrepancias son utilizadas para mejorar el modelo.

### Diseño de experimentos

Diseñar el experimento, determinar alternativas a ser simuladas.

Para cada diseño se define:

- Longitud del periodo de inicialización. No se cuenta como tiempo de simulación.
- La longitud de la corrida de simulación.
- La cantidad de replicas a hacer para cada comida.

La decisión sobre que alternativas simular dependerá de las ejecuciones que se hayan completado y analizado.

### Corridas de producción y análisis

- Las corridas de producción y su posterior análisis se utilizan para estimar las medidas de rendimiento de los diseños de sistemas que se están simulando.

Si no se dan resultados que sirvan se puede volver al diseño de expermientos o a las corridas de produccion (solo cambiar parametros, por ejemplo).

### Documentación y reporte

Deben elaborarse dos tipos de documentación: Documentación del programa e informes de progreso.

Sin embargo, la documentación se da en todas las etapadas.

Sirve:

- Si hay rehuso.
- Si debe modificarse el software.
- Los usuarios pueden tener que cambiar parametros, y deben hacerlo teniendo un entendimiento del modelo.

Debería incluir:

- Especificación del modelo.
- Demostraciones de prototipos
- …

### Implantación y uso

- El exito de la aplicacion depende del continuo interes del usuario y de la finalización satisfactoria del proceso.

**La validacion es lo más importante.** De ella depende que los resultados obtenidos sirvan para algo.