-- ** Database generated with pgModeler (PostgreSQL Database Modeler).
-- ** pgModeler version: 1.2.2
-- ** PostgreSQL version: 18.0
-- ** Project Site: pgmodeler.io
-- ** Model Author: ---

-- ** Database creation must be performed outside a multi lined SQL file. 
-- ** These commands were put in this file only as a convenience.

-- object: "Click" | type: DATABASE --
-- DROP DATABASE IF EXISTS "Click";
CREATE DATABASE "Click";
-- ddl-end --


SET search_path TO pg_catalog,public;
-- ddl-end --

-- object: public.fact_ventas | type: TABLE --
-- DROP TABLE IF EXISTS public.fact_ventas CASCADE;
CREATE TABLE public.fact_ventas (
	id_venta serial NOT NULL,
	cantidad numeric,
	total_venta numeric,
	id_tiempo integer,
	id_hora smallint,
	id_producto integer,
	id_pago integer,
	id_pais_envio integer

);
-- ddl-end --
COMMENT ON TABLE public.fact_ventas IS E'Se almacenan las llaves primarias de cada dimension de las tablas del proyecto Click';
-- ddl-end --
COMMENT ON COLUMN public.fact_ventas.id_venta IS E'es la id de la fact de ventas';
-- ddl-end --
ALTER TABLE public.fact_ventas OWNER TO postgres;
-- ddl-end --

-- object: public.dim_tiempo | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_tiempo CASCADE;
CREATE TABLE public.dim_tiempo (
	id_tiempo serial NOT NULL,
	fecha date NOT NULL,
	anio integer,
	trimestre smallint,
	mes smallint,
	nombre_mes varchar(20),
	semana smallint,
	dia smallint,
	nombre_dia varchar(20),
	es_fin_semana boolean,
	es_semana_santa boolean,
	anio_fiscal integer,
	CONSTRAINT pk_dim_tiempo PRIMARY KEY (id_tiempo)
);
-- ddl-end --
COMMENT ON TABLE public.dim_tiempo IS E'Almacena los datos del tiempo para el caso click';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.id_tiempo IS E'Llave primaria para tiempo';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.fecha IS E'Almacena la fecha';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.anio IS E'Almacena el año';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.trimestre IS E'Almacena el trimestre';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.mes IS E'ALmacena el mes';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.nombre_mes IS E'Almacena el nombre del mes (EJ. Febrero, Marzo)';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.semana IS E'Almacena la semana';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.dia IS E'Almacena el dia en numero';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.es_fin_semana IS E'Almacena si es o no fin de samana';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.es_semana_santa IS E'Almacena si es o no semana santa';
-- ddl-end --
COMMENT ON COLUMN public.dim_tiempo.anio_fiscal IS E'Almacena si el año es fiscal';
-- ddl-end --
ALTER TABLE public.dim_tiempo OWNER TO postgres;
-- ddl-end --

-- object: public.dim_produto | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_produto CASCADE;
CREATE TABLE public.dim_produto (
	id_producto serial NOT NULL,
	categoria varchar(100),
	subcategoria varchar(100),
	marca varchar(100),
	proveedor varchar(100),
	sku varchar(100),
	nombre_producto varchar(200),
	CONSTRAINT pk_dim_producto PRIMARY KEY (id_producto)
);
-- ddl-end --
COMMENT ON COLUMN public.dim_produto.id_producto IS E'Llave primaria del producto';
-- ddl-end --
COMMENT ON COLUMN public.dim_produto.categoria IS E'Almacena la categoria';
-- ddl-end --
COMMENT ON COLUMN public.dim_produto.subcategoria IS E'Almacena la subcategoria del producto';
-- ddl-end --
COMMENT ON COLUMN public.dim_produto.marca IS E'Almacena la marca del producto';
-- ddl-end --
COMMENT ON COLUMN public.dim_produto.proveedor IS E'Almacena el nombre del proveedor';
-- ddl-end --
COMMENT ON COLUMN public.dim_produto.sku IS E'Almacena el sku';
-- ddl-end --
COMMENT ON COLUMN public.dim_produto.nombre_producto IS E'Almacena el nombre del producto';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dim_producto ON public.dim_produto IS E'Almacena la llave primaria con el constrain de dim_producto';
-- ddl-end --
ALTER TABLE public.dim_produto OWNER TO postgres;
-- ddl-end --

-- object: public.dim_pais_envio | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_pais_envio CASCADE;
CREATE TABLE public.dim_pais_envio (
	id_pais_envio serial NOT NULL,
	pais varchar(80),
	estado varchar(80),
	ciudad varchar(80),
	region varchar(80),
	CONSTRAINT pk_dim_pais_envio PRIMARY KEY (id_pais_envio)
);
-- ddl-end --
COMMENT ON TABLE public.dim_pais_envio IS E'Almacena el país de envio para cada producto';
-- ddl-end --
COMMENT ON COLUMN public.dim_pais_envio.pais IS E'ALmacena el nombre del pais';
-- ddl-end --
COMMENT ON COLUMN public.dim_pais_envio.estado IS E'Almacena el nombre del estado para su envio';
-- ddl-end --
COMMENT ON COLUMN public.dim_pais_envio.ciudad IS E'Almacena la ciudad';
-- ddl-end --
COMMENT ON COLUMN public.dim_pais_envio.region IS E'Almacena la region del envio';
-- ddl-end --
COMMENT ON CONSTRAINT pk_dim_pais_envio ON public.dim_pais_envio IS E'Almacena la llave primaria de la tabla de dim pais envio';
-- ddl-end --
ALTER TABLE public.dim_pais_envio OWNER TO postgres;
-- ddl-end --

