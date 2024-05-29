# Capa de Transporte
_(va a haber una clase asincrónica, 2da parte de TCP)_

+ Proporciona la comunicación proceso a proceso.
	+ Es la primera de las capas del modelo que ve esto. El software que ejecuta la capa 4 esta en los procesos, en los extremos.
	+ Muchas de las funciones ya aparecen en Capa 2, nada más que antes se ejecutaban sobre entidades pares de dispositivos adyacentes, ahora se dará entre dos procesos.
+ Multiplexación: Colectar datos de múltiples procesos. Multiples procesos utilizan un unico canal de comunicación con la red.
+ Demultiplexación: Por lo contrario, mucha información que cae al una sola interfaz se debe repartir acordemente entre los procesos. Entrega los segmentos a los procesos.
+ El paradigma de comunicación proceso a proceso más frecuente es cliente-servidor. *También puede ser peer-to-peer, pero se va a ver solo cliente-servidor.*

## Direccionamiento

¿Cómo identifico los procesos? Una idea de es identificar a los procesos dentro de los hosts, y luego identificar a los hosts. Entonces tenemos una dirección como un par $(\text{Proceso},\text{Host})$ (Por supuesto, decir Host es una simplificación, un Host puede tener muchas interfaces o "puertas" a la red, aun así, esto no nos priva de reconocer cada proceso unívocamente).

Para los Hosts seguimos usando las direcciones IP. Y para los procesos, identificar el punto de acceso del servicio a la capa de transporte (TSAP).

SAP: Cada vez que una entidad de una capa $n$ usa servicios de la capa $n-1$ hay puntos de acceso al servicio. Para la interfaz Aplicación-Transporte se llama TSAP, y se identifica entonces una para cada proceso.

¿Por qué no usar el PID? El PID no esta estandarizado, cada OS usa la cantidad de bits, el formato... que le conviene. Además, el PID se asigna según el momento que el proceso fue creado.

En el ámbito de la familias de protocolos TCP/IP los TSAPs se denominan puertos que se identifican con los números enteros comprendidos entre $0$ y $65535$. No se crean siempre todos los puertos, cuando un proceso necesita un puerto, pide la asignación a la capa de transporte. Generalmente, esto se hace mediante un servicio del OS, con una syscall.

El programa *cliente* se define mediante un número de puerto usualmente elegido al azar. Pero el servidor no debe ser al azar. *Ej.: Si yo necesito algo de alguien, y debo llamarlo por teléfono, necesito su nro. En cambio, quien me atiende no necesita mi numero, simplemente atiende (cuando tiene que responder, ya sabe donde, no necesita saber de antemano).* Esta es otra razón por la que el PID no sirve, el PID se asigna dinámicamente y no es predecible, si el servidor cambiara siempre de identificador sería imposible encontrarlo.

### Direccionamiento: Opcion 1

**¿Cómo sabe el cliente que un servicio se encuentra en tal puerto?** Típicamente (aunque no esté estandarizado) se terminaron usando ciertos puertos para cierto tipo de servicios.

El sistema operativo tiene un **archivo de configuración** que asigna un tipo de servicio a un tipo de puerto. *(Imagen diapo)*

Pueden crearse servidores http en otro puerto. Si, pero hay que avisarle al cliente...

### Direccionamiento: Opción 2

Existe un proceso especial llamado asignador de puertos (portmapper, que **si** esta predefinido), que sirve para encontrar la dirección TSAP correspondiente a un nombre de servicio especifico.

Los servicios tienen una manera de registrarse en el portmapper, y se les asigna un puerto univoco.

*Nota: El portmapper es objetivo de ataques. Y es muy vulnerable por ser un proceso viejo.*

### Direccionamiento: Opción 3

Cada servidor necesita un puerto, y se basa en la opción 1 en donde tienen un puerto especifico de antemano.

Existen servicios que reciben muy pocos requerimientos, y pueden estar escuchando (osea, gastando ciclos de CPU) en vano. Si esto pasa mucho, esta opción permite tener un proceso (servidor de procesos) que escucha en muchos puertos, y cuando detecta que llega un requerimiento para uno de los procesos, lo "despierta", mientras estos procesos están dormidos.

## Rangos ICANN

+ 0-1023: Puertos "bien conocidos". Son puertos controlados por el IANA y están asignados a servicios.
+ 1024 - 49151: Puertos registrados. Estos puertos no son controlados por el IANA, sino que son asignados a un servicio especifico a petición de una entidad solicitante. También es el rango que se utiliza para levantar aplicaciones que den servicios (aunque no estén registrados, ej.: Una base de datos en 8444).
+ Puertos dinámicos: No se los controla ni se los registra. Se los puede utilizar para conexiones cortas, donde el alojamiento del puerto es temporal. No deberían usarse para levantar servicios porque generalmente se usan para clientes.

# Puntos extremos: Sockets
La combinación de una dirección IP y un número de puerto se denomina punto extremo. *En realidad, también existe un tercer campo que identifica protocolo, pero no lo mencionamos porque generalmente en el curso nos referimos a un socket dentro del contexto de un protocolo.*

### Sockets
Sockets y las primitivas asociadas a los mismos, se utilizan mucho en la actualidad en la programación de Internet

*(imagen diapo.)*

# TCP

