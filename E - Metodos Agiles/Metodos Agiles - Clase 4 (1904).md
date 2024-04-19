Debemos asegurar la cobrabilidad del proyecto. Ahí también entra el principio 10, porque a la que hacemos algo de más va a comenzar una discusión sobre si el cliente tenía que pagar por una funcionalidad que el dice no haber pedido.

# Juego de la Planificación en XP

La teoría dice que es un juego no competitivo donde se busca el empate. En la práctica no es así, alguien quiere, y va a salir ganando.

La teoría dice eso porque ambos compartimos un objetivo en el proyecto, y jugamos para obtenerlo. Ya se menciono que si el cliente es un par dentro de nuestra organización (cliente interno), esto no se va a dar porque hay intereses contrapuestos.

Las fichas del juego son las historias de usuario, una descripción en lenguaje coloquial de una funcionalidad deseada por el usuario. El nivel de tecnicismo depende del conocimiento del cliente. Después de un conjunto de reuniones tendremos un conjunto de historias.

Existen muchas plantillas para hacer historias de usuario. Debería usarse la que convenga para cada caso, no casarse con ninguna.

La escribe el cliente, bajo la mirada del desarrollador, que pregunta lo que no tiene claro. De esta manera, se trabaja con lo que escribe el cliente, lo cual es bueno en términos contractuales porque es innegable que lo que está en la historia es el deseo del cliente, al fin y al cabo lo escribió él.

Luego viene una etapa de estimación. Hay muchos métodos, pero se termina usando la experiencia.

Puede usarse votaciones. Si la votación esta muy dispersa, se les pide a los que sobre estiman y a los que subestiman que expongan porque, y luego se vuelve a votar.

Las votaciones se usan para cosas conocidas donde se supone que la mayoría del grupo va a tener una noción (experiencia propia o ajena). Después este conocimiento de extrapola. ¿Cuántas veces más difícil es hacer un subsistema de facturaciones, que hacer un ABM? Se usan potencias de dos, o números de Fibonacci para este factor de multiplicacion.

Luego, hay que tener en cuenta que no todas las horas son horas utiles, de concentración, de ingeniería. ¿Por cada hora real, honestamente, cuantos minutos estoy trabajando? Este factor se calcula como el promedio de cada uno de los miembros del equipo.

Una vez tengo el costo por hora, lo multiplicó por el esfuerzo (en horas hombre).

A eso, se suma un porcentaje (10) de imprevistos, luego le sumo la ganancia del grupo. A eso lo dividimos por la cantidad de Historias y ya tenemos un número para decirle al cliente.

Ámbito: El alcance del sistema.
Prioridad: Explicar que no se puede hacer magia, el cliente puede decir que cierta cosa tiene prioridad, pero hay que hacerle entender que ciertas cosas pueden tener que venir antes.

De vuelta, como se asume que el cliente está in situ para el juego de la planificación, es el talón de Aquiles de XP.

# Pair Programming

+ Todo el código es escrito por parejas de programadores.
+ No debe ser un programador trabajando y el otro mirando. El que no escribe piensa más estratégicamente, revisa el código en tiempo real.
+ Los roles y parejas se debe ir cambiando. Todos deben tocar el código, y de distintas partes del SW.
+ No mezclar seniors y juniors. No es una sesión de aprendizaje, porque sino el senior programa y el otro ceba mate.
+ Fundamentos:

## Pruebas
+ Test Driven Development: Diseño e implementación de las pruebas antes de programar la funcionalidad.
	+ El programador crea sus propios tests de unidad.
+ Integración continua
	+ Integración diaria
	+ Disponer de una máquina para integración.
+ Test funcionales
	+ Con el cliente. De vuelta, asume cliente in situ por ende es complicado.
# Estrategia de planificación
+ Conducir al equipo unido. Es un constante negociar.
+ **Decidir** sobre el ámbito y las prioridades.
+ Estimar el coste y la planificación.
+ Dar a las personas implicadas la garantía de que el sistema puede realmente construirse. Dar ánimos al equipo.
+ Proporcionar un valor de referencia para la realimentación.
# Juego de la Planificación (cont.)

## Fase de compromiso
Clasificar por valor, que es el el valor que tiene para el cliente.

Clasificar por riesgo, que depende del conocimiento del equipo. Puede ser porque las estimaciones son hechas con poca experiencia.

Si lo ves desde la psicología, puede ser mejor hacer las tareas riesgosas al final, ya que al llegar a estas tareas ya generaste una confianza con el cliente al haber trabajado bien con las otras tareas, y es más probable que aguante retrasos.

Otros dicen que es mejor al principio, porque tenés más tiempo para recuperarte.

## Fase de dirección
En XP se admite que las historias se cambien en el medio de una iteración, 

## Fase de exploración
+ Escribir tareas. Ej: Configurar base de datos, diseñar la estética de la pantalla.

# Estrategia de desarrollo