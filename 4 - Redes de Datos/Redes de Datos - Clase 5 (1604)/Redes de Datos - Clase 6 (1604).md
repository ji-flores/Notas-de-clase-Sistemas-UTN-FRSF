***Mayo 14 y 15: Parcial y TP, respectivamente.***

¿Que pasa si un TTL llega a 0? Se descarta.

También se descarta cuando no hay fila de reenvío que le corresponda.

Pero, que pasa cuando se descarga ¿Nadie se entera? Para eso y otras cosas existe el protocolo ICMP, complementario a IP.

# ICMP
**Internet Control Message Protocol** permite a los dispositivos enviar mensajes de control o mensajes de error de regreso al origen de un datagrama que causó un problema. Es un protocolo de mensajes, avisos.

Aplicaciones de proposito general, generalmente no reciben mensajes ICMP, solo si es una aplicación de diagnostico.

ICMP no es una subcapa de IP, Capa de Transporte **no** le pide servicios a ICMP.

`A que capa pertenece ARP?`

## ¿Quien envian mensajes ICMP?
+ Los routers y hosts pueden enviar mensajes ICMP. Ej.: Un router tiene un error de reenvío con cierto datagrama, genera un mensaje ICMP con destino al origen del datagrama que genero un error.

Ejemplo: Un datagrama agota su TTL en cierto salto. Se genera un mensaje ICMP con destino al origen del datagrama.

*(insertar imagen datagrama ICMP)*

## Entrega de mensaje ICMP

Si un datagrama que lleva un **mensaje de error** ICMP debe descartarse, esto no provoca la generación de un nuevo mensaje de error ICMP.

Si un datagrama que lleva un **mensaje de control** ICMP debe descartarse, esto no provoca la generación de un nuevo mensaje de error ICMP.

## Formato de un mensaje ICMP
Cada mensaje ICMP tiene su propio formato. Sin embargo, todos los mensajes ICMP comienzan con los mismos tres campos.

1. 8 bits de **TIPO**. No solo "control" o "error", por ejemplo, hay muchos tipos de errores distintos.
2. 8 bits de **CODIGO**. Más información sobre el tipo de mensaje, por ejemplo, si el tipo especifica error de temporizador, el codigo te dice con que temporizador especifico.
3. 16 bits de **CHECKSUM**. Se calcula sobre todo el mensaje.
4. **CUERPO** del mensaje.
    + Si es de error, se incluyen los primeros bytes del datagrama que provocó el error (toda su cabecera y un poco más). Esto es suficiente para que el host sepa a que datagrama se refiere.
    + Si el mensaje es de control, el uso de este campo depende del tipo de mensaje de control.

**Aclaración:** No necesariamente son iguales la interfaz por la que llega un datagrama (que termina generando un error), con la interfaz por la que se envía el mensaje ICMP. Puede ser que por la configuración de las tablas de reenvío, sean distintas.

## Pruebas de alcanzabilidad y estado del destino (Ping)

Ping es una aplicación de diagnostico. Es la más utilizada de Internet, y no esta estandarizada, cada uno la implementa como quiere.

El comando ping envía un mensaje (de control) **Echo request** ICMP hacia un dispositivo remoto. Cualquier dispositivo que recibe un Echo Request ICMP crea un Echo Reply ICMP y devuelve la respuesta a la computadora original.

Una solicitud de eco y la respuesta asociada se pueden usar para probar si dos dispositivos tienen conectividad. Para saber que respuesta se asocia a que solicitud, se agrega un identificador en el cuerpo (?).

A veces para verificar que la conexión se da, sino que debe verificarse que la conexión se pueda dar para datagramas lo suficientemente grandes. Esto también se puede hacer mediante **echo**s.

Tiempo de espera agotado no tiene que ver con TTL agotado, se refiere un tiempo literal, que la implementación particular de ping tiene configurado para quedarse esperando una respuesta, terminado el cual genera ese mensaje.

## Solicitudes de cambio de ruta desde los ruteadores

