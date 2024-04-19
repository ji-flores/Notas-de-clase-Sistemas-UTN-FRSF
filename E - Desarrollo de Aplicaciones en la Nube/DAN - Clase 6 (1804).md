# Inyección de dependencias

Hasta ahora, armamos una App Java con anotaciones, que permiten añadir capacidades (atender un request http, escuchar peticiones en un servidor, trasnformar formatos de salida de datos, ...).

Una de las cosas que se usan ahi es `@Autowired` que es posiblemente la principal. Esta anotación es para inyección de dependencias, que fue por mucho tiempo el nucleo de Spring Framework.

El fundamento teorico de la inyeccion de dependencias es un patron de diseño.

Nota: Modelos anemicos, modelos de clase donde las clases no tienen estado. Sucede en arquitecturas orientadas a servicios. Ejemplo: Rest Controller.

## Spring Core

Inversión de Control, busca flexibilizar lo más posible las dependencias.

¿Que es una dependencia? 