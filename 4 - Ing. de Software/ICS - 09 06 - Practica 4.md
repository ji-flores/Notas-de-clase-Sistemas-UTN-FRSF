# Clase Practica 09/06: Git

Entrega TP: 29/09.

Diferencia de SGV y cualquier cosa para compartir archivos: Gestiona el cambio. Tenemos un control de los cambios, podemos "volver para atras"...

Un repositorio remoto no necesariamente debe ser el de GitHub, uno puede tener un servidor que sirva de repositorio remoto.

## Comandos notables

+ git clone: Clona un repositorio remoto (o en realidad, cualquier repositorio) , trae todo, el contenido y la "historia".

La rama main o master es la linea base.

+ git status: Ver el estado de todos los archivos.
+ git add <path_a_los_archivos>: Agregas los archivos como "listos para commit".
+ git commit -m <mensaje>.

+ git fetch: "Compara" el contenido de las BdD del remoto (u otro repo) y el local. Pero nada más.

+ git pull.

+ git revert: Revierte los cambios del commit que le marquemos, pero SOLO los de ese, no todos los posteriores. Se puede configurar para que revierta todos los posteriores.

+ git rebase: Hay muchas ramas que salen de una comun, alguien sube algo nuevo a la rama padre, y yo quiero incorporar esos cambios. Podría hacer un pull del padre y mergear con mi branch, pero la mejor opción es rebase: Cambia la historia, ahora ves que estan todos los commits del padre y DESPUES todos los commits tuyos, como si los volvieras a ejecutar (las fechas no las cambia igual).

Para marcar versiones estables del sistema, o etiquetar un commit por la razon que sea

+ git tag: Cuando haces el tag, guarda la "foto". No optimiza el storage como hace con los commits (guarda los deltas), guarda literal el codigo.

+ git cherrypick <commit>: Agarra un commit y se trae esos cambios y te los trae. El commit puede ser de otra rama. 

+ git fork: (Putualmente en GitHub)

## Archivos notables

+ pull_request_template.md: Obligar a quien genere pull request a que cumpla con cierta estructura.

## Pull request

Es una petición, le pedis a una branch "te podes traer mis cambios?".

Es una buena practica utilizarlos para merges.

Hace un fetch: Te muestra como esta ahora y como va a estar cuando haces el merge.

En GitHub podes hacer sugerencias en codigo. El originador del pull request puede incorporar el cambio automaticamente.

CI/CD: Continued integration/Continued deployment. Se integran con los pull request para hacer un pipeline de procesos antes. Ej.: Jenkins. Por ejemplo, antes de hacer el pull request se ejecutan los tests unitarios, checkeando si pasan, si se prueba cierto porcentaje de lineas...

## GitFlow

Hay varias maneras de trabajar con branches, muchas convenciones segun la organización. Hay una muy usada: GitFlow.

Es una propuesta nacida de un paper, con muchas implementaciones (formas de usarlo), cada organización/equipo lo incorpora como mejor le sirve. Nosotros vemos el GitFlow "puro".

### Ramas "estables"

+ main: La linea base. Codigo estable y que esta publicado
+ develop: Genera incrementos de desarrollo. Incremento el valor para luego pasarlo a linea base. Es estable

Nignuna se modifica directamente por cualquiera.

### Grupo 2

+ Propone ramas "feature". feature/*.
	+ Cuando queramos trabajar en una nueva funcionalidad, algo concreto, eso es un feature.
	+ Se mergean con develop para incrementar valor.
+ Ramas "fix".
+ Ramas "enhancement".

### Grupo 3

+ Ramas "hotfix": Hacer cambios que necesitan salir "ya". Estan sobre funcionalidades que ya estan en producción. Modifica la versión actual. Estas arreglando errores.
+ Ramas "release": Queres hacer una nueva version de linea base. Migra a una versión nueva.

### Uso

+ Desde main se crea develop.
+ Desde develop salen ramas feature
+ Para traer de feature/X a develop (_cuando la termianste_), hacer un pull request (o equivalente). Si se aprueba, matas feature/X, total en el merge se trae toda la historia.
+ En general, cuando se mergea (con el protocolo previo que corresponda), se elimina la branch.
+ Cuando queres llevar cambios de develop a main, osea, vas a crear una nueva version:
	+ Se crea desde develop una branch release, donde se corren los tests de integración.
+ Pones tags en las versiones de main.
+ Si sale un error en main, haces una rama hotfix/X, donde generas todos los cambios.
	+ Despues haces un pull request a main.
+ Ramas o commits "backport". Hiciste una release, descubriste errores (antes de salir a main), pero develop nunca se entero de cambios en release. Entonces haces un merge en develop.
