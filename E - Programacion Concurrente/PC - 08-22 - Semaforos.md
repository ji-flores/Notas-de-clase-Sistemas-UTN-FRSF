# Semaforos

Todos los algoritmos que vimos hasta ahora son de espera ocupada, es decir, ocupan ciclos de CPU. Aunque, sirvieron para ilustrar los problemas sobre los que trata la programación concurrente.

La mayoría de los sistemas reales utilizan soluciones de mayor nivel.

Los semaforos son una construcción simple, y altamente utilizada. Trabajan con bloqueos de procesos, eliminando el problema de la espera ocupada.

## Definición

Es un tipo de dato asbtracto, que cuenta con las operaciones `wait()` (originalmente P) y `signal()` (originalmente V).

### Representación

```c
int V;
conjunto<procesos> L;
```

### Operación wait()

```
wait(semaphore S){
    if(S.V > 0){
        S.V := S.V-1
    }
    else{
        S.L.add(p) //p: Proceso que invoca wait()
    }
}
```

(...)

## Semaforos Fuertes

Los semaforos definidos hasta el momento se los llama semaforos debiles, ya que al trabajar con una estuctura de conjunto y no tener un orden en el que se liberan los procesos. Usar una cola FIFO para la estrucutra de espera soluciona este problema donde un proceso