-- object: public.dim_pago | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_pago CASCADE;
CREATE TABLE public.dim_pago (
	id_pago serial NOT NULL,
	pais_pago varchar(80),
	tipo_pago varchar(30),
	institucion_bancaria_pago varchar(100),
	nombre_tarjeta_pago varchar(100),
	CONSTRAINT pk_dim_pago PRIMARY KEY (id_pago)
);
-- ddl-end --
COMMENT ON TABLE public.dim_pago IS E'Almacena los datos para la tabla de dim pago';
-- ddl-end --
COMMENT ON COLUMN public.dim_pago.id_pago IS E'Llave primaria de dim pago';
-- ddl-end --
COMMENT ON COLUMN public.dim_pago.pais_pago IS E'Almacena el pais del pago';
-- ddl-end --
COMMENT ON COLUMN public.dim_pago.tipo_pago IS E'Se almacena el dim de pago';
-- ddl-end --
COMMENT ON COLUMN public.dim_pago.institucion_bancaria_pago IS E'ALmacena el tipo de banco para hacer apgo';
-- ddl-end --
COMMENT ON COLUMN public.dim_pago.nombre_tarjeta_pago IS E'Almacena el nombre registrado para la tarjeta de pago';
-- ddl-end --
ALTER TABLE public.dim_pago OWNER TO postgres;
-- ddl-end --

-- object: public.dim_hora | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_hora CASCADE;
CREATE TABLE public.dim_hora (
	id_hora serial NOT NULL,
	hora_24 varchar(25),
	hora_completa varchar(25),
	segmento_hora varchar(50),
	periodo_hora varchar(50),
	descripcion_hora varchar(50),
	CONSTRAINT pk_dim_hora PRIMARY KEY (id_hora)
);
-- ddl-end --
COMMENT ON TABLE public.dim_hora IS E'ALmacena los datos de la hora';
-- ddl-end --
COMMENT ON COLUMN public.dim_hora.id_hora IS E'Llave primaria de la hora';
-- ddl-end --
COMMENT ON COLUMN public.dim_hora.hora_24 IS E'Almacena la hora en formato de 24 horas';
-- ddl-end --
COMMENT ON COLUMN public.dim_hora.hora_completa IS E'Almacena la hora completa';
-- ddl-end --
COMMENT ON COLUMN public.dim_hora.segmento_hora IS E'ALmacena el segmento de la hora';
-- ddl-end --
COMMENT ON COLUMN public.dim_hora.periodo_hora IS E'Almacena el periodo de hora';
-- ddl-end --
COMMENT ON COLUMN public.dim_hora.descripcion_hora IS E'ALmacena la descripcion de la hora';
-- ddl-end --
ALTER TABLE public.dim_hora OWNER TO postgres;
-- ddl-end --

-- object: fk_fact_ventas_dim_tiempo | type: CONSTRAINT --
-- ALTER TABLE public.fact_ventas DROP CONSTRAINT IF EXISTS fk_fact_ventas_dim_tiempo CASCADE;
ALTER TABLE public.fact_ventas ADD CONSTRAINT fk_fact_ventas_dim_tiempo FOREIGN KEY (id_tiempo)
REFERENCES public.dim_tiempo (id_tiempo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_fact_ventas_dim_hora | type: CONSTRAINT --
-- ALTER TABLE public.fact_ventas DROP CONSTRAINT IF EXISTS fk_fact_ventas_dim_hora CASCADE;
ALTER TABLE public.fact_ventas ADD CONSTRAINT fk_fact_ventas_dim_hora FOREIGN KEY (id_hora)
REFERENCES public.dim_hora (id_hora) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_fact_ventas_dim_producto | type: CONSTRAINT --
-- ALTER TABLE public.fact_ventas DROP CONSTRAINT IF EXISTS fk_fact_ventas_dim_producto CASCADE;
ALTER TABLE public.fact_ventas ADD CONSTRAINT fk_fact_ventas_dim_producto FOREIGN KEY (id_producto)
REFERENCES public.dim_produto (id_producto) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_fact_ventas_dim_pago | type: CONSTRAINT --
-- ALTER TABLE public.fact_ventas DROP CONSTRAINT IF EXISTS fk_fact_ventas_dim_pago CASCADE;
ALTER TABLE public.fact_ventas ADD CONSTRAINT fk_fact_ventas_dim_pago FOREIGN KEY (id_pago)
REFERENCES public.dim_pago (id_pago) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_fact_ventas_dim_pais_envio | type: CONSTRAINT --
-- ALTER TABLE public.fact_ventas DROP CONSTRAINT IF EXISTS fk_fact_ventas_dim_pais_envio CASCADE;
ALTER TABLE public.fact_ventas ADD CONSTRAINT fk_fact_ventas_dim_pais_envio FOREIGN KEY (id_pais_envio)
REFERENCES public.dim_pais_envio (id_pais_envio) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


