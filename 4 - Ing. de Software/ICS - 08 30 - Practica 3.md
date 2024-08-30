# Sistemas de Gestión de la Configuración (SGC)

¿Que buscamos en un SGC? Todos los cambios que se realicen sobre nuestros activos de SW (codigo fuente, documentación, recursos binarios, archivos de configuración, diseño de base de datos...)

Un sistema de gestión de configuración define:

+ Procesos para versionar.
+ Herramientas para no tener que hacer eso a mano. (Git es una, GitHub es otra).
+ Metodologías.

Estandares de gestión de la configuración: GitFlow.

## Elementos de un SCV

+ Archivos.
+ Historial: Los guarda de manera eficiente, no hace copias cada vez que hay un cambio.
+ Interfaz: Por la cual los clientes acceden.
+ Configuración.

## Clasificación deSCVs

Un SCV permite a muchas personas trabajar de manera paralela sobre un item. Cada uno se descarga una copia local...

### SCV Centralizado

Cada uno *solo* se descarga una copia de los archivos. Si el repositorio deja de existir, se perdio la historia de los archivos. Solo queda lo que se descargó cada uno.

+ Esa descarga de archivos se llama **checkout**.
+ La subida de archivos se llama **commit**. "Comprometer", si lo subis es porque te comprometes a que esté bien y probado.
+ Cuando queres guardar algo, tenes que volverte a conectar. Esto significa, si no hay conexión, no podes hacer versionado ni saber todo lo otros estan haciendo.
+ El versionado es lo que esta centralizado.
+ Baja tasa de conflicto (dos personas trabajando sobre la misma cosa).
+ Ej.: SVN, CVS, SourceSafe.

### SCV Descentralizado

Descargas archivos e historial.

+ Podes localmente ir a una version anterior, ir a otra branch, crear una nueva versión...
+ Cuando queres sincronizarte con el resto, subis archivos e historial.
+ Checkout: De tu mismo repositorio local, copias un archivo.
+ Commit: Creas una versión nueva en base a tus archivos locales.
+ Push: Llevas tus archivos e historial local y lo sincronizas con el resto.
+ Pull: Descarga de archivos e historial.
+ Clone: Primer pull que haces.

¿Hacer muchos o pocos commit?

Pocos commit: Perdes tracking de las cosas que hiciste.
Muchos commit: Es muy dificil de gestionar. Ademas, en alguno de los commits seguro hay errores.