Siempre se intenta mantener la tabla de reenvio de los hosts lo más chica posible. Pero pueden haber situaciones donde un host A tenga dos opciones de gateway. Generalmente, en vez de configurar el host con muchas filas

El mensaje de cambio de solicitud de ruta puede lograr que el host A, temporalmente y sin tener que cambiar su tabla de reenvío, cambie su gateway al otro router. Si el host A no lo acepta, el router seguira intentando que cambie su ruta generando más mensajes. Esto genera mucho overhead, se configura el router para que filtre estos mensajes.

# Opciones IP
En el paquete IP se especifica la longitud del paquete, porque este es variable. Una razon por la que puede variar es por las opciones IP.

## Record Route

*(copiar de diapo.)*
Guarda los nodos por los que pasa el datagrama.

## Source Route
### Tipo "Strict"
+ Especifica una ruta completa a traves de una internet. Exactamente por esa ruta debe pasar el datagrama.
+ Se compone de las direcciones IPv4, cada una correspondiente a un ruteador o al destino final.
+ Cada par de ruteadores a lo largo de la ruta debe estar conectado. (...) Si no se descarta.

### Tipo "Loose"
+ La ruta se debe respetar en orden, pero en el medio de cada salto pueden haber otros nodos.

## Internet Timestamp
Muy similar a record route, pero ademas guarda un timestamp en el que se guardo el registro (en hora local, por lo que puede llegar a no ser muy util).

# Encapsulamiento
## Principios de diseño de IP
+ La tecnología internet deberá soportar la mayor variedad posible de aplicaciones de red. Soportando asi datagramas muy chicos (por lo menos del tamaño del encabezado) o muy grandes (como maximo 64Kb).
+ La tecnología internet deberá soportar la mayor variedad posible de redes subyacentes. Diferentes tecnologías de capa 2. Diferentes MTU.

## MTU (Unidad Maxima de Transferencia)
Es la cantidad maxima de datos que puede transferir una trama, es el tamaño maximo de la carga util de una trama.

El problema es que cada protocolo de capa 2 define un MTU distinto.

Como se mencionaba, IP se tiene que adaptar a estas variaciones.

Puede suceder que el tamaño del datagrama es mayor a lo que puede entrar en una trama. Lo que se hace es dividir el datagrama (en realidad, la carga util) en partes para ajustarse a las caractersiticas de la red, y recien se junta todo en el destino.

## Campos extra del datagrama IP
La fragmentación es dificil, para ello hay un campo flags con tres bits y otro fragment offset, e identification.

### Flags

El campo flags tiene tres bits:
+ DF (Don't Fragment): Es una orden para no fragmentar. Si se requiere fragmentacion y este bit esta activo, el router descarta y genera un mensaje de error ICMP. Dato: Algunos sistemas operativos configuran por default el DF activo.
+ MR (More Fragments): Avisa que existen mas fragmentos despues de este. Si está en 0, es el ultimo fragmento.

### Identification

Como el identification de cada fragmento son el mismo, el destino puede entender que es un mismo datagrama, dividido en fragmentos.

### Offset
Sirve para indicar a que byte del datagrama original corresponde el byte 0 del fragmento actual. Más especificamente, indica el desplazamiento de los datos de este fragmento con respecto a los datos del datagrama original. Se expresa en grupos de 8 octetos (u 8 bytes).

Esto te restringe a que la divisiones se den en multiplos de 8 bytes, no podes hacer una division en el byte 14.

¿Pero por qué es esto? Porque puede surgir la necesidad de volver a fragmentar un fragmento. *(ver de diapo.)*

Si la opcion solo se utiliza en el destinatario final, va solo en el primer fragmento, los otros no las copian.

## Reensamblado
Si se pierde un fragmento, se descarta todo el datagrama y se genera un mensaje ICMP.

Cuando llega un dado fragmento, el host inicia un temporizador para esperar el resto de fragmentos. Si caduca y no llego todo, se genera un mensaje de error ICMP.

¿Como sabe que un datagrama NO es un fragmento? Si MF = 0 y Offset = 0.

Para el reensamblado tenemos la identificación, las flags y el offset.

(Ejemplo en diapo.)