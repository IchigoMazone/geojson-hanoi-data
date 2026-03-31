--
-- PostgreSQL database dump
--

\restrict eZizcCA0mgSfCjU5F3XlOvguGqZxCy0GcaP2me4C8LKew7nQtNcMJSX2fafLZmN

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

-- Started on 2026-03-31 08:45:18

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
-- TOC entry 231 (class 1259 OID 16655)
-- Name: lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lists (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    name character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    is_pinned boolean DEFAULT false,
    note text,
    cover_image text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT lists_type_check CHECK (((type)::text = ANY ((ARRAY['favorites'::character varying, 'want_to_go'::character varying, 'travel_plan'::character varying, 'starred'::character varying, 'saved_places'::character varying, 'custom'::character varying])::text[])))
);


ALTER TABLE public.lists OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 16655)
-- Dependencies: 231
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lists (id, user_id, name, type, description, is_pinned, note, cover_image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4741 (class 2606 OID 16666)
-- Name: lists lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 1259 OID 16673)
-- Name: idx_lists_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lists_type ON public.lists USING btree (type);


--
-- TOC entry 4739 (class 1259 OID 16672)
-- Name: idx_lists_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lists_user ON public.lists USING btree (user_id);


--
-- TOC entry 4742 (class 2606 OID 16667)
-- Name: lists lists_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-03-31 08:45:18

--
-- PostgreSQL database dump complete
--

\unrestrict eZizcCA0mgSfCjU5F3XlOvguGqZxCy0GcaP2me4C8LKew7nQtNcMJSX2fafLZmN

