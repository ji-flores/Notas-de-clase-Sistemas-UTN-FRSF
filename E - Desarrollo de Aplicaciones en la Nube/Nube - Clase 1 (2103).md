## Información sobre la catedra

#### Integrantes de la catedra
+ Martin Dominguez: mdomingu@gmail.com / mdominguez@frsf.utn.edu.ar
+ Pablo Barragán
+ Federico Madoery
+ Leandro Amarillo

La materia se divide en tres partes:
+ Front-end.
+ Middle-ware.
+ Back-end.

Lo más importante es el TP.

Un parcial teorico, no muy complejo. Se plantean algunas preguntas de opcion multiple. Preguntas abiertas preguntando ventajas y desventajas de algo.

### Objetivo de la materia

Acortar la brecha entre las competencias reales y las que aporta la facultad, en materia de *desarrollo de software*.

Más especificamente, comprender los beneficios, pero también los desafios y los costos de la nube.

Las arquitecturas propuestas para la nube buscan resiliencia y robustez.

# Arquitecturas de software

FOMO = Fear Of Missing Out. Subirse a las tecnologias de moda de manera consciente y moderada (con un proyecto manejable), no subirse solo porque si.

## Definición

Citado de Martin Fowler (traducido):

> Muy similar a un arquitecto real. Plantear en lineas generales, como deben acomodorase los distintos componentes ("cuales son los mejores materiales", o en este caso, herramientas) para satisfacer la demanda puntual del cliente (y demandas futuras!, estar preparado para el cambio)

O, una segunda definición:

> Todas las desiciones de diseño que tenes que tomar antes de construir, o ponerte a gastar recursos.

La arquitectura debe estar vinculada a los negocios. Uno puede generar la mejor solución, pero alguien tiene que querer pagar lo que cuesta implementarlo.

La performance para las grandes empresas es fundamental, y esto se logra con arquitectura (Ej.: Netflix gasta muchisima plata en tener la arquitectura correcta para que su pantalla inicial cargue en 0.5s y *no más*)

Modificabilidad para requerimientos cambiantes, sobre todo por presion de la competencia. Ejemplo, los bancos ahora contra las billeteras virtuales (estas ultimas son ganancias sin el costo de tener una sucursal).

## Evolución de la arquitectura

Las empresas grandes que se mantienen en arqitecturas viejas lo hacen porque es el core del negocio, entonces es riesgoso, caro y complicada. Si los cambios no funcionan, jodiste el core...