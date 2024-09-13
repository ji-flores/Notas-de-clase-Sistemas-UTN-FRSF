# Practica 13/09

## SemVer

Todo commit (en main) genera una versión. Algunas son estables y productivas; a esas las tageamos.

Cuando se entra en una nueva versión MAJOR? Cuando los cambios hacen que se pierda compatibilidad entre versiones. O cambio de arquitectura, lenguaje, base de datos...

En teoría...

+ Los releases significan un cambio en MAJOR o en MINOR.
+ Los hotfix significan cambios en PATCH.

En la practica cada equipo y cada organización, con su proceso de entregas, puede hacer cambios a esto.

¿Cuando genero un hotfix? Cuando mi SW habilita que mi cambio no tenga que pasar por el proceso "normal" de cambio. Por ej.: Errores criticos (un ejemplo, ponele que no tenes el boton para enviar en WhatsApp), vulnerabilidades de seguridad.

## Problemas con GitFlow

¿Qué pasa si saco una nueva versión y tengo clientes que pueden usarla y clientes que no pueden migrar en este momento? No puedo forzar a todo el mundo a migrar de versión...

Debo poder mantener dos versiones. Ahora nuestro codigo tiene dos líneas bases. Es algo muy común en librerías.

La versión vieja debe seguri teniendo mantenimiento para los errores, hasta que decida no darle más soporte.

GitFlow "puro" no plantea una solución para esto. Debemos explorar alternativas, aunque estas no son tan "estandar" o conocidas como GitFlow.

Existen otras, pero nuestra alternativa va a introducir más ramas. Un "main" por cada versión MAJOR. En la main "verdadera" va la ultima MAJOR.

Develop? Algunos hacen una develop por cada una de estas nuevas ramas, otros no.