**TCP** un protocolo **orientado a conexión**, y como todo servicio de conexión, el cliente primero pide al servidor que levante una conexión, y al terminar la comunicación, le pide que la cierre.

TCP también es **confiable**. Utiliza un mecanismo de asentamientos para comprobar el arribo correcto de los datos.

Tiene más cosas: Control de congestión, etc.

*Nota: UDP solo multiplexa, demultipelxa y puede agregar un checksum...*

### Servicio de entrega de flujos (stream)
Permite que el proceso que envía le entregue datos como un flujo de bytes... (completar)

### Buffers de envío y recepción
Similar a las ventanas. TCP necesita buffers para su almacenamiento temporal. 

Los buffers de emisión guardan en ese buffer aquellos ***(VER DE DIAPOSITIVA/APUNTE).***

# Cabecera TCP

## Números de secuencia y de ACK
Cada envío que se hace necesita un identificador, para que el receptor pueda avisarle al emisor que recibió un dato. Para esto está el número de acuse (ACK) de recibo. Para poder mandar un ACK, hay que activar también una bandera.

Los números de secuencia y de ACK se refieren a un número de byte y no a un número secuencial.

*Ejemplo:*
+ Primero byte: 1057.
+ Total de datos a ser enviados = 6000 bytes.
+ Los bytes se numeran desde 1057 a 7056.

*(imagen diapositiva)*

El numero de secuencia de un segmento se corresponde con el n-simo byte.

## Flags SYN y FIN
Afectan al secuenciamiento de TCP, "gastan" un byte. Si un segmento tiene el bit SYN y FIN activo (nunca se activan a la vez), hay que sumar al numero de secuencia anterior la cantidad de bytes transmitidos, y un bit para este bit.

## Piggybacking
También existe el concepto de mandar confirmaciones "encima" de datos. Aunque, si tenes que mandar una confirmación pero no tenes datos, si se pueden mandar confirmaciones *explicitas*, que no tienen datos.

En estos casos, el numero de secuencia del siguiente segmento, potencialmente con datos, va a tener el mismo *número de secuencia*.

## Acknowledgement TCP
El nro. de ACK hace referencia de alguna manera al nro. de secuencia. Vos podes avisar lo ultimo que  recibiste, o lo próximo que estas esperando (ambas cosas se pueden inferir de la otra). TCP utiliza la siguiente opción (si recibí el 1000, con 500 bytes de datos, digo "espero el 1500").

Las confirmaciones son acumulativas, si te digo "espero el 1500" estoy diciendo implícitamente que todo lo anterior lo recibí.

## Establecimiento de la conexión

+ Se denomina acuerdo de tres vías (three-way handshaking).
+ Una conexión TCP se identifica por sus puntos extremos (recordar, dos pares IP-Puerto), enumerados en cualquier orden.
+ Para que se establezca la conexión:
	+ Un extremo (típicamente el servidor, pero no siempre) crea un socket para esperar un pedido de conexión con él. Esto se llama **apertura pasiva**.
	+ Un extremo (típicamente el cliente, pero no siempre) crea un socket para enviar un pedido de conexión. Esto se llama **apertura activa**.
+ Cuando se inicia una conexión, el nro. de secuencia se inicia aleatoriamente entre $1$ y $2^{32} -1$ (es cíclico, cuando se termina la secuencia da la vuelta) de manera **independiente para el cliente y el servidor** (los números de secuencia son propios de cada Host).

## Cierre de la conexión

Un host puede terminar su envío de datos y seguir recibiendo datos.

+   Cuando uno de los procesos dice "no tengo datos". TCP avisa al otro extremos que no habrá  datos. Se habla de *medio cierre* de la conexión. *En este sentido, no funciona como una llamada telefónica.*
+ Cuando la aplicación A hace su cierre, activa su bit FIN (este segmento puede tener datos o no). Con SEG=X
+ Cuando B responde, hace un ACK diciendo que espera el segmento X+1+Datos (Si el segmento de FIN no tenía datos, solo X+1).
+ Ahora, A ya no puede mandar ***datos***, si puede mandar confirmaciones a los datos que B le envíe.
+ B luego hará lo propio para cerrar su lado de la conexión. *(Ver imagen de diapo. para más)*

## Cierre de conexión TCP en 3 pasos
+ Si A pide su cierre de conexión, y B, luego de esperar un tiempo para ver si puede hacer piggybacking, que siempre pasa, termina también pidiendo su cierre de conexión, envía su segmento con el FIN y hace piggybacking del ACK del FIN de A. En realidad no es un método

## Denegar o abortar conexión
El receptor usa el bit RST para enviar un mensaje avisando que rechaza la conexión (posiblemente porque no hay ninguna aplicación escuchando el puerto). También es usado para **abortar** una conexión, terminarla de manera anormal. *(Complementar con imagenes diapo. o Apunte)*

## Opción MSS
**MSS:** Maximum Segment Size. Indica el tamaño máximo de los **datos** que permito recibir en un segmento.

Si una parte no lo define, toma el valor por defecto que es 536 bytes.

Se usa para intentar evitar la fragmentación. Como típicamente el MTU de una red Ethernet es 1500, se pone un MSS de 1460 (1500

# Ventanas
 
**WSF**: El campo "tamaño de ventana" quedo chico. Sirve para escalar el tamaño de la ventana. Para que realmente usemos esta opción, ambos procesos deben tener activado este byte.
