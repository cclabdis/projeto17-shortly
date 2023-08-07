--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: link_views; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.link_views (
    id integer NOT NULL,
    link_id integer,
    viewed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: link_views_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.link_views_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: link_views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.link_views_id_seq OWNED BY public.link_views.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    url_id integer NOT NULL,
    user_id integer,
    short_url character varying(255) NOT NULL,
    original_url character varying(255) NOT NULL,
    visit_count integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    views integer DEFAULT 0
);


--
-- Name: links_url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_url_id_seq OWNED BY public.links.url_id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    token_id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tokens_token_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_token_id_seq OWNED BY public.tokens.token_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: link_views id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link_views ALTER COLUMN id SET DEFAULT nextval('public.link_views_id_seq'::regclass);


--
-- Name: links url_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN url_id SET DEFAULT nextval('public.links_url_id_seq'::regclass);


--
-- Name: tokens token_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN token_id SET DEFAULT nextval('public.tokens_token_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: link_views; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tokens VALUES (1, 13, 'b86c1ecf-9817-4a05-befe-a806ff464dcf', '2023-08-07 11:58:01.593753');
INSERT INTO public.tokens VALUES (2, 15, 'b4540d96-0d16-4a41-8c52-6f1f4eb18d85', '2023-08-07 13:08:22.05519');
INSERT INTO public.tokens VALUES (3, 15, '60213753-7230-4679-840c-e2bd963f4507', '2023-08-07 13:08:28.711214');
INSERT INTO public.tokens VALUES (4, 16, '31ff851d-5ed4-4bdd-9791-ef3bea508640', '2023-08-07 13:09:16.393059');
INSERT INTO public.tokens VALUES (5, 16, '0ca30eb4-619a-41be-af83-8427260be318', '2023-08-07 13:30:27.186127');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'claudia', 'cclabdis@gmail.com', '$2b$10$KdMAlnKTwsJJIj1LN5zP0.8n5Bx84Y5OiQPZve1Wt9hMXd4EPq6TW', '2023-08-07 11:22:38.5038');
INSERT INTO public.users VALUES (2, 'claudia', 'cesrewis@gmail.com', '$2b$10$dptQppmgNFtft3bF68HPXOFHUSRK3Nm40TMI.cGlUiEHEN6Uagioi', '2023-08-07 11:22:47.113138');
INSERT INTO public.users VALUES (4, 'cdasdalaudia', 'ceaaaaaasrewis@gmail.com', '$2b$10$DyCs8vP.7H3hPTTZbLZQGuAyVG/I4X3Rt2nA/rfxhZ56vukJWxQMq', '2023-08-07 11:23:03.241673');
INSERT INTO public.users VALUES (8, 'cdasdalaudia', 'ceaaaasrewis@gmail.com', '$2b$10$q2cBjkYk2pkKOxnSADdS8ODul7WPoyveGQXZCmx4IzE/oa6yZZo2i', '2023-08-07 11:43:06.226215');
INSERT INTO public.users VALUES (12, 'claudfsfsfsia', 'azambujaclaudia@gmail.com', '$2b$10$BjwOgrp4xQV6p15FKdSX2ePp/4y04NKQ7rXn27Yojl1wm.UAzBKIu', '2023-08-07 11:55:07.249743');
INSERT INTO public.users VALUES (13, 'claudia', 'gelatina@gmail.com', '$2b$10$EeGd3IE6Q.0qxRn35LWQ6.HS8tjTeBiVK/PTaBJVwkJ0nugI8TK3K', '2023-08-07 11:56:20.881435');
INSERT INTO public.users VALUES (14, 'claudia', 'creme@gmail.com', '$2b$10$gzrRXtjH5fnD.op.nGeO9epkkAsgivfaBHtMZvs4mQd5.5yirDU/i', '2023-08-07 12:21:19.589385');
INSERT INTO public.users VALUES (15, 'fermamdp', 'nando@gmail.com', '$2b$10$Y7E2euMP8pVdnwSdyERHBe2rrZDwA3hnzSY5iT4ZTIZa9ADFezkmW', '2023-08-07 12:29:14.847982');
INSERT INTO public.users VALUES (16, 'fermamdp', 'batata@gmail.com', '$2b$10$gGGuHwXrPX/3TvvcaF/XDuM8oFZSY8p4i8oQmEuzSWLhoc5agmZIa', '2023-08-07 13:09:08.871487');


--
-- Name: link_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.link_views_id_seq', 1, false);


--
-- Name: links_url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_url_id_seq', 1, false);


--
-- Name: tokens_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_token_id_seq', 5, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 16, true);


--
-- Name: link_views link_views_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link_views
    ADD CONSTRAINT link_views_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (url_id);


--
-- Name: links links_short_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_short_url_key UNIQUE (short_url);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (token_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: link_views link_views_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link_views
    ADD CONSTRAINT link_views_link_id_fkey FOREIGN KEY (link_id) REFERENCES public.links(url_id);


--
-- Name: links links_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: tokens tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

