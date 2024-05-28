# TCP (cont.)

## Maquina de estados TCP

No hay que aprenderla pero es útil conocerla para hacer troubleshooting. Por ej.: Que una instancia de TCP este en FIN_WAIT_ por mucho tiempo, seguramente algo este mal porque significa que el ACK para el FIN correspondiente no llegó.

## Bit PSH (Push)
Que este activado en el encabezado TCP significa:
+ Que la aplicación emisora informa a TCP que los datos tienen que enviarse inmediatamente. Sirve para que TCP no espere a que lleguen más datos para enviar un segmento con más carga útil. Aunque, TCP puede ignorar esto, aunque active este bit.
+  (Completar con diapo.) Avisar al receptor del segmento con PSH activado que no espere a recibir más datos para procesar los bytes. Entonces, aunque TCP ignore la orden del receptor, el PSH sirve para algo en el receptor.

## Bit URG (Urgent)
Está activo cuando se activa la opción que permite señalar dentro del area de datos algo que es urgente.

No se usa.

## Ventana deslizante (cont.)
¿Qué hace la ventana de recepción si recibe fuera de orden? Si tiene espacio, guarda en la ventana lo que llego fuera de orden, y vuelve a enviar un ACK diciendo que espera lo que no llegó.

### Control de flujo

La ventana de transmisión debe ser igual o más chica que la ventana de emisión. El receptor informa su tamaño de ventana con el campo WSIZE. Este tamaño no es el tamaño total del buffer, sino cual es el tamaño de ventana _disponible_ en cada momento determinado. Es decir, si tiene bytes que la aplicación no leyó todavía, el tamaño de la ventana es más chico.

*(pag 58. diapo)*

Si en un momento informó que no tiene espacio de ventana, luego cuando se libere la ventana debe enviar una confirmación explicita al emisor para avisar que la ventana ahora tiene espacio.

## Síndrome de la ventana tonta

*(ver de diapo.)*

## Temporizadores

### Persistencia
Se usa para salvar las situaciones en los que el ACK explicito que actualiza el tamaño de la ventana, se pierde. Si termina, envia 1 byte al receptor.

+ Si realmente la ventana sigue = 0, el receptor enviara un ACK diciendo que todavia espera los bytes que esperaba, y que WSIZE=0.
+ Si se habia perdido la actualización, ahora hace un ACK para este nuevo byte.

### Retransmision (RTO)

 El ACK no tiene como objetivo principal el control de flujo, sino tener una manera de saber si se necesita una retransmisión de datos. Si se termina este timer, se retransmite el segmento.
 
 En la capa 2, el valor de este timer esta determinado completamente por la velocidad de flujo y la longitud de la conexión. Esto no pasa en Capa 4. Pero, si vas tomando el tiempo entre el envío de un segmento y la llegada de su correspondiente ACK (RTT) podes estimar este tiempo, que puede ir variando, por ejemplo, por congestiones en la red.

+ **RTT medido**: Tiempo que se tarda en enviar un segmento y recibir el correspondiente ACK.
+ **RTT suavizado**: Es un promedio ponderado entre RTTM y el RTTS anterior.

![image](https://github.com/qxtclxr/Notas-de-clase-Sistemas-UTN-FSRF/assets/110787625/b5f96f17-cfca-4a67-9a63-65fc829e200c)

No se toma exactamente el RTTS para el RTO, sino que
+ Se lo multiplica por un factor $RTO= y \cdot RTTS$, o...
+ Calcula la desviación, que se usa más:
	+ $RTTD= (1-x) \cdot RTTD + x\cdot |RTTM-RTTS|$, $x$ generalmente es $0.25$.
	+ Combina RTTS y RTTD $RTO= RTTS + 4 \cdot RTTD$.

Puede ser que el RTT se mida incorrectamente cuando haya retransmisiones.

![image](https://github.com/qxtclxr/Notas-de-clase-Sistemas-UTN-FSRF/assets/110787625/2a8d5db7-0658-4d31-b074-998c786907db)

Para ello surge el **algoritmo de Karn**

![image](https://github.com/qxtclxr/Notas-de-clase-Sistemas-UTN-FSRF/assets/110787625/4c3be50b-71ff-4eb1-bd23-b03673f50d21)

_Nota: Ignorar las actualizaciones de RTT ante retransmisiones no alcanza por si mismo, porque ante un RTO muy pequeño siempre habrá retransimisiones y nunca se actualizará su valor para ajustarse al comportamiento de la red._

### Keepalive

Si un cliente se cae, la conexión podría quedar abierta para siempre. Para poder distinguir entre aplicaciones que no cierran su conexion a nivel aplicacion (no hay nada para mandar) y casos donde el otro lado se cayó (no existe el otro lado), existe el keepalive.

Cada vez que el servidor "escucha" a un cliente, reinicializa el temporizador.

Si el servidor no tiene noticias del cliente después de 2 horas, le envía un segmento sonda. Si no hat respuesta despues de 10 sondas (que se envian cada 75 segundos), el servidor asume que el cliente se cayó y termina la conexión con un RST.

_Nota: En aplicaciones como SSH, esto nunca pasa porque pide un cierre a nivel app. Telnet no hace esto (btw, nunca deberias usar esto para cosas en serio)_

### Time-Wait

Para casos, por ejemplo, donde la conexión se cierra pero quedan datagramas todavia pendientes en la red. Si se vuelve a abrir una conexión muy rapidamente luego de cerrarla, entre los mismos dos puertos, estos datagramas pendientes pueden llegar y confundirse con información perteneciente a la nueva conexión (debería darse que justo los numeros de secuencia sean coherentes, dificil pero puede pasar). Con el temporizador Time-Wait, se fuerza un tiempo de espera luego del cierre de la conexión para evitar estas situaciones.

![image](https://github.com/qxtclxr/Notas-de-clase-Sistemas-UTN-FSRF/assets/110787625/a5803d2b-905b-42e9-b82e-78b9f3886157)
