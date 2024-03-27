Entrega de paquetes IPv4
===

**¿Como se envian los datos?** Cada entidad se comunica con su entidad par, aunque lo que realmente existe es que en el emisor baja por la pila y luego en el receptor sube por la pila hasta la capa par.

# Formato de un datagrama
_**Datagrama**: Nombre especial que IPv4 le da a los paquetes_

### Encabezado IP
Indica la versión de IP que se esta utilizando.

### Header length
Al encabezado se le pueden agregar algunos campos opcionales, entonces este campo permite saber cual es la longitud del encabezado para poder procesarlo correctamente.

Este tamaño de encabezado esta expresado en cantidad de palabras de 32 bits (4 bytes).

### Total length
Tamaño total (incluyendo encabezado y datos) del datagrama, medido (ahora si) en bytes (8 bits). Este campo tiene 16bits.

### Header checksum

Integridad del encabezado. No se checkean los datos ya que esto se considera problemas de las capas superiores, ademas cuando se recibe el paquete, este estuvo contenido en una trama que hizo ya un checkeo de errores sobre todo el payload.

### Direcciones IP
Direcciones IP del source y de destination, 32 bits cada una. No incluye las mascaras. Información sobre las mascaras la tiene el host que posee la IP.

# Enviar un datagrama IP

Si A es un host que quiere enviar un datagrama a otro host B. Casos:
+ A y B estan en la misma red: Se le llama **entrega directa**, no se necesita acudir a un nodo de capa 3 para ayudarlo a hacer esa entrega.
+ A y B estan en distintas redes: Se le llama **entrega indirecta**, se necesita un colaborador (nodo de capa 3, router).

## Entrega directa

**Def.:** Transmisión de un datagrama desde un dispositivo directamente a otro a través de una unica red subyacente.

*Es la base sobre la que descansa toda la comunicación internet.*

Recordando, si dos dispositivos tienen la misma net-id, son adyacentes. Entonces, solo pueden participar en entrega directa si tienen la misma net-id. Solo podemos saber si tienen la misma net-id usando la mascara de red.

**¿Que conoce el host de origen?**
+ Su MAC address.
+ Su IP (dirección de IP de origen).
+ Su mascara de red y,
+ La dirección de IP de destino.

*Pero no la mascara del destino*.

Ahora, al host le interesa saber *si el destino esta en su red*, **no** en qué red está. Si está, puedo hacer entrega directa, si no, veremos.

Con mi IP y mi mascara, puedo saber mi dirección de red. Si el destinatario esta en mi red, si yo calculo su dirección de red con _mi mascara_, su dirección de red es la misma.

Si se determina que se puede realizar entrega directa, basta con pedirle servicios a capa 2 para realice el envío. **Problema**: ¿Que MAC corresponde a la IP del destino? Porque alguna MAC tengo que poner como dirección de destino en la trama, los protocolos de capa 2 no entienden direcciones IP...

Esto lo resuelve el protocolo auxiliar **ARP**.

### Address Resolution Protocol (ARP)

¿De que capa es ARP? Esta en "la parte inferior" de capa 3 (porque usa los servicios de la capa de Enlace). Pero no es como la subcapa MAC, que interviene siempre, es auxiliar.

*Si una red de capa 2 es punto a punto, no necesito una MAC address, porque todo lo que envío esta destinado a al mismo dispositivo.*

ARP lleva una tabla que relaciona una IP con una MAC. Esta asociación es dinámica (por ejemplo, hoy conecto una PC con una MAC, y le pongo la misma IP que tenía mi otra PC ayer, que tiene otra MAC), entonces ARP conserva la tabla solo por un tiempo.

Accionamiento de ARP.

(Insertar imagen ppt.)

ARP para hacer la petición pide servicios a la capa 2. Esta petición se debe mandar como broadcast (si supiera a quien le tengo que mandar esta petición, directamente sabria la MAC del destinatario).

**ARP solo guarda información sobre dispositivos en su misma red**. ¿Para que quiere saber A la MAC de un dispositivo fuera de su red? Si le envia una trama, esta por si misma nunca le va a llegar (puede que el mensaje le llegue, pero como parte de _otra_ trama).

