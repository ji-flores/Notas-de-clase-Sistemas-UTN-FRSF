# Clase 4

Muchas veces se ve el codigo como ultima etapa. Aunque no pienses que nadie más va a tener que revisar tu codigo, terminas muchas veces vos mismo retomando el codigo y no entiendo como funciona.

Registro de lo que se hace, por qué se hace.

## Gestión de la Configuración

La cantidad de elemtnos (una jerarquia de elementos) que se manejan crecen rapidamente a medida avanza el proceso. El problema de toda esta estructura es el cambio.

¿Como gestionar el impacto de estos cambios?

No hay una razon y tiempo concreto de los cambios. Algunas comunes pueden ser:

+ Nuevas condiciones de negocio.
+ Nuevas necesidades del cliente.
+ Reorganización, crecimiento o reducción del negocio.
+ Restricciones presupuestarias o de calendario. Una de las primeras cosas que se comprometen ante esto es la calidad.

De alguna manera, queremos sistematizar el control de cambios, como manejar y controlar el impacto de estos. Se busca integridad y rastreabilidad.

Gestionar la evolución de los productos tanto desde etapas tempranas como durante el mantenimiento.

Def.: Los elementos que componen toda la **información producida** como parte del proceso de ingeniería del SW se denominan colectivamente Configuración del Software.

Información producida: Programas de computadora, documentos que describen estos programas (tecnicos y del usuario) y los datos (tanto contenidos en el programa como externos a él).

### ¿Por qué GCSW?

+ Software moderno crecientemente complejo.
+ Aplicaciones enormes y heterogeneas.
+ Muchos equipos de trabajo trabajando concurrentemente.
+ Aplicaciones con ciclos de vida muy largos. Igual a muchos cambios.
+ La misma aplicación nucleo satisface multiples objetivos.
...

## GCSW: Identificación

¿Que elementos tengo que controlar? En principio, todos los artefactos que son necesarios para el futuro mantenimiento del sistema.

+ Dos tipos de objetos: Basicos y agregados.

Basicos son unidades de información