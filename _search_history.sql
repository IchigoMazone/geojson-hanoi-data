--
-- PostgreSQL database dump
--

\restrict KXPhq5dwpJFDYrgtWvTX2dUThcGrtRRyWObebi78Fjv5Jpi0ocJKMGT15ABcZz9

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

-- Started on 2026-03-31 08:48:36

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
-- TOC entry 230 (class 1259 OID 16634)
-- Name: search_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_history (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    query text NOT NULL,
    location_id uuid,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.search_history OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 16634)
-- Dependencies: 230
-- Data for Name: search_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_history (id, user_id, query, location_id, created_at) FROM stdin;
cee03b46-196f-4603-bc92-8f58d4fd33e3	4889286d-1732-48b4-8196-2c92dbb54306	Cột cờ Hà Nội	a715f38d-7560-48c3-9808-03edd21c6fe9	2026-03-07 00:56:25.499304
a2f852b2-e83b-46a9-9e92-0f45ef60c71b	fa5d6844-2551-444a-8449-c2e783112746	Vườn thú Hà Nội	57fc3023-9402-48eb-b128-e3eb44cf4273	2026-03-08 13:30:38.868357
0d615892-7483-4695-94ba-5018285aeb38	fa5d6844-2551-444a-8449-c2e783112746	Lăng Chủ tịch Hồ Chí Minh	8a113806-2f0c-43d3-afd1-5f17fe33fa68	2026-03-08 13:31:35.394818
eb79481d-4973-499b-bd7c-b379a369c0c2	4889286d-1732-48b4-8196-2c92dbb54306	Quảng trường Ba Đình	33a569bd-b6b7-4f77-b1fd-91820407d49c	2026-03-07 01:18:45.952474
ec543a1c-6d30-42dc-a063-f31f18c1e3fc	fa5d6844-2551-444a-8449-c2e783112746	Lăng Chủ tịch Hồ Chí Minh	8a113806-2f0c-43d3-afd1-5f17fe33fa68	2026-03-08 13:31:35.395083
383a20e7-9e97-4b8b-a1e0-1592c895bfae	72f986b6-3b9c-4588-ae77-1a3a84336814	Lăng Chủ tịch Hồ Chí Minh	8a113806-2f0c-43d3-afd1-5f17fe33fa68	2026-03-07 12:28:34.816869
87eae747-bf86-4f45-ba43-8e43973909ed	72f986b6-3b9c-4588-ae77-1a3a84336814	Làng cổ Đường Lâm	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	2026-03-07 12:32:20.078062
2b448f5d-6126-457e-ac57-bc1cb0b3623a	34e951f9-953d-4694-a56a-1a968587b6df	Đền thờ Hai Bà Trưng	e476ce92-8f33-446a-900b-4ca04e6ff141	2026-03-24 23:05:10.455008
678ca46f-db67-4cb3-8484-0224804cc9dc	34e951f9-953d-4694-a56a-1a968587b6df	Lăng Chủ tịch Hồ Chí Minh	8a113806-2f0c-43d3-afd1-5f17fe33fa68	2026-03-27 17:49:24.106833
0a73d06e-13f1-4bfc-b3eb-b1fd313912e3	f8626dd1-a227-47f0-a23c-3b422fa2e25e	Hồ Tây	093a94c5-f7b7-4a99-94d2-74ed61d4786e	2026-03-07 20:26:52.912297
a74ade77-5ea4-4c87-853a-13d23cf598a3	4889286d-1732-48b4-8196-2c92dbb54306	Hoàng Thành Thăng Long	1a8cdf42-c231-41d8-8802-e8f0619a3c69	2026-03-28 20:55:36.56662
c06d4f0f-3808-4301-bf24-9f7caab39dfb	4889286d-1732-48b4-8196-2c92dbb54306	Bảo tàng Mỹ thuật Việt Nam	ecabc48b-5c72-4388-a022-d57fd88856d4	2026-03-28 20:57:45.896497
8a7054ae-bde1-4bd0-9272-7cb5066daa1f	4889286d-1732-48b4-8196-2c92dbb54306	Hồ Hoàn Kiếm	e98e3637-02fd-4007-a86f-7a8cbedae14d	2026-03-28 20:59:06.854028
3793063f-175a-492e-9a2d-c14acc276a54	4889286d-1732-48b4-8196-2c92dbb54306	Chùa Thầy	227b3fd9-af71-4514-b798-8ac1dc941554	2026-03-28 23:20:46.601572
0fe3da2b-38ac-4078-8aff-e4364fafba49	fa5d6844-2551-444a-8449-c2e783112746	Làng cổ Đường Lâm	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	2026-03-08 13:00:37.539575
db3441ed-b14c-44a2-87fa-26f4573c22cd	4889286d-1732-48b4-8196-2c92dbb54306	Lăng Chủ tịch Hồ Chí Minh	8a113806-2f0c-43d3-afd1-5f17fe33fa68	2026-03-29 15:20:15.318928
f08d9c5c-43e2-48a3-af82-64fd8af23f8a	4889286d-1732-48b4-8196-2c92dbb54306	Hồ Tây	093a94c5-f7b7-4a99-94d2-74ed61d4786e	2026-03-30 00:00:56.914976
\.


--
-- TOC entry 4738 (class 2606 OID 16642)
-- Name: search_history search_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 1259 OID 16654)
-- Name: idx_search_history_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_search_history_created ON public.search_history USING btree (created_at DESC);


--
-- TOC entry 4736 (class 1259 OID 16653)
-- Name: idx_search_history_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_search_history_user ON public.search_history USING btree (user_id);


--
-- TOC entry 4739 (class 2606 OID 16648)
-- Name: search_history search_history_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- TOC entry 4740 (class 2606 OID 16643)
-- Name: search_history search_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-03-31 08:48:36

--
-- PostgreSQL database dump complete
--

\unrestrict KXPhq5dwpJFDYrgtWvTX2dUThcGrtRRyWObebi78Fjv5Jpi0ocJKMGT15ABcZz9

