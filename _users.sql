--
-- PostgreSQL database dump
--

\restrict HBcarQapm2H18ZXzcwzwk2Dliyft0wCY5IvQrWri8HvvNbamGogaspW9j1vnvGS

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

-- Started on 2026-03-31 08:49:46

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
-- TOC entry 221 (class 1259 OID 16413)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(12) NOT NULL,
    username character varying(20) NOT NULL,
    password_hash text NOT NULL,
    fullname character varying(100),
    avatar_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 16413)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, code, username, password_hash, fullname, avatar_url, created_at, updated_at) FROM stdin;
16504ced-bca7-4694-b664-5cbaf615ba35	A1234QsXz99a	user_dev01	$2b$10$hashpassword	Nguyen Thanh Nam	\N	2026-02-12 22:48:28.767544	2026-02-12 22:48:28.767544
ee67b214-7b83-4c68-b0a4-c0e172f3c2da	A1234QsXz99b	user_dev02	$2b$10$hashpassword	Nguyen Thanh Hai	\N	2026-02-12 22:51:02.542585	2026-02-12 22:51:02.542585
50a191a2-df8e-4fef-975e-99cc246de76d	A1234QsXzAAz	usdasd_dev04	$2b$10$BiXtET2qby1NSRFHl5KhyOsdqvMCoYnJR85z33.ed..s6yj0yD8y2	\N	\N	2026-02-13 00:13:49.476119	2026-02-13 00:13:49.476119
341d38ea-cfed-4df0-95cc-8031424098bc	A1234QsXzAAq	usdasd_dev05	$2b$10$oIpqFvvm0AKAiw0V30bUEOuTi13.lEtr5iYQH8/oFIX0JoCPI5VCS	usdasd_dev05	\N	2026-02-13 00:15:29.071514	2026-02-13 00:15:29.071514
b3ebad2d-50d2-4ee1-8270-45b898ac2be7	M1234QsXzAAq	usdasd_dev06	$2b$10$.PBzcqJ7KNHN.iZk7YINme/1SihL9EO9pcD/tsppucMlRdTkE6MBa	usdasd_dev06	\N	2026-02-13 00:16:04.609252	2026-02-13 00:16:04.609252
50d75f11-0369-4024-acc9-925f6337fb3a	A1B2C3D4E5F6	ichigomazone	$2b$10$H.JnuHjOav9Q8imQNxcbbu9NfU9zVQ./g3AIjVxKAp3qeMm4B7Cl6	ichigomazone	\N	2026-02-13 12:09:43.930472	2026-02-13 12:09:43.930472
13f08f93-871f-4f37-8609-ca2a1d518ebc	X9Y8Z7W6V5U4	ichigomazone3	$2b$10$5bm5BmSvqiKJKM07IRvkXOhC4tcKQq4AIN9iCXwLhTlk4Iz.DkYwG	ichigomazone3	\N	2026-02-13 12:48:04.355211	2026-02-13 12:48:04.355211
00ef14e2-37fe-40e9-a2c6-07912ecb9fca	A12BDASDAS12	ichigomazone1	$2b$10$MFwwycQWPiY1WtuIjj0ywe5pqeWf6Fwi5Mes8qVU4JobQmm3CXRki	ichigomazone1	\N	2026-02-13 12:38:51.578927	2026-02-13 12:38:51.578927
4889286d-1732-48b4-8196-2c92dbb54306	M9N8B7V6C5X4	husky123	$2b$10$1LxpQwA5V4maJdhgQApgReT2n8czTRJMC7oNxz5IyHSyXEsNY.vWG	LyngZYiNhzt	avatars/4889286d-1732-48b4-8196-2c92dbb54306-1772812715326-49c08a57-9979-41cd-8af5-7def33b4ec28.webp	2026-02-24 20:34:00.544787	2026-02-24 20:34:00.544787
72f986b6-3b9c-4588-ae77-1a3a84336814	Z1X2C3V4B5N6	khongconggi	$2b$10$O0nJMELrsWfEyYr3id768.4QSgMnd7QHfpWz1QdJlz/N1VSYHl1kG	khongconggi	\N	2026-03-07 12:16:27.989132	2026-03-07 12:16:27.989132
f8626dd1-a227-47f0-a23c-3b422fa2e25e	S9D8F7G6H5J4	duyanh123	$2b$10$4QfvejABaIkbr5oPTo9Jm.yFUnjssMVvgCAKFnY9upd1eMpiFhuy6	Con Bò Này	\N	2026-03-07 16:03:29.850163	2026-03-07 16:03:29.850163
fa5d6844-2551-444a-8449-c2e783112746	Q1W2E3R4T5Y6	huynl123	$2b$10$RfBvUjdiDHYj5vpJsR.t2.ok5yOLlnUgC8VM8JOi9Z0obE3gN3Xvu	Huy Nao Lolz	avatars/fa5d6844-2551-444a-8449-c2e783112746-1772118449931-ef1d7ef3-8a0a-4f88-9464-e1bfaa1380a5.webp	2026-02-24 16:53:05.383693	2026-02-24 16:53:05.383693
34e951f9-953d-4694-a56a-1a968587b6df	K9L8M7N6B5V4	tuanhuy2004	$2b$10$LOVc9aLQVttzcxU0m9Ev3uSFCJcqmY4P4eJmA2IXou8nYcciQPr0C	tuanhuy2004	\N	2026-03-24 22:45:40.158724	2026-03-24 22:45:40.158724
\.


--
-- TOC entry 4739 (class 2606 OID 16424)
-- Name: users users_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_code_key UNIQUE (code);


--
-- TOC entry 4741 (class 2606 OID 16422)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16426)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4736 (class 1259 OID 16503)
-- Name: idx_users_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_code ON public.users USING btree (code);


--
-- TOC entry 4737 (class 1259 OID 16504)
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_username ON public.users USING btree (username);


-- Completed on 2026-03-31 08:49:46

--
-- PostgreSQL database dump complete
--

\unrestrict HBcarQapm2H18ZXzcwzwk2Dliyft0wCY5IvQrWri8HvvNbamGogaspW9j1vnvGS

