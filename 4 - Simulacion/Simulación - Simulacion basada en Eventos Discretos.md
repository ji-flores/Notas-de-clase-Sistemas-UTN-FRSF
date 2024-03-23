# Simulacion basada en Eventos Discretos

## Definicion
Parte de un modelo del sistema de interes que evoluciona en el tiempo, donde las variables cambian instantaneamente en puntos separados en el tiempo.

En simulacion continua, las variables tambien cambian instantaneamente (sin retraso)

En esos puntos ocurren **eventos**.

## Eventos
Ocurrencia instantanea que puede cambiar el estado del sistema. El estado podra verse modficado o no ante la ocurrencia de un evento.

Dos (o mas) eventos pueden ocurrir en el mismo momento.

Los estados permanecen constantes entre los eventos, por lo que es posible ignorar el tiempo que pasa entre estos.

## Estado

Proceso: Secuencia de eventos ordenada temporalmente.

Una actividad es el conjunto de operaciones que cambian el estado de una entidad.

# Mecanismos de avance de tiempo
## Orientada al intervalo
Veo el tiempo como una continuidad donde avanza la simulacion, pero el avance de tiempo es fijo en intervalos regulares, y determina en cada intervalo si debe o no ocurrir un evento.

En cada paso, el reloj avanza $\Delta t$ unidades de tiempo, y:
1. Se explora si en ese intervalo ocurrieron eventos.
2. Si hay eventos, los ejecuta.
3. Actualiza los estadisticos.
4. Avanza otro $\Delta t$

¿Eventos simultaneos?

Detecta los eventos que ocurren en t, t+1 siempre en el tiempo t+1, introduce demora.
Pueden tener que hacerse muchos eventos en un momento dado.

Se usa en simulación continua.


## Orientado al evento
El tiempo de simulación avanza al tiempo necesario para alcanzar el proximo evento (evento más inminente EMI), cualquiera sea ese intervalo. Ante eventos simultaneos: Desempate.

Los cambios de estado se realizan cada vez que se avanza el tiempo de simulación, ya que ha ocurrido un evento que afecta el estado del sistema. Esto requiere 

No podes saber cuando viene el proximo.



### Metodo del proximo evento

# Componentes y organización
Existen muchas maneras (formales incluso). Trabajaremos de una manera de alto nivel de abstracción.

Se necesita
- Estado del sistema
- Reloj de simulacion: Simbolizado como t, variable que mantiene el valor actual del tiempo simulado.
- Lista de eventos: Lista que contiene el proximo tiempo en el cual ocurrirá cada tipo de evento.
- Contadores estadisticos: Variables que almacenan información estadistica referida al comportamiento del sistema.
- Rutina de inicializacion: Subprograma que inicializa el modelo en t=0.
- Rutina de tiempo: Determina el EMI (evento más inminente). Segun cuando tiene que ocurrir el EMI, actualiza el reloj de simulación
- Rutina de evento
- Libreria de rutinas: Subprogramas usados para generar observaciones aleatorias desde las distribuciones de probabilidad asociadas al modelo.
- Generador de reportes: En funcion de los contadores estadisticos, subprograma que calcula las estimaciones de las medidas de performance. Con esta info produce un reporte al final de la simulacion
- Programa principal: Invoca a la rutina de tiempo para que determine el EMI, luego le da el control a la rutina de evento asociada para que actualice el estado del sistema. Evalua si termino o no la simulacion para llamar al generador de reporte.

### ¿Como organizamos estos elementos?

//Insertar figura que tiene que estar en alguna bibliografia.

El fin de simulación puede darse por tiempo (se llego a un tiempo especifico) o por cantidad (se dio una cantidad de eventos)

# Modelo de diseño

Para construir el modelo de diseño, redefinimos el estado del sistema en función de entidades.

### Entidad
Objeto de interes en el sistema para un determinado objetivo, el cual puede ser caracterizado segun los valores de sus atributos.

### Atributo
Propiedad de una entidad que permite describir cuantitativamente el estado de la entidad en el sistema.

Un conjunto de atributos define el estado de una entidad. Los estados de las entidades **mas importantes** definen el estado del sistema.

## Componentes del MD

### Estado
En base al **MC**, se toma cada componente (que se ha decidido *incluir*) como una **Entidad**.

Para cada entidad se especifican atributos, actividades y eventos.

El "nivel de detalle" (con decisión de "incluir") para el componente del modelo conceptual representado es un buen punto de partida.

Actividad: Operacion que produce transformaciones en los estados de un entidad. Comienzan y terminan con eventos. Durante una actividad, una entidad no puede responder a ningun evento.

### Rutina de evento
Subprograma que actualiza el estado del sistema cuando un tipo particular de evento tiene lugar. Requiere clasificar los eventos segun sean condicionales: Depende de almenos algun estado o componente del sistema (requerimientos de ocurrencia), e incondicionales: Pueden ocurrir en cualquier momento independiente del estado del sistema (ocurrencia aleatoria).

Ej. de condicionales: Pista de aterrizaje esta disponible o no, cajero esta disponible o no, cola de servicios esta vacia o no.

Ej de incondicionales: Arribo de un cliente a un banco, partida de un cliente del banco, ocurrencia de fallas en una maquina.

Usamos programación temporal de eventos.

#### Programación temporal de eventos

Enfoque de manejo del tiempo que brinda una descripción completa de los cambios de estado que se producen en el sistema cuando ocurre un evento incondicional. Se especifican mediante diagramas de flujo. Deben especificar claramente que cambios se dan en los atributos de entidades.

Solo se arman las rutinas de los eventos incondicionales porque las rutinas de los eventos condicionales quedan embebidas en las rutinas de los incondicionales de los que estos dependen.

#### La simulación discreta puede realizarse mediante calculos manuales.