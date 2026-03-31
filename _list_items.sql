--
-- PostgreSQL database dump
--

\restrict RzdAUc8A8OTL8Z3yOH0M4j7QaOW731WrbwKmCXLDjEPE7XfojrWIsIWMfhUgNgM

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

-- Started on 2026-03-31 08:44:58

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
-- TOC entry 232 (class 1259 OID 16674)
-- Name: list_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    list_id uuid,
    location_id uuid,
    note text,
    is_visited boolean DEFAULT false,
    sort_order integer DEFAULT 0,
    added_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.list_items OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 16674)
-- Dependencies: 232
-- Data for Name: list_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_items (id, list_id, location_id, note, is_visited, sort_order, added_at) FROM stdin;
\.


--
-- TOC entry 4740 (class 2606 OID 16686)
-- Name: list_items list_items_list_id_location_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_items
    ADD CONSTRAINT list_items_list_id_location_id_key UNIQUE (list_id, location_id);


--
-- TOC entry 4742 (class 2606 OID 16684)
-- Name: list_items list_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_items
    ADD CONSTRAINT list_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 1259 OID 16697)
-- Name: idx_list_items_list; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_list_items_list ON public.list_items USING btree (list_id);


--
-- TOC entry 4738 (class 1259 OID 16698)
-- Name: idx_list_items_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_list_items_location ON public.list_items USING btree (location_id);


--
-- TOC entry 4743 (class 2606 OID 16687)
-- Name: list_items list_items_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_items
    ADD CONSTRAINT list_items_list_id_fkey FOREIGN KEY (list_id) REFERENCES public.lists(id) ON DELETE CASCADE;


--
-- TOC entry 4744 (class 2606 OID 16692)
-- Name: list_items list_items_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_items
    ADD CONSTRAINT list_items_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


-- Completed on 2026-03-31 08:44:58

--
-- PostgreSQL database dump complete
--

\unrestrict RzdAUc8A8OTL8Z3yOH0M4j7QaOW731WrbwKmCXLDjEPE7XfojrWIsIWMfhUgNgM

