# Repaso de Clase 1
+ Metodos predictivos son muy caros, y necesario si tenemos que hacer sistemas de alto riesgo, y malo para sistemas para empresas pequeñas.
+ Los metodos agiles adolecen del problema de que si hay equipos muy grandes, el postulado de comunicación cara a cara se complica.
+ De los valores se derivan los principios (valor = la vida humana, principio = no portar armas). Las practicas son las cosas que tenemos que hacer.
+ Los principios son comunes a todas las metodologias. Por inducción, en todas las metdologías agiles usan equipos pequeños (salvo Crystal, que sirve poco).
+ La comunicación tiene el problema del ruido.

# Más principios de los métodos ágiles

## 8. Desarrollo sostenible
¿Que significa esto? Bracalenti le dice desarrollo vampiro, "chuparle la sangre al cliente". Significa que lo que nosotros producimos alcanza y sobra para pagar nuestros honorarios. Hago algo para el cliente en poco tiempo, y en el momento que se lo entrego le empieza a generar al cliente ganancia. Esto implica que siempre vayamos haciendo cosas nuevas todo el tiempo. Si esto no se da (un cliente puede hacer algo solo porque la competencia esta haciendo algo), es dificil aplicar MA. La negociacion es sencilla, el dueño sabe que plata va para vos y cuanta queda para él (uno propone: "Yo me llevo cierto porcentaje de las ganancias que hagas", es como que terminas saliendole gratis al cliente, él solo gana menos...)

## 9. Atención excelente
Atender bien al cliente (como quisieramos que nos atiendan a nosotros): "El cliente siempre tiene la razon". El verdadero negocio es pensar como el cliente va a aumentar sus ganancias, el SW es solo un vehiculo.

También, atención a los detalles: "Podemos saber que le SW esta bien, porque el proceso estuvo bien".

"Buen diseño": Más bien, buenas practicas. El buen diseño es una consecuencia de ponerle pila para que salga bie.

## 10. Simplicidad maxima
Maximizar la cantidad de trabajo no hecho. **El más importante**.

"El default es no" ¿Hace falta hacer esto?. Si el cliente no lo pidio, o si lo propusimos y al cliente no le gusto, **no se hace**. La gente no paga por algo que no quiere.

## 11.

*No explico mucho.*

## 12. Equipos autoorganizados
Equipos autogenerados, menos el jefe. Se basa en que haya alguien en un poder real, y el resto del equipo en la misma jerarquia

## 13. Reflexion
Reflexionar sobre las cosas que salieron mal o bien, periodicamente. No buscar culpables. Ej.: Si alguien cae borracho (y no es un comportamiento recurrente), no atacarlo, pero aceptarlo y darle tareas que pueda manejar.

"Juzgar despiadadamente al problema, y aceptar al ser humano". Al que sustituya por un error, lo voy a sustituir por uno que se va a mandar una igual o peor.

*(Grafica de los accidentes en funcion de la experiencia en el trabajo)*

# Metodología XP
Tuvo auge entre 05-12, aprox.

Como sintesis: "XP es una forma ligera, eficiente, de bajo riesgo, predecible y divertida de desarrollar software".

Esta orientado a la programación, es estricto con el testeo y el codeo, pero no especifica mucho en la gestión de proyecto, que si lo es SCRUM, por lo que se usa una combinación de los dos.

De vuelta, nosotros deberiamos aceptar la combinacion de metodologias que más nos sirva dentro del contexto de nuestra organización.

+ Revisión: Todos los programadores cuando terminamos revisamos nuestro codigo. Esto se puede llevar al extremo con alguien más revisando simultaneamente lo que codeo.
+ Pruebas: Se hacen junto con el cliente, lo que obviamente necesita un cliente muy disponible.
+ Diseño: En vez de diseñar, reconstruir. Empezamos con algo que funciona, y se transforma con nuevas ideas.
+ Minimalismo: Hacer lo menos necesario para cumplir con lo que el cliente quiere.
+ Arquitectura: Para explicarle al cliente, buscar alguna metafora para explicar el funcionamiento. Basicamente no hablar con tecnicismos al cliente. El nivel tecnico de la metafora depende del conocimeinto con el cliente (en este caso podría ser un Diagrama de Clases, sigue siendo una metafora de la realidad).
+ Pruebas de integración: Integración continua. "Haces algo, y lo metes a la version final". Va a haber un servidor para integración para probar estas cosas, no va a ser en el servidor en producción.
+ Iteraciones cortas: "Juego de la planificación". Negociación permanente con el cliente.