Una trama ARP tiene la siguiente estructura:

(Insertar imagen ppt.)

Todos los dispositivos que reciben una petición ARP se preguntan ¿Esta es mi dirección IP? El unico que responde es el que efectivamente tiene esa dirección, y le responde unicamente al sender, y responde con su dirección MAC (no vuelve a hacer broadcast).

#### Cache ARP

+ Si la dirección MAC que tengo en la tabla esta desactualizada (todavía no se reseteo la tabla), la entrega falla, lo envío y no le llega a nadie o bien le llega a alguien que no es el destinatario.
+ En realidad la tabla no se resetea entera, cuando se inserta una fila a la tabla se empieza un temporizador, y cuando termina, esa fila en particular se borra.
+ Hay un temporizador de revalidación temprana (más corto). Cuando termina este temporizador, pregunta ¿He usado esta fila hace poco? Si es así, se envía otra solicitud antes. Cuando vuelve la dirección MAC, que puede ser igual u otra, se actualiza la información y se reinician los temporizadores. Lo importante es que mientras tanto puedo seguir enviando datagramas a la MAC que yo conozco (no existe una pausa desde que envío otra solicitud hasta que me llega la respuesta y cargo la fila, durante la cual no puedo hacer envios a mi destinatario)

#### Refinamientos ARP
+ ¿Por qué necesito la IP del sender, si ya sabes su MAC y nos estamos moviendo en capa 2?
    + Como generalmente la comunicación es bidireccional, aprovechamos la solicitud que hizo A, para que B también aprenda la relación entre la IP de A y la MAC de A para en un futuro también poder enviarle datagramas sin tener que hacer una solicitud.
    + No solo eso, sino que todos los que reciban la solicitud ARP, y no este dirigida a ellos, pero si tengan cargada la IP del sender en su caché ARP, van a actualizar la MAC correspondiente a esa IP. Si no tienen la IP cargada en la tabla, no la agregan. Solo actualizan.
+ *(más en diapo)*

#### Solicitud ARP Gratuito (Sonda ARP)

Cuando configuro una IP (o cuando inicializa un dispositivo), envío una solicitud ARP poniendo como destino su propia IP.

Si le contestan, la IP esta **duplicada**.

Se envían tres sondas, y si nadie responde se reclama oficialmente la dirección IP con un:

#### ARP Gratuito (Respuesta ARP Gratuita)

Aunque nadie me haya preguntado, yo hago una respuesta ARP para difundir mi IP con mi MAC address. Se envía como una difusión y permite que el nodo anuncie o actualice su asignación IP a toda la red. *Notar que los unicos que actualizan esta información sobre el emisor son los que ya tenían su IP en la caché.*

*Un ARP Gratuito no es causado solo por una sonda ARP previa...*

## Entrega indirecta
Lo primero que hace el origen cuando se da cuenta que su destinatario no esta en su red es determinar cual va a ser su intermediario para encaminar este datagrama. Por supuesto, este intermediario (router, se le llama **proximo salto**) si debe estar en su red (por ende funcionando la entrega directa).

En realidad, determina que la interfaz del router _que pertenece a la red_, hará de intermediario.

`¿Si hay más de un router en la red?` También, uno ya conoce la dirección del router que quiere usar, ya la tiene configurada (Windows por ejemplo, por cada dispositivo de red la tiene configurada como puerta de enlace predeterminada). Windows al menos también lo puede hacer de manera automatica (Opción "Elegir mi IP automaticamente"). En el caso no de hosts, sino de routers, es la cuestión de elegir routeo estatico o dinámico.

¿Se cambia el destinatario del datagrama a la IP de (la interfaz de) el router? **No**, la dirección de destino nunca cambia. _Con la excepción de NAT._

El origen A sigue necesitando de los servicios de capa 2 para comunicarse con el intermediario, mediante una entrega directa. Para esta entrega directa vale todo lo dicho, se debe "hacer un ARP" para saber la MAC adress de la interfaz del router, con todo lo que esto implica.

Una vez el router recibe el datagrama, repite el mismo proceso: Para cada interfaz, se fija si esta en la misma red.
+ Si está, el mismo proceso de entrega directa.
+ `Si no, asumo que proceso de reenvío...`