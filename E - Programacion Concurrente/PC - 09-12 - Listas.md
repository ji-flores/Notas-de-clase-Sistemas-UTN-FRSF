# Listas

## Introducción

EL objetivo de los Monitores -> Manejar concurrencia eficientemente cuando la contención es alta.

Contención: Mucha cantidad de procesos intentando acceder a un recurso a la vez.

Buscamos estructuras de datos concurrentes.

Primera idea, sincronizar la manipulación de la lista con un monitor. Esto una sincronización de granularidad gruesa.

Sincronización detallada o fina -> Sincronizar el acceso a cada nodo de esa estructura. Cada nodo tiene un lock.

Sincronización optimista -> Reducir el costo del bloqueo que conlleva la granularidad fina. Encontremos la forma de no tener que bloquear todos los nodos.

Sincronización "lazy" -> Demora algunas tareas como eliminar un nodo. Ej.: Lo marca como eliminado y luego lo elimina.

Incluso puede lograrse sincronización sin locks.

## Conjuntos (Sets) e Implementación

Operaciones de un Set.

Podemos implementarlos como listas enlazadas. La lista se encuentra ordenada por una clave única asociada a cada elemento (hash-code).

Por comodidad se tienen dos nodos centinelas, que no contienen elementos y marca el inicio y el fin de la lista.

Son nodos especiales. No se agregan ni se quitan, aparecen en el momento de construir el objeto.

Sus claves son el menor y el mayor valor posible (en este caso, de Integer), respectivamente.

## Sincronización de granularidad gruesa

Un lock para toda la estructura. Es simple y correcto, pero no funciona bien para contención.