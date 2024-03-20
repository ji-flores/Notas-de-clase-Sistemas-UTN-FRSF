Diseño de Sistemas: Resumen
========================
# El software es monstruoso

El software no es un producto tangible. El software es un conjunto de modelos, y el modelado atraviesa diferentes etapas pero en escencia nunca deja de ser un modelo (Hasta el codigo fuente es un modelo, de mayor o menor nivel dependiendo del lenguaje de programación, de las instrucciones maquina que la computadora va a seguir al ejecutar el programa). Esto genera un problema de marketing, porque en definitiva lo que se esta vendiendo es una idea, una promesa de una solución.

El software es como el hombre lobo, inocente y sencillo a primera vista, pero que se convierte en un monstruo de plazos incumplidos, objetivos no alcanzados y productos defectuosos. Alguien no especializado puede pensar, como paso con la industria "hermana" del hardware, existan ciertas "balas de plata", algo que haga que los costos caigan tan rapido como lo hicieron en esta industria, pero lo cierto es que este avance meteorico del hardware es la excepción, no la regla.

Existen dificultades escenciales y accidentales en el desarrollo de software.

Las dificultades escenciales son inherentes del propio proceso de desarrollar software, y que no admiten la aplicación de una simple metodología que las reduzca. Algunas de ellas son:

1. El lenguaje natural es ambiguo, la asignación de significado a los descriptores del lenguaje es distinta de persona a persona, lo que hace que la comunicación entre el cliente y el ingeniero para dejar explicitas cuales son las necesidades del cliente nunca va a ser perfecta. Ademas, el cliente puede no saber expresar bien lo que quiere.
2. Nunca va a existir una solución perfecta al problema que plantea el cliente, siempre lo que habrá es una solución "de compromiso" basada en el presupuesto que haya disponible para llevar a cabo determinada solución.
3. Muchas veces, las necesidades del cliente van cambiando durante el transcurso del proceso de desarrollo, por lo que va a haber que introducir cambios en el diseño. Con el tiempo se, han desarrollado metodologias de trabajo que tienen el objetivo de poder responder a estos cambios con mayor facilidad (o menos trabajo), pero la realidad es que siempre va a haber que rehacer algo, porque no se puede saber el futuro.

Las dificultades 

## El software es maleable
(A diferencia de otros productos de ingenieria) el software es maleable, puede modificarse el producto en si facilmente. Esto lleva a pensar que se pueden realizar modificaciones a la ligera en el software sin realizar cambios de diseño, lo cual es incorrecto y lleva a no poder satisfacer la necesidad a la cual iba dirigida el cambio.

# Cualidades del software
## Internas vs. Externas
* Internas son aquellas cualidades percibidas por el equipo de desarrollo.
* Externas son aquellas cualidades percibidas por el usuario final de producto de software.

Son las cualidades internas las que facilitan al equipo de desarrollo a obtener las cualidades externas.

## Corrección
* Un SW es (funcionalmente) correcto si su comportamiento se condice con la especificación de requerimientos funcionales.
* Esta definición asume que esta especificación existe y que se puede determinar sin ambiguedad si esta especificación se cumple, lo cual se dificulta si esta especificación esta en lenguaje natural (que es naturalmente ambigüo)
* Es una cualidad interna.
* Es necesaria, pero no suficiente.

## Confiabilidad
* El software es confiable si se puede "contar con él". Mas formalmente, como la probabilidad de que el software funcione como debe dentro de un intervalo de tiempo determinado.
* La correccion es una cualidad absoluta, mientra que la confiabilidad es relativa. _Un software incorrecto puede ser confiable_, si los errores no son graves.
* La ingenieria de software es una disciplina inmadura, y esto se manifiesta en la aceptación general de que una primera release de un producto de software tiene bugs. Se puede lanzar un producto no (del todo) confiable al mercado. El usuario puede estar comodo con un software incorrecto si estos errores son "errores conocidos (y recuperables)".
* Se supone que todo programa correcto es confiable, pero eso depende de cuan buena haya sido la especificacion de los modelos en cuanto a representar de manera precisa las necesidades y requerimientos reales del cliente.
* Por esto, la confiabilidad se relaciona mas con una robustez (comportamiento adecuado ante situaciones no planeadas) que con la corrección. Es muy poco probable que el modelo represente fielmente todo lo que espera el cliente del software.

## Robustez
* Un SW es **robusto** si su comportamiento ante situaciones no previstas es adecuado.
* Pero, si puedieramos establecer con precisión que hace que un SW sea robusto, podríamos especificar este comportamiento adecuado. Dejarían de ser situaciones imprevistas y se volverían problemas de corrección.
* Mi conclusión entonces es que: La robustez se trata de, mediante buenas practicas de codigo, disminuir la probabilidad de que el SW colapse ante situaciones que realmente desconocemos (sería practicamente imposible tener en cuenta todas las cosas que pueden ir "mal" o de manera no ideal). Notar que se habla de probabilidad, las buenas practicas no te  *aseguran* robustez.
    * Ejemplo: Dos puentes sufren de una lluvia torrencial sin precedentes, uno se cae y el otro no. Uno es claramente más robusto que el otro. Lo que si, ahora que existe conocimiento de esas lluvias torrenciales deben tomarse en cuenta en el diseño de ahora en adelante.

## Cualidades menos importantes
### Performance (del producto)
* Importante para la economía del producto. Si es muy lento, afecta la productividad de los usuarios; Si utiliza mucha memoria, es muy caro de ejecutar...
* Muchas veces el problema de la performance se trata una vez diseñado el producto. Pero para mejorar este aspecto de manera significativa se necesita un rediseño.
* Por eso, deberían usarse algunas tecnicas (medición, analisis o simulacro), que se pueden combinar.
    * Medición: Recopilar datos del SW funcionando y descubrir obstaculos en el sistema.
    * Analisis: Construir un modelo analitico (ej. basado en teoria de colas) y analizar los puntos debiles. Menos preciso que simulacro pero menos costoso.
    * Simulacro: Construir un modelo completo de simulación, más caro pero más exacto.
### Amigabilidad
* Un SW es amigable si sus usuarios lo encuentran facil (y comodo) de usar.
* Se debe concocer bien la userbase del SW para lograr esta cualidad, no todas las personas se relacionan con el SW de la misma manera.
### Verificabilidad
* Que sus propiedades puedan ser verificadas.
* Relacionada con la **trazabilidad**.
* Para lograrla: Tener claros los requerimientos, una documentación adecuada permite hacer un traceback de los errores más rapido.
* Otras escuelas de pensamiento buscan retribución rapida del cliente (metodos agiles). No hace falta documentación ya que los errores pueden ser descubiertos rapidamente gracias a esta interacción frecuente con el cliente.
* Es interna, pero a veces externa. El cliente puede querer tener a mano ciertas metricas de performance.
### Mantenibilidad
* Tanto "bug fixing" como cambios a causa de cambios en los requerimientos
* Tres tipos: **correctivo**, **adaptativo** y **perfectivo**.
    * Correctivo: Remover los errores presentes en el SW luego de su lanzamiento o luego de algun mantenimiento.
    * Adaptativo: "Adaptación al medio ambiente", por ej.: Cambios en el HW o en el SO. Cambios que no pueden ser atribuidos a una caracteristica del SW mismo.
    * Correctivo: Puntualmente *mejorar* (o agregar) alguna cualidad del software.
