# Seguridad (cont.)

...

# Vulnerabilidad, Amenaza, Incidente

...

# Ataques

## Pasivos
Intena averiguar o hacer uso de información del sistema, pero sin afectar los recursos del mismo. Ejemplo: Leer correos. Generalmente esa información que se recopila tiene como objetivo explotarla, hacer algo con esa información, pasando a ser un ataque activo.

Aun cuando un atacante no pueda comprender todo el mensaje (analisis de tráfico), puedo recopilar información sobre donde estan ciertos servidores.

## Activos

+ Modificación de mensaje: El atacante recibe la información que A intenta enviar a B y la suplanta por información nueva.
+ Enmascaramiento: Atacante D envia mensajes a A suplantando la identidad de B. Ej.: Ataque por repetición en e-commerce, captura mensajes que representan la compra de una notebook y los empieza a repetir, causando multiples compras del mismo producto.
+ Denegación de servicio: D intenta saturar los servicios ofrecidos por el servidor.
	+ SYN Flood: Inundas al servicio con la apertura de muchas conexiones, causando que no pueda responder a peticiones reales.
	+ DDoS: Denegación de servicio distribuida, se deniega el servicio de multiples servidores.
+ Ingeniería social: Se obtiene información directamente de un cliente genuino, y con esa información tener acceso al servidor. Ej: Por medio de manipulación, estafas, información hecha publica en Internet por los mismos usuarios.

Si bien la prolijidad y rigurosidad de los ingenieros al planear la seguridad del sistema, depende mucho también de la capacitación de la gente no especializada para no comprometer información.

## Criptografía

Permiten al emisor ocultar datos de forma tal de que, si un incluso accede al dato, no pueda comprenderlo inmediatamente. El receptor, por supuesto, debería poder decifrarlo.

En la antiguedad, se recaia en el desconocimiento del posible atacante del algoritmo de decifrado. Actualmente los algoritmos son conocidos por todos, y se depende de una clave de cifrado que solo conocen el emisor y receptor.

## Cifrado simetrico

Es un metodo criptografico en el cual la clave para cifrar y descifrar es la misma. Los algoritmos de cifrado directo son muy rapidos. Su debilidad es ¿Como se comparte esa clave?

### Cifrado en bloques
Divido el mensaje en N bytes y aplico el algoritmo de cifrado sobre ellos, usando una clave.

+ Electronic codebook (ECB): Los mensajes se dividen en bloques y cada uno de ellos es cifrado por separado utilizando la misma clave K. Debilidad (fatal): El mismo texto plano podría repetirse en muchos bloques y permite detectar patrones y sacar conclusiones. Por ej.: "HTTP/1.1".
+ Cipher Block Chaining (CBC): Con el objetivo de mitigar la debilidad de ECB. El emisor envía un vector de incialización, aleatorio, al receptor (no cifrado). Antes de realizar el cifrado por bloques, se realiza una operación bit por bit (reversible) usando el vector de inicialización, de esta manera se evita el reconocimeinto de patrones. En realidad primero hace la operación con el vector de inicialización, pero las subsiguientes veces lo haces con el ciphertext del bloque anterior.

### Cifrado de flujo
Ir cifrando practicamente byte a byte, muchas veces porque no dispongo del mensaje completo. Ej.: Envío de voz cifrada.

### Ataques al cifrado simetrico
+ Fuerza bruta: Se prueban todas las claves privadas posibles. Por eso se procura una buena longitud de las clases y cambiarlas periodicamente.
+ Criptoanálisis: Se explota conocimiento sobre el algoritmo de encriptación o patrones en el texto cifrado para reducir el espacio de claves posibles.

### Claves simetricas
Existen claves de sesión o claves permanentes.

La distribución de claves para dos partes A y B.

1. Podría 

...

### Servidor KDC

...

## Cifrado asimetrico

Se basan en problemas numericos muy complejos (ej.: RSA). Donde existen claves de encriptación y decriptación.

Los algoritmos son más lentos que los simetricos.

Se generan claves en pares, una publica, con la que cualquiera puede encriptar, pero solo la privada puede desencriptar.

En cifrado simetrico debo generar claves nuevas para cada canal de comunicación, acá no.

Debe ser imposible que conociendo la clave publica, o la clave publica y un texto cifrado, conocer la clave privada.

También puede usarse de la siguiente manera: Si encripto con clave privada, puede desencriptar con clave publica. No para lograr confidencialidad, pero de esta manera puedo lograr que "todos" sepan que el emisor soy yo (autenticar), porque dispongo de la clave privada. Por ejemplo: Firmas digitales.

## Integridad de mensajes y autenticación de puntos terminales

Asegurarse que el mensaje viene de donde dice venir, y que no haya sido modificado.

### HMAC

Función hash (de longitud fija N) que se usa en conjunto con un secreto.

_(completar)_

## Firma digital
Sirve para autenticación. Para implementarla con claves asimetricas, se pide la propiedad que fue mencionada antes.

Si a la vez de integridad queres confidencialidad, deberías ademas de encriptar con clave privada, encriptarlo con clave publica. Esto es muy costoso tanto para encriptar como para decript.

Entonces, para la implementación

(no entendí del todo, revisar)

Diferencia entre firma electronica y digital: Firma electronica solo dentro de cierto sistema, firma digital debe ser tramitada de manera legal por una persona real, no pertenece a cierto usuario.

## Gestión de clave publica
...

CA y RA muchas veces son la misma, pero vale hacer la distinción entre los conceptos. RA es la que va a realmente validar que seas vos quien pide la certificación.

Lista de certificados revocados, ya sea por vulneración de la PK o porque el certificado fue generado erroneamente (debía ser OV en vez de DV). Esto lo administra una autoridad de validación (que a veces es la misma que la CA).