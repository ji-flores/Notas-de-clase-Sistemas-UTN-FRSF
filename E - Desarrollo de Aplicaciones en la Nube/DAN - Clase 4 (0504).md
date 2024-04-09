# Spring Boot

Para que tener las funcionalidades que uno desea en Spring Framework, se requiere de bastante tiempo de configuración. Por ello, Spring también ofrece Spring Boot, que tiene como objetivo reducir el tiempo de configuración y sacar una aplicación andando más rapido.

Una aplicación no necesita todos los servicios que tiene Spring (que son muchisimas). Por lo que Spring Boot mantiene las dependencias "de inicio" a un minimo.

Se configura casi todo con anotaciones. Solo Maven, con `pom.xml`.

Hoy en día Spring Boot permite trabajar no solo con Java, sino con Kotlin y Groovy (aunque el 80% estan en Java)

Como ya fue mencionado, la principal ventaja de SB es que el start-up de un proyecto es muy rapido.

## Comenzar un proyecto Spring Boot

Entrar en [Spring Boot Initializr Web](https://start.spring.io/), que permite configurar rapidamente las caracteristicas principales de nuestro proyecto y obtener una primera versión funcional (se le llama *smoke test*).

La idea es bajar el tiempo de arranque del proceso, asi como los recursos.

## Autoconfiguración

Spring sabe que dependencias cargar porque estan en el pom.xml de Maven.

## Tomcat

Un servidor web, como todo servidor, recibe peticiones http (en texto plano) y da respuestas.

Por ejemplo, `get usuario <JSON con información sobre usuario>`.

## Arquitectura de un proyecto Spring
*(Mirar diapositiva)*.

En resumen:

+ **Controladores**: Atienden las request. Hacen chequeos, justamente control, sobre lo que entra de la UI.
+ **Servicio**: Ejecuta la logica de la aplicacion.
+ **Repositorio**: Interactuar con la base de datos.

Y todas las capas de aplicación trabajan con elementos del **Dominio**.

*Harán falta los DTO?*

# Servicio web REST

Antes era muy complejo que dos aplicaciones dialogen atraves de la red. Lo que se hacia era generar protocolos sobre protocolos.

REST le da una interpretacion a los headers del protocolo HTTP, si le decis que queres recibir los datos en JSON, los genera en JSON...

Las siglas **RE**presentational **S**tate **T**ransfer. Es la transferencia del estado de un objeto, y este estado puede tener diferentes representaciones.

Ej.: "Proceso A le hace una llamada http a proceso B, remoto, para que retorne el estado de un objeto en la representación que solicito".

En REST, el estado lo guarda el cliente y no el servidor. Esto es una ventaja porque el servidor, para cada petición, debería estar gastando recursos en guardar la información.

Rest esta basado en el protocolo HTTP

Diferencia entre POST y PUT, POST es para creación de elementos, PUT para modificación de elementos.