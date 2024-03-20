# Direccionamiento IPv4: Más conceptos

## Problemas de la dirección MAC

**¿Por que necesitamos una dirección IP? ¿No podemos usar la dirección MAC para todo?**

La longitud de la dirección MAC (48 bits) es más larga que la IP (32 bits), entonces, la longitud no es el problema...

Esta es la identificación que usa Ethernet, que es la tecnología de capa 2 más popular, **pero no es la única**. Cuando se desarrollo IPv4, esto no era así (TokenRing también era popular). Necesito una capa superior que unifique todas estas tecnologías. El modelo de capas (TCP/IP o hibrido) es como un reloj de arena en el sentido de la cantidad de tecnologías (capas 1 y 2 existen muchisimas tecnologías que coexisten, en capa 3 el unico protocolo es IP, y capa 5/7 también hay mucha variedad).

Es más, aunque todos los dispositivos del mundo fueran Ethernet, MAC es una dirección plana. Deberias tener una lista con todos los dispositivos del mundo para saber como llegar a cada uno de ellos. IP resuelve la identificación de los dispositivos, **y como llegar a ellos**, porque son jerarquicas (como la direcciones de correo, primero tenes una ciudad, y luego una dirección dentro de esa ciudad), poseen un net-id (analogo a la *ciudad*) y un host-id (analogo al *domicilio*).

## Más sobre el direccionamiento classful

+ Direccionamiento estatico con clases genera un mal aprovechamiento de las direcciones. Si yo quiero una red para mi casa (o en general uso domestico), hay muchas direcciones que se desperdician (la red más chica es de 256). Y hacia el otro lado, tampoco es muy posible una red con \~16 millones de dispositivos adyacentes.
+ IPv6 no solo aumenta la cantidad de direcciones, sino una cantidad gigante de caractersiticas nuevas (por ej.: Seguridad). Es protocolo pensado desde 0.

## Direcciones IP privadas
La cantidad de dispositivos conectados a la red de redes viene creciendo exponencialmente desde los 90s, y todos tienen una IP. Aunque ahora tenemos direcciones flexibles.

Se predefine un conjunto de direcciones IP validas para usarse de forma privada, y no son validas para usarse en Internet.

El router que "nos saca" a la red ("router de borde") implementa NAT (que no se da en la catedra, pero hay que saberlo). Este router lo brinda el proveedor de internet, y si tiene una IP valida en internet. Este router toma nota de quien manda el paquete a Internet (dirección privada), y antes de enviar el paquete a red, reemplaza esta direcc. de origen por la dirección de su interfaz conectada a la red, la dirección publica. Cuando llega a una respuesta (que esta dirigida a la dirección publica), este router sabe a quien dar esta respuesta.

Al final, esto permite un ahorro enorme de direcciones de IP. Y ademas, las direcciones reservadas para ser privadas pueden repetirse.

Como todo lo que escasea, tener una IP publica es caro. El proveedor te puede cobrar mas por tener una IP publica para vos solo, que ademas puede que no sea unica(*), si queres una unica es más plata todavía.

*(\*) Si un proveedor tiene 100 clientes, pero en todo momento solo 95 estan en uso. Entonces el proveedor puede tener 95 direcciones e ir rotandolas entre sus clientes.*

Incluso, ningun cliente puede tener una IP publica, el proveedor puede tener un unico acceso a Internet, y que todos los clientes accedan por medio de ese punto, usando direcciones privadas. El problema de hacer NAT repetidamente es la trazabilidad. Si yo tengo una IP publica, todo el mundo puede conectarse conmigo.

Algo parecido puede hacerse con el protocolo Proxy (que si se da en la catedra, y es más amplio que NAT).

