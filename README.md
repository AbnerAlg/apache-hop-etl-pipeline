# Pipeline ETL Híbrido y Orquestación de Datos con Apache Hop, Docker y PostgreSQL 🐳

Proyecto avanzado de ingeniería de datos desarrollado para la materia de data warehouse en la carrera de Ingeniería de Software (CUUT), diseñado y ejecutado nativamente sobre un entorno **Fedora 43 Workstation**.

##  Descripción del Proyecto
Este proyecto implementa una arquitectura moderna de datos en contenedores para automatizar un flujo ETL híbrido. El sistema extrae información desde una base de datos NoSQL (**MongoDB**), procesa, limpia y transforma los flujos de datos mediante **Apache Hop**, y finalmente modela y carga la información estructurada bajo la metodología Kimball en un almacén de datos relacional (**PostgreSQL**).

##  Stack Tecnológico y Entorno
* **Infraestructura & Contenedores:** Docker 
* **Orquestador / ETL:** Apache Hop (Pipelines `.hpl` y Workflows `.hwf`)
* **Bases de Datos:** PostgreSQL (Relacional) y MongoDB (NoSQL)
* **Diseño y Administración:** pgModeler (Modelado lógico/físico) y pgAdmin
* **Sistemas Operativos:** Fedora 43 (Linux)

##  Arquitectura de Infraestructura (Microservicios)
Todo el ecosistema se despliega de manera aislada y automatizada mediante contenedores:
* `contenedor-postgres`: Almacén de datos final (Data Warehouse).
* `contenedor-mongodb`: Origen de datos no estructurados/semiestructurados.
* `contenedor-apache-hop`: Motor de ejecución de los pipelines y workflows de datos.
* `contenedor-pgadmin`: Entorno web para la administración de PostgreSQL.