*    Puede verse como dos cualidades separadas: reparabilidad y evolucionabilidad. Aunque no hay una linea clara entre las dos: Si las especificaciones de req. son vagas, no sabremos con certeza si estamos corrigiendo un defecto o satisfaciendo un nuevo requerimiento
### Reparabilidad
* Permite la correccion de sus defectos con una cantidad limitada de trabajo.
* Reflexion: Relacionado con buenas practicas de diseño e implementación. En efecto la bibliografia habla de elegir una estructura modular correcta para evitar acoplamiento y poder aislar los errores.
### Evolucionabilidad
* Se toma más a la ligera que en otras disciplinas de ingeniería. Ej: Se saltean estudios de factibilidad. O no se actualiza la documentación luego de introducir cambios.
* Es importante diseñar con esta caracteristica en mente, ya que de querer implementar de manera correcta cambios en el futuro, estos implicaran cambios en el diseño
### Resuabilidad
* Reuso del producto: Rara vez con el producto entero, pero diseñando pensando en el reuso puede llevar a que ciertas piezas de software puedan ser utilizados para proyectos futuros. Por ej.: Librerias cientificas, clases (por eso y otras razones es que un buen diseño de objetos, con buena repartija de responsabilidades, es imporante).
* Reuso del conocimiento especifico sobre un dominio, a veces traducido en reuso de personal.
* Reuso también del proceso.
### Portabilidad
* Capacidad de correr en distintos ambientes (digase: HW o SO).
* Es bastante caro de obtener. Solo es deseable si el negocio lo permite. Una manera: Primero invertir en una plataforma, recuperar la inversión, y seguir progresivamente con las demos.
### Comprensibilidad
* El SW debe ser self-explanatory. Es un hecho que la gente no lee manuales.
* Desde un punto de vistra externo, tiene que ver con la amigabilidad, y por ende se logra de maneras distintas dependiendo de quien sea el usuario final y sus conocimientos.
* Internamente tiene que ver con una documentacion de calidad, y se relaciona con con la verificabilidad y la evolucionabilidad (segun la bibliografía, yo agregaría mantenibilidad).
### Interoperabilidad
* Capacidad de (como minimo) coexistir, o colaborar con otros sistemas.
* Puede ser conseguida mediante una estandarización de interfaces. Un ejemplo en otras disciplinas son las interfaces USB que permiten que distintas piezas electronicas colaboren.
* APIs: Algunos productos lanzan una serie de interfaces para que desarrolladores de otras aplicaciones tomen ventaja de estas funcionalidades.
### Productividad (o Performance del proceso)
* Un proceso eficiente resulta en una entrega más rapida del producto.
* Importante para la economía. El tiempo de desarrollo equivale al costo de producccion, que equivale al costo del producto. Por ende termina siendo una cualidad tanto interna como externa.
* Es dificil de medir.
### Oportunidad
* Capacidad de entregar el producto en tiempo y forma.
* Es clasicamente dificil de alcanzar en la industria del SW. Una de las razones es que es dificil calcular cuanta cantidad de tiempo lleva producir una determinada de software. Otra son los cambiantes requerimientos del cliente
* Una manera de conseguirla es mediante entregas incrementales. Permite tener _un_ producto disponible en menos tiempo, y su uso ayuda a refinar sus requerimientos incrementalmente. Esto depende de cuan posible sea dividir las funcionalidades en particiones independientes.
* No es util si no se llega antes a cualidades de corrección o performance.
### Visibilidad
* Basicamente, si el proceso (tanto los pasos como el estado actual) esta claramente documentado.
* "La visibilidad permite a los ingenieros pesar el impacto de sus acciones y así guiarlas en la toma
de decisiones."
* Es tanto interna como externa: El cliente puede querer saber el estado del proyecto en un momento dado, y para ello es necesario documentación correcta.
* "Un producto es visible si es claramente estructurado como una colección de módulos, con funciones claramente entendibles y de fácil acceso a la documentación".

# Modelos de diseño

## Espiral Win-Win de Boehm
* Es un modelo de espiral. Se comienza mirando las posibles alternativas de desarrollo, se asume la de riesgo más asumible y se hace un ciclo de la espiral. Cada ciclo cuenta con tres etapas:
    * Identificación.
    * Determinación.
    * Negociación.

`Me da la impresión de que "Negociación" es preguntarle directamente al cliente que es lo que quiere, y la "Determinación" es el analista investigando que es realmente lo que el cliente necesita, o que es lo que les alcanza, para despues negociar con nuestras 'condiciones de victoria' como equipo de desarrollo`

# Diseño de entradas
Como el software es un producto, el cliente emite un juicio de valor en base a lo que está a simple vista, osea la entrada/salida. De tener una interfaz defectuosa (o incluso fea), el cliente seguramente pondrá en duda la calidad de "lo que no se ve" (*"si lo que se ve esta defecuoso, como estará lo que no se ve..."*).

Un cliente opta por un producto porque:
+ Le gusta lo que ve.
+ Le gusta lo que recibe.
+ Le conviene el precio por lo que ve y recibe
+ Le gusta lo que los demas puedan pensar de el por tenerlo.
+ Le gusta como se autopercibe.

Para el diseño de entradas, tener en cuenta:
1. Corrección: Los datos que son ingresados al sistema deben ser los esperados. Ademas, aquellos que se cargan deben ser, efectivamente, los que son almacenados.
2. Funcionalidad: La interfaz debe ser intuitiva y facil de usar, amigable.
3. Estetica: La interfaz debe ser "linda" a la vista. Esto es subjetivo y también debería consultarse con el cliente.
4. Adaptabilidad: La interfaz *debería* de ser adaptable a multiples entornos/plataformas. Aclarar que esta caracteristica es bastante cara de obtener.

## Corrección
Para asegurar la corrección de los datos ingresados, se han de usar dos estrategias *no mutuamente excluyentes*: **Verificación** y **Codificación**.

### Verificación
Una entrada de un sistema puede recibir efectivamente cualquier cosa, por lo que debe de hacerse una clasificación de todo el universo de datos en datos **validos** e **invalidos**, y realizar validar el comportamiento del sistema ante ambos conjuntos de datos.
Cosas a tener en cuenta:
* El conjunto de datos invalidos es, con mucha frecuencia, muchisimo mas grande que el conjunto de datos validos.
* No pueden probarse todos los datos, ya sea porque el conjunto es demasiado extenso y testear su totalidad no es rentable, o directamente es un conjunto infinito.

Se acude a distintas estrategias:

* **Clases de equivalencia y limites:** Conjuntos de datos que el sistema debería considerar como "equivalentes", y el sistema debería responder de igual manera ante datos equivalentes. Una idea es probar con un dato representativo de cada clase, ademas de en los limites entre cada una de ellas (y potencialmente un enterono alrededor de ellos). Esto tiene algunos inconvenientes:
    * Definir estas clases de equivalencia requiere de cierta experticia sobre el dominio, que no siempre el diseñador tiene.
    * Los limites entre estas clases no siempre estan bien definidos.
    * Un mismo dato puede ser ingresado de diferentes maneras. Ej. Domicilios.
* **Conjetura de errores:** "Por experiencia, estos datos pueden generar errores". Obviamente, para usar esta estrategia se requiere de mucha experiencia. Ademas no alcanza, no brinda seguridad.
* **Fuerza bruta con alto volumen de datos**: Solo de forma complementaria, no te brinda ninguna seguridad ante datos que no fueron probados.

Cualquier objeto con muchos parametros es debil, e inevitablemente va a colapsar en algun momento de la vida util del sistema.
**Los lotes de prueba siempre deben ser guardados**. De manera que cuando algo en el diseño del sistema cambie, se pueda verificar.

### Codificación
Soluciona el problema de que un mismo dato pueda ser ingresado de muchas maneras.
Un codigo debe ser eficaz (representar de manera univoca un dato) y eficiente (debe ser corto, más rapido de tipear por ej.). Se puede codificar para:
* Mantener seguimiento de algo.
* Clasificar información.
* Revelar información
* Ocultar información
* Solicitar una acción

