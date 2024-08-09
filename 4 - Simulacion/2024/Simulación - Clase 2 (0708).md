# Unidad 1 - Parte B: Sistemas de Cola

Nos vamos a enfocar en simulación de sistemas de eventos discretos. En estos sistemas, las colas (o sistemas de colas) son un comportamiento tipico de estos sistemas.

Ejemplos: Parada de colectivo, supermercado, trafico, de productos para distribución...

Los **modelos de colas** son herramientas para evaluar el rendimiento de sistemas de colas. Se pueden resolver matematicamente o analizar mediante simulación, con el objetivo de predecir medidas del rendimiento del sistema en función de los parámetros de entrada.

La **teoría de colas** estudia los fenomenos de colas que se producen en un sistema (caracterista de los sistemas discretos). Permiten calcular...

+ Tiempo promedio de espera en cola.
+ Longitud promedio de la cola de espera.
+ Tiempo promedio en el sistema.
+ Utilización del servidor.

## Estructura basica

### Comportamiento de sistemas con Colas

Para estimar el comportamiento de una cola es necesario establecer:

+ Patron de llegadas: Se describe a traves del tiempo entre llegadas, que responde a una distribución de probabilidad.
+ Proceso de servicio: Describe la forma en que se "atiende" o se brinda servicio a las entidades involucradas. Conocer cuantos "servidores", si trabajan en serie, en paralelo, ... *También tiene distribución?*

### Estructura

Los componentes principales de un problema de colas son:

+ Las entidades que seran atendidas.
+ El servidor.

$\lambda$: Velocidad de arribos, cantidad de arribos/unidad de tiempo.

$\mu$: Velocidad de servicio, cantidad de atendidos/unidad de tiempo.

### Proceso de servicio

+ Tiempo que dura el servicio, o frecuencia.
+ La capacidad o cantidad de entidades a atender simultamneamtente.
+ La disponibilidad.
+ El numero de servicios por entidad si existe mas de una estacion de trabajo.
+ La disciplina de la cola.

### Disciplina de cola

**Def.:** Representa el orden en el que seran atendidas las entidades que esperan por el servicio.

Si hay prioridad o no, que hacer si una cola se desocupa, si los elementos se pueden cambiar de cola...

+ FIFO: Tradicional, first come first served.
+ LIFO: Por ejemplo, una pila de productos.
+ Aleatoria: No existe un orden de atención, o igual probabilidad de ser atendido para todos los elementos.
+ Con prioridades.
  + Selección de la entidad que requiere más tiempo de servicio o menos tiempo servicio, según el criterio.
  + Atendiendo a un número de prioridad en particular que tenga cada trabajo para el servicio.

### Servidores

El servidor puede ser uno, varios en paralelo, varios en serie...

### Capacidad de colas

Puede ser finita, se limita la llegada de las entidades al sistema. Ej.: Cola de un router, cola para entrar al cine.

O infinita, por ejemplo, colas de trafico o colas de supermercado, no tienen un limite definido.

### Comportamiento de sistemas con colas

**Colas simples:** Las distribuciones de probabilidad de tiempo entre arribos o del servicio no cambian a lo largo del tiempo.

**Colas complejas:** Se producen variaciones en las colas como por ej. las horas pico para las llegadas, o el incremento de la capacidad de servicio (se incorporan mas servidores) cuando la cola pasa de cierta longitud. Entonces, variaciones en las llegadas o en el servicio.

## Metricas y salidas

### Metricas

Algunos ejemplos:

+ Numero promedio de entidades en la cola.
+ Numeros maximos y minimos de entidades e cola.
+ Tiempo promedio de espera.
+ Tiempos maximos y minimos de espera por entidad en el tiempo de simulación.
+ Ocupación o utilización del servidor: % del tiempo ocupado, dentro del tiempo de simulación.

### Salidas

Numero de entiddaes atendidas en el tiempo total de simulación.

Tiempo de procesamiento o atención para un lote de entidades. Ej: Tiempo que se demoro en procesar 500 unidades de productos, o personas.

## Caso practico

Caso practico de heladeria.

+ Patron de llegada: Tiempo de arribo aleatorio, distribucion desconocida.
+ Un solo servidor que atiende a uno por vez.
+ Politica FIFO.

Dudas:

+ ¿Cuanto dura el servicio?
+ ¿Cual es el patron de llegada?

Se comienza realizando observaciones directas...

**Metricas a verificar:**

+ Utilización del servidor: Tiempo total ocupado/Tiempo total de simulación.
+ Tiempo promedio de servicio.
+ Tiempo promedio interarribo.
+ Probabilidad de que un cliente espere en col: nro. de clientes que esperaron / nro. total de clientes.
+ Tiempo promedio de espera de cola.
+ Tiempo promedio en cola de los clientes que esperaron.
+ Tiempo promedio en el sistema.

## Proceso de simulación manual

+ Con el patron de llegadas y el proceso de servicios se puede realizar una simulación manual para estimar las variables que describen el sistema.
+ Las variables iran cambiando durante la simulación. Representan el comportamiento del sistema en un momento dado. Pueden ir graficandose.
+ Al final de la simulacion esas variables de estado seran las salidas o permitiran obtener otras salidas (promedios, minimos, maximos, totales, etc.).

## Caso Practico 2

Nos dan el **patron de llegada** en forma de los tiempos entre arribos y el **proceso de servicio** en forma de los tiempos de servicio.