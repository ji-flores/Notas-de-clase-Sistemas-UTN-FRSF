# Transacción, Bloqueos

**Debe leerse a la par de la diapositiva de campus**

Bases de datos relacionales también son llamadas transaccionales.

Los sistemas de BDD pueden ser monousuario o multiusuario.

Hay una posibilidad de que dos usuarios accedan al mismo dato al mismo tiempo. La BDD debe estar preparada para esto.

Transacción: Unidad lógica de trabajo que puede tener operaciones de lectura, escritura, modificación, borrado. Estas ultimas tres son las que pueden generar problemas.

Propiedades de una transacción: **ACID**

- **A**tomic: Hace todo lo que tiene que hacer, o no hace nada.
- **C**onsistent: La transacción tiene que pasar de un estado consistente a otro.
- **I**solated: Transacciones aisladas unas de otras, aún si se ejecutan concurrentemente. Una transacción no puede ver los cambios que otra transacción realiza hasta que la primera se cumpla (se haga el commit).
- **D**urability: Todos los cambios de una transacción que se completó sobreviven en el tiempo.

![Untitled](Transaccio%CC%81n,%20Bloqueos%20db2d0eeed344407e85af23ce80692a11/Untitled.png)

*Faltan los pasos fisicos que cada accion necesita.*

Cuando se “borra” una tupla, generalmente lo que significa es que se *marca como eliminada.*

---

Acá falta…

---

Si una transacción que tuvo un efecto indeseado es cometida (commit), la unica forma de deshacerla es con otra transacción.

Si todavía no fue cometida:

- Reiniciarla: Si aborto por fallas de hardware.
- Eliminarla: Si existe un error de lógica o una mala entrada porque no se pudo encontrar un dato.

Es una situación en la cual dos o más transacciones están en un simultáneo estado de espera cada uno esperando que el otro libere el bloqueo para poder proceder.

Si bien los bloqueos mortales pueden darse entre tres o mas transacciones, experiencias realizadas demostraron que en general no ocurren mas que entre dos transacciones.

Si un deadlock ocurre es importante que el sistema lo detecte, cuando lo detecta, elige una transacción a la que le libera los bloqueos, y hace que la otra proceda. Generalmente se aborta la más reciente y procede la más antigua. En algunos sistemas la transacción víctima (la abortada) es ejecutada nuevamente automáticamente. Otros sistemas dejan que el programador de aplicaciones haga la corrección.

La BDD tiene una bitacora: Información redundante sobre los cambios que se realizaron.