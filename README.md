##  Arquitectura del Proyecto y Modelado de Datos
El proyecto no solo incluye la automatización del pipeline, sino todo el ciclo de diseño de inteligencia de negocios:

1. **Modelado Dimensional (Kimball):** Diseño de la arquitectura del Data Warehouse siguiendo la metodología Kimball (Tablas de Hechos y Dimensiones) para optimizar las consultas analíticas.
2. **Diseño de Base de Datos:** Modelado lógico y físico reflejado en el archivo `.dbm` e implementación del esquema en **PostgreSQL** mediante scripts estructurados de SQL.
3. **Diccionario de Datos:** Documentación completa de tipos de datos, restricciones y descripciones de cada entidad en el almacén de datos.
4. **Orquestación ETL:** Extracción, transformación y carga limpia de los datos mediante flujos visuales en **Apache Hop**.
