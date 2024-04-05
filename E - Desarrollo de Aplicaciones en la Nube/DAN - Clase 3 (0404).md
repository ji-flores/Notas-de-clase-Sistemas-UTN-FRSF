# Arquitecturas
## Arquitectura de N capas
La arquitecutra por capas es una manera de separar responsabildidades y administrar dependencias. Cada capa tiene una responsabilidad respecifica.

Una capa superior puede utilizar servicios de una capa inferior, pero no viceversa.

En ingles se separa "layer", capas fisicas, de "tier", capas lógicas.

Web Tier es un equivalente a la capa de interfaz de usuario.

En el medio esta la WAV, que es un firewall o proxy. Un punto de control de acceso, determina los puertos a exponer (evitar exploits). Si el firewall esta en una red distinta a la capa Web, hay mucha latencia.

Cada una de las capas puede (y suele) estar en un equipo distinto.

## Arquitectura de N capas con maquinas virtuales

Introducir redundancia (muchas copias de la misma capa). Esto es complicado en la capa de datos (BDR no lo aceptan).

Entran en juego balanceadores de cargas, que balancean las peticiones entre las distintas copias de la capa más exterior.

Porque ser monolitico es una desventaja: Porque para cualquier cosa hay que levantar toda la aplicacion, ...

## Arquitectura basada en microservicios
Hoy la tecnologia permite que los procesos interactuen por medio de mensajes. Esto permite dividir la aplicación en varias aplicaciones mas pequeñas (dividiendo por servicio).

*(ver la diapo.)*

# Spring Boot
## Middleware

Los servicios de middleware son todos aquellos servicios que necesitamos de manera repetida para desarrollar software

(diapo.)

Cada una de estas tareas es tediosa de programar, podian solucionarse con librerias, que quiza dejan de actualizarse.

Ahi surge Sprint Boot.

## Spring Boot

**Spring Boot** es una libreria con muchos servicios, y podes configurar cuales queres.