**Tipos de codificación:**
* Secuencial simple.
    * Muy facil de generar.
    * La ley puede exigirlo.
    * Al no tener relacion semantica con el dato, es dificil de recordar a que dato esta relacionado. Aunque puede servir para pocas entidades
    * Es util cuando se usa como codigo interno del sistema. Ej: Bases de datos.

* Alfanumericos.
    * Mucha potencia de codificación, es decir, con pocos caracteres se pueden codificar muchos objetos.
    * También tiene el problema de la falta de relacion semantica. Esto se soluciona asignando a cada posicion un tipo de caracter especifico.

* De Clasificación: Cada número representa un tipo de dato distinto.
* De bloques secuenciales: 

## Funcionalidad
Para lograr la amigabilidad de la entrada, Mandel enuncia tres reglas:
### 1. Dejar el control al usuario.
Muchas veces para facilitar la implementación, se termina empeorando la usabilidad de la interfaz.
* No obligar al usuario a realizar acciones que no quiere. Identificar el proposito del sistema y hacer al usuario interactuar con ello.
* Interaccion flexible y adaptable: Interfaz personalizable, cambiable para cada usuario. No aburrir al experto ni abrumar al novato.
* Interaccion interrumpible / reversible: Toda acción debe poder revertirse.
* Ocultar tecnicismos al usuario.
* Diseñar interacción directa con objetos de la pantalla
### 2. No sobrecargar la memoria del usuario.
Mientras mas cosas deba recordar el usuario, mas probable es que le cueste / falle al interactuar con el sistema.
* Reducir la demanda de memoria a corto plazo.
* Lo preestablecido debe ser significativo y agilizar la interacción, no realentizarla.
* Los atajos de teclado deben ser intuitivos. Ej: Ctrl+V no es intuitivo, Ctrl+P (Print) es un mejor ejemplo.
* Revelar información de manera progresiva: Mucha información en una misma pantalla abruma al usuario.
* La interfaz debe basarse en una "metafora del mundo real". Ej: Para eliminar, usar iconos de un tacho de basura.
### 3. Hacer que la interfaz sea consistente.
La interfaz debe obtener y presentar información de manera consistente.
* Consistencia tanto interna como externa.
    * Interna: Mecanismos consistentes. Iguales teclas → Iguales acciones, Iguales colores → Iguales significados.
    * Externa:  Debe ser parecida a aplicaciones (del mismo estilo) que el usuario ya haya usado, y por ende aprendido como funcionan.
* Preservar el contexto de trabajo de los usuarios: Los usuarios deberían poder completar tareas sin cambiar de contexto (Por contexto me refiero a tipo de entrada: Teclado, Mouse...).
*  Si los modelos interactivos anteriores han creado expectativas en el usuario, no realizar cambios a menos de que haya un motivo ineludible. 

# Modelo de diseño de interfaz
1) Crear un modelo del usuario: Mientras amplio es el userbase, más dificil se vuelve esta tarea, ya que es más dificil "mantener a todo el mundo contento" o tener en cuenta cada necesidad especial.
2) Generar un modelo de diseño.
3) El usuario genera su propio modelo mental de como será el sistema.
4) Los desarrolladores generan un modelo de implementación.

La tarea del ingeniero en sistemas, y de lo que depende el exito del software, es poder conciliar estos modelos. Conciliar lo factible con lo deseado.

` ¿Como se relacionan esos cuatro pasos de diseño de interfaz, con el grafico de la espiral que tiene analisis, diseño, implementación y validación?`

### Analisis de la interfaz
Conocer al usuario. Que hace, cuando lo hace, cuanto sabe. También evaluar el entorno donde estará la interfaz: Donde se encontrará (ej. al aire libre con mucha iluminación), que estara haciendo el usuario cuando la utilice (ej. manejando un auto).

### Diseño de la interfaz
Se definen una serie de objetos e interacciones. Definir eventos que cambian la interfaz. No se hace escribiendo codigo sino por medio de sketching.
- Tiempo de respuesta
- Herramientas de ayuda. **No** manuales; ayudas rapidas, tips.
- Manejo de errores. Mensajes **claros**, y como solucionarlos.
- Accesibilidad de la aplicacion (Ej. Para ciegos, sordos, etc.)
- Internacionalización (bastante caro)

# Diseño de salidas
Es extremadamente importante por ser la primera impresión que una persona tiene de una organización. Requiere de un trabajo de interacción con el usuario. Pautas a cumplir:
1. Debe tener un proposito: Si una salida no es funcional, hay costos y materiales gastados. Propositos que puede tener una salida son: Entretener, informar, operar, y (la mas importante) asistir en la toma de decisiones.
2. Ajustadas al usuario: **Preguntar** sobre el problema, **observar** el entorno, **calcular** la solución del problema y recien alli comenzar a **diseñar**. Como siempre, a medida que aumenta la userbase se vuelve mas complicado satisfacerla completa.
3. Debe tener una cantidad adecuada de datos: Nunca es util una cantidad excesiva de información. Abruma al usuario y hace que la información importante pueda perderse entre la abundancia de datos. Inicialmente mostrar lo escencial y en todo caso, proveer una manera de acceder a más información.
4. Asegurarse que la salida este donde se necesita y de forma oportuna: Asegurarse que la persona que tenga que ver la salida, la vea. La salida debería presentarse en el lugar, y al tiempo requerido, para que la persona que tiene que tomar las decisiones. Es una condición **necesaria**.

Faltan tipos de salida

# Sesgo
### Definición
Es una interpretación incorrecta de los datos presentados, independientemente de la corrección de los mismos. Surge de una predisposición del usuario a interpretar los datos de cierta manera.

Puede provenir de:
+ Colores: Las personas tenemos respuestas institntivas a ciertos colores.
    + Verde, Azul: Tranquilidad.
    + Amarillo: Precaución
    + Rojo: Peligro.
+ El orden de la información: Por dos cosas: Por la respuesta emocional que generan los datos presentados anteriormente, y porque generalmente la atención de la persona se va diluyendo a medida recibe más información (se le presta mas atención a lo que va primero).
+ Establecimiento de limites predefinidos: La misma información puede ser interpretada de formas diferentes según que el usuario considera un valor aceptable o no. A veces este sesgo se introduce cuando se hacen informes por excepción (solo se incluyen valores en los informes cuando estos estan por fuera de una metrica establecida).
+ Grafica: Es la herramienta más poderosa para introducir sesgo. Este puede estar en la forma de la grafica, en los colores, la presencia o no de números en la grafica, o cualquier cosa que sea externa a la información que se esta presentando. Ej.: Graficos de torta (pueden inclinarse), graficos de barra (escalas modficadas, sin numeros, truncados).
+ Predisposición propia de usuario: Por sus propias vivencias, su cultura... El usuario puede aceptar o no cierta información.

# Propuesta de sistemas
La propuesta es importante porque pone en marcha todo el proceso economico. Es la primera impresión, y como siempre es importante.

A tener en cuenta, generalmente el cliente no es experimentado en sistemas. Salvo empresas tech, como Google.

Es importante perfilar al cliente. Generalmente es gente pudiente, con necesidades completamente distintas a las nuestras a los que debemos convencer que nuestro producto es de prioridad.

## Presentación escrita

Como siempre, cuidar la estetica. La presentación en texto se hace en una carpeta: Si esta fea, imaginate como va a estar el sistema...

