(se perdió todo hasta acá)

Flag ACK: Podes controlar trafico inbound de manera que entre solo trafico que vos pediste poniendo la configuración en ACK Si. Si no es trafico TCP también lo filtra. El outbound va con Si/No, para poder establecer conexiones.

Acción: Denegar o acpetar, dependiendo de la politica de filtrado por defecto (denegar o aceptar).

### Como configurar reglas de filtrado
+ Se analizan las reglas en el orden que se declaran. Asi, se ejecuta la primera que matchea con el paquete.
+ Los campos son opcionales, salvo sentido e interfaz.

Diferencia entre sentido de flujo entrante/saliente y forwarding. Forwarding: Si llega por esta interfaz y cumple con las reglas, puedo reenviarlo, no importa por qué interfaz.
