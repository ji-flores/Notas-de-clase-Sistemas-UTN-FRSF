# Gestion de la configuración del SW (cont.)

## Gestión de versiones

**Def.:** Proceso de **mantener registro** de las diversas **versiones** de los componentes de SW, o items de configuración y del **sistema** en las cuales estos componentes son utilizados.

Procedimientos para asegurar las diversas versiones de un sistema que se puedan recuperar cuando se requiera y que no se cambie en forma accidental.

¿Que pasa si tengo un error? Tengo que tener mecanismos para volver a un estado consistente. Entonces, debo tener un mecanismo para registrar estos estados consistentes.

**Linea base:** Algo que esta acordado y probado...

**Versión:** Forma particular que adopta un elemento en un instante dado.

**Versión de sistema:** Es una instancia d eun sistema que difiere de alguna manera de otras. Diferentes funcionalidades, mejor rendimiento, bug fixing...

**Variantes:** Comportamiento o caracteristicas de una versión en un contexto diferente. Ej.: Una version de un sistema para un OS diferente. Representa una evolución *espacial* a diferencia de *temporal*. Generalmente no evolucionan en el tiempo de manera *separada*.

**Code line:** Una secuencia de versiones de un codigo fuente con versiones posteriores derivadas de versiones anteriores. Aplica normalmente a "componentes de un sistema", aunque pueden existir por cada uno de los programas.

**Linea base:** Es una definición de un sistema especifico, incluye versiones de los componentes *más* las librerias utilizadas, componentes externas, archivos de configuración...

Mainline: Historia de las baselines del sistema, secuencia de versiones de sistema desarrolladas desde una linea base original.

---

Para especificar una version particular de un sistema se tiene que especificar las versiones de cada uno de los componentens que debe incluir. Debe tenerse una nomenclatura de versiones adecuada, no ambigua. Recordar que uno debe poder nombrar los cambios de una versión a otra.

### Versionado semantico

Se encuentra en la version 2.0.0

X.Y.Z

X: Major changes, Y: Minor changes, Z: Patch.

+ La version 0.Y.Z es desarrollo inicial. De manera que 1.0.0 es la primera versión publica/liberada.

Mientras X = 0 se maneja el versionado de cualquier manera, es para el equipo de desarrollo.

+ Patch: Debe incrementarse Z cuando se aplica una corrección al SW y a su vez sufre pocos o ningun cambio. **Compatible** con la versión anterior.
  + Compatible con la versión anterior: Las cosas que estes trabajando con una versión, siguen funcionando en la siguiente si el cambio es patch.
+ Minor: Debe ser incrementada si se introduce nueva funcionalidad compatible con la versión anterior, el software sufre pequeños cambios y/o correcciones de errores (una revisión menor). La versión patch debe ser reseteada a 0 cuando la versión minor se incrementar.
+ Major: Debe ser incrementada si se introduce cualquier cambio no compatible con la versión anterior. El software sufre grandes cambios y mejoras. Las versiones patch y minor deben ser reseteadas cuando se incrementa la versión major.

Pre-release: Puede ser representada adjuntando un guión y una serie de indentificadores separadso por puntos inmediatamente despues de la versión patch.

Identificadores prerelease:

+ Pre-alpha: 
+ Alpha: Versión completa pero inestable.
+ Beta: Representa generalemente la primera version completa de un porgrama. Inestable pero util para que sea considerada una versión preliminar. Beta testing.
+ RC (Release candidate): Candidata a definitiva, comprende un prod. preparado para publicarse a menos que aparezcan errores. Todavía pueden aplicarse tests.

### Identificacion basada en atributos

Ej. Ubuntu

Esquema de numeración de la versiones de Ubuntu está basado en la fecha de lanzamiento de la distribución. El número de versión proviene del año y el mes de lanzamiento, en lugar de reflejar la versión del SW.

+ Ubuntu 19.04 (19/04) LTS. Traen nombres en clave como Xenial Xerus.
  + LTS: Long term support

### Buenas practicas

Definir:

+ Esquema de nombre de versiones.
+ Esquema de numeración de veriones.
+ Plan de liberación de versiones.
  + Ej: Ubuntu sabe que libera siempre en abril, pero no saben exactamente que es lo que van a liberar.

## Herramientas

...

## Linea base

### Grafo de evolución

Las versiones van creciendo en una linea evolutiva, linea principal de evolución (trunk/master/main). La diferencia entre dos versiones se denomina Delta.

Como distinguir una variante de cualquier otra branch? Por el versionado. Se deben poder distiguir por el nombre.

#### Tags

Buenas practicas:

+ Sea descriptivo: Usar nombres claros y descriptivos que hagan faciles de identificar su proposito.
+ Siga una convención de nombres. Ejemplo: Versionado semántico.
+ Usar "tags anotados".
+ Etiquetar estrategicamente: Etiquetar puntos significantes en la historía del proceso.
+ Mantener los tags sincronizados. En el repositorio remoto.

#### Commits

Mnesajes de commit deberían explicar la razón de los cambios en vez de lso cambios concretos. El codigo fuente en el historial va a decir el qué

+ Titulo: Breve.
+ Linea en blanco.
+ Cuerpo: Explicacion que aporta contexto.
+ Linea en blanco.
+ Pie: Opcionalmente incluir los casos que se resuelven.

