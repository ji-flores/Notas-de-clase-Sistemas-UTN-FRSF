# 15/08 - Introducción y Diagramas Causales

### Dinámica de sistemas

Enfoque para entender el cambio de sistemas en el tiempo.

Apunta al diseño de políticas que guían las decisiones. Se entiende como una metodología para entender el cambio, en el lenguaje de las ED (Ecuaciones Diferenciales).

### Sistema continuo

**Def.:** Sistema donde las variables que determinan su estado pueden variar en cada instante de tiempo. En otras palabras, las variables de estado varían de manera continua.

### Modelo de simulación continuo

**Def.:** Representa la evolución de un sistema en el tiempo.

## Simulación continua

Se aplica cuando las variables de estado cambian continuamente en el tiempo. Típicamente, involucran ecuaciones diferenciales que dan relaciones para las tasas de cambio de las variables con el tiempo.

## El proceso de simulación

1. **Definición del problema:** Formular un problema desde una perspectiva dinámica.
2. **Variables clave:** Reconocer factores centrales y variables relevantes.
3. **Comportamiento a lo largo del tiempo:** Reconocer y estimar el comportamiento de dichas variables a lo largo del tiempo.
4. **Diagramas de retroalimentación:** Identificación de causa y efecto. En función de como resultan estas retroalimentaciones (positivas o negativas) puedo encuadrar el comportamiento del sistema en un patrón de comportamiento.
5. **Diagramas de stock-flujo:** Identificación de stocks y flujos del sistema.
6. **Ecuaciones modelo:** Para stocks, integraciones. Para flujos, identificación de políticas.
7. **Simulación:** Generación del comportamiento del modelo a lo largo del tiempo.
8. **Análisis e implementación:** Comparar comportamiento real y simulado, probar estructura, identificar y probar políticas alternativas, implementar cambios en el sistema real.

### Errores comunes

- Por ejemplo, caso de *identificar la variable que más influye en experimento*: También debe saberse eso que implica para el sistema que eso influya más que lo otro, no quedarse con un solo numero.
- En general, realizar un análisis más profundo usando el modelo de simulación, sin quedarse simplemente con las cantidades que devuelve.

## En dinámica de sistemas *continuos*

### **Conceptualización:**

Por medio de diagramas causales (cualitativo).

- Definir el propósito del modelo.
- Definir los limites del modelo e identificar las variables relevantes.
- Describir el comportamiento de las variables relevantes.
- Componentes.
    - Var. endogenas: Variables que son influidas por otras en el sistema.
    - Var. exogenas: Influye al sistema pero no tiene otra var. que influya en ella. Por eso se ven como variables externas.
    - Var. de estado: Var. de interés, de la cual interesa saberse la evolución en el tiempo.
    - Var. de salida: Muchas veces coinciden con las var. de estado.

### **Formalización:**

Diagrama de Forrester, Ecuaciones diferenciales.

Una vez parametrizado el modelo, se “ejecuta”, se realiza la simulación.

Por ultimo, toma de decisiones analizando los resultados.

---

*Faltan un par de cosas acá… Mirar diapositivas.*

---

### Polaridad

Los enlaces entre variables tienen polaridades, para saber si influencian de manera directa (polaridad **positiva**) o inversa (polaridad **negativa**).

### Bucles de retroalimentación

Un bucle es una cadena cerrada de relaciones causales.

Una manera rápida de detectar la polaridad de un bucle es observar la polaridad de los enlaces. Si la cantidad de enlaces negativos (que intervienen en el grupo, obvio) es **par**, la polaridad es **positiva**. Si la cantidad de enlaces negativos es **impar**, la polaridad es **negativa**.

Los bucles con polaridad positiva generan **retroalimentación de refuerzo:** Potencia un cambio de estado, de manera creciente o decreciente, favoreciendo el crecimiento o el declive del sistema según el estado de partida.

Los bucles con retroalimentación negativa generan **retroalimentación de balance:** Los cambios de una parte del sistema generan cambios en el resto del sistema Que reducen, limitan o contrarrestan el cambio inicial.

### Estructura y comportamiento

La presencia de bucles nos permite explicar determinadas formas de comportamiento, que son especificas de la propia estructura.

Tipos, o patrones de comportamiento:

- Exponencial: Relacionado con bucles de refuerzo.
- Búsqueda objetivo: Variables tendiendo a cierto valor.
- Oscilatorio: Presente generalmente en caso de demoras (efecto demorado).
- Crecimiento en forma de S.
- Crec. en forma de S con oscilación.

Estos patrones no son los únicos que puede exhibir un sistema, pero cubren la mayoría de los casos.

### Buenas practicas para modelado causal

*En diapositiva.*