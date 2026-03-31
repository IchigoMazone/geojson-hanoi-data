--
-- PostgreSQL database dump
--

\restrict vgK8tMz8qPKFK5LndBG86hoDihu6KtVqcfjvqOiZrZK5U0i6TdRn0l0Sjg7Xf54

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

-- Started on 2026-03-31 08:49:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 233 (class 1259 OID 16705)
-- Name: user_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_addresses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    label character varying(100),
    address text,
    lat double precision,
    lon double precision,
    is_default boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.user_addresses OWNER TO postgres;

--
-- TOC entry 4884 (class 0 OID 16705)
-- Dependencies: 233
-- Data for Name: user_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_addresses (id, user_id, label, address, lat, lon, is_default, created_at) FROM stdin;
\.


--
-- TOC entry 4737 (class 2606 OID 16714)
-- Name: user_addresses user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16715)
-- Name: user_addresses user_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-03-31 08:49:32

--
-- PostgreSQL database dump complete
--

\unrestrict vgK8tMz8qPKFK5LndBG86hoDihu6KtVqcfjvqOiZrZK5U0i6TdRn0l0Sjg7Xf54

