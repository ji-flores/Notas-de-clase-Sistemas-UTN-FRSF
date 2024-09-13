# GCS (Clase 3)

## Construcción del Sistema

El proceso de crear un *sistema ejecutable completo*, mediante la compilación y vinculación de los componentes del software, librerías externas, archivos de configuración, etc.

Sistema ejecutable completo: Todo lo necesario para que el sistema funcione.

+ Todos los componentes de un sistema se incluyen en las instrucciones de la construcción?
+ Se incluye la versión apropiada de cada componente?
+ Estan disponibles todos los archivos de datos requeridos?
+ Son consistentes los nombres lógicos con los físicos?
+ Estan disponibles las *versiones adecuadas* del compilador y otras herramientas requeridas?

Hay que ser especifico con las versiones especificas de las versiones que se van a utilizar.

La mayoria de archivos de configuración estan ocultos, y para eso empiezan en ".".

Archivos `.env`.

## Gestion de Entregas

*¿Que le doy a mi cliente?*

Una entrega o release

+ Una version que se distribuye a los clientes.
+ Cada entrega incluye nueva funcionalidad o está concebida para diferentes plataformas de software/hardware.
+ Siempre existen más versiones de un sistema que las entregas.

¿Cuando liberar versiones nuevas?

### Factores que influyen en la planeación de release.

+ Se reportan fallas graves en la aplicación.
+ Cambia la plataforma donde se ejecuta la aplicación.
+ ...

---

La gestión de la entrega incluye:

+ Decidir cuando se entrega el sistema,
+ Gestionar arl:
  + Proceso de creación de las entregas,
  + De los medios de distribución,
  + Documentación
+ Asegurar que se puedan recuperar de la misma forma en que se distribuyeron, en caso necesario.

## Repositorio (BD de configuraciones)

Almacenamiento de versiones

(...)

