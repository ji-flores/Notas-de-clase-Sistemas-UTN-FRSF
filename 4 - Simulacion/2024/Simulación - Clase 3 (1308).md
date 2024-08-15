# Clase 3, 13/08

+ [Muro para ver dudas](https://padlet.com/rosanaportillotsti/simulaci-n2024-unidad-1-fv6fa5u03lrfyro4). Disponible hasta el 20 de Agosto.
+ [Ejercicio no obligatorio](https://forms.office.com/pages/responsepage.aspx?id=9ovUgqRUi0m4fTCTVfHH8h4tEITeJSRBgMX5Tm-UclpUOU05MEhRTDdKOUEwMDZYQlRWRkhJT1NRRi4u).

También ya esta publicada la actividad de seguimiento, fecha de entrega 22/08.

## Repaso Clase 2

+ La disciplina de la cola es la politica con que se atienden a las entidades que estan esperando. Ej.: LIFO, FIFO, Aleatorio, con Prioridades.
+ Capacidad: Numero maximo de unidades que puden albergar la cola.
+ Estadisticos de interes: N° promedio, maximo o minimo de entidades en la cola, tiempo de espera maximo o promedio, tiempo de atención maximo o promedio, tiempo en el sistema promedio, porcentaje de ocupación del servidor.

Existen modelos formales como el de Poisson:

1. Los tiempos entre arribos de servicio tenen distribución de probabilidad exponencial.
2. Se supone el estado estable para el modelo funcionando en forma continua, no se sabe que sucede desde el estado inicial hasta inicio del estado estable.
3. Se supone que las velocidades de arribos...

## Practica Simulación Manual de Colas

+ Tener en cuenta cuantas entidades se toman para las metricas, no podes tomar entidades que no terminaron el "proceso" por el que se esta preguntando, sea la espera en cola, la atención en el servidor, o la estadía total en el sistema. *Nota: Mirar diapositiva para entender a que se refiere esto.*
  + Una excepción quiza es el porcentaje de utilización del servidor, que se toma también el tiempo de atención que se sigue contando al momento de cerrar la simulación, correspondiente a la entidad siendo atendida en ese momento.

### Cantidad promedio de clientes en cola

Para calcular el numero promedio de entidades en cola, necesitamos saber la cantidad de tiempo que se observó un valor. Ponderamos el valor de la observación por la cantidad de tiempo que persiste el valor.

(Es como hacer una integral para calcular el valor medio).

+ Se tabulan los intervalos de tiempos donde persiste un valor de cantidad de entidades en cola, y el valor mismo.
  + Para encontrar estos "pasos" de intervalo han de mirarse los instantes donde llega una entidad a la cola, sale una entidad de la cola (que puede ser porque la atiende el servidor o porque se retira del sistema).

*Nota: Es basicamente la frecuencia acumulada promedio?*
