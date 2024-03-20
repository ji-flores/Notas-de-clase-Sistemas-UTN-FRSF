Redes de Datos - Clase 1 (12/3)
========================

### Información sobre la catedra

**Comunicación con profesores:** Por campus.

**No se toma asistencia.**

**Regularización**
+ Aprobar los dos trabajos practicos (>= 60).
    + En horario de clase.
    +  Uno solo se recupera fuera de cursado.
    +  Son individuales y sincronicos.
    +  Se realizan por campus.
    +  Carpeta abierta, aunque **no** internet y si o si en la PC de laboratorio.

**Promoción**
+ Obtener regularidad.
+ Aprobar los dos parciales teorico-practicos (>= 60).
    + Se pueden recuperar ambos.
    + _Recup. 1:_ Antes de TP2. _Recup 2 y TP:_ Despues del receso.

## Introducción
### ¿Porque se envian datos?
Si una aplicacion funcionara en un solo dispositivo esto no haría falta. Esto hoy en día no se puede concebir.

### Redes LAN
Una red de area local... Generalmente un conjunto de dispositivos conectados, ubicados todos en el tamaño de (aproximadamente) un edificio. Existen diferentes topologias de red (o maneras de implementar una red LAN).
+ Con bus (todos unidos por un solo cable)
+ En anillo: Junto con el bus, problematicas.
+ Concentradores o HUBs.
+ Switches. Resuelven el problema del dominio de colisiones que tienen los HUBs.
+ Redes wireless.

### Modelos de representación
El paso del tiempo mostro que los protocolos que se desarrollaron, especificaban cuestiones de Capa Fisica y de Capa de Enlace de manera separada (prevaleciendo la propuesta de OSI). Aunque, lo contrario sucedio con las capas superiores, la propuesta de TCP/IP de unir Aplicacion, Sesion y Presentación en una sola Capa de presentación resulto util, ya que los protocolos desarrollados unian todas las responsabilidades de estas capas. Entonces, en la practica, surgio un modelo **hibrido** con las capas:

|Presentación|
|---|
|**Transporte**|
|**Red**|
|**de Enlace**|
|**Física**|

## ¿Como se envian los datos?
Un usuario genera los datos, la capa de aplicación toma los datos, y agrega un encabezado para brindar información adicional a la capa de aplicación del receptor. Toda esta información (encabezado + datos) viaja hacia abajo en el protocolo, en este caso a la capa de transporte...

*Copiar imagen de diapo...*

### Dispositivos

*Copiar imagen...*

Porque HUB es de Capa 1? Porque no maneja elementos de Capa 2, de alguna manera solo une los cables.

Porque Switch es de Capa 2? Porque maneja elementos de Capa 2, por ejemplo, sabe la dirección MAC del dispositivo conectado a uno de sus puertos.

**Dispositivos adyacentes:** Dispositivos conectados mediante dispositivos de Capa 1 o 2.

## Interconexión de redes

**Comunicación de extremo a extremo:** Comunicación a nivel de procesos.

Router no entiende de tramas. Recibe tramas, pero lo unico que hace es desarmarla y ver el contenido de el/los paquetes que estan dentro, y actuar acordemente.

Cuando uno interconecta redes, se forma una inter-net. Que es diferente de *la* Internet (notar las mayusculas). Enlazar varias LAN requiere de dispositivos (completar con diapo...)

### ¿Que tipos de servicio puede ofrecer una capa a su capa superior?

Estos conceptos se aplican a *todas* las capas.

+ **Segun confiabilidad:** Que una capa brinde un servicio confiable, significa que el receptor retroalimenta al emisor, avisando si el mensaje que quizo enviar llego exitosamente o no.
    + Un servicio no confiable logicamente genera menos trafico que uno confiable.
+ **Segun gestión de conexión**: Un servicio orientado a la conexión se aserciora de establecer una conexión entre el emisor y el receptor, solo una vez que esta conexión se establece pueden enviarse datos. Intuitivamente como una llamada telefonica.

## Conmutación de paquetes

### Ruteo y Reenvio
Un enrutador tiene dos procesos internos.

**Ruteo**: Recopilar informacion sobre cuales son los destinos posibles, y donde estan. Se puede resolver de dos maneras:
+ Estática: Un administrador carga esta información de manera manual.
+ Dinámica: Los routers intercambian información y arman *tablas* con esta info. de ruteo.

**Reenvío**: Recibir un paquete en particular, y una vez tiene la información de ruteo, enviar el paquete a donde corresponde.

### Comunicación de paquetes

Se parte del supuesto que ya se resolvió el problema del ruteo.

**Servicio de datagramas: Sin conexión**

Tablas de reenvío (ver diapo.). Tener en cuenta que esa representación de las tablas es solo conceptual.

El sistema es robusto. Si se cae una conexión, tenes otros caminos para recuperarte

Nadie garantiza que los paquetes lleguen en orden. El receptor debe reordenarlos (asumo que en algun lado debe estar la info. para que poder hacer esto).

