# Ruteo Dinámico - OSPF

*Se sube la demo del protocolo OSPF.*

El ruteo dinamico no se da a nivel de capa 3, si no que el resultado se ve en las tablas de capa 3.

## Comparación entre estatico y dinámico
**Estatico**
+ Configuración manual de las tablas.
+ Mayor control.
+ No es escalable. No se adapta a escenarios más complejos.
+ Lento para adaptarse a los cambios en la red.

**Dinamico**
+ Se obtienen cambios optimos.
+ Debugging complejo.
+ Escalables.
+ Rapida adaptación a los cambios.
+ Uso de CPU, Memoria propia.

## Sistemas autonomos
Se requiere de un protocolo que permita intercambiar info. entre los routers. No se podria pensar en un protocolo donde todos los routers intercambian info entre si.
+ La latencia seria muy grande.
+ La administración de las redes y los routers caen bajo diferentes administraciones.

Los sistemas autónomos son conjuntos de routers y redes bajo una misma administración.

Dentro los sistemas autonomos hay bloques de direcciones IP, que se dividen en subredes.

**¿Como se interconectan los distintos sistemas autonomos?** Hay routers de un sistema autonomo que se conectan con otros sistemas autonomos.

El problema del ruteo dinamico se resuelve en dos niveles.
+ Ruteo intradominio.
  + Un protocolo que permita, entre los routers de un sistema autonomo, aprender las rutas para conectarse entre ellos.
  + Protocolo de Ruteo Interior (IGP). Ej.: OSPF (más dificil, pero mas usado y escalable), RIP (más facil, pero menos usado y escalable). *Se puede usar cualquiera, o los dos. La decisión tiene que ver con que es mejor para tu OS.*
+ Ruteo interdominio.
  + Entre los routers **de borde** de diferentes sistemas autonomos.
  + Protocolo de Ruteo Exterior (EGP). Ej.: BGP (no se da).

*Configurar mal BGP no es poca cosa. Aisla todo un sistema autonomo. Si queres configurarlo tenes que viajar a donde este el router*.

Puede haber más de un router de borde en cada sistema autonomo, que se conecte a otros sistemas autonomos.

Los routers de borde deben ser, obviamente, lo más performantes en memoria o procesamiento posible. Estan pensados para una carga distinta.

Cada sistema autonomo tiene una identificación, que es _universal_. Que hardware va a usar, los routers que lo conforman, el hardware, quien es el administrador, ...

BGP se basa en estas identificaciones (por ejemplo, para detectar bucles).

Las identificaciones tienen una logica, parecido a las direccions IP, pero no hace falta aprenderlo.

## Tipos de SA
### STUB
SA con una sola puerta de entrada y salida, no necesita aprender rutas de internet.

### Multihome SA

Más de una puerta de salida y entrada.

**Non transit:** Pueden conectarse con un ISP A y otro B para llegar a internet. Pero si ISP A quiere intercambiar información con B, no puede transitar por este SA.
**Trasnit**: Si permite algun trafico de este tipo. No necesariamente _todo_ el transito.

## ¿Por qué diferenciar ruteo interior y exterior?
El ruteo **intradominio** siempre busca el mejor camino (basandose en una metrica, cantidad de saltos, enlace más rapido) entre dos nodos.

El ruteo **interdominio** debe implementar políticas de ruteo. Basadas en consideracions políticas, de seguridad, o economicas. Ejs.:
+ Te dejo pasar trafico por mi SA, pero te cobro.
+ No transportar tráfico comercial en la red educativa.
+ Razones politicas: Al pentagono no le interesa que información suya pase por SAs rusos (por más encriptada que esté).
+ El trafico que empieza o termina en Apple no debe transitar por Google (proteger información empresarial).

Todas estas cosas complican el protocolo, y no sería necesario considerarlas en ruteo intradominio.

## Protocolos de ruteo interior
RIP implementa algoritmo de vector de distancia.
OSPF implementa algoritmo de estado de enlace.
BGP implementa algoritmo de vector de ruta.

Los tres protocolos pueden convivir en un router. Esa información puede estar reflejada en la tabla de reenvío (administrada por un forwarding table manager).

