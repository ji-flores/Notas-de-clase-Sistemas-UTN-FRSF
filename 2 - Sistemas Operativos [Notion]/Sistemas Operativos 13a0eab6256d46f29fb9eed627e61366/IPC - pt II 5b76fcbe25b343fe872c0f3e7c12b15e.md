# IPC - pt. II

# Transferencia de mensajes

Un mensaje tiene un contenido y una suerte de cabecera que tiene un información extra (similar a la información que tiene un sobre)

- **Método general usado para comunicación entre procesos (IPC)**
    - Procesos dentro de un mismo computador.
    - Procesos en distintos computadores.
- Un proceso puede enviar mensajes a un **destino** sea este un **proceso** o un **endpoint** (de donde el proceso receptor lo levanta).
- Dos **primitivas**:
    - `send(destination,message)`
    - `received(source,message)`
    
    *(puede haber variantes, pero estas son las únicas que no varían)*
    
- Pueden ser **bloqueantes** o **no bloqueantes**.
    - Bloqueantes:
        - 
    - No bloqueantes
        - Send: Mensaje de error.
    - Bloqueantes pero con limite de tiempo
        - No pudo enviarse un mensaje, pero después de un tiempo siguen ejecutandose.

## Rendezvous (principio de cita) (Clasif.: del SO)

- Los dos procesos deben encontrarse:
    - El emisor se bloquea hasta que el receptor recibe el mensaje.
    - El receptor se bloquea hasta que el emisor envía un mensaje.
- Realizado el encuentro el mensaje es intercambiado y ambos procesos desbloqueados.
- Permite sincronizar emisor y receptor.

Analogía: Llamada telefónica.

## Buzones (Clasif.: del SO)

- **Buzón:** Estructura que administra el SO.

**Receptor:**

- El receptor tiene un buzón (port, socket, cola de msj.) al cual son enviados los mensajes. En general es una cola FIFO.
- Cada receive() extrae un mensaje del buzón.
    - El proceso receptor se bloquea si no hay mensaje en el buzón.

**Emisor:**

- El send() deposita un mensaje en el buzón
    - El proceso emisor se bloquea si el buzón esta lleno.

---

- Un buzón puede ser privado o compartido con varios receptores (**Mailbox**)
- Un **port** es un buzon asociado a un unico receptor y multiples emisores. Un port es creado por el receptor y desaparece cuando este finaliza, ya no tiene sentido.

![Untitled](IPC%20-%20pt%20II%205b76fcbe25b343fe872c0f3e7c12b15e/Untitled.png)

Para clientes y servidores se puede implementar este sistema con un *mailbox* y un *port* propio para cada cliente. Hay una caída de performance, pero sigue funcionando.

![Untitled](IPC%20-%20pt%20II%205b76fcbe25b343fe872c0f3e7c12b15e/Untitled%201.png)

## Direccionamiento

- **Directo:**
    - Cuando se usa el PID para identificar el emisor/destino del mensaje.
    - Puede ser imposible determinar en forma especifica el posible origen de un mensaje.
    
    Relacionado con rendezvous.
    
- **Indirecto:**
    - Los mensajes son enviados a un buzón
    - El receptor obtiene los mensajes del buzón
    - Da tolerancia a fallos simplemente cambiando el receptor sin que el emisor se entere.
    
    Relacionado con buzones.
    

## Tipos de transferencia

- **Sin almacenamiento intermedio (rendezvous)**
    - SO no dedica espacio al mecanismo de comunicación.
    - Emisor y receptor deben sincronizarse.
    - SO copia directamente desde buffer del emisor al receptor.
- **Con almacenamiento interno (buzones)**
    - SO dedica espacio al mecanismo de comunicación
    - Asincronía entre emisor y receptor.
    - Envío de mensaje: Copia desde almacén a buffer del receptor.
    - Más flexible pero menos eficiente.

## Productor/Consumidor con buzones

![Untitled](IPC%20-%20pt%20II%205b76fcbe25b343fe872c0f3e7c12b15e/Untitled%202.png)

Recibe mensaje (si no hay, se bloquea) → Manda mensaje vacio (o contenedor) a productor → Consume mensaje.

Recibe contenedor (si no hay, bloquea) → Produce mensaje → Envía mensaje (si buzón lleno, se bloquea.

Entonces:

- El productor tiene un **buzón de permisos** (permisos para enviar mensajes)
- El consumidor tiene un **buzon de mensajes.**

## Equivalencia de primitivas

Implementar una solución usando la otra.

### Rendezvous con Semáforo

```c
//DST = Destinatario, SRC = "Source" o emisor.
//Todos los semaforos se inicializan en 0
send(DST,&msg){
		down(PID/*de SRC*/); //Cada proceso tiene un semaforo donde solo él se va a bloquear
		down(mutex); //Proteger la region de memoria
		copy_msg(DST,&msg);
		up(mutex);
		up(DST);
}

receive(SRC,&msg){
	up(SRC);
	down(PID/*de DST*/);
}
```

### Rendezvous con Pipes

Igual que con semáforo, pero las pipes las maneja el SO.

### Buzones con Semáforos

Mismo problema que productor y consumidor!

```c
send(buzon,&msg){
	down(empty[buzon]); //Vector de semaforos, representa la cantidad de espacios VACIOS en "buzon"
	down(mutex)
	copy_to_mbx(buzon,&msg);
	up(mutex);
	up(full[buzon]); //Vector de semaforos, representa la cantidad de espacios LLENOS en "buzon"
	down(mutex)
}

receive(buzon,&msg){
	down(full[buzon]);
	down(mutex);
	copy_form_mbx(buzon,&msg);
	up(mutex);
	up(empty[buzon]);
}
```

Tener un solo mutex es algo ineficiente: Si se baja el mutex **ningún** buzón puede ser accedido, cuando en realidad esto no es necesario. Solo debería protegerse el buzón al que se está accediendo.

### Barreras con Semáforos

Solución para muchas barreras, por eso el vector de barreras `mutex[B]` , y un contador por que **no hay primitivas para saber el valor del semáforo, es una CAJA NEGRA**.

```c
int count[B] = 0;
Barrier(B,C) {
	down(mutex[B]);
//Count es una variable compartida, debemos proteger la region critica con un mutex
	count[B] = count[B] + 1;
//Este nuevo proceso que llega es el N+1 de los procesos en la barrera
	if(count[B] < C) { //Si todavia no se llego al tope de la barrera
		up(mutex[B]);
//Salgo de la RC, sino me estaría bloqueando en la región critica y FALLA TODO (todos se bloquean eventualemtente)
		down(waiting[B]); //Proceso
		}
	else 	{
		count[B] = count[B] - 1;
		while(count[B] > 0) {
			count[B] = count[B] - 1;
			up(waiting[B]);
			}
		up(mutex[B]);
		}
```

### Monitores con Semáforos

Los monitores en general se implementan por semáforos.

![Untitled](IPC%20-%20pt%20II%205b76fcbe25b343fe872c0f3e7c12b15e/Untitled%203.png)

(acá deberia explicar cada pseudocodigo)