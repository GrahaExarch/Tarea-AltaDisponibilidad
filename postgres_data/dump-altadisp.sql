--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-10-15 01:23:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3324 (class 1262 OID 16394)
-- Name: altadisp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE altadisp WITH TEMPLATE = template0 ENCODING = 'UTF8' ;


ALTER DATABASE altadisp OWNER TO postgres;

\connect altadisp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: contenido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenido (
    nombre character varying,
    idtipo integer NOT NULL,
    urlimagen character varying,
    rating real,
    detalle character varying,
    id integer NOT NULL
);


ALTER TABLE public.contenido OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16402)
-- Name: contenido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contenido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contenido_id_seq OWNER TO postgres;

--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 210
-- Name: contenido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contenido_id_seq OWNED BY public.contenido.id;


--
-- TOC entry 212 (class 1259 OID 16412)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16411)
-- Name: tipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_id_seq OWNER TO postgres;

--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_seq OWNED BY public.tipo.id;


--
-- TOC entry 3169 (class 2604 OID 16403)
-- Name: contenido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido ALTER COLUMN id SET DEFAULT nextval('public.contenido_id_seq'::regclass);


--
-- TOC entry 3170 (class 2604 OID 16415)
-- Name: tipo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo ALTER COLUMN id SET DEFAULT nextval('public.tipo_id_seq'::regclass);


--
-- TOC entry 3315 (class 0 OID 16395)
-- Dependencies: 209
-- Data for Name: contenido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenido (nombre, idtipo, urlimagen, rating, detalle, id) FROM stdin;
Bayonetta 3	1	https://images.nintendolife.com/eb02f7e2fbc1a/bayonetta-3-cover.cover_large.jpg	4	uwu	5
Yakuza Kiwami 2	2	https://image.api.playstation.com/cdn/UP0177/CUSA11713_00/EkgjItET54x6xKDHs8wh3mm2tdZe2OeK.png	3.5	bakamitai	6
Final fantasy XIV	2	https://m.media-amazon.com/images/M/MV5BOWY4ZDM5MGYtNGRmYi00ZjU1LWE5N2ItYTcwZGM4OTMyN2U3XkEyXkFqcGdeQXVyOTY0Nzk1MzI@._V1_.jpg	5	Have you heard of the critically acclaimed MMORPG Final Fantasy XIV? With an expanded free trial which you can play through the entirety of A Realm Reborn and the award winning Heavensward expansion up to level 60 for free with no restrictions on playtime.	7
\.


--
-- TOC entry 3318 (class 0 OID 16412)
-- Dependencies: 212
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo (id, nombre) FROM stdin;
1	Nintendo Switch
2	PS4/PS5
3	PC
\.


--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 210
-- Name: contenido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contenido_id_seq', 7, true);


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_seq', 3, true);


--
-- TOC entry 3172 (class 2606 OID 16410)
-- Name: contenido primarykey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido
    ADD CONSTRAINT primarykey PRIMARY KEY (id);


--
-- TOC entry 3174 (class 2606 OID 16419)
-- Name: tipo tipo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pk PRIMARY KEY (id);


--
-- TOC entry 3175 (class 2606 OID 16441)
-- Name: contenido contenido_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido
    ADD CONSTRAINT contenido_fk FOREIGN KEY (idtipo) REFERENCES public.tipo(id);


-- Completed on 2022-10-15 01:23:24

--
-- PostgreSQL database dump complete
--

