"Gastar más tarde y ganar antes". Intereses. ¿Si me tengo que comprar algo en 3 meses, cuanta plata necesito ahora? ¿Esta plata hoy vale igual, menos o más?

Valor hoy = **Valor actual neto**.

# Valor Actual Neto

$$
\text{VAN} = -\text{Io} + \sum_{j=1}^n\frac{\text{FN}_j}{(1+i)^j}
$$

Si el flujo de caja es positivo un mes, gano plata. Aunque, que sea positivo no significa que sea rentable (ese flujo puede ser muy chico, y no te alcanza).

# Problemas que enfrentamos al liderar un proyecto
+ Opción de cambiar: Cambiar el punto de vista es dificil, salir de tu zona de confort siempre es dificil. Muchos proyectos/empresas se caen por la "Teoría de la inversión previa": Un empresario puede tener pudor a abandonar un proyecto donde ya puso mucha plata. En lugar de "pasar a perdida" algo y cambiar, se aferran.
+ Opción de abandonar.
+ Opción de aplazar.
+ Opción de crecer: Agregar un socio, vender acciones. Es muy dificil de empresar porque implica dejar algo propio en manos de otros.

¿Por que no se cambia? Porque en metodos clasicos, el costo del cambio va a aumentando a medida avanza el proyecto. Mientras más avanza el proyecto, más gente está involucrada...

En lugar de eso, en todos los metodos agiles, hay otra manera de ver el costo del cambio.

# XP (Xtreme Programming)

## El costo del cambio en XP
**El cambio es la escencia del negocio.** Los costos no crecen porque estamos haciendo siempre lo mismo (una vuelta de espiral, con analisis, diseño, implementación, prueba). Y si cobras cuando ellos cobran, menor es la resistencia, porque ya sos parte de su estructura de costos (psicologicamente es como que no pagan nada).

## Metafora de conducir para proyectos XP
+ Espejo retrovisor: No olvidar de donde se viene. Quien trabajó bien, quien trabajó mal.
+ Manejar despacio: Tratar a un equipo despacio. No dar ordenes, manipular. Tener en cuenta los sesgos, los premios.

## Variables de un proyecto

+ Tiempo.
+ Costo.
+ Ámbito: El tamaño, scope del proyecto.
+ Calidad: Es lo unico que no se sacrifica. En realidad, es una constante. El boca a boca sirve, el prestigio es importante. En todo caso perder plata, pero trabajar bien.

## Principios fundamentales de XP

+ Realimentación rapida: Fundamentalmente, las malas noticias debejn viajar rapido. Trabajar con el cliente in situ de ser posible, aunque sea de manera virutal.
+ Asumir la sencillez: De vuelta, maximizar la cantidad de trabajo no realizado. Todo lo que hicimos es util, porque si no haces nada no llegas a ningun lado.
+ Cambio incremental.
+ Acpetar el cambio: Si el cliente dice que hay que cambiar algo, no tomarlo personal. Total, te van a pagar.
+ Trabajar con calidad: No trabajar cansado.

### Otros principios
+ Pequeñas inversiones iniciales.
+ "Jugar a ganas": Mindset correcto para el proyecto. Estar convencido en el proyecto.
+ Experimentos concretos: No discutir ni ir a los libros, ir a la practica. Si no sabes si Postgre o MySQL es más rapido, agarras una version de cada uno y experimentas.
+ Comunicación abierta y honesta: La comunicacion cara a cara es dificil de ser honesta, pero hay que hacer lo posible. No insultar, ser duros con el problema y blandos con las personas.
+ Las personas son más importantes: Festejar los exitos, acpetar que alguien tiene problemas más importantes que el trabajo.
+ Acpetar la responsabilidad: EL jefe no da ordenes. Simplmenete existe un conjunto de tareas y cada uno _debe_ adoptar alguna, y tener en cuenta en que la tarea la aceptaste vos.
+ Ir ligeros de equipaje: No obsesionarse con una tecnología ni ser superespecialistas de algo, porque puede pasar de moda, el cliente quiere otra cosa, incluso descontinuarse. En vez de ser especialista, tener el conocimiento basico para poder avanzar y si necesito más subcontrato.
+ Medidas honestas.

## Actividades basicas de XP

+ Codificar.
+ Hacer pruebas.
+ Escuchar.
+ Diseñar.

Esto no indica precedencia ni importancia absoluta. Incluso muchas veces son actividades simultaneas.

Particularmente, XP es basado en pruebas.

## Roles
+ Programador.
+ Cliente: XP no es para emprender una idea propia. Se necesita de un cliente que retroalimente.
+ Encargado de pruebas.
+ Encargado de seguimiento.
+ Entrenador: No es obligatorio, es un desarrollador avanzado.
+ Consultor: No es _parte_ del equipo.
+ Gestor: El jefe.

## Prácticas

Recordar:

+ Valores: 
+ Principios: Explican los valores.
+ Practicas: Llevan a cabo los principios.

Generalmente, las practicas de gestión de XP se ignoran y se usan las de SCRUM. ¿No se está haciendo XP si no se usan todas las practias? No importa, la idea no es hacer XP porque si sino que el proyecto sea exitoso.

+ 40 hour week: No sobrecargar de trabajo, trabajar bien. El cerebro trabaja mejor descansado. Alguna vez vas a trabajar overtime? Si, pero que no sea lo normal.
+ Refactorización: El software es de todos. "Veo algo que no me gusta, lo cambio". Permanentemente realizando y corrigiendo software.
+ Programación en parejas: Debatir en el momento las desiciones de codeado.
+ Estandares de codificación: Ponerse de acuerdo en nomenclatura, cuestiones de diseño UI, ...
+ Testing: Diseño de pruebas se hace antes. Todo codigo que se cambie pasa por las mismas pruebas. Es el corazon de XP.
+ Versiones cortas: 

### Problemas de las practicas de gestion
+ Una de estas practicas es el cliente in situ. Esto es imposible.
+ Juego de planificación: Un equipo de negocio y otro de desarrollo. El objetivo del juego es "empatar", ponerse de acuerdo mediante negocación. Esto funciona solo si estoy haciendo un trabajo para otra empresa, porque quiero que a la otra empresa le vaya bien asi yo gano más. Si estos dos equipos son de la misma organización no sirve, porque uno quiere que el otro pierda para poder ascender *yo*.
+ Metafora: Descripción del problema y la solución en terminos que el cliente pueda entender. Esa metafora puede estar en muchos niveles. Si el cliente no sabe nada, lenguaje natural; si el cliente sabe mucho, un diagrama de clases por ejemplo.

Nota: Los clientes que saben mucho son mas faciles, conocen las limitaciones del negocio. Los clientes que no saben nada tienden a pedir mucho.