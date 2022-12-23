--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: atividade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.atividade (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer
);


--
-- Name: atividade_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.atividade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: atividade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.atividade_id_seq OWNED BY public.atividade.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "newUrl" text NOT NULL,
    visit integer DEFAULT 0 NOT NULL,
    "userId" integer
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: atividade id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.atividade ALTER COLUMN id SET DEFAULT nextval('public.atividade_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: atividade; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.atividade VALUES (1, '056bb393-c08f-4bfb-8fb0-4a29f8240196', 4);
INSERT INTO public.atividade VALUES (2, '1dd29343-dcae-4daa-98a5-e21ee32052cf', 4);
INSERT INTO public.atividade VALUES (3, '70a0cebb-1e13-49ac-833e-dc29c997df89', 4);


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (6, 'gab', 'Iym9nm7D', 0, NULL);
INSERT INTO public.urls VALUES (7, 'gab', 'dwOB84g5', 0, NULL);
INSERT INTO public.urls VALUES (11, 'gabasdasda', '24dSu', 0, NULL);
INSERT INTO public.urls VALUES (12, 'gabasdasda', 'mc1zV', 0, NULL);
INSERT INTO public.urls VALUES (14, 'blablabla', 'KmKsr', 0, NULL);
INSERT INTO public.urls VALUES (17, 'blablabla', 'NlObI', 0, NULL);
INSERT INTO public.urls VALUES (18, 'blablabla', 'g9vkn', 0, 4);
INSERT INTO public.urls VALUES (20, 'blablabla', 'Oy5pY', 0, 4);
INSERT INTO public.urls VALUES (21, 'blablasdfsdfbla', 'yk60K', 0, 4);
INSERT INTO public.urls VALUES (22, 'blablasdfsdfbla', '5iqnZ', 0, 4);
INSERT INTO public.urls VALUES (25, 'http://www.google.com.br', 'MH8fU', 0, 4);
INSERT INTO public.urls VALUES (26, 'http://www.google.com.br', 'zVvNt', 0, 4);
INSERT INTO public.urls VALUES (27, 'http://www.google.com.br', 'oSoY5', 0, 4);
INSERT INTO public.urls VALUES (28, 'http://www.google.com.br', 'Sws4J', 0, 4);
INSERT INTO public.urls VALUES (29, 'http://www.google.com.br', 'mLLbp', 0, 4);
INSERT INTO public.urls VALUES (30, 'http://www.google.com.br', 'I32_b', 0, 4);
INSERT INTO public.urls VALUES (31, 'http://www.google.com.br', 'sryzu', 0, 4);
INSERT INTO public.urls VALUES (32, 'http://www.google.com.br', 'kCUVE', 0, 4);
INSERT INTO public.urls VALUES (33, 'http://www.google.com.br', '4NGKZ', 0, 4);
INSERT INTO public.urls VALUES (34, 'http://www.google.com.br', 'zjNGJ', 0, 4);
INSERT INTO public.urls VALUES (36, 'http://www.google.com.br', '3YckB', 0, 4);
INSERT INTO public.urls VALUES (37, 'http://www.google.com.br', '318JF', 0, 4);
INSERT INTO public.urls VALUES (38, 'http://www.google.com.br', 'aXqAJ', 0, 4);
INSERT INTO public.urls VALUES (39, 'http://www.google.com.br', 'xGo8z', 0, 4);
INSERT INTO public.urls VALUES (40, 'http://www.google.com.br', 'AvS0a', 0, 4);
INSERT INTO public.urls VALUES (41, 's', 'GkDbp', 0, 4);
INSERT INTO public.urls VALUES (42, 's', 'AqABx', 0, 4);
INSERT INTO public.urls VALUES (43, 's', 'tQMix', 0, 4);
INSERT INTO public.urls VALUES (44, 'http://www.google.com.br', 'WSEH5', 0, 4);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuarios VALUES (1, 'gab', 'gab@gab.com', '$2b$05$qBMK1oP3iadHdBYNYsKjx.nC5BvmzLKOWiFUnJQPJvN5AMUo0Pqgm');
INSERT INTO public.usuarios VALUES (2, 'gab', 'gab@gab.com', '$2b$05$yCwNBmLSx4aOe4ONO1duduyTSYix07iaFnm2gstyoJVHNuOzWejae');
INSERT INTO public.usuarios VALUES (3, 'gab', 'gab@gab.com', '$2b$05$4hijaahFFiEoLxRAfLFM0O8h5ogEITkj8GhWEKIgA9TVHXuNCPDCS');
INSERT INTO public.usuarios VALUES (4, 'juju', 'juju@juju.com', '$2b$05$o1UIMuzXTibOV.HTOBymC.HCwEqLZ3ruKjzvbpMCqkNXtI7kOanZG');
INSERT INTO public.usuarios VALUES (5, 'juju', 'juju@juju.com', '$2b$05$Fue1bvSBXMP1rCQzXi9YoOeBcgd7AIz2OeOdCzcn5G1VZq87l4a0G');


--
-- Name: atividade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.atividade_id_seq', 3, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 44, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 5, true);


--
-- Name: atividade atividade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.atividade
    ADD CONSTRAINT atividade_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: atividade atividade_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.atividade
    ADD CONSTRAINT "atividade_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.usuarios(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

