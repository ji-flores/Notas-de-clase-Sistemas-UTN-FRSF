Herramienta cloud para logear metricas: Datadog
Instalar Datadog

Que puedo no probar?

+ Librerias externas o cosas que ya esten muy probadas en general. Una liberia externa OpenSource podría no estar bien probada.
+ Algo muy poco critico.

Ademas de pruebas funcionales y de integración --> Pruebas no funcionales (ver bibliografía de Diseño, por ejemplo). Estres (cargas masivas de datos, por ej.), Seguridad, Performance, Usabilidad, Escalabilidad, Concurrencia, Seguridad

Pruebas de usabilidad: Generalmente alguien que no tiene nada que ver y que no usa generalmente SW de esas caracteristicas. Para donde lleva el cursor, cuantos clicks hace?

Pruebas funcionales: A caja blanca (walkthrough del codigo), a caja negra (unit test, pruebas funcionales guiadas por casos de prueba(*)).

(*) Pruebo un modulo completo a nivel de usuario, se pueden automatizar también: Scriptear a nivel macro las acciones que realizarias y darselas a un "robot". Dos grupos: RPA, Automation

RPA: Orientado a proceso, sin codificar. Ej: UiPath RPA. Script para sacar entradas, cargar facturas, etc...
Automation: Orientado a codigo. "Se mete" en el codigo HTML. Ej.: Selenium. Pros: Es mas potente que un RPA. Contras: Cada cambio en la pagina rompe el test hecho con la herramienta.

## Pruebas de concurrencia

Para probar automaticamente, necesito que el SW exponga una API.

Herramientas: Rest Clients.

## Pruebas de segruidad

Hay herramientas de caja abierta: Revisan el codigo por vulnerabilidades.

Pruebas también de caja negra.

## UAT (User Acceptance Test)

Despues de todas estas pruebas, hay un tipo de prueba, que de alguna manera es funcional, llamada prueba de sign-off o de aceptación.

Al principal stakeholder se le presenta el SW, y este checkea que todas sus necesidades esten reflejadas en el producto.

### Cuando es muy importante?

Cuando el dominio sobre el que estas desarrollando es muy conocido por mi, el desarrollador, pero mucho por el usuario. Sistema de bonificación de servicios digitales (???, Como funciona, cuanta plata le das cuando alguien se queja, ...)

### UAT o Integración primero?

UAT primero pros

+ Si hacemos las pruebas UAT primero, nos ahorramos el problema de tener que repetir toda la integración si sale algo mal, y ya hicimos integración

UAT primero cons

+ Si el programa tiene fallas, quedamos muy mal si esa persona dejo de trabajar.
	+ Si hay personas especialmente contratadas para trabajar con la SW factory, no hay problema.

### Casos de prueba

En el plan de pruebas se define si esto lo hace el equipo de desarrollo, el equipo del cliente o en conjunto.

1. Pasos
2. Resultado esperado.
3. Resultado final.

Si el resultado esperado y resultado final son distintos. Registro un ISSUE. Registrar en herramienta de gestión de incidentes. Gestión: Coordinar esfuerzos para lograr un resultado, en este caso resolver el incidente. Junto con ellos puedo sacar metricas, issues generados por dia, issues resueltos por día.

### Criterios de inicio y finalización

No podemos tener al cliente para siempre probando. Eventualmente queremos tener un resultado.

Criterio de iniciacion: Que el SW este en cierto estado. Ej.: SW en un entorno de prueba probado con carga "realista". Casos de Prueba definidos en su totalidad.

Criterio de finalización: Ejecución de casos de prueba, 95% de los casos de prueba y todos los criticos, y combinar eso con cantidad de incidentes

Criterio de aceptación: Cierto porcentaje de casos de prueba / cierto porcentaje de incidentes, con cierta criticidad

---

Las distintas cosas no funcionales compiten entre ellas, seguridad, escalabilidad, usabilidad. Las pruebas no funcionales de aceptación se realizan de otra manera. Son llamadas pruebas de evaluación de arquitectura. Generalmente 
