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
  + Protocolo de Ruteo Interior (IGP). Ej.: OSPF, RIP. *Se puede usar cualquiera, o los dos. La decisión tiene que ver con que es mejor para tu OS.*
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
+ El ruteo intradominio siempre busca el mejor camino (basandose en una metrica, cantidad de saltos, enlace más rapido) entre dos nodos.
+ El ruteo interdominio debe implementar políticas de ruteo.
  + Basadas en consideracions políticas, de seguridad, o economicas. Ej.:
    + Te dejo pasar trafico por mi SA, pero te cobro.
    + No transportar tráfico comercial en la red educativa.
    + Razones politicas: Al pentagono no le interesa que información suya pase por SAs rusos (por más encriptada que esté).
    + El trafico que empieza o termina en Apple no debe transitar por Google (proteger información empresarial).
... Todas estas cosas complican el protocolo, y no sería necesario considerarlas en ruteo intradominio.
