# Introducción

**Correos:**

+ <rportillo@frsf.utn.edu.ar>
+ <mariajuliablas@gmail.com>
+ <juanleonardosarli@gmail.com>
+ <galvarez@frsf.utn.edu.ar>

### Bibliografía

+ **Simulation Modeling and Analysis**, M. Law.
+ **Simulation...**, Robinson.
  + Más moderno y con modelado conceptual.
+ **Discrete Event System Simulation**, J. Banks.

### Condiciones de aprobación

**Regularización:**

+ Aprobación de las instancias de evaluación con un 50%
  + 5 actividades de seguimiento en grupo.
  + 1 evaluación parcial
+ Un recuperatorio integrador.

**Promoción:**

+ Aprobación de las instancias de evaluación con un 60% o más.
  + 3 actividades de seguimiento en grupo.
  + 4 evaluaciones parciales.
+ Se puede recuperar un parcial.

### Cronograma de evaluaciones

**Seguimientos:**

+ Seg. 1: 22/08.
+ Seg. 2: 09/09.
+ Seg. 3: 10/10.
+ Seg. 4: 24/10.
+ Seg. 5: 14/11.

**Parciales:**

+ Parcial 1, en parejas al azar: 03/09.
+ Parcial 2, individual: 01/10.
+ Parcial 3, individual: 05/11.
+ Parcial 4, en parejas al azar: 27/11.

**Recuperatorios:**

+ Recuperatorio: Semana del 10/12.

# Unidad 1. Parte A

### ¿Qué es la simulación? ¿Que nos permite?

Es parte de los procesos de grandes empresas, ya que estos involucran sistemas complejos. Amazon simula rutas de entrga para bajar sus tiempos, y escenarios de demanda para planificar la capacidad de sus srvidores; Google hace simulación de redes para simular trafico de datos.

**Definición:** **Proceso** de diseñar un **modelo** de un **sistema** real y realizar **experimentos** con el para entender el **comportamiento** del sistema y/o evaluar **estrategias** para la operación del mismo.

(imagen)

## Sistemas

**Def.:** Conjunto organizado de partes interdependientes que dsarrollan funciones, gneran propiedades mergents y siguen un proposito.

**¿Que identificar?**

+ Proposito: Metas y objetivos.
+ Establecer un limite o frontera
+ Estructura:
  + Elementos o componntes.
  + Relaciones o interacciones entr los elementos o componentes.

### Clasificación de sistemas

**Segun la evolución temporal de las variables:**

+ **Sistema discreto:** Las variables cambian solo un un conjunto discreto de puntos en el tiempo.
  + Las variabls cambian instantaneamnte en dados instantes, y permanecen constantes el resto del tiempo.
+ **Sistemas continuos**: Las variables cambian de manera continua a lo largo del tiempo.
  + Los lementos o variables que determinan el comportamiento del sistema puede variar continuamente en el tiempo.

Ningun sistema es estrictamente discreto o continuo. El modelado de las variables sera distinto dependiendo de lo que se quiera estudiar.

### Modelo de un sistema

**Def.:** Una abstracción parcializada de la realidad, que permite comprendr como funciona o predecir como se comporta un sistema.

Tiene importancia para:

+ **Experimentar**: Obtener resultados, analizar y predcir comportamintos.
+ Hacer **hipotesis** que expliquen el comportaminto observado.
+ **Predecir** como responde el sistema cuando se producen cambios.

## Modelos de Simulación

Segun la **evolución en el tiempo**:

+ **Dinamico**: Representa un sistema cuyo comportaminto en el tiempo (puede ser discreto o continuo) es de interes para su estudio, dados determinados objetivos.
+ **Estatico**: Es una representación de un sistema en un momento particular, o una que puede ser usada para represntar un sistema en el que el tiempo simplemente no juega ningún rol.
  + Ejemplo: Simulación de Monte Carlo. Para estimar l rsultado del modelo se toman valores promdio, por lo que hay que estimar las variables $a$, $b$ y $c$ a partir de sus distribuciones de probabilidad y resolviendo la ecuación repetidas veces o iteracions. Se usa mucho en analisis de riesgo, por ej., en inversiones.

Según las salidas de simulación:

+ Determinisiticos: Si no contien ningun componente probabilistico, el modelo es dterminisitico. La salida de la simulación es determinada una vez que el conjunto de cantidades y relaciones de entrada en el modelo han sido especificadas. No hay componentes probabilisticos.
+ Estocasticos: Si existe algun componente de entrada (o no necesariamnte la entrada, pero algun componente interno) probabilistico. Producen una salida que es aleatoria en si misma, y debe ser tratada como una estimación de las caracteristicas reales del modelo.

## Metodos/Tipos de simulación

Segun el nivl de abstracción.

+ **Estrategico**: Alta abstracción, menos detallado, nivel macro. Agregados, dependencias causales globales, dinámica de retroalimentación
+ **Táctico**: Abstracción media, detalles medios, nivel meso.
+ **Operacional**: Baja abstracción, más detalles. Objtos individuales, tamaños exactos, velocidades, distancias, tiempos.

**Modlado de sistmas dinamicos y simulación.**

+ Modelado: Diagramas de flujo y de stock.
+ Simulación: Continua deterministica, basada en ecuaciones diferenciales.
+ Abstracción alta.

**Modelado de eventos discretos y simulación.**

+ Modelado: Diagramas de flujo.
+ Simulación: Estocastica discreta.
+ Abstracción baja.

**Modelado basado en agentes y simulación.**

+ Modelado: Ecuaciones y diagramas de estado.
+ Simulación: Estocastica discreta y basada en objetos.
+ Diversos niveles de abstracción dependiendo el modelo.
+ Por ejemplo: Muy usado en simulaciones de sistemas sociales. Una sociedad de agentes que desempeñan roles e interactuan en un contxto estructurado y restringido de actuación.
+ Un agente es un individuo con un conjunto de caracteristicas y atributos

Existen también modelos hibridos.

Todos estos metodos corresponden a modelos/sistemas dinamicos. Para modelos estaticos: Simulación de Monte Carlo.

## Ventajas y desventajas de la Simulación

**¿Por qué se modela y simula?**

+ Costos.
+ Riesgos y peligros.
+ Tiempo.
+ Control de condiciones experimentales.
+ El sistema real no existe (todavía).

**Ventajas:**

+ Se pueden explorar nuevas politicas, procedimientos operativos u organizacionales, reglas de desición, flujos de info., sin interrumpir las operaciones en curso del sistema real.
+ Se pueden probar nuevos diseños, sin comprometer recursos para su adquisición.
+ Se puede comprimir o expandir el tiempo.
+ Realizar analisis de cuellos de botella.
+ Probar la viabilidad de una hipotesis.

**Desventajas:**

+ La construcción de modelos requiere una formación especial. Tanto la capacidad de abstracción para modelar y la capacidad de interpretar los resultados.
+ El proceso de modelado y analisis de simulación puede requerir mucho tiempo y ser costoso.

## Pasos en un proyecto (de simulación basada en eventos discretos)

(imagen de J. Banks)

Leer de Banks por dios que es importante.

Es un proceso iterativo, como se ve en la imagen.

Verificación: Ver que el modelo funcione correctamente y este libres de errores de implementación.

Validación: Ver si realmente el modelo representa la realidad.
