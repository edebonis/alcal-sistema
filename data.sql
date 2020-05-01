--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _alcal_carrera; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_carrera (
    id smallint,
    nombre character varying(38) DEFAULT NULL::character varying,
    modalidad character varying(2) DEFAULT NULL::character varying,
    anios smallint
);


ALTER TABLE public._alcal_carrera OWNER TO rebasedata;

--
-- Name: _alcal_cuota; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_cuota (
    id character varying(1) DEFAULT NULL::character varying,
    fecha_pago character varying(1) DEFAULT NULL::character varying,
    pagada character varying(1) DEFAULT NULL::character varying,
    importe character varying(1) DEFAULT NULL::character varying,
    nombre_cuota_id character varying(1) DEFAULT NULL::character varying,
    estudiante_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_cuota OWNER TO rebasedata;

--
-- Name: _alcal_curso; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_curso (
    id smallint,
    anio smallint,
    division character varying(1) DEFAULT NULL::character varying,
    cursonombre character varying(2) DEFAULT NULL::character varying,
    cursosiguiente_id character varying(2) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_curso OWNER TO rebasedata;

--
-- Name: _alcal_docente; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_docente (
    persona_ptr_id smallint,
    numero_de_registro character varying(1) DEFAULT NULL::character varying,
    activo smallint,
    antiguedad_anios character varying(1) DEFAULT NULL::character varying,
    antiguedad_meses character varying(1) DEFAULT NULL::character varying,
    anio_ingreso character varying(1) DEFAULT NULL::character varying,
    profesion character varying(1) DEFAULT NULL::character varying,
    nombre_corto character varying(1) DEFAULT NULL::character varying,
    foto_perfil character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_docente OWNER TO rebasedata;

--
-- Name: _alcal_docente_carrera_docente; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_docente_carrera_docente (
    id character varying(1) DEFAULT NULL::character varying,
    docente_id character varying(1) DEFAULT NULL::character varying,
    carrera_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_docente_carrera_docente OWNER TO rebasedata;

--
-- Name: _alcal_documentacion; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_documentacion (
    id character varying(1) DEFAULT NULL::character varying,
    nombre character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_documentacion OWNER TO rebasedata;

--
-- Name: _alcal_estudiante; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_estudiante (
    legajo smallint,
    persona_ptr_id smallint,
    activx smallint,
    orden smallint,
    libro character varying(1) DEFAULT NULL::character varying,
    folio character varying(1) DEFAULT NULL::character varying,
    anio_ingreso smallint,
    grupo_tec character varying(1) DEFAULT NULL::character varying,
    ficha_de_inscripcion character varying(1) DEFAULT NULL::character varying,
    foto_dni_estudiante character varying(1) DEFAULT NULL::character varying,
    foto_dni_estudiante_archivo character varying(1) DEFAULT NULL::character varying,
    foto_dni_responsable character varying(1) DEFAULT NULL::character varying,
    partida_de_nacimiento character varying(1) DEFAULT NULL::character varying,
    vacunas character varying(1) DEFAULT NULL::character varying,
    certificado character varying(1) DEFAULT NULL::character varying,
    url_foto character varying(66) DEFAULT NULL::character varying,
    archivo_de_seguimiento character varying(98) DEFAULT NULL::character varying,
    vinculo character varying(1) DEFAULT NULL::character varying,
    porcentaje_beca character varying(1) DEFAULT NULL::character varying,
    adeuda_id character varying(1) DEFAULT NULL::character varying,
    curso_id smallint,
    responsable_id character varying(1) DEFAULT NULL::character varying,
    foto_perfil character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_estudiante OWNER TO rebasedata;

--
-- Name: _alcal_faltas; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_faltas (
    id smallint,
    cantidad numeric(3,2) DEFAULT NULL::numeric,
    fecha character varying(1) DEFAULT NULL::character varying,
    estudiante_id smallint
);


ALTER TABLE public._alcal_faltas OWNER TO rebasedata;

--
-- Name: _alcal_fechaaltabaja; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_fechaaltabaja (
    id character varying(1) DEFAULT NULL::character varying,
    fecha character varying(1) DEFAULT NULL::character varying,
    tipo character varying(1) DEFAULT NULL::character varying,
    estudiante_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_fechaaltabaja OWNER TO rebasedata;

--
-- Name: _alcal_inasistencia; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_inasistencia (
    id smallint,
    fecha character varying(1) DEFAULT NULL::character varying,
    curso_id smallint,
    estudiante_id smallint,
    tipo smallint,
    turno smallint
);


ALTER TABLE public._alcal_inasistencia OWNER TO rebasedata;

--
-- Name: _alcal_inscripcionpendiente; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_inscripcionpendiente (
    id character varying(1) DEFAULT NULL::character varying,
    mesa_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_inscripcionpendiente OWNER TO rebasedata;

--
-- Name: _alcal_inscripcionpendiente_pendiente; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_inscripcionpendiente_pendiente (
    id character varying(1) DEFAULT NULL::character varying,
    inscripcionpendiente_id character varying(1) DEFAULT NULL::character varying,
    pendiente_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_inscripcionpendiente_pendiente OWNER TO rebasedata;

--
-- Name: _alcal_materia; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_materia (
    id smallint,
    nombre character varying(42) DEFAULT NULL::character varying,
    taller smallint,
    carga_horaria smallint,
    carrera_id smallint,
    curso_id smallint,
    docente_provisional_id character varying(1) DEFAULT NULL::character varying,
    docente_suplente_id character varying(1) DEFAULT NULL::character varying,
    docente_titular_id smallint
);


ALTER TABLE public._alcal_materia OWNER TO rebasedata;

--
-- Name: _alcal_mesapendiente; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_mesapendiente (
    id character varying(1) DEFAULT NULL::character varying,
    fecha character varying(1) DEFAULT NULL::character varying,
    materia_id character varying(1) DEFAULT NULL::character varying,
    periodo_id character varying(1) DEFAULT NULL::character varying,
    docente_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_mesapendiente OWNER TO rebasedata;

--
-- Name: _alcal_nombrecuota; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_nombrecuota (
    id character varying(1) DEFAULT NULL::character varying,
    nombre character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_nombrecuota OWNER TO rebasedata;

--
-- Name: _alcal_nota; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_nota (
    id character varying(1) DEFAULT NULL::character varying,
    numero character varying(1) DEFAULT NULL::character varying,
    instancia character varying(1) DEFAULT NULL::character varying,
    curso_id character varying(1) DEFAULT NULL::character varying,
    materia_id character varying(1) DEFAULT NULL::character varying,
    estudiante_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_nota OWNER TO rebasedata;

--
-- Name: _alcal_notaparcial; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_notaparcial (
    id smallint,
    nota smallint,
    curso_id smallint,
    materia_id smallint,
    estudiante_id smallint
);


ALTER TABLE public._alcal_notaparcial OWNER TO rebasedata;

--
-- Name: _alcal_notapendiente; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_notapendiente (
    id character varying(1) DEFAULT NULL::character varying,
    nota character varying(1) DEFAULT NULL::character varying,
    mesa_id character varying(1) DEFAULT NULL::character varying,
    pendiente_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_notapendiente OWNER TO rebasedata;

--
-- Name: _alcal_notificacion; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_notificacion (
    id character varying(1) DEFAULT NULL::character varying,
    notificacion character varying(1) DEFAULT NULL::character varying,
    fecha character varying(1) DEFAULT NULL::character varying,
    tipo character varying(1) DEFAULT NULL::character varying,
    informante_id character varying(1) DEFAULT NULL::character varying,
    estudiante_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_notificacion OWNER TO rebasedata;

--
-- Name: _alcal_padre; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_padre (
    persona_ptr_id character varying(1) DEFAULT NULL::character varying,
    profesion character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_padre OWNER TO rebasedata;

--
-- Name: _alcal_pendiente; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_pendiente (
    id character varying(1) DEFAULT NULL::character varying,
    materia_id character varying(1) DEFAULT NULL::character varying,
    estudiante_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_pendiente OWNER TO rebasedata;

--
-- Name: _alcal_periodo; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_periodo (
    id character varying(1) DEFAULT NULL::character varying,
    nombre character varying(1) DEFAULT NULL::character varying,
    fecha_inicio character varying(1) DEFAULT NULL::character varying,
    fecha_fin character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_periodo OWNER TO rebasedata;

--
-- Name: _alcal_persona; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_persona (
    id smallint,
    apellido character varying(23) DEFAULT NULL::character varying,
    nombre character varying(26) DEFAULT NULL::character varying,
    fnac character varying(1) DEFAULT NULL::character varying,
    tipo character varying(3) DEFAULT NULL::character varying,
    num_dni character varying(1) DEFAULT NULL::character varying,
    domicilio_calle character varying(30) DEFAULT NULL::character varying,
    domicilio_numero character varying(1) DEFAULT NULL::character varying,
    telefono_1 character varying(43) DEFAULT NULL::character varying,
    telefono_2 character varying(1) DEFAULT NULL::character varying,
    telefono_3 character varying(1) DEFAULT NULL::character varying,
    genero character varying(9) DEFAULT NULL::character varying,
    observacion character varying(1) DEFAULT NULL::character varying,
    email character varying(41) DEFAULT NULL::character varying,
    pais_de_nacimiento character varying(2) DEFAULT NULL::character varying,
    usuario_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._alcal_persona OWNER TO rebasedata;

--
-- Name: _alcal_seguimiento; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_seguimiento (
    id smallint,
    notificacion character varying(21) DEFAULT NULL::character varying,
    fecha character varying(1) DEFAULT NULL::character varying,
    tipo character varying(19) DEFAULT NULL::character varying,
    estudiante_id smallint
);


ALTER TABLE public._alcal_seguimiento OWNER TO rebasedata;

--
-- Name: _alcal_turno; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._alcal_turno (
    id smallint,
    maniana smallint,
    ed_fisica smallint,
    fecha character varying(1) DEFAULT NULL::character varying,
    curso_id smallint,
    tarde smallint
);


ALTER TABLE public._alcal_turno OWNER TO rebasedata;

--
-- Name: _auth_group; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._auth_group (
    id smallint,
    name character varying(14) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_group OWNER TO rebasedata;

--
-- Name: _auth_group_permissions; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._auth_group_permissions (
    id smallint,
    group_id smallint,
    permission_id smallint
);


ALTER TABLE public._auth_group_permissions OWNER TO rebasedata;

--
-- Name: _auth_permission; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._auth_permission (
    id smallint,
    content_type_id smallint,
    codename character varying(27) DEFAULT NULL::character varying,
    name character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_permission OWNER TO rebasedata;

--
-- Name: _auth_user; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._auth_user (
    id smallint,
    password character varying(78) DEFAULT NULL::character varying,
    last_login character varying(10) DEFAULT NULL::character varying,
    is_superuser smallint,
    username character varying(8) DEFAULT NULL::character varying,
    first_name character varying(1) DEFAULT NULL::character varying,
    email character varying(1) DEFAULT NULL::character varying,
    is_staff smallint,
    is_active smallint,
    date_joined character varying(1) DEFAULT NULL::character varying,
    last_name character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_user OWNER TO rebasedata;

--
-- Name: _auth_user_groups; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._auth_user_groups (
    id smallint,
    user_id smallint,
    group_id smallint
);


ALTER TABLE public._auth_user_groups OWNER TO rebasedata;

--
-- Name: _auth_user_user_permissions; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._auth_user_user_permissions (
    id character varying(1) DEFAULT NULL::character varying,
    user_id character varying(1) DEFAULT NULL::character varying,
    permission_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._auth_user_user_permissions OWNER TO rebasedata;

--
-- Name: _django_admin_log; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._django_admin_log (
    id smallint,
    action_time character varying(10) DEFAULT NULL::character varying,
    object_id smallint,
    object_repr character varying(37) DEFAULT NULL::character varying,
    change_message character varying(64) DEFAULT NULL::character varying,
    content_type_id smallint,
    user_id smallint,
    action_flag smallint
);


ALTER TABLE public._django_admin_log OWNER TO rebasedata;

--
-- Name: _django_content_type; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._django_content_type (
    id smallint,
    app_label character varying(12) DEFAULT NULL::character varying,
    model character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE public._django_content_type OWNER TO rebasedata;

--
-- Name: _django_migrations; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._django_migrations (
    id smallint,
    app character varying(12) DEFAULT NULL::character varying,
    name character varying(40) DEFAULT NULL::character varying,
    applied character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public._django_migrations OWNER TO rebasedata;

--
-- Name: _django_session; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._django_session (
    session_key character varying(32) DEFAULT NULL::character varying,
    session_data character varying(252) DEFAULT NULL::character varying,
    expire_date character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public._django_session OWNER TO rebasedata;

--
-- Name: _sqlite_sequence; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._sqlite_sequence (
    name character varying(22) DEFAULT NULL::character varying,
    seq smallint
);


ALTER TABLE public._sqlite_sequence OWNER TO rebasedata;

--
-- Data for Name: _alcal_carrera; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_carrera (id, nombre, modalidad, anios) FROM stdin;
1	Técnico en programación	TE	7
2	Bachiller en Economía y Administración	BA	6
\.


--
-- Data for Name: _alcal_cuota; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_cuota (id, fecha_pago, pagada, importe, nombre_cuota_id, estudiante_id) FROM stdin;
\.


--
-- Data for Name: _alcal_curso; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_curso (id, anio, division, cursonombre, cursosiguiente_id) FROM stdin;
1	1	A	1A	
2	1	B	1B	
3	7	B	7B	
4	6	B	6B	3
5	6	A	6A	
6	5	A	5A	5
7	5	B	5B	4
8	4	B	4B	7
9	3	B	3B	8
10	2	B	2B	9
11	4	A	4A	6
12	3	A	3A	11
13	2	A	2A	12
\.


--
-- Data for Name: _alcal_docente; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_docente (persona_ptr_id, numero_de_registro, activo, antiguedad_anios, antiguedad_meses, anio_ingreso, profesion, nombre_corto, foto_perfil) FROM stdin;
1257		1						
1258		1						
1259		1						
1260		1						
1261		1						
1262		1						
1263		1						
1264		1						
1265		1						
1266		1						
1267		1						
1268		1						
1269		1						
1270		1						
1271		1						
1272		1						
1273		1						
1274		1						
1275		1						
1276		1						
1277		1						
1278		1						
1279		1						
1280		1						
1281		1						
1282		1						
1283		1						
1284		1						
1285		1						
1286		1						
1287		1						
1288		1						
1289		1						
1290		1						
1291		1						
1292		1						
1293		1						
1294		1						
1295		1						
1296		1						
1297		1						
1298		1						
1299		1						
1300		1						
1301		1						
1302		1						
1303		1						
1304		1						
1305		1						
1306		1						
1307		1						
1308		1						
1309		1						
1310		1						
1311		1						
1312		1						
1313		1						
1314		1						
1315		1						
1316		1						
1317		1						
1318		1						
1319		1						
1320		1						
\.


--
-- Data for Name: _alcal_docente_carrera_docente; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_docente_carrera_docente (id, docente_id, carrera_id) FROM stdin;
\.


--
-- Data for Name: _alcal_documentacion; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_documentacion (id, nombre) FROM stdin;
\.


--
-- Data for Name: _alcal_estudiante; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_estudiante (legajo, persona_ptr_id, activx, orden, libro, folio, anio_ingreso, grupo_tec, ficha_de_inscripcion, foto_dni_estudiante, foto_dni_estudiante_archivo, foto_dni_responsable, partida_de_nacimiento, vacunas, certificado, url_foto, archivo_de_seguimiento, vinculo, porcentaje_beca, adeuda_id, curso_id, responsable_id, foto_perfil) FROM stdin;
57	667	1	1			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Tvt9mKHOZvogIiKK6L46jbQVB1pC-Molb0FIrKjqHVQ				3		
58	668	1	2			2020									https://drive.google.com/open?id=1NXz4YGDz39RpwfHGevTx2ZKQjeNeWyry	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1x29FE5dl-oSpTPFbjrrQxwOsFtIYrB9OxwoIO_5KQoE				3		
60	669	1	3			2020									https://drive.google.com/open?id=1zmfaKfcw9h0Yq0l8sgmefrudZRD1PZex	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1EB3q-KZoH0ID2aUFynUJK3hsZsKfWF9I7ir3SMK-nJM				3		
62	670	1	4			2020									https://drive.google.com/open?id=1C5LGs3efk0iLjP8a9Gxr5kWhi5IE7rOA	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=14u2V_r5H9YUYQ3njaf_HblZQ3GAXV8MS7xTWSFiIGfE				3		
64	671	1	5			2020									https://drive.google.com/open?id=1BjrSEw_XltMyoG7_5IoKv3rsqETkB0kP	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1FddEF3OX9Y0hPTgLmPBUhzX4xTM16LHdMg_fclB5snY				3		
65	672	1	6			2020									https://drive.google.com/open?id=1dabxUl10pGr_suY9aZ1YiH3OoAe98DuV	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1hOzSEzPC91o-DRfKQZ-foZz7OE-RrF1oa4_1OKczBeg				3		
66	673	1	7			2020									https://drive.google.com/open?id=1xKX0QmOXMiQBSH25m4ySiYvS6yZWlse2	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1AY-0VRHXEvnVLh6i_bnpSffrEreF_FpM8-hRWmjJGVM				3		
68	674	1	8			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1cNoBDP7VQJXqXK-zSrE_YAB9i2l7FOmrVkbaVmcoEm8				3		
69	675	1	9			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1iYdvkYmVTC6Iyu0o1KnOxAIocXm7FKjAVd8G9p7L0UM				3		
70	676	1	10			2020									https://drive.google.com/open?id=139Zau33jI1uT_ZIZ_ie9VCNtM5o4yoeL	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zAAsIqGyDkn5lAQSas2sibfJCCs_8aKrX7wjo0vySSo				3		
71	677	1	11			2020									https://drive.google.com/open?id=1ZDNW7-CAAorGIgLPH-9qMpdPPHTHseJO	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1GHiHTEP0ClzKMJc5jpF57Mv0nN8ROstQnC7qFVAbZD4				3		
73	678	1	12			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=12kXda9Pq999WdTUqk8cnnZI07IPO91jQDxjpngWJ9vs				3		
74	679	1	13			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Douy99Gc5MoDX15vmvVmX2jcQzKyx7BV-5KAhHy8iPo				3		
75	680	1	14			2020									https://drive.google.com/open?id=1H5gRetHyDhDnapD4FIfDJZmkwcP0xukN	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1_tyuucG4vH_lu0-le-H3O6U8K8BQcpfgnMU-M3haKT4				3		
103	681	1	1			2020									https://drive.google.com/open?id=1NswGheJKS7Yx1Ow6MkRL9onaXp2ZZHC0	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1BqWZLeYJmq9bE8bLBVrOcb_3S8499o2O2sPpivLsx4s				4		
104	682	1	2			2020									https://drive.google.com/open?id=1AhgYSIdQ7OgRkSuCsUyg1taf98TWW1tf	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1EIXiuEHDoZEiRxt9nEUDY1M9Miz8tzVZ-RKlzv7TVU4				4		
105	683	1	3			2020									https://drive.google.com/open?id=1s7oUkfUa_XAmwtipjFZ1hZTrsELXqXny	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Gqv4o15bBby_pnuu8usKs0cWFd5XyBrBZj65PfYfYKY				4		
108	684	1	4			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zydEz3tdXfxUp9DnoioTtSVekkNSwQJWhDpZy32TG0k				4		
110	685	1	5			2020									https://drive.google.com/open?id=1dQlhstbnOP9FagbETI2uAiKozND9Ki1j	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1r4-SiPHj7lgSeBBhEYI2qppI2iAu6T5okIQwpdgn6b0				4		
111	686	1	6			2020									https://drive.google.com/open?id=1He9fFvtRHGygjLS9NcvINLwSHqCyLbZS	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1c6RnauH4kqDwhvMRDNghVZOlfRFhEj3CAUY4W7pymjY				4		
113	687	1	7			2020									https://drive.google.com/open?id=1pwRJyJretc_SZKi2aAMA_yn611340oJ7	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1b3Gui73JlM8DZuzCMk50b2M3dInsWGGo3t0b6KGvFqM				4		
114	688	1	14			2020									https://drive.google.com/open?id=1gaziO-8iOv0t49dJHLnQ7IUNyHQeokV1	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1S2X1vswiPnDsNYIu_j-l2WHEYyaIsiH2Lfi88thqWiU				5		
115	732	1	11			2020									https://drive.google.com/open?id=1-nPvrJk0Rt8GBrGmgAfGZfdj4Ttr4Ufx	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1pDyGMcg3GurmhOmj-fTV5OdKF64qSTfh0QXqS_a8MCI				7		
116	690	1	8			2020									https://drive.google.com/open?id=1J5w7RVYsMwwLg4e-gcObN4V0Abrq-edX	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1mO_EKiKdZlbBy72XDOxrPQ5aTqwVV0DTuVhcLXnG7mQ				4		
119	691	1	9			2020									https://drive.google.com/open?id=12ycrIn_tOhtBmheYihDmgiY1KCGji8WW	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=16jcG0iQapYLZIepZ4o56Fe5Nyz5ZGQiIQx-BLqyjCEs				4		
120	737	1	16			2020									https://drive.google.com/open?id=1ZxLdEHFxPHyUab7tcZulCTWHq8EQFMCR	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1XYnfqVCh1nFyqhZOtSdiRwRsNyH3K1o02cPFDkcMQJI				7		
122	693	1	10			2020									https://drive.google.com/open?id=1XuE3M3db5R4GXnLb4mTge8FPWawuMkoo	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1UAGz1ZWoIYCSGMLDvACsmEgLGi1r34BG5zI-wnrQw9k				4		
123	694	1	21			2020									https://drive.google.com/open?id=15ENnN7nihgHPRG91D_U-dDG2nWFa0slt	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Y1neP8yqHMw7CeHY4DGPIATkx_YXozE_9hJLEj_bAA4				5		
126	695	1	11			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1QL1Nlx-yODa-dlB_hrXXZxl4ANTFPR4xDUYIeGvmcNY				4		
128	696	1	12			2020									https://drive.google.com/open?id=1Qzw9xAR-lGuvfDebFUXFXXXYPbt2FVW8	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=10oFgewi3DNCf2ubD0OIcHyCAL2vxCKLUF3TmvXLYHaY				4		
129	697	1	13			2020									https://drive.google.com/open?id=1NMG58p8gtIzXBkPrM0RXhX5WHFTEMgRc	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1jsHJ_iJuuCCDyw4q9W8fcaMJZvir-s55ao5-ZDdSI5M				4		
130	698	1	14			2020									https://drive.google.com/open?id=1Eci_0I6GPJPonOKaRqgS4Un01zpVgZNT	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1v0pfQnWoST5E2Qh-0nzgvSTuoAlKrkHpRWlMB9rno4c				4		
132	699	1	15			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1xZpahcdIYpSkFXQkG_a0h53EGOGiak9qHuJXPa2nB_Y				4		
133	700	1	1			2020									https://drive.google.com/open?id=1PaS56ZgipqQ-Vq92PFDLhcqfw0cwmTGF	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=10yd30SK2HNjThEpq1XpKTwePTr2_y3OalpYYcY-oMcU				5		
134	701	1	2			2020									https://drive.google.com/open?id=1Q4U0b1PccjbN-fYRJ1RCZ1VGe-P1DV1r	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1z2AHMkBbvb_VBfzDjxwefRNbPfQU5kb61YYbRmI6Ook				5		
135	702	1	3			2020									https://drive.google.com/open?id=1NLUWfBbLA1gkdVUBHYP8xxZik1fg1OiR	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1AyYocojG7l2aN5OZq98TLS2-WCzsJKieS2LwytWR05s				5		
136	703	1	4			2020									https://drive.google.com/open?id=1y2gYBy3_K2-nRbtwFyq1aq3aA64WVmJj	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1fPL9xHKOZkcgAJZELn8QnylhBO4ULR0gTfEKCVqesGQ				5		
138	704	1	6			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1g8wQiog502En8bck7wDClRA3tXelFZa_dspYatIIAcw				5		
139	705	1	7			2020									https://drive.google.com/open?id=1d-2G7IiNj-EEYvylqzOYEvPhL300PQfz	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Wk39ljnTs4VG39V2-sF5vdZJJzRmr5LQjNWcNWuqIs4				5		
140	706	1	8			2020									https://drive.google.com/open?id=1qdVllqB4f3KdxcEbZAARYhlFn4nWd4zl	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1V8Pj95wHb31eYRb3mNFahEOAPkO8yXmYYqNp0uuAInw				5		
141	707	1	9			2020									https://drive.google.com/open?id=1PmuIvqnr1Wzxq0K4j7t4zGGphrLSOGPe	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Nw7jGA2SmLdGB-kTCa9n5pE3yqdR9Z4qab_B29tNmMI				5		
142	708	1	10			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1mI7A9yBQVazoZ4BgZMqaRJ-55zy1LJ_v-X6CAPo6juw				5		
143	709	1	11			2020									https://drive.google.com/open?id=1SMoiPL2Mi1AuLbWH_FfowZojReE1ylZv	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1tWdAS43NlyC4uOIjh6QsLHoKZ2A5W-Ue1QDdWGPTUns				5		
144	710	1	12			2020									https://drive.google.com/open?id=1TYeCgTVgJnDNNdxFk0mk8KqNmIyEy6OB	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1V85vCh_-0cdcPTg_IqfzoJKwI9AeNLNxEz5o7yQDTeE				5		
145	711	1	13			2020									https://drive.google.com/open?id=1xFVT8SQDhpdwtfrVts06uXB96gKEUepU	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1P2xw5KPXrT7fxnOiS87ntnGndjpfMyxj5RNNLqJJEd8				5		
147	712	1	15			2020									https://drive.google.com/open?id=1yAaurSw6xEOAXssGyseSCxZoLOyvBoE6	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=19Pb3GM3h9N43iEtrm8k6w1iJW4KsvvgAbalqS8qt3M0				5		
149	713	1	16			2020									https://drive.google.com/open?id=1a7U1v_dK-w_XsNcVhzwpfKq3Va_ZeU5N	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1yaRxjvan8-QlEtTlarbZCehJqqirmnLNYWfuN3ecQvs				5		
150	714	1	17			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1G-HeWBUjDZNLYUoARmhRpZtKkuqhqzS1iZzSD1fFKew				5		
151	715	1	18			2020									https://drive.google.com/open?id=1l2Ps9zFwFHnclnh-DGNvfvgxE9Pn-dot	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1UTJ17Wuvl_-SULz39xsHrwMg_wE0JbYBlTXV8VBq78M				5		
152	716	1	19			2020									https://drive.google.com/open?id=1Zd60vaErqGcnIA6CALzLGisaCn1i_6CI	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=11_fA4UgUOYX4JFnLUqVpl3iauS5GmlGpYD7OSp8d1BA				5		
153	717	1	20			2020									https://drive.google.com/open?id=1FX2dYA29mbsj34qY7LfRvUw5aU7-jxHP	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1UbtewZzEk6l7PHG5n4pleRKpTwZDUIMFucgjM4X5MaU				5		
154	718	1	22			2020									https://drive.google.com/open?id=131rZ_6xjrXCHx4WuRcJ7EEP2yG7lcvIZ	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Izq0nN_Wln1E1LZ5KPz5hEzDuT7oBeM37WDg5hnQK5E				5		
155	719	1	23			2020									https://drive.google.com/open?id=1wxs9SblYBEeMtEKv1Lo0hmezebS_BMC2	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1cp3c7DMS2omclSs2zQ6Q3_fvba7PAtiWA2YfX6LptLY				5		
156	720	1	24			2020									https://drive.google.com/open?id=18dcVa6gulmDNAWa4gMvGx_EZk8yk0wiD	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1r2eDLDLD9iX0uTm3bKjBIEEpUnSv4ba1p_p_I0ZXh4Q				5		
157	721	1	25			2020									https://drive.google.com/open?id=1FjphX3GezEO4g6pZnkwAk5DVjsUOUO4i	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dNbtwc31inBMK4ukLM3R98o_Bv71QcpCACGKMRjW198				5		
158	722	1	26			2020									https://drive.google.com/open?id=1DXM-k9dvMqJATYam4nncdZ38J7gft-rM	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1YoiY9INllbGxMrSwiDgsei-J25MC_LslfIsQvffa-O0				5		
160	723	1	27			2020									https://drive.google.com/open?id=1f-UMg2hZbEgrxkEWMAgwy3hHA1-4a_HI	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1fUCDUZyx8C__X1Eddll7JooBGGrTHY8IHucLl0yi6oI				5		
161	689	1	1			2020									https://drive.google.com/open?id=14Ve8BDik32kwAjGmVB5JMgOTHmi0sba7	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=17766dlR0P5tlhdhD80Bv5yUvxBaTOE6fXdr304Blrjk				7		
162	692	1	2			2020									https://drive.google.com/open?id=19dWljDHuV1si0z3LozR15bl56vFuKIdD	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1KmDWlTK2lmlT3Fw1QuVxZlrVUZbCpygq9m2qGDpnVd0				7		
163	724	1	3			2020									https://drive.google.com/open?id=1wrtaljXp5RLlceNMUTVjOjYwRaiHpjzB	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1oBQBMAekg1paBm7TYhbEJQFUicMfuipc_L8UMtrslDY				7		
164	725	1	4			2020									https://drive.google.com/open?id=1epZQowy_xUpzFElQ_1b3KwgURowXCkSU	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1DYMpLTqYz1l8G-dRf4NIM2HLsS8bdNQu5IW6JRUa2Pc				7		
165	726	1	5			2020									https://drive.google.com/open?id=1Wa55whq88fGZLL72KjhED_lXQWzhaHPs	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1SINPgREeZQZYGEcAAYcRp6PrliTPpFUuo3q43R5hwzI				7		
166	728	1	7			2020									https://drive.google.com/open?id=1YpZHRU4dwQvQF0KkAUx6uU0skAo3YogR	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zjc41HdgmLqxftlUtVa7BsyMayab9wDpFKgXJUNh-dE				7		
167	727	1	6			2020									https://drive.google.com/open?id=1QdNxLA-ZRM9ZQrt9ileUOaD4itRrU4ya	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dyudKIEcdm-tnkA3E6fDYqUuJHmS31CgJHXQ5fMZ-bI				7		
169	729	1	8			2020									https://drive.google.com/open?id=1YjacBgqLyoRhfKvNU6Ux-tNR2UzWwyoj	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1TBxg55dWTQtrJOXouLeKAQLQBRSO18L3hCzedkQlimU				7		
171	730	1	9			2020									https://drive.google.com/open?id=1ASOU1htklZa_1O-OW3Eyq8shT5IOeZmm	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1EnESWWxGiIUZHegnV5sg1dddpLoLTj39SeH--tBlwdE				7		
172	731	1	10			2020									https://drive.google.com/open?id=1b9cw8QSH6Ua7tVaPbKVOF7adfJj-fFAo	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1EseRTHDUDTq4vBP04CdObS7CZaJspKFoWJdK7dsWejQ				7		
174	733	1	12			2020									https://drive.google.com/open?id=1jNB4_AcibgnteH9wk72fIo6Rx2GJQ39K	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1GuuRndLRbkpSMnhHtLUgap3MQEBcAG9vdbYLJXIZfcY				7		
175	734	1	13			2020									https://drive.google.com/open?id=1l0eI-bYSAGmy6jvQ_DlCLa0IjR4_Op2C	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ssxb_Kg5M3l9HCHHx91WCcyJlg0LKwySiEe420mcIxw				7		
176	735	1	14			2020									https://drive.google.com/open?id=1i_tgjtpFsEcrx_Ryc4LN_5GZEZubhN2p	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1H0wILsL9791AGB6BlXIGedXvo-IH6LhrvMUn198YCYg				7		
177	736	1	15			2020									https://drive.google.com/open?id=1enagTY5LeWDCp5yZdAXBnQJW1Efp4Q9u	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dvxizr_tcMRNjtYl05N6aPcsP2_9wiazt2O_LBF_bM0				7		
182	738	1	17			2020									https://drive.google.com/open?id=1XJzhlKdn1iru2XqdWISNdLLV9sU-6-IV	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1avlokDrjFQzD7zjomKZpaQZ5D86YV2PKWJhN8NHmleE				7		
185	739	1	18			2020									https://drive.google.com/open?id=1djMfhtNCLewo8Mliu2GbD2GkjDBRvx15	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Kgk2CWJNiNzzkrUo4Z9nbTnDz4g9xcRhHemCMKlfTKM				7		
186	740	1	19			2020									https://drive.google.com/open?id=1fwGOtSr_EF8r1DeYou4ZxuP19LmZdKsV	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1V8T2DPKdOOffT5fpCxBgMLGIKho9FGrEopWV7p_1tB8				7		
187	741	1	19			2020									https://drive.google.com/open?id=1J0idHpMpBpTGtZ5hPrkjw1BWA0Njipyn	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1JeRa-ogux68PjCNL65ztO9mdPlY8ucZBkqK2OffEQP8				8		
188	742	1	20			2020									https://drive.google.com/open?id=1KU6UM3j4Jt0amsIGhmc0nlUfLQlf36Xd	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1fxjmbdTrz1JK7VMafBATcGEX_KX9F9BoyMRc-qU6vus				7		
189	743	1	21			2020									https://drive.google.com/open?id=1WjrMH_eQq4k0a6MsSWTVjYsfxnPnIzGp	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1uFHeQnOCDhKEm-0XqmTFXO0ALcpQswEsk_wIFBCp03M				7		
190	744	1	22			2020									https://drive.google.com/open?id=1tyHfpMD1ZrMRPEYwqcJRn_It6X79QUSo	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1E4ehGt021qcjs1h7fbnk524U9J6sUxjO5fyBD09P4zY				7		
191	745	1	23			2020									https://drive.google.com/open?id=1CHgEqvJ2ExySnuKTipNXNw_774rBSPJF	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1o1meZXF9dGKZpsGttO3Ek1bsyHcIqwerq_dOjwJ5qHQ				7		
192	746	1	24			2020									https://drive.google.com/open?id=1-SB-mEsWsyCygTdGzg7KgmsH1hdNQUZC	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1UD6QOnYNlN0-46dqGucheqBUVCaiYx3xq0-bebHup74				7		
193	747	1	1			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=18F0lyIS37A7iUdkj4bTqDnjikkeVXOhZ8q2-ZPK9sC4				6		
195	748	1	3			2020									https://drive.google.com/open?id=1VzRFbLt1BqKEqc1L_5c2749DM5fB33CZ	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=16-ZW31BPDrIcZBBG71LWEJV1vMVUzsQh7DILBvB8nyE				6		
196	749	1	4			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zLAwwG2nAKzD5pXIl8IewFR4FjWltOGrOLhHk1Af8kk				6		
197	750	1	5			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1w-5hkt-lacuf1TvMcP77t2_kqzVKZzuNDj-3MW9wZSI				6		
198	751	1	6			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dkMpT-bmY0WUnGVTkBw8EnKiTIqxynq8vbzR0mefHms				6		
199	752	1	7			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1BgH-Ay9Q_hI41zOHyeXOth8WMZoNiMi3UYNC8pjfjCc				6		
201	753	1	8			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1yWLP5hqRr6qUEczmXhyaorAU1h0uyfAixJnHpYCIWt0				6		
203	754	1	9			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dHhrGvFzPtSTJUL8fbaQkT-jQqx9cpycf7H2TP6AoL8				6		
205	755	1	10			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1KQY72Om_KxbFKEkNxnb10fQSh50pz-9BnNnnlYOmc2w				6		
206	756	1	11			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1MpsGuv0bW1c7jbpvXDaMyLn-G9Q4qTxLcaiVlJDEwYs				6		
207	757	1	12			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1CnuYjlYPo4Xexuur1xvrIs4TrbOb0fZZe1ivuG60g9I				6		
208	758	1	13			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1y3kGFL4toF6-e_W4sY7SqrdizQX-KzptYuOlCCt7jns				6		
209	759	1	14			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1a6t7K15xMo77OQJGsoITSZ1sfpA_0Nqyi2rOMBq3XyQ				6		
210	760	1	15			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1-gUB2UCYZPUl1w4EAXFfDsuwMTrrP-nNxvZ5JRKOnjM				6		
212	761	1	16			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1BmgUu5B43edWRGtNr_Y_d5BivGFC64c8toEpv5OYROM				6		
213	762	1	18			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Ox3MO6xWDcxp6dfQH5GJvWCpBVuSdZB5qNTWkRvN1ys				6		
214	763	1	20			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1_g305W4KBdZLlFMGfmVfhK_H4vohw8-vwIKUkX-TxzQ				6		
216	764	1	22			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=12svLVO-pGnlwkOwsx0XjsQwrtq5lO5WHhaJeorovUPk				6		
217	765	1	24			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1k6RqDU2ge9LeuV8XiNHKsqIeWpC4CNiYlRz5Jcz1JyI				6		
218	766	1	29			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1H_4WuMrz25DcnaPEmPxtiDRS2Ch5lA0rrK3sSuxpnZk				11		
220	767	1	17			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1x1zUm9AUVzDNgc0xRnsvGixrjhuysJymY6C7Mxccu4w				6		
221	768	1	19			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Y6Whda1Nkzx9JhkaSRz3SD0WRhOamKvDqtdSYBoWWh8				6		
222	769	1	2			2020									https://drive.google.com/open?id=1j2rAnMLTHDa30Jhlk1uCmtFCyHz8YyUu	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1GPx9HZ1XPrDTAarj9aKoZEG8V3lmpHfkuEXHXDRpndE				11		
223	770	1	1			2020									https://drive.google.com/open?id=1YqMObo5RbJZ2T1y_2oV7jN10tLWnY515	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1BVmur1-1HpYssRCWqvhq4v0hA872T8cTe6OdLalWrRU				8		
224	771	1	2			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1PE1J9Z5pLv3zT0lXWMYm5Zx44Ix_T_eZxTaZuL8lLDA				8		
225	772	1	4			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1DbIs59bu8ZcH2zPeblYCR0wVbmaTcvI9dH6jg2jv9MY				11		
226	773	1	5			2020									https://drive.google.com/open?id=1ondh7WdCBGTN7zIEDDbyihP5a_uNj-rk	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1qoRK5z94zHn8qC3pl1hKef66Jai4yRgCpQQ1vxBcRUY				11		
227	774	1	3			2020									https://drive.google.com/open?id=1muyoYp4d5R1oZnW_TxbzQIWj2S8JuAGL	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=196m98ZxqG1CWskqD4K1Xjc6TYuOBLQHn9df1lei084A				8		
228	775	1	9			2020									https://drive.google.com/open?id=1228Q1OktuPhF3bJC0gOnVajFzc8i4MMJ	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1l1J_kAf-i0Sf4VxG9upBO7eS0O4uqAmLs4xdPf5vmYs				11		
230	776	1	4			2020									https://drive.google.com/open?id=1teKM2Qe7WVIwWI3huNUjKzOZ5SV_4WBv	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1H4IMWjswYe2Bvuj-9qQI0yXR8BRSqFpIvlskQlg28VA				8		
231	777	1	5			2020									https://drive.google.com/open?id=1Cp7XiJntrCTd7lvBzZXyQhuaz8YXz6DA	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1TizN8jh3vxPIdaZ1c9wGvXcJU5U-fxJMKiF7ScMsUNs				8		
232	778	1	6			2020									https://drive.google.com/open?id=1HmafQ1ciGE2BfKoSQTAmyoRf-ZB9Yzcl	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1icMxbhMDN9l0eqxtr_aiHQyp7uC3NvzkyciEa7Wpc1g				8		
233	779	1	7			2020									https://drive.google.com/open?id=1wcXPsS7EUPI2qowj9ZvEL18Mrv8ZUbmP	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1in8k2tlIhxHpysHlFXa64skyJDJYGgHNajEOcRPnpV0				8		
234	780	1	8			2020									https://drive.google.com/open?id=1OqrJA-gpBFL-IEX1UqUsiLvpb2K_2IuB	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1IAasbu9EBF0vFq_xyFLnwe-oOCjNFrfBXNZRSyTCI4g				8		
235	781	1	9			2020									https://drive.google.com/open?id=1est4QEWLlrRf1n86mcGAfOHgOZlYaEkB	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Vzn7-GEF4SB89EGMxklsnfSe3PSu9RGWWxOJc2M3KvU				8		
236	782	1	11			2020									https://drive.google.com/open?id=1fTh1YroDu99SzwkYv4gsnMOOA3sc2MKF	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1PhbHi8ZbeFbsh708_pprkmwKi_ebWnwDaj0wvHrp_PE				8		
237	783	1	10			2020									https://drive.google.com/open?id=1VkoSE_MD-hH3t4FAUrXa4PXcXJ_669vu	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1fMeUFDVFt5Qr-8cR1pOF70FykFvWTdkXLVPWXUvHS8E				8		
238	784	1	11			2020									https://drive.google.com/open?id=1AUqf9yX5mGjJbPKxx1aD1-aInXh1OwK3	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1_80PI7MWZdbn_tYHa4rERZ8NBCHzCHcADVP-e6TtSqM				9		
240	785	1	13			2020									https://drive.google.com/open?id=15olj9RSlqvnDJiJaqNCsbXyXxY7m-Eic	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1wC14Q_uK83PSRphhMfJ8GoU6vpvg2aa8LIhnM-noyRI				11		
242	786	1	12			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=17RyQfIExBLhUZPqa0zTj-nJuBeAjF1JDt5n9UNfsC4w				8		
243	787	1	13			2020									https://drive.google.com/open?id=1dL0vJsu6Fr6CQ32n3AqUA4ds26vahWFY	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1D2evI00MJGdZMx2ucp6O0AkLahHju0LaqoPr0H9_3-A				8		
244	788	1	19			2020									https://drive.google.com/open?id=1ipHzOWa2aRHEnvAio8AeIYLw8wVo9CbQ	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1kbjXzi3qw3ZwX1uZwqoLscIhL0Ut72PMwj6-xJuEc6s				11		
245	789	1	15			2020									https://drive.google.com/open?id=1y8h20lffEvlXfzEVGLdNzyqZ-nhsuzFD	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zIPsmBJ-GF1jr7dKQR_45sGLP4dnKhIvVOinNUxulIg				8		
246	790	1	16			2020									https://drive.google.com/open?id=11fMLoBRBHBHZmgIOlHD4LvFzX1a0J2pi	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1cChMYPOQgH0oLp5MbtHLoDVThQjwAk1Himw9g7Bmam8				8		
247	791	1	17			2020									https://drive.google.com/open?id=1iOf56nX3L1_kSqFi7GiaBW83ZhTDBmih	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1g6oHa2Y3N2SJdE_Ht6U-VSFnsiFld-T-94s6WIJdQR0				8		
248	792	1	18			2020									https://drive.google.com/open?id=1zx0aR-ayq0D5plfWeWydksuGfshfZ2fx	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1WVZS_vt5yZMBP7l2hpU4WgdxbdGm5YNN6qUdYbRnWVs				8		
249	793	1	20			2020									https://drive.google.com/open?id=1WU4TobdAVidDvFGNo4X6O6g_lHihFJ-U	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Nq6Y3m5FOAS9f5V-dZE3-O6Coc_JJm6muKQ4okpnRz0				8		
251	794	1	37			2020									https://drive.google.com/open?id=1XZgdQpqXyIq4BMcUCGwLkgmWFf5P7WU5	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=14yIskswltS3RqidESgvIA7kHcrkEDJjKj987JR2lem4				9		
252	795	1	32			2020									https://drive.google.com/open?id=1cRb0xIOjvX5Kv9sbkYsyQY_V4gKfZsrY	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1wtPjxKmyacwuQkCrsFjdu2n3eBQzp8NPwQcoS317IJs				11		
253	796	1	1			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1FDM5ivvUvfdFSulnPDhOKkIuDJSoF6cPrYwJvBq9ZiQ				13		
254	797	1	1			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ltgh5tKQlu_bphWveHIs10byE3VxviLB3setUhGcNyA				11		
255	798	1	6			2020									https://drive.google.com/open?id=11Iv0FCSARWcgXmsvCClcV94I7-Gwe-Zq	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1AIDmD4R7Cc_woJEMAFi1YCCRXBfvWa4tT0nIul-2jV0				11		
256	799	1	7			2020									https://drive.google.com/open?id=1EKuc3YYhalJpZ3JXKdF229ieqwJNzG_Z	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1kzMMcCqlMAqOEVqOKCFF466brRbAnTm_i3T8ToHv5S0				11		
257	800	1	8			2020									https://drive.google.com/open?id=1OAKgzH4r9y661Tnmi09NhQETH8vO1A2p	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=12Vnno6mj9P9XX17o5XYNzcfvUqk9Di4f-6dWUZORo30				11		
263	801	1	12			2020									https://drive.google.com/open?id=1186KVImbFPgJ6D3CLtP8_zBg71zjASpN	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Athnzu37lj9Q4TvS_XWdjCLq0UkzbUUi_4hYgB5fHMc				11		
267	802	1	15			2020									https://drive.google.com/open?id=1OtU_uIfgfyRogwmrMR1UEMfiBNbqjM94	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1PvvhxO4iwfyNGKVQtvpKDufTQmU24dSNi7cCU1BRam0				11		
268	803	1	16			2020									https://drive.google.com/open?id=1mZgDo51VR40m1Txk3nLIm_lWiZIiXHw3	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ntKYYviTujpoKuC4C9YERp_us1VVE0A_nS1rd6Boaig				11		
269	804	1	17			2020									https://drive.google.com/open?id=1XIeqwacpV995MU83R_ruOo-bRJVYU2yI	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1RIzGoWKs9Uw2XT95UdzZ5XHKWq8_JveTpiLcTfR9rTM				11		
270	805	1	14			2020									https://drive.google.com/open?id=1NjEHdiAAIt27USFf1dwEUdU8JVlZjgVh	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1gBK-GHq3sen3lpjSj_qafy8h7TwUCqFrnIp6TPapZDg				8		
271	806	1	18			2020									https://drive.google.com/open?id=1uB8Yyugo9kS-_rJOtQS2PhRXsqJZJF-W	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Vg1je0C6j-QMaBGPqHptEEb5TZeYSbhfLP9ytD9BLNY				11		
272	807	1	20			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ksIdPPTMpDu8KajFnY2Ia3pDqx6Nc9Ai7ReEtirau9Q				11		
273	808	1	21			2020									https://drive.google.com/open?id=1x_Sn986YryyGWs8D-jEKKP0sZC_LDxF4	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zfivgaTlIeg9vA5OnOQyT9IvmtiTSNVJbGCFmpAF1Eg				11		
274	809	1	22			2020									https://drive.google.com/open?id=1xqA8hns6J86tTQ_kbdOlYqEblyZBlDCZ	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=14G7QLFowmCebdiAgo2qP30ZnLFBzCsouTKBcATJC5xs				11		
275	810	1	23			2020									https://drive.google.com/open?id=1C152Jc9Jklxj3KqON4dAdNuVjzQUbKJi	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1xhYW694jW8q9eALyrui1_AXgIZnp3xc5fSMT11UoodM				11		
276	811	1	24			2020									https://drive.google.com/open?id=1ZJ3a0ZwT4GQhwDZqr6fb9A7d18S484vX	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1LyhnW_vw0A7AMSTfbL-_2OmsbpVoqO6f-v4WipQ6dl0				11		
277	812	1	25			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1fF-4NpMJLnu2ORl0Xp_Ys4N5Kf7TTq1co5VMBEQzhNo				11		
279	813	1	26			2020									https://drive.google.com/open?id=1TFI5pQicczgkkLTekDI5jWRblcgLMZ__	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1hKyU9wYA6X03UylIjQs-Y3lAsN8TOZ3KqRX7rTuCC_Q				11		
280	814	1	27			2020									https://drive.google.com/open?id=10aWhU4BTbSzz6-zFjxD65rdlrP9tq6Rk	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1nWI8LJ2nsBrJfKm7oLyZPt04QZ2YW1a8WB54GltxsnI				11		
281	815	1	28			2020									https://drive.google.com/open?id=1T6QULZNvVKSaC90JYf9Ra6MXe0GRLX8a	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1vTRMOpPZ5rO_jUmEDE-10ZXrKVyJgG6rUpnOeoz04CQ				11		
284	816	1	21			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ADyg5jJ10_5ZBTMoqLpJInZ3DWP0Y8Nw-YZUSq2rV8s				8		
285	817	1	30			2020									https://drive.google.com/open?id=1ynSRrbbDLMz7qXiRnD0WRTmXJnlEIS5L	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1HLKSNB6hCjgx_h1xYxK-k6zUx7jYqx0HIHQroVcvWaI				11		
287	818	1	31			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1yNSHX41ep8CEJl848wlkxDQbRNj-kwR_XsduhfcwX8o				11		
290	819	1	1			2020									https://drive.google.com/open?id=1C0stE1v87NaTd7Vc3_gg_vXZGDk-uU0R	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ofScTZXJrNTaEX5p4ptLxtBsUvQ5P2SahYf3F8q54as				9		
291	820	1	2			2020									https://drive.google.com/open?id=1FhGRjGZsyqdArvexTvJuN61EjNdCKcIb	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1grPzTgoqzIhHNQZT3Sb6OrikjkpKMeLwu1koXsCyrlY				9		
292	821	1	3			2020									https://drive.google.com/open?id=1PbdGcEc5VJ5H7QhC-R9TBI999LGb38o0	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Y9BoW52u-xy7K7hne5PaIye9AMSqCmJlvCeSr-g0UdA				9		
293	822	1	4			2020									https://drive.google.com/open?id=1oTZKpMjDKaPYsVdygmfThXJLbalpBNHS	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=185vN2kUh6aetHMV7NwQFjNKeBAR1rRACtG6MCUpYGew				9		
294	823	1	5			2020									https://drive.google.com/open?id=1khyZljNQ8Abj1ni2oBDv4HK7Ncg2wgEw	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1hp6cLHGgL0sIuLd7QlILl6n_gu_jZ2-2e23nIrHyGBA				9		
295	824	1	8			2020									https://drive.google.com/open?id=1k0hmr_x9xq4eefxMqM409wy3_E-2jCAP	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zLrEj3aYkPLkyW6SR1jJLdmjYRfNEfZqCKtwcp8_g_Q				9		
296	825	1	7			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1E48VZ3JbWTcz_yQ1hg6sFIrqdTcxEpTqoFanmBZKK7I				9		
297	826	1	9			2020									https://drive.google.com/open?id=1yWoAG-NXfCX025wONcz9YrU1XIpjs-Cd	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1eKYqGPQTDqfIVECGWPZ64Nmnv9RvZyHBU7BDZuSNq1E				9		
298	827	1	12			2020									https://drive.google.com/open?id=1xAaH6NaTaPrPNB0Lp86ImumQR7S3a5BR	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1vEIgB3odzmsxr6U02Q5u03RSl17yrPm1C2MQoGFvLQs				9		
299	828	1	13			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1nbXBJBgI4AgqcHti_j-vIQOCQt49oWaCDOHKDZt4BgE				9		
300	829	1	14			2020									https://drive.google.com/open?id=1pM7F0Xh--dYUu5402UerTpeXieTepUbJ	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1_48JNmbEWjjlZfdbI9OojnaK0gKTed03U3ttC3xJFqI				9		
301	830	1	15			2020									https://drive.google.com/open?id=1MjkhFWg6y6Oiwf7L5J0sOZhpxlxG-DGm	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1-ki-mIQFmKXMfkWQCyi0BV-NKA9ZM9xPZpZgBrGcVs8				9		
302	831	1	16			2020									https://drive.google.com/open?id=1ZidNn9-ASulGbelgfcrxMk0-EtH_RxA4	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1aJJdi11Y9keNvdN9XDgSa6A3pve9aYn_hqxXPLo3WTc				9		
303	832	1	17			2020									https://drive.google.com/open?id=1uEfFzYlf4C5zZbE7Af6k_LTuUq4D6rRK	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1gdbLSlKVEML-ogeguPGC5kYSqYSOugCQqzacqjPyic4				9		
304	833	1	18			2020									https://drive.google.com/open?id=1wjxdnHNyRiVJddb86Dn-5uXGtpKAjmwQ	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1quOUJghwhliZZKGUOzLMiRztiGaoLNSqT1BbSP90dLk				9		
305	834	1	19			2020									https://drive.google.com/open?id=1QR7Zndh6cYPMqoCtSKI_rfpo1P3EliYf	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ctsJnJ4HqxMHpGpGr4rbfpxiJAuuoYzfh0WwGdodGwA				9		
306	835	1	20			2020									https://drive.google.com/open?id=1tEyFihhj22tJxgkfMBEK8u8wap8KgXEK	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1M1LtIsZk_rPLmznrCy8o6GDwV4ss_1LoJ38dxyJPgSc				9		
307	836	1	20			2020									https://drive.google.com/open?id=1ksL4PGMapOw8NBc4LKeklxsmJRtSumg0	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=15sUdP1Hi9yTEzZTbZfJ3NoWDRtVawiU98TrZcGNYKmU				12		
308	837	1	21			2020									https://drive.google.com/open?id=1HI0WB3_milQMS5icFbMyzuefTF0han4U	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=13S8vrEtnb_2_Q0uEfofNDc81enqv2XEQ1nBL8MZm49g				9		
309	838	1	22			2020									https://drive.google.com/open?id=16I_glxMCM_KVgbP9c97CkJgP0ueso-v8	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ULCY_IznIgWMQmeVo1gMZ2MkYKPQrg9YdROzSHiX23M				9		
310	839	1	25			2020									https://drive.google.com/open?id=1KH_c_xMBs6TWoyihht6mm-0pbl2ZdaU0	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=13uxkAfm_xKAE1vtteS5HgA-kQ3kcpVXrR518S808PW8				9		
311	840	1	26			2020									https://drive.google.com/open?id=1RzqUjmRxY24ovhalEXTxZBdjLFTM-hs1	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1qNAjO6i9xFNnOUzQPsySoh8D42H2gwQgYxA-smt2Wnk				9		
312	841	1	27			2020									https://drive.google.com/open?id=1WS6k6f_cL8Xo9aoKHyqo59hO3LdcSZMi	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1e8_Mkn5ueMf3v1pYASXC7lfqWU6QD68Qs_LnYI1fK8A				9		
313	842	1	28			2020									https://drive.google.com/open?id=17xg7bY_Hn5Jlmw0tUhyGYYk4sKW31_hh	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=10M6fv5vJpRfw7tmef87w_0gfcUa4WLmjnxRMn1ePDr0				9		
314	843	1	29			2020									https://drive.google.com/open?id=1m_3KY-e6wvbdwq3DSLIGRb0BlKf-5BJ-	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Y_Fpmsr4Q46DFbfBST926Yb8p2NIfJM9V7Jtd3A8rMU				9		
315	844	1	30			2020									https://drive.google.com/open?id=1wL-G1NI64abP1S5Dg4rctLpu-IR61nLK	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1HVii9hHFnuzZcTWEIPrk94fVe9VWYjkGbxDHXoUKVcI				9		
316	845	1	31			2020									https://drive.google.com/open?id=1XNTEOi_ZyaKl1qoPOUXrF2iUmFe1_FUk	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1FbeNW7qlAD94hwGNlSOYkCYfD21C5UcTdmblhyQuw2c				9		
317	846	1	32			2020									https://drive.google.com/open?id=1yfta9hcsmcJG1hHSiuPzZki-HlKmv1Ol	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1hrNL4gTbdA2CJ9r5p-OWm3j5l4uG0kk_L91Ljv2xURY				9		
318	847	1	33			2020									https://drive.google.com/open?id=1xSnKuv5sxClfdbgH6QWEu47hSTJhABa-	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1m8G4vehwWCCt1iaayZywidoW4zysrl9lCLExWsJu3qk				9		
320	848	1	34			2020									https://drive.google.com/open?id=1GKdGPnThjGUXPBO_w7pnQ19F1gi-Vywq	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1xLOXGoZ_HixtAtPoQDzgOVDDpeXVeBuOzRocxSSGbac				9		
321	849	1	35			2020									https://drive.google.com/open?id=1MmD1gef8LYtklFeCEjTai1gX5GothhBt	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1k6a_SlGYsVQsCInufqxX_3de1RLKqiJK4EKbrva2urY				9		
322	850	1	36			2020									https://drive.google.com/open?id=1sszMEhGUrbew_RENq8xZmO2Wqe7FexGL	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Zg2C9QMeBzBQzk7eTVUSoETybK5bnDP7DNcIDuTMwwk				9		
323	851	1	38			2020									https://drive.google.com/open?id=19IfmZi0k47D4OggAXmHuVUe2Ieff4bd4	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1hpx-vkS_jIkC7e-SM6rl0pgw2-NFJUFiOoSsXPhkRgo				9		
324	852	1	39			2020									https://drive.google.com/open?id=1TQhf9jqRP2dIDwM0h6wU_t_pdd3dJ4-d	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1EWPlJkPZ7ebjScEu5fr5DYJFMy-acUHehDYy7Go2P_U				9		
325	853	1	39			2020									https://drive.google.com/open?id=1ufcCItT3yf1W_vmhvuSl1yIOg9Mys6sC	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1PPRl94YzgBYXcpOEf8ygLMMvu4wBhKIFr-XgmYtBaIk				12		
327	854	1	1			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=18unqtNgnVe9MmoNT-mNxwoQn2OZ0ZUSGX1F52XPAH-0				12		
328	855	1	2			2020									https://drive.google.com/open?id=1BKfAKoYlm3TsDsfrogAmipWMbGNugnM9	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ACud6OKVq9NtnaviOdSEzppf1E6bz_18XcopVNu24Ng				12		
329	856	1	3			2020									https://drive.google.com/open?id=1NjXbnjkDgoY9g1ASXSSkmDCgYnKK8e2t	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1v8IYNVjeCW_PIn38cyqxicUMGC4uqxcV24SO-Y5Gji4				12		
330	857	1	4			2020									https://drive.google.com/open?id=1_2b0Wus6LYn-UlBiqBD-mJ5qlfw8m_Vu	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ISS-McAMUlohDpA04QNQqwDy04QU1sJImQn_TK0pHiA				12		
331	858	1	5			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=14Luy89cntlKxqs728ZpAw-XsJIG_auZN3JNqZX10bv0				12		
332	859	1	7			2020									https://drive.google.com/open?id=1Nsq3eKbWtpFOI7pCrCn22snLfXOR5RA1	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1hftZsfi_qKzLJClNF31QnVgJg77kt4XrPVpP8_7wLgo				12		
334	860	1	8			2020									https://drive.google.com/open?id=1lmThLBu8KB3_4i3FenMd6Ooxe_Ek36gw	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1d4pqeeZWbaJWfJwm_8SWuzzBVsPPjyjevu-hZG5C1lk				12		
335	861	1	9			2020									https://drive.google.com/open?id=1KPDCoLvajEuAuUDnAjA5msB5SlpbeJsL	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1oCOYHex_FWQTRqMEisA9bIy9mgC_b6BL9zyoCsugiCY				12		
336	862	1	10			2020									https://drive.google.com/open?id=1mwOK6I9Yia_Mqh0ynfr28YJ7BpigN6yt	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1SSlXl6V0p9Fnu3Cln6fO18EW0YXuh1YPpxgikNQY2zY				12		
337	863	1	11			2020									https://drive.google.com/open?id=11AMfHjRSrvIEFosrqV6PGhuKGJkVCKDG	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=197RxN8wGXwyofgG43DvpJrgel8eg1kdBGj65_V8Ng7w				12		
338	864	1	13			2020									https://drive.google.com/open?id=1XsJV8YFzG7YxMt92W-Kp02lZ-p2n8N2x	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1TcTJduXCvm3nWyCdkk_6vbiKxwDHB-6zCxMDZ35NVK8				12		
339	865	1	12			2020									https://drive.google.com/open?id=1z5kTY7LP6ip1v8KDfLJu4lmZJJMgHBNf	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1XMbLi-NMSu0w8vulgxDeYXZxUtS-sDSbuw5yWbIGo64				12		
341	866	1	16			2020									https://drive.google.com/open?id=165Xtbbc3AAS3RuyWT5BQQbxx9hi9_3UL	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1gCr08q1R7aOCWSgdxlt_7pJWUXvW2204xan3VsdGkdI				12		
342	867	1	18			2020									https://drive.google.com/open?id=1VKmCscpKvAGIaQnjj-mZk1PZcZl8davG	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1JrcwZ4T0kutUisB7cC3YHjGZBBiywLloLlvXsVSWuIY				12		
343	868	1	21			2020									https://drive.google.com/open?id=1PDc_Vg-rgpX-3coRZiJSFG11sBpecDH8	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1tiA1m7AO2JIHxuBsRrJf6x6iCAHOYHqUMUwTlvtG1AE				12		
344	869	1	22			2020									https://drive.google.com/open?id=1JmYwnEzB0Q1sBr1XgttKhUmlFggHE4wl	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Y9wGfNd6NpX-CoXUEZQIPsXoBYV_3QLDTT_7bDms34s				12		
346	870	1	23			2020									https://drive.google.com/open?id=1zMj4zLOy0NrSrikuViewDy8G4bnYA6HV	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1VJzBAiCcZ1q8_EXcYJexZ2kT69pr0o-mbgUTs4k93N0				12		
347	871	1	24			2020									https://drive.google.com/open?id=1bp5VeALBjBMssg65tRtaDd6Pz6wAigCS	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1SpctUfW5EEotT1yHsDBG0YVDAy-ibJmKqwDLZQsEHHA				12		
348	872	1	26			2020									https://drive.google.com/open?id=1nO_ifpYuwRcBvvMEJ3NM-F1Akcl1IxbI	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1sf9meM9vFn--Wl-Q6thwLoQTmfRQ_YpPPz33I3pmoPk				12		
350	873	1	28			2020									https://drive.google.com/open?id=10Y79-FMArBfYhd6jIfhnZ6xbRzX4zgOu	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1JjlH0WNPKq33YbutuSU5SKjxSLFhjp46nTgdhZRFZEQ				12		
351	874	1	29			2020									https://drive.google.com/open?id=1T_brURXq89z7W_bArLWL1rspnW5A1Z-O	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dP9VM7B41dP5BXwsG4ml7oRPY1pWhmfymUXPVmgQviA				12		
352	875	1	31			2020									https://drive.google.com/open?id=1CnNlwH-_h4EuR4YSpujRLikqMXsIFQ7O	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1mtNVF8-mOOOaPuusrsvkOreancBeCU5-R_B6i7SB4Cc				12		
355	876	1	33			2020									https://drive.google.com/open?id=1netlOvhvNsWrKKUdgEfl5crTK9elD2oy	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1HtTSrRI7ZwWw8yZiHWepY4MfsIy4SdIHQdIX9QEjyEI				12		
356	877	1	35			2020									https://drive.google.com/open?id=14me7tkUyiSyWCOFJBwBIBwVX5sBEpoQ8	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1tKJW3QRcpqpl5TuMHA9a2HCsws6JQsZXa5m70WOj-tk				12		
357	878	1	37			2020									https://drive.google.com/open?id=1_ypLBh3spfnE9xNeir0EzlLI81vSEThA	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1erFSCUwsfgoxtY7USKeUGmYHeXdyxtmdfaaVd6TmaY4				12		
358	879	1	38			2020									https://drive.google.com/open?id=1Svbf54YrbS5U3IyXKI0076PCCqAYn60v	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1GcBCaDqzAOmx9muSOEcR934DJUy7zrdLYSXRzZlHXfc				12		
359	880	1	40			2020									https://drive.google.com/open?id=1U4MAQj4KPpL3oZ3JQx25KFNZDo5Mgzpk	https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ipaL6fPzrLZCJhhF9W09DWuH0pY507HVo5I1Jc9YrBQ				12		
360	881	1	10			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1S2R62ftu1ivGLm15os2nSpmsbxPyscBz8NYVdyIcVtM				11		
361	882	1	1			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1bdupXpDOwF7vKeU_D46vV4iHU3Gw78YDU3S4wCIM9Sk				10		
363	883	1	2			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1nNNPi8bJjuaD3DqMfrygWV_y8kkuNLIakfxXJUjcG14				10		
364	884	1	3			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=14CH56fPrDPgNfUaIp-K-ljarcd722ghAdH0B_xnzyXg				10		
365	885	1	4			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=12EL-CLxe0H6VOTksLAOk0wltOmWxWkpqMy2DaXV-sSg				10		
366	886	1	5			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1cSQVEiyV6XFB-AZSddOeUzCsbYSftSpkhR_waLNRpuQ				10		
367	887	1	6			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1jt2PzrBzc8nfjRGfhEzaxQp5zRWZtionSF1GNF9rEOA				10		
368	888	1	7			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1sot7mBaj4oY4KF1Ju8lxGGNVyLmuD8m-bWgoeM8lkOc				10		
369	889	1	9			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1duygq151IsvRoXjTeK9bWe8oOkg-2HuRPFeUza-0JvQ				10		
370	890	1	10			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1wYAnrxkoxeQVG1Pwuo68DpYteQlyzUUx38AEBQ562dE				10		
372	891	1	11			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1k7khizrduQgTpKRPoA7IGiYdefSnzw_OmndqsZr_4Fs				10		
373	892	1	13			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1o3lbpmwB_ZhnPjMg2nSmR77hNmvrpbTpbNPYimz35JI				10		
374	893	1	14			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1X0FpvynwBG8hDhgq9geChEs4EAba9sKnfGRxF0RLmWM				10		
375	894	1	15			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1N03kNAIr258TAl-0sqp787jhQY43yr3AEAGFGp2JGjs				10		
376	895	1	17			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ZVRIplR6-0nC8q0ta07BChD3e1AdZfCHXfUFp8kY0C4				10		
377	896	1	10			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1JPlDjWOCygUz7RZC_XM_G_fzSyPY7Rulp_uD7GS6Zj0				13		
378	897	1	18			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1NYSc3qDa8O4tsOzx7siZ9wFw5QAp6r8uEnE8HhfkdBo				10		
379	898	1	19			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1DdvHTJjYZhPv0wk5z8to08cbTkifOrBwNU8r90r8Hr4				10		
380	899	1	20			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1BMeYH4b2gSWVxjSSPEj1drMSCk5pFA0UXLilq22CWDo				10		
381	900	1	21			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1-Fl2xIVSmwR3cKoTJeau-07YJXVSh7XO2n2S4MM2Xbg				10		
382	901	1	22			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1uB_CKeycjo5w95zhRGtxhs_s3s78vnYyD53vrjYZMNk				10		
383	902	1	23			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1iDH9GYWlc1NxfsC1uL1TSaLUBm0ISmTX7PNo1LxpNmI				10		
384	903	1	26			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1kMVAyWlB-0P6NyBlbOhGX11dUd55EdumC_tNChpzAqo				10		
385	904	1	27			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1vttX4b93I16u0aQdjFXllEhnG2Gw1ItUHmAK09ezg8o				10		
386	905	1	28			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1K6R7zEKpACApjQh7CMw4wPcH5h0FM-lMMjGJqGHhJ14				10		
387	906	1	29			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1v58-Rpnxqb6CJUqCDCsQjCuImDJhzrqSSa2aZ3gn6ig				10		
388	907	1	31			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1CCLbJAy9mh5_eUOXZyQo52Cpb9I0vvgZgCkmD_L8ZB4				10		
389	908	1	32			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1XSxfaMD5Fh2WouchB8PrzhVBYx2Um4dn8z-bnR1enuk				10		
390	909	1	33			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1PlzyHLwYwdCWh4l65eSsNbz-N7y-SEgD1NTq9_5nfN0				10		
391	910	1	34			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1MPBQCSsUA-9Ugy2POTbRnn1D0RYKhAJao4Pe_5V-nKA				10		
392	911	1	35			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1YdlMVxijUkb5RsyOZhtFGYVqWOUOK_VWtJcDhP4gKDc				10		
393	912	1	36			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1XrUyWFn9uv4_V1K3GrzrZ3xyQ-IadPZ5WLTgBz6llI0				10		
394	913	1	37			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1iYOmqtDM_bxnQG-ClliTiG-J57ww6f7w81VMkOpxF9Q				10		
395	914	1	38			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1xuCIeXdoxJFa_wc71-aTHczNGS1VhRl9QQMvBykoBu0				10		
396	915	1	2			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1KQwE_CyjMSQPhd9MQmg5vgECpFirff8l0Hr8V1OoAI8				13		
397	916	1	3			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1gNeIE2MH2li7aNKEozD5wsJofKqB8kuNcyfXb0msu0E				13		
398	917	1	4			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1l1WthuPV6JC1dDaZbr0zX3hHzlFO3I8pM-JyMt17BCw				13		
400	918	1	6			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1BLvLikFILMxETwBhXVOCOWXjOlJgxdkXHajleVYRGtQ				13		
401	919	1	7			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1P8kTnIHntzyQ5ox245Y5RXpgoBLlEFDgyGur1DZeb7E				13		
403	920	1	16			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ewqxi6SAhv_NzccXVqOZf5nWbfqPvGp8Op5_25JwjC0				10		
405	921	1	31			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Bv1KTijOHv7jEwft3YbNit04h7nqqFN4BCWnZ0QkY6Y				13		
408	922	1	11			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1kn_az7j48whlEVWZWLTS06k5cV2ovDEkZ3__x1lw_1s				13		
409	923	1	12			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=19_95siYHYOWuzGdE4te_Q8CI7T08RH3nqiJrqOdKIBo				13		
410	924	1	13			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1WXuJvZINW4FQrb05-L9DVgM1Urf1sJvdLeA5MRcjrF8				13		
411	925	1	14			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1h9LdjCnZPrPJWnnSZw1-cTdu18caK08QZGUxhectNTk				13		
412	926	1	16			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1v3yXttbgxYoNoZ4c6oCSKRj7I2k-HnJ0d_BkCRF0C8k				13		
413	927	1	17			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1gtSJIXvgUdT8MHRGRFZdNI4ddhRNvbfwYO3qIQf39KI				13		
414	928	1	18			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1V_iooZjmovsKuioh3PPHorrTGnMWFl-QPGqCni0-s78				13		
415	929	1	20			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1vm5nUWV0Gk42vgd3XsgojH2-pReVIeQGd0cMCmlZKCg				13		
416	930	1	22			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Fap8cW_n-91laTKxx--NeeF6iEdbf72BVuF-EH8aH_g				13		
417	931	1	24			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1YR549LeSzHHL-0GJR61XVNqs0TtXbtYFp15WJ-obhGI				13		
420	932	1	27			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1JgPZVCqeHIzXBJKiX337MaMmM1pF0lOIfYzgxpbS71s				13		
421	933	1	28			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1IS-C0cA-I266ARzk4AIRLAkqPal8lpnYQSKk7yt03zI				13		
422	934	1	29			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1gF2KSTARxTCXWWjHV-wSlBmrmRS-hD1QUevJ_gW1BbA				13		
423	935	1	30			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1rxGx1fc76IvP-7gxoMskXO9YC8c_Czcp8t6uCsMTFZM				13		
424	936	1	34			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ev5k4Xxy2ymFDod1bHuqyF4ICLQURghakp_nw-0iIBs				12		
425	937	1	19			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1HK2Rvlx_QwpAeUzNF5W_Y1mYbVC_T3rPSRTCbf4SOvo				12		
426	938	1	6			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Uv1NA6U5hvM9ArzpCMngrvdyBDvXnDM6E93GV_NZKQk				9		
427	939	1	15			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1mxsB6OMJNZCLrGmz-wgxkIc6oou650uQ-TJ2uqAqIwc				12		
428	940	1	23			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1gp4tnXNeSnTfEjLrVyLSI34quLZNuffaGFgz3HcLNqU				9		
429	941	1	3			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1KkklCRjJAV_Lh5C_FH9hIdlkRHk6UGfU2uLlBaNr3jI				11		
430	942	1	11			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=18ksYXZmm3aDt4kcjDTsanSLXx8qRRPOL2CfM03Zd-eI				11		
431	943	1	24			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Nr4htby8AFvRRXo64gG4AulMHj6qW6KX2U1sO6bcUQM				10		
432	944	1	5			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1_bXShykpWHVx2NriCBpPGIPlDJVze2kOHaKMjbTpkMA				13		
433	945	1	8			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1-umJleN1vR1Dv66adYholYZEoLolWfrFQJwiCmidI4Q				13		
434	946	1	9			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1O1ljmLi3Kfa6KgPESN3FjyrvZkH9DA7eq5E5YJ5DY98				13		
435	947	1	23			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1NpUGcMsG7qxljAxSB6eKUtuXzQ7aYnbr0ZNc9tb8Z08				13		
436	948	1	25			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1_yCVfQOFohptUSoyyUNmEuZEXymp587pGD3TvAre_qA				13		
439	949	1	2			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1CRyfLxecsfQEw8Mt38I_EnNXI6W-rXzxtBEEOVme_1c				6		
440	950	1	23			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=117R9bjXXetqCBae2vMdWfjAHBhZ_bWSgMx01Ftb-laI				6		
442	951	1	30			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zEhi_cmOiFM08WbkIuk4ZEYOGjA7Kofs4WV89HLhAPM				12		
443	952	1	27			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1GRB6Mmiy0Nm_lsN9HcncE1rcbQA-UJZ70CCGdpDYa-Y				12		
444	953	1	15			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dR8gI5FE6kCuuHhb5JdlzO2Ih3lZrw2d5wHRWJPXsDE				13		
445	954	1	6			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1YTyDrPWaPQwSlAN3TJN45-4ggWIHyD3N5PXdYhk5q6k				12		
446	955	1	21			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=11AtIxe4-m7hGlMwLER2gv5Gty5LNaB-RnwMMNG7Wc3I				6		
447	956	1	32			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1hi-l5HDXJdiJdxRzDO22mUMvumTl9m2NK8SfjI7MTJ4				12		
448	957	1	21			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1uQXRLeciuJwMUfGA9Djmzf_x-rvPb79EXypb0YiQhok				13		
449	958	1	36			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Lh25sOvDLdj-Awl_ge10S3rsdke3Nan77uwRg_qccNk				12		
451	959	1	4			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=13IOujYBqPSXxuceoeVxIeIOmOzS2AFFdqKjAKW2Helc				2		
452	960	1	5			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=12_IxVuMF4uNRzSfJgTSBM19mL6EHYMaDMyKMmonUxFs				2		
453	961	1	9			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1vEL0_KQ1Vfc8p0Art_iKqkfCv01ty-bWW6braMnjcyg				1		
454	962	1	26			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1s368sqHnRuniU9SPuPkSW1evaTa38j0hCHWV0R4TIXo				1		
455	963	1	20			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1-HOaHsL09nvpm8vBi8bbcyvnE0MNmlZBMyDYqKhzsDI				1		
456	964	1	10			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1U42qMCuCx1cPq0ORTx2zwKXSQwOkGJUrtpdbWVGgNsA				2		
457	965	1	30			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=13eYepZBdLtz36OTX4bcuEl49NdCEQSHD42Ge_1gSFnI				2		
458	966	1	25			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ktxgbelMVytuRYxsfCOJcxTtbaD0y4prdn9zNb1fBAc				2		
459	967	1	8			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1izB9upI3WATy5M4yDORFuiITJjG8pOHnBiEdnpELg1c				2		
460	968	1	19			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1PSh7ZapoVHbwSmLGmIvXR4j2JpZEE29rwyt_YKA5_NA				2		
461	969	1	15			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1vnKNyGDBHfhlfirWEY_K4lx2sTvH6Jj_ja7y8kRYvr0				2		
462	970	1	8			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=18A_83cgI617m425CX1A1idwwXTAmw_Z55kPhKfruIgg				1		
463	971	1	7			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1pGaJFwhOW_tVpq8tyQ6KUDGeMacgQ7Dmuq7ndwpKnjo				2		
464	972	1	12			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1doik9T9JkIihCRflbTuXbXlou9L9xbBSFIJTIo2xiGs				2		
465	973	1	16			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1tNos6BqDexh2N6zY-vTWKJe-b8P8_09DcxdKWrb904g				2		
466	974	1	4			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1b3DGGGeiHRfYdIHeblAMGk_S2BQeBORJOyZHwqQCpO4				1		
467	975	1	14			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1I3xypviW2pnmpIHusQ_G_JfZhvxPosnJAm5PQ8Nce4o				2		
468	976	1	1			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1H8rYL0Eh7k3StWUJVqtVvRVEDsdysk0zR9t4BGuKTGY				1		
469	977	1	7			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1042R6NgSkRiWg4uueRJ-w5HMAQ4T4czLIMasd8IhfgM				1		
470	978	1	3			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1nvJkTxH6PTebRxJp7MgyhSlBiLQW_AtZgCn1owpdS28				1		
471	979	1	1			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Aj334TX613hawopTECXwB_Y7JlCIRtEagZ07pGXV2IQ				2		
472	980	1	11			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1M7RQN7exNkq4k90bwkOoHasmsOER4SIdnTRboevmXXY				2		
474	981	1	2			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1OucWzviFsUMBti7EdKnuHu3y5FJggO-d1sfdAwFZD9E				2		
475	982	1	29			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1iw97Gqk-z-i9zoPJcu4FQccjMtXRNaLEHAluUEGxFnE				2		
476	983	1	24			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1jp7JAnoBQ7gF-oxJA01eEQH6citPWxRcaTojOptFArc				1		
477	984	1	31			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1nA5JqBvWnxWy5RubTqJgjuv0hzFoBgJkhrsdShph630				2		
478	985	1	18			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1ZT9pTHVrbs1O8r0KVs5HyV7SxoAeVAA1uEAyAJJCBCQ				2		
479	986	1	26			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1SDw5jTf7KXL4I60I1LQjfYl5l4Szedxe6eHVA73m7Q4				2		
480	987	1	19			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1P7VpNOKXT99JFR97mFtrSHWw7B_jQyXW1wpgscQ6K2o				1		
481	988	1	6			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1SjFVScXwnvYfXKggOsci0jgkuYDQEeOrYYyueniOtv0				1		
482	989	1	14			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1_0_gJpJl8uH_FJvWgPeDIpERcwlxBiGSrrzU7IMYs7U				1		
483	990	1	17			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1JaKP9oW_5LjKBDo-pFX5A3pTr8qMIeQqFX3QMMYu4w4				2		
484	991	1	13			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1qSspN2hCDjXwjnlJRZTRqFrMqeLQYgOCuFovsOzkDR0				2		
485	992	1	3			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=15wN4ckXel42MCojNTsiHVoHr5POeuOFxMGwRYvetClU				2		
486	993	1	20			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1tpEvc_eDT-Xi0syC8tdCk38f6nmrjSXmQBuXJqmrlHI				2		
487	994	1	5			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1KlITZnLyiXhNl3ziiCwCZtLaOuHC0zkeYU0VQcnzVJo				1		
488	995	1	13			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1L6BAujR2lyoXbBol4Hb7g78WaOgoR4sk2oRza5P3uvo				1		
489	996	1	9			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=11PJOVZEmOLRVlxtdo1llmgP2gl_SZuD9U_cffc8FUHs				2		
490	997	1	28			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1sX8rInHaFJAPM6ys8OspgYthfFFT_HcEzzh15jIFwiU				2		
491	998	1	35			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1m-WouCynuTnQT6mzmJ_pHCecp8tZe7cOYGv-aUl3J9o				2		
492	999	1	27			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1iFOf2julw6BTgkIyfUoPZqE1H9MWB7w9hAcOMzjHGg8				2		
493	1000	1	22			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1558OMbKYiC8FuRuU_iZylgGBkG7_5xd3FBHLfcUkCLI				1		
494	1001	1	32			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=12vFD-V7SoR12f53KRVryUGotdk3f5ML6MX7LzxHbBMA				2		
495	1002	1	2			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1sQBm7EgAiFMK869zqUrwyK--zh0X8zwAiV7b8ncXErI				1		
496	1003	1	23			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1iMoRq39ZcCEkLuMYLRG5Mpjha2cwgtnI-ogNYWG7SeY				1		
497	1004	1	23			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dmralLlJG4Y7-Eju39H5GkX3wzN_FedHb1mezPdGK0o				2		
498	1005	1	15			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1OjcSMG8OY4g3ZCjEBgZsn0MPSd20yRv_Uj06sTg9Sw4				1		
499	1006	1	33			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1pJYqemZdVfqxZ9osmuU_W_IsPg2fc4HGdrQLVtTtiFI				2		
500	1007	1	24			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1kT1SeMP9VQc0HHwvH74_Ae2iyyJM61YF2e0PYz10Xs4				2		
501	1008	1	34			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Ajt0tR5roSfG4kHeeYOUgw0E4u7_vsZCzELXsGhe3iI				2		
502	1009	1	18			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1MiYQcm7ikQsjdP3AIjF06z2l0jxWYMR4YYnfrEvm4dk				1		
503	1010	1	22			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1-2dSWuVrdji3hqgd4R-sZvnRzuPyySOrln-O07LDolU				2		
504	1011	1	25			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1r3vb8jX9adlyLgXB55o3dj1pxwzFG5FVBMIT222gaNg				12		
505	1012	1	12			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=185_tNfwRTSU4uvpW7FGjlzcCqie3WmFsmGCepA9Ng5k				1		
506	1013	1	17			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1zjJsBc-57lCiar-n3DEOFnCaz64UcVuM9pFq9qQpRkU				12		
507	1014	1	25			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1d2V0qZaFXWAckt4gMWPmRRD9ecNerXN2z-IM6oYgoOY				1		
508	1015	1	16			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dJg6rcJWZN6XrLBtPr6v8lq-zii_jcMFV0-6MASAFCY				1		
509	1016	1	17			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1Ny-JkRNbyXTMkgEXxs4jcbax4k260j-AkEidDKK88nY				1		
510	1017	1	21			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=17wyElyLYRYjsR8ZfrSJtuGteAFigjn9eVZ5MNSequvI				2		
511	1018	1	14			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1JM54N46Qby52mb49RiYX_AfW72bgRBLuq6s0xK3Nl9s				11		
512	1019	1	12			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1i4mFcgldHOZgz5LNeO3xhnsNjSOK0hGGve1Ol_Ygn0U				10		
513	1020	1	25			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1MHLVyXInQ0iPYXloZr4tsz30wTOdbsC5eZ6p9dZRPmM				10		
514	1021	1	21			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=11v72O95PqGU4i_ScWWvGBQy-dJqpblwp_DdVt3GZTSk				1		
515	1022	1	6			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1dac3D7zv4Z2PCX16VAlFWAp81-nqexZrnTS4pUHqyk8				2		
516	1023	1	11			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1cFPvkHRBK9fyde6a8v6UNibJn5QTGmEo4HyPB6mdqdg				1		
517	1024	1	19			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=1UgHDWXPt1EqSwHckkxRAwGn-pA65XhvwKN5iFEU72xU				13		
518	1025	1	27			2020										https://docs.google.com/a/sagradoalcal.edu.ar/open?id=18UOM-J_lsSThF8P0WgZjPU54dbDiTffzBXexqtoF5LE				1		
519	1026	1	14			2020										https://drive.google.com/open?id=1Vb6AnypalC1OGTivFm762L6Jh6rB9KxS5Yct90WG6dE				12		
\.


--
-- Data for Name: _alcal_faltas; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_faltas (id, cantidad, fecha, estudiante_id) FROM stdin;
2	0.25		468
3	0.50		332
4	0.50		470
5	1.00		495
6	0.50		495
7	0.25		514
8	0.25		470
9	0.25		488
10	0.25		453
11	0.25		454
12	0.25		455
13	0.25		462
14	0.25		466
15	0.25		468
16	0.25		469
17	0.25		476
18	0.25		480
19	0.25		481
20	0.25		482
21	0.25		487
22	0.25		493
23	0.25		495
24	0.25		496
25	0.25		498
26	0.25		502
27	0.25		505
28	0.25		507
29	0.25		508
30	0.25		509
31	0.25		516
32	0.25		518
33	0.25		218
34	0.25		222
35	0.25		225
36	0.25		226
37	0.25		228
38	0.25		240
39	0.25		244
40	0.25		252
41	0.25		254
42	0.25		255
43	0.25		256
44	0.25		257
45	0.25		263
46	0.25		267
47	0.25		268
48	0.25		269
49	0.25		271
50	0.25		272
51	0.25		273
52	0.25		274
53	0.25		275
54	0.25		276
55	0.25		277
56	0.25		279
57	0.25		280
58	0.25		281
59	0.25		285
60	0.25		287
61	0.25		360
62	0.25		429
63	0.25		430
64	0.25		511
65	0.50		232
66	0.75		453
67	0.75		454
68	0.75		455
69	0.75		462
70	0.75		466
71	0.75		468
72	0.75		469
73	0.75		470
74	0.75		476
75	0.75		480
76	0.75		481
77	0.75		482
78	0.75		487
79	0.75		488
80	0.75		493
81	0.75		495
82	0.75		496
83	0.75		498
84	0.75		502
85	0.75		505
86	0.75		507
87	0.75		508
88	0.75		509
89	0.75		514
90	0.75		516
91	0.75		518
92	0.50		453
93	0.50		454
94	0.50		455
95	0.50		462
96	0.50		466
97	0.50		468
98	0.50		469
99	0.50		470
100	0.50		476
101	0.50		480
102	0.50		481
103	0.50		482
104	0.50		487
105	0.50		488
106	0.50		493
107	0.50		496
108	0.50		498
109	0.50		502
110	0.50		505
111	0.50		507
112	0.50		508
113	0.50		509
114	0.50		514
115	0.50		516
116	0.50		518
117	0.50		238
118	0.50		251
119	0.50		290
120	0.50		291
121	0.50		292
122	0.50		293
123	0.50		294
124	0.50		295
125	0.50		296
126	0.50		297
127	0.50		298
128	0.50		299
129	0.50		300
130	0.50		301
131	0.50		302
132	0.50		303
133	0.50		304
134	0.50		305
135	0.50		306
136	0.50		308
137	0.50		309
138	0.50		310
139	0.50		311
140	0.50		312
141	0.50		313
142	0.50		314
143	0.50		315
144	0.50		316
145	0.50		317
146	0.50		318
147	0.50		320
148	0.50		321
149	0.50		322
150	0.50		323
151	0.50		324
152	0.50		426
153	0.50		428
154	1.00		361
155	1.00		363
156	1.00		364
157	1.00		365
158	1.00		366
159	1.00		367
160	1.00		368
161	1.00		369
162	1.00		370
163	1.00		372
164	1.00		373
165	1.00		374
166	1.00		375
167	1.00		376
168	1.00		378
169	1.00		379
170	1.00		380
171	1.00		381
172	1.00		382
173	1.00		383
174	1.00		384
175	1.00		385
176	1.00		386
177	1.00		387
178	1.00		388
179	1.00		389
180	1.00		390
181	1.00		391
182	1.00		392
183	1.00		393
184	1.00		394
185	1.00		395
186	1.00		403
187	1.00		431
188	1.00		512
189	1.00		513
190	0.25		361
191	0.25		363
192	0.25		364
193	0.25		365
194	0.25		366
195	0.25		367
196	0.25		368
197	0.25		369
198	0.25		370
199	0.25		372
200	0.25		373
201	0.25		374
202	0.25		375
203	0.25		376
204	0.25		378
205	0.25		379
206	0.25		380
207	0.25		381
208	0.25		382
209	0.25		383
210	0.25		384
211	0.25		385
212	0.25		386
213	0.25		387
214	0.25		388
215	0.25		389
216	0.25		390
217	0.25		391
218	0.25		392
219	0.25		393
220	0.25		394
221	0.25		395
222	0.25		403
223	0.25		431
224	0.25		512
225	0.25		513
226	0.50		468
227	0.50		453
228	0.50		454
229	0.50		455
230	0.50		462
231	0.50		466
232	0.50		469
233	0.50		470
234	0.50		476
235	0.50		480
236	0.50		481
237	0.50		482
238	0.50		487
239	0.50		488
240	0.50		493
241	0.50		495
242	0.50		496
243	0.50		498
244	0.50		502
245	0.50		505
246	0.50		507
247	0.50		508
248	0.50		509
249	0.50		514
250	0.50		516
251	0.50		518
\.


--
-- Data for Name: _alcal_fechaaltabaja; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_fechaaltabaja (id, fecha, tipo, estudiante_id) FROM stdin;
\.


--
-- Data for Name: _alcal_inasistencia; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_inasistencia (id, fecha, curso_id, estudiante_id, tipo, turno) FROM stdin;
53		1	453	4	0
54		1	454	4	0
55		1	455	4	0
56		1	462	4	0
57		1	466	4	0
58		1	468	4	0
59		1	469	4	0
60		1	470	4	0
61		1	476	4	0
62		1	480	4	0
63		1	481	4	0
64		1	482	4	0
65		1	487	4	0
66		1	488	4	0
67		1	493	4	0
68		1	495	4	0
69		1	496	4	0
70		1	498	4	0
71		1	502	4	0
72		1	505	4	0
73		1	507	4	0
74		1	508	4	0
75		1	509	4	0
76		1	514	4	0
77		1	516	4	0
78		1	518	4	0
79		1	468	4	1
80		12	307	4	2
81		12	325	4	2
82		12	327	4	2
83		12	328	4	2
84		12	329	4	2
85		12	330	4	2
86		12	331	4	2
87		12	332	4	2
88		12	334	4	2
89		12	335	4	2
90		12	336	4	2
91		12	337	4	2
92		12	338	4	2
93		12	339	4	2
94		12	341	4	2
95		12	342	4	2
96		12	343	4	2
97		12	344	4	2
98		12	346	4	2
99		12	347	4	2
100		12	348	4	2
101		12	350	4	2
102		12	351	4	2
103		12	352	4	2
104		12	355	4	2
105		12	356	4	2
106		12	357	4	2
107		12	358	4	2
108		12	359	4	2
109		12	424	4	2
110		12	425	4	2
111		12	427	4	2
112		12	442	4	2
113		12	443	4	2
114		12	445	4	2
115		12	447	4	2
116		12	449	4	2
117		12	504	4	2
118		12	506	4	2
119		12	519	4	2
120		12	332	1	1
121		1	453	4	1
122		1	454	4	1
123		1	455	4	1
124		1	462	4	1
125		1	466	4	1
126		1	469	4	1
127		1	470	4	1
128		1	476	4	1
129		1	480	4	1
130		1	481	4	1
131		1	482	4	1
132		1	487	4	1
133		1	488	4	1
134		1	493	4	1
135		1	495	4	1
136		1	496	4	1
137		1	498	4	1
138		1	502	4	1
139		1	505	4	1
140		1	507	4	1
141		1	508	4	1
142		1	509	4	1
143		1	514	4	1
144		1	516	4	1
145		1	518	4	1
146		1	453	4	2
147		1	454	4	2
148		1	455	4	2
149		1	462	4	2
150		1	466	4	2
151		1	468	4	2
152		1	469	4	2
153		1	470	4	2
154		1	476	4	2
155		1	480	4	2
156		1	481	4	2
157		1	482	4	2
158		1	487	4	2
159		1	488	4	2
160		1	493	4	2
161		1	495	4	2
162		1	496	4	2
163		1	498	4	2
164		1	502	4	2
165		1	505	4	2
166		1	507	4	2
167		1	508	4	2
168		1	509	4	2
169		1	514	4	2
170		1	516	4	2
171		1	518	4	2
172		1	453	4	0
173		1	454	4	0
174		1	455	4	0
175		1	462	4	0
176		1	466	4	0
177		1	468	4	0
178		1	469	4	0
179		1	470	4	0
180		1	476	4	0
181		1	480	4	0
182		1	481	4	0
183		1	482	4	0
184		1	487	4	0
185		1	488	4	0
186		1	493	4	0
187		1	495	4	0
188		1	496	4	0
189		1	498	4	0
190		1	502	4	0
191		1	505	4	0
192		1	507	4	0
193		1	508	4	0
194		1	509	4	0
195		1	514	4	0
196		1	516	4	0
197		1	518	4	0
198		1	453	4	1
199		1	454	4	1
200		1	455	4	1
201		1	462	4	1
202		1	466	4	1
203		1	468	4	1
204		1	469	4	1
205		1	470	4	1
206		1	476	4	1
207		1	480	4	1
208		1	481	4	1
209		1	482	4	1
210		1	487	4	1
211		1	488	4	1
212		1	493	4	1
213		1	495	4	1
214		1	496	4	1
215		1	498	4	1
216		1	502	4	1
217		1	505	4	1
218		1	507	4	1
219		1	508	4	1
220		1	509	4	1
221		1	514	4	1
222		1	516	4	1
223		1	518	4	1
224		1	453	4	2
225		1	454	4	2
226		1	455	4	2
227		1	462	4	2
228		1	466	4	2
229		1	468	4	2
230		1	469	4	2
231		1	470	4	2
232		1	476	4	2
233		1	480	4	2
234		1	481	4	2
235		1	482	4	2
236		1	487	4	2
237		1	488	4	2
238		1	493	4	2
239		1	495	4	2
240		1	496	4	2
241		1	498	4	2
242		1	502	4	2
243		1	505	4	2
244		1	507	4	2
245		1	508	4	2
246		1	509	4	2
247		1	514	4	2
248		1	516	4	2
249		1	518	4	2
250		1	453	0	0
251		1	454	0	0
252		1	455	0	0
253		1	462	0	0
254		1	466	0	0
255		1	468	0	0
256		1	469	0	0
257		1	470	0	0
258		1	476	0	0
259		1	480	0	0
260		1	481	0	0
261		1	482	0	0
262		1	487	0	0
263		1	488	0	0
264		1	493	0	0
265		1	495	0	0
266		1	496	0	0
267		1	498	0	0
268		1	502	0	0
269		1	505	0	0
270		1	507	0	0
271		1	508	0	0
272		1	509	0	0
273		1	514	0	0
274		1	516	0	0
275		1	518	0	0
276		1	453	0	2
277		1	454	0	2
278		1	455	0	2
279		1	462	0	2
280		1	466	0	2
281		1	468	0	2
282		1	469	0	2
283		1	470	0	2
284		1	476	0	2
285		1	480	0	2
286		1	481	0	2
287		1	482	0	2
288		1	487	0	2
289		1	488	0	2
290		1	493	0	2
291		1	495	0	2
292		1	496	0	2
293		1	498	0	2
294		1	502	0	2
295		1	505	0	2
296		1	507	0	2
297		1	508	0	2
298		1	509	0	2
299		1	514	0	2
300		1	516	0	2
301		1	518	0	2
302		1	453	4	0
303		1	454	4	0
304		1	455	4	0
305		1	462	4	0
306		1	466	4	0
307		1	468	4	0
308		1	469	4	0
309		1	470	4	0
310		1	476	4	0
311		1	480	4	0
312		1	481	4	0
313		1	482	4	0
314		1	487	4	0
315		1	488	4	0
316		1	493	4	0
317		1	495	4	0
318		1	496	4	0
319		1	498	4	0
320		1	502	4	0
321		1	505	4	0
322		1	507	4	0
323		1	508	4	0
324		1	509	4	0
325		1	514	4	0
326		1	516	4	0
327		1	518	4	0
328		1	453	4	2
329		1	454	4	2
330		1	455	4	2
331		1	462	4	2
332		1	466	4	2
333		1	468	4	2
334		1	469	4	2
335		1	470	4	2
336		1	476	4	2
337		1	480	4	2
338		1	481	4	2
339		1	482	4	2
340		1	487	4	2
341		1	488	4	2
342		1	493	4	2
343		1	495	4	2
344		1	496	4	2
345		1	498	4	2
346		1	502	4	2
347		1	505	4	2
348		1	507	4	2
349		1	508	4	2
350		1	509	4	2
351		1	514	4	2
352		1	516	4	2
353		1	518	4	2
354		1	453	4	0
355		1	454	4	0
356		1	455	4	0
357		1	462	4	0
358		1	466	4	0
359		1	468	4	0
360		1	469	4	0
361		1	470	4	0
362		1	476	4	0
363		1	480	4	0
364		1	481	4	0
365		1	482	4	0
366		1	487	4	0
367		1	488	4	0
368		1	493	4	0
369		1	495	4	0
370		1	496	4	0
371		1	498	4	0
372		1	502	4	0
373		1	505	4	0
374		1	507	4	0
375		1	508	4	0
376		1	509	4	0
377		1	514	4	0
378		1	516	4	0
379		1	518	4	0
380		1	453	4	1
381		1	454	4	1
382		1	455	4	1
383		1	462	4	1
384		1	466	4	1
385		1	468	4	1
386		1	469	4	1
387		1	470	4	1
388		1	476	4	1
389		1	480	4	1
390		1	481	4	1
391		1	482	4	1
392		1	487	4	1
393		1	488	4	1
394		1	493	4	1
395		1	495	4	1
396		1	496	4	1
397		1	498	4	1
398		1	502	4	1
399		1	505	4	1
400		1	507	4	1
401		1	508	4	1
402		1	509	4	1
403		1	514	4	1
404		1	516	4	1
405		1	518	4	1
406		13	253	4	0
407		13	377	4	0
408		13	396	4	0
409		13	397	4	0
410		13	398	4	0
411		13	400	4	0
412		13	401	4	0
413		13	405	4	0
414		13	408	4	0
415		13	409	4	0
416		13	410	4	0
417		13	411	4	0
418		13	412	4	0
419		13	413	4	0
420		13	414	4	0
421		13	415	4	0
422		13	416	4	0
423		13	417	4	0
424		13	420	4	0
425		13	421	4	0
426		13	422	4	0
427		13	423	4	0
428		13	432	4	0
429		13	433	4	0
430		13	434	4	0
431		13	435	4	0
432		13	436	4	0
433		13	444	4	0
434		13	448	4	0
435		13	517	4	0
436		13	253	4	1
437		13	377	4	1
438		13	396	4	1
439		13	397	4	1
440		13	398	4	1
441		13	400	4	1
442		13	401	4	1
443		13	405	4	1
444		13	408	4	1
445		13	409	4	1
446		13	410	4	1
447		13	411	4	1
448		13	412	4	1
449		13	413	4	1
450		13	414	4	1
451		13	415	4	1
452		13	416	4	1
453		13	417	4	1
454		13	420	4	1
455		13	421	4	1
456		13	422	4	1
457		13	423	4	1
458		13	432	4	1
459		13	433	4	1
460		13	434	4	1
461		13	435	4	1
462		13	436	4	1
463		13	444	4	1
464		13	448	4	1
465		13	517	4	1
466		1	453	0	1
467		1	454	0	1
468		1	455	0	1
469		1	462	0	1
470		1	466	0	1
471		1	468	0	1
472		1	469	0	1
473		1	470	0	1
474		1	476	0	1
475		1	480	0	1
476		1	481	0	1
477		1	482	0	1
478		1	487	0	1
479		1	488	0	1
480		1	493	0	1
481		1	495	0	1
482		1	496	0	1
483		1	498	0	1
484		1	502	0	1
485		1	505	0	1
486		1	507	0	1
487		1	508	0	1
488		1	509	0	1
489		1	514	0	1
490		1	516	0	1
491		1	518	0	1
492		1	453	4	0
493		1	454	4	0
494		1	455	4	0
495		1	462	4	0
496		1	466	4	0
497		1	468	4	0
498		1	469	4	0
499		1	470	4	0
500		1	476	4	0
501		1	480	4	0
502		1	481	4	0
503		1	482	4	0
504		1	487	4	0
505		1	488	4	0
506		1	493	4	0
507		1	495	4	0
508		1	496	4	0
509		1	498	4	0
510		1	502	4	0
511		1	505	4	0
512		1	507	4	0
513		1	508	4	0
514		1	509	4	0
515		1	514	4	0
516		1	516	4	0
517		1	518	4	0
518		1	453	4	1
519		1	454	4	1
520		1	455	4	1
521		1	462	4	1
522		1	466	4	1
523		1	468	4	1
524		1	469	4	1
525		1	470	4	1
526		1	476	4	1
527		1	480	4	1
528		1	481	4	1
529		1	482	4	1
530		1	487	4	1
531		1	488	4	1
532		1	493	4	1
533		1	495	4	1
534		1	496	4	1
535		1	498	4	1
536		1	502	4	1
537		1	505	4	1
538		1	507	4	1
539		1	508	4	1
540		1	509	4	1
541		1	514	4	1
542		1	516	4	1
543		1	518	4	1
544		1	453	4	0
545		1	454	4	0
546		1	455	4	0
547		1	462	4	0
548		1	466	4	0
549		1	468	4	0
550		1	469	4	0
551		1	470	4	0
552		1	476	4	0
553		1	480	4	0
554		1	481	4	0
555		1	482	4	0
556		1	487	4	0
557		1	488	4	0
558		1	493	4	0
559		1	495	4	0
560		1	496	4	0
561		1	498	4	0
562		1	502	4	0
563		1	505	4	0
564		1	507	4	0
565		1	508	4	0
566		1	509	4	0
567		1	514	4	0
568		1	516	4	0
569		1	518	4	0
570		1	453	4	0
571		1	454	4	0
572		1	455	4	0
573		1	462	4	0
574		1	466	4	0
575		1	468	4	0
576		1	469	4	0
577		1	470	4	0
578		1	476	4	0
579		1	480	4	0
580		1	481	4	0
581		1	482	4	0
582		1	487	4	0
583		1	488	4	0
584		1	493	4	0
585		1	495	4	0
586		1	496	4	0
587		1	498	4	0
588		1	502	4	0
589		1	505	4	0
590		1	507	4	0
591		1	508	4	0
592		1	509	4	0
593		1	514	4	0
594		1	516	4	0
595		1	518	4	0
596		1	453	4	0
597		1	454	4	0
598		1	455	4	0
599		1	462	4	0
600		1	466	4	0
601		1	468	4	0
602		1	469	4	0
603		1	470	4	0
604		1	476	4	0
605		1	480	4	0
606		1	481	4	0
607		1	482	4	0
608		1	487	4	0
609		1	488	4	0
610		1	493	4	0
611		1	495	4	0
612		1	496	4	0
613		1	498	4	0
614		1	502	4	0
615		1	505	4	0
616		1	507	4	0
617		1	508	4	0
618		1	509	4	0
619		1	514	4	0
620		1	516	4	0
621		1	518	4	0
622		1	453	4	0
623		1	454	4	0
624		1	455	4	0
625		1	462	4	0
626		1	466	4	0
627		1	468	4	0
628		1	469	4	0
629		1	470	4	0
630		1	476	4	0
631		1	480	4	0
632		1	481	4	0
633		1	482	4	0
634		1	487	4	0
635		1	488	4	0
636		1	493	4	0
637		1	495	4	0
638		1	496	4	0
639		1	498	4	0
640		1	502	4	0
641		1	505	4	0
642		1	507	4	0
643		1	508	4	0
644		1	509	4	0
645		1	514	4	0
646		1	516	4	0
647		1	518	4	0
648		1	453	4	0
649		1	454	4	0
650		1	455	4	0
651		1	462	4	0
652		1	466	4	0
653		1	468	4	0
654		1	469	4	0
655		1	470	4	0
656		1	476	4	0
657		1	480	4	0
658		1	481	4	0
659		1	482	4	0
660		1	487	4	0
661		1	488	4	0
662		1	493	4	0
663		1	495	4	0
664		1	496	4	0
665		1	498	4	0
666		1	502	4	0
667		1	505	4	0
668		1	507	4	0
669		1	508	4	0
670		1	509	4	0
671		1	514	4	0
672		1	516	4	0
673		1	518	4	0
674		1	453	4	0
675		1	454	4	0
676		1	455	4	0
677		1	462	4	0
678		1	466	4	0
679		1	468	4	0
680		1	469	4	0
681		1	470	4	0
682		1	476	4	0
683		1	480	4	0
684		1	481	4	0
685		1	482	4	0
686		1	487	4	0
687		1	488	4	0
688		1	493	4	0
689		1	495	4	0
690		1	496	4	0
691		1	498	4	0
692		1	502	4	0
693		1	505	4	0
694		1	507	4	0
695		1	508	4	0
696		1	509	4	0
697		1	514	4	0
698		1	516	4	0
699		1	518	4	0
700		1	453	4	1
701		1	454	4	1
702		1	455	4	1
703		1	462	4	1
704		1	466	4	1
705		1	468	4	1
706		1	469	4	1
707		1	470	4	1
708		1	476	4	1
709		1	480	4	1
710		1	481	4	1
711		1	482	4	1
712		1	487	4	1
713		1	488	4	1
714		1	493	4	1
715		1	495	4	1
716		1	496	4	1
717		1	498	4	1
718		1	502	4	1
719		1	505	4	1
720		1	507	4	1
721		1	508	4	1
722		1	509	4	1
723		1	514	4	1
724		1	516	4	1
725		1	518	4	1
726		1	453	4	0
727		1	454	4	0
728		1	455	4	0
729		1	462	4	0
730		1	466	4	0
731		1	468	4	0
732		1	469	4	0
733		1	470	4	0
734		1	476	4	0
735		1	480	4	0
736		1	481	4	0
737		1	482	4	0
738		1	487	4	0
739		1	488	4	0
740		1	493	4	0
741		1	495	4	0
742		1	496	4	0
743		1	498	4	0
744		1	502	4	0
745		1	505	4	0
746		1	507	4	0
747		1	508	4	0
748		1	509	4	0
749		1	514	4	0
750		1	516	4	0
751		1	518	4	0
752		1	453	4	1
753		1	454	4	1
754		1	455	4	1
755		1	462	4	1
756		1	466	4	1
757		1	468	4	1
758		1	469	4	1
759		1	470	4	1
760		1	476	4	1
761		1	480	4	1
762		1	481	4	1
763		1	482	4	1
764		1	487	4	1
765		1	488	4	1
766		1	493	4	1
767		1	495	4	1
768		1	496	4	1
769		1	498	4	1
770		1	502	4	1
771		1	505	4	1
772		1	507	4	1
773		1	508	4	1
774		1	509	4	1
775		1	514	4	1
776		1	516	4	1
777		1	518	4	1
778		1	453	4	0
779		1	454	4	0
780		1	455	4	0
781		1	462	4	0
782		1	466	4	0
783		1	468	4	0
784		1	469	4	0
785		1	470	4	0
786		1	476	4	0
787		1	480	4	0
788		1	481	4	0
789		1	482	4	0
790		1	487	4	0
791		1	488	4	0
792		1	493	4	0
793		1	495	4	0
794		1	496	4	0
795		1	498	4	0
796		1	502	4	0
797		1	505	4	0
798		1	507	4	0
799		1	508	4	0
800		1	509	4	0
801		1	514	4	0
802		1	516	4	0
803		1	518	4	0
804		1	453	4	1
805		1	454	4	1
806		1	455	4	1
807		1	462	4	1
808		1	466	4	1
809		1	468	4	1
810		1	469	4	1
811		1	470	4	1
812		1	476	4	1
813		1	480	4	1
814		1	481	4	1
815		1	482	4	1
816		1	487	4	1
817		1	488	4	1
818		1	493	4	1
819		1	495	4	1
820		1	496	4	1
821		1	498	4	1
822		1	502	4	1
823		1	505	4	1
824		1	507	4	1
825		1	508	4	1
826		1	509	4	1
827		1	514	4	1
828		1	516	4	1
829		1	518	4	1
830		1	453	4	0
831		1	454	4	0
832		1	455	4	0
833		1	462	4	0
834		1	466	4	0
835		1	468	4	0
836		1	469	4	0
837		1	470	4	0
838		1	476	4	0
839		1	480	4	0
840		1	481	4	0
841		1	482	4	0
842		1	487	4	0
843		1	488	4	0
844		1	493	4	0
845		1	495	4	0
846		1	496	4	0
847		1	498	4	0
848		1	502	4	0
849		1	505	4	0
850		1	507	4	0
851		1	508	4	0
852		1	509	4	0
853		1	514	4	0
854		1	516	4	0
855		1	518	4	0
856		1	453	4	1
857		1	454	4	1
858		1	455	4	1
859		1	462	4	1
860		1	466	4	1
861		1	468	4	1
862		1	469	4	1
863		1	470	4	1
864		1	476	4	1
865		1	480	4	1
866		1	481	4	1
867		1	482	4	1
868		1	487	4	1
869		1	488	4	1
870		1	493	4	1
871		1	495	4	1
872		1	496	4	1
873		1	498	4	1
874		1	502	4	1
875		1	505	4	1
876		1	507	4	1
877		1	508	4	1
878		1	509	4	1
879		1	514	4	1
880		1	516	4	1
881		1	518	4	1
882		10	361	4	1
883		10	363	4	1
884		10	364	4	1
885		10	365	4	1
886		10	366	4	1
887		10	367	4	1
888		10	368	4	1
889		10	369	4	1
890		10	370	4	1
891		10	372	4	1
892		10	373	4	1
893		10	374	4	1
894		10	375	4	1
895		10	376	4	1
896		10	378	4	1
897		10	379	4	1
898		10	380	4	1
899		10	381	4	1
900		10	382	4	1
901		10	383	4	1
902		10	384	4	1
903		10	385	4	1
904		10	386	4	1
905		10	387	4	1
906		10	388	4	1
907		10	389	4	1
908		10	390	4	1
909		10	391	4	1
910		10	392	4	1
911		10	393	4	1
912		10	394	4	1
913		10	395	4	1
914		10	403	4	1
915		10	431	4	1
916		10	512	4	1
917		10	513	4	1
918		10	361	4	2
919		10	363	4	2
920		10	364	4	2
921		10	365	4	2
922		10	366	4	2
923		10	367	4	2
924		10	368	4	2
925		10	369	4	2
926		10	370	4	2
927		10	372	4	2
928		10	373	4	2
929		10	374	4	2
930		10	375	4	2
931		10	376	4	2
932		10	378	4	2
933		10	379	4	2
934		10	380	4	2
935		10	381	4	2
936		10	382	4	2
937		10	383	4	2
938		10	384	4	2
939		10	385	4	2
940		10	386	4	2
941		10	387	4	2
942		10	388	4	2
943		10	389	4	2
944		10	390	4	2
945		10	391	4	2
946		10	392	4	2
947		10	393	4	2
948		10	394	4	2
949		10	395	4	2
950		10	403	4	2
951		10	431	4	2
952		10	512	4	2
953		10	513	4	2
954		10	361	4	1
955		10	363	4	1
956		10	364	4	1
957		10	365	4	1
958		10	366	4	1
959		10	367	4	1
960		10	368	4	1
961		10	369	4	1
962		10	370	4	1
963		10	372	4	1
964		10	373	4	1
965		10	374	4	1
966		10	375	4	1
967		10	376	4	1
968		10	378	4	1
969		10	379	4	1
970		10	380	4	1
971		10	381	4	1
972		10	382	4	1
973		10	383	4	1
974		10	384	4	1
975		10	385	4	1
976		10	386	4	1
977		10	387	4	1
978		10	388	4	1
979		10	389	4	1
980		10	390	4	1
981		10	391	4	1
982		10	392	4	1
983		10	393	4	1
984		10	394	4	1
985		10	395	4	1
986		10	403	4	1
987		10	431	4	1
988		10	512	4	1
989		10	513	4	1
990		10	361	4	2
991		10	363	4	2
992		10	364	4	2
993		10	365	4	2
994		10	366	4	2
995		10	367	4	2
996		10	368	4	2
997		10	369	4	2
998		10	370	4	2
999		10	372	4	2
1000		10	373	4	2
1001		10	374	4	2
1002		10	375	4	2
1003		10	376	4	2
1004		10	378	4	2
1005		10	379	4	2
1006		10	380	4	2
1007		10	381	4	2
1008		10	382	4	2
1009		10	383	4	2
1010		10	384	4	2
1011		10	385	4	2
1012		10	386	4	2
1013		10	387	4	2
1014		10	388	4	2
1015		10	389	4	2
1016		10	390	4	2
1017		10	391	4	2
1018		10	392	4	2
1019		10	393	4	2
1020		10	394	4	2
1021		10	395	4	2
1022		10	403	4	2
1023		10	431	4	2
1024		10	512	4	2
1025		10	513	4	2
1026		10	361	1	1
1027		10	363	1	1
1028		10	364	1	1
1029		10	365	1	1
1030		10	366	1	1
1031		10	367	1	1
1032		10	368	1	1
1033		10	369	1	1
1034		10	370	1	1
1035		10	372	1	1
1036		10	373	1	1
1037		10	374	1	1
1038		10	375	1	1
1039		10	376	1	1
1040		10	378	1	1
1041		10	379	1	1
1042		10	380	1	1
1043		10	381	1	1
1044		10	382	1	1
1045		10	383	1	1
1046		10	384	1	1
1047		10	385	1	1
1048		10	386	1	1
1049		10	387	1	1
1050		10	388	1	1
1051		10	389	1	1
1052		10	390	1	1
1053		10	391	1	1
1054		10	392	1	1
1055		10	393	1	1
1056		10	394	1	1
1057		10	395	1	1
1058		10	403	1	1
1059		10	431	1	1
1060		10	512	1	1
1061		10	513	1	1
1062		10	361	1	2
1063		10	363	1	2
1064		10	364	1	2
1065		10	365	1	2
1066		10	366	1	2
1067		10	367	1	2
1068		10	368	1	2
1069		10	369	1	2
1070		10	370	1	2
1071		10	372	1	2
1072		10	373	1	2
1073		10	374	1	2
1074		10	375	1	2
1075		10	376	1	2
1076		10	378	1	2
1077		10	379	1	2
1078		10	380	1	2
1079		10	381	1	2
1080		10	382	1	2
1081		10	383	1	2
1082		10	384	1	2
1083		10	385	1	2
1084		10	386	1	2
1085		10	387	1	2
1086		10	388	1	2
1087		10	389	1	2
1088		10	390	1	2
1089		10	391	1	2
1090		10	392	1	2
1091		10	393	1	2
1092		10	394	1	2
1093		10	395	1	2
1094		10	403	1	2
1095		10	431	1	2
1096		10	512	1	2
1097		10	513	1	2
1098		1	514	0	0
1099		1	470	0	0
1100		1	488	0	0
1101		1	453	0	0
1102		1	454	0	0
1103		1	455	0	0
1104		1	462	0	0
1105		1	466	0	0
1106		1	468	0	0
1107		1	469	0	0
1108		1	476	0	0
1109		1	480	0	0
1110		1	481	0	0
1111		1	482	0	0
1112		1	487	0	0
1113		1	493	0	0
1114		1	495	0	0
1115		1	496	0	0
1116		1	498	0	0
1117		1	502	0	0
1118		1	505	0	0
1119		1	507	0	0
1120		1	508	0	0
1121		1	509	0	0
1122		1	516	0	0
1123		1	518	0	0
1124		1	453	0	2
1125		1	454	0	2
1126		1	455	0	2
1127		1	462	0	2
1128		1	466	0	2
1129		1	468	0	2
1130		1	469	0	2
1131		1	470	0	2
1132		1	476	0	2
1133		1	480	0	2
1134		1	481	0	2
1135		1	482	0	2
1136		1	487	0	2
1137		1	488	0	2
1138		1	493	0	2
1139		1	495	0	2
1140		1	496	0	2
1141		1	498	0	2
1142		1	502	0	2
1143		1	505	0	2
1144		1	507	0	2
1145		1	508	0	2
1146		1	509	0	2
1147		1	514	0	2
1148		1	516	0	2
1149		1	518	0	2
1150		1	453	2	1
1151		1	454	2	1
1152		1	455	2	1
1153		1	462	2	1
1154		1	466	2	1
1155		1	468	2	1
1156		1	469	2	1
1157		1	470	2	1
1158		1	476	2	1
1159		1	480	2	1
1160		1	481	2	1
1161		1	482	2	1
1162		1	487	2	1
1163		1	488	2	1
1164		1	493	2	1
1165		1	495	2	1
1166		1	496	2	1
1167		1	498	2	1
1168		1	502	2	1
1169		1	505	2	1
1170		1	507	2	1
1171		1	508	2	1
1172		1	509	2	1
1173		1	514	2	1
1174		1	516	2	1
1175		1	518	2	1
1176		11	218	0	0
1177		11	222	0	0
1178		11	225	0	0
1179		11	226	0	0
1180		11	228	0	0
1181		11	240	0	0
1182		11	244	0	0
1183		11	252	0	0
1184		11	254	0	0
1185		11	255	0	0
1186		11	256	0	0
1187		11	257	0	0
1188		11	263	0	0
1189		11	267	0	0
1190		11	268	0	0
1191		11	269	0	0
1192		11	271	0	0
1193		11	272	0	0
1194		11	273	0	0
1195		11	274	0	0
1196		11	275	0	0
1197		11	276	0	0
1198		11	277	0	0
1199		11	279	0	0
1200		11	280	0	0
1201		11	281	0	0
1202		11	285	0	0
1203		11	287	0	0
1204		11	360	0	0
1205		11	429	0	0
1206		11	430	0	0
1207		11	511	0	0
1208		11	218	0	2
1209		11	222	0	2
1210		11	225	0	2
1211		11	226	0	2
1212		11	228	0	2
1213		11	240	0	2
1214		11	244	0	2
1215		11	252	0	2
1216		11	254	0	2
1217		11	255	0	2
1218		11	256	0	2
1219		11	257	0	2
1220		11	263	0	2
1221		11	267	0	2
1222		11	268	0	2
1223		11	269	0	2
1224		11	271	0	2
1225		11	272	0	2
1226		11	273	0	2
1227		11	274	0	2
1228		11	275	0	2
1229		11	276	0	2
1230		11	277	0	2
1231		11	279	0	2
1232		11	280	0	2
1233		11	281	0	2
1234		11	285	0	2
1235		11	287	0	2
1236		11	360	0	2
1237		11	429	0	2
1238		11	430	0	2
1239		11	511	0	2
1240		11	218	0	1
1241		11	222	0	1
1242		11	225	0	1
1243		11	226	0	1
1244		11	228	0	1
1245		11	240	0	1
1246		11	244	0	1
1247		11	252	0	1
1248		11	254	0	1
1249		11	255	0	1
1250		11	256	0	1
1251		11	257	0	1
1252		11	263	0	1
1253		11	267	0	1
1254		11	268	0	1
1255		11	269	0	1
1256		11	271	0	1
1257		11	272	0	1
1258		11	273	0	1
1259		11	274	0	1
1260		11	275	0	1
1261		11	276	0	1
1262		11	277	0	1
1263		11	279	0	1
1264		11	280	0	1
1265		11	281	0	1
1266		11	285	0	1
1267		11	287	0	1
1268		11	360	0	1
1269		11	429	0	1
1270		11	430	0	1
1271		11	511	0	1
1272		8	232	1	0
1273		1	453	3	0
1274		1	454	3	0
1275		1	455	3	0
1276		1	462	3	0
1277		1	466	3	0
1278		1	468	3	0
1279		1	469	3	0
1280		1	470	3	0
1281		1	476	3	0
1282		1	480	3	0
1283		1	481	3	0
1284		1	482	3	0
1285		1	487	3	0
1286		1	488	3	0
1287		1	493	3	0
1288		1	495	3	0
1289		1	496	3	0
1290		1	498	3	0
1291		1	502	3	0
1292		1	505	3	0
1293		1	507	3	0
1294		1	508	3	0
1295		1	509	3	0
1296		1	514	3	0
1297		1	516	3	0
1298		1	518	3	0
1299		1	453	2	1
1300		1	454	2	1
1301		1	455	2	1
1302		1	462	2	1
1303		1	466	2	1
1304		1	468	2	1
1305		1	469	2	1
1306		1	470	2	1
1307		1	476	2	1
1308		1	480	2	1
1309		1	481	2	1
1310		1	482	2	1
1311		1	487	2	1
1312		1	488	2	1
1313		1	493	2	1
1314		1	495	2	1
1315		1	496	2	1
1316		1	498	2	1
1317		1	502	2	1
1318		1	505	2	1
1319		1	507	2	1
1320		1	508	2	1
1321		1	509	2	1
1322		1	514	2	1
1323		1	516	2	1
1324		1	518	2	1
1325		1	453	4	0
1326		1	454	4	0
1327		1	455	4	0
1328		1	462	4	0
1329		1	466	4	0
1330		1	468	4	0
1331		1	469	4	0
1332		1	470	4	0
1333		1	476	4	0
1334		1	480	4	0
1335		1	481	4	0
1336		1	482	4	0
1337		1	487	4	0
1338		1	488	4	0
1339		1	493	4	0
1340		1	495	4	0
1341		1	496	4	0
1342		1	498	4	0
1343		1	502	4	0
1344		1	505	4	0
1345		1	507	4	0
1346		1	508	4	0
1347		1	509	4	0
1348		1	514	4	0
1349		1	516	4	0
1350		1	518	4	0
1351		9	238	1	0
1352		9	251	1	0
1353		9	290	1	0
1354		9	291	1	0
1355		9	292	1	0
1356		9	293	1	0
1357		9	294	1	0
1358		9	295	1	0
1359		9	296	1	0
1360		9	297	1	0
1361		9	298	1	0
1362		9	299	1	0
1363		9	300	1	0
1364		9	301	1	0
1365		9	302	1	0
1366		9	303	1	0
1367		9	304	1	0
1368		9	305	1	0
1369		9	306	1	0
1370		9	308	1	0
1371		9	309	1	0
1372		9	310	1	0
1373		9	311	1	0
1374		9	312	1	0
1375		9	313	1	0
1376		9	314	1	0
1377		9	315	1	0
1378		9	316	1	0
1379		9	317	1	0
1380		9	318	1	0
1381		9	320	1	0
1382		9	321	1	0
1383		9	322	1	0
1384		9	323	1	0
1385		9	324	1	0
1386		9	426	1	0
1387		9	428	1	0
1388		10	361	0	1
1389		10	363	0	1
1390		10	364	0	1
1391		10	365	0	1
1392		10	366	0	1
1393		10	367	0	1
1394		10	368	0	1
1395		10	369	0	1
1396		10	370	0	1
1397		10	372	0	1
1398		10	373	0	1
1399		10	374	0	1
1400		10	375	0	1
1401		10	376	0	1
1402		10	378	0	1
1403		10	379	0	1
1404		10	380	0	1
1405		10	381	0	1
1406		10	382	0	1
1407		10	383	0	1
1408		10	384	0	1
1409		10	385	0	1
1410		10	386	0	1
1411		10	387	0	1
1412		10	388	0	1
1413		10	389	0	1
1414		10	390	0	1
1415		10	391	0	1
1416		10	392	0	1
1417		10	393	0	1
1418		10	394	0	1
1419		10	395	0	1
1420		10	403	0	1
1421		10	431	0	1
1422		10	512	0	1
1423		10	513	0	1
1424		10	361	2	2
1425		10	363	2	2
1426		10	364	2	2
1427		10	365	2	2
1428		10	366	2	2
1429		10	367	2	2
1430		10	368	2	2
1431		10	369	2	2
1432		10	370	2	2
1433		10	372	2	2
1434		10	373	2	2
1435		10	374	2	2
1436		10	375	2	2
1437		10	376	2	2
1438		10	378	2	2
1439		10	379	2	2
1440		10	380	2	2
1441		10	381	2	2
1442		10	382	2	2
1443		10	383	2	2
1444		10	384	2	2
1445		10	385	2	2
1446		10	386	2	2
1447		10	387	2	2
1448		10	388	2	2
1449		10	389	2	2
1450		10	390	2	2
1451		10	391	2	2
1452		10	392	2	2
1453		10	393	2	2
1454		10	394	2	2
1455		10	395	2	2
1456		10	403	2	2
1457		10	431	2	2
1458		10	512	2	2
1459		10	513	2	2
1460		1	468	3	0
1461		1	453	3	0
1462		1	454	3	0
1463		1	455	3	0
1464		1	462	3	0
1465		1	466	3	0
1466		1	469	3	0
1467		1	470	3	0
1468		1	476	3	0
1469		1	480	3	0
1470		1	481	3	0
1471		1	482	3	0
1472		1	487	3	0
1473		1	488	3	0
1474		1	493	3	0
1475		1	495	3	0
1476		1	496	3	0
1477		1	498	3	0
1478		1	502	3	0
1479		1	505	3	0
1480		1	507	3	0
1481		1	508	3	0
1482		1	509	3	0
1483		1	514	3	0
1484		1	516	3	0
1485		1	518	3	0
\.


--
-- Data for Name: _alcal_inscripcionpendiente; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_inscripcionpendiente (id, mesa_id) FROM stdin;
\.


--
-- Data for Name: _alcal_inscripcionpendiente_pendiente; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_inscripcionpendiente_pendiente (id, inscripcionpendiente_id, pendiente_id) FROM stdin;
\.


--
-- Data for Name: _alcal_materia; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_materia (id, nombre, taller, carga_horaria, carrera_id, curso_id, docente_provisional_id, docente_suplente_id, docente_titular_id) FROM stdin;
416	Ciencias Naturales	0	2	2	1			1298
417	Ciencias Sociales	0	2	2	1			1297
418	Construcción de la Ciudadanía	0	2	2	1			1292
419	Educación Artística	0	2	2	1			1305
420	Educación Física	0	2	2	1			1309
421	Inglés	0	2	2	1			1289
422	Matemática	0	4	2	1			1277
423	Prácticas del Lenguaje	0	4	2	1			1290
424	Cultura Religiosa	0	2	2	1			1293
425	Biología	0	2	2	13			1258
426	Construcción de la Ciudadanía	0	2	2	13			1292
427	Educación Artística	0	2	2	13			1305
428	Educación Física	0	2	2	13			1316
429	Físico-Química	0	2	2	13			1258
430	Geografía	0	2	2	13			1314
431	Historia	0	2	2	13			1297
432	Inglés	0	2	2	13			1260
433	Matemática	0	4	2	13			1277
434	Prácticas del Lenguaje	0	4	2	13			1290
435	Cultura Religiosa	0	2	2	13			1280
436	Biología	0	2	2	12			1313
437	Construcción de la Ciudadanía	0	2	2	12			1297
438	Educación Artística	0	2	2	12			1305
439	Educación Física	0	2	2	12			1309
440	Físico-Química	0	2	2	12			1258
441	Geografía	0	2	2	12			1304
442	Historia	0	2	2	12			1267
443	Inglés	0	2	2	12			1289
444	Matemática	0	4	2	12			1302
445	Prácticas del Lenguaje	0	4	2	12			1290
446	Cultura Religiosa	0	2	2	12			1280
447	Biología	0	2	2	11			1313
448	Geografía	0	2	2	11			1295
449	Historia	0	2	2	11			1267
450	Inglés	0	2	2	11			1289
451	Educación Física	0	2	2	11			1316
452	Introducción a la Física	0	2	2	11			1291
453	Literatura	0	4	2	11			1265
454	Matemática C.S.	0	4	2	11			1302
455	NTICx	0	2	2	11			1263
456	Salud y Adolescencia	0	2	2	11			1292
457	Sist. de Información Contable I	0	2	2	11			1274
458	Teoría de las Organizaciones	0	2	2	11			1274
459	Cultura Religiosa	0	1	2	11			1280
460	Matemática C.S.	0	4	2	6			1291
461	Literatura	0	4	2	6			1311
462	Educación Física	0	2	2	6			1309
463	Inglés	0	2	2	6			1296
464	Política y Ciudadanía	0	2	2	6			1267
465	Introducción a la Química	0	2	2	6			1320
466	Elem. de MyM Economía	0	2	2	6			1262
467	Historia	0	2	2	6			1270
468	Geografía	0	2	2	6			1295
469	Gestión Organizacional	0	2	2	6			1299
470	Derecho	0	2	2	6			1281
471	Sist. de Información Contable II	0	2	2	6			1274
472	Cultura Religiosa	0	1	2	6			1308
473	Matemática C.S.	0	4	2	5			1275
474	Literatura	0	4	2	5			1311
475	Educación Física	0	2	2	5			1309
476	Inglés	0	2	2	5			1296
477	Trabajo y Ciudadanía	0	2	2	5			1270
478	Economía Política	0	2	2	5			1262
479	Proyectos Organizacionales	0	2	2	5			1274
480	Arte	0	2	2	5			1301
481	Filosofía	0	2	2	5			1272
482	Cultura Religiosa	0	1	2	5			1272
483	Ciencias Naturales	0	2	1	2			1298
484	Ciencias Sociales	0	2	1	2			1297
485	Construcción de la Ciudadanía	0	2	1	2			1292
486	Educación Artística	0	2	1	2			1303
487	Educación Física	0	2	1	2			1316
488	Inglés	0	2	1	2			1296
489	Matemática	0	4	1	2			1266
490	Prácticas del Lenguaje	0	4	1	2			1278
491	Lenguajes Tecnológicos	0	2	1	2			1286
492	Procedimientos Técnicos	0	2	1	2			1287
493	Sistemas Tecnológicos	0	2	1	2			1269
494	Cultura Religiosa	0	2	1	2			1307
495	Biología	0	2	1	10			1258
496	Construcción de la Ciudadanía	0	2	1	10			1292
497	Educación Artística	0	2	1	10			1303
498	Educación Física	0	2	1	10			1309
499	Físico-Química	0	2	1	10			1258
500	Geografía	0	2	1	10			1304
501	Historia	0	2	1	10			1297
502	Inglés	0	2	1	10			1260
503	Matemática	0	4	1	10			1266
504	Prácticas del Lenguaje	0	4	1	10			1265
505	Lenguajes Tecnológicos	0	2	1	10			1263
506	Procedimientos Técnicos	0	4	1	10			1269
507	Sistemas Tecnológicos	0	2	1	10			1287
508	Cultura Religiosa	0	2	1	10			1307
509	Biología	0	2	1	9			1258
510	Construcción de la Ciudadanía	0	2	1	9			1267
511	Educación Artística	0	2	1	9			1303
512	Educación Física	0	2	1	9			1316
513	Físico-Química	0	2	1	9			1288
514	Geografía	0	2	1	9			1304
515	Historia	0	2	1	9			1267
516	Inglés	0	2	1	9			1260
517	Matemática	0	4	1	9			1302
518	Prácticas del Lenguaje	0	4	1	9			1279
519	Lenguajes Tecnológicos	0	2	1	9			1268
520	Procedimientos Técnicos	0	4	1	9			1269
521	Sistemas Tecnológicos	0	2	1	9			1287
522	Cultura Religiosa	0	2	1	9			1307
523	Literatura	0	4	1	8			1279
524	Inglés	0	2	1	8			1289
525	Educación Física	0	2	1	8			1309
526	Salud y Adolescencia	0	2	1	8			1312
527	Historia	0	2	1	8			1267
528	Geografía	0	2	1	8			1295
529	Matemática C.S.	0	4	1	8			1302
530	Física	0	2	1	8			1291
531	Química	0	2	1	8			1320
532	Tecnologías Electrónicas	0	2	1	8			1285
533	Lab. de Programación I	0	2	1	8			1273
534	Lab. de Hardware	0	4	1	8			1286
535	Lab. de Sistemas Operativos	0	4	1	8			1315
536	Lab. de Aplicaciones	0	2	1	8			1287
537	Cultura Religiosa	0	1	1	8			1280
538	Literatura	0	4	1	7			1311
539	Inglés	0	2	1	7			1296
540	Educación Física	0	2	1	7			1309
541	Política y Ciudadanía	0	2	1	7			1267
542	Historia	0	2	1	7			1270
543	Geografía	0	2	1	7			1295
544	Análisis Matemático	0	4	1	7			1275
545	Sistemas Digitales	0	2	1	7			1285
546	Bases de Datos	0	2	1	7			1282
547	Modelos y Sistemas	0	3	1	7			1282
548	Lab. de Programación II	0	4	1	7			1282
549	Lab. de Redes Informáticas	0	4	1	7			1286
550	Lab. de Diseño Web	0	2	1	7			1276
551	Lab. de Diseño BD	0	2	1	7			1310
552	Cultura Religiosa	0	1	1	7			1308
553	Literatura	0	4	1	4			1311
554	Inglés	0	2	1	4			1296
555	Educación Física	0	2	1	4			1309
556	Filosofía	0	2	1	4			1272
557	Arte	0	2	1	4			1301
558	Matemática Discreta	0	3	1	4			1275
559	Sistemas Digitales	0	2	1	4			1319
560	Sist. de Gestión y Autogestión	0	3	1	4			1299
561	Seguridad Informática	0	3	1	4			1285
562	Derechos del Trabajo	0	2	1	4			1281
563	Lab. de Programación III	0	4	1	4			1306
564	Lab. de Procesos Industriales	0	2	1	4			1319
565	Desarrollo Aplic. Web Estáticas	0	2	1	4			1276
566	Desarrollo Aplic. Web Dinámicas	0	4	1	4			1273
567	Cultura Religiosa	0	1	1	4			1272
568	Emprend. Prod. y Des. Local	0	2	1	3			1299
569	Evaluación de Proyectos	0	2	1	3			1287
570	Modelos y Sistemas	0	3	1	3			1315
571	Organización y métodos	0	2	1	3			1287
572	Proyecto Diseño e Imp. de Sist. Comp.	0	4	1	3			1282
573	Proyecto Des. de Soft. Plataformas Móviles	0	4	1	3			1306
574	Proyecto Imp. de Sitios Web Dinámicos	0	4	1	3			1294
575	Cultura Religiosa	0	1	1	3			1272
\.


--
-- Data for Name: _alcal_mesapendiente; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_mesapendiente (id, fecha, materia_id, periodo_id, docente_id) FROM stdin;
\.


--
-- Data for Name: _alcal_nombrecuota; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_nombrecuota (id, nombre) FROM stdin;
\.


--
-- Data for Name: _alcal_nota; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_nota (id, numero, instancia, curso_id, materia_id, estudiante_id) FROM stdin;
\.


--
-- Data for Name: _alcal_notaparcial; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_notaparcial (id, nota, curso_id, materia_id, estudiante_id) FROM stdin;
2	4	1	424	455
\.


--
-- Data for Name: _alcal_notapendiente; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_notapendiente (id, nota, mesa_id, pendiente_id) FROM stdin;
\.


--
-- Data for Name: _alcal_notificacion; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_notificacion (id, notificacion, fecha, tipo, informante_id, estudiante_id) FROM stdin;
\.


--
-- Data for Name: _alcal_padre; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_padre (persona_ptr_id, profesion) FROM stdin;
\.


--
-- Data for Name: _alcal_pendiente; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_pendiente (id, materia_id, estudiante_id) FROM stdin;
\.


--
-- Data for Name: _alcal_periodo; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_periodo (id, nombre, fecha_inicio, fecha_fin) FROM stdin;
\.


--
-- Data for Name: _alcal_persona; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_persona (id, apellido, nombre, fnac, tipo, num_dni, domicilio_calle, domicilio_numero, telefono_1, telefono_2, telefono_3, genero, observacion, email, pais_de_nacimiento, usuario_id) FROM stdin;
96	Gubitosi	Dulcinea													4
667	ACOSTA	Elías Facundo		DNI		Potosi 544		1551204272			M		facosta@sagradoalcal.edu.ar		
668	ARDILES	Tomas Oscar		DNI		Manuela Maza 3770		1557616542			M		tardiles@sagradoalcal.edu.ar		
669	BLANCO	Nicole Agustina		DNI		Eduardo Madero 2609		1558518460			F		nblanco@sagradoalcal.edu.ar		
670	CHAVES	Oriana Martina		DNI		Manuela Pedraza 3791		1532652434			F		mchavez@sagradoalcal.edu.ar		
671	ESCOBAR	Ludmila Ayelén		DNI		Carlos Gardel 4867		1568485810			F		lescobar@sagradoalcal.edu.ar		
672	FERREYRA	Ignacio Julián		DNI		Otamendi 287		1566291034			M		jferreyra@sagradoalcal.edu.ar		
673	GAUNA	Lucila Itatí		DNI		Talcahuano 3748		1522345380			F		ligauna@sagradoalcal.edu.ar		
674	GIRON	Leandro Nahuel		DNI		Aristobulo del Valle 8755		1569539024			M		lgiron@sagradoalcal.edu.ar		
675	GONZALEZ LLANOS	Ivan Leonel		DNI		Manuela Pedraza 3766		1525772715			M		lgonzalezllanos@sagradoalcal.edu.ar		
676	LUNA	Lautaro Gabriel		DNI		Talcahuano 4139		1568121884			M		lluna@sagradoalcal.edu.ar		
677	PEREZ	Leonel Ezequiel		DNI		Talcahuano 4030		1565347529			M		eperez@sagradoalcal.edu.ar		
678	ROCHA LOPEZ	Matias Ezequiel		DNI		Lomas Valentina 232		1533046446			M		mrocha@sagradoalcal.edu.ar		
679	SILVA	Elías Román		DNI		Yatay 3112		1568690340			M		esilva@sagradoalcal.edu.ar		
680	SOSA	Francisco Héctor		DNI		Osorio 2833		1557523950			M		fsosa@sagradoalcal.edu.ar		
681	AYALA	Alejandro Nahuel		DNI		Otamendi 1754		1531657394			M		aayala@sagradoalcal.edu.ar		
682	BENITEZ NUÑEZ	Juan José		DNI		Talcahuano 4143		1521878892			M		jbenitez@sagradoalcal.edu.ar		
683	BRAVO	Ivan Alexis		DNI		Emilio Castro 3775		1565946060			M		ibravo@sagradoalcal.edu.ar		
684	CENTURIÓN	Gastón Ariel		DNI		Potosi 2655		1554114307			M		gcenturion@sagradoalcal.edu.ar		
685	CUETO	María Eugenia		DNI		Millan 3965		1563328789			F		mcueto@sagradoalcal.edu.ar		
686	DIAZ	Ezequias Leandro Daniel		DNI		Warnes 3690		1569349246			M		ediaz@sagradoalcal.edu.ar		
687	GALARZA	Tiago Nahuel		DNI		Madero 2613		1522806911			M		tgalarza@sagradoalcal.edu.ar		
688	GAUNA	Agustina Pilar		DNI		Potosi 2360		1524726401			F		agauna@sagradoalcal.edu.ar		
689	AQUINO VILLAGRA	Jonatan Sebastian		DNI		Potosi 2655					M		jaquino@sagradoalcal.edu.ar		
690	GONZÁLEZ	Brian Matías		DNI		Lomas Valentina 910		1523802574			M		bgonzalez@sagradoalcal.edu.ar		
691	LARTIGAU	Julieta Abigail		DNI		Potosi 2618		1565491196			F		jlartigau@sagradoalcal.edu.ar		
692	ARCOLIA	Nahiara Cecilia		DNI		Talcahuano 3760		49783067			F		narcolia@sagradoalcal.edu.ar		
693	LOPEZ YEGROS	Gianella Kiara		DNI		Jorge Obon 2685		1561380325			F		glopezyegros@sagradoalcal.edu.ar		
694	NESTEROWICZ	Ludmila Maria Belén		DNI		Jorge Obon 2232		1566815724			F		lnesterowicz@sagradoalcal.edu.ar		
695	SERIO	Axel Ezequiel		DNI		Manuela Pedraza 3860		1557368182			M		aserio@sagradoalcal.edu.ar		
696	SOSA	Milton Dylan		DNI		Manuela Pedraza 3790		1562366620			M		asosa@sagradoalcal.edu.ar		
697	SOSA MARTINEZ	Héctor Alejandro		DNI		Talcahuano 4111		1549384985			M		msosa@sagradoalcal.edu.ar		
698	UGARTE	Diego Ezequiel		DNI		Emilio Castro 3773		1528671049			M		dugarte@sagradoalcal.edu.ar		
699	ZARATE	Sebastian Ariel		DNI		Coronel delia 3667		1562152354			M		szarate@sagradoalcal.edu.ar		
700	ACOSTA	Ludmila Alejandra		DNI		25 de mayo 3689		1561516704			F		ludmilaacosta@sagradoalcal.edu.ar		
701	ALTAMIRANO	Leonel David		DNI		Emilio Castro 3773		1526206948			M		leonelaltamirano@sagradoalcal.edu.ar		
702	ANDRÉS	Julieta Anahí		DNI		25 de mayo 2371		1561921621			F		julietaandres@sagradoalcal.edu.ar		
703	ARDILES	Candela Del Rosario		DNI		Manuela Maza 3770		1557616542			F		candelaardiles@sagradoalcal.edu.ar		
704	BURGOS	Rodrigo Elías		DNI		Carlos Pelegrini 2630		1540363200			M		rodrigoburgos@sagradoalcal.edu.ar		
705	BUSTAMANTE	Ariadna Nahir		DNI		Talcahuano 3684		1558831458			F		mbustamante@sagradoalcal.edu.ar		
706	CACERES	Jazmín Paula Daniela		DNI		Emilio Castro 3725		1551179677			F		jazmincaceres@sagradoalcal.edu.ar		
707	CALIZAYA MARIACA	Liz Lucero		DNI		Jorge Obon 2043		45548555			F		lizcalizaya@sagradoalcal.edu.ar		
708	CASELLI	Paula Martina		DNI		Obon 2079		1550030224			F		paulacaselli@sagradoalcal.edu.ar		
709	DÍAZ	Priscilla Aylen		DNI		Warnes 4239		1570452247			F		prisciladiaz@sagradoalcal.edu.ar		
710	ENCINA	Evelyn Isabel		DNI		Rincon 2168		1528869474			F		evelynencina@sagradoalcal.edu.ar		
711	ESPINDOLA	Nicolás Ezequiel		DNI		Emilio Castro 3737		1531617745			M		nicolasespindola@sagradoalcal.edu.ar		
712	GONZÁLEZ	Alexis Javier		DNI		Manuela Pedraza 3791		1561171519			M		alexisgonzalez@sagradoalcal.edu.ar		
713	LEZCANO	Tobías Gabriel		DNI		Lomas Valentina 232		1530256333			M		tobiaslezcano@sagradoalcal.edu.ar		
714	MAIDANA BRITOS	Abril Margarita		DNI		10 De enero 4402		1533822408			F		abrilmaidana@sagradoalcal.edu.ar		
715	MALDONADO VELAZQUEZ	Agustín Ezequiel		DNI		Otamendi 2084		1558097209			M		agustinmaldonado@sagradoalcal.edu.ar		
716	MISCHTSCKENKO MARTINEZ	Lautaro Sebastian		DNI		Eduardo Madero 1435		1534143429			M		lautaromischtsckenko@sagradoalcal.edu.ar		
717	MOLINA	Santiago Agustin		DNI		Jorge Obon 2451		1538656074			M		santiagomolina@sagradoalcal.edu.ar		
718	NUÑEZ	Sofia Ailén		DNI		Manuela Maza 3988		1566885898			F		sofianunez@sagradoalcal.edu.ar		
719	ORELLANA	Agustin Roman		DNI		Madero 1540		1534254336			M		agustinorellana@sagradoalcal.edu.ar		
720	QUINTEROS	Valentina Aldana		DNI		Potosi 2618		1541724035			F		valentinaquinteros@sagradoalcal.edu.ar		
721	RECALDE	Eliana Maximina		DNI		Osorio 2833		1540660912			F		elianarecalde@sagradoalcal.edu.ar		
722	ROJAS	Lautaro Fabrizio		DNI		Emilio Castro 3764		1535259648			M		lautarorojas@sagradoalcal.edu.ar		
723	TROSSI JADUE	Nahiara Lucía Marilyn		DNI		Manuel Maza 4016		1566629731			F		nahiaratrossi@sagradoalcal.edu.ar		
724	ARGUELLO	Lisandro Gabriel		DNI		Eduardo Madero 2644		1521766058			M		larguello@sagradoalcal.edu.ar		
725	BALBUENA	Lucas Valentín		DNI		Eduardo Madero 2651		1551128523			M		lbalbuena@sagradoalcal.edu.ar		
726	BUENO	Elías Nahuel		DNI		Eduardo MAdero 2065		1554232302			M		ebueno@sagradoalcal.edu.ar		
727	CHOQUE CORO	Taina Iara		DNI		Pasaje O'Girondo 3660		1540403235			F		rcorrea@sagradoalcal.edu.ar		
728	CORREA	Rodrigo Alfredo		DNI		Talcahuano 3661		1539185609			M		tainachoque@sagradoalcal.edu.ar		
729	ESPINOSA	Merlina Belén		DNI		Osorio 2435		1533889896			F		mespinosa@sagradoalcal.edu.ar		
730	FLORES	Melina		DNI		Emilio Castro 4124		1541442685			F		mflores@sagradoalcal.edu.ar		
731	GARCÍA	Sol Ayelén		DNI		Otamendi 2224		1532270198			F		sgarcia@sagradoalcal.edu.ar		
732	GIMENEZ 	Fernando Javier		DNI		Manuela Pedraza 4032		1568132838			M		fgimenez@sagradoalcal.edu.ar		
733	GÓMEZ	Rodrigo Sebastián		DNI		Otamendi 508		1536451336			M		rgomez@sagradoalcal.edu.ar		
734	GONZÁLEZ	Mariano Nicolás		DNI		Lomas Valentina 910		1523834825			M		mgonzalez@sagradoalcal.edu.ar		
735	HERRERA	Kevin Alexandro		DNI		Warnes 3720		1565087463			M		kherrera@sagradoalcal.edu.ar		
736	HERRERA	Luana Abril		DNI		Warnes 3720		1565087463			F		lherrera@sagradoalcal.edu.ar		
737	LENCINA	Sofía Belén		DNI		Manuela Pedraza 3780		1538247561			F		slencina@sagradoalcal.edu.ar		
738	MOLINA	Axel Yoel		DNI		Talcahuano 3758		1534627410			M		amolina@sagradoalcal.edu.ar		
739	ORTEGA	Lucas Abel		DNI		Emilio Castro 4019		11562945012			M		lortega@sagradoalcal.edu.ar		
740	PONCE	Alan Natanael		DNI		Eduardo Madero 2251		1551485385			M		aponce@sagradoalcal.edu.ar		
741	QUIÑONEZ ORTEGA	Emilio Agustin		DNI		Manuela Paderaza 3713		1538336763			M		equinonez@sagradoalcal.edu.ar		
742	REA	Abril Desiree		DNI		Eduardo Madero 2420		1554725531			F		area@sagradoalcal.edu.ar		
743	RUIZ DÍAZ SANCHEZ	Karen Maylen		DNI		Pasaje Rosario 426		1535180715			F		kruizdiaz@sagradoalcal.edu.ar		
744	SALGUEIRO	Enzo Santiago		DNI		Manuela Paderaza 4074		1569257608			M		enzosalgueiro@sagradoalcal.edu.ar		
745	VALLESPIR	Helio Alexander		DNI		Manuel Maza 4173		20032772			M		hvallespir@sagradoalcal.edu.ar		
746	ZARATE BENEGAS	Gonzalo Emanuel		DNI		Manuel Maza 3697		1565954878			M		gzarate@sagradoalcal.edu.ar		
747	ALDERETE	Bruno Daniel		DNI		Talcahuano 3742		1523535122			M		danielalderete@sagradoalcal.edu.ar		
748	CABAÑA	Juliana Alejandra		DNI		Osorio 2771		1568265276			F		julianacabana@sagradoalcal.edu.ar		
749	CRISTALDO	Milagros Ainara		DNI		Jorge Obon 2355		1554082158			F		milagroscristaldo@sagradoalcal.edu.ar		
750	DO REIS	Casandra Denise		DNI		Coronel Sayos 3857		1561418613			F		casandradoreis@sagradoalcal.edu.ar		
751	DOS SANTOS	Antonella Abigail		DNI		Otamendi 2350		1526488578			F		antonelladossantos@sagradoalcal.edu.ar		
752	GALARZA	Joshua Ali		DNI		Otamendi 2350		1536796291			M		joshuagalarza@sagradoalcal.edu.ar		
753	GIMENEZ	Zoe Jazmín		DNI		Emilio Castro 3913		1553846984			F		zoegimenez@sagradoalcal.edu.ar		
754	GONZÁLEZ	Leonel Alejandro		DNI		Aristobolo del valle 3783		1530768416			M		leonelgonzalez@sagradoalcal.edu.ar		
755	JARA	Nahuel Oscar		DNI		Talcahuano 3662		1523208670			M		nahueljara@sagradoalcal.edu.ar		
756	LENCINA	Analía Belén		DNI		Calle 3 Nº 2849 		1502499789			F		analialencina@sagradoalcal.edu.ar		
757	LENCINA BOGDANOFF	Yazmín Magdalena		DNI		Coronel Delia 3528		1568290890			F		yasminlencina@sagradoalcal.edu.ar		
758	MACIEL	Rocío Nerea		DNI		Sayos 4085		1555748768			F		rociomaciel@sagradoalcal.edu.ar		
759	MARTINEZ	Nahuel Gabriel		DNI				1561921089			M		nahuelmartinez@sagradoalcal.edu.ar		
760	NUÑEZ	Milagros Diamela		DNI		Manuela Maza 3988		1566885898			F		milagrosnunez@sagradoalcal.edu.ar		
761	ORTIGOZA	Mauro Alexis		DNI		Talcahuano 4126		1531806833			M		mauroortigoza@sagradoalcal.edu.ar		
762	PAIVA URIARTE	Luna Natalia		DNI		Osorio 1941		1568703680			F		lunapaiva@sagradoalcal.edu.ar		
763	RAMÍREZ	Mel Juliana		DNI		Emilio Castro 4015		1569682090			F		melramirez@sagradoalcal.edu.ar		
764	RECALDE	Franco Nicolás		DNI		Osorio 2833		1540660912			M		francorecalde@sagradoalcal.edu.ar		
765	ROJAS	Marilyn Abigail		DNI		Warnes 3754		1564970525			F		marilynrojas@sagradoalcal.edu.ar		
766	SANCHEZ	Gabriel Valentín		DNI		A . Barros 293		1540889382			M		valentinsanchez@sagradoalcal.edu.ar		
767	OVELAR VEGA	Alicia Jazmín		DNI		Talcahuano 4133		1533617178			F		jazminvegaovelar@sagradoalcal.edu.ar		
768	PORTILLO	Lara Dafne		DNI				1530518240			F		laraportillo@sagradoalcal.edu.ar		
769	AMARILLA	Brian Sebastián		DNI		Warnes 3840		1526692973			M		bamarilla@sagradoalcal.edu.ar		
770	AMAYA ACOSTA	Lucia Trinidad		DNI		Lomas Valentina 745		42185699			F		lamaya@sagradoalcal.edu.ar		
771	APAZA	Joaquín Tomás		DNI		Potosi 1952		1551818750			M		japaza@sagradoalcal.edu.ar		
772	APPENDINO	Ailén Azul		DNI		Coronel Sayos 4045		1549897762			F		aappendino@sagradoalcal.edu.ar		
773	ARCE	Priscila Alejandra		DNI		MAnuela Maza 3771					F		parce@sagradoalcal.edu.ar		
774	BRAVO	Juan Ignacio		DNI		E. Madero 1226		1521566599			M		jbravo@sagradoalcal.edu.ar		
775	BUSTAMANTE	Milena Yael		DNI		Talcahuano 3684		1558831458			F		mbustamante@sagradoalcal.edu.ar		
776	CARRERA	Mía Naimid		DNI		Potosi 2701		1538898265			F		mcarrera@sagradoalcal.edu.ar		
777	CARRILLO	Gustavo Ariel		DNI		Potosi 2131		1553113926			M		gcarrillo@sagradoalcal.edu.ar		
778	CRISTALDO	Melany Aylen		DNI		Potosi 544		1567447453			F		mcristaldo@sagradoalcal.edu.ar		
779	CRUZ MURUCHI	Eric Leonidas		DNI		Warnes 4141		1554619867			M		ecruz@sagradoalcal.edu.ar		
780	DUARTE TERRUSI	Rodrigo Lucas Alejandro		DNI		Emilio Castro 3616		1564933680			M		rduarte@sagradoalcal.edu.ar		
781	ESTIGARRIBIA MALLORQUIN	Franco Ismael		DNI		Hernandarias 4510		1526328921			M		festigarribia@sagradoalcal.edu.ar		
782	FLORES GARNICA	Juan Manuel		DNI		Potosi 2480		1565025307			M		jflores@sagradoalcal.edu.ar		
783	FLORES 	Richard Nahuel		DNI		Madero 2660		1533062031			M		rflores@sagradoalcal.edu.ar		
784	FRANCO	Matías Iván		DNI		Carlos Pelegrini 4236		1536509392			M		mfranco@sagradoalcal.edu.ar		
785	IFRAN	Sebastián Nicolás Joaquín		DNI		Talcahuano 3848					M		sifran@sagradoalcal.edu.ar		
786	LORENZO	Alejo Sebastián		DNI		Potosi 2163		1534363654 no correp			M		alorenzo@sagradoalcal.edu.ar		
787	MARCA VENEGAS	Arley Mayra		DNI		Viamonte 3833		1539233878			F		amarca@sagradoalcal.edu.ar		
788	MIGUEL	Florencia Antonella		DNI		Coronel delia 3761		1535725787			F		amiguel@sagradoalcal.edu.ar		
789	NUÑEZ	Lautaro		DNI		Madero 2622		1566881506			M		lnunez@sagradoalcal.edu.ar		
790	PIANETTI	Guillermina Carla Carolina		DNI		Calle 882  - Quilmes 2270		1541464360			F		gpianetti@sagradoalcal.edu.ar		
791	PIÑEIRO	María de los Ángeles		DNI		Potosi 2255		1553151530			F		apineiro@sagradoalcal.edu.ar		
792	QUINTEROS	Emmanuel		DNI				1565162515			M		equinteros@sagradoalcal.edu.ar		
793	ROMAN	Candela Sofía		DNI		Coronel delia 3926		1527183310			F		croman@sagradoalcal.edu.ar		
794	SILVA	Tomas Adriel		DNI		Potosi 2585		1555167102			M		tsilva@sagradoalcal.edu.ar		
795	VILLAGRA ROMERO	Sofía Belén		DNI		Emilio Castro 3773		1555867371			F		svillagra@sagradoalcal.edu.ar		
796	ABREGU	Melanie Damaris		DNI		Pasaje Aguirre 581		1536603837			F		melanie.abregu@sagradoalcal.edu.ar		
797	AGUILERA ACOSTA	David Rogelio		DNI		Potosi 2358		1530046136 no correp			M		david.aguilera@sagradoalcal.edu.ar		
798	AVILA	Rocío Belén		DNI		Talcahuano 3661		1537764743			F		rocio.avila@sagradoalcal.edu.ar		
799	BARROCA	Giselle Fiorella		DNI		Potosi 2528		1559739122			F		giselle.barroca@sagradoalcal.edu.ar		
800	BENITEZ	Victoria Grisel		DNI		Warnes 3665		1526329040			F		victoria.benitez@sagradoalcal.edu.ar		
801	GOMEZ	Tomás Mateo		DNI		Pasaje 25 de mayo casa 12		1522394715			M		tomas.gomez@sagradoalcal.edu.ar		
802	MACIEL	Mia Ailin		DNI		Coronel Sayos 4085		1541762691			F		mia.maciel@sagradoalcal.edu.ar		
803	MAROTTE	Claudio Daniel		DNI		Manuela Pedraza 4208					M		claudio.marote@sagradoalcal.edu.ar		
804	MARTINEZ	Camila Ayelen		DNI		Jose Maria Moreno 3727		1562037613			F		camila.martinez@sagradoalcal.edu.ar		
805	MELGAR	Alan Daniel		DNI		Madero 2609		1557330471			M		alan.melgar@sagradoalcal.edu.ar		
806	MIGUEL	Camila Rocío		DNI		Coronel delia 3761		1535725787			F		camila.miguel@sagradoalcal.edu.ar		
807	MIRANDA	Agustín Lionel		DNI		Manuela Pedraza 3796		1523837572			M		agustin.miranda@sagradoalcal.edu.ar		
808	MISCHTSCHENKO MARTÍNEZ	Alejo Ramiro		DNI		Madero 1435		1534143429			M		alejo.martinez@sagradoalcal.edu.ar		
809	NABARRO	Maite Abril		DNI		Otamendi 2259		1539104943			F		maite.navarro@sagradoalcal.edu.ar		
810	ORTEGA	Gonzalo Nicolás		DNI		Lomas Valentina 221		1557606344			M		gonzalo.ortega@sagradoalcal.edu.ar		
811	ORUEZ	Zaira Melina		DNI		Coronel delia 3639		1563505479			F		zaira.oruez@sagradoalcal.edu.ar		
812	PERALTA	Denisse Alejandra		DNI		Talcahuano 289		1564356818			F		denisse.peralta@sagradoalcal.edu.ar		
813	PIOVANO	Melina Soledad		DNI		Madero 2663		1530701062			F		melina.piovano@sagradoalcal.edu.ar		
814	PIVETTA	Sebastián Rodrigo		DNI		Lomas Valentina 757		1539457294			M		spivetta@sagradoalcal.edu.ar		
815	PONCE	Lourdes Tatiana		DNI		Eduardo Madero 2251		1559777459			F		tponce@sagradoalcal.edu.ar		
816	SANCHEZ	Yair Naim		DNI		Emilio Castro 3775		1555952170 (papá) - 1555959197 (mamá)			M		yair.sanchez@sagradoalcal.edu.ar		
817	SUAREZ	Matías Nicolás		DNI		Talcahuano 4133		1534740818			M		matias.suarez@sagradoalcal.edu.ar		
818	UMBIDES	Lourdes Aylen		DNI		Manuela Pedraza 3677		1526998100			F		lourdes.umbides@sagradoalcal.edu.ar		
819	AJHUACHO QUIROGA	Benjamín Alexander		DNI		Warnes 4166		1531557458			M		bajhuacho@sagradoalcal.edu.ar		
820	ALDERETE	Lucía Nicole		DNI		Maza 3786		1526899465			F		lalderete@sagradoalcal.edu.ar		
821	BALBUENA ZALAZAR	Abigail		DNI		Jorge Obon 2432		1523445895			F		abalbuena@sagradoalcal.edu.ar		
822	BENÍTEZ	Ariel Jesús		DNI		Otamendi 2351		1566568155			M		abenitez@sagradoalcal.edu.ar		
823	CANCELO	Thiago Ariel		DNI		Otamendi 2084		1535667637			M		tcancelo@sagradoalcal.edu.ar		
824	CARRERAS	Gustavo Exequiel		DNI		Manuela Maza 4087		1532010632			M		gcarreras@sagradoalcal.edu.ar		
825	COLMAN CABALLERO	Ada Luz		DNI		Pasaje Rosario 424		1536283377			F		acolman@sagradoalcal.edu.ar		
826	DUARTE	Xavier Andrés		DNI		Madero 2660		1522471522			M		xduarte@sagradoalcal.edu.ar		
827	GALAZ AYALA	Pablo Daniel		DNI		Warnes 4141		1531506214			M		pgalaz@sagradoalcal.edu.ar		
828	GALLARDO	Demian Ariel		DNI		Lomas Valentina 202		1569258499			M		dgallardo@sagradoalcal.edu.ar		
829	GARCÍA	Axel Nahuel		DNI		Warnes 3632		1540227481			M		agarcia@sagradoalcal.edu.ar		
830	GAYOSO	Facundo Nicolás		DNI		Emilio Castro 3616		1527112142			M		fgayoso@sagradoalcal.edu.ar		
831	GHISAURA	Tiziano Demian		DNI		Emilio Castro 3790		1528326601			M		tghisaura@sagradoalcal.edu.ar		
832	GRAMAJO GARNICA	Rocío Abril		DNI		Obon 2468		1540570959			F		rgramajo@sagradoalcal.edu.ar		
833	HERRERA	Santiago Nahuel		DNI		Warnes 3739		1556339733			M		nherrera@sagradoalcal.edu.ar		
834	ITURRE	Micaela Ayelén		DNI		Lomas Valentina 927		1544148861			F		miturre@sagradoalcal.edu.ar		
835	LEMA	Lautaro Sebastian		DNI		Eduardo Madero 1963		1558945977			M		llema@sagradoalcal.edu.ar		
836	LUQUE	Erika Noemí		DNI		Yatay 2314		1557394612 (abuela) - 1133954673 (personal)			F		eluque@sagradoalcal.edu.ar		
837	MARECO	Tiziano Matías		DNI		Manuela Maza 3715		1532196282			M		tmareco@sagradoalcal.edu.ar		
838	MARISCAL	Eric Jesús		DNI		Calle nº3 Nº 59		1521882543			M		emariscal@sagradoalcal.edu.ar		
839	MOLINA	Dylan Daniel		DNI		Talcahuano 3756		1534627410			M		dmolina@sagradoalcal.edu.ar		
840	MONTENEGRO	Karen Valentina		DNI		Potosi 2571		1557263127			F		kmontenegro@sagradoalcal.edu.ar		
841	ORTIZ	Luz Analía		DNI		Carlos Pelegrini 2450		1536540675			F		lortiz@sagradoalcal.edu.ar		
842	OVIEDO	Fernando Gabriel		DNI		Warnes 3690		1557720708			M		foviedo@sagradoalcal.edu.ar		
843	PEREYRA	Dana Sofía		DNI		Manuela Pedraza 4090		1559087171			F		dpereyra@sagradoalcal.edu.ar		
844	PIANETTI	Sebastián Salvador Martín		DNI		Calle 882 nº 2270		1541464360			M		spianetti@sagradoalcal.edu.ar		
845	PORTILLO	Roque Daniel		DNI		Emilio Castro 3763		1568231384			M		rportillo@sagradoalcal.edu.ar		
846	QUISPE RODRÍGUEZ	Maia Belén		DNI		Warnes 4141		1559548395			F		mquispe@sagradoalcal.edu.ar		
847	RAMIREZ BRITOS	Mario Isaías		DNI		Manuela Maza 4131		1551371184			M		mramirez@sagradoalcal.edu.ar		
848	RODRÍGUEZ	Anahí Esmeralda		DNI		Warnes 4141		1566462950			F		arodriguez@sagradoalcal.edu.ar		
849	SANTORO	Martina Abril		DNI		Coronel D eia 4172 		1526630849			F		msantoro@sagradoalcal.edu.ar		
850	SERIO	Zoe Rocío		DNI		Manuiela Pedraza 3860 		1526862336			F		zserio@sagradoalcal.edu.ar		
851	UGARTE	Lucas Emmanuel		DNI		Emilio Castro 3773		1528671049			M		lugarte@sagradoalcal.edu.ar		
852	VERTHI	Santiago Iván		DNI		Talcahuano 4114		1555054795			M		sverthi@sagradoalcal.edu.ar		
853	VILLALBA	Lautaro Gael		DNI		Potosi 2616		1562394083			M		lvillalba@sagradoalcal.edu.ar		
854	AQUINO	Fernando José		DNI		Warnes 3720		43687004			M		fernando.aquino@sagradoalcal.edu.ar		
855	AVALOS	Ariana		DNI		Manuela Pedraza 4308		1526360577			F		ariana.avalos@sagradoalcal.edu.ar		
856	BARRIONUEVO	Milagros		DNI		Jorge Obon 1934		42081793			F		milagros.barrionuevo@sagradoalcal.edu.ar		
857	BLANCO	Luis Eduardo		DNI		Madero 2609		1558518460			M		luis.blanco@sagradoalcal.edu.ar		
858	CASELLI	Santino Andre		DNI		Obon 2079		1550030224			M		santino.caselli@sagradoalcal.edu.ar		
859	COMAN	Pablo Alessandro		DNI		Manuela Pedraza 4120		42185582			M		pablo.coman@sagradoalcal.edu.ar		
860	ESPINDOLA	Abril Agustina		DNI		Emilio Castro 3790		42098516			F		matias.espindola@sagradoalcal.edu.ar		
861	ESPINDOLA	Matías Gonzalo		DNI		Emilio Castro (Pasillo) 3737 		1531617745			M		abril.espindola@sagradoalcal.edu.ar		
862	GODOY	Matias David		DNI		Warnes 4163		1521710331			M		matias.godoy@sagradoalcal.edu.ar		
863	GOMEZ	Damaris Nahir		DNI		Rivadavia 3306		1538609119			F		maia.gomez@sagradoalcal.edu.ar		
864	GOMEZ	Maia Belén		DNI		Warnes 3769		1549481397			F		damaris.gomez@sagradoalcal.edu.ar		
865	GOMEZ	Zoe Magalí		DNI		Rivadavia 3306		1538609119			F		zoe.gomez@sagradoalcal.edu.ar		
866	LEDESMA	Yanina Luján		DNI		Talcahuano 3779		1552299196			F		yanina.ledesma@sagradoalcal.edu.ar		
867	LOPEZ CACERES	Aline Maria		DNI		10 de enero 4402		1559259614			F		aline.lopez@sagradoalcal.edu.ar		
868	MAIDANA BRITOS	Jeremy Alexander		DNI		10 de enero 4402		1533822408			M		jeremy.maidana@sagradoalcal.edu.ar		
869	MAQUEDA	Candela Valentina		DNI		Warnes 3684		1536788322			F		candela.maqueda@sagradoalcal.edu.ar		
870	NATO	Cristian Ariel		DNI		Manuela Pedraza 4063		1158252681			M		cristian.nato@sagradoalcal.edu.ar		
871	NUÑEZ	Malena Agustina		DNI		Manuela Maza 3988		1566885898			F		malena.nunez@sagradoalcal.edu.ar		
872	PADILLA	Brian Nahuel		DNI		Rincon 2234		1539374872			M		brian.padilla@sagradoalcal.edu.ar		
873	PISANO	Tiago Benjamín		DNI		E. Madero 1915		116563005			M		tiago.pisano@sagradoalcal.edu.ar		
874	QUINTEROS	Martina Lara		DNI		Potosi 2618		1541724035			F		martina.quinteros@sagradoalcal.edu.ar		
875	RODRIGUEZ	Jade Jasmine		DNI		Talcahuano 3960		1563987702			F		jade.rodriguez@sagradoalcal.edu.ar		
876	SANCHEZ	Luciana Valentina		DNI		Carlos Pelegrini 2516		1562009444			F		luciana.sanchez@sagradoalcal.edu.ar		
877	TORRES	Gianella Angeline		DNI		Madero 2481		1569910073			F		gianella.torres@sagradoalcal.edu.ar		
878	VALVERDI VERA	Milagros Belén		DNI		Rincon 2167		1558286761			F		milagros.valverdi@sagradoalcal.edu.ar		
879	VILLALBA	Demian Gabriel		DNI		Potosi 2144		1530896464			M		demian.villalba@sagradoalcal.edu.ar		
880	VILLAR ORTIZ	Valeria		DNI		Conesa 3282		1521733271			F		valeria.villar@sagradoalcal.edu.ar		
881	DE SOUZA	Rut Mariel		DNI		Jose Maria Moreno 3727					F		rut.desouza@sagradoalcal.edu.ar		
882	AMAYA ACOSTA	Alma Victoria		DNI		Lomas Valentina 745		1541711509			F		alma.amaya@sagradoalcal.edu.ar		
883	ARIAS	Cristian		DNI		PJE.GODOY CRUZ		1535830561			M		cristian.arias@sagradoalcal.edu.ar		
884	AUTERI ROMERO	Damián Ezequiel		DNI		VALPARAIO Y MILLÁN 128		42095349			M		damian.auteri@sagradoalcal.edu.ar		
885	AVALOS	Nahiara Nair		DNI		Talcahuano 3996		42181870			F		nahiara.avalos@sagradoalcal.edu.ar		
886	BALBUENA	Mateo		DNI		MADERO 2651		1567911806			M		mateo.balbuena@sagradoalcal.edu.ar		
887	BALBUENA	Nahiara Abigail		DNI		Madero 2660		1565792835			F		nahiara.balbuena@sagradoalcal.edu.ar		
888	BUITRAGO VELASCO	Leonardo		DNI		J.M. MORENO		42086175			M		leonardo.buitrago@sagradoalcal.edu.ar		
889	CHAVES	Guillermo Alejandro		DNI		M. PEDRAZA 3791		1532652434			M		guillermo.chaves@sagradoalcal.edu.ar		
890	CHAVES	Gustavo Damian		DNI		M.PEDRAZA 3791		1532652434			M		gustavo.chaves@sagradoalcal.edu.ar		
891	ENCINA	Thiago Benjamin		DNI		M.PEDRAZA 3778		1556647082			M		thiago.encina@sagradoalcal.edu.ar		
892	FERNANDEZ	Zoe		DNI		MANUEL MAZA 3723		1550500812			F		zoe.fernandez@sagradoalcal.edu.ar		
893	FLORES	Mia Nicole		DNI		M.PEDRAZA 3748		1553100566			F		mia.flores@sagradoalcal.edu.ar		
894	FRANCO	Fernando Ariel		DNI		VIAMONTE 3610		43873222			M		fernando.franco@sagradoalcal.edu.ar		
895	GUEVARA	Veronica Alexandra		DNI		MAZA 3753		42080132			F		veronica.guevara@sagradoalcal.edu.ar		
896	HERRERA	Lara Jazmin		DNI		J.M.MORENO 4594		1558028856			F		lara.herrera@sagradoalcal.edu.ar		
897	LEZCANO	Tiziana Abril		DNI		OTAMENDI 511		1566528615			F		tiziana.lezcano@sagradoalcal.edu.ar		
898	MENDOZA GONZALEZ	Ariel Luis		DNI		WARNES 4245					M		ariel.mendoza@sagradoalcal.edu.ar		
899	MEZA	Enio Rafael		DNI		OTAMENDI 285		42082147			M		enio.meza@sagradoalcal.edu.ar		
900	MEZA	Rocio Malena		DNI		EMILIO CASTRO 3797		1568133590			F		rocio.meza@sagradoalcal.edu.ar		
901	PINTOS	Alexis Tomas		DNI		MADERO 2256		42182277			M		alexis.pintos@sagradoalcal.edu.ar		
902	QUEVEDO	Ludmila Ayelen		DNI		POTOSI 2575		1558017512			F		ludmila.quevedo@sagradoalcal.edu.ar		
903	ROMAN	Lucas Leonel		DNI		ITAPIRÚ 2132		1538883989			M		lucas.roman@sagradoalcal.edu.ar		
904	RUIZ DIAZ CRUZ	Agustin Ezequiel		DNI		MILLAN 3886		42280548			M		agustin.ruiz@sagradoalcal.edu.ar		
905	SALGUEIRO	Martin Tiziano		DNI		PEDRAZA 4074		42288878			M		martin.salgueiro@sagradoalcal.edu.ar		
906	SARATE ALONSO	Juan Facundo		DNI		CORONEL DELIA 3535		1558920050			M		juan.sarate@sagradoalcal.edu.ar		
907	SUAREZ	Thiago Agustin		DNI		LOMAS VALENTINA 696		1161912788			M		thiago.suarez@sagradoalcal.edu.ar		
908	TORRILLA	Johana Erika		DNI		LOMAS VALENTINA 696					F		johana.torrilla@sagradoalcal.edu.ar		
909	VARGAS LEIVA	Abril Morena		DNI		WARNES 3672		1524827517			F		abril.vargas@sagradoalcal.edu.ar		
910	VEGA VERA	Jorge Gabriel		DNI		LOMAS VALENTINA		39997782			M		jorge.vega@sagradoalcal.edu.ar		
911	VISCUBI	Joaquin Emanuel		DNI		PEDRAZA 4074		42288878			M		joaquin.viscubi@sagradoalcal.edu.ar		
912	WELCHEN	Cristopher		DNI		PEDRAZA 4312		1563749975			M		cristopher.welchen@sagradoalcal.edu.ar		
913	WOJCIK	Milena		DNI		OBON 2044		1567031690			F		milena.wojcik@sagradoalcal.edu.ar		
914	ZARATE	Valentina Elizabeth		DNI		CORONEL DELIA 3667		42285474			F		valentina.zarate@sagradoalcal.edu.ar		
915	ALINCASTRO	Nicole Nerea Trinidad		DNI		M. PEDRAZA		42280151			F		nicole.alincastro@sagradoalcal.edu.ar		
916	BARRIENTOS	Mirko Benjamín		DNI		Obón 2675		1561081363			M		mirko.barrientos@sagradoalcal.edu.ar		
917	BUENO	Luna Abigail		DNI		Madero 2065		1554266120			F		luna.bueno@sagradoalcal.edu.ar		
918	DURAN	Ámbar Jade		DNI		M. PEDRAZA 3791		42186270			F		ambar.duran@sagradoalcal.edu.ar		
919	FERNANDEZ PATTETA	Román Agustín		DNI		M.PEDRAZA		1523253550			M		roman.fernandez@sagradoalcal.edu.ar		
920	GIGLIO	Sofía Elizabeth		DNI		OTAMENDI 457		1532801277			F		sofia.giglio@sagradoalcal.edu.ar		
921	GOMEZ	Mathías Alejandro		DNI		M.MAZA 3815		1556230543			M		mathias.gomez@sagradoalcal.edu.ar		
922	JARA	Axel Gabriel		DNI		RINCON 2148		1550104114			M		axel.jara@sagradoalcal.edu.ar		
923	LOPEZ ALFONZO	Héctor Fabián		DNI		ARISTÓBULO DEL VALLE		1527596668			M		hector.lopez@sagradoalcal.edu.ar		
924	LUNA	Valentina Anahí		DNI		TALCAHUANO 293		1557266889			F		valentina.luna@sagradoalcal.edu.ar		
925	MALDONADO	Nicolás Ezequiel		DNI		E.CASTRO 4094		1566564252			M		nicolas.maldonado@sagradoalcal.edu.ar		
926	MIRANDA	Sasha Serena		DNI		M.PEDRAZA 3796		1524999401			F		sasha.miranda@sagradoalcal.edu.ar		
927	OJEDA	Kiara Milena		DNI		YATAY 2313		1523164286			F		kiara.ojeda@sagradoalcal.edu.ar		
928	ORTEGA	Melany Abril		DNI		M.MAZA 3718		1556244324			F		melany.ortega@sagradoalcal.edu.ar		
929	PERALTA	Victoria Esmeralda		DNI		GIRONDO 3581		1536752328			F		victoria.peralta@sagradoalcal.edu.ar		
930	PIANETTI	Mauricio Fabián Fabrizio		DNI		CALLE 882 Nº 2270		1560881792			M		mauricio.pianetti@sagradoalcal.edu.ar		
931	PONCE SUAREZ	Kiara Nicole		DNI		OTAMENDI 457		1532801277			F		kiara.ponce@sagradoalcal.edu.ar		
932	SUAREZ MONTERO	Mía Agustina		DNI		MILLAN 3855		1530821983			F		mia.suarez@sagradoalcal.edu.ar		
933	TOSSI BERDÚN	Guadalupe Selena		DNI		MADERO 1264		42282317			F		guadalupe.tossi@sagradoalcal.edu.ar		
934	UMBIDES	Alexis Joaquín		DNI		ARISTÓBULO DEL VALLE 3668		1536768483			M		alexis.umbides@sagradoalcal.edu.ar		
935	VILLALBA	Abigail Florencia		DNI		MADERO 2269		1524999331			F		abigail.villalba@sagradoalcal.edu.ar		
936	TELLO	Geraldine		DNI							F		geraldine.tello@sagradoalcal.edu.ar		
937	LOPEZ MARTINEZ	Morena Soledad		DNI							F		morena.lopez@sagradoalcal.edu.ar		
938	CHAMORRO	Iara Abigail									F		iara.chamorro@sagradoalcal.edu.ar		
939	ISASI	Fátima Abril									F		fatima.isasi@sagradoalcal.edu.ar		
940	MATTEU	Fátima Ivón									F		fatima.matteu@sagradoalcal.edu.ar		
941	ANTEZANA	Ludmila Melina									F		melina.antezana@sagradoalcal.edu.ar		
942	GIMENEZ	Lourdes Rocío									F		lourdes.gimenez@sagradoalcal.edu.ar		
943	QUIROGA	Leonardo Miguel		DNI		SAYOS 4136		1557206282			M		leonardo.quiroga@sagradoalcal.edu.ar		
944	CARROZO	Luna Magalí		DNI		OBÓN 2624		1528075303			F		luna.carrozo@sagradoalcal.edu.ar		
945	GANGALE	Maddox Joan		DNI		C.D`LIA 4055		42090627			M		maddox.gangale@sagradoalcal.edu.ar		
946	GONZÁLEZ	Thiago Adrián		DNI		MADERO 2669		1526696867			M		thiago.gonzalez@sagradoalcal.edu.ar		
947	PISANO	Bautista Joaquín		DNI		MADERO 1915		42288479			M		bautista.pisano@sagradoalcal.edu.ar		
948	RAMIREZ	Bianca Leonela		DNI		E.CASTRO 4015		1569682030			F		bianca.ramirez@sagradoalcal.edu.ar		
949	ARRIGHI RUIZ	Tobías Francisco									M		tobias.arrighi@sagradoalcal.edu.ar		
950	RÍOS	Thiago Tomás									M		thiago.rios@sagradoalcal.edu.ar		
951	RÍOS	Ludmila MIlagros									F		ludmila.rios@sagradoalcal.edu.ar		
952	PISANI	Victoria									F		victoria.pisani@sagradoalcal.edu.ar		
953	MARECO	Elías		DNI		OSORIO 2855		1558924148			M		elias.mareco@sagradoalcal.edu.ar		
954	CASTAÑO	Narela Priscila		DNI		Manuela Pedraza 3450		1539271265			F		narela.castano@sagradoalcal.edu.ar		
955	RAMÍREZ	Santiago Daniel		DNI		Warnes 3643					M		santiago.ramirez@sagradoalcal.edu.ar		
956	ROJAS	Elías Rodrigo		DNI		Warnes 3643		1540995317			M		elias.rojas@sagradoalcal.edu.ar		
957	PEREYRA	Nahiara Vanina		DNI		Pje. Aristóbulo del Valle 3722		1539139935			F		nahiara.pereyra@sagradoalcal.edu.ar		
958	TRIAY	Alan Nicolás		DNI		Darragueira 2041		1135938204			M		atriay@sagradoalcal.edu.ar		
959	ALVARENGA 	Naara Valentina		DNI		EMILIO CASTRO  3813   		1551529656			F		naara.alvarenga@sagradoalcal.edu.ar		
960	BENITEZ	Tobías Gabriel		DNI		OSORIO 2811   		4209-0266			M		tobias.benitez@sagradoalcal.edu.ar		
961	ESPINDOLA	Leandro Damián		DNI		EMILIO CASTRO  3737   		1531617745			M		leandro.espindola@sagradoalcal.edu.ar		
962	ZICCARDI	Genaro Facundo		DNI		CNEL DELIA 3761   		1569506386			M		genaro.ziccardi@sagradoalcal.edu.ar		
963	QUINTEROS	Candela Belén		DNI		POTOSI  2618   		1541724035			F		candela.quinteros@sagradoalcal.edu.ar		
964	COMAN	Carlos Lucas Sebastián		DNI		POTOSI 2642   		1539447317			M		lucas.coman@sagradoalcal.edu.ar		
965	RECALDE	Matías Leonel		DNI		OSORIO  2833   		1540660912			M		matias.recalde@sagradoalcal.edu.ar		
966	NEMEN	Luciano Neiel		DNI		POTOSI  2597   		1539151575			M		luciano.nemen@sagradoalcal.edu.ar		
967	CASTAÑO	Brandon Ezequiel		DNI		OTAMENDI  2380   		1562897317			M		brandon.castano@sagradoalcal.edu.ar		
968	LONGHI OTERO	Lucca Ezequiel		DNI		LOMAS VALENTINA 2629   		1567444416			M		lucca.longhi@sagradoalcal.edu.ar		
969	FERNANDEZ VEGA 	Mía Valentina		DNI		CNEL DELIA 3886   		1564719487			F		mia.fernandez@sagradoalcal.edu.ar		
970	EMERI	Luciana Jacqueline		DNI		LOMAS VALENTINA 923   		1563674981			F		luciana.emeri@sagradoalcal.edu.ar		
971	CHAMORRO ARAUJO	Leonardo Valentino		DNI		Manuel M aza  3749   		1569780950			M		valentino.chamorro@sagradoalcal.edu.ar		
972	DIAZ 	Milagros Belén		DNI		OTAMENDI 2380   		4208-8905			F		milagros.diaz@sagradoalcal.edu.ar		
973	FRANCO	Fabricio Sebastián		DNI		CARLOS PELLEGRINI 2060   		1526643907			M		fabricio.franco@sagradoalcal.edu.ar		
974	BENITEZ	Milagros Ayelén		DNI		POTOSI 2561   		1523851948			F		milagros.benitez@sagradoalcal.edu.ar		
975	FERNANDEZ	Kiara Agostina		DNI		Potosí 603   		1532036863			F		kiara.fernandez@sagradoalcal.edu.ar		
976	ALMARAZ	Barbara Alejandra		DNI		DARRAGUEIRA 1645   		1133572527			F		barbara.almaraz@sagradoalcal.edu.ar		
977	DRAMAJO 	Sharon Denisse		DNI		M . MAZA  3671   		1539019526			F		sharon.dramajo@sagradoalcal.edu.ar		
978	BAEZ	Victoria Daniela		DNI		DARRAGUEIRA 1855   		1532839759			F		victoria.baez@sagradoalcal.edu.ar		
979	AGUIRRE ZALAZAR	Nicolás Javier		DNI		JORGE OBON  2432   		1551514973			M		nicolas.aguirre@sagradoalcal.edu.ar		
980	CORONEL	Santiago Lionel		DNI		ARISTOBULO DEL VALLE 3790   		1523432596			M		santiago.coronel@sagradoalcal.edu.ar		
981	ALDERETE	David Alejandro		DNI		M .Maza  3786   		1126899465			M		david.alderete@sagradoalcal.edu.ar		
982	RAMOS ALARCON	Christian Sharon		DNI		Darragueira 2118   		1134903222			M		christian.ramos@sagradoalcal.edu.ar		
983	SANCHEZ	Leandro Yair		DNI		Darragueira 2118   		1550206487			M		leandro.sanchez@sagradoalcal.edu.ar		
984	RODRIGUEZ	Agustina  Trinidad Belen 		DNI		warnes  4141   		1566462950			F		agustina.rodriguez@sagradoalcal.edu.ar		
985	GARCIA	Ariel José		DNI		JORGE OBON  2432   		4209-9127			M		ariel.garcia@sagradoalcal.edu.ar		
986	OCAMPO MAIDANA	Lautaro Demian		DNI		HABANA  848 CASA 3  		1562559073			M		lautaro.ocampo@sagradoalcal.edu.ar		
987	ORELLANA BILLORDO	Joaquín Donato		DNI		E. CASTRO  4005   		1549373183			M		joaquin.orellana@sagradoalcal.edu.ar		
988	CORBALAN	Maitena Denise		DNI		EDUARDO MADERO 2569   		1558172215			F		maitena.corbalan@sagradoalcal.edu.ar		
989	MACIEL 	Dulce Milagros		DNI		CNEL SAYOS 4085   		1555748768			F		dulce.maciel@sagradoalcal.edu.ar		
990	GALLARDO 	Jorge Nicolás		DNI		WARNES  3602   		1521856982			M		jorge.gallardo@sagradoalcal.edu.ar		
991	FARIAS	Julieta Martina		DNI		OTAMENDI  2303   		4228-0151			F		julieta.farias@sagradoalcal.edu.ar		
992	ALDREY	Victoria Nayme		DNI		JORGE OBON  2618   		1569167235			F		victoria.aldrey@sagradoalcal.edu.ar		
993	LUBARA	Ludmila Aylen		DNI		POTOSI 593   		1541890410			F		ludmila.lubara@sagradoalcal.edu.ar		
994	BLANCO 	Lucía Belén		DNI		E.MADERO  2609   		1558518460			F		lucia.blanco@sagradoalcal.edu.ar		
995	LUNA 	Marcos Santino		DNI		TALCAHUANO 4139   		1568121884			M		marcos.luna@sagradoalcal.edu.ar		
996	CAZAL LEDESMA 	Lucas Valentín		DNI		OSORIO  2833   		1567136894			M		lucas.cazal@sagradoalcal.edu.ar		
997	QUIÑONES	Thiago Agustín		DNI		TALCAHUANO 4150   		1567267531			M		thiago.quinones@sagradoalcal.edu.ar		
998	TRONCOSO LARANGA	Thiago Paul		DNI		warnes  3949   		1565113788			M		thiago.troncoso@sagradoalcal.edu.ar		
999	PONCE 	Morena Tatiana		DNI		Otamendí  457   		1154124278/ 1132801277			F		morena.ponce@sagradoalcal.edu.ar		
1000	ROJAS MOLINA 	Liz  Abigail		DNI		WARNES  3788   		1134748473			F		abigail.rojas@sagradoalcal.edu.ar		
1001	ROMERO	Nicolás Antonio		DNI		MANUEL MAZA  3832   		4228-7082			M		nicolas.romero@sagradoalcal.edu.ar		
1002	ARISTIQUI	Camila Celeste		DNI		EMILIO CASTRO 3763   		1533758936			F		camila.aristiqui@sagradoalcal.edu.ar		
1003	SANCHEZ	Layla Mariana		DNI		E. MADERO 2662   		1540889382			F		layla.sanchez@sagradoalcal.edu.ar		
1004	MARTINEZ ESCALADA	Alejo Matías		DNI		OSORIO  2837   		1161432503			M		alejo.m.martinez@sagradoalcal.edu.ar		
1005	MASCHIO	Nahuel Saúl		DNI		TALCAHUANO 4101   		1532131384			M		nahuel.maschio@sagradoalcal.edu.ar		
1006	SILVA	Luana Yael		DNI		OSORIO 2427   		1160426655			F		luana.silva@sagradoalcal.edu.ar		
1007	MARUSZKIEWICZ	Melinda Luz		DNI		J OBON  2529   		1564643902			F		melinda.maruszkiewicz@sagradoalcal.edu.ar		
1008	SUAREZ	Thiago Benjamín		DNI		PJE AGUSTIN MAGALDI 453   		1569792990			M		thiago.b.suarez@sagradoalcal.edu.ar		
1009	OJEDA 	Cristopher Uriel		DNI		YATAY  2313   		1523164286			M		cristopher.ojeda@sagradoalcal.edu.ar		
1010	MAMANI QUISPE	Santiago Benjamín		DNI		warnes  4141   		1523675477			M		santiago.mamani@sagradoalcal.edu.ar		
1011	OJEDA	Agostina Nahiara		DNI		MANUEL MAZA  3636   		1522590194			F		agostina.ojeda@sagradoalcal.edu.ar		
1012	LEDESMA	Brandon Ezequiel		DNI		MANUEL MAZA  4020   		1557446985			M		brandon.ledesma@sagradoalcal.edu.ar		
1013	LEIVA	Brisa Agostina		DNI		E MADERO 2297   		1553339775			F		brisa.leiva@sagradoalcal.edu.ar		
1014	UGARTE 	Kiara Aylén		DNI		WARNES  4055   		1527742477			F		kiara.ugarte@sagradoalcal.edu.ar		
1015	MOLINA	Gonzalo Isaías		DNI		JORGE OBON 2451   		1538656074			M		gonzalo.molina@sagradoalcal.edu.ar		
1016	MOLINA	Leonel Ezequiel		DNI		JORGE OBON  2451   		1538656074			M		leonel.molina@sagradoalcal.edu.ar		
1017	LUQUE DIAZ	Franco Daniel		DNI		TALCAHUANO 3666   		1567623535			M		franco.luque@sagradoalcal.edu.ar		
1018	LEZCANO 	Richard Steven		DNI		MANUEL MAZA  3715   		1524572265			M		richard.lezcano@sagradoalcal.edu.ar		
1019	ESPINOZA FAUSTINO	Ángel Paulino		DNI		POTOSI  2141   		1559602856			M		angel.espinoza@sagradoalcal.edu.ar		
1020	RAMIREZ GUANES 	Jeremías Valentín		DNI		OLIDEN 3547   		42865030			M		jeremias.ramirez@sagradoalcal.edu.ar		
1021	ROJAS 	Luana Magalí		DNI		Emilio Castro  3764   		1535259648			F		luana.rojas@sagradoalcal.edu.ar		
1022	CABRERA DENIZ 	Raizel Pamela		DNI		Talcahuano  4134   		1521815763			F		raizel.cabrera@sagradoalcal.edu.ar		
1023	GUAITIMA	Alain		DNI		EMILIO CASTRO  3956   		1523923362			M		alain.guaitima@sagradoalcal.edu.ar		
1024	PALACIOS 	Uriel		DNI		VIAMONTE 3605   		3857464653			M		uriel.palacios@sagradoalcal.edu.ar		
1025	ZURITA MONTERO 	Leonel Gonzalo		DNI		MILLAN  3855   		1537635165			M		leonel.zurita@sagradoalcal.edu.ar		
1026	GONZÁLEZ	Ariana Xiomara		DNI		SAYOS 3783		1532383305			F		ariana.gonzalez@sagradoalcal.edu.ar		
1257	Sen 	Estanislao									Masculino		esen@sagradoalcal.edu.ar		
1258	Taliercio 	Maria Gracia									Femenino		gtaliercio@sagradoalcal.edu.ar		
1259	Kulik 	Andres									Masculino		akulik@sagradoalcal.edu.ar		
1260	Bonifacini 	Elba Sandra									Femenino		sbonifacini@sagradoalcal.edu.ar		
1261	Gonzales 	Claudia									Femenino				
1262	Flores 	Rafael Alejandro									Masculino		raflores@sagradoalcal.edu.ar		
1263	Báez 	Marcelo Adolfo									Masculino		mbaez@sagradoalcal.edu.ar		
1264	Guerrero 	Ana Carina									Femenino		cguerrero@sagradoalcal.edu.ar		
1265	Fernández	Roxana									Femenino		rfernandez@sagradoalcal.edu.ar		
1266	Blanco	Marisol									Femenino		mblanco@sagradoalcal.edu.ar		
1267	Ughetti 	Javier Martin									Masculino		jughetti@sagradoalcal.edu.ar		
1268	Bordón 	José Victor									Masculino		jbordon@sagradoalcal.edu.ar		
1269	Lezcano  	Gastón Leopoldo						4285-5050			Masculino		glezcano@sagradoalcal.edu.ar		
1270	Gómez	Diego									Masculino		dgomez@sagradoalcal.edu.ar		
1271	Crismai 	Natalia Andrea						3980-2797			Femenino		ncrismai@sagradoalcal.edu.ar		
1272	Del Corro	Miguel Calixto									Masculino		mdelcorro@sagradoalcal.edu.ar		
1273	Lado	Lorena									Femenino		llado@sagradoalcal.edu.ar		
1274	Rojas 	Claudio Alberto						4209-7590			Masculino		crojas@sagradoalcal.edu.ar		
1275	Altamiranda 	Esteban									Masculino		ealtamiranda@sagradoalcal.edu.ar		
1276	García 	Yanina Mariel									Femenino		ygarcia@sagradoalcal.edu.ar		
1277	Otero	Nadia Vanesa									Femenino		votero@sagradoalcal.edu.ar		
1278	Muscari	Mariano									Masculino		mmuscari@sagradoalcal.edu.ar		
1279	Ferrero 	Maria Victoria 									Femenino		vferrero@sagradoalcal.edu.ar		
1280	Berone 	Maximiliano Ezequiel									Masculino		mberone@sagradoalcal.edu.ar		
1281	Martín 	Luciana									Femenino		lmartin@sagradoalcal.edu.ar		
1282	De Bonis 	Esteban Miguel									Masculino		edebonis@sagradoalcal.edu.ar	AR	1
1283	Cajaraville 	Noelia Paola									Femenino		ncajaraville@sagradoalcal.edu.ar		
1284	Perasso 	Tomás Agustin									Masculino		tperasso@sagradoalcal.edu.ar		
1285	Romero 	Juan Pablo									Masculino		jromero@sagradoalcal.edu.ar		
1286	Carballo 	Matías Exequiel									Masculino		mcarballo@sagradoalcal.edu.ar		
1287	Papaianni 	Mariano Emmanuel Raul									Masculino		mpapaianni@sagradoalcal.edu.ar		
1288	Herrera 	Patricia Daniela									Femenino		pherrera@sagradoalcal.edu.ar		
1289	Pignataro	Micaela									Femenino		mpignataro@sagradoalcal.edu.ar		
1290	Laborde 	Paula Gabriela									Femenino		plaborde@sagradoalcal.edu.ar		
1291	González 	Maria Lorena 									Femenino		lgonzalez@sagradoalcal.edu.ar		
1292	Sequeira 	Sabrina Soledad									Femenino		ssequeira@sagradoalcal.edu.ar		
1293	González 	Natalia									Femenino		ngonzalez@sagradoalcal.edu.ar		
1294	Pontoriero	Lina Luján									Femenino		lpontoriero@sagradoalcal.edu.ar		
1295	Calviello 	Matías Damian									Masculino		mcalviello@sagradoalcal.edu.ar		
1296	Alvarenga 	Erika									Femenino		ealvarenga@sagradoalcal.edu.ar		
1297	Barakian  	Layla Belen									Femenino		lbarakian@sagradoalcal.edu.ar		
1298	Vaisman	Jésica									Femenino		jvaisman@sagradoalcal.edu.ar		
1299	Chiesa 	Leonardo Alejandro									Masculino		lchiesa@sagradoalcal.edu.ar		
1300	Cuesta 	Federico Martin									Masculino		fcuesta@sagradoalcal.edu.ar		
1301	Gómez	Carlos Andrés									Masculino		cgomez@sagradoalcal.edu.ar		
1302	Gubitosi 	Florencia Dulcinea 									Femenino		dgubitosi@sagradoalcal.edu.ar		
1303	Cruz 	Camila									Femenino		ccruz@sagradoalcal.edu.ar		
1304	Crippa 	Andrés Miguel									Masculino		acrippa@sagradoalcal.edu.ar		
1305	Sierra Bueno 	Camila Micaela						--------------			Femenino		csierrabueno@sagradoalcal.edu.ar		
1306	Navas	Pablo									Masculino		pnavas@sagradoalcal.edu.ar		
1307	Cáceres 	Mario Nicolás									Masculino		ncaceres@sagradoalcal.edu.ar		
1308	Valenzuela Colman	Gustavo Andrés									Masculino		gvalenzuela@sagradoalcal.edu.ar		
1309	Carrizo	Cayetano Jesus						4228-7778			Masculino		ccarrizo@sagradoalcal.edu.ar		6
1310	Giaimo 	Paula Jimena									Femenino		pgiaimo@sagradoalcal.edu.ar		
1311	Bugna 	Gisella Carla									Femenino		gbugna@sagradoalcal.edu.ar		
1312	Demonte	Carolina									Femenino		cdemonte@sagradoalcal.edu.ar		
1313	Meczynski	Wanda									Femenino		wmeczynski@sagradoalcal.edu.ar		
1314	Prieto	Florencia									Femenino		florencia.prieto@sagradoalcal.edu.ar		
1315	Nery	Damián									Masculino		dnery@sagradoalcal.edu.ar		
1316	Scalercio	Sofía Antonella									Femenino		sscalercio@sagradoalcal.edu.ar		
1317	Fassinato	Santiago									Masculino		sfassinato@sagradoalcal.edu.ar		
1318	Vitullo 	Ezequiel						4362-5976			Masculino		evitullo@sagradoalcal.edu.ar		
1319	Foresi	Marco									Masculino		mforesi@sagradoalcal.edu.ar		
1320	Sabatini	Natalia									Femenino		nsabatini@sagradoalcal.edu.ar		
\.


--
-- Data for Name: _alcal_seguimiento; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_seguimiento (id, notificacion, fecha, tipo, estudiante_id) FROM stdin;
7	Prueba de seguimiento		Cambio de Modalidad	453
\.


--
-- Data for Name: _alcal_turno; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._alcal_turno (id, maniana, ed_fisica, fecha, curso_id, tarde) FROM stdin;
1	0	0		1	0
2	0	0		1	0
3	0	0		1	0
4	0	0		1	0
5	0	0		3	0
6	0	0		8	0
7	0	0		7	0
8	0	0		7	0
9	0	0		1	0
10	0	0		4	0
11	0	0		11	0
12	0	0		1	0
13	0	0		13	0
14	0	0		1	0
15	0	0		1	0
16	0	0		1	0
17	0	0		1	0
18	0	0		1	0
19	0	0		1	0
20	0	0		1	0
21	0	0		1	0
23	0	0		1	2
24	0	0		11	0
25	3	0		1	2
26	4	0		1	0
27	1	0		9	0
28	0	1		10	1
29	0	2		10	0
30	3	0		1	0
\.


--
-- Data for Name: _auth_group; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._auth_group (id, name) FROM stdin;
6	administracion
3	alumno
4	directivo
1	docente
2	preceptor
5	rl
\.


--
-- Data for Name: _auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._auth_group_permissions (id, group_id, permission_id) FROM stdin;
2	1	86
3	1	87
1	1	88
\.


--
-- Data for Name: _auth_permission; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._auth_permission (id, content_type_id, codename, name) FROM stdin;
1	1	add_logentry	Can add log entry
2	1	change_logentry	Can change log entry
3	1	delete_logentry	Can delete log entry
4	1	view_logentry	Can view log entry
5	2	add_permission	Can add permission
6	2	change_permission	Can change permission
7	2	delete_permission	Can delete permission
8	2	view_permission	Can view permission
9	3	add_group	Can add group
10	3	change_group	Can change group
11	3	delete_group	Can delete group
12	3	view_group	Can view group
13	4	add_user	Can add user
14	4	change_user	Can change user
15	4	delete_user	Can delete user
16	4	view_user	Can view user
17	5	add_contenttype	Can add content type
18	5	change_contenttype	Can change content type
19	5	delete_contenttype	Can delete content type
20	5	view_contenttype	Can view content type
21	6	add_session	Can add session
22	6	change_session	Can change session
23	6	delete_session	Can delete session
24	6	view_session	Can view session
25	7	add_carrera	Can add carrera
26	7	change_carrera	Can change carrera
27	7	delete_carrera	Can delete carrera
28	7	view_carrera	Can view carrera
29	8	add_curso	Can add curso
30	8	change_curso	Can change curso
31	8	delete_curso	Can delete curso
32	8	view_curso	Can view curso
33	9	add_documentacion	Can add documentacion
34	9	change_documentacion	Can change documentacion
35	9	delete_documentacion	Can delete documentacion
36	9	view_documentacion	Can view documentacion
37	10	add_materia	Can add materia
38	10	change_materia	Can change materia
39	10	delete_materia	Can delete materia
40	10	view_materia	Can view materia
41	11	add_mesapendiente	Can add Mesa de Pendientes
42	11	change_mesapendiente	Can change Mesa de Pendientes
43	11	delete_mesapendiente	Can delete Mesa de Pendientes
44	11	view_mesapendiente	Can view Mesa de Pendientes
45	12	add_nombrecuota	Can add nombre cuota
46	12	change_nombrecuota	Can change nombre cuota
47	12	delete_nombrecuota	Can delete nombre cuota
48	12	view_nombrecuota	Can view nombre cuota
49	13	add_periodo	Can add periodo
50	13	change_periodo	Can change periodo
51	13	delete_periodo	Can delete periodo
52	13	view_periodo	Can view periodo
53	14	add_persona	Can add persona
54	14	change_persona	Can change persona
55	14	delete_persona	Can delete persona
56	14	view_persona	Can view persona
57	15	add_docente	Can add docente
58	15	change_docente	Can change docente
59	15	delete_docente	Can delete docente
60	15	view_docente	Can view docente
61	16	add_estudiante	Can add estudiante
62	16	change_estudiante	Can change estudiante
63	16	delete_estudiante	Can delete estudiante
64	16	view_estudiante	Can view estudiante
65	17	add_padre	Can add padre
66	17	change_padre	Can change padre
67	17	delete_padre	Can delete padre
68	17	view_padre	Can view padre
69	18	add_pendiente	Can add pendiente
70	18	change_pendiente	Can change pendiente
71	18	delete_pendiente	Can delete pendiente
72	18	view_pendiente	Can view pendiente
73	19	add_notapendiente	Can add nota pendiente
74	19	change_notapendiente	Can change nota pendiente
75	19	delete_notapendiente	Can delete nota pendiente
76	19	view_notapendiente	Can view nota pendiente
77	20	add_inscripcionpendiente	Can add inscripcion pendiente
78	20	change_inscripcionpendiente	Can change inscripcion pendiente
79	20	delete_inscripcionpendiente	Can delete inscripcion pendiente
80	20	view_inscripcionpendiente	Can view inscripcion pendiente
81	21	add_seguimiento	Can add seguimiento
82	21	change_seguimiento	Can change seguimiento
83	21	delete_seguimiento	Can delete seguimiento
84	21	view_seguimiento	Can view seguimiento
85	22	add_notificacion	Can add notificacion
86	22	change_notificacion	Can change notificacion
87	22	delete_notificacion	Can delete notificacion
88	22	view_notificacion	Can view notificacion
89	23	add_notaparcial	Can add nota parcial
90	23	change_notaparcial	Can change nota parcial
91	23	delete_notaparcial	Can delete nota parcial
92	23	view_notaparcial	Can view nota parcial
93	24	add_nota	Can add nota
94	24	change_nota	Can change nota
95	24	delete_nota	Can delete nota
96	24	view_nota	Can view nota
97	25	add_inasistencia	Can add inasistencia
98	25	change_inasistencia	Can change inasistencia
99	25	delete_inasistencia	Can delete inasistencia
100	25	view_inasistencia	Can view inasistencia
101	26	add_fechaaltabaja	Can add fecha alta baja
102	26	change_fechaaltabaja	Can change fecha alta baja
103	26	delete_fechaaltabaja	Can delete fecha alta baja
104	26	view_fechaaltabaja	Can view fecha alta baja
105	27	add_faltas	Can add faltas
106	27	change_faltas	Can change faltas
107	27	delete_faltas	Can delete faltas
108	27	view_faltas	Can view faltas
109	28	add_cuota	Can add cuota
110	28	change_cuota	Can change cuota
111	28	delete_cuota	Can delete cuota
112	28	view_cuota	Can view cuota
113	29	add_turnos	Can add turnos
114	29	change_turnos	Can change turnos
115	29	delete_turnos	Can delete turnos
116	29	view_turnos	Can view turnos
117	29	add_turno	Can add turno
118	29	change_turno	Can change turno
119	29	delete_turno	Can delete turno
120	29	view_turno	Can view turno
\.


--
-- Data for Name: _auth_user; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._auth_user (id, password, last_login, is_superuser, username, first_name, email, is_staff, is_active, date_joined, last_name) FROM stdin;
1	pbkdf2_sha256$150000$cr1t8OTu9Veh$xMwRNx0/riygFUyxm+axZQNJfuCi7iRYIF405Rfy+x8=	2020-04-29	1	esteban			1	1		
2	pbkdf2_sha256$150000$gzO7UoRh0Bke$31EpuQzFFMNDquOYpX5gIhGnlqHNuV1xhuZ3GjQEhp8=		0	tperasso			0	1		
3	pbkdf2_sha256$150000$Pnvw3g3EEmMw$VKaVo7F+HCtMFynhE4buxKH0PMn3t/to/RzJVn4SVyQ=		0	saso			1	1		
4	pbkdf2_sha256$150000$u4AniS1u73CK$wtxHXnu6Uh/71oPJozFe1OvJbyfseRh/mtfYMB1w9Mk=		0	dulci			1	1		
5	pbkdf2_sha256$150000$7Qp6NO7vCdAr$KNeTXZDTKqE9W7zpUnpXUoUnqygfBLoMjf0NvZnN658=		0	lecho			0	1		
6	pbkdf2_sha256$150000$q57hVvErAM0d$X2EdpBcppMEZEqoucc5k4pNngxL90FaayERRuBsA3Fc=		0	caye			0	1		
7	pbkdf2_sha256$150000$tpktLx4XESc4$C8tRaZGAIc1Fx/FMkVGbhopFYmCcjN63f+OfsZSbkXQ=	2020-02-17	0	vferrero			1	1		
\.


--
-- Data for Name: _auth_user_groups; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
9	2	4
8	3	5
5	4	1
6	4	4
7	5	6
3	6	1
4	6	2
2	7	1
\.


--
-- Data for Name: _auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: _django_admin_log; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._django_admin_log (id, action_time, object_id, object_repr, change_message, content_type_id, user_id, action_flag) FROM stdin;
1	2020-01-06	1	1A	[{"added": {}}]	8	1	1
2	2020-01-06	1	1 - De Bonis, Esteban	[{"added": {}}]	16	1	1
3	2020-01-06	1	2020-01-06 - 1 - De Bonis, Esteban	[{"added": {}}]	25	1	1
4	2020-01-06	2	2020-01-24 - 1 - De Bonis, Esteban	[{"added": {}}]	25	1	1
5	2020-01-06	3	2020-01-02 - 1 - De Bonis, Esteban	[{"added": {}}]	25	1	1
6	2020-01-06	2	1B	[{"added": {}}]	8	1	1
7	2020-01-06	3	7B	[{"added": {}}]	8	1	1
8	2020-01-06	4	6B	[{"added": {}}]	8	1	1
9	2020-01-06	5	6A	[{"added": {}}]	8	1	1
10	2020-01-06	6	5A	[{"added": {}}]	8	1	1
11	2020-01-06	7	5B	[{"added": {}}]	8	1	1
12	2020-01-06	8	4B	[{"added": {}}]	8	1	1
13	2020-01-06	9	3B	[{"added": {}}]	8	1	1
14	2020-01-06	10	2B	[{"added": {}}]	8	1	1
15	2020-01-06	11	4A	[{"added": {}}]	8	1	1
16	2020-01-06	12	3A	[{"added": {}}]	8	1	1
17	2020-01-06	13	2A	[{"added": {}}]	8	1	1
18	2020-01-13	4	2020-01-13 - 122 - Gené, Ángel Carlos	[{"added": {}}]	25	1	1
19	2020-01-13	5	2020-01-13 - 111 - Gené, Ticiana	[{"added": {}}]	25	1	1
20	2020-01-13	6	2020-01-13 - 1 - De Bonis, Esteban	[{"added": {}}]	25	1	1
21	2020-01-22	123	123 - Rius, Concepción	[{"changed": {"fields": ["curso"]}}]	16	1	2
22	2020-01-28	456	456 - Brunacci, Hernán	[{"changed": {"fields": ["genero"]}}]	16	1	2
23	2020-01-28	123	123 - Rius, Concepción	[{"changed": {"fields": ["genero"]}}]	16	1	2
24	2020-01-28	122	122 - Gené, Ángel Carlos	[{"changed": {"fields": ["genero"]}}]	16	1	2
25	2020-01-28	111	111 - Gené, Ticiana	[{"changed": {"fields": ["genero"]}}]	16	1	2
26	2020-01-28	1	1 - De Bonis, Esteban	[{"changed": {"fields": ["genero"]}}]	16	1	2
27	2020-01-30	1	Técnico en programación	[{"added": {}}]	7	1	1
28	2020-01-30	1	Matemática - 1B	[{"added": {}}]	10	1	1
29	2020-01-30	7	29502721 - De Bonis, Esteban	[{"added": {}}]	15	1	1
30	2020-01-30	2	Sistemas Digitales II - 6B	[{"added": {}}]	10	1	1
31	2020-01-30	1	docente	[{"added": {}}]	3	1	1
32	2020-01-30	1	esteban	[{"changed": {"fields": ["groups"]}}]	4	1	2
33	2020-01-30	2	tperasso	[{"added": {}}]	4	1	1
34	2020-01-30	8	None - Perasso, Tomás	[{"added": {}}]	15	1	1
35	2020-01-30	3	Filosofía - 6B	[{"added": {}}]	10	1	1
36	2020-01-30	1	docente	[]	3	1	2
37	2020-01-30	2	preceptor	[{"added": {}}]	3	1	1
38	2020-01-30	3	alumno	[{"added": {}}]	3	1	1
39	2020-01-30	4	directivo	[{"added": {}}]	3	1	1
40	2020-01-30	5	rl	[{"added": {}}]	3	1	1
41	2020-01-30	6	administracion	[{"added": {}}]	3	1	1
42	2020-01-30	3	saso	[{"added": {}}]	4	1	1
43	2020-01-30	4	dulci	[{"added": {}}]	4	1	1
44	2020-01-30	5	lecho	[{"added": {}}]	4	1	1
45	2020-01-30	6	caye	[{"added": {}}]	4	1	1
46	2020-01-30	7	vferrero	[{"added": {}}]	4	1	1
47	2020-01-30	7	vferrero	[{"changed": {"fields": ["groups"]}}]	4	1	2
48	2020-01-30	6	caye	[{"changed": {"fields": ["groups"]}}]	4	1	2
49	2020-01-30	6	caye	[{"changed": {"fields": ["is_staff"]}}]	4	1	2
50	2020-01-30	4	dulci	[{"changed": {"fields": ["is_staff", "groups"]}}]	4	1	2
51	2020-01-30	5	lecho	[{"changed": {"fields": ["groups"]}}]	4	1	2
52	2020-01-30	5	lecho	[{"changed": {"fields": ["is_staff"]}}]	4	1	2
53	2020-01-30	3	saso	[{"changed": {"fields": ["groups"]}}]	4	1	2
54	2020-01-30	3	saso	[{"changed": {"fields": ["is_staff"]}}]	4	1	2
55	2020-01-30	2	tperasso	[{"changed": {"fields": ["groups"]}}]	4	1	2
56	2020-01-30	6	caye	[{"changed": {"fields": ["is_staff"]}}]	4	1	2
57	2020-01-30	5	lecho	[{"changed": {"fields": ["is_staff"]}}]	4	1	2
58	2020-01-30	10	13 - Ferrero, María Victoria	[{"changed": {"fields": ["numero_de_registro", "foto_perfil"]}}]	15	1	2
59	2020-01-30	7	vferrero	[{"changed": {"fields": ["is_staff"]}}]	4	1	2
60	2020-04-02	96	None - Gubitosi, Dulcinea	[{"added": {}}]	15	1	1
61	2020-04-02	4	Matemática - 2B	[{"added": {}}]	10	1	1
62	2020-04-02	97	None - De Bonis, Esteban	[{"added": {}}]	15	1	1
63	2020-04-02	5	Laboratorio de Programación III - 5B	[{"added": {}}]	10	1	1
64	2020-04-08	1309	None - Carrizo, Cayetano Jesus	[{"changed": {"fields": ["usuario", "apellido", "nombre"]}}]	15	1	2
\.


--
-- Data for Name: _django_content_type; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
7	alcal	carrera
28	alcal	cuota
8	alcal	curso
15	alcal	docente
9	alcal	documentacion
16	alcal	estudiante
27	alcal	faltas
26	alcal	fechaaltabaja
25	alcal	inasistencia
20	alcal	inscripcionpendiente
10	alcal	materia
11	alcal	mesapendiente
12	alcal	nombrecuota
24	alcal	nota
23	alcal	notaparcial
19	alcal	notapendiente
22	alcal	notificacion
17	alcal	padre
18	alcal	pendiente
13	alcal	periodo
14	alcal	persona
21	alcal	seguimiento
29	alcal	turno
3	auth	group
2	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
\.


--
-- Data for Name: _django_migrations; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-01-06
2	auth	0001_initial	2020-01-06
3	admin	0001_initial	2020-01-06
4	admin	0002_logentry_remove_auto_add	2020-01-06
5	admin	0003_logentry_add_action_flag_choices	2020-01-06
6	alcal	0001_initial	2020-01-06
7	contenttypes	0002_remove_content_type_name	2020-01-06
8	auth	0002_alter_permission_name_max_length	2020-01-06
9	auth	0003_alter_user_email_max_length	2020-01-06
10	auth	0004_alter_user_username_opts	2020-01-06
11	auth	0005_alter_user_last_login_null	2020-01-06
12	auth	0006_require_contenttypes_0002	2020-01-06
13	auth	0007_alter_validators_add_error_messages	2020-01-06
14	auth	0008_alter_user_username_max_length	2020-01-06
15	auth	0009_alter_user_last_name_max_length	2020-01-06
16	auth	0010_alter_group_name_max_length	2020-01-06
17	auth	0011_update_proxy_permissions	2020-01-06
18	sessions	0001_initial	2020-01-06
19	alcal	0002_auto_20200123_1929	2020-01-23
20	alcal	0003_persona_usuario	2020-01-30
21	alcal	0004_auto_20200129_2237	2020-01-30
22	alcal	0005_auto_20200130_1506	2020-01-30
23	alcal	0006_auto_20200218_1003	2020-02-18
24	alcal	0007_turnos	2020-04-16
25	alcal	0008_auto_20200415_2343	2020-04-16
26	alcal	0009_auto_20200420_0122	2020-04-20
\.


--
-- Data for Name: _django_session; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._django_session (session_key, session_data, expire_date) FROM stdin;
jzxswqnj9g8z2pj9w4dflm70i1axncdx	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-01-20
yboqd05o0mho6amriqr4329c6w3w263z	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-02-05
b6k3jygywi2wwjwtjt1ga9513ri8zzp4	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-02-08
rf1rc5p64kw33ry2zjxvhwe0cge7fm9m	MGE1ZTE0M2Q3ODZkN2U4MjRhMjQyOGMwYjFjMmU3YjdjYzBiYzgyMTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNTg1NDE5NTY5MDFjYjNiYWE4NWMzNmNjMjRlNGM3M2E5MGM0MDNhIn0=	2020-02-13
3obv36bil04hc68tgy8ski7z7966a5gy	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-03-02
lo0jfa7246o5cubtjemvnd3pbl27p5h4	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-03-17
b11slw68dzueuf38ajg8y5kd1vbfbscm	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-04-14
b81htug6bjw5eehr11jjxalbqp1hrrv0	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-04-27
tbcbuflzsf5rmp7sfteznnu3o65uw09t	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-04-28
q6kb806etkpmy497uw2edkhimjgjolxj	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-05-12
9ff1ge5ukrxj6q7rv7huv7xade77wxd1	ZGI0ZjAxYzQ3YTM1YjQzOThmMjNhYTdhOWQyMTExNjQ1ZmU3MjE5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmExZGFmNjA2MjViODhlZDFjNzVmM2U3ZjU5ODUzODZlZjVkYmVjIn0=	2020-05-13
\.


--
-- Data for Name: _sqlite_sequence; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._sqlite_sequence (name, seq) FROM stdin;
alcal_turno	30
alcal_notaparcial	2
alcal_inasistencia	1485
alcal_persona	1320
auth_group	6
auth_user	7
auth_permission	120
django_content_type	29
alcal_faltas	251
alcal_materia	575
alcal_seguimiento	7
alcal_curso	13
alcal_carrera	2
django_admin_log	64
auth_user_groups	9
auth_group_permissions	3
django_migrations	26
\.


--
-- PostgreSQL database dump complete
--