Dejo de estar en auge por lo que se dijo de la gestión.

### Por que fracasan los proyectos de software?

Son siempre los mismos...

+ Retrasos y desviaciones ne la planificación: La planificación siempre peca de optimista, para nuestra vida, para el trabajo, para todo. Ademas de lo de siempre, la realidad va cambiando y uno eso no lo maneja (el cliente antes importaba y ahora exportaba, el dolar, ...)
+ Coste de mantenimiento elevados: Un codigo puede ser muy rapido, compacto, y todo esto que se considera bueno lo hace siempre más dificil de mantener. Lo más interesante y util es saber encontrar errores.
+ Alta tasa de defectos.
+ Requisitos mal comprendido: Las palabras tienen un significado diferente para cada persona (Brooks).
+ Cambios de negocio: Casi igual a lo primero.
+ Falsa riqueza de caracteristicas: Hacer un monton de cosas hermosas, pero que nadie pidio, entonces esta riqueza es una pantalla.
+ Cambios de personal: Incluso con metodologias clasicas, los proyectos son dependientes de las personas que trabajan y el conocimeinto que tienen del proyecto, es muy dificil explicarle todos los detalles del proyecto a 5 personas nuevas. Encima hoy en día se cambia mucho de trabajo, traido por el home office, hay ofertas de todo el mundo. Siempre va a haber alguien que paga más.

### Soluciones que propone XP.

Retrasos y desviaciones, y cambios en el proyecto. En lugar de trazar un objetivo grande a largo plazo, trazar un conjunto de objetivos chiquitos a corto plazo, y si le erro, corregir es facil. Hay muchas alternativas, podes cobrar el trabajo, dejarlo pasar por confiar en que a la larga va a ser rentable...

Cancelacion del proyecto. Si te cancelan el proyecto y ni hiciste nada, no te pagaron y fuiste. Con entregas periodicas esto se soluciona.

Sistemas deteriorados y defectos: En XP las pruebas se hacen antes de programar, y uno programa basandose en cumplir con estos casos de prueba (metodos orientados por pruebas). Obviamente no es una solución magica, pero genera una buena mejora.

Requisitos mal comprendidos. El cliente dentro del equipo, te das vuelta y podes preguntarle al cliente si lo que estas haciendo esta bien. Que es una utopia, y el talon de aquiles de la metodología: El que te mandan puede no ser el que mas sabe de la organización, tiene que tener tiempo... Ya vamos a ver cual es el workaround para esto.

Falsa riqueza: De vuelta, buena comunicación con el cliente y en base a esta comunicación, solo hacer lo que se acordo.

Suplir cambios de personal animando el contacto y la integración, "siendo buena onda" y todos sabiendo todo sobre el proyecto, y que se vaya uno no va a ser tan dañino. También utopico, si se te van tres integrantes no tiene solución.

XP suma algunos valores (de vuelta, algo visto como algo bueno por una comnidad) a los generales de los MA.

+ Simplicidad.
+ Realimentación: Entre el equipo de trabajo y contra el cliente.
+ Comunicación: Con honestidad (aunque no brutal).
+ Coraje: El más importante. Confiar en las capacidades de uno.

### Rentabilidad en XP
Porque hacemos un proyecto? Para hacer a alguien feliz, comodo, famoso, prestigioso, **por guita**. 

*Se habla en otra clase*.

### Maximizar el valor economico de un proyecto.
Un proyecto podria basarse en:

+ Gastar menos plata. ¿En que ahorro? En lo superfluo. Pero, la mayoride las veces no alcanza y sufris al pedo.
+ Ganar más. Esto si hace mas la diferencia.
+ Gastar más tarde y ganar antes: Intereses. La tarjeta vence el 15 de marzo ¿Porque la pagarias antes? La invertis los dias que te queda y cuando pagas, pagaste menos. "Los periodos de inflacion se transforman en periodos de bonanza. Uno tiene que estar del lado esto".
+ Aumentar la probabilidad de que el proyecto siga vivo: *Se habla en otra clase*.