### Titulo
Se puede elegir:
* Un **titulo "memorable"**: Es un titulo que apele al deseo de trascender del cliente, de sentirse importante. Ej: El proyecto de informatización del Banco Central a principios de siglo se llamo "Proyecto Centenario".
* Acronimo: Siglas. Se deben encontrar siglas que sean faciles de pronunciar y/o recordar, pero que sigan teniendo coherencia. Un buen ejemplo de siglas es ACID para principios de bases de datos relacionales, BASE sigue siendo memorable pero es un poco rebuscado.
* Que no tenga nada que ver con el sistema, pero que sea "lindo" y transmita quiza una filosofía del proyecto, o una idea. Ej: Proyecto Colibrí.
* 
### Resumen ejecutivo
No debe superar bajo ninguna circunstancia las 300 palabras (menos de una carilla), cada palabra debe valer y ser indispensable, de lo contrario resumir. Debe centrarse en **que** es lo que se pretende hacer, que **beneificios** trae invertir en el proyecto, **cuanto** cuesta, **cuando** se hara (en que plazo de tiempo) y cuando se recuperará la inversión. __NO__ se debe poner el como se hará, ya que implicaría entrar en tecnisismos que van a perder la atención de los ejecutivos.

También recordar el sesgo. Debemos usar el conocimiento sobre sesgo a nuestro favor.

### Cuerpo del proyecto
Generalmente leido por los especialistas de la empresa, una vez se logro captar la atención de los ejecutivos.

Acá es donde se explica el **como** se va a llevar a cabo el proyecto, pero no la justificación de cada decisión, ya que estas tienen lugar en el apendice.

Cual fue el objeto de estudio. Que metodos, herramientas, personas se vieron vinculadas. También puede haber conclusiones sobre las necesidades humanas y ventajas.

### Alternativas
**Si la inversión lo justifica**, pueden proponerse distintas alternativas de sistemas. Para cada una se estudia ambito, costo y beneficio. Se incluye también una recomendacion de profesionales sobre cual de estas elegir.

### Apendice técnico
Incluye graficas, ecuaciones, justificaciones... Solo será leido por especialistas.

## Presentación oral
Una vez sembrado el interés, generalmente se hace una presentación oral.

+ En la opinión de Bracalenti: Es fundamental **ser autentico**. No cambiar el sentido del humor, ni el tono de voz, ni usar palabras que no se que significan. *Asumo que la razón es porque es facil darse cuenta que se está poniendo una fachada y es off-putting.*
+ Estar fisicamente elevado respecto a los oyentes. Ellos sentados, yo parado, o incluso en un escenario. Da una sensación de superioridad.
+ Insertar un corte un poco luego de la mitad de la charla. La justificación es que la segunda mitad parecerá más corta. Ej.: El mismo Bracalenti hacía esto en sus clases. En ese recreo intentar que los oyentes tengan comida y bebida para mantenerlos "contentos".
+ La tecnología (Ej.: Diapositivas) puede ayudar a elevar la presentación, pero no debe ser el foco de la presentación. Depender mucho de la tecnología te puede "dejar a pata" 
    + Si esta falla, se debe evitar que el mismo presentador sea el que se ponga a arreglar el problema, porque corta el flujo de la presentación y honestamente es bastante incomodo para el oyente. Se debería tener un asistente (preferentemente el/la más joven del grupo) para que se encargue del asunto mientras el presentador continua manteniendo la atención de los oyentes.
+ En cuanto al contacto visual.
    + No estar leyendo...
    + No estar mirando para todos lados tampoco. Encontrar dos o tres "puntos de confianza" en el auditorio entre los que vas rotando, los oyentes van a seguir pensando que estas hablando para todos.
+ Ir moviendose por el auditorio ayuda a mantener la atención de los oyentes.
+ Conocer el directorio. Uno conformado por gente joven puede ser más receptor a ideas innovadores, y uno con gente mayor más conservador.

# Gestion de riesgos
**Definición:** Manejo preventivo de eventos inesperados/problemas.

### Tipos de riesgo

Riesgos escenciales: No son inherentemente malos, ya que son, de alguna manera, la fuente del capital. Son propios de un modelo de negocio. "Mientras más alto el riesgo, más alta la recompensa".

Riesgos accidentales: No son propios del negocio y se busca reducir su ocurrencia/incidencia. Son perjudiciales.

### Maneras de manejar riesgos
+ Aceptarlo: "Dejar ser" al problema. Este es el caso cuando planificar y ejecutar un plan de gestión de riesgo es más costoso que el riesgo en sí.
+ Reducirlo: Puede ser bien minimizar la probabilidad de ocurrencia ("prevenir"; reducir la causa) o minimizar el impacto de las consecuencias ("curar"; reducir la consecuencia).
+ Transferirlo: Derivar la responsabilidad del manejo del problema a otra parte.
+ Desconocerlo: Aunque puede pasar, ya que se esta hablando de eventos justamente inesperados, debería evitarse.

Claramente, no puede pensarse en todo, por lo que es prudente hacer una gestión eficiente de riesgo para disminuir su impacto (elegir una manera de manejarlo para cada riesgo). Pero, como se hasta que riesgo planificar? Algunos plantean asignarle un valor de probabilidad, y otro de impacto a cada evento. Estos dos valores se multiplican, y si esta multiplicación supera un cierto limite fijo, se ha de gestionar un plan para ese evento.

Pero, esta valoración de probabilidad y consecuencia no quedá fija desde el principio. Es dinamica, y va a variando según va cambiando el entendimiento sobre el modelo de negocio, el conocimiento sobre la naturaleza de los eventos, o simplemente se va ganando experiencia sobre el proyecto.

Existen lo que se llaman disparadores, que son indicios de que un evento está por ocurrir, o está ocurriendo. Son ellos los que deben iniciar la ejecución de nuestros planes de prevención o corrección, respectivamente.

Realisticamente, no es posible diseñar un plan de gestion de riesgos para todas las situaciones. Hay algunas que no tienen solución.

`"A mayor probabilidad de ocurrencia del evento, más dinero esta en juego". Anoté que no para todos, cual serían ejemplos para cada uno?`

# Prueba
Como el software es intangible, no pueden hacerse pruebas matematicas o fisicas para demostrar su correcto funcionamiento (salvo quiza en software muy simple). Entonces, el proceso de prueba se tratará de descubrir la mayor cantidad de errores posibles, hasta que el software se encuentre en un "nivel aceptable" de corrección, o se acaben los recursos (tiempo y dinero).

Una prueba es exitosa cuando el resultado **no** coincide con el resultado esperado. Para poder lograr esto, es necesario que las salidas que son esperadas esten taxativamente descritas, asi podra determinarse con presición si el resultado obtenido es el esperado o no.

## Psicología de la prueba
+ Las pruebas deben ser realizadas por una persona distinta a la que codeo el bloque de SW a probar. El programador tiende a tener "empatía" por su trabajo. Aunque sea inconscientemente, nadie quiere destruir su propio trabajo. Entonces se termina probando en positivo. ` Si entiendo bien, esto significa no buscar el error, sino buscar que el resultado sea el esperado.`
+ En metodos agiles se admite que esta persona sea _otro_ de los desarrolladores, pero idealmente debe de ser un **tester**, una persona dedicada explicitamente a realizar las pruebas, que tenga la experiencia y una "visión" distinta (que puede llamarse más "destructiva", en comparación a la del programador) que le permita encontrar fallas donde alguien no especializado no hubiera buscado.
    + A veces son hasta resentidos por estar "en contra" del objetivo economico. A pesar de que cada error que encuentren es al final algo positivo, y el objetivo de las pruebas, también cada error encontrado te aleja de un software correcto.

`De apuntes: "Salvo que estemos trabajando en algún método ágil, no recomienda que el programador y el probador sea la misma persona". ¿Esto es así? Me parecería que, salvo para pruebas simples de escritorio, nunca el mismo programador debería probar, debería ser al menos otro de los programadores.`

## Economía de la prueba
+ Realizar pruebas es una **inversión**, no un gasto. Cada error que no se encuentre se traducirá luego en gastos de mantenimiento, o bien si no es resuelto, se traducirá en un software que nadie querrá usar, y un cliente descontento.
+ Como es imposible demostrar que el SW esta libre de errores, el final de las pruebas esta dictado por el agotamiento del tiempo o los recursos que hayan sido asignados en el contrato.
+ Para poder lograr esto, es necesario que las salidas que son esperadas esten taxativamente descritas, asi podra determinarse con presición si el resultado obtenido es el esperado o no. Ademas, evita que uno intente "autoconvencerse" de que el resultado obtenido es correcto.

## Tipos de pruebas. Segun "nivel"
### Pruebas de nivel inferior
+ **No incrementales:** `Es lo mismo que test unitario?` Se prueba cada componente de manera aislada. Son rapidas y simples, es facil encontrar donde se producen los errores.
    + Desventaja: No es capaz de detectar errores de integración entre los componentes.
    + Desventaja: Acoplamiento entre componentes dificulta las pruebas individuales. A mayor el acople, más fragil es el componente (susceptible a errores, y mas dificil de encontrarlos).
+ **Incrementales:** Se van incorporando componentes de a uno. "Se prueba porción de SW → Se incorpora componente A → Se prueba porción de SW + A". Permite observar todos los componentes funcionando (como terminan haciendolo en realidad) y detectar errores de integración.
    + Desventaja: Para elegir la entrada que debe resultar en una salida especifica, deben rastrearse "hacia atras" todas las transformaciones que debe sufrir la entrada para convertirse en salida, lo cual para muchos componentes es muy complejo.
    + Desventaja: Si los algoritmos muy importantes se encuentran muy lejos de la entrada, pueden tener problemas de fragilidad.
    + `Puede ser que los ultimos componentes en ser agregados se prueben muy poco?`
+ **Hibridas:** Para solucionar esta ultima desventaja, se pueden utilizar pruebas no incrementales en los componentes más importantes, y luego realizar pruebas incrementales con el sistema entero (incorporando estos componentes ya probados)
+ **Inspecciones:** Se realizan con un grupo de cuatro personas: Un moderador (programador experimentado; dirige, coordina horarios, toma nota de los errores y ultimamente se asegura de que sean corregidos), el programador de la seccion de codigo a inspeccionar, el diseñador del sistema y un tester. Se inspecciona linea a linea el codigo, con el programador explicando la logica en voz alta. Ademas, se cuenta con una lista ayuda-memoria con errores frecuentes (conjetura de errores) en base a la cual se analiza el codigo.
    + Los errores se encuentran, no se corrigen (salvo en casos muy basicos en los que el programador pueda ofrecer una solucion rapida). Sirve para errores de nivel inferior, no superiores (relacionados a la percepción del cliente sobre el sistema)
    + Durante la inspeccion, el mismo programador es el que encuentra la mayor cantidad de errores. El simple hecho de leer en voz alta parece facilitar esta tarea.
    + Las sesiones no deben ser muy largas (de 90 a 120 minutos). Estas sesiones son demandantes mentalmente para el programador, que debe soportar constantes cuestionamientos a su trabajo. Es por ello que este debe encarar la sesión con una actitud libre de ego, evitando tomarse de manera personal las correcciones para que el ambiente no se vuelva agrio. También sirve que la lista de correcciones quede solo entre los participantes de la sesión (puede ser una preocupación del programador que si sus superiores descubran la cantidad de errores que cometen, pueda perjudicar su posición en la organización).
    + Si la lista de errores es sustancial, puede proponerse una nueva sesión de inspección luego de las correcciones.

### Pruebas de nivel superior
Una definición podría ser aquellas pruebas en las que se corrobora que el software funcione de la manera en la que el usuario final espera que lo haga. Sujetas a parametros subjetivos.

**Prueba de funciones:** Se corrobora que el sistema cuente con cada una de las funcionalidades que se encuentran en la especificación, y que desarrolle cada una correctamente. Pone el foco en cada funcionalidad de manera aislada.

**Prueba de sistemas:** Pone el foco en el funcionamiento del sistema como un todo. No solo la presencia de las funcionalidades, sino que el sistema las desempeñe de la manera que el cliente lo desea. Por ej.: Un sistema puede superar la prueba de función, pero estas funciones pueden estar escondidas, o la interacción con el usuario para poder realizarlas puede ser sumamente incomoda. Existen muchos tipos de pruebas de sistema: De volumen, de esfuerzo, de facilidad de uso, de facilidad de instalación, de seguridad...

`A que se refiere con los objetivos generales? Y que es esa documentación o publicación que se le da al usuario, manuales de uso? Bosquejos de la interfaz?`

`De esto faltaria apuntar. Esperar a entenderlo bien.`

**Pruebas alpha:** El usuario prueba con la presencia del equipo de desarrollo. Los desarrolladores pueden guiar la sesión de prueba, tomar notas sobre los errores, y recibir feedback del usuario. Es util la visión del usuario, distinta a la del desarrollador, para encontrar más errores que al equipo se le pueden haber saltado.
**Pruebas beta:** Se entrega al usuario una versión de "pre-producción" para que, mediante el uso cotidiano (a su propio riesgo, siendo consciente de los potenciales errores) del software, potencialmente descubra errores. Ademas, cuando una empresa lanza una versión beta, son miles de pruebas de usuario gratis donde el software se prueba en situaciones inpensadas en una prueba de laboratorio.

### Comparación
+ El nivel de las pruebas es directamente proporcional a la presencia que tiene el cliente.
+ Las pruebas de nivel superior tienen un costo agregado, que es la confianza del cliente en el sistema. Cuando el cliente percibe un error, percibe ademas una falibilidad de quienes desarrollan en el sistema, pudiendo afectar a la empresa a nivel economico.

## Tipo de pruebas: Segun "visibilidad"

### Caja negra
Se realizan sin acceso al codigo fuente, analizandose unicamente las entradas y salidas al sistema.
### Caja blanca

Se tiene el codigo a mano a la hora de probar.

Permite probar todos los caminos lógicos (aunque en codigo muy complejo esto no es viable).

Se utiliza para pruebas no incrementales (a nivel de objeto), no tanto a nivel de sistema.

Se realiza:
+ En secciones de codigo de mucha importancia.
+ Secciones de codigo propensas a errores.
+ Por cuestiones de seguridad. Para evitar que el programador pueda introducir lineas de codigo perjudiciales (backdoors, redirigir dinero a su cuenta).
+ Por cuestiones legales.

## Terminación de las pruebas
### Deadline
Son razones politicas: Por una decisión "de arriba", el software sale en tal fecha. Cualquier problema que pueda seguir habiendo se solucionara como parte del mantenimiento. Como aspecto positivo, es una manera de despojarse de responsabilidad ("si teniamos tiempo, podriamos haberlo hecho mejor").

### Criterios matematicos
Puede buscarse un criterio más objetivo, ya que el vencimiento del periodo de pruebas no dice nada sobre la calidad de las mismas.

+ *"Esparcimeinto de errores"*: Se insertan errores de manera intencional en el codigo, esperando que, en el proceso de buscar todos los errores insertados, salgan a la luz el resto de errores.
+ *"Probar en positivo"*. Si el objetivo de las pruebas es encontrar errores, poner una metrica de errores a encontrar que marque el final de las pruebas. Ej.: "Las pruebas concluyen cuando se hayan encontrado 70 errores o hayan pasado 3 meses, lo que suceda ultimo".
    + Desventaja: Como hacer para estimar este numero de errores. A veces se usa experiencia en el desarrollo de otros problemas similares.
+ *"Graficar"*. Graficar el numero de errores por unidad de tiempo, y examinar la forma de esta para determinar si es necesario seguir con las pruebas.
    + Desventaja: Se requiere de mucha intuición. También, es poco predictivo: ¿Como saber cuanto tiempo y recursos destinar a las pruebas?

### Criterios económicos
Los metodos más objetivos pueden ser sobrepasados por el hecho de que en el contrato se destina cierto presupuesto a las pruebas, que esta limitado por la rentabilidad (ganancia) que se quiere obtener del proyecto, los impuestos, gastos directos e indirectos...

```
## Terminación de las pruebas
Por más que en la practica el final de las pruebas se determina o bien por
+ El vencimiento de un tiempo que se ha pactado para las pruebas, o
+ Los casos de prueba han arrojado el resultado esperado (han sido infructuosos)

Ambos metodos tienen sus problemas. El vencimiento de un periodo de pruebas no dice nada sobre la calidad de las pruebas (tranquilamente podría no haberse hecho nada), y que los casos de prueba hayan sido infructuosos no te asegura que estas pruebas sean de calidad. Meyer propone tres metodos:

+ *"Se obtienen casos de prueba de (1) analisis de valores limite y (2) conjetura de errores, y se prueba hasta que todos estos casos resulten infructuosos"*.
    + Desventaja: Se asume la utilización de ciertos metodos para el diseño de casos de prueba que pueden ser i) no aptos para la utilización en esta etapa de pruebas (prueba de sistemas, por ejemplo), o ii) quien ejecuta las metodologias podría no estar haciendolo de manera rigurosa.
    + Se utiliza: En prueba de componentes.
```

## Notas
+ Los componentes donde más errores se encuentran son aquellos en los que han trabajado un mayor numero de personas. (Por ej.: Un programador no entiende completamente lo que hizo el otro)
+ Componentes donde *ya* se han encontrado errores.

# Debugging
Luego de que un caso de prueba es exitoso (se encuentran errores), sigue el proceso de debugging, que consiste:
1. Entender la naturaleza exacta del error, y encontrarlo.
2. Corregirlo.

+ Generalmente, la persona ideal para realizar las tareas de debugging es el mismo programador que programó la porción de SW que se esta corrigiendo, ya que es quien mejor entiende la estructura del codigo y por ende donde pueden ubicarse los errores.
+ Es una tarea abrumadora para el programador, ya que:
    + Es un recordatorio de la imperfección de su trabajo.
    + Se realiza muchas veces bajo presión (por ejemplo, por una deadline).
    + Por la manera en que se diseñan la mayoria de los programas, y la naturaleza de los lenguajes de programación modernos, el error podría estar virtualmente en cualquier lado (no hay garantías sobre la ubicación de un error, como si en otros productos de ingenieria que tengan algun problema, como un auto al que se le ahoga el motor).

## ¿Por qué cometemos errores?

Existe una posibilidad de que durante el debugging se introduzcan errores, incluso más significativos de los que existian anteriormente, por lo que se debe ser consciente de las razones por las que comentemos errores:
+ Ignoracia sobre el problema: No tenemos idea del problema que estamos resolviendo. No tiene una solución clara, porque tampoco podemos ser todologos.
+ Ignorancia sobre las herramientas de desarrollo o debugging: Pretendemos resolver el problema con el (poco) conocimiento que tenemos de las herramientas. A diferencia del anterior, tiene solución.
+ Compromiso emocional: Las alegrias y los desencantos en mayor o menor medida afectan todos los aspectos de nuestra vida, incluido nuestro trabajo. Con suerte, con el tiempo se pasan.
+ Impetu juvenil: Al estar apurado por encontrar la solución, se esquivan las maneras más metodicas de resolver los problemas, aumentando muchisimo nuestra probabilidad de equivocarnos.
+ Desconocimiento del resto del producto: Una solución que ignora las relaciones que un componente puede tener con el resto del sistema puede generar un efecto onda que hace que el sistema falle cuando funciona como conjunto. Es especialmente molesto de corregir porque el error no le sale a uno sino a otro. Para evitarlo hay que procurar ser metodico y riguroso.

Existen varias maneras de hacer debugging:

## Formas asistematicas
Aunque ineficientes y muchas veces infructuosas, son las formas más comunes porque requieren menos esfuerzo mental. Solo se recomiendan cuando otros metodos (más reflexivos) fallan, o de manera complementaria.

### Vuelco de memoria
Se analiza un vuelco de memoria (a un documento) en un momento determinado de la ejecución del SW. Tiene varias desventajas:
+ Es dificil establecer una relacion entre las direcciones de almacenamiento y las variables del sistema.
+ La cantidad de información obtenida es enorme y en su mayoria irrelevante.
+ Constituye una imagen estática del sistema (que rara vez se realiza en el punto exacto que se necesita para mostrar el error), mientras que para la mayoria de los errores se requiere estudiar el comportamiento dinamico del sistema.
+ Como no hay ningun razonamiento o proceso mental detras de él, el programador esta basicamente esperando que el error se presente magicamente frente a él...

### Esparcimiento de sentencias
Esparcir sentencias en el codigo con el objetivo de mostrar mensajes, informar el valor de variables e incluso forzar operaciones.
+ Ventaja: Con respecto al vuelco, si permite ver el comportamiento dinamico del sistema.
+ Desventajas:
    + Sigue siendo "prueba y error", sin mucho razonamiento atras.
    + El codigo con el que se esta trabajando, aunque parecido, **no es el codigo original**. Se puede enmascarar el error, introducir nuevos errores... Ej.: Declarar una variable auxiliar, puede correr las direcciones de memoria del codigo maquina y afectar el comportamiento original. Sin mencionar la posibilidad de que nos olvidemos de comentar/remover estas lineas y que queden en la versión final.
    + No soluciona el problema de la gran cantidad de información muchas veces irrelevante.

### Herramientas de debugging
Pueden introducir "puntos de detención", suspendiendo la ejecución cuando se cruza por alguna sentencia, o se modifica alguna variable, permitiendo ver el estado del sistema en ese momento. 
+ Ventaja: Ya no se introducen sentencias al programa.
+ Desventaja: Sigue siendo "prueba y error", sin solucionar la necesidad de analizar información irrelevante. Hay evidencia experimental de que no son más eficientes que los metodos reflexivos.

## Formas sistematicas
Implica el uso de la racionalidad para solucionar el problema. Son menos usados a pesar de ser, objetivamente, de mayor calidad. Para realizarlos bien, se requiere de cierta experiencia.

### Inducción
"De lo particular a lo general". Comenzando con las pistas o "sintomas del error" (usualmente el resultado de uno o más casos de prueba) y buscando relaciones, a menudo se puede llegar al error.
1. Se registra que es lo que el sistema hace bien y lo que no, viendo los resultados de varios casos de prueba que tengan que ver con el error (incluso aquellos casos similares, pero que no generan el error).
2. Se observa la información obtenida en busca de alguna estructura, o contradicción.`La tabla de QUE, CUANDO, DONDE, CON QUE ALCANCE`
3. Se formula una hipotesis. Si no se logra, se necesitan más datos (pueden generarse más casos de prueba).
4. Probar la hipotesis. **No** intentar hacer la corrección de entrada, pero pensar si realmente la hipotesis elegida explica toda la información recopilada. Si no lo hace, probar con otra.


### Deducción
"De lo general a lo particular". Se generan en un principio teorias generales sobre cual puede ser el problema, y a medida que se obtiene información se van descartando.
1. Desarrollar una lista de posibles causas: No hace falta que sean ideas completas, y debe ser la mayor cantidad de ideas posibles (brainstorming). En esta etapa se consideran todas, no se descarta ninguna todavía.
2. Por medio de la información obtenida via los casos de prueba, se van eliminando las teorias que contradigan estos datos. Si todas las hipotesis son eliminadas, es necesario obtener más información (por medio de más casos de prueba).
3. Clarificar las hipotesis restantes: Se busca refinarlas con la información que se tiene para que describa precisamente el error.
4. Probar las hipotesis restantes: Idem "inducción".

### Backtracking
Seguir la logica del sistema "hacia atras" hasta encontrar el punto donde se da el error. Solo funciona para SW pequeño.



# Implementación
El proceso de implementación es costoso, lento y problematico, por lo que requiere de su debida atención.

Un sistema se considera **implementado** cuando funciona con el volumen de datos de diseño, y sin la ocurrencia de errores significativos.

Comienza con cuestiones de logistica, como la instalación de un llamado **centro de información**, que recibirá todas las consultas que puedan tener los usuarios sobre el funcionamiento del nuevo sistema. Esto es necesario porque el usuario ve al ingeniero como "la encarnación del conocimiento informatico", y puede ahogarlo en consultas evitando que este pueda realizar correctamente su trabajo. El centro será atendido por alguien joven y será clave para aislar estas consultas, y derivarlas a quien corresponda, pero *cuando* corresponda.

También tiene un claro final, una evaluación para determinar que se hecho bien y que debería mejorar. No tiene el objetivo de buscar culpables de potenciales errores, sino simplemente registrar estas cosas y mejorar en base a ello.

En el medio, existen cuatro etapas que no tienen orden de precedencia ni de importancia.
+ Conversión de programa.
+ Conversión de datos.
+ Conversión de procedimientos.
+ Capacitación de usuarios.

Como nota marginal, **la conservación de los datos que existian en el sistema viejo es fundamental**. Perder los datos llevará de seguro a grandes problemas economicos para la empresa y una más grande perdida de prestigio.

## Capacitación de los usuarios
Es en un sentido, materia de *marketing*. Alguien que esta teniendo problemas para utilizar el sistema no pondrá la culpa sobre el mismo y su falta de conocimiento sobre el mismo, sino en el propio sistema, y su falta de usabilidad. Es entonces conveniente, para preservar nuestra imagen como desarrolladores ante el cliente, que capacitemos a los usuarios antes para evitar estas situaciones.

### Capacitación operativa
Corresponde una capacitación operativa para los usuarios finales del sistema. El tanto el **qué** hace el sistema como el **cómo** lo hace.

Se realiza con computadoras para cada uno, o por grupos. Para evitar utilizar tantos recursos, es común capacitar a usuarios experimentados, que luego capactien en el ambito de trabajo a los demas usuarios (capacitación de capacitadores).

Dependiendo de los números involucrados sera dentro o fuera del horario de trabajo, y dentro de la empresa o un centro de capacitación. Si se realiza en horario de trabajo es fundamental que sea concisa, para no perder tanto tiempo de producción.

### Capacitación ejecutiva
Corresponde a los "jefes". Son gente ocupada, y tienen incluso menos tiempo. Debe centrarse solo en el **qué**, y como esto facilita cumplir los objetivos de la empresa. Ha de ser amena, con un descanso un poco después de la mitad (a medida de que pasa el tiempo, la explicación es más pesada), y en este descanso debe haber estimulantes (comida), con asistentes que manejen la tecnología. En resumen, parecido a como se organizaría una propuesta de sistema.

Otra razón para diferenciar las capacitaciones entre jefes y operarios, es que un jefe puede estar precupado por quedar mal enfrente de sus subordinados si no entiende el funcionamiento del sistema, y lo mismo en el otro sentido, un operario puede temer por su trabajo si su jefe lo ve como un "inutil".

## Conversión de los procedimientos
Dificilmente un software nuevo tenga como unica función optimizar las tareas que el software viejo ya automatizaba. Esto no sería significativo para mejorar la eficiencia de los procedimientos.

Hay algo en la manera de trabajar de los usuarios que va a cambiar con la implemetación del nuevo sistema, y hay que convencer al usuario (que ya esta acostumbrado a hacer las cosas de una manera) de que estos cambios le facilitarán su tarea.

Existen organizaciones más y menos resistentes a estos cambios. Algunos ejemplos:

### Multinacionales
Estas organizaciones tienen un fuerte apego a los manuales de procedimientos. Todo se mide en terminos de utilidades, por lo que quien no se apega a los manuales muy probablemente pierda su trabajo. Esto facilita la implementación de nuevos procedimientos, ya que lo que está escrito vale.

### Empresas familiares
Estas organizaciones son similares a las multinacionales en el sentido de que son *despoticas*: Se hace lo que dice el cabecilla de la familia (generalmente un señor mayor). Si se logra convencer a este cabecilla, habrá poca resistencia al cambio. 

*También anote como una ventaja el "entusiasmo familiar". Parecería que si convencemos a la familia de que haran más dinero de esta manera, es suficiente incentivo para que cambien los procedimientos.*

### Empresas publicas
Son las más rigidas a los cambios de procedimientos. No se premia la productividad, sino que los ascensos se dan por longevidad, tampoco despidos (en su lugar se mueve al empleado a otra posicion de igual jerarquía). Esto resulta en una falta de motivación del empleado para cambiar su manera de trabajar, entonces queda a merced de la capacidad del ingeniero de convencer al empleado de que su trabajo le traerá el **beneficio personal** de facilitar su trabajo, lo cual requiere de voluntad.

## Convesión de programa
Sustitución del software viejo por el nuevo. Puede realizarse de muchos metodos:

+ De golpe o "crash"
+ En paralelo
+ Gradual
+ Distribuido
+ Prototipado evolutivo

### De golpe o "crash"
A partir de una fecha dada, el sistema viejo deja de utilizarse y se pone en uso el sistema nuevo, completo. Como unica ventaja, obliga a los usuarios al empleo inmediato del SW nuevo, luego todo el resto son desventajas. A cualquier cosa que salga mal, no hay red de contención. Solo se usa cuando:
1. Es un SW trivial, del cual no depende el funcionamiento del negocio.
2. El sistema viejo colapso completamente y quedó inutilizable.
3. Disposiciones gubernamentales. "A partir de cierta fecha debe estar en funcionamiento tal sistema".

### En paralelo
El sistema viejo y el nuevo funcionan, como dice el nombre, en paralelo.

Tiene como ventaja que ante cualquier fallo del sist. nuevo, siempre esta el sistema viejo para salvarte. Aunque existen los siguientes inconvenientes:
+ Es caro: Deben hasta duplicarse los costos de personal y mantenimiento.
+ El personal que maneja el sistema viejo puede sentir que será desechado junto al software viejo. Una posible solucion es ir rotando paulatinamente el personal de cada sistema, aunque persiste la posibilidad de daños intencionales al sistema nuevo.
+ `(Esta la agrego yo)` Debe asegurarse la consistencia de las operaciones del sistema viejo y el nuevo.

### Gradual
Distintos subsistemas del nuevo sist. se van implementando de a uno. Permite enfocarse en un departamento a la vez, pero lo más probable es que estos distintos subsistemas esten acoplados (intercambien información), y deban escribirse piezas de codigo adicionales que funcionen de interfaz entre las partes viejas y las partes nuevas (Esto consituye un clavo o "spike", que son tareas con un costo que el cliente no ve y no aprecia), piezas que llevan trabajo y luego terminaran desechandose.

### Distribuido
Se implementa el sistema en sucursales de menor importancia primero, de manera que las potenciales fallas que puedan surgir tengan un impacto minimo (mucha menos gente se entera). A medida que se va evidenciando que el sistema funciona de manera correcta, se va implementando en las sucursales centrales.

### Prototipado evolutivo
El sistema es un "eterno prototipo", en el sentido de que se van implementando funcionalidades a medida que el cliente las demanda, por lo que en teoría, nunca se llega a una versión final. Se comienza, logicamente, con un sistema pequeño de pocas funcionalidades y va escalando a medida que el cliente demanda. Son el origen de los métodos ágiles.

Solo utilizarse en sistemas de **mediano a bajo riesgo y costo**.

## Conversión de datos (o migración)
Es fundamental que se planifique y presupueste correctamente, ya que demanda mucho tiempo y es una tarea de alto riesgo.

Los datos a almacenar en el nuevo sistema provendran de:

+ La base de datos vieja
+ Registros de datos paralelos
    + Archivos de documento o "office"
    + Archivos de texto plano
    + Archivos en papel
+ Gente que sabe
+ El mundo exterior

Entre estas fuentes casi siempre hay inconsistencias, que lamentablemente se deben solucionar a mano.

### Base de datos vieja
Como perder los datos es fatal, se comienza con un backup de la base de datos, usando la tecnología vieja. Para ello es necesario alguien que sepa manejar **bien** la estas tecnologias a veces obsoletas. Es mejor subcontratar a alguien que sepa, que pagarle a alguien para que aprenda (es menor el riesgo de perder los datos).

Luego, pasar los datos a la tecnología nueva. Se comienza pasando los datos de la base de datos vieja a texto plano (o bien la tecnología tiene esta función, o tiene una para imprimir los datos a papel, mediante la cual si manipulamos el spool podemos obtener estos archivos de texto) ya que casi todas las tecnologias modernas de BdD tienen un conversor desde texto plano.

Los datos pueden estar en formatos obsoletos. Ej.: Campos ApeNom y domicilios (todo junto en un String). Para esto se deben escribir scripts (bastante complejos) que puedan separar estos campos en datos atomicos, que deberan tener en cuenta, por ejemplo, apellidos compuestos (es util una lista de apellidos comunes).

Pueden haber inconsistencias hasta dentro de la misma BdD vieja. Para resolverlas cuales se debe elegir un criterio y aplicarlo consistentemente. 

Para estas dos ultimas tareas haran falta inspecciones a mano, que toman mucho tiempo y se deben **presupuestar acordemente**.

Antes de completar la conversión, se crearan tablas con el diseño viejo pero la tecnología nueva (bases de datos provisionales).

### Registros de datos paralelos
Estos datos se encuentran en formatos inentendibles para cualquiera quien no sea "la persona que sabe", que es probablemente quien llevaba estos registros. Estos datos son importantes y debe organizarse una entrevista con esta persona para poder entender e incorporar estos datos.

### Mundo real
Generalmente se necesita de un incentivo para que quienes tengan datos utiles los traigan. Ej.: Chances en un sorteo de algo.

### Archivos en papel
Son los más conflictivos y caros. Es necesario crear un programa aparte para la carga de estos, que sea principalmente rapido para la carga y admita posibles inconsistencias (que el software real no admitiría) que existen en estos papeles, que por supuesto serán solucionadas más tarde vía inspección ocular.

Obviamente, se requiere de una persona que cargue estos datos, a la cual se le debe pagar acordemente. ¿Como saber cuanto tiempo y por ende cuanta plata) tardará cargar los datos? Se puede usar el siguiente experimento: *i)* Se pone a una persona a cargar 100 formularios, como entrenamiento, *ii)* Esta persona carga otros 100 formularios, esta vez cronometrando su tiempo, *iii)* Si se divide el tiempo en horas de esta ultima tarea, por 100, se puede saber cual es (en promedio) el tiempo que se toma en cada formulario. Con una regla de tres se obtienen las horas hombre necesarias.

Si va a ser el mismo cliente el que se encargue de la carga de datos, se le debe proveer el ABM lo antes posible. Esto es muy conveniente porque el sistema se puede probar con datos reales.

# Mantenimiento
Es un problema economico.

Si no se trabaja con metodologías agiles, es importante tener una buena comunicación con el cliente y pactar en el contrato un **periodo de garantía**: Las fallas encontradas hasta este momento serán corregidas, fuera de ese plazo estamos hablando de una tarea y por ende un gasto aparte.

Si se trabaja con metodos agiles, tener en cuenta que se maneja poca trazabilidad (quien hizo quien), por lo que no se recomienda para sistemas de alto riesgo.

### Tipos de software arquetipicos

+ **Estatico**: Es el software cuyos requerimientos no cambian con el tiempo, y una vez que se pone en producción no requiere de ninguna actualización ni mantenimiento posterior. Tal es el caso de los electrodomesticos.
+ **Progresivo**: Solo cambia a medida que cambia el contexto informatico en el que se encuentra. Es decir, recibe actualizaciones en función de si es necesario cambiar la tecnología sobre la cual funciona. El fundamento resolutivo no cambia, pero si el poder de procesamiento. Cambia la implementación.
+ **Evolutivo**: Los requerimientos del software cambian constantemente en el tiempo, por ende deben introducirse actualizaciones para adaptarse a los mismos.

## Tipos de mantenimiento
### Correctivo
En el uso cotidiano del sistema se van descubriendo fallas introducidas durante el desarrollo. El mantenimiento correctivo corresponde a la generación de nuevas versiones del software que corrigan estos errores.

### Preventivo
Si el problema no corresponde a una version particular, sino que es intrínseco del desarrollo del sistema en su totalidad, se realiza un mantenimiento **preventivo** en el resto de versiones. Por más que no haya sido descubierta en estas todavía, el error esta alli.

### Perfectivo
Sobre una versión estable del sistema, introducir arreglos. Ej.: Optimización de algoritmos. Tener en cuenta que en todo mantenimiento pueden introducirse nuevos errores, asi que si se es cuidadoso, las mejoras deberían introducirse en una nueva versión, cosa de mantener estable una versión que ya lo era.

### Adaptativo
Introducción de nuevas funcionalidades, como respuesta a cambios en los requerimientos.

### ¿A que tipo de software corresponde cada uno?

|Estatico|Progresivo|Evolutivo|
|--------|-----------------------------------|------|
|Ninguno.|Correctivo, Preventivo, Perfectivo.|Todos.|

## Rejuvenecimiento del sistema
A causa de la inclusión de sucesivas correcciones pequeñas, el codigo del sistema se va ensuciando hasta el punto de ser inmanejable. También, el software y hardware sobre los que corre el sistema van quedando obsoletos.

En tales casos donde el sistema "cauduca" corresponde algo llamdo el "**gran mantenimiento**", que es la reconstrucción del sistema desde cero.
 
No siempre se cuenta con el codigo fuente del sistema original, por lo que debemos recurrir a la documentación.

En casos donde la documentación tampoco esta disponible, se debe realizar un proceso de ingeniería inversa. Por suerte, existen muy buenas herramientas (pagas) que permiten, del codigo objeto, obtener codigo fuente en el lenguaje original. Otras herramintas pueden usarse luego para traducir a un lenguaje más nuevo.

Luego es tarea del ingeniero generar un modelo de clases, usando como base el modelo de datos. `Yo tengo anotado que la herramienta de ingenieri inversa genera un modelo de objetos, sobre el que luego se genera un modelo de clases...`


