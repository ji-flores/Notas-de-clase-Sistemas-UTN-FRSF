# Simulación de Montecarlo

## Concepto
Simulación **estática** que analiza un sistema con **variables estocásticas** utilizando métodos de generación de **variables aleatorias** a partir de **distribuciones de probabilidad**.

+ **Estática**: La simulación de Montecarlo no considera al tiempo como un factor. Cualquier sistema puede ser un sistema estático, dependiendo como se estudie. A mismas entradas mismas salidas, porque el funcionamiento interno del sistema no cambia.
	+ Una pieza de código, que para probarlo asumimos que el código se mantiene igual y no cambia.
+ **Variables estocásticas:** Existe "incertidumbre" en el valor de las variables, que puede ser por desconocimiento de como funciona algo, o por aleatoriedad. Ambas formas de incertidumbre se toman en cuenta para el concepto de estocástico, en la materia no se hace diferencia.
+ **Variables aleatorias:**  Variables que pueden tomar un valor al azar, respondiendo a cierto patrón o distribución de probabilidad.
+ **Distribuciones de probabilidad:** El patrón al que responde la aleatoriedad de la variable.

## Origen

Surge por un proyecto militar de la década de los 1940 con nombre en código "Montecarlo".

## Aplicaciones

+ Mecánica de fluidos.
+ Precios de acciones. Hacer predicciones. ¿Cuál es la probabilidad de que una acción valga el doble?
+ Decisiones de inversión.
+ Obtener premios en juegos. Garantizar que un sistema que da rewards es justo.

## Componentes

+ Entrada: Necesito conocer la distribución de las entradas.
+ Modelo de simulación.
+ Salidas: Me interesa conocer la distribución para poder estudiarlas.

## Etapas de la simulación de Montecarlo

1. **Diseñar modelo lógico de decisión:** Que vas a hacer según las entradas que se generan, cuales van a ser las salidas. Depende de cada problema.
	+ Ej.: Dependiendo de la cantidad de fallas de un batch de producción, considerar si la calidad es aceptable o no.
2. **Especificar distribuciones para las variables aleatorias.**
3. **Incluir dependencias entre las variables:**
	+ Si hay dependencias, simplemente explicar cual es.
	+ Ej.: Tiempo de reparación de una maquina y tiempo de reparación. Son dependientes en el sentido de, si no hay ninguna falla, no tiene sentido tener un tiempo de reparación.
	+ Los lanzamientos de un dado no tienen dependencia entre ellos.
	+ Generalmente trabajamos con eventos independientes.
4. **Muestrear valores de las variables de entrada.**
	+ Sinónimo de "iteración".
5. **Calcular salida según valores del muestreo y registrar.**
6. **Repetir 4. y 5. hasta obtener el tamaño de muestra deseado.**
7. **Obtener la distribución de frecuencia del resultado de las iteraciones.**
	+ Usando pruebas de bondad de ajuste.
8. **Calcular métricas de salida (medias, desvío, percentiles).**
