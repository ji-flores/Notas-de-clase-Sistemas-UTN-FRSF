# SQL: Practica

**Usuario:** tf16_user

**Contraseña:** tf135

**BDD:** [190.114.206.177](http://190.114.206.177/phppgadmin)

Guia 03:

```sql
//Ej 11

UPDATE public.taller SET dni_admin = '30000' WHERE codigo = '1'
//No te deja porque dni_admin es una clave unica

//Ej 14
//(Ya con contexto public)
ALTER TABLE maquina RENAME TO maq_celula

```