Es imposible anticipar el camino que va a tomar un paquete. Esto significa:
+ No se puede brindar calidad de servicio: Asegurar parametros (tasa de errores, velocidad de transmisión).
+ Congestión: Los dispositivos de red tienen una capacidad de procesamiento. Si empiezan a llegar muchos paquetes, se empiezan a encolar. Si estos paquetes no llegan relativamente rapido, se consideran perdidos. Cuando un router se satura a entrada y salida, el router se congestiona y seguidamente esta congestión se contagia a toda la red.

**Circuitos virtuales: Con conexión**

*ATM no se uso, MPLS permite implementar servicios con conexión sobre IPv4*

Mucho más complejo que el servicio sin conexión.

Para entregar paquetes hay que establecer una conexión. Sigue necesitandose del ruteo.

Se arma un circuito (camino) entre el host A y B. Este circuito puede cambiar de sesión a sesión.

Estas conexiones no mantienen un mismo "nombre" durante todo el camino. Imaginar que salen dos conexiones, una desde H1 y otra desde H3, ambas llamadas conexión "1"

(Imagen en diapo.)

C no sabe cual es el origen de la conexión (el origen hablando del host que genero el mensaje), pero puede distinguirlas como distintas, asignarle distintos recursos...

En resumen, una conexión se distingue por su emisor (en un momento determinado) y un numero.

Entonces, el nodo C recibe una conexión 1 y otra 2, y sabe que ambas vienen de A. En el ejemplo, debe enviar ambas conexiones a E, entonces debe darles nombres distintos (en el ejemplo, 1 y 2). Pero si tuviera que enviar una a D y otra E, tranquilamente podría enviar ambas conexiones con el nombre "1", ya que tanto D como E sabran que solo existe una conexión llamada "1" que viene desde A.

Estas tablas se limpian cuando la conexión se termina.

La tabla de reenvío de D en este momento parece estar vacía, pero la tabla de ruteo **siempre** tiene que estar. Por eso la tabla de ruteo esta en disco y la de reenvío en memoria.

**Es menos robusto**. Si se cae un nodo, todas las conexiones que pasaban por ese nodo se pierden. 

La ventaja es que se puede asegurar la calidad de servicio. Ej.: Si la aplicacion necesita mayor ancho de banda, se establece una conexion que tenga estas caracteristas, si se necesita menor tasa de errores, lo mismo.

Los paquetes van a llegar en orden.

Overhead en una red: Todo el trafico que no son datos que se estan queriendo transmitir.

Deben llevar un estado de la conexión (si esta activa, si se esta estableciendo, ...)

### Congestión en redes conmutadas
En terminos generales, la congestión ocurre cuando el nro. de paquetes que se transmiten sobre una red empieza a eproximarse al límite de la capacidad de gestión de paquetes de la misma.

Control de congestión: Mantener el nro. de paquetes existentes en la red por debajo del nivel a partir del cual el rendimiento cae drásticamente.

Cada interfaz tiene trafico de entrada y de salida, entonces existe un buffer de entrada y de salida (en la realidad el buffer es uno solo). Se pueden encolar en la entrada porque el router procesa mas lento de lo que llegan , y a la salida porque el medio transmite más lento de lo que el buffer procesa.

Aunque los buffers fueran infinitos, si los paquetes empiezan a llegar excesivamente tarde (porque estan increiblemente atras en la cola) y la comunicación no serviría de nada.

**¿Quien es responsable de controlar la congestión?** Los routers se congestionan, por ende tienen que manejarlo ellos? O son los extremos, que envían mucho tráfico?

+ Paquetes reguladores: Un router se congestiona, y le avisa al emisor que baje la velocidad de transmisión (envía un paquete regulador). No es una muy buena idea ya que lo menos que se necesita ante una congestión es más tráfico. Ademas no se esta haciendo nada para frenar la congestión, solo avisar a alguien más (Completar con la diapo).
+ Señalización implicita de congestión: Responsabiliza a los extremos, estos lo deducen por el comportamiento de la red (se empiezan a perder los paquetes (TCP), el retardo de transmisión aumenta considerablemente, por ej.). En base a eso se actua bajando la tasa de transmisión. TCP usa este metodo (es capa 4!)
+ Señalización explicita de congestión: Tanto los enrutadores como los extremos actuan. Marcar que hay una congestión, un paquete que pasa por un router congestionado es marcado como "paso por un router congestionado". Esa señalización puede para adelante o hacia atras (en el sentdo contrario). La diferencia con el paquete regulador es que la notificación se hace marcando paquetes ya existentes (cambiando algún bit, ej.). (Completar con diapo.)
+ Desprendimiento de carga: Cuando se inunda el router con paquetes que no pueden manejar, estos se descartan.
    + ¿Cuales se descartan? Depende del tipo de aplicaciones que utiliza la red, en una transferencia de archivos vale más un paquete viejo que uno nuevo, para tiempo real, uno nuevo vale más que uno viejo.