La información configurada a mano en la tabla de reenvío tiene precedencia por sobre la info. dinámica.

¿Si los protocolos difieren sobre una ruta? Se decide con distancia administrativa, que es una forma de dar precedencia entre las decisiones que sugiere cada protocolo.

## Clasificación de algoritmos de ruteo intradominio

*Alguien piensa una estrategia

+ De enrutamiento global: Calcula la ruta de costo minimo entre un origen y un destino utilizando el conociminto global y completo acerca de la red. El algoritmo de estado de enlace (OSPF) es global.
+ De enrutamiento descentralizado. (ver diapo.)

## Algoritmo de Vector Distancia

*(ver de apunte o diapo. para completar)*

+ Va aprendiendo destinos posibles, y cuanto cuesta llegar a ese destino usando tal proximo salto.
+ Vecinos: Dos routers directamente conectados.
+ Metricas de costo: Cantidad de saltos (usado por RIP), tiempo.
+ Puede que tengas que hacer un cambio en la tabla aunque no sea optimo, en el caso que tu gateway para cierto destino ahora te diga que la ruta para llegar a ese destino, desde esa gateway, es mayor.

### Problema del conteo infinito
RIP entiende que 16 es infinito. Pero hasta que no llegue aca, lo que tenemos en las tablas de reenvio es basura (el protocolo no convergió).

Soluciones:
Horizonte dividido: Comparto con un vecino A todo el vector, menos lo que aprendi de ese vecino A.
Reverso envenenado: Comparto todo con el vecino A, pero aquello que aprendi de ese vecino lo comparto con costo $\infty$ (16 en RIP).

¿Por qué RIP no es escalable? Por que cualquier valor que yo ponga como $\infty$ (16, o más), cualquier ruta que involucre más saltos no va a funcionar, el protocolo lo va a considerar inalcanzable.

## OSPF: Caracteristicas
+ Protocolo de ruteo interior.
+ Implementa un algoritmo de estado de enlace.
+ Es escalable, y de convergencia rapida.
+ Encapsulado en IP directamente. PROTOCOL = 89. No usa servicios de capa de transporte. _RIP es un protocolo de aplicacion, que usa los servicios de transporte y modifica tablas de capa 3_.
+ Soporta autentificación. Una forma facil de atacar una red es hacer que los routers publiquen basura.

El protocolo de enrutamiento de estado de enlace, cada enrutador mantiene una base de datos (nombre real) que describe la topologia del sistema autonomo.

El enrutador distribuye su estado local a traves del SA por **inundación**. "Lo que recibo por una interfaz la reenvío por todas las otras".

## Proceso de enrutamiento de estado de enlace
1. Descubrir a mis vecinos y conocer sus direcciones de red.
2. Establecer una metrica de distancia o de costo para cada uno de ellos. En OSPF, uno como admin. puede definir su metrica, por defecto es la velocidad del enlace (un cociente entre una velocidad de referencia, y la velocidad real).
3. Construir un paquete que indique todo lo que acaba de aprender y enviarlos (LINK STATE UPDATES-LSU que contienen LSAs).
4. Enviar este paquete a todos los demas enrutadores y recibir paquetes de ellos. Mediante inundación.
5. Con la información recibida, calcular la ruta más corta a todos los demás enrutadores. Basado en Dijkstra.

## Areas
Se divide la topología en Areas. Cada router conoce la topología de las areas a la que esta conectado, de las demas conoce los destinos pero no la topología.

Cada SA tiene un area troncal (backbone), el area 0. Todas las areas deben conectarse (fisica o logicamente) al area 0.

### 1. Aprender sobre los vecinos

Dos routers son adyacentes son dos routers que resolvieron que van a intercambiar información.

OSPF es como 3 protocolos en 1: Hello, Inundación y SPF.

*(Completar con Diapositiva y Apunte)*

---

## Notas de la practica

+ Por convención, el router designado es aquel cuya interfaz tiene la mayor dirección IP. MikroTik no sigue esta convención y siempre que pueda se autoasigna como router designado (si no encuentra a nadie asignado, se asigna y esto no cambia por la duración del proceso).