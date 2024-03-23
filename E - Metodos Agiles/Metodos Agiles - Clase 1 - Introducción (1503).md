Métodos Ágiles de Desarrollo de Software - Introducción
========================
*Es lo que se usa...* Salvo que haya mucho dinero en juego.

Se ven metodos taxativo, maneras estrictas de hacer las cosas. Pero en la práctica no es así.

El objetivo es tomar conceptos generales de cada uno de los metodos, y utilizarlos, adecuarlos o incluso generar una metodología propia. Lo que si, una vez uno idea una metodología, ser consistente con ella y poder generar experiencia con ella.

SCRUM: Más usado en la industria argentina. Habla poco de la parte de programación, entonces permite mucha creatividad. Poco probable que se use de forma pura. Hace incapié en la gestión. Puede andar muy bien junto con XP (que se centra en la programación).

**¿Que son los métodos agiles?** Una filosofía de trabajo, centralizada en el individuo. La confianza en tu gente es determinante. No es una justificación para hacer las cosas mal.

El nombre es marketing. Si mi producto es un "metodo ágil", el de mi competencia es algo que no es ágil (pesados)...

Los programadores siempre estuvieron de acuerdo en que el proceso de desarrollar debe ser sistematico.

"Si yo estoy dibujando, no estoy progrmando". El cliente lo que quiere ver es producto funcionando. El objetivo es reducir la burocracia en el proceso de desarrollo. "Hablo con el cliente, al otro día estoy programando". De esta idea surgen los metodos ágiles.

## Manifiesto agil

Existio una convencion donde se genero un **manifiesto agil**.

+ **Individuos e interacciones** sobre **procesos y herramientas**: Es muy importante como nos llevamos con nuestro equipo de trabajo y con el cliente. Comunicación fluida entre nosotros y entre nosotros y el cliente, es más importante que cualquier diagrama. Notar que si somos pocos, esto es realizable. Si el equipo de trabajo es muy grande, es imposible.
+ **Software funcionando** sobre **documentación extensiva**: El cliente que esta pagando por un proceso de desarrollo y que no esta viendo nada de software funcionando (que seguro, le esta saliendo caro), no estará muy contento. El software funcionando es indiscutible, es muy facil negociar con él.
+ **Colaboracion con el cliente** sobre **negocación contractual**: El cliente tiene que estar cerca. No nos podemos olvidar que estamos trabajando para él. Si el cliente siente que esta siendo parte del proceso, la siente propia, *y nadie quiere pisar su propio trabajo*. No todos los clientes son aptos para trabajar con MA! Quieren estar muy lejos y que les den las cosas hechas.
+ **Respuesta ante el cambio** sobre **seguir un plan**: Los metodos convencionales quieren predecir que hace cada individuo en cada instante de tiempo, esto va a ser tan exitosos como cuan realista, o bueno, sea el plan. Responder al cambio es tener un plan, pero a corto plazo, y que puede tener en cuenta lo que ha ido cambiando en el dominio hasta ahora. El cliente también tiene que entender que los cambios de opinión que puede tener él tampoco es gratis.

> Lo primero se valora más que lo segundo. Pero lo segundo **NO** se descarta.

Para la mayoria de los problemas de mediano a pequeño **tamaño** y **riesgo**, solo se necesita lo primero. Pero para los otros problemas se necesita una mezcla, o incluso solo lo segundo.

Ej.: Un sistema para un misil de guerra. Imposible aplicar metodos ágiles. Se necesita una trazabilidad total del trabajo, todo lo que fue pensando por cada uno de los integrantes del proyecto. Un piloto automatico, se tiene que revisar exhaustivamente...

Ej.: Un proyecto que requiere de cierto numero grande de horas de trabajo (ya se expandera en esto más adelante), no se pueden usar metodos ágiles.

Todo lo que se lea a favor o en contra de una metodología, es por guita, es por publicidad. Mientras más gente usa tu metodología, más plata ganas en royalties.

En USA por ejemplo, los academicos si no publican no viven

## Caracteristicas comunes entre todos los MA

+ Surgen en libros con impacto en la industria y en el publico, no en papers, en el ambito academico.
+ Metodología simple y facil de aprender. "Los sistemas funcionan si funcionan junto al sentido de la gente...". Valores (son propios de un conjunto de personas, nunca universales), principios (la explicación del valor, la norma), prácticas, roles como colaboramos para que la practica se ponga en marcha), artefactos (herramientas para realizar la práctica). 
+ Equipos no jerarquicos y autoorganizados.
    + No jerarquicos: Esto es mentira... Quien contrata, es el jefe. Pero bajo el jefe, todos son iguales (no economicamente, esto nunca es así). Esto quiere decir que no existe una jerarquización tan compleja (Solo un general y soldados).
    + Autoorganizados: Cada responsabilidad es asumida voluntariamente, cada uno se asigna algo para lo cual se siente capaz.
+ Comunicación intensiva: Analogía con el rozamiento en la fisica. La principal virtud y el principal detrimento.
+ Minimalismo: Presindencia de modelado, y minimalismo también a nivel de codigo. Confiar en el conocimiento de los otros, no hace falta modelar todo si ya sabemos lo que es un sistema de tres capas, un Singleton...
+ Todos los procesos son incrementales e iterativos. La proxima vamos a intentar desechar lo menos posible.
+ Capacidad adaptativa, rapida respuesta al cambio. Estar abierto al cambio como desarrollador, pero no dejarse aprovechar, todo cambio tiene un costo para el cliente.

## Principios del manifiesto ágil

Los principios dan forma, bajan a tierra a los valores.

**Nuestra mayor prioridad es satisfacer al cliente mediante la entrega temprana y continua de software con valor**

¿De donde saco la plata para pagarle a mis empleados?

+ Un prestamo.
+ Aportes de capital. Vender acciones. La podes hacer una vez, no vas a vender toda la compañia.
+ Vender activos (eh?)
+ Que el cliente provea, tirarle el problema bien. **Se logra con producto**, con la que el cliente ya puede generar guita. El cliente solo te va a dar plata si piensa que puede recuperar la inversión. Mis honorarios salen de las nuevas ganancias, para el cliente es practicamente gratis, y todos contentos.

**Aceptamos que los requisitos cambien, incluso en etapas tárdias del desarrollo. Los MA aprovechan el cambio para proporcionar ventaja competitiva al cliente**

¿Por que cambiamos? El cliente esta contento de que siempre le digan que si. 

¿Para que enojarse porque vamos a introducir cambios? Si igual nos van a pagar...

**Las entregas se hacen entre dos semanas y dos meses**

Este ciclo depende del negocio, distintos negocios cobran más en distintos momentos (ej.: Comercio es a principio de mes, cuando la gente tiene plata). Uno entrega cuando estos negocios en el momento donde ingresan guita, hay una mayor predisposición a pagar.

Existen metodologias donde los ciclos son de paso fijo, otras de variable. El acuerdo es no pasarse de los dos meses, porque sino empieza a parecerse a un metodo predictivo, los planes ya no serían a corto plazo.

Si hicimos poco, el dinero perdido es poco si hubo un error de parte nuestra o si cambiaron las reglas de negocio.

**Los responsables de negocio y los desarrolladores trabajamos juntos de forma cotidiana durante todo el proyecto**

Funciona cuando las relaciones son interempresarias (obviamente no son competidoras, una es la empresa de software y la otra). Cuando es intraempresaria, dentro de una misma empresa hay competencia, todos quieren ser jefes, todos quieren tener credito de lo bueno y despojarse de lo malo.

**Los proyectos se desarrollan en torno a individuos motivados. Hay que darles entorno y apoyo necesario, y confiarles la ejecución del trabajo**

¿Como motivas al equipo?

(Bracalenti piensa que) La motivación es positiva. La gente necesita que les digas que hace las cosas bien. El acostumbrar a la gente a que si hace las cosas bien, algo bueno va a pasar, es más efectivo que las amenazas.

*Dato: $2-2.5k salario de recien recibido*