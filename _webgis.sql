--
-- PostgreSQL database dump
--

\restrict ZMo0eMvFPA9ZxZgXjE56fdWkXVsk01XrJTJpAMQeMS3rAc14Rq2DKlNeAXhdPae

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

-- Started on 2026-03-31 09:01:14

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

--
-- TOC entry 3 (class 3079 OID 16466)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 4 (class 3079 OID 16793)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- TOC entry 2 (class 3079 OID 16391)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16562)
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid,
    article_id character varying(100),
    source character varying(100),
    lang character varying(10),
    title text,
    url text,
    api text
);


ALTER TABLE public.articles OWNER TO postgres;

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
-- TOC entry 224 (class 1259 OID 16531)
-- Name: location_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_images (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid,
    url text NOT NULL,
    sort_order integer DEFAULT 0
);


ALTER TABLE public.location_images OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16505)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    address text,
    description text,
    lat double precision,
    lon double precision,
    category character varying(100),
    image text,
    rating_avg numeric(3,1) DEFAULT 0,
    rating_count integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16518)
-- Name: opening_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opening_hours (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid,
    day_of_week character varying(10) NOT NULL,
    open_time character varying(20),
    close_time character varying(20),
    CONSTRAINT opening_hours_day_of_week_check CHECK (((day_of_week)::text = ANY ((ARRAY['monday'::character varying, 'tuesday'::character varying, 'wednesday'::character varying, 'thursday'::character varying, 'friday'::character varying, 'saturday'::character varying, 'sunday'::character varying])::text[])))
);


ALTER TABLE public.opening_hours OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16546)
-- Name: rating_stars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating_stars (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid,
    star integer NOT NULL,
    count integer DEFAULT 0,
    CONSTRAINT rating_stars_star_check CHECK (((star >= 1) AND (star <= 5)))
);


ALTER TABLE public.rating_stars OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16402)
-- Name: referral_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referral_codes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    code character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.referral_codes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16598)
-- Name: review_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_images (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    review_id uuid,
    url text NOT NULL,
    sort_order integer DEFAULT 0
);


ALTER TABLE public.review_images OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16613)
-- Name: review_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_likes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    review_id uuid,
    user_id uuid,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.review_likes OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16576)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    location_id uuid,
    user_id uuid,
    rating integer NOT NULL,
    content text,
    created_at timestamp without time zone DEFAULT now(),
    status character varying(20) DEFAULT 'published'::character varying,
    CONSTRAINT reviews_rating_check CHECK (((rating >= 0) AND (rating <= 5))),
    CONSTRAINT reviews_status_check CHECK (((status)::text = ANY ((ARRAY['draft'::character varying, 'published'::character varying])::text[])))
);


ALTER TABLE public.reviews OWNER TO postgres;

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
-- TOC entry 5014 (class 0 OID 16562)
-- Dependencies: 226
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, location_id, article_id, source, lang, title, url, api) FROM stdin;
dae25cd3-9e1f-4c4f-935a-53694ffdcaf6	e98e3637-02fd-4007-a86f-7a8cbedae14d	wiki_vi	Wikipedia	vi	Hồ Hoàn Kiếm – Wikipedia (VI)	https://vi.wikipedia.org/wiki/H%E1%BB%93_Ho%C3%A0n_Ki%E1%BA%BFm	https://vi.wikipedia.org/api/rest_v1/page/summary/H%E1%BB%93_Ho%C3%A0n_Ki%E1%BA%BFm
2e8879b4-a838-4295-b049-6aa39488a235	e98e3637-02fd-4007-a86f-7a8cbedae14d	vinpearl	Vinpearl	vi	Hồ Hoàn Kiếm – Vinpearl (VI)	https://vinpearl.com/vi/ho-hoan-kiem-ha-noi	\N
d811cee2-e57e-4047-9824-28c238c0822a	e98e3637-02fd-4007-a86f-7a8cbedae14d	xesaoviet	Xe Sao Việt	vi	Hồ Hoàn Kiếm – Xe Sao Việt (VI)	https://xesaoviet.com.vn/ho-guom-bieu-tuong-van-hoa-va-lich-su-cua-ha-noi/	\N
2bca9600-802a-4022-b1af-deeee5cd2fba	8a113806-2f0c-43d3-afd1-5f17fe33fa68	wiki_vi	Wikipedia	vi	Lăng Chủ tịch Hồ Chí Minh – Wikipedia (VI)	https://vi.wikipedia.org/wiki/L%C4%83ng_Ch%E1%BB%A7_t%E1%BB%8Bch_H%E1%BB%93_Ch%C3%AD_Minh	https://vi.wikipedia.org/api/rest_v1/page/summary/L%C4%83ng_Ch%E1%BB%A7_t%E1%BB%8Bch_H%E1%BB%93_Ch%C3%AD_Minh
c360c8cf-b300-4eb9-aa4b-8945931b9786	8a113806-2f0c-43d3-afd1-5f17fe33fa68	vinpearl	Vinpearl	vi	Lăng Chủ tịch Hồ Chí Minh – Vinpearl (VI)	https://ditichhochiminhphuchutich.gov.vn/	\N
a760326a-8a4f-464b-9964-9c00d9502bdb	8a113806-2f0c-43d3-afd1-5f17fe33fa68	xesaoviet	Xe Sao Việt	vi	Lăng Chủ tịch Hồ Chí Minh – Xe Sao Việt (VI)	https://vinpearl.com/vi/lang-bac-o-dau	\N
9d5b4816-d2ce-4a89-8b6a-44f1255317b6	b814d2d7-9afd-4716-8eba-83cadfb40800	wiki_vi	Wikipedia	vi	Chùa Một Cột – Wikipedia (VI)	https://vinpearl.com/vi/chua-mot-cot-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/chua-mot-cot-ha-noi
1acda69a-ec30-4ad3-939a-578d57446773	b814d2d7-9afd-4716-8eba-83cadfb40800	vinpearl	Vinpearl	vi	Chùa Một Cột – Vinpearl (VI)	https://vi.wikipedia.org/wiki/Ch%C3%B9a_M%E1%BB%99t_C%E1%BB%99t	\N
ae10de30-f18b-4277-add3-4f3d500a88fe	b814d2d7-9afd-4716-8eba-83cadfb40800	xesaoviet	Xe Sao Việt	vi	Chùa Một Cột – Xe Sao Việt (VI)	https://www.youtube.com/watch?v=tYXe1AnQQxk	\N
828e114a-f018-49b6-a6e0-75791712e757	1a8cdf42-c231-41d8-8802-e8f0619a3c69	wiki_vi	Wikipedia	vi	Hoàng Thành Thăng Long – Wikipedia (VI)	https://hoangthanhthanglong.com/	https://vi.wikipedia.org/api/rest_v1/page/summary/https://hoangthanhthanglong.com/
820d7592-fe35-492c-bcbf-7f4934b16038	1a8cdf42-c231-41d8-8802-e8f0619a3c69	vinpearl	Vinpearl	vi	Hoàng Thành Thăng Long – Vinpearl (VI)	https://vinpearl.com/vi/hoang-thanh-thang-long-ha-noi	\N
72050fa3-60fa-437d-8656-2a9d353e4046	1a8cdf42-c231-41d8-8802-e8f0619a3c69	xesaoviet	Xe Sao Việt	vi	Hoàng Thành Thăng Long – Xe Sao Việt (VI)	https://vi.wikipedia.org/wiki/Ho%C3%A0ng_th%C3%A0nh_Th%C4%83ng_Long	\N
8300f12f-b53f-48a0-bdaa-c9cac0d02fcb	e9a414ee-097e-4935-a7f2-ff9af30e5911	wiki_vi	Wikipedia	vi	Đền Ngọc Sơn – Wikipedia (VI)	https://vinpearl.com/vi/den-ngoc-son-di-tich-tin-nguong-van-hoa-noi-tieng-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/den-ngoc-son-di-tich-tin-nguong-van-hoa-noi-tieng-ha-noi
d99bc829-3b20-4475-bfc3-720507fdefde	e9a414ee-097e-4935-a7f2-ff9af30e5911	vinpearl	Vinpearl	vi	Đền Ngọc Sơn – Vinpearl (VI)	https://vi.wikipedia.org/wiki/%C4%90%E1%BB%81n_Ng%E1%BB%8Dc_S%C6%A1n	\N
c140beb1-cdfa-4828-a267-8c214c19681c	e9a414ee-097e-4935-a7f2-ff9af30e5911	xesaoviet	Xe Sao Việt	vi	Đền Ngọc Sơn – Xe Sao Việt (VI)	https://www.klook.com/vi/blog/den-ngoc-son/	\N
81c342ec-c2f7-4aed-bfba-3c2bc3825e35	a715f38d-7560-48c3-9808-03edd21c6fe9	wiki_vi	Wikipedia	vi	Cột cờ Hà Nội – Wikipedia (VI)	https://vi.wikipedia.org/wiki/C%E1%BB%99t_c%E1%BB%9D_H%C3%A0_N%E1%BB%99i	https://vi.wikipedia.org/api/rest_v1/page/summary/C%E1%BB%99t_c%E1%BB%9D_H%C3%A0_N%E1%BB%99i
4595e5ad-6edc-47db-8708-b66ed39a4ab9	a715f38d-7560-48c3-9808-03edd21c6fe9	vinpearl	Vinpearl	vi	Cột cờ Hà Nội – Vinpearl (VI)	https://vinpearl.com/vi/cot-co-ha-noi	\N
15c9c0ce-8bfe-41b9-917d-765766cf4e57	a715f38d-7560-48c3-9808-03edd21c6fe9	xesaoviet	Xe Sao Việt	vi	Cột cờ Hà Nội – Xe Sao Việt (VI)	https://hoangthanhthanglong.com/di-tich/cot-co-ha-noi/	\N
43af297d-a4f0-4c04-b2e9-0ec13140de98	b5343ac8-2288-4e10-aca9-7fa2a9377faa	wiki_vi	Wikipedia	vi	Nhà tù Hỏa Lò – Wikipedia (VI)	https://hoalo.vn/	https://vi.wikipedia.org/api/rest_v1/page/summary/https://hoalo.vn/
cb0df7cd-b531-4aba-af52-ee543b6de1f1	b5343ac8-2288-4e10-aca9-7fa2a9377faa	vinpearl	Vinpearl	vi	Nhà tù Hỏa Lò – Vinpearl (VI)	https://www.facebook.com/hoaloprisonrelic/?locale=vi_VN	\N
759d05a7-4d72-4691-a9d1-d53850aeadc2	b5343ac8-2288-4e10-aca9-7fa2a9377faa	xesaoviet	Xe Sao Việt	vi	Nhà tù Hỏa Lò – Xe Sao Việt (VI)	https://vi.wikipedia.org/wiki/Nh%C3%A0_t%C3%B9_H%E1%BB%8Fa_L%C3%B2	\N
5ea5fc37-3d26-427d-bbbe-c7e11e4a202c	8dc280e5-51bf-4425-9ea4-72658ba86e4e	wiki_vi	Wikipedia	vi	Đền Quán Thánh – Wikipedia (VI)	https://vi.wikipedia.org/wiki/%C4%90%E1%BB%81n_Qu%C3%A1n_Th%C3%A1nh	https://vi.wikipedia.org/api/rest_v1/page/summary/%C4%90%E1%BB%81n_Qu%C3%A1n_Th%C3%A1nh
95202ef4-c9a3-42a9-94b1-bd77076ad3b5	8dc280e5-51bf-4425-9ea4-72658ba86e4e	vinpearl	Vinpearl	vi	Đền Quán Thánh – Vinpearl (VI)	https://www.klook.com/vi/blog/den-quan-thanh/	\N
2acc5986-3f14-483a-a0eb-e1fbbcbf34e7	8dc280e5-51bf-4425-9ea4-72658ba86e4e	xesaoviet	Xe Sao Việt	vi	Đền Quán Thánh – Xe Sao Việt (VI)	https://vinpearl.com/vi/den-quan-thanh-ha-noi	\N
e4bbc7a3-8223-427f-ae8e-a6301a4d8468	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	wiki_vi	Wikipedia	vi	Phủ Tây Hồ – Wikipedia (VI)	https://vi.wikipedia.org/wiki/Ph%E1%BB%A7_T%C3%A2y_H%E1%BB%93	https://vi.wikipedia.org/api/rest_v1/page/summary/Ph%E1%BB%A7_T%C3%A2y_H%E1%BB%93
0fd336ef-929d-4e53-a6c2-9ab547534517	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	vinpearl	Vinpearl	vi	Phủ Tây Hồ – Vinpearl (VI)	https://vinpearl.com/vi/phu-tay-ho-ha-noi	\N
b02794ae-ec7f-4a29-8e5a-616157f08000	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	xesaoviet	Xe Sao Việt	vi	Phủ Tây Hồ – Xe Sao Việt (VI)	https://www.traveloka.com/vi-vn/explore/destination/phu-tay-ho-2/286293	\N
402d684e-84e8-4562-87b5-4350ec5a0912	6ca1a762-6d41-4072-a0c3-827c77601871	wiki_vi	Wikipedia	vi	Chùa Trấn Quốc – Wikipedia (VI)	https://www.traveloka.com/vi-vn/explore/destination/chua-tran-quoc-ha-noi-acc/158955	https://vi.wikipedia.org/api/rest_v1/page/summary/https://www.traveloka.com/vi-vn/explore/destination/chua-tran-quoc-ha-noi-acc/158955
cba6b426-af56-43f9-bbc4-8166e5f7d39b	6ca1a762-6d41-4072-a0c3-827c77601871	vinpearl	Vinpearl	vi	Chùa Trấn Quốc – Vinpearl (VI)	https://vinpearl.com/vi/chua-tran-quoc-ha-noi	\N
de967fc7-cb73-4795-8d05-630d513b0d46	6ca1a762-6d41-4072-a0c3-827c77601871	xesaoviet	Xe Sao Việt	vi	Chùa Trấn Quốc – Xe Sao Việt (VI)	https://vi.wikipedia.org/wiki/Ch%C3%B9a_Tr%E1%BA%A5n_Qu%E1%BB%91c	\N
f1cd5e0a-b195-420b-9a98-2b7d87c7ac3a	e476ce92-8f33-446a-900b-4ca04e6ff141	wiki_vi	Wikipedia	vi	Đền thờ Hai Bà Trưng – Wikipedia (VI)	https://vinpearl.com/vi/kham-pha-den-hai-ba-trung-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/kham-pha-den-hai-ba-trung-ha-noi
b79974be-bebe-4240-aa4e-70a98a812194	e476ce92-8f33-446a-900b-4ca04e6ff141	vinpearl	Vinpearl	vi	Đền thờ Hai Bà Trưng – Vinpearl (VI)	https://vi.wikipedia.org/wiki/%C4%90%E1%BB%81n_Hai_B%C3%A0_Tr%C6%B0ng_(H%E1%BA%A1_L%C3%B4i)	\N
bf7c82a9-7480-4600-b1ec-9b87a104ac80	e476ce92-8f33-446a-900b-4ca04e6ff141	xesaoviet	Xe Sao Việt	vi	Đền thờ Hai Bà Trưng – Xe Sao Việt (VI)	https://dsvh.gov.vn/di-tich-lich-su-den-hai-ba-trung-2970	\N
f2e332ef-53d5-4ba7-b383-11623d978680	b6b3878a-61ae-464e-8a00-880c9b7df23a	wiki_vi	Wikipedia	vi	Chùa Hương – Wikipedia (VI)	https://vinpearl.com/vi/chua-huong-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/chua-huong-ha-noi
84b4c07a-d62f-4796-bdb4-125a9a1885b3	b6b3878a-61ae-464e-8a00-880c9b7df23a	vinpearl	Vinpearl	vi	Chùa Hương – Vinpearl (VI)	https://booking.muongthanh.com/tin-tuc/kham-pha-chi-tiet-chua-huong-ha-noi	\N
10d4db74-14be-4861-a096-51fab647cef1	b6b3878a-61ae-464e-8a00-880c9b7df23a	xesaoviet	Xe Sao Việt	vi	Chùa Hương – Xe Sao Việt (VI)	https://vi.wikipedia.org/wiki/Ch%C3%B9a_H%C6%B0%C6%A1ng	\N
f1de5f1e-28ac-4181-a49e-d128e5feb319	227b3fd9-af71-4514-b798-8ac1dc941554	wiki_vi	Wikipedia	vi	Chùa Thầy – Wikipedia (VI)	https://vinpearl.com/vi/chua-thay-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/chua-thay-ha-noi
5d2824f1-53cc-4446-b80f-bcea35cf87e7	227b3fd9-af71-4514-b798-8ac1dc941554	vinpearl	Vinpearl	vi	Chùa Thầy – Vinpearl (VI)	https://www.facebook.com/vntravelmagazine/posts/-ch%C3%B9a-th%E1%BA%A7y-n%C3%A9t-%C4%91%E1%BA%B9p-t%C3%A2m-linh-gi%E1%BB%AFa-l%C3%B2ng-thi%C3%AAn-nhi%C3%AAn-c%C3%A1ch-trung-t%C3%A2m-h%C3%A0-n%E1%BB%99i-ch%E1%BB%89-kho%E1%BA%A3/627807603529487/	\N
c9fc4cf7-941a-453e-a3e0-a8603b74fa28	227b3fd9-af71-4514-b798-8ac1dc941554	xesaoviet	Xe Sao Việt	vi	Chùa Thầy – Xe Sao Việt (VI)	https://vi.wikipedia.org/wiki/Ch%C3%B9a_Th%E1%BA%A7y	\N
5b9297d9-8124-44a4-b9f5-13c0edcf6f79	093a94c5-f7b7-4a99-94d2-74ed61d4786e	wiki_vi	Wikipedia	vi	Hồ Tây – Wikipedia (VI)	https://vinpearl.com/vi/ho-tay-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/ho-tay-ha-noi
33f69950-2780-476c-89ea-77f44d00c5ac	093a94c5-f7b7-4a99-94d2-74ed61d4786e	vinpearl	Vinpearl	vi	Hồ Tây – Vinpearl (VI)	https://vi.wikipedia.org/wiki/H%E1%BB%93_T%C3%A2y	\N
1091f23e-479d-4f04-8bde-6707cb5ce023	093a94c5-f7b7-4a99-94d2-74ed61d4786e	xesaoviet	Xe Sao Việt	vi	Hồ Tây – Xe Sao Việt (VI)	https://www.klook.com/vi/blog/ho-tay-ha-noi/	\N
e49758c3-b9cd-4809-84ae-bae463eb8fe8	57fc3023-9402-48eb-b128-e3eb44cf4273	wiki_vi	Wikipedia	vi	Vườn thú Hà Nội – Wikipedia (VI)	https://vuonthuhanoi.com/	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vuonthuhanoi.com/
055545c4-3e6d-4069-8344-eaabace35dd8	57fc3023-9402-48eb-b128-e3eb44cf4273	vinpearl	Vinpearl	vi	Vườn thú Hà Nội – Vinpearl (VI)	https://vietnamtourism.vn/index.php/tourism/items/515	\N
94f77a24-dec9-410e-8ae0-a689fb427e91	57fc3023-9402-48eb-b128-e3eb44cf4273	xesaoviet	Xe Sao Việt	vi	Vườn thú Hà Nội – Xe Sao Việt (VI)	https://www.facebook.com/vuonthuhanoi.official/	\N
f4ba83cb-acce-4021-9912-d320f2f42f8c	5c6160c4-0d3c-4515-b48b-f928294b1800	wiki_vi	Wikipedia	vi	Bãi đá sông Hồng – Wikipedia (VI)	https://vinpearl.com/vi/bai-da-song-hong	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/bai-da-song-hong
41b47f74-e10e-4781-82c5-b815d2ffa903	5c6160c4-0d3c-4515-b48b-f928294b1800	vinpearl	Vinpearl	vi	Bãi đá sông Hồng – Vinpearl (VI)	https://vinwonders.com/vi/wonderpedia/news/bai-da-song-hong/	\N
772b135f-fb7d-49f9-83bf-f873baa2dc87	5c6160c4-0d3c-4515-b48b-f928294b1800	xesaoviet	Xe Sao Việt	vi	Bãi đá sông Hồng – Xe Sao Việt (VI)	https://www.facebook.com/vuonhoabaidasonghong.264auco/	\N
84eb5555-1325-4a75-9166-294d54b4ef54	429f1da2-c572-400d-8e4e-9ecbd096cc08	wiki_vi	Wikipedia	vi	Vườn hoa Nhật Tân – Wikipedia (VI)	https://vinpearl.com/vi/lang-hoa-nhat-tan	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/lang-hoa-nhat-tan
6a2997cf-7093-4f8f-b10a-7932d32a529e	429f1da2-c572-400d-8e4e-9ecbd096cc08	vinpearl	Vinpearl	vi	Vườn hoa Nhật Tân – Vinpearl (VI)	https://vinwonders.com/vi/wonderpedia/news/lang-hoa-nhat-tan-ha-noi/	\N
1e56479b-2857-445e-876d-34e20b378ffc	429f1da2-c572-400d-8e4e-9ecbd096cc08	xesaoviet	Xe Sao Việt	vi	Vườn hoa Nhật Tân – Xe Sao Việt (VI)	https://www.facebook.com/maivillagroup/posts/-v%C6%B0%E1%BB%9Dn-hoa-nh%E1%BA%ADt-t%C3%A2n-thi%C3%AAn-%C4%91%C6%B0%E1%BB%9Dng-s%E1%BB%91ng-%E1%BA%A3o-m%C3%A0-ai-c%C5%A9ng-ph%E1%BA%A3i-gh%C3%A9-khi-%C4%91%E1%BA%BFn-h%C3%A0-n%E1%BB%99ikh%C3%B4ng-c/1417361477064720/	\N
d2392944-75f3-4a6e-9f3d-f11caf2f4a96	bb085c14-2cf1-45fb-a564-42eed70da09b	wiki_vi	Wikipedia	vi	Hồ Hàm Lợn – Wikipedia (VI)	https://awarded-books-valued-sink.trycloudflare.com/	https://vi.wikipedia.org/api/rest_v1/page/summary/https://awarded-books-valued-sink.trycloudflare.com/
16573d81-6948-4bc2-a1eb-6fcc15ac5066	bb085c14-2cf1-45fb-a564-42eed70da09b	vinpearl	Vinpearl	vi	Hồ Hàm Lợn – Vinpearl (VI)	https://dulichhamlon.vn/gioi-thieu-chi-tiet-ve-ho-ham-lon-soc-son-ha-noi.html	\N
17831a72-d196-4289-b1c0-d35ce2d42630	bb085c14-2cf1-45fb-a564-42eed70da09b	xesaoviet	Xe Sao Việt	vi	Hồ Hàm Lợn – Xe Sao Việt (VI)	https://vietnamtourism.gov.vn/post/38043	\N
47f1f39a-b913-42f8-ae6f-b71ccb8c6fd9	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	wiki_vi	Wikipedia	vi	Đồi Bù – Wikipedia (VI)	https://vinwonders.com/vi/wonderpedia/news/du-luon-doi-bu-chuong-my-ha-noi/	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinwonders.com/vi/wonderpedia/news/du-luon-doi-bu-chuong-my-ha-noi/
5f9bb90c-8791-4116-96cb-731d45debe0c	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	vinpearl	Vinpearl	vi	Đồi Bù – Vinpearl (VI)	https://www.klook.com/vi/activity/65949-paragliding-experience-in-ha-noi-city/	\N
b167a055-6020-466a-aa49-931b42d5c4cc	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	xesaoviet	Xe Sao Việt	vi	Đồi Bù – Xe Sao Việt (VI)	https://www.facebook.com/HuyenDoan230898/	\N
56b5c81e-3e92-402d-95c0-9eadb3892b48	c9b58d45-a84c-4024-8a8c-6994903079db	wiki_vi	Wikipedia	vi	Vườn quốc gia Ba Vì – Wikipedia (VI)	https://vinpearl.com/vi/vuon-quoc-gia-ba-vi-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/vuon-quoc-gia-ba-vi-ha-noi
f31b09c4-44e4-437b-887b-1ebca91b085a	c9b58d45-a84c-4024-8a8c-6994903079db	vinpearl	Vinpearl	vi	Vườn quốc gia Ba Vì – Vinpearl (VI)	https://vi.wikipedia.org/wiki/V%C6%B0%E1%BB%9Dn_qu%E1%BB%91c_gia_Ba_V%C3%AC	\N
c9c54a82-76f4-4ed2-8651-b21e16917923	c9b58d45-a84c-4024-8a8c-6994903079db	xesaoviet	Xe Sao Việt	vi	Vườn quốc gia Ba Vì – Xe Sao Việt (VI)	https://vuonquocgiabavi.com.vn/	\N
af2a1276-4d17-486b-8e8d-3347baab9b82	837efbb5-f618-4118-9868-6d7ff86588ab	wiki_vi	Wikipedia	vi	Bảo tàng Dân tộc học Việt Nam – Wikipedia (VI)	https://vinpearl.com/vi/bao-tang-dan-toc-hoc-viet-nam	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/bao-tang-dan-toc-hoc-viet-nam
390e64a7-b4a8-4534-bb10-5939dc16df54	837efbb5-f618-4118-9868-6d7ff86588ab	vinpearl	Vinpearl	vi	Bảo tàng Dân tộc học Việt Nam – Vinpearl (VI)	https://www.vme.org.vn/	\N
7f666245-43ad-47ab-9f64-e8a26f6928aa	837efbb5-f618-4118-9868-6d7ff86588ab	xesaoviet	Xe Sao Việt	vi	Bảo tàng Dân tộc học Việt Nam – Xe Sao Việt (VI)	https://www.facebook.com/btdth/?locale=vi_VN	\N
07517533-476e-47bc-a158-e6cc29b87a77	1184dc79-a111-4a8a-8b31-dbfa6f379de1	wiki_vi	Wikipedia	vi	Bảo tàng Lịch sử Quốc gia – Wikipedia (VI)	https://baotanglichsu.vn/vi/Video/57/gioi-thieu-ve-bao-tang-lich-su-quoc-gia.html	https://vi.wikipedia.org/api/rest_v1/page/summary/https://baotanglichsu.vn/vi/Video/57/gioi-thieu-ve-bao-tang-lich-su-quoc-gia.html
56a27b08-6cd1-45ca-a191-879ef9f868d3	1184dc79-a111-4a8a-8b31-dbfa6f379de1	vinpearl	Vinpearl	vi	Bảo tàng Lịch sử Quốc gia – Vinpearl (VI)	https://www.facebook.com/BTLSQG.VNMH/?locale=vi_VN	\N
d9dbe227-cb4b-42e7-9903-19804a93de30	1184dc79-a111-4a8a-8b31-dbfa6f379de1	xesaoviet	Xe Sao Việt	vi	Bảo tàng Lịch sử Quốc gia – Xe Sao Việt (VI)	https://baotanglichsu.vn/vi	\N
8f0a8ee9-9951-45af-884e-cd2f9f9bbf06	ecabc48b-5c72-4388-a022-d57fd88856d4	wiki_vi	Wikipedia	vi	Bảo tàng Mỹ thuật Việt Nam – Wikipedia (VI)	https://vnfam.vn/vi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vnfam.vn/vi
8719aaca-596b-416d-a8ef-b3a6b5ffbaf7	ecabc48b-5c72-4388-a022-d57fd88856d4	vinpearl	Vinpearl	vi	Bảo tàng Mỹ thuật Việt Nam – Vinpearl (VI)	https://www.facebook.com/baotangmythuat/?locale=vi_VN	\N
db7a56f0-ea04-4f66-bb76-91c6812b8062	ecabc48b-5c72-4388-a022-d57fd88856d4	xesaoviet	Xe Sao Việt	vi	Bảo tàng Mỹ thuật Việt Nam – Xe Sao Việt (VI)	https://vinpearl.com/vi/bao-tang-my-thuat-viet-nam	\N
dd4804ca-029b-42b3-a4db-f76b0d45ba8d	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	wiki_vi	Wikipedia	vi	Bảo tàng Phụ nữ Việt Nam – Wikipedia (VI)	https://baotangphunu.org.vn/	https://vi.wikipedia.org/api/rest_v1/page/summary/https://baotangphunu.org.vn/
e5c36115-b3e1-4273-abdc-c7179fabf9c5	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	vinpearl	Vinpearl	vi	Bảo tàng Phụ nữ Việt Nam – Vinpearl (VI)	https://www.facebook.com/baotangphunu/?locale=vi_VN	\N
436031b2-f8b6-402b-a615-45f1f9943326	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	xesaoviet	Xe Sao Việt	vi	Bảo tàng Phụ nữ Việt Nam – Xe Sao Việt (VI)	https://vi.wikipedia.org/wiki/B%E1%BA%A3o_t%C3%A0ng_Ph%E1%BB%A5_n%E1%BB%AF_Vi%E1%BB%87t_Nam	\N
6ec0daf0-0673-4367-93c5-a9df2b97969c	938aeaf3-a47c-4a1f-8199-1c18f20c0755	wiki_vi	Wikipedia	vi	Bảo tàng Hồ Chí Minh – Wikipedia (VI)	https://baotanghochiminh.vn/	https://vi.wikipedia.org/api/rest_v1/page/summary/https://baotanghochiminh.vn/
5b9b10b5-2289-4f2a-ad27-19121950cb8d	938aeaf3-a47c-4a1f-8199-1c18f20c0755	vinpearl	Vinpearl	vi	Bảo tàng Hồ Chí Minh – Vinpearl (VI)	https://vinpearl.com/vi/bao-tang-ho-chi-minh	\N
f75bca47-9c71-4cdc-9f0d-f1e3a511c1e4	938aeaf3-a47c-4a1f-8199-1c18f20c0755	xesaoviet	Xe Sao Việt	vi	Bảo tàng Hồ Chí Minh – Xe Sao Việt (VI)	https://www.facebook.com/HoChiMinhMuseum/?locale=vi_VN	\N
a75d1116-a631-48ec-8bb1-3576285b9cf9	af5ccb47-576b-45c8-81dc-23755eb499b2	wiki_vi	Wikipedia	vi	Nhà hát Lớn Hà Nội – Wikipedia (VI)	https://vi.wikipedia.org/wiki/Nh%C3%A0_h%C3%A1t_L%E1%BB%9Bn_H%C3%A0_N%E1%BB%99i	https://vi.wikipedia.org/api/rest_v1/page/summary/Nh%C3%A0_h%C3%A1t_L%E1%BB%9Bn_H%C3%A0_N%E1%BB%99i
9a01715c-739f-472e-9661-f09d164a179f	af5ccb47-576b-45c8-81dc-23755eb499b2	vinpearl	Vinpearl	vi	Nhà hát Lớn Hà Nội – Vinpearl (VI)	https://vinpearl.com/vi/nha-hat-lon-ha-noi-tuyet-tac-nghe-thuat-giua-long-thu-do	\N
98027cf2-c0f9-42b3-a093-f334fbcfbdd0	af5ccb47-576b-45c8-81dc-23755eb499b2	xesaoviet	Xe Sao Việt	vi	Nhà hát Lớn Hà Nội – Xe Sao Việt (VI)	https://calidas.com/vi/hanoi-opera-house/	\N
3617650f-e494-4054-84b5-51203f397ed7	e04e4553-459f-4ed1-9db5-14c50c1edcff	wiki_vi	Wikipedia	vi	Cầu Long Biên – Wikipedia (VI)	https://vi.wikipedia.org/wiki/C%E1%BA%A7u_Long_Bi%C3%AAn	https://vi.wikipedia.org/api/rest_v1/page/summary/C%E1%BA%A7u_Long_Bi%C3%AAn
5e4e36f5-4f34-4c84-ad13-ebf2473b0a45	e04e4553-459f-4ed1-9db5-14c50c1edcff	vinpearl	Vinpearl	vi	Cầu Long Biên – Vinpearl (VI)	https://vinpearl.com/vi/cau-long-bien-ha-noi	\N
73ca8fdb-e051-4f5f-9ed1-1c3efbc3b4fa	e04e4553-459f-4ed1-9db5-14c50c1edcff	xesaoviet	Xe Sao Việt	vi	Cầu Long Biên – Xe Sao Việt (VI)	https://vinhomes.vn/vi/cau-long-bien-ha-noi-o-dau-kham-pha-chi-tiet-tu-a-z	\N
8e70cbe2-7ddc-4cab-a9df-c14786d09144	07c80f91-6fb0-4dc0-94d3-f70b0000528c	wiki_vi	Wikipedia	vi	Nhà thờ Lớn Hà Nội – Wikipedia (VI)	https://vi.wikipedia.org/wiki/Nh%C3%A0_h%C3%A1t_L%E1%BB%9Bn_H%C3%A0_N%E1%BB%99i	https://vi.wikipedia.org/api/rest_v1/page/summary/Nh%C3%A0_h%C3%A1t_L%E1%BB%9Bn_H%C3%A0_N%E1%BB%99i
04b69072-5bdd-4e56-90d9-be7b1040f4bb	07c80f91-6fb0-4dc0-94d3-f70b0000528c	vinpearl	Vinpearl	vi	Nhà thờ Lớn Hà Nội – Vinpearl (VI)	https://vinpearl.com/vi/nha-hat-lon-ha-noi-tuyet-tac-nghe-thuat-giua-long-thu-do	\N
2c28c828-b38c-4f69-91f5-5df4858fed9d	07c80f91-6fb0-4dc0-94d3-f70b0000528c	xesaoviet	Xe Sao Việt	vi	Nhà thờ Lớn Hà Nội – Xe Sao Việt (VI)	https://www.facebook.com/pages/Nh%C3%A0%20h%C3%A1t%20L%E1%BB%9Bn%20H%C3%A0%20N%E1%BB%99i/792529450807497/#	\N
32d064a5-474f-4b6b-afd9-ac93e0dc3882	33a569bd-b6b7-4f77-b1fd-91820407d49c	wiki_vi	Wikipedia	vi	Quảng trường Ba Đình – Wikipedia (VI)	https://quocphongthudo.com.vn/the-thao/trong-nuoc/quang-truong-ba-dinh-noi-luu-giu-nhung-gia-tri-truong-ton.html	https://vi.wikipedia.org/api/rest_v1/page/summary/https://quocphongthudo.com.vn/the-thao/trong-nuoc/quang-truong-ba-dinh-noi-luu-giu-nhung-gia-tri-truong-ton.html
c3dd4716-c137-4a4d-9e40-794166b1b2a3	33a569bd-b6b7-4f77-b1fd-91820407d49c	vinpearl	Vinpearl	vi	Quảng trường Ba Đình – Vinpearl (VI)	https://hoangthanhthanglong.vn/quang-truong-ba-dinh/	\N
acfc3b66-a82f-4508-861d-1d4165251f0c	33a569bd-b6b7-4f77-b1fd-91820407d49c	xesaoviet	Xe Sao Việt	vi	Quảng trường Ba Đình – Xe Sao Việt (VI)	https://vinpearl.com/vi/quang-truong-ba-dinh-ha-noi-dia-diem-thieng-lieng-chung-nhan-lich-su	\N
57cecfd1-3403-49af-a928-d85a400a49af	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	wiki_vi	Wikipedia	vi	Quảng trường Đông Kinh – Nghĩa Thục – Wikipedia (VI)	https://vi.wikipedia.org/wiki/Qu%E1%BA%A3ng_tr%C6%B0%E1%BB%9Dng_%C4%90%C3%B4ng_Kinh_Ngh%C4%A9a_Th%E1%BB%A5c	https://vi.wikipedia.org/api/rest_v1/page/summary/Qu%E1%BA%A3ng_tr%C6%B0%E1%BB%9Dng_%C4%90%C3%B4ng_Kinh_Ngh%C4%A9a_Th%E1%BB%A5c
0981e128-2de1-49af-9384-e798b447f72e	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	vinpearl	Vinpearl	vi	Quảng trường Đông Kinh – Nghĩa Thục – Vinpearl (VI)	https://vinpearl.com/vi/quang-truong-dong-kinh-nghia-thuc	\N
94c14e6a-2439-4a77-a2e3-24cdbc328def	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	xesaoviet	Xe Sao Việt	vi	Quảng trường Đông Kinh – Nghĩa Thục – Xe Sao Việt (VI)	https://nguoihanoi.vn/quang-truong-dong-kinh-nghia-thuc-thu-hut-dong-dao-nguoi-dan-va-du-khach-92983.html	\N
a2908a06-d872-40ef-9201-cabf2f53cb0a	c8e43a60-b5b5-4605-b21b-b301bcb10a30	wiki_vi	Wikipedia	vi	Khu Phố cổ Hà Nội – Wikipedia (VI)	https://vi.wikipedia.org/wiki/Khu_ph%E1%BB%91_c%E1%BB%95_H%C3%A0_N%E1%BB%99i	https://vi.wikipedia.org/api/rest_v1/page/summary/Khu_ph%E1%BB%91_c%E1%BB%95_H%C3%A0_N%E1%BB%99i
14e83ebe-b2db-4f1a-8d22-44cb1f23787b	c8e43a60-b5b5-4605-b21b-b301bcb10a30	vinpearl	Vinpearl	vi	Khu Phố cổ Hà Nội – Vinpearl (VI)	https://vinpearl.com/vi/review-pho-co-ha-noi	\N
8ec88cc9-6a32-4a8d-856a-301d58a053fe	c8e43a60-b5b5-4605-b21b-b301bcb10a30	xesaoviet	Xe Sao Việt	vi	Khu Phố cổ Hà Nội – Xe Sao Việt (VI)	https://travelhanoi.com.vn/chi-tiet-du-lich/khu-pho-co-ha-noi-180-1580.html	\N
ead1f56f-4199-4ce6-8d7c-74aa5c9487b4	f9027e35-0096-4dab-904e-b75256e3dd3a	wiki_vi	Wikipedia	vi	Phố đi bộ Hồ Gươm – Wikipedia (VI)	https://vi.wikipedia.org/wiki/Ph%E1%BB%91_%C4%91i_b%E1%BB%99_H%E1%BB%93_G%C6%B0%C6%A1m	https://vi.wikipedia.org/api/rest_v1/page/summary/Ph%E1%BB%91_%C4%91i_b%E1%BB%99_H%E1%BB%93_G%C6%B0%C6%A1m
12bb09fc-3a1d-47dd-9467-447e7ceec019	f9027e35-0096-4dab-904e-b75256e3dd3a	vinpearl	Vinpearl	vi	Phố đi bộ Hồ Gươm – Vinpearl (VI)	https://mia.vn/cam-nang-du-lich/pho-di-bo-ho-guom-17409	\N
bfe98e08-7854-4e8b-a6ae-9d65150abba2	f9027e35-0096-4dab-904e-b75256e3dd3a	xesaoviet	Xe Sao Việt	vi	Phố đi bộ Hồ Gươm – Xe Sao Việt (VI)	https://vinpearl.com/vi/pho-di-bo-ho-guom	\N
3061e367-0909-4667-8076-7659e87eab9c	b7f14550-1f41-46a7-9fd6-19676ff9afa7	wiki_vi	Wikipedia	vi	Phố sách Hà Nội – Wikipedia (VI)	https://vinpearl.com/vi/pho-sach-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/pho-sach-ha-noi
548c8aea-e052-4187-93c8-07c57059ccdb	b7f14550-1f41-46a7-9fd6-19676ff9afa7	vinpearl	Vinpearl	vi	Phố sách Hà Nội – Vinpearl (VI)	https://www.traveloka.com/vi-vn/explore/destination/pho-sach-ha-noi-acc/209076	\N
111d6a6f-6510-4999-b94f-e6574ebf0211	b7f14550-1f41-46a7-9fd6-19676ff9afa7	xesaoviet	Xe Sao Việt	vi	Phố sách Hà Nội – Xe Sao Việt (VI)	https://library.hust.edu.vn/vi/node/938	\N
f0847e72-053a-4ca6-950a-84be6b7d9360	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	wiki_vi	Wikipedia	vi	Công viên Thống Nhất – Wikipedia (VI)	https://vinpearl.com/vi/cong-vien-thong-nhat-ha-noi	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/cong-vien-thong-nhat-ha-noi
0909c0ca-53e6-482c-a04e-6b4d8160572e	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	vinpearl	Vinpearl	vi	Công viên Thống Nhất – Vinpearl (VI)	https://www.facebook.com/thongnhatpark/?locale=vi_VN	\N
85085dfa-5dcb-450b-b523-e6afee555f09	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	xesaoviet	Xe Sao Việt	vi	Công viên Thống Nhất – Xe Sao Việt (VI)	https://vi.wikipedia.org/wiki/C%C3%B4ng_vi%C3%AAn_Th%E1%BB%91ng_Nh%E1%BA%A5t	\N
996f7e44-5284-451a-8ece-d234f271a4b4	6d9603f9-46dd-45ec-8137-8e57bcb32b19	wiki_vi	Wikipedia	vi	Công viên Yên Sở – Wikipedia (VI)	https://congvienyenso.vn/	https://vi.wikipedia.org/api/rest_v1/page/summary/https://congvienyenso.vn/
099874b0-c180-4364-9009-d2ddfc3382e3	6d9603f9-46dd-45ec-8137-8e57bcb32b19	vinpearl	Vinpearl	vi	Công viên Yên Sở – Vinpearl (VI)	https://www.facebook.com/congvienyenso.vn/	\N
6e4d0324-a929-4920-a194-764561743288	6d9603f9-46dd-45ec-8137-8e57bcb32b19	xesaoviet	Xe Sao Việt	vi	Công viên Yên Sở – Xe Sao Việt (VI)	https://www.traveloka.com/vi-vn/explore/destination/cong-vien-yen-so-acc/162449	\N
c9cd8324-b789-4bf3-bb34-52dac7330e13	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	wiki_vi	Wikipedia	vi	Làng cổ Đường Lâm – Wikipedia (VI)	https://vinpearl.com/vi/lang-co-duong-lam	https://vi.wikipedia.org/api/rest_v1/page/summary/https://vinpearl.com/vi/lang-co-duong-lam
71d28b3e-2c72-4ee4-961f-211508abf3f0	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	vinpearl	Vinpearl	vi	Làng cổ Đường Lâm – Vinpearl (VI)	https://vietnamtourism.gov.vn/post/60485	\N
f04eee3f-890b-4112-b56f-139591052ea7	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	xesaoviet	Xe Sao Việt	vi	Làng cổ Đường Lâm – Xe Sao Việt (VI)	https://www.traveloka.com/vi-vn/explore/destination/lang-co-duong-lam-o-dau-ha-noi/59042	\N
be6f1121-efe9-4bcc-a3b9-a0c6762ab6f3	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	wiki_vi	Wikipedia	vi	Làng gốm Bát Tràng – Wikipedia (VI)	https://nguoihanoi.vn/quang-truong-dong-kinh-nghia-thuc-thu-hut-dong-dao-nguoi-dan-va-du-khach-92983.html	https://vi.wikipedia.org/api/rest_v1/page/summary/https://nguoihanoi.vn/quang-truong-dong-kinh-nghia-thuc-thu-hut-dong-dao-nguoi-dan-va-du-khach-92983.html
65f452fb-5b88-4463-9139-f7226d1c594a	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	vinpearl	Vinpearl	vi	Làng gốm Bát Tràng – Vinpearl (VI)	https://www.facebook.com/baotanggom/?locale=vi_VN	\N
ee3de037-c3fd-4c58-824f-b8ea7e182d35	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	xesaoviet	Xe Sao Việt	vi	Làng gốm Bát Tràng – Xe Sao Việt (VI)	https://lug.vn/lang-gom-bat-trang?srsltid=AfmBOooM1wwNdG3Ldk5rem0xcZXY1hdMrJ_sJewiHEtO-_BRhmrfkdl9	\N
792293d7-57e2-438e-b519-5f88e35913a3	3ba31f52-39ea-4ca5-b966-20026f40560b	wiki_vi	Wikipedia	vi	Văn Miếu - Quốc Tử Giám – Wikipedia (VI)	https://vi.wikipedia.org/wiki/V%C4%83n_Mi%E1%BA%BFu_%E2%80%93_Qu%E1%BB%91c_T%E1%BB%AD_Gi%C3%A1m	https://vi.wikipedia.org/api/rest_v1/page/summary/V%C4%83n_Mi%E1%BA%BFu_%E2%80%93_Qu%E1%BB%91c_T%E1%BB%AD_Gi%C3%A1m
af34a29b-7b55-4ac2-a997-5d8c6ae8f756	3ba31f52-39ea-4ca5-b966-20026f40560b	vinpearl	Vinpearl	vi	Văn Miếu - Quốc Tử Giám – Vinpearl (VI)	https://vinpearl.com/vi/van-mieu-quoc-tu-giam	\N
d0d4ef92-e607-4c68-82a6-a208762343bc	3ba31f52-39ea-4ca5-b966-20026f40560b	xesaoviet	Xe Sao Việt	vi	Văn Miếu - Quốc Tử Giám – Xe Sao Việt (VI)	https://vinwonders.com/vi/wonderpedia/news/van-mieu-quoc-tu-giam/	\N
\.


--
-- TOC entry 5020 (class 0 OID 16674)
-- Dependencies: 232
-- Data for Name: list_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_items (id, list_id, location_id, note, is_visited, sort_order, added_at) FROM stdin;
\.


--
-- TOC entry 5019 (class 0 OID 16655)
-- Dependencies: 231
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lists (id, user_id, name, type, description, is_pinned, note, cover_image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5012 (class 0 OID 16531)
-- Dependencies: 224
-- Data for Name: location_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_images (id, location_id, url, sort_order) FROM stdin;
ad7b054d-2797-414c-ae49-df3d8f8676e0	8a113806-2f0c-43d3-afd1-5f17fe33fa68	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204372154-89be126f-89b9-400a-8841-908145fedb64.jpg	1
7454ead7-cf75-47df-9f26-7512e2656a4e	8a113806-2f0c-43d3-afd1-5f17fe33fa68	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211357758-7021063a-44a8-43f9-aa01-006d5478b877.jpg	2
931e501b-038d-4aed-8afc-c64af0ab7ddb	8a113806-2f0c-43d3-afd1-5f17fe33fa68	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211380409-6bbf2a89-86b3-421a-8259-6f741179c532.jpg	3
62600372-11f8-41cc-af2a-b322bf362ec2	8a113806-2f0c-43d3-afd1-5f17fe33fa68	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211388080-07f87e8a-7143-45fa-997b-a0a2f0fa152d.jpg	4
3d9a1049-ca64-47d0-a2d3-d355c57585f9	8a113806-2f0c-43d3-afd1-5f17fe33fa68	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211400888-cea42c03-8424-4391-a456-ffc733e05610.jpg	5
cc4af26f-6fc2-4e91-8917-4f6c730b87f5	b814d2d7-9afd-4716-8eba-83cadfb40800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211424888-8f9c3f40-73a2-40e2-9f4a-826c84c2cbe1.jpg	1
9df750ac-2100-455b-b343-9aab440428ae	b814d2d7-9afd-4716-8eba-83cadfb40800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211439120-e9831a7f-a3ff-427b-aca8-1c20fa873e9f.jpg	2
8fdb936c-24cd-4112-a27d-535a4d25d0ec	b814d2d7-9afd-4716-8eba-83cadfb40800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211448122-e0cc9175-b8dd-4145-926e-89e560b36975.jpg	3
ee7e16f2-017d-4364-90d2-4199be8be9ad	b814d2d7-9afd-4716-8eba-83cadfb40800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211459658-8ac946e0-5784-4e9a-9fe4-f7fd622373c4.jpg	4
fe3c7cb8-f56e-495d-a7b5-13fdfb342e80	b814d2d7-9afd-4716-8eba-83cadfb40800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211468579-5c67df69-3b58-45a7-9047-8a9a4e88d695.jpg	5
90957c83-0fdb-49cd-a969-517825a49870	a715f38d-7560-48c3-9808-03edd21c6fe9	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204903831-c1399584-cd41-4f8d-ab0f-69ce9064b7cb.jpg	1
c5edde1b-2605-4c72-8a4f-e2203c8817be	a715f38d-7560-48c3-9808-03edd21c6fe9	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211636384-9faf9164-1c64-4012-aaaa-0c127134f1aa.jpg	2
2dea4368-a401-4ecd-b309-12c9fc70cd2a	a715f38d-7560-48c3-9808-03edd21c6fe9	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211650433-8ed3f935-24e0-4573-9b62-24f125e263d6.jpg	3
72dcce64-0c9b-4469-9ace-17bdd06a8fe5	a715f38d-7560-48c3-9808-03edd21c6fe9	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211657333-8cf4fdad-0386-4ddc-ab6d-4650dbe076b7.jpg	4
cc7fc02f-2f3c-4610-9911-39f21429e3ee	a715f38d-7560-48c3-9808-03edd21c6fe9	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211664263-f3fe2b00-34e3-41e2-b516-44250df5e504.jpg	5
276a3892-5fc0-4295-b6ee-0b121b5640b5	6ca1a762-6d41-4072-a0c3-827c77601871	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204820135-7e07145f-4186-4c93-a531-f258e7a75759.jpg	1
f8bd14f7-6006-45cb-9cea-edf51f32c230	6ca1a762-6d41-4072-a0c3-827c77601871	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211861460-cd55651d-0e33-47d0-bd81-d45af5b2d203.jpg	2
e457207f-b0d2-4ad7-86b7-bac4c126dcad	6ca1a762-6d41-4072-a0c3-827c77601871	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211875285-7a8cb7ef-c7a1-4dd7-a76f-c355d1675f0e.jpg	3
8b5a1297-9fe8-4cd2-8c7d-aa5d3b177991	6ca1a762-6d41-4072-a0c3-827c77601871	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211885803-b92e6cb9-70f9-4e8b-bc60-8859de96ec83.jpg	4
ab2455cf-eb14-4798-8839-0ccb761372e9	6ca1a762-6d41-4072-a0c3-827c77601871	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211892693-ba7f9d07-fcbf-47cc-a44e-f2eb793195eb.jpg	5
4d9e1cbb-111c-42c6-b928-84fa9936e33f	e476ce92-8f33-446a-900b-4ca04e6ff141	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204798293-15dcf1d6-f22d-4639-97c2-489cbc93efcb.jpg	1
b61d456e-21ba-4c78-b4bb-315432b3b91a	e476ce92-8f33-446a-900b-4ca04e6ff141	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211918763-4591bd91-9418-4021-8a97-0b5095af2b19.jpg	2
2e877628-117c-480e-a78e-bae0d00b866b	e476ce92-8f33-446a-900b-4ca04e6ff141	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211925953-057c22c2-fcde-4ea1-beb8-35a1643974b8.jpg	3
5eb8e2e8-152a-4edd-9b8a-f9975858673c	e476ce92-8f33-446a-900b-4ca04e6ff141	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211938733-19d1dbbc-abb9-44fa-b198-53aaefc99cc7.jpg	4
c6750961-d45d-48d1-80be-4f36c297965c	e476ce92-8f33-446a-900b-4ca04e6ff141	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211945993-6c947aca-ee48-47a3-92ef-aba5c8fb7641.jpg	5
0f7975e0-881f-41b1-a969-a07b57f21f2a	1a8cdf42-c231-41d8-8802-e8f0619a3c69	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204971662-38b33a91-9c3a-4cc8-b35a-ce55d0644d39.jpg	1
3a5cba58-6850-4b12-9b74-12cec8514601	1a8cdf42-c231-41d8-8802-e8f0619a3c69	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211494922-15eb55de-0b54-4db7-a6fb-2b3a0b4dd724.jpg	2
4b6c08b3-849a-48b2-b1d3-eb084dd0c300	1a8cdf42-c231-41d8-8802-e8f0619a3c69	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211511979-fd6b14c9-33dd-4e1c-92af-bfa4ddd48205.jpg	3
69db1848-02e1-422a-8acb-78dfbf33dd90	1a8cdf42-c231-41d8-8802-e8f0619a3c69	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211521311-6db76d4e-c7bf-4531-8889-6cee2f1e9111.jpg	4
a5e6ea58-1d2c-45e8-b2c3-f0acd1a711a0	1a8cdf42-c231-41d8-8802-e8f0619a3c69	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211529091-0845a5c3-c856-4938-9d8f-8bc8255549cc.jpg	5
3d2b4d0f-4400-4294-b5cd-9d62eb6da2c0	e9a414ee-097e-4935-a7f2-ff9af30e5911	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204890745-435ad51c-cc0b-42d3-91bb-11643472ed58.jpg	1
7a805cc7-f880-4a4a-afa6-d0431f5105e8	e9a414ee-097e-4935-a7f2-ff9af30e5911	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211563411-51196d93-3635-4e0d-9e17-c27a60e8e254.jpg	2
93791a53-17f7-4294-8534-51f4c2be3126	e9a414ee-097e-4935-a7f2-ff9af30e5911	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211593331-5956efdf-1782-4cd8-8695-aa3db0fdca30.jpg	3
301b8de1-5957-4cd7-8e41-cb2c077c4451	e9a414ee-097e-4935-a7f2-ff9af30e5911	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211616771-abdff445-eccb-45ee-866b-35b4ca4835d0.jpg	4
763483fe-62ab-49ac-87fb-ebf17725ce9b	e9a414ee-097e-4935-a7f2-ff9af30e5911	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211624294-52172be1-fa3b-43ff-b4fb-d1f7606fb379.jpg	5
29b1cb79-a53e-4c71-9c07-1813f3e658c2	b5343ac8-2288-4e10-aca9-7fa2a9377faa	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204996678-461d3e3d-2950-453a-8c5f-1c8ea60f114d.jpg	1
e223ac63-7425-4f3f-aecf-393e96642697	b5343ac8-2288-4e10-aca9-7fa2a9377faa	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211710962-b6fd8007-a440-4a7e-bccc-c61d2457c813.jpg	2
042bb9f9-891c-4df6-9355-9d814201948e	b5343ac8-2288-4e10-aca9-7fa2a9377faa	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211723133-1440f3b9-8184-411d-8ffb-d65ec2828016.jpg	3
fd140136-84be-492b-9078-a1f13f13d24f	b5343ac8-2288-4e10-aca9-7fa2a9377faa	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211731205-e2c47633-da3d-4e06-ae50-e86bdc04e540.jpg	4
ac428a85-cf31-43fd-9a33-83d136d25a3b	b5343ac8-2288-4e10-aca9-7fa2a9377faa	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211741083-92dd7512-d0f0-4685-ab9f-085546ea163a.jpg	5
2a63a004-8285-4e6e-9351-be8a3e4296a6	8dc280e5-51bf-4425-9ea4-72658ba86e4e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204927974-9253e2c4-6612-43ff-a66b-1956b3a61e75.jpg	1
22706d01-bdb7-4b0b-aa14-09e1f9c521c9	8dc280e5-51bf-4425-9ea4-72658ba86e4e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211757894-464f091e-7b5c-4512-bf26-2ea020e82f48.jpg	2
0b3b887c-8c41-4f00-a3a8-ff847fee8e40	8dc280e5-51bf-4425-9ea4-72658ba86e4e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211767689-8bee3b08-0053-4f89-becb-222c72bf5045.jpg	3
c30c5af4-5b5e-45e7-87b9-eaec8bfe81ab	8dc280e5-51bf-4425-9ea4-72658ba86e4e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211783414-2e315baa-adcc-4861-a04c-0c1a5b4ddc87.jpg	4
525b6541-8b93-45f7-b0fb-6a21ab6c2082	8dc280e5-51bf-4425-9ea4-72658ba86e4e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211792276-27e475e0-f9a9-439d-a433-16ccb77a1873.jpg	5
452bd0f7-70d0-4b02-9dfb-b839a677423e	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204959384-ad31c651-9077-41a0-a3be-3ce3851f7e55.jpg	1
c94b0740-6c6d-4d69-9d28-f539d4009357	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211822253-ec445ccf-9f77-4c21-b711-3f0744c70b49.jpg	2
826fea3b-42e8-4ee1-8ef4-c42795582d39	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211830192-475effe2-0380-4a20-816b-c5ed1d1a136d.jpg	3
1535774f-46b7-4934-9362-be46c9505a24	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211837993-4754cbef-d74e-4ef2-9bc8-bedbaec1e20a.jpg	4
c5079378-af74-4dd5-99f9-8b06eda656a8	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211846868-93706827-2210-47af-ac31-9a7ceb515a83.jpg	5
c0403f7e-84fb-4e2b-ba58-013e2adcc352	b6b3878a-61ae-464e-8a00-880c9b7df23a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204837885-272d998a-a916-4e29-adc9-b8479adbdd1f.jpg	1
fe990056-feed-4472-b68f-799f724ba4a7	b6b3878a-61ae-464e-8a00-880c9b7df23a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211957942-5e19f07d-e053-4e70-99ba-b7475cd9931e.jpg	2
b1042ea2-9b5d-4e07-a9b7-4cf17b4242b0	b6b3878a-61ae-464e-8a00-880c9b7df23a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211968602-1fe34208-80dd-4cfb-ac66-c54953f17803.jpg	3
5ceba44c-e00e-4023-ae1d-c50bedc988ec	b6b3878a-61ae-464e-8a00-880c9b7df23a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211975885-7957127e-f0af-4ffd-b22b-3c8fa1c3483b.jpg	4
42dcb83d-62f5-49eb-b749-48fd84cda83a	b6b3878a-61ae-464e-8a00-880c9b7df23a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772312512063-243f476b-4186-4f03-8350-d77da9df3f18.jpg	5
32929d3c-b41f-4fbe-a702-3713a64f736f	227b3fd9-af71-4514-b798-8ac1dc941554	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204871949-0fc12a39-3093-4c51-9853-ff20785a4b7a.jpg	1
fa5ee295-ae6b-4dfd-b17f-0796bd08b97c	227b3fd9-af71-4514-b798-8ac1dc941554	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212004534-783ccfc3-efc8-4ccd-9d78-63562514c5d7.jpg	2
64733e3c-bf5f-4f46-91dc-6453cab512af	227b3fd9-af71-4514-b798-8ac1dc941554	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212012024-ffadd14f-4d86-4181-bd05-25b18893161e.jpg	3
727fea2a-73e3-442a-95c9-74db7602b1fd	227b3fd9-af71-4514-b798-8ac1dc941554	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212019449-49cfcc9c-90fa-40f8-820d-60544776eaf9.jpg	4
d58cf9d7-294f-4323-b161-dc156948998a	227b3fd9-af71-4514-b798-8ac1dc941554	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212026427-067138c8-2a66-4ed2-aac2-e541cd779dd2.jpg	5
35845b1a-ab13-42e3-b8b7-2f0fd22fc182	093a94c5-f7b7-4a99-94d2-74ed61d4786e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217637088-fe81c50e-923f-49fd-b72c-d2ca48863683.jpg	1
d15de544-d1bd-4536-ad0b-26d5c5278cab	093a94c5-f7b7-4a99-94d2-74ed61d4786e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217659202-0f51885e-131e-46c8-9674-d2ff513f7347.jpg	2
ada7b248-b46e-4fb0-8927-8b72a9a3e043	093a94c5-f7b7-4a99-94d2-74ed61d4786e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217810585-0c0411c8-46e9-4683-9f20-dcb03393d3fb.jpg	3
1a744820-bd72-4f86-a7ec-48e97c9f61a8	093a94c5-f7b7-4a99-94d2-74ed61d4786e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217879532-97c3b173-533a-4baa-a3c5-6ba21cbd207f.jpg	4
48d8a7f3-a6a6-47d8-9427-f0d784d0b322	093a94c5-f7b7-4a99-94d2-74ed61d4786e	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217891312-d90622e2-5ddb-45a0-81d4-3a9b2e8227de.jpg	5
f0ac0bdf-8c1f-4e90-8e86-9eb8812504c6	57fc3023-9402-48eb-b128-e3eb44cf4273	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217637088-fe81c50e-923f-49fd-b72c-d2ca48863683.jpg	1
78e82568-ae9c-4a1d-8896-06506d272946	57fc3023-9402-48eb-b128-e3eb44cf4273	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217659202-0f51885e-131e-46c8-9674-d2ff513f7347.jpg	2
6752f1ea-ff49-4507-b252-bd3ffa4f09ef	57fc3023-9402-48eb-b128-e3eb44cf4273	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217810585-0c0411c8-46e9-4683-9f20-dcb03393d3fb.jpg	3
a39d0657-846d-4d08-83be-4305765b794c	57fc3023-9402-48eb-b128-e3eb44cf4273	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217879532-97c3b173-533a-4baa-a3c5-6ba21cbd207f.jpg	4
f6536869-800b-4a6c-b01c-0e040694ee60	57fc3023-9402-48eb-b128-e3eb44cf4273	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217891312-d90622e2-5ddb-45a0-81d4-3a9b2e8227de.jpg	5
896cd3dd-1de2-42ec-af18-615014d959af	5c6160c4-0d3c-4515-b48b-f928294b1800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212112648-7f347f4f-2e82-4e5a-a7d6-71ad5df2371d.jpg	1
c4cd60ed-c4df-4d25-b3ea-327aa5a0291c	5c6160c4-0d3c-4515-b48b-f928294b1800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212160073-471938ae-4463-42ea-acf9-6f36b6c82063.jpg	2
1af91197-c489-432d-b270-9b9504e5af85	5c6160c4-0d3c-4515-b48b-f928294b1800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212496914-a1e8dc51-a0a5-4eeb-a889-b3edf1a40a38.jpg	3
7ce3c56d-4492-4b70-a1dd-4fde4d4226c3	5c6160c4-0d3c-4515-b48b-f928294b1800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212518260-6223ba11-610b-4c8b-ad57-68b17fcf4939.jpg	4
472e7461-2af4-4de0-b965-c40e68d23f85	5c6160c4-0d3c-4515-b48b-f928294b1800	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772212538869-c702d749-db4c-4111-a3d1-b98ebb5b2c0d.jpg	5
6a12d282-0fa7-4fd0-b065-171d4b1a217b	938aeaf3-a47c-4a1f-8199-1c18f20c0755	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309790019-f3140656-292a-41b4-b76d-94eb5b8fdb3e.jpg	1
e4bbb526-e188-4bea-97f9-b5c0cf3d51d3	938aeaf3-a47c-4a1f-8199-1c18f20c0755	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309820324-51ef17f3-9668-4379-89a2-663e2b7f5b3a.jpg	2
6c8d034c-4722-474c-834a-990f88f95037	938aeaf3-a47c-4a1f-8199-1c18f20c0755	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309859777-3da1c6bd-57af-45d7-88fd-671e042785db.jpg	3
1ef3855a-d39d-4a83-aa62-9729b57fed56	938aeaf3-a47c-4a1f-8199-1c18f20c0755	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309874376-f68ff048-252f-453a-93be-9890c9b05669.jpg	4
c672383e-79b7-47d9-bdf6-6fc8a16f2655	938aeaf3-a47c-4a1f-8199-1c18f20c0755	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309889925-395c81d1-5451-4e39-898c-ab1c0ca46593.jpg	5
306e6f59-a08a-4390-a430-2181a1e397b6	af5ccb47-576b-45c8-81dc-23755eb499b2	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772306900174-b38a2a2f-7b9f-4f53-be6e-0e14d7e18f1a.jpg	1
65a8ef1b-600d-4e37-982d-a4ad605cf6bc	af5ccb47-576b-45c8-81dc-23755eb499b2	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307851558-6c890848-0d06-4a53-886d-e6443f4be101.webp	2
cd32253d-3bd7-440d-be18-b80ec573c2be	af5ccb47-576b-45c8-81dc-23755eb499b2	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307930211-775d0070-e1ca-40dc-90f5-6d4947d7ce52.webp	3
138493d7-f2d3-413a-9eed-d6d45e1177cf	af5ccb47-576b-45c8-81dc-23755eb499b2	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307951413-12357748-aba0-4aee-b1d7-1caf4d3ac91f.webp	4
23d7874d-f7e2-4e32-95ba-a1d06b312312	af5ccb47-576b-45c8-81dc-23755eb499b2	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307973391-49c66746-d076-45e2-bedf-41450180eafb.webp	5
a7ccf95d-375e-43b1-977a-ae78c2d16766	e04e4553-459f-4ed1-9db5-14c50c1edcff	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307232141-aed8d03f-23a4-447b-88df-880e561efc94.jpg	1
7627ea04-52bc-44df-ba3a-9c5f7e3653f0	e04e4553-459f-4ed1-9db5-14c50c1edcff	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307599386-430ca7e4-5b70-4908-83ce-2724839f55eb.jfif	2
a5941afb-6e64-4b9f-aeaf-83997d8680c7	e04e4553-459f-4ed1-9db5-14c50c1edcff	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307666108-a3eec993-ca45-4474-9233-4fa3ddd4f420.jfif	3
6b7f60cd-713c-42f7-bdad-269335d05d6e	e04e4553-459f-4ed1-9db5-14c50c1edcff	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307698478-9ea92a30-a3d0-4daf-bc10-a6d17aef6355.jfif	4
7375bb2b-9183-4981-806e-a012a0119fb0	e04e4553-459f-4ed1-9db5-14c50c1edcff	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772307721477-5a31b764-02ff-486f-9cc9-50792f954e94.jfif	5
bc4d854b-d41f-43fa-b34b-d820dad29337	07c80f91-6fb0-4dc0-94d3-f70b0000528c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308077921-7585d9a4-62c1-4ce7-ba3c-6cec4d23cd07.jpg	1
7893f003-7b33-4ec2-9116-8f74802b6495	07c80f91-6fb0-4dc0-94d3-f70b0000528c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308116420-264842c3-761d-45eb-906a-98534cb4fcd9.jpg	2
4c52eb53-c9a2-4999-a7e5-e9e0cc1974c6	07c80f91-6fb0-4dc0-94d3-f70b0000528c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308155969-80ead36e-e79b-4485-ac08-9455f6836835.webp	3
05ce18a6-7097-43b6-8ffe-a0b8259be02e	07c80f91-6fb0-4dc0-94d3-f70b0000528c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308219677-065c54af-5ecb-49c1-b020-744f81fc611b.jpg	4
c830002b-6b12-4362-9588-c42f066797b3	07c80f91-6fb0-4dc0-94d3-f70b0000528c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308239477-ccc7284e-86f9-471f-960a-a7d5ffb6a497.webp	5
a05736e0-f84e-418e-8109-048842c4e6ee	33a569bd-b6b7-4f77-b1fd-91820407d49c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308322890-900ccb32-0d1e-4e38-8d7a-26f2f7c949e9.jpg	1
c87cdbab-0c0b-410a-b359-7730f3bc8df7	33a569bd-b6b7-4f77-b1fd-91820407d49c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308361088-90474d9b-f290-4555-9483-6a926cca4da2.jpg	2
7290730d-af49-46fa-99bc-976fa0977a26	33a569bd-b6b7-4f77-b1fd-91820407d49c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308392338-14f4bbf0-d02b-44e2-8b18-d56a476dfd85.jpg	3
c6ff1f2a-54d7-494f-a4fe-6a367f828415	33a569bd-b6b7-4f77-b1fd-91820407d49c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308410418-b8039fdd-d143-41b2-8a57-97ce194cb3e9.jpg	4
2fb05513-8272-4e97-a38a-737025737ddc	33a569bd-b6b7-4f77-b1fd-91820407d49c	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308439330-054d8522-0077-424b-adf0-512c1503a76d.jpg	5
f7d76f79-4849-4f2d-993c-33320a6d7822	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308521454-cb86c07f-8b2e-4726-a781-a5fc227b18a2.webp	1
1aa717e1-d17c-48f9-937e-13233aa0e280	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308619882-476f6e8d-0b21-4978-9d2f-896d65527a01.webp	2
085620e5-344c-42c2-81a9-6e6c77a96728	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308638553-66dc5f42-2a91-4e2b-b0f2-7b714587d88a.webp	3
1a7fb155-d73b-4656-9d37-5aaaf2935231	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308680921-6db1cfb4-3afb-466f-bf10-f3b02170289e.jpg	4
c3ee4656-9fe2-4b65-a7fa-439b710f2370	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308710157-3ea07b10-1851-4cf2-9eff-cf093d386fca.jpg	5
13b34a78-fde9-4d1d-8161-994a2dffad60	c8e43a60-b5b5-4605-b21b-b301bcb10a30	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308829253-de335ab9-a018-412e-aa18-ecd3f6e96ed3.jpg	1
c3684c6c-98b1-4805-99a6-ceb77f8a94e5	c8e43a60-b5b5-4605-b21b-b301bcb10a30	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308868639-39bc23f8-2de8-4033-8284-846cee8fdd93.jpg	2
57fb1a0c-ed64-4fc0-abbf-baeb1642ea33	c8e43a60-b5b5-4605-b21b-b301bcb10a30	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308891430-6e411dbb-c5a6-4992-a083-4a4fde9ce329.jpg	3
8eb7cc23-5a7c-4e60-a896-43178bb10562	c8e43a60-b5b5-4605-b21b-b301bcb10a30	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308945865-4fbd1679-7be0-4781-b462-ee5308640c50.jpg	4
8dad9f7e-c01c-4340-b49c-f788277a53dd	c8e43a60-b5b5-4605-b21b-b301bcb10a30	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772308965534-dbad61d8-7bca-4989-882c-60ccfffa507d.jfif	5
b9a0f701-f9c7-4a6a-99fd-a75c5ecf7a71	e98e3637-02fd-4007-a86f-7a8cbedae14d	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204093400-3c5850e4-fdc8-497d-97f3-d6dd0668befc.jpg	1
2096625d-b139-4205-b5de-76ee67c55699	e98e3637-02fd-4007-a86f-7a8cbedae14d	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211051763-a8ab0880-b3cd-4ece-86af-f579fd68bb63.jpg	2
6bfd1f12-65e8-41b9-a6a1-89bf26419436	e98e3637-02fd-4007-a86f-7a8cbedae14d	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211248349-5053303f-cbce-4965-a241-7d8d934bcb41.jpg	3
fb569e4e-f501-4314-821d-4b511fe9e984	e98e3637-02fd-4007-a86f-7a8cbedae14d	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211256927-e7621bca-c382-4058-a1ab-3f9ff4515b24.jpg	4
8b214da3-4b35-4153-85d9-00adbab3817d	e98e3637-02fd-4007-a86f-7a8cbedae14d	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211265068-bb8bb526-d7fb-421b-84fd-cc44a7f59be3.jpg	5
437d1597-7c51-4609-92ea-9acc46293a5f	3ba31f52-39ea-4ca5-b966-20026f40560b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204283198-fbd09021-7f5a-4783-a24f-b9d426cd58a5.jpg	1
e682cfd2-f30a-4c9c-bfb6-25966d3d98dc	3ba31f52-39ea-4ca5-b966-20026f40560b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772204852069-6daa506a-3d3b-4857-9cff-fa23ad9c4930.jpg	2
22a5eee4-ae98-4116-9e55-97106022c150	3ba31f52-39ea-4ca5-b966-20026f40560b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211293599-cdcfa8f5-c062-4305-8f6c-ec61893a3241.jpg	3
6fc820f7-1ba1-47a2-8f13-49f657601268	3ba31f52-39ea-4ca5-b966-20026f40560b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211311510-7c591cb2-cc7c-4adb-b2f4-dd7345d59a32.jpg	4
b346cf23-d37e-4a55-8235-4a6077f6ae6f	3ba31f52-39ea-4ca5-b966-20026f40560b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211320599-965ea289-49ce-4004-b978-c25bf4b1ae5b.jpg	5
f58643f8-6ada-45d2-882d-39cfecf8b7e5	3ba31f52-39ea-4ca5-b966-20026f40560b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772211330171-cd558539-db1e-459b-8cfa-dc5dc760b5c2.jpg	6
aa20d80e-b442-459c-b6ec-badf51451fcf	f9027e35-0096-4dab-904e-b75256e3dd3a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772209262857-be5b4acb-93ab-4d4c-8b24-dd834bb9696c.webp	1
fc54463e-282d-46d6-a8a9-3461c5969b4b	f9027e35-0096-4dab-904e-b75256e3dd3a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309039129-df7d0fe9-f055-40c2-acaa-57243b6a5963.webp	2
595a14eb-33a7-4e25-bd02-c41f431b6eb5	f9027e35-0096-4dab-904e-b75256e3dd3a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309060218-3101e973-87f2-4540-b8f9-3ce21b493754.jpg	3
2190f8bc-9c5b-4d97-8a3b-3093cb5402f3	f9027e35-0096-4dab-904e-b75256e3dd3a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309083700-b81abc12-a424-4131-a15b-18d6b9bc787c.jpg	4
6a019f1c-f4f6-46ae-9758-9994aa02874a	f9027e35-0096-4dab-904e-b75256e3dd3a	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309213106-8c6da944-a3dc-4298-b969-7919a3a51fc2.jpg	5
66256c71-520a-4b3c-ad98-7af5813c1d2f	429f1da2-c572-400d-8e4e-9ecbd096cc08	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217342515-017a187d-a9bc-4965-bc43-49a0a91efd6e.jpg	1
ca4d666c-7aef-49d9-84d8-6a2d9c85fdf7	429f1da2-c572-400d-8e4e-9ecbd096cc08	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217363016-89dfe544-e649-44c7-84fa-c3494dc0cc2b.jpg	2
ccb90e02-58e7-4a5f-b542-9e020c743504	429f1da2-c572-400d-8e4e-9ecbd096cc08	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217375587-7a919eb8-5336-466c-84a5-f7d7fcf84373.jpg	3
a959f877-c52e-476f-81b0-bee12129bfbd	429f1da2-c572-400d-8e4e-9ecbd096cc08	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217392315-b816b371-cbe2-4792-a1ce-ba7be93caf12.jpg	4
87d936c1-7511-47e8-beda-2b7d3e7b4847	429f1da2-c572-400d-8e4e-9ecbd096cc08	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217405217-ea1bfe6d-2ebd-4b17-832b-13b699a3de1a.jpg	5
15ce8f27-be81-405e-bc78-741ac6968761	bb085c14-2cf1-45fb-a564-42eed70da09b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772216798632-8fa49861-a9f0-4c7d-b167-4256d1c8826f.jpg	1
638cbb71-017d-4cc1-9cd7-74252cd1fd61	bb085c14-2cf1-45fb-a564-42eed70da09b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772216811392-5fe4d631-c663-49c6-8293-1b04d97012fc.jpg	2
d368d79d-316f-429c-b99a-48d8be0e9046	bb085c14-2cf1-45fb-a564-42eed70da09b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772216853874-aa41335a-4b30-4fcd-b910-7d51ea5278dc.jpg	3
1d8fd326-9c65-44af-b499-c828b303ca23	bb085c14-2cf1-45fb-a564-42eed70da09b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217015725-7dfe4b9d-9533-4bdd-abd0-de90276f43ec.jpg	4
350fac71-fdeb-4f3c-93d5-eacdd3d386ab	bb085c14-2cf1-45fb-a564-42eed70da09b	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772217053407-fd042169-be81-4845-b7c3-977a7a26eebb.jpg	5
282be882-beb3-4123-b241-8c2cd66b9a1d	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772216040610-8ba3ca3e-305c-464d-86f8-9424b81bfc6d.jpg	1
f930ca4f-11eb-4f92-a165-fea2be49fa65	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772216055998-07ba2152-bd13-4f56-865d-f3e8a25f3201.jpg	2
72c44c45-35bc-47d0-88c0-da62bfe00088	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772216069636-5301aefd-c5a6-463f-8542-34ce3d384c04.jpg	3
71c57360-b678-462b-afba-448c3dbe0185	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772216087718-02aafb3a-f02c-4934-839e-7d0d1c60382b.jpg	4
eb26d05b-b059-458b-b78b-289fbe8f40ff	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772216274232-99ad22ef-869a-404c-b1ba-cd3d1ef77216.jpg	5
d2f04002-7561-4d38-aaea-c1cf0972e903	c9b58d45-a84c-4024-8a8c-6994903079db	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215818448-01769d39-7aa3-4175-bdbb-8513d8b244e4.jpg	1
d90b192f-60f1-4eaf-a6d1-36e302e877df	c9b58d45-a84c-4024-8a8c-6994903079db	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215840016-770259d0-ddee-4847-8f2e-beef41b61a53.jpg	2
947c61e7-0332-40bd-8e2c-c072f3b7b54e	c9b58d45-a84c-4024-8a8c-6994903079db	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215853197-25a795aa-d7e9-4c81-8241-177fe4b0d9ec.jpg	3
f8add775-a649-4e9b-9e31-340fc1c9295b	c9b58d45-a84c-4024-8a8c-6994903079db	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215872358-d626a58e-e551-4b44-80ce-9620ae7b7ec5.jpg	4
ea395efd-87ec-4334-923f-73398e6ed36c	c9b58d45-a84c-4024-8a8c-6994903079db	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215957698-9b712046-4d64-4d18-92fd-5972b2152e42.jpg	5
7a9bd647-bf86-4414-a386-1b0105cfb453	837efbb5-f618-4118-9868-6d7ff86588ab	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215166373-5288be2b-32bb-4894-af0d-76323554eb40.jpg	1
5f466e1b-1f4d-4703-84a0-dfd885335b9a	837efbb5-f618-4118-9868-6d7ff86588ab	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215181091-3263b31b-2d66-4343-a46c-612e6d58e843.jpg	2
7b324053-50ea-499c-af01-8faa5447b682	837efbb5-f618-4118-9868-6d7ff86588ab	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215202904-1467fbe9-cc9f-427f-8652-b0005c27720a.jpg	3
107556c5-fcb7-472b-9e77-ab61c35a35f0	837efbb5-f618-4118-9868-6d7ff86588ab	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215217892-e15d2796-7cdf-4991-9413-b0b6a62038d9.jpg	4
19843d2d-93f9-4693-8647-4001a86216fe	837efbb5-f618-4118-9868-6d7ff86588ab	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215425107-630c6228-874a-4ce9-8e83-477e78fbcc81.jpg	5
a9bb411e-696c-4ef8-8ba0-398f0aaaf523	1184dc79-a111-4a8a-8b31-dbfa6f379de1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215508515-e7ec7031-5235-4680-b94c-3a2347326a6b.jpg	1
d10d1096-601c-4cc1-aaea-5d5b7ca9816c	1184dc79-a111-4a8a-8b31-dbfa6f379de1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215637658-093051af-3a92-4b1b-af3b-d1ecd1b476f4.jpg	2
bcb5ee79-f88e-4351-a5e4-6fb4bcdb4640	1184dc79-a111-4a8a-8b31-dbfa6f379de1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215657046-3bdf0573-9528-484c-b7c1-4dda97e9863a.jpg	3
1c5439b5-3f0c-49ab-8e47-e9fd65b2f502	1184dc79-a111-4a8a-8b31-dbfa6f379de1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215673065-88303242-9f75-4c7e-8e46-6336bb4326c7.jpg	4
6311b021-a0a0-4613-a1a9-92d9e5f8df5f	1184dc79-a111-4a8a-8b31-dbfa6f379de1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215693737-ea239987-62aa-4eaf-92c8-83eaed0de116.jpg	5
835109d3-f15e-42be-abc5-b4e5b240952f	ecabc48b-5c72-4388-a022-d57fd88856d4	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772214885161-1360cc5d-7e21-4e42-b976-f24ad087a4d2.jpg	1
b311545a-4f18-4e46-aa0b-f5dd4507274f	ecabc48b-5c72-4388-a022-d57fd88856d4	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772214904410-0fa87ca7-45fb-47bc-b2d5-6a97c138565b.jpg	2
859241ee-a9f7-4a08-aabc-02a6411fa6b7	ecabc48b-5c72-4388-a022-d57fd88856d4	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772214925790-51a5dd97-7125-4d2f-9896-92fedf559381.jpg	3
dd27f76a-2a56-4bed-af74-8ddd1b091fed	ecabc48b-5c72-4388-a022-d57fd88856d4	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215097223-15b5b825-f960-46c6-909d-80ab43648801.jpg	4
7b6a01a5-a1f5-405a-8985-5ee97f853e02	ecabc48b-5c72-4388-a022-d57fd88856d4	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772215113505-9652fc85-8511-4691-a8cb-122c91e9bcce.jpg	5
d04b1f0b-2643-49dc-93c1-2e61d9515add	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772214154596-c77523b9-03d2-4d4d-b256-8ea58458c4a2.jpg	1
43168046-94ca-4393-9ae9-1174f9455272	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772214220187-57f15be1-15c7-4028-9e82-e6d5f114dda3.jpg	2
a016430f-c62a-46a2-ab85-6f2427d58b31	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772214233878-189759c1-8ac3-44e8-8983-2f1b6083edbf.jpg	3
a030156a-46e3-4069-b1cd-0164c14e3b45	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772214365681-a1a1a189-8570-4eec-9f93-f030768caba6.jpg	4
961b3935-e0cb-414c-86e8-dbf92d9b0f83	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772214379737-a5a08544-83db-4199-aaaf-65f8fd7b5647.jpg	5
1570e79f-ba4a-4690-8aa9-633760bacea5	b7f14550-1f41-46a7-9fd6-19676ff9afa7	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309319647-0abfc73d-3976-40c6-9c47-ead5e5a39436.jpg	1
45cf7fcd-4ec0-4f9a-b4e8-c59957af0257	b7f14550-1f41-46a7-9fd6-19676ff9afa7	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309368179-f6326790-f7c0-4a96-83c4-2954ab535e18.jpg	2
395a7325-4471-46dd-8d96-1272b8aa905c	b7f14550-1f41-46a7-9fd6-19676ff9afa7	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309394012-1544ac14-3049-4290-82ff-c70d6359c5fc.jpg	3
111fdf5c-91a5-4854-8d68-e53a2770c04e	b7f14550-1f41-46a7-9fd6-19676ff9afa7	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309422307-c716b86e-2173-430f-9e27-ebd83dabc3e6.jpg	4
0e81ca9c-89cb-47a7-a33f-476ddfd1eb1f	b7f14550-1f41-46a7-9fd6-19676ff9afa7	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309463110-45732191-5219-4595-a3b4-c346882ab946.webp	5
cbf77990-16b2-4945-9488-eda73623a1e0	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772218209615-3a9da398-7921-4928-90a8-baca884d2ba8.jpg	1
336760cd-f11a-469f-a8ad-ac2b5f24de9a	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772218238163-394e3676-4784-4590-a0a5-b30d593c39dd.jpg	2
9c195074-af30-4aa2-be4d-197f87db2daf	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772218254047-2b87b697-0890-469f-b1f6-2dba2ade8031.jpg	3
1b63fd54-d160-4722-ad4c-63f0d01fbd46	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772218268895-d16c915f-498f-41ab-8251-6708bd88d0e0.jpg	4
7df645e0-26d4-48ae-b26d-0ff994786488	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310487671-ea301a7d-a7da-415c-8127-c4548d4b0523.webp	5
879804f4-bde0-443c-a315-427a1cc51c33	6d9603f9-46dd-45ec-8137-8e57bcb32b19	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310290321-d1907e22-db5a-425c-8737-328bfda12a63.jpg	1
c1fdcd1a-0ba5-492e-bbb2-d78cf0f73b32	6d9603f9-46dd-45ec-8137-8e57bcb32b19	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310335182-87d351a3-6db4-4abf-82e0-8e12d4dc267c.png	2
27acfb72-53e6-494c-9498-ff8a6243812d	6d9603f9-46dd-45ec-8137-8e57bcb32b19	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310385070-7307eca4-f54c-4e0c-a548-22cd548c89cc.jpg	3
ca5a453d-9539-4b4d-b744-68931c6c8079	6d9603f9-46dd-45ec-8137-8e57bcb32b19	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310402353-0cac3e9d-6ab2-4af1-92a0-b4f7ec9cea91.webp	4
3954fc81-77a4-48c3-98a3-51047955f4ab	6d9603f9-46dd-45ec-8137-8e57bcb32b19	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310424834-2c72957c-44f1-4572-b4a0-1f32178c4740.jpg	5
ef52eb8d-73c5-47f8-8aae-4c5ed0f2f0d3	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310076640-662bd433-6e3a-4b10-8f3b-d322f710f3e0.jpg	1
d1d864e1-e150-4f4b-b560-148632962a60	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310089051-f3aad5b3-481f-4051-b5de-0dc150a58808.jpg	2
4e6612bd-5cba-4853-9f41-a28c55562093	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310102005-664d8947-2c2d-4150-8033-22367f6145d1.jpg	3
b81519d2-b4e7-428d-afd1-50b9368ad8e7	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310114051-3c90c8e4-ad7e-4bca-9701-d42effa16e50.jpg	4
adcc4535-435c-42ba-adbc-7cf07c109a72	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310128030-ac96392d-e758-4c3e-9389-28b8ab43a090.jpg	5
191bc4a9-9c3e-4064-afcc-e27eed867f68	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772309977249-83e4c6c7-c41a-4447-8198-450d53f114cc.jpg	1
c70d608b-3ab9-402f-8dea-21247a581cac	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310013999-5bc137f5-afda-4005-ae44-c98d6105de06.jpg	2
f4468013-fb33-41ff-869c-bf8968a8ee32	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310027105-81f3a7a2-5d44-4246-b675-867cbeb8c957.jpg	3
2ddb7170-1e02-41fb-9557-609d7fb1b1c1	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310038984-1b23b7a1-3759-4a12-90c3-61c398ad89d6.jpg	4
de93a859-1091-46bc-af84-4d25adab9fb0	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	/location-images/4889286d-1732-48b4-8196-2c92dbb54306-1772310050814-4d3e429f-aa50-4a2e-a039-fddd7f9b97a4.jpg	5
\.


--
-- TOC entry 5010 (class 0 OID 16505)
-- Dependencies: 222
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, name, address, description, lat, lon, category, image, rating_avg, rating_count, created_at) FROM stdin;
e9ee4b83-7f1a-4382-895b-1978c29443d5	09, 36	P. Lê Thái Tổ, Hàng Trống, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02762111159112	105.85117523812511	bus	\N	0.0	0	2026-03-23 23:42:18.419039
03288faf-a8bb-4671-89dd-83706a810c8c	Ngã 3 Lê Thái Tổ - Hàng Trống	Hàng Trống, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02844313791557	105.85114455370848	bus	\N	0.0	0	2026-03-23 23:42:18.419039
3d53b33b-e60e-4c10-a883-055a8c869b46	24A Bà Triệu	P. Hồ Hoàn Kiếm, Tràng Tiền, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.0250453	105.8512801419023	bus	\N	0.0	0	2026-03-23 23:42:18.419039
efbe1509-90ee-49e2-8b6c-c11257af61ad	23 Hàng Tre	23 Hàng Tre, Lý Thái Tổ, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.0319684718327	105.85569914190232	bus	\N	0.0	0	2026-03-23 23:42:18.419039
73082435-e8c8-4127-ad1d-fe9a33643909	Bưu Điện Thành Phố Hà Nội - 75B Đinh Tiên Hoàng - 75 Đinh Tiên Hoàng - French Quarter	75 Đinh Tiên Hoàng, French Quarter, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.0269627432651	105.85359077073743	bus	\N	0.0	0	2026-03-23 23:42:18.419039
cfead777-4b1b-47a6-a01b-85168b38e0f0	Đối Diện Số 40 Tôn Đức Thắng (Văn Miếu)	Văn Miếu – Quốc Tử Giám, Đống Đa, Hà Nội, Việt Nam	\N	21.028629162189766	105.83482610543678	bus	\N	0.0	0	2026-03-23 23:42:18.419039
298f73c8-cfe9-4e58-abb0-081c730e6d00	Công Viên Lê Nin - Đối Diện 35 Trần Phú	35 P. Trần Phú, Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.03109611577158	105.83939963407592	bus	\N	0.0	0	2026-03-23 23:42:18.419039
f1d6efce-3ae0-4dfb-a7d3-8b6e59f356ff	85 Nguyễn Thái Học - Trường TH Lý Thường Kiệt - Văn Miếu	Văn Miếu – Quốc Tử Giám, Đống Đa, Hà Nội, Việt Nam	\N	21.02944433397779	105.83889401784445	bus	\N	0.0	0	2026-03-23 23:42:18.419039
9b995bfb-12f3-40e3-854b-16181b1171be	104 Nguyễn Khuyến - Trường TH Lý Thường Kiệt	Văn Miếu – Quốc Tử Giám, Đống Đa, Hà Nội, Việt Nam	\N	21.028346031913546	105.83865597023834	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b814d2d7-9afd-4716-8eba-83cadfb40800	Chùa Một Cột	2RPM+79G, P. Chùa Một Cột, Đội Cấn, Ba Đình, Hà Nội 100000, Việt Nam	Ngôi chùa thờ Phật đã được xây lại, vốn được dựng lên vào năm 1049 với thiết kế hoa sen.	21.03568241797018	105.83343615061096	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204852069-6daa506a-3d3b-4857-9cff-fa23ad9c4930.jpg	5.0	2	2026-02-27 18:11:19.577979
a715f38d-7560-48c3-9808-03edd21c6fe9	Cột cờ Hà Nội	28A Điện Biên Phủ, Điện Biên, Ba Đình, Hà Nội, Việt Nam	Công trình di tích lịch sử chiến tranh gồm tháp đá và lá cờ Việt Nam trong bảo tàng quân đội.	21.032548653085698	105.83979169335319	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204903831-c1399584-cd41-4f8d-ab0f-69ce9064b7cb.jpg	5.0	3	2026-02-27 18:11:19.577979
093a94c5-f7b7-4a99-94d2-74ed61d4786e	Hồ Tây	Tây Hồ, Hà Nội, Việt Nam	Hồ nước ngọt trong thành phố ghi dấu ấn với ngôi chùa từ thế kỷ 6 tọa lạc ở giữa hồ và con đường bao quanh dài 17,7 km.	21.053304862628885	105.81678351228088	nature	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204948488-9962dbee-aaf5-4ac0-83aa-b43cc0fd2601.jpg	5.0	3	2026-02-27 18:11:19.577979
e476ce92-8f33-446a-900b-4ca04e6ff141	Đền thờ Hai Bà Trưng	5P4P+G26 Đền thờ vọng, Hai Bà Trưng, Hạ Lôi, Mê Linh, Hà Nội, Việt Nam	Đền Hai Bà Trưng, còn gọi là Đền Đồng Nhân, là một ngôi đền thờ Hai Bà Trưng tọa lạc tại 12 Đồng Nhân, phường Hai Bà Trưng, thành phố Hà Nội. Hiện nay, đền Hai Bà Trưng nằm trên cùng một khuôn viên với hai di tích khác là chùa Viên Minh và đình Đồng Nhân, tạo thành Cụm di tích Đền – Chùa – Đình Hai Bà Trưng	21.156056566046036	105.73331280613137	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204798293-15dcf1d6-f22d-4639-97c2-489cbc93efcb.jpg	5.0	3	2026-02-27 18:11:19.577979
1a8cdf42-c231-41d8-8802-e8f0619a3c69	Hoàng Thành Thăng Long	19c Hoàng Diệu, Điện Biên, Ba Đình, Hà Nội 100000, Việt Nam	Khu hoàng thành với các tòa nhà và tác phẩm điêu khắc có từ thế kỷ 11, gồm một tòa tháp và con rồng đá	21.035222969406657	105.84025708254242	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204971662-38b33a91-9c3a-4cc8-b35a-ce55d0644d39.jpg	5.0	4	2026-02-27 18:11:19.577979
e9a414ee-097e-4935-a7f2-ff9af30e5911	Đền Ngọc Sơn	Đinh Tiên Hoàng, Hàng Trống, Hoàn Kiếm, Hà Nội, Việt Nam	Ngôi đền Nho giáo trên hồ nước có cầu bắc qua nổi bật với tòa tháp và các gian điện thờ anh hùng dân tộc.	21.03068236362315	105.8523712708518	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204890745-435ad51c-cc0b-42d3-91bb-11643472ed58.jpg	5.0	3	2026-02-27 18:11:19.577979
c4345c0a-7412-4aea-a6d6-8af91d5c8b99	Phủ Tây Hồ	52 P. Đặng Thai Mai, Quảng An, Tây Hồ, Hà Nội, Việt Nam	Ngôi đền uy nghi tọa lạc ven Hồ Tây, nơi thờ phụng Thánh Mẫu Liễu Hạnh.	21.055092969380695	105.81972499575247	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204959384-ad31c651-9077-41a0-a3be-3ce3851f7e55.jpg	5.0	4	2026-02-27 18:11:19.577979
8a113806-2f0c-43d3-afd1-5f17fe33fa68	Lăng Chủ tịch Hồ Chí Minh	1 Hùng Vương, Điện Biên, Ba Đình, Hà Nội, Việt Nam	Thi hài của Chủ tịch Hồ Chí Minh, lãnh tụ nước Việt Nam, được đặt tại lăng mộ và khu di tích lịch sử này.	21.03688684466192	105.83466732955408	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204372154-89be126f-89b9-400a-8841-908145fedb64.jpg	4.7	3	2026-02-27 18:11:19.577979
227b3fd9-af71-4514-b798-8ac1dc941554	Chùa Thầy	chân núi, Quốc Oai, Hà Nội, Việt Nam	Ngôi chùa cổ kính, nổi tiếng với các lễ hội có tiết mục múa rối nước trên mặt hồ.	21.02301599278118	105.64628102695399	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204871949-0fc12a39-3093-4c51-9853-ff20785a4b7a.jpg	4.3	3	2026-02-27 18:11:19.577979
57fc3023-9402-48eb-b128-e3eb44cf4273	Vườn thú Hà Nội	Đ. Bưởi, Giảng Võ, Ba Đình, Hà Nội 100000, Việt Nam	Vườn thú nhỏ trong thành phố có nhiều loài động vật, trò chơi giải trí, dịch vụ chèo thuyền và lối đi bộ.	21.031076407485624	105.80374270428831	nature	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772217637088-fe81c50e-923f-49fd-b72c-d2ca48863683.jpg	4.7	3	2026-02-27 18:11:19.577979
8dc280e5-51bf-4425-9ea4-72658ba86e4e	Đền Quán Thánh	190 P. Quán Thánh, Quán Thánh, Ba Đình, Hà Nội 118810, Việt Nam	Đền thờ Đạo Giáo, xây từ thế kỷ 13, có sân trong rộng rãi và điện thờ đặt một pho tượng linh thiêng bằng đồng.	21.043008073553594	105.83654833301784	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204927974-9253e2c4-6612-43ff-a66b-1956b3a61e75.jpg	4.3	3	2026-02-27 18:11:19.577979
6ca1a762-6d41-4072-a0c3-827c77601871	Chùa Trấn Quốc	Thanh Niên, Yên Phụ, Tây Hồ, Hà Nội, Việt Nam	Ngôi chùa lâu đời xây trên một hòn đảo nhỏ, thơ mộng và có nhiều điện thờ.	21.047851265531765	105.83686714981921	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204820135-7e07145f-4186-4c93-a531-f258e7a75759.jpg	4.8	4	2026-02-27 18:11:19.577979
b5343ac8-2288-4e10-aca9-7fa2a9377faa	Nhà tù Hỏa Lò	1 P. Hoả Lò, Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	Tàn tích của nhà tù nhiều tầng dành cho tù binh ch.tranh Việt Nam chỉ còn lại khu canh gác, nay là bảo tàng.	21.0253009884003	105.84653163368944	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204996678-461d3e3d-2950-453a-8c5f-1c8ea60f114d.jpg	5.0	4	2026-02-27 18:11:19.577979
b6b3878a-61ae-464e-8a00-880c9b7df23a	Chùa Hương	Hương Sơn, Mỹ Đức, Hà Nội, Việt Nam	Vô vàn các chùa Phật, hang động & đền thờ được xây dựng ở bên trong các ngọn núi đá vôi Hương Tích.	20.618179993296685	105.74680434839827	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204837885-272d998a-a916-4e29-adc9-b8479adbdd1f.jpg	5.0	3	2026-02-27 18:11:19.577979
9a703310-f47a-4a06-8ad4-41a070f753a9	Tổng Công Ty Đường Sắt Việt Nam - 116 Lê Duẩn	Cửa Nam, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.025590511319436	105.84131709123444	bus	\N	0.0	0	2026-03-23 23:42:18.419039
09a45b80-007e-4376-a5a3-5c2221f3eab0	Đối Diện 104 Ngọc Hà	Đội Cấn, Ba Đình, Hà Nội, Việt Nam	\N	21.0367189536372	105.83117454031267	bus	\N	0.0	0	2026-03-23 23:42:18.419039
1124e055-ca5d-4943-ae6b-4c4e25978d42	18A Lê Hồng Phong - Ngã 4 Lê Hồng Phong Ông Ích Khiêm	Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.034210399041697	105.83394464107478	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b50ed583-d09b-424c-b583-3d995d0a0c88	91-93 Lê Hồng Phong	Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.034316233195785	105.83210006957304	bus	\N	0.0	0	2026-03-23 23:42:18.419039
38209c62-97a5-4742-a2d4-b4a39010afe3	Công Ty Thương Mại Và Dịch Vụ Phương Trâm - Đường Cổ Linh	Lâm Du, Long Biên, Hà Nội, Việt Nam	\N	21.033803241591542	105.87888121848341	bus	\N	0.0	0	2026-03-23 23:42:18.419039
7874820d-b673-4953-98af-2ae9fb73227b	50 Hàng Cót	Phố cổ Hà Nội, Hàng Mã, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.037590500325656	105.84659039332881	bus	\N	0.0	0	2026-03-23 23:42:18.419039
d9efc7f2-130c-47d0-83e4-70b88865b43a	26-28 Hàng Than	Trúc Bạch, Ba Đình, Hà Nội, Việt Nam	\N	21.041511325950363	105.84721161658084	bus	\N	0.0	0	2026-03-23 23:42:18.419039
df69fc2c-6250-434b-8666-0475ed42c65a	Thành Cổ Hà Nội - Đối Diện 38 Phan Đình Phùng	Quán Thánh, Ba Đình, Hà Nội, Việt Nam	\N	21.040550032332057	105.8415897069901	bus	\N	0.0	0	2026-03-23 23:42:18.419039
68a7c054-f863-43dd-b963-34a9012bcbdd	Trước Nút Giao Hàng Than 70M - Yên Phụ (Đường Xe Buýt)	Trúc Bạch, Ba Đình, Hà Nội, Việt Nam	\N	21.04423495750782	105.84699703987891	bus	\N	0.0	0	2026-03-23 23:42:18.419039
2ed2ab76-7fd2-420e-a008-65585c85327a	Long Biên (Điểm Đỗ Trong Làn Đường Dành Riêng Cho Xe Buýt)	Trúc Bạch, Ba Đình, Hà Nội, Việt Nam	\N	21.042910858730064	105.8480436885615	bus	\N	0.0	0	2026-03-23 23:42:18.419039
426bdb47-d3d4-4de6-b885-44e665d785e9	115 Phùng Hưng	125 P. Phùng Hưng, Phố cổ Hà Nội, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.035153634673257	105.8458663122118	bus	\N	0.0	0	2026-03-23 23:42:18.419039
c2b1aa86-6755-449c-8412-e3d5f77e80b2	30-32 Tràng Tiền	French Quarter, Tràng Tiền, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02477495630002	105.85555327073742	bus	\N	0.0	0	2026-03-23 23:42:18.419039
c8e43a60-b5b5-4605-b21b-b301bcb10a30	Khu Phố cổ Hà Nội	P. Hàng Ngang, Hàng Đào, Hoàn Kiếm, Hà Nội 100000, Việt Nam	Khu giao thương lâu đời, có chợ đêm, những con ngõ nhỏ, quầy hàng rong và nhà cửa xây hình ống.	21.034056773312503	105.8506372830743	street	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772308829253-de335ab9-a018-412e-aa18-ecd3f6e96ed3.jpg	5.0	3	2026-02-27 18:11:19.577979
1461e251-72dd-4e80-9d87-22e537fa31c7	Trước Phố Chương Dương Độ (Đối Diện 198 Trần Quang Khải)	Chương Dương, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.028156671320403	105.85839098607781	bus	\N	0.0	0	2026-03-23 23:42:18.419039
e04e4553-459f-4ed1-9db5-14c50c1edcff	Cầu Long Biên	2VR3+PR6, Cầu Long Biên, Phúc xá, Ba Đình, Hà Nội, Việt Nam	Cầu xây 1899 - 1902 nhà thầu Daydé & Pillé - Paris Cầu đã 124 tuổi Rất nhiều người đến đây chụp ảnh và thăm quan khi đến Hà Nội	21.043054984716044	105.85783712299921	architecture	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772307232141-aed8d03f-23a4-447b-88df-880e561efc94.jpg	5.0	3	2026-02-27 18:11:19.577979
33a569bd-b6b7-4f77-b1fd-91820407d49c	Quảng trường Ba Đình	Hùng Vương, Điện Biên, Ba Đình, Hà Nội 10020, Việt Nam	Quảng trường lớn nơi Bác Hồ tuyên bố Việt Nam giành độc lập từ Pháp và là nơi lưu giữ di hài của Bác.	21.036897224748014	105.83466621472766	architecture	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772308322890-900ccb32-0d1e-4e38-8d7a-26f2f7c949e9.jpg	5.0	3	2026-02-27 18:11:19.577979
f59941d5-498e-46e0-9fbe-9c3391017ab0	54 Nguyễn Hữu Huân	Phố cổ Hà Nội, Lý Thái Tổ, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.033478324926133	105.85435874929578	bus	\N	0.0	0	2026-03-23 23:42:18.419039
5fc6530b-4162-4a8c-8b82-6597d6f62ce2	36 Lý Thái Tổ - Cung Thiếu Nhi Hà Nội	French Quarter, Lý Thái Tổ, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02809789282788	105.8556052879403	bus	\N	0.0	0	2026-03-23 23:42:18.419039
6e3b7a28-d162-4765-be38-6b81342c0068	Hà Nội Văn phòng Xe Sapa Express	Lý Thái Tổ, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.03224262109961	105.8549654065336	bus	\N	0.0	0	2026-03-23 23:42:18.419039
f85e7bdf-7322-48d2-be0f-e8a5a25613f6	Cột Cờ Hà Nội - Điện Biên Phủ	Điện Biên Phủ, Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.032014143456465	105.83996523811932	bus	\N	0.0	0	2026-03-23 23:42:18.419039
7c6a2a75-a574-4bb7-9b37-3dee5beff5cf	34 - 36 Hoàng Diệu	Hoàng Diệu, Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.034142349575735	105.8388966127409	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	Quảng trường Đông Kinh – Nghĩa Thục	25-5 Đinh Tiên Hoàng, Hàng Trống, Hoàn Kiếm, Hà Nội 100000, Việt Nam	Quảng Trường nằm ở vị trí trung tâm quận Hoàn Kiếm, ngay cạnh hồ Gươm - trái tim thủ đô Hà Nội.	21.031907245994798	105.85157480145034	architecture	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772308521454-cb86c07f-8b2e-4726-a781-a5fc227b18a2.webp	5.0	3	2026-02-27 18:11:19.577979
5c6160c4-0d3c-4515-b48b-f928294b1800	Bãi đá sông Hồng	Ngõ 264 Âu Cơ, Nhật Tân, Tây Hồ, Hà Nội 100000, Việt Nam	Vườn hoa ven sông này là điểm đến yêu thích của nhiếp ảnh gia, nơi có hoa nở thường xuyên và một cối xay gió.	21.07851880403316	105.83526689221374	nature	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772212496914-a1e8dc51-a0a5-4eeb-a889-b3edf1a40a38.jpg	4.3	3	2026-02-27 18:11:19.577979
07c80f91-6fb0-4dc0-94d3-f70b0000528c	Nhà thờ Lớn Hà Nội	1 P. Nhà Thờ, Hàng Trống, Hoàn Kiếm, Hà Nội 100000, Việt Nam	Công trình bắt đầu xây dựng năm 1884 và hoàn thành năm 1887 dưới thời Pháp thuộc, là một trong những công trình Công giáo đầu tiên do Pháp xây tại Hà Nội. Nhà thờ được xây trên nền của chùa Báo Thiên, một trung tâm Phật giáo lớn từ thời Lý – Trần. Nhà thờ được xây theo phong cách Gothic Revival (Tân Gothic).	21.02859506466942	105.84885961475938	architecture	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772308077921-7585d9a4-62c1-4ce7-ba3c-6cec4d23cd07.jpg	5.0	3	2026-02-27 18:11:19.577979
67fa4da6-fbeb-4836-bb7b-44bf7e8e72e1	1B Lê Hồng Phong - Trung Tâm TDTT Khúc Hạo	Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.03339363668669	105.83775219549231	bus	\N	0.0	0	2026-03-23 23:42:18.419039
938aeaf3-a47c-4a1f-8199-1c18f20c0755	Bảo tàng Hồ Chí Minh	19 P. Ngọc Hà, Đội Cấn, Ba Đình, Hà Nội 100000, Việt Nam	Bảo tàng này được xây dựng theo hình hoa sen, là nơi cho du khách tìm hiểu về cuộc đời Chủ tịch Hồ Chí Minh.	21.03563978840977	105.83266153631034	museum	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772309790019-f3140656-292a-41b4-b76d-94eb5b8fdb3e.jpg	4.7	3	2026-02-27 18:11:19.577979
0dbe8468-be0c-46c4-8048-0fdd891683dc	Đối Diện 34A Trần Phú - Điện Biên	P. Trần Phú, Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.030398747497955	105.84268281578694	bus	\N	0.0	0	2026-03-23 23:42:18.419039
af5ccb47-576b-45c8-81dc-23755eb499b2	Nhà hát Lớn Hà Nội	1 Tràng Tiền, Phan Chu Trinh, Hoàn Kiếm, Hà Nội, Việt Nam	Nhà hát lộng lẫy này khánh thành từ năm 1911 và là nơi tổ chức biểu diễn nghệ thuật, trình diễn nhạc cổ điển, khiêu vũ và opera.	21.024241032371247	105.85762416292684	architecture	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772307851558-6c890848-0d06-4a53-886d-e6443f4be101.webp	5.0	2	2026-02-27 18:11:19.577979
741106bf-427b-4718-9b66-def164906627	12A Điện Biên Phủ	12A Điện Biên Phủ, Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.029490285882943	105.84230847369629	bus	\N	0.0	0	2026-03-23 23:42:18.419039
8328784f-58e7-479f-99c1-2b0d9533c56e	Đối Diện 52 Nguyễn Du	Nguyễn Du, Hai Bà Trưng, Hà Nội, Việt Nam	\N	21.019313940690683	105.84620181791931	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b53a78b8-9e45-4d1f-a573-718b26753047	54 Lý Thường Kiệt - Trần Hưng Đạo	Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.024846159204564	105.84554891087775	bus	\N	0.0	0	2026-03-23 23:42:18.419039
233f4e54-fd3b-49c7-a475-df7ec693dcb6	Công Ty Thương Mại Và Dịch Vụ Phương Trâm - Đường Cổ Linh	Lâm Du, Long Biên, Hà Nội, Việt Nam	\N	21.03261842520974	105.87945058738815	bus	\N	0.0	0	2026-03-23 23:42:18.419039
3ba31f52-39ea-4ca5-b966-20026f40560b	Văn Miếu - Quốc Tử Giám	58 Quốc Tử Giám, Đống Đa, Hà Nội, Việt Nam	Trường đại học đầu tiên của Việt Nam, biểu tượng truyền thống hiếu học.	21.028118908054335	105.83565610776836	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204283198-fbd09021-7f5a-4783-a24f-b9d426cd58a5.jpg	5.0	2	2026-02-27 23:12:12.037116
b7f14550-1f41-46a7-9fd6-19676ff9afa7	Phố sách Hà Nội	P. 19 Tháng 12, Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	Phố Sách Hà Nội nằm trên đường Trần Hưng Đạo và đầu kia là phố Hai Bà Trưng. Phố được tổ chức quy củ gồm nhiều gian hàng của các nhà xuất bản lớn trong nước.\nKhông gian rộng rãi, thoáng mát, nhiều chỗ ngồi ngoài trời cho người đọc sách miễn phí.	21.02502564641411	105.84791255418399	street	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772309319647-0abfc73d-3976-40c6-9c47-ead5e5a39436.jpg	5.0	3	2026-02-27 18:11:19.577979
6e2c2c4e-34e5-47a3-a518-9fd7dda22b73	49 Hai Bà Trưng - Tháp Hà Nội	Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.0259994407434	21.0259994407434	bus	\N	0.0	0	2026-03-23 23:42:18.419039
837efbb5-f618-4118-9868-6d7ff86588ab	Bảo tàng Dân tộc học Việt Nam	Đ. Nguyễn Văn Huyên, Quan Hoa, Cầu Giấy, Hà Nội 100000, Việt Nam	Bảo tàng dân tộc học trưng bày về các nền văn hóa đa dạng của Việt Nam với vườn cây và nhà hàng.	21.04033973154595	105.79873134314246	museum	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772215181091-3263b31b-2d66-4343-a46c-612e6d58e843.jpg	3.3	3	2026-02-27 18:11:19.577979
e98e3637-02fd-4007-a86f-7a8cbedae14d	Hồ Hoàn Kiếm	Hàng Trống, Hoàn Kiếm, Hà Nội, Việt Nam	Hồ nước với ngôi đền và tòa tháp tọa lạc trên hai hòn đảo nhỏ.	21.028905166449647	105.85212953788225	history	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772204093400-3c5850e4-fdc8-497d-97f3-d6dd0668befc.jpg	4.9	7	2026-02-27 18:11:19.577979
429f1da2-c572-400d-8e4e-9ecbd096cc08	Vườn hoa Nhật Tân	Ngõ 464 Đ. Âu Cơ, Phú Thượng, Tây Hồ, Hà Nội, Việt Nam	Một địa điểm chụp ảnh hoặc checkin tuyệt vời. Phù hợp với nhóm người đi chụp rất tốt. Mọi người nên đến vào buổi sáng cho đỡ đông vì ở đây khá đông vào buổi trưa chiều. Hơn nữa, buổi sáng ánh sáng chụp cũng đẹp hơn.	21.083918080060347	105.82231793124183	nature	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772217342515-017a187d-a9bc-4965-bc43-49a0a91efd6e.jpg	4.7	3	2026-02-27 18:11:19.577979
bb085c14-2cf1-45fb-a564-42eed70da09b	Hồ Hàm Lợn	Nam Sơn, Sóc Sơn, Hà Nội, Việt Nam	Rừng thông rất đẹp nhưng nhiều người cắm trại ý thức quá kém. Đến ăn uống đốt lửa, xả rác bừa bãi khắp nơi. Có mỗi việc gom rác mang đi khó đến thế sao? Rồi tiếng ồn thì kinh khủng, từ đầu này sang đầu kia chỗ nào cũng có tiếng hát karaoke	21.303061638412466	105.80099733883442	nature	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772216853874-aa41335a-4b30-4fcd-b910-7d51ea5278dc.jpg	5.0	3	2026-02-27 18:11:19.577979
b6cb31e8-ceff-416a-82f0-2dc36f2520a8	Đồi Bù	Thôn, Núi Bé, Chương Mỹ, Hà Nội 100000, Việt Nam	Đây là điểm dù lựợn dành cho những người thích mạo hiểm và nhìn phong cảnh thiên nhiên từ đỉnh núi xuống.mà không phải trên máy bay . nói chung rất tuyệt vời khi đến đây vào buổi bình minh hoặc hoàng hôn	20.83259338424265	105.58216038920843	nature	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772216069636-5301aefd-c5a6-463f-8542-34ce3d384c04.jpg	4.3	3	2026-02-27 18:11:19.577979
c9b58d45-a84c-4024-8a8c-6994903079db	Vườn quốc gia Ba Vì	Ba Vì, Hà Nội, Việt Nam	Vườn quốc gia Ba Vì nổi tiếng bởi có đền mẫu Thượng Thiên và đền thờ Bác Hồ cao nhất trên đỉnh. Vào khoảng tháng 10-11, vườn quốc gia thu hút hàng nghìn khách du lịch đến đây bởi có hoa dã quỳ nở rộ, trải dài đường đi và các triền núi tạo	21.081198390357343	105.36269705333123	nature	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772215853197-25a795aa-d7e9-4c81-8241-177fe4b0d9ec.jpg	4.5	4	2026-02-27 18:11:19.577979
1184dc79-a111-4a8a-8b31-dbfa6f379de1	Bảo tàng Lịch sử Quốc gia	1 Tràng Tiền, Cửa Nam, Hoàn Kiếm, Hà Nội 100000, Việt Nam	Bảo tàng gồm hai toà nhà trưng bày các hiện vật và nghệ thuật Phật giáo với tượng & di vật chiến tranh.	21.02456736019228	105.85934117273044	museum	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772215657046-3bdf0573-9528-484c-b7c1-4dda97e9863a.jpg	4.7	3	2026-02-27 18:11:19.577979
ecabc48b-5c72-4388-a022-d57fd88856d4	Bảo tàng Mỹ thuật Việt Nam	66 P. Nguyễn Thái Học, Điện Biên, Ba Đình, Hà Nội, Việt Nam	Mỹ thuật Việt Nam qua các thời kỳ và hình ảnh truyền thông trưng bày trong tòa nhà 3 tầng từ thời thuộc địa.	21.030678439942566	105.83705697690614	museum	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772214885161-1360cc5d-7e21-4e42-b976-f24ad087a4d2.jpg	3.7	3	2026-02-27 18:11:19.577979
45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	Bảo tàng Phụ nữ Việt Nam	36 P. Lý Thường Kiệt, Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	Bảo tàng hiện đại có bộ sưu tập cố định giới thiệu về lịch sử, văn hóa và thời trang của phụ nữ Việt Nam.	21.023372092201736	105.85155349769445	museum	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772214154596-c77523b9-03d2-4d4d-b256-8ea58458c4a2.jpg	4.7	3	2026-02-27 18:11:19.577979
f9027e35-0096-4dab-904e-b75256e3dd3a	Phố đi bộ Hồ Gươm	Đinh Tiên Hoàng, Hàng Trống, Hoàn Kiếm, Hà Nội 100000, Việt Nam	Phố đi bộ Hồ Gươm luôn là một trong những địa điểm nhộn nhịp và đáng trải nghiệm nhất mỗi khi mình đến Hà Nội.	21.031952522627698	105.85149925793975	street	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772209262857-be5b4acb-93ab-4d4c-8b24-dd834bb9696c.webp	5.0	3	2026-02-27 18:11:19.577979
89d1aa99-363b-40f7-a6d3-e06dfc3a6252	Công viên Thống Nhất	354A Đ. Lê Duẩn, Phương Liên, Đống Đa, Hà Nội, Việt Nam	Công viên thành phố thoáng mát, nhộn nhịp, rợp bóng cây cao, có hồ nước lớn, lối đi tập thể dục và quán cà phê.	21.014268520585006	105.84397256276081	park	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772218209615-3a9da398-7921-4928-90a8-baca884d2ba8.jpg	5.0	3	2026-02-27 18:11:19.577979
6d9603f9-46dd-45ec-8137-8e57bcb32b19	Công viên Yên Sở	QL1A Công viên, Gamuda Central, Hoàng Mai, Hà Nội 100000, Việt Nam	Công viên là nơi thư giãn và chụp ảnh tuyệt đẹp, với đường mòn dẫn qua những hồ nước & khu rừng.	20.964389750963676	105.85464820601577	park	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772310290321-d1907e22-db5a-425c-8737-328bfda12a63.jpg	5.0	3	2026-02-27 18:11:19.577979
2f5093b4-e390-4dd8-867e-78d1e56d0ca5	Làng cổ Đường Lâm	5F4C+RXQ, Đường Lâm, Sơn Tây, Hà Nội, Việt Nam	Đường Lâm trong mắt mình là một khoảng lặng đầy hoài niệm, nơi mà thời gian dường như chẳng nỡ làm phai đi nét rêu phong của một vùng quê Bắc Bộ.	21.15736491557992	105.47255593761105	village	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772310076640-662bd433-6e3a-4b10-8f3b-d322f710f3e0.jpg	5.0	3	2026-02-27 18:11:19.577979
183187c6-b930-41af-900c-2b950249d0bd	69 Lý Thường Kiệt - Chùa Quán Sứ	Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.024727595656067	105.84540365468119	bus	\N	0.0	0	2026-03-23 23:42:18.419039
741fc9c0-a004-4d47-b5a3-ed30971363ae	Qua Ngã 3 Thanh Niên - Trấn Vũ 50M (Hồ Trúc Bạch)	Trúc Bạch, Ba Đình, Hà Nội, Việt Nam	\N	21.04470278388351	105.83648886034757	bus	\N	0.0	0	2026-03-23 23:42:18.419039
01fee6fb-5945-4e22-9d1e-8e1aa94921df	Đối Diện Đền Quán Thánh - Thanh Niên	Thụy Khuê, Tây Hồ, Hà Nội, Việt Nam	\N	21.04354011689113	105.8359504414815	bus	\N	0.0	0	2026-03-23 23:42:18.419039
ca0746f4-a0f2-4ad2-be25-65023d95f3cc	Làng gốm Bát Tràng	Đ. Bát Tràng, Bát Tràng, Gia Lâm, Hà Nội, Việt Nam	Ngôi làng cổ nằm sát bờ sông Hồng có nghề làm gốm lâu đời với sản phẩm rất đa dạng. Gốm Bát Tràng phát triển mạnh mẽ trong những năm gần đây khi nhu cầu tăng về cả số lượng lẫn thẩm mỹ.	20.97463125899652	105.91338841791749	village	locations/4889286d-1732-48b4-8196-2c92dbb54306-1772309977249-83e4c6c7-c41a-4447-8198-450d53f114cc.jpg	5.0	3	2026-02-27 18:11:19.577979
91b13834-e82f-4ffc-ba52-55c5e6807b01	188 Quán Thánh	192B P. Quán Thánh, Quán Thánh, Ba Đình, Hà Nội, Việt Nam	\N	21.042830688504477	105.83867420750978	bus	\N	0.0	0	2026-03-23 23:42:18.419039
5d314292-332e-44b3-b2c7-5716f3ad7f0c	19 Nguyễn Biểu	19 Nguyễn Biểu, Quán Thánh, Ba Đình, Hà Nội, Việt Nam	\N	21.04191433850491	105.84015222011263	bus	\N	0.0	0	2026-03-23 23:42:18.419039
465831e3-4c19-4bed-8657-530cb9c2d693	Công Viên Bách Thảo - Hoàng Hoa Thám (Đối Diện Trường THCS Chu Văn An)	Ngọc Hà, Ba Đình, Hà Nội, Việt Nam	\N	21.041815805908985	105.83301553038113	bus	\N	0.0	0	2026-03-23 23:42:18.419039
be279faf-dd34-4e90-af84-0ff6e5c23b4c	197 Nghi Tàm (Đối Diện Ngõ 276)	Yên Phụ, Tây Hồ, Hà Nội, Việt Nam	\N	21.057063293545568	105.83565032273076	bus	\N	0.0	0	2026-03-23 23:42:18.419039
8a6d5a3f-0046-4a5b-af88-fcadfde2accb	Phòng Cảnh Sát PCCC - Công An TP.Hà Nội	Xuân La, Tây Hồ, Hà Nội, Việt Nam	\N	21.072179863494238	105.80960961363046	bus	\N	0.0	0	2026-03-23 23:42:18.419039
53b22289-a2fe-4f7c-9ac3-8149560ad9e6	132 Võ Chí Công	Xuân La, Tây Hồ, Hà Nội, Việt Nam	\N	21.060710021884287	105.8046628664802	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b61a400c-66c5-4d69-984b-66a68212a46c	Trước Đường Vào Bãi An Dương - Yên Phụ 50M	Yên Phụ, Ba Đình, Hà Nội, Việt Nam	\N	21.05004536933615	105.84073962615557	bus	\N	0.0	0	2026-03-23 23:42:18.419039
c6635472-9f50-4ccb-99a8-287965b73ec9	Công Viên Nước Hồ Tây	Nhật Tân, Tây Hồ, Hà Nội, Việt Nam	\N	21.075871205901322	105.81600130037228	bus	\N	0.0	0	2026-03-23 23:42:18.419039
46ec7389-7926-4b60-b9a7-c6caed530bcc	Chùa Trấn Quốc - Thanh Niên	Thanh Niên, Yên Phụ, Tây Hồ, Hà Nội, Việt Nam	\N	21.04791134361903	105.83767181245149	bus	\N	0.0	0	2026-03-23 23:42:18.419039
6ae6d0d3-7007-47a5-ba6c-0614dbb663e3	Trước Số Nhà 115 - 117 Nghi Tàm	Yên Phụ, Tây Hồ, Hà Nội, Việt Nam	\N	21.053728188518804	105.83731581994954	bus	\N	0.0	0	2026-03-23 23:42:18.419039
07c9ab12-6d19-43da-8e44-9aad2ac993f9	35	QL23, Mê Linh, Hà Nội, Việt Nam	\N	21.161551289300668	105.74679989957252	bus	\N	0.0	0	2026-03-23 23:42:18.419039
522accd2-0eee-497c-b588-d65ffe901c97	Trước 60M Đường Vào Làng Đông Cao - Đê Tả Sông Hồng	Hạ Lôi, Tráng Việt, Mê Linh, Hà Nội, Việt Nam	\N	21.15078501215726	105.73668047073738	bus	\N	0.0	0	2026-03-23 23:42:18.419039
46a6c039-193a-4319-aeeb-e596e17ca2bf	Qua Cổng Trường THPT Tiền Phong 70M	Trung Hậu Đoài, Tiền Phong, Mê Linh, Hà Nội, Việt Nam	\N	21.158468005559108	105.74891327073743	bus	\N	0.0	0	2026-03-23 23:42:18.419039
a41d6246-5fa4-43ab-ad3c-424cffb5e0d5	Đền Thờ Hai Bà Trưng - QL23	Mê Linh, Hà Nội, Việt Nam	\N	21.1631304842723	105.74560632840767	bus	\N	0.0	0	2026-03-23 23:42:18.419039
fff2656e-7016-4758-beca-77d9b7672414	Đối Diện Đường Vào Đền Hai Bà Trưng 20M - QL23B	Mê Linh, Hà Nội, Việt Nam	\N	21.162690252899665	105.74603548181153	bus	\N	0.0	0	2026-03-23 23:42:18.419039
9146d3da-5853-4438-98ef-33b4e5d5242c	Đối Diện Cột Mốc Km40 Bala - QL21B	Thanh Bồ, Lưu Quang, Ứng Hòa, Hà Nội, Việt Nam	\N	20.64310352985408	105.8076336015283	bus	\N	0.0	0	2026-03-23 23:42:18.419039
73ce2030-4538-4c79-8fe6-2a71b4dbc7ee	Qua Đối Diện Đường Vào Trường THPT Lưu Hoàng 50M QL21B	Lưu Quang, Ứng Hòa, Hà Nội, Việt Nam	\N	20.646223090534797	105.8031791898118	bus	\N	0.0	0	2026-03-23 23:42:18.419039
24f955b7-25c2-4f7a-b52d-2354bff631d6	Nhà Thờ Họ Vương - Đường 419	Đục Khê, Hương Sơn, Mỹ Đức, Hà Nội, Việt Nam	\N	20.61535760844388	105.78533045366508	bus	\N	0.0	0	2026-03-23 23:42:18.419039
692d9f34-f5b3-4024-a7a3-308b063dc5c8	Qua 200M Đối Diện Điện Máy Xanh	Hội Xá, Hương Sơn, Mỹ Đức, Hà Nội, Việt Nam	\N	20.617130599641616	105.78340926689265	bus	\N	0.0	0	2026-03-23 23:42:18.419039
12bc52aa-fb9f-4541-bff5-6e706f1806f7	Bến xe chùa Hương	Đục Khê, Mỹ Đức, Hà Nội, Việt Nam	\N	20.612978279354273	105.78733050729407	bus	\N	0.0	0	2026-03-23 23:42:18.419039
fff1fc14-5d03-4cef-830c-9110443f724c	Đối Diện UBND Xã Sài Sơn - Quốc Oai	Sài Sơn, Quốc Oai, Hà Nội, Việt Nam	\N	21.02336082548973	105.64643275197847	bus	\N	0.0	0	2026-03-23 23:42:18.419039
3508e6f1-f7f4-4c76-b2b5-22e1d02b7d9f	UBND Xã Sài Sơn - Quốc Oai	Sài Sơn, Quốc Oai, Hà Nội, Việt Nam	\N	21.023794904026797	105.64648196198031	bus	\N	0.0	0	2026-03-23 23:42:18.419039
0f1ef184-3454-4a2f-8811-313a30b211f8	Trường THCS Sài Sơn - Quốc Oai - Tỉnh Lộ 421B	Sài Sơn, Quốc Oai, Hà Nội, Việt Nam	\N	21.029582079911236	105.64468832210545	bus	\N	0.0	0	2026-03-23 23:42:18.419039
e924d8f2-c576-422f-8a14-5266feb932a7	Đối Diện Thạch Cao Sơn Trang - TL 422 - Sài Sơn	Sài Sơn, Quốc Oai, Hà Nội, Việt Nam	\N	21.036003730123465	105.64850248655193	bus	\N	0.0	0	2026-03-23 23:42:18.419039
737a2086-8be5-406e-b67a-a11e859bfe69	Đối Diện Gần Cửa Xóm Chân Sông - TL 422	Sài Sơn, Quốc Oai, Hà Nội, Việt Nam	\N	21.03655864749244	105.65369598197101	bus	\N	0.0	0	2026-03-23 23:42:18.419039
66d32dda-4451-46fe-8c68-4c93a05eb5e9	236 Âu Cơ Gần Ngã 3 Xuân Diệu - Quảng Bá	Quảng An, Tây Hồ, Hà Nội, Việt Nam	\N	21.069802311374378	105.82605321133894	bus	\N	0.0	0	2026-03-23 23:42:18.419039
c849e789-44d1-41a1-a130-1343ada1bc24	312 Lạc Long Quân - Chùa Thiên Niên (Chùa Sài)	Xuân La, Tây Hồ, Hà Nội, Việt Nam	\N	21.062123677970266	105.80937018082554	bus	\N	0.0	0	2026-03-23 23:42:18.419039
206d81f7-3d87-4047-a576-0dd9728b5dfa	Gần Ngã 3 Xuân La 40M - Lạc Long Quân (Hồ Tây)	Xuân La, Tây Hồ, Hà Nội, Việt Nam	\N	21.059406134055653	105.80891036170827	bus	\N	0.0	0	2026-03-23 23:42:18.419039
03c0cdcf-c4b3-4b4f-9ebe-6393301914ad	196 Lạc Long Quân - Trường Mầm Non Hoa Hồng	Bưởi, Tây Hồ, Hà Nội, Việt Nam	\N	21.052821159535146	105.80916241146059	bus	\N	0.0	0	2026-03-23 23:42:18.419039
94b6184d-c0c9-4bce-b2dd-908167e3472e	256 Thụy Khuê - Gần Trường Tiểu Học Chu Văn An	Thụy Khuê, Tây Hồ, Hà Nội, Việt Nam	\N	21.043438594842243	105.81753388282912	bus	\N	0.0	0	2026-03-23 23:42:18.419039
9f26770f-4fbf-4036-8c76-aa658c43517d	Dải Giữa Điểm Trung Chuyển Cầu Giấy - Nhà Ga S8-01	Ngọc Khánh, Đống Đa, Hà Nội, Việt Nam	\N	21.029150063391903	105.80325911899911	bus	\N	0.0	0	2026-03-23 23:42:18.419039
cc674f9e-5451-4a8c-b922-c63c1ac315e7	Công Viên Thủ Lệ - Đường Bưởi Tránh Mới (Gần Ngõ 32 Đường Bưởi)	Ngọc Khánh, Ba Đình, Hà Nội, Việt Nam	\N	21.031570764724492	105.80352608892181	bus	\N	0.0	0	2026-03-23 23:42:18.419039
8f909e2c-5fdc-4e3a-840f-fe6c1a307574	Nguyễn Công Hoan	24 P. Nguyễn Công Hoan, Ngọc Khánh, Ba Đình, Hà Nội, Việt Nam	\N	21.02729839285702	105.81492533986555	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b39154e8-b655-43ac-b953-c0da9cd1deab	Đối Diện Công Viên Thủ Lệ - Đường Bưởi Dưới	Ngọc Khánh, Ba Đình, Hà Nội, Việt Nam	\N	21.03145737407249	21.03145737407249	bus	\N	0.0	0	2026-03-23 23:42:18.419039
5fe72c94-2589-46a3-bc23-cd9695c525a2	Ngõ 9 - Đào Tấn (Công Viên Thủ Lệ) - Ngọc Khánh	Ngọc Khánh, Ba Đình, Hà Nội, Việt Nam	\N	21.032376952633385	105.80870823415069	bus	\N	0.0	0	2026-03-23 23:42:18.419039
2cecbd0d-f313-4b76-a46c-ca9017f2367b	Số 325 Âu Cơ	327 Đ. Âu Cơ, Nhật Tân, Tây Hồ, Hà Nội, Việt Nam	\N	21.073468047990918	105.82486871016316	bus	\N	0.0	0	2026-03-23 23:42:18.419039
cc091015-e6c2-4e51-8cd8-2eaac3f22dfa	Đình Nhật Tân - Âu Cơ	Đ. Âu Cơ, Nhật Tân, Tây Hồ, Hà Nội, Việt Nam	\N	21.076283740883238	21.076283740883238	bus	\N	0.0	0	2026-03-23 23:42:18.419039
5408d7dd-8103-48c9-9741-69bc216037de	Ga Cát Linh	Cát Linh, Đống Đa, Hà Nội, Việt Nam	\N	21.018273	105.82402	metro	\N	0.0	0	2026-03-23 23:44:37.682189
fbe6d525-8db5-4e12-8f73-fc891e331d94	523 Âu Cơ (Qua Ngã 3 Lạc Long Quân)	Nhật Tân, Tây Hồ, Hà Nội, Việt Nam	\N	21.08042099466926	105.8184224884852	bus	\N	0.0	0	2026-03-23 23:42:18.419039
f32c1b75-1113-498d-b5b3-09e5c1ca05ae	236 Âu Cơ Gần Ngã 3 Xuân Diệu - Quảng Bá	Quảng An, Tây Hồ, Hà Nội, Việt Nam	\N	21.069989082978505	105.82609876610324	bus	\N	0.0	0	2026-03-23 23:42:18.419039
1afb72e7-d3f5-4b15-872d-55af5db91bb6	8 An Dương Vương	Phú Thượng, Tây Hồ, Hà Nội, Việt Nam	\N	21.084274069636404	105.81679374785686	bus	\N	0.0	0	2026-03-23 23:42:18.419039
33a6e892-16ad-44e9-abe0-2e65caccd700	Đối Diện Ngõ 58 An Dương Vương	Phú Xá, Phú Thượng, Tây Hồ, Hà Nội, Việt Nam	\N	21.08689100394186	105.81572748793859	bus	\N	0.0	0	2026-03-23 23:42:18.419039
9224369c-0477-4931-95e2-1f1a082ecd69	Trước 50M Ngõ 689 Lạc Long Quân - Đường Võ Chí Công	Phú Thượng, Tây Hồ, Hà Nội, Việt Nam	\N	21.079775430204673	105.81394266144339	bus	\N	0.0	0	2026-03-23 23:42:18.419039
80955ed2-45d6-49ef-ac08-c4986fcce2f6	Hà Nội Lotte Mall Tây Hồ	Khu đô thị Ciputra, Phú Thượng, Tây Hồ, Hà Nội, Việt Nam	\N	21.07655276339254	105.8119492186796	bus	\N	0.0	0	2026-03-23 23:42:18.419039
05e1e4e0-b7bf-425d-8162-9dbae90f5510	Đối Diện KĐT Nam Thăng Long	Phú Thượng, Tây Hồ, Hà Nội, Việt Nam	\N	21.074519635690343	105.81099885657852	bus	\N	0.0	0	2026-03-23 23:42:18.419039
7a3c95e3-5781-4f06-9948-6d2c3612edf4	Đối Diện Trước 100M Cty TNHH Thương Mại Công Nghệ Và Môi Trường Nhật Anh	Nam Sơn, Sóc Sơn, Hà Nội, Việt Nam	\N	21.304642803489887	105.81701288412295	bus	\N	0.0	0	2026-03-23 23:42:18.419039
34ff0aba-f394-4e7c-869f-186b0b53c90a	Cty TNHH Thương Mại Công Nghệ Và Môi Trường Nhật Anh (Cột Mốc H8/5 Tỉnh Lộ 35)	Nam Sơn, Sóc Sơn, Hà Nội, Việt Nam	\N	21.304335184981863	105.81675448097376	bus	\N	0.0	0	2026-03-23 23:42:18.419039
09b4cb37-5d8e-4036-8fe4-33bd555f8b05	Đối Diện Cửa Hàng Xăng Dầu Bích Hồng ( Trước 100M)	QUẢNG LẠC, Hồng Kỳ, Sóc Sơn, Hà Nội, Việt Nam	\N	21.33154630000001	105.84525355901918	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b9e650b6-9d4e-45b1-ab87-1290b6b2842f	Gần Ngã 3 Phố Thanh Trì - Đường Vào Đền Gióng	Phù Linh, Sóc Sơn, Hà Nội, Việt Nam	\N	21.28375495564055	105.84013739907942	bus	\N	0.0	0	2026-03-23 23:42:18.419039
58df3a8d-0997-481b-b68d-5bbbf055f16b	Đối Diện Trường Tiểu Học Xã Nam Sơn - Tỉnh Lộ 35	Thanh Hà, Nam Sơn, Sóc Sơn, Hà Nội, Việt Nam	\N	21.294532261258656	105.81144664994356	bus	\N	0.0	0	2026-03-23 23:42:18.419039
0438f3da-6999-44ba-9f6e-8243f65cd555	Đối Diện CĐ Cộng Đồng Hà Tây - Đường Hồ Chí Minh	Thủy Xuân Tiên, Chương Mỹ, Hà Nội, Việt Nam	\N	20.863276897001256	105.57985749658023	bus	\N	0.0	0	2026-03-23 23:42:18.419039
7fd70012-e220-4ea8-8fd7-e0b7386801ff	Đối Diện Cửa Hàng Vật Liệu Xuân Cường Thôn Đồng Tiến - Đường Hồ Chí Minh	Tân Tiến, Chương Mỹ, Hà Nội, Việt Nam	\N	20.85148677638449	105.60373858835433	bus	\N	0.0	0	2026-03-23 23:42:18.419039
980a5833-a585-423f-85dc-ba7d9af9461f	Đối Diện Lối Vào Xóm Quyết Tiến Thôn Nam Sơn - Đường Hồ Chí Minh - Nam Phương Tiến B	Nam Phương Tiến B, Chương Mỹ, Hà Nội, Việt Nam	\N	20.852243858645725	105.60037142946076	bus	\N	0.0	0	2026-03-23 23:42:18.419039
a80ea20f-4820-4f1e-858a-16281f201151	Đầu B Xuân Mai (Trường Cđ Cộng Đồng Hà Tây)	Thủy Xuân Tiên, Chương Mỹ, Hà Nội, Việt Nam	\N	20.863264601518708	105.57974737720473	bus	\N	0.0	0	2026-03-23 23:42:18.419039
bf245b1c-881f-4e94-9bcf-1d1090e47b60	Trước Đối Diện Cổng Cụm Dân Cư Số 6 Xóm Cầu Vai Bò - Đồng Tiến - Tân Tiến	Đồng Tiến, Tân Tiến, Chương Mỹ, Hà Nội, Việt Nam	\N	20.850611829517668	105.60873775226896	bus	\N	0.0	0	2026-03-23 23:42:18.419039
9f33c9f7-0627-4762-ba7e-48741c8f97ae	Trước Cầu Bài Văn - Đá Chông 50M	Xóm Đá Chông, Minh Quang, Ba Vì, Hà Nội, Việt Nam	\N	21.113007393319688	105.33468245645071	bus	\N	0.0	0	2026-03-23 23:42:18.419039
79a47603-7c7c-4400-8de8-bb94ee7f5b0a	Đối Diện Nghĩa Trang Liệt Sĩ Đá Chông	Xóm Đá Chông, Ba Vì, Hà Nội, Việt Nam	\N	21.110124880391393	105.3413772495511	bus	\N	0.0	0	2026-03-23 23:42:18.419039
bcfbb7c4-7fc4-44d5-a4db-d46988d72f8f	Chợ Chiều Ba Trại (Tạp Hóa Kim Lan)	Ba Vì, Hà Nội, Việt Nam	\N	21.11344655169395	105.35620867043733	bus	\N	0.0	0	2026-03-23 23:42:18.419039
74ef22f8-b72e-4e61-96f0-66c4513a5145	(B) Minh Quang (Ba Vì)	Đồng Tâm, Minh Quang, Ba Vì, Hà Nội, Việt Nam	\N	21.071156253650855	105.3200740982909	bus	\N	0.0	0	2026-03-23 23:42:18.419039
af6318f8-2dc5-412a-b994-4706a1f1c558	Trước Cầu Kìm 50M (Trước Biển Tải Trọng Cầu)	Tản Lĩnh, Ba Vì, Hà Nội, Việt Nam	\N	21.123365152435536	105.39464423029952	bus	\N	0.0	0	2026-03-23 23:42:18.419039
d6f41d48-9d68-49c8-a9f4-2ff71872b5a6	Bảo Tàng Dân Tộc Học Việt Nam - Nguyễn Văn Huyên	Quan Hoa, Cầu Giấy, Hà Nội, Việt Nam	\N	21.040957201996246	105.79781013165811	bus	\N	0.0	0	2026-03-23 23:42:18.419039
97bc00d1-bf11-4d29-be2c-7cc4e535e34a	(B) Công Viên Nghĩa Đô	Quan Hoa, Cầu Giấy, Hà Nội, Việt Nam	\N	21.039995904801582	105.79745608009992	bus	\N	0.0	0	2026-03-23 23:42:18.419039
22bef542-5a19-4d0c-b103-1e0991bce963	Điểm Trung Chuyển Cầu Giấy - GTVT 01	Láng Thượng, Đống Đa, Hà Nội, Việt Nam	\N	21.02849195704921	105.80385257680994	bus	\N	0.0	0	2026-03-23 23:42:18.419039
e5d0cd6d-ea37-467c-b223-061321bbca80	Ngõ 9 - Đào Tấn (Công Viên Thủ Lệ) - Ngọc Khánh	Ngọc Khánh, Ba Đình, Hà Nội, Việt Nam	\N	21.032347857826533	105.8087099995725	bus	\N	0.0	0	2026-03-23 23:42:18.419039
e7bc5f61-1213-4320-bd41-b206e433ff4d	250 - 252 Cầu Giấy - Dịch Vọng	Dịch Vọng, Cầu Giấy, Hà Nội, Việt Nam	\N	21.03496398408117	105.79446496094491	bus	\N	0.0	0	2026-03-23 23:42:18.419039
e8f4a53c-d4be-43e9-a665-e76d22ab5ddf	Vườn Hoa Trần Quang Khải (Đối Diện BQL Xây Dựng Công Trình Công Ích)	French Quarter, Tràng Tiền, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.025298124641687	105.8596166072013	bus	\N	0.0	0	2026-03-23 23:42:18.419039
3424bc93-4d81-440e-8ea5-6881f4607a0e	Đối Diện Số 1A Tràng Tiền - Tập Đoàn Hóa Chất Việt Nam - Tràng Tiền	Tràng Tiền, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02469725148184	105.85869392722411	bus	\N	0.0	0	2026-03-23 23:42:18.419039
f20c1e6e-8f18-4c55-a6e9-a825c6397144	15D Đ. Trần Khánh Dư - Phan Chu Trinh	15C Trần Khánh Dư, Phan Chu Trinh, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.023515527196476	105.86071094822232	bus	\N	0.0	0	2026-03-23 23:42:18.419039
41e5f8c2-71c7-4ceb-9545-742cbeb77103	Bệnh Viện Xanhpon	Điện Biên, Ba Đình, Hà Nội, Việt Nam	\N	21.031034734506175	105.83605402738321	bus	\N	0.0	0	2026-03-23 23:42:18.419039
3d298103-7b8b-4279-935d-8927a5bb3cd8	40 Ngô Quyền - TT Giao Dịch Công Nghệ	Hàng Bài, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02270239677192	105.85427901966683	bus	\N	0.0	0	2026-03-23 23:42:18.419039
5d298c76-5326-4340-a04b-64c7e1488a33	Đối Diện 39 Lý Thường Kiệt	Hàng Bài, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.022991945891093	105.85168722205407	bus	\N	0.0	0	2026-03-23 23:42:18.419039
9da58c39-8f62-422b-8ead-6dbc07256528	Đối Diện 6C Phan Chu Trinh	Đối diện 6C P. Phan Chu Trinh, Tràng Tiền, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02364289915439	105.85682633406543	bus	\N	0.0	0	2026-03-23 23:42:18.419039
6a2be022-429a-48d3-a3a1-2469c3e8dd4a	83A Trần Xuân Soạn	85 P. Trần Xuân Soạn, Ngô Thì Nhậm, Hai Bà Trưng, Hà Nội, Việt Nam	\N	21.01668645467012	105.85166287073744	bus	\N	0.0	0	2026-03-23 23:42:18.419039
d69258f7-4967-49a1-90e5-73c8d58a4d64	Trần Nhật Duật (373 Hồng Hà) - Gần Hàm Tử Quan - Phúc Tân	Phúc Tân, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.03771427459602	105.85297727461992	bus	\N	0.0	0	2026-03-23 23:42:18.419039
dfdd2c6d-ca60-4c6b-a18e-97f6ade985a7	26 Trần Nhật Duật	Phố cổ Hà Nội, Đồng Xuân, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.0387589501842	105.85157373039912	bus	\N	0.0	0	2026-03-23 23:42:18.419039
3f4d5ef4-c84a-4057-ad99-aba425e5bb19	Hanoi St. Joseph Cathedral Bus Station	Hàng Trống, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.029181517546455	105.85001986765346	bus	\N	0.0	0	2026-03-23 23:42:18.419039
3377c8d3-54ce-4bc7-a542-db19b5509270	Ha Thanh Trading & Travel Transport Co.,Ltd	128, Hang Trong Street, Hang Trong Ward, Hoan Kiem District, Ha Noi City, Việt Nam	\N	21.029664212168875	105.85043413332555	bus	\N	0.0	0	2026-03-23 23:42:18.419039
18a871ce-78b5-4bdd-af52-890242420a19		Yên Bài, Ba Vì, Hà Nội	\N	21.0728	105.3702	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
bfe7be6b-4025-4024-8da5-6d39afd5bcc6	6-8 Tràng Thi (Qua Ngã 4 Tràng Thi - Lý Quốc Sư)	Hàng Trống, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.026544922851873	105.84955394829683	bus	\N	0.0	0	2026-03-23 23:42:18.419039
478e44b6-ed6b-4eb7-833c-47c516f98e8e	Bệnh Viện Việt Đức - Đối Diện Số 10 Quán Sứ	Hàng Bông, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.029356961731153	105.84649834672537	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b3ed1a08-b799-41ca-8ae3-f372a13fdabf	Bệnh Viện Việt Đức - 40 Tràng Thi	40 P. Tràng Thi, Hàng Bông, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.027399895157735	105.84661999831037	bus	\N	0.0	0	2026-03-23 23:42:18.419039
cfeea242-5a51-4ab5-bd03-78c95088a717	28 Đường Thành	Phố cổ Hà Nội, Cửa Đông, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.031037100004482	105.84704141319808	bus	\N	0.0	0	2026-03-23 23:42:18.419039
01c58fd7-22be-436d-8033-537efb1051a8	56 Hàng Cân	Phố cổ Hà Nội, Hàng Đào, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.03414987038241	105.84981523855413	bus	\N	0.0	0	2026-03-23 23:42:18.419039
31645ff0-cc7d-4dd0-aa64-fba7bb2777fc	Xe An Long Happy Bus	Số 2 P. Trần Nguyên Hãn, Lý Thái Tổ, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02905088571996	105.85712407073741	bus	\N	0.0	0	2026-03-23 23:42:18.419039
fff22e22-fc26-4f61-97f1-e7f852ddf8f1	Hà Nội Trần Nguyên Hãn	French Quarter, Lý Thái Tổ, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.028874055849297	105.85664127315809	bus	\N	0.0	0	2026-03-23 23:42:18.419039
247df604-3cc2-4e0a-b923-9f865ce62f82	KS Melia (Lý Thường Kiệt)	Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.024170493946954	105.8478928423639	bus	\N	0.0	0	2026-03-23 23:42:18.419039
e7bdcaa9-c75d-46f7-8491-867aff0071e6	44 Lý Thường Kiệt - Viện Kiểm Sát Nhân Dân Tối Cao	Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.023781834825318	105.84904383458134	bus	\N	0.0	0	2026-03-23 23:42:18.419039
d4b1bd49-f874-4626-8260-c541b4158594	48 Hai Bà Trưng - Viện Kiểm Nghiệm Thuốc Trung Ương	Tràng Tiền, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.02499643456331	105.85047389376004	bus	\N	0.0	0	2026-03-23 23:42:18.419039
b238d91a-8173-48de-8bc7-28df24ecf091	37 Hai Bà Trưng - Bệnh Viện Việt Nam Cu Ba	Tràng Tiền, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.024930293246715	105.85011315815932	bus	\N	0.0	0	2026-03-23 23:42:18.419039
3618db0d-20b9-4306-8c25-dabcd73f2a30	Đối Diện Trung Tâm Giải Trí Ngôi Sao Xanh (Hồ Thiền Quang) - Trần Nhân Tông	Nguyễn Du, Hai Bà Trưng, Hà Nội, Việt Nam	\N	21.017266931143713	105.8457287472464	bus	\N	0.0	0	2026-03-23 23:42:18.419039
9b471028-db7c-472a-ba3c-8c58125e6c0b	Công Viên Thống Nhất - Trần Nhân Tông	Nguyễn Du, Hai Bà Trưng, Hà Nội, Việt Nam	\N	21.017206840699682	105.84498845762472	bus	\N	0.0	0	2026-03-23 23:42:18.419039
62e018ed-93f4-4aba-b537-75a0e530a3fb	Đối Diện 52 Nguyễn Du	Nguyễn Du, Hai Bà Trưng, Hà Nội, Việt Nam	\N	21.01926955451392	105.846171676688	bus	\N	0.0	0	2026-03-23 23:42:18.419039
0670ae4b-f34b-49c1-a172-6fccb6bebe1e	84 Nguyễn Du	84 Nguyễn Du, Trần Hưng Đạo, Hai Bà Trưng, Hà Nội, Việt Nam	\N	21.020100792008375	105.84344655257341	bus	\N	0.0	0	2026-03-23 23:42:18.419039
18856086-d1f8-4a18-994d-232f0281549e	Đối Diện 28 Trần Bình Trọng - Hồ Thiền Quang	Nguyễn Du, Hai Bà Trưng, Hà Nội, Việt Nam	\N	21.018588537209645	105.84401518083354	bus	\N	0.0	0	2026-03-23 23:42:18.419039
21dda9cc-3844-42f2-b5e6-82aa4b632cfc	Biển Báo KĐT Eco Park - Đường Dẫn Cầu Thanh Trì	Gamuda Central, Hoàng Liệt, Hoàng Mai, Hà Nội, Việt Nam	\N	20.96517296483214	105.85206375634831	bus	\N	0.0	0	2026-03-23 23:42:18.419039
4398bca0-e148-4459-93ab-e3ad608051a2	Đường Vào KĐT Gamuda	Gamuda Central, Yên Sở, Hoàng Mai, Hà Nội, Việt Nam	\N	20.964180660235403	105.85821194995702	bus	\N	0.0	0	2026-03-23 23:42:18.419039
67547b2a-e469-4911-b923-2e30746337fa	Khu Tái Định Cư X2A	KHU TÁI ĐỊNH CƯ X2A, Yên Sở, Hoàng Mai, Hà Nội 10000, Việt Nam	\N	20.963448153039653	105.86360684573381	bus	\N	0.0	0	2026-03-23 23:42:18.419039
130ba4fa-61ca-4b93-99c3-51b9403b984c	Số 1 Trần Thủ Độ	Hoàng Liệt, Hoàng Mai, Hà Nội, Việt Nam	\N	20.965641636479276	105.84502024735536	bus	\N	0.0	0	2026-03-23 23:42:18.419039
1bc5c91d-21e7-4136-aed6-0cdd58f528ad	Qua Lối Rẽ Khu Hành Chính Quận Hoàng Mai - Đường Pháp Vân - Hoàng Liệt	Pháp Vân, Hoàng Liệt, Hoàng Mai, Hà Nội, Việt Nam	\N	20.96589718585414	105.8445413288774	bus	\N	0.0	0	2026-03-23 23:42:18.419039
5f3bb8fa-1269-4794-8e1f-2f21227e0f55	Điểm Đỗ Xe Buýt Bát Tràng	Bát Tràng, Gia Lâm, Hà Nội, Việt Nam	\N	20.97462906207434	105.91273499774647	bus	\N	0.0	0	2026-03-23 23:42:18.419039
beba29fd-27a3-4b26-b0c1-19a8dfec054f	Ngã 3 Bến Phà Đường Lâm	Đường Lâm, Sơn Tây, Hà Nội, Việt Nam	\N	21.156563551316	105.47712583666731	bus	\N	0.0	0	2026-03-23 23:42:18.419039
a504b427-9249-43c8-8b34-928847a9eb52	Phố Mía	Đường Lâm, Sơn Tây, Hà Nội, Việt Nam	\N	21.16363988935682	105.4709704540761	bus	\N	0.0	0	2026-03-23 23:42:18.419039
84e608dc-0fcc-4061-a266-f1f9296ad137	Lối Rẽ Cầu Vĩnh Thịnh	Đường Lâm, Sơn Tây, Hà Nội, Việt Nam	\N	21.15497965752514	105.48290940050283	bus	\N	0.0	0	2026-03-23 23:42:18.419039
ebd8fd82-69cc-492b-981f-b52ea723fbb0	Gần Điếm Canh Đê 28	Đường Lâm, Sơn Tây, Hà Nội, Việt Nam	\N	21.1596175277377	105.48045258038371	bus	\N	0.0	0	2026-03-23 23:42:18.419039
95707a2b-b7f3-4e9b-870e-1615075e91b8	Cty Hóa Dệt Hà Tây - Chi Nhánh 2	Ba Vì, Hà Nội, Việt Nam	\N	21.17172639427372	105.45602625840212	bus	\N	0.0	0	2026-03-23 23:42:18.419039
1848bd0b-c395-49df-a599-2ac28b379634	Ga La Thành	La Thành, Đống Đa, Hà Nội, Việt Nam	\N	21.020068	105.825325	metro	\N	0.0	0	2026-03-23 23:44:37.682189
1cd56c21-6aac-4f1d-96a1-7388d4e0e0bb	Ga Thái Hà	Thái Hà, Đống Đa, Hà Nội, Việt Nam	\N	21.014443	105.819412	metro	\N	0.0	0	2026-03-23 23:44:37.682189
2864b118-9fab-4973-9ab9-15d5e27af187	Ga Láng	Ngã Tư Sở, Đống Đa, Hà Nội, Việt Nam	\N	21.00553	105.80912	metro	\N	0.0	0	2026-03-23 23:44:37.682189
64295f15-0ba5-4f70-bd68-e3a765af11fd	Ga Thượng Đình	Thượng Đình, Thanh Xuân, Hà Nội, Việt Nam	\N	20.9985	105.8049	metro	\N	0.0	0	2026-03-23 23:44:37.682189
5a7be36b-7a07-421d-b753-16d25aee91eb	Ga Vành Đai 3	Nguyễn Trãi, Thanh Xuân, Hà Nội, Việt Nam	\N	20.991092	105.802734	metro	\N	0.0	0	2026-03-23 23:44:37.682189
d7329e5b-12f5-4e72-99fa-fab7c874dac4	Ga Phùng Khoang	Phùng Khoang, Nam Từ Liêm, Hà Nội, Việt Nam	\N	20.984131	105.793074	metro	\N	0.0	0	2026-03-23 23:44:37.682189
bedb0c2e-b3d8-4486-8b7a-a53290154cee	Ga Văn Quán	Văn Quán, Hà Đông, Hà Nội, Việt Nam	\N	20.97676	105.78565	metro	\N	0.0	0	2026-03-23 23:44:37.682189
180ec76f-e98a-4d37-85a7-88c55ecd0a8d	Ga Hà Đông	Quang Trung, Hà Đông, Hà Nội, Việt Nam	\N	20.970128	105.774927	metro	\N	0.0	0	2026-03-23 23:44:37.682189
651c37ac-d7b1-4f3c-953e-48382012a377	Ga La Khê	Phú Lương, Hà Đông, Hà Nội, Việt Nam	\N	20.955546	105.75615	metro	\N	0.0	0	2026-03-23 23:44:37.682189
a12ed19a-355f-49a6-8d39-ef22e4aa4d65	Ga Văn Khê	Văn Khê, Hà Đông, Hà Nội, Việt Nam	\N	20.953	105.7529	metro	\N	0.0	0	2026-03-23 23:44:37.682189
0e46d70b-ee27-4b24-a61f-571386d46ddf	Ga Yên Nghĩa	Yên Nghĩa, Hà Đông, Hà Nội, Việt Nam	\N	20.949671	105.748379	metro	\N	0.0	0	2026-03-23 23:44:37.682189
762e5b2a-c6d1-42a0-895c-9c667bac57f7	Ga Nhổn	Nhổn, Bắc Từ Liêm, Hà Nội, Việt Nam	\N	21.071806	105.743562	metro	\N	0.0	0	2026-03-23 23:44:37.682189
71c5641d-5d80-480e-9b93-daf70d51fe47	Ga Minh Khai	Minh Khai, Bắc Từ Liêm, Hà Nội, Việt Nam	\N	21.066453	105.746629	metro	\N	0.0	0	2026-03-23 23:44:37.682189
3e34b069-0e4d-4de2-a895-74c28da4c4a0	Ga Phú Diễn	Phú Diễn, Bắc Từ Liêm, Hà Nội, Việt Nam	\N	21.06204	105.748897	metro	\N	0.0	0	2026-03-23 23:44:37.682189
b37a94b0-9ab3-4812-bb0e-b39c44819814	Ga Cầu Diễn	Cầu Diễn, Nam Từ Liêm, Hà Nội, Việt Nam	\N	21.058701	105.754007	metro	\N	0.0	0	2026-03-23 23:44:37.682189
3900068a-54e6-48d3-96fe-6e13d8b5f50f	Ga Lê Đức Thọ	Lê Đức Thọ, Nam Từ Liêm, Hà Nội, Việt Nam	\N	21.05354	105.76021	metro	\N	0.0	0	2026-03-23 23:44:37.682189
4d47cb91-c381-41d8-ba56-d7dc50189a1c	Ga Đại Học Quốc Gia	Cầu Giấy, Hà Nội, Việt Nam	\N	21.038501	105.781302	metro	\N	0.0	0	2026-03-23 23:44:37.682189
2f54c68b-13ef-46bb-a788-8677f1dc94ef	Ga Chùa Hà	Cầu Giấy, Hà Nội, Việt Nam	\N	21.03395	105.787114	metro	\N	0.0	0	2026-03-23 23:44:37.682189
33e5f37c-b658-405d-aa47-91cbab1cf0f8	Ga Cầu Giấy	Cầu Giấy, Hà Nội, Việt Nam	\N	21.032316	105.794651	metro	\N	0.0	0	2026-03-23 23:44:37.682189
afcd896e-6462-4060-8ee6-a4a3fc04c6a1	Ga Kim Mã	Kim Mã, Ba Đình, Hà Nội, Việt Nam	\N	21.03323	105.81208	metro	\N	0.0	0	2026-03-23 23:44:37.682189
0dff6487-9199-40b2-8978-80693f266b9d	Ga Hà Nội (Metro)	Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Việt Nam	\N	21.024505	105.841171	metro	\N	0.0	0	2026-03-23 23:44:37.682189
e13ebe07-79a7-4817-b52a-118c81c452b1	Highlands Coffee Hồ Gươm	1-3 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.028341	105.852531	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
1e80b365-8abf-4936-833b-430847f8e46e	Starbucks Reserve Nhà Thờ	6 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.025021	105.851921	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
02c6b936-54f1-4ad6-94af-1880dc2ff2be	Cộng Cà Phê Nhà Thờ	27 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.024741	105.857521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3cb6ead9-5743-4365-96d6-6b5d9ef3ad90	The Coffee House Lý Thường Kiệt	54 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội	\N	21.027221	105.847641	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c4fbea37-6e7d-47ca-aac3-f9c68d92818a	AHA Cafe Hàng Gai	60 Hàng Gai, Hoàn Kiếm, Hà Nội	\N	21.031421	105.850312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
8e2a8c4c-6381-42a8-a8bc-7a5e12b5cbd3	Highlands Coffee Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.024521	105.857312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6abf0818-dddf-47c0-b301-de1ef9507707	Starbucks Tràng Tiền	32 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.024631	105.857421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
084756ce-4ab5-493a-93fa-d1f97ea450e7	Cộng Cà Phê Tràng Tiền	11 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.024852	105.857631	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
72b30dd6-9335-4a67-9955-edbf223c7e59	The Coffee House Tràng Tiền	30 Nhà Chung, Hoàn Kiếm, Hà Nội	\N	21.024961	105.857742	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
0e0b9a46-cec0-486f-8371-422e134020df	AHA Cafe Đinh Tiên Hoàng	8 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.028121	105.852221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
eefbab48-3fae-430b-933a-c205be59340a	Highlands Coffee Lotte Center	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.031521	105.813132	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
974fd1b2-4a89-4d8c-9f6d-443500a3345c	Starbucks Lotte Center	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.031632	105.813241	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
862118d4-63ce-4bfd-9d23-bbc8af18bd40	Cộng Cà Phê Liễu Giai	56 Liễu Giai, Ba Đình, Hà Nội	\N	21.031742	105.813351	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
0f46bdfd-95d0-4692-a8c3-8cc34cebfdfa	The Coffee House Liễu Giai	58 Liễu Giai, Ba Đình, Hà Nội	\N	21.031852	105.813462	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a7c1381e-0143-4e94-a620-f9468b76c67b	AHA Cafe Liễu Giai	60 Liễu Giai, Ba Đình, Hà Nội	\N	21.031961	105.813571	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
2a5a1e62-4a89-4996-b73d-69b76740a9cb	Highlands Coffee Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003211	105.816321	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
2b408899-8d64-4baa-abf7-4419e45b2dd3	Starbucks Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003421	105.816721	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6b6970a4-4643-4106-a946-fe1ebcb49eb7	The Coffee House Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003142	105.816512	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
0fab6450-dfb0-4dfb-be7f-4b343475ae28	Cộng Cà Phê Nguyễn Trãi	168 Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.004112	105.817212	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e9e8e249-017d-407c-a15b-5d98b4fb0c79	AHA Cafe Nguyễn Trãi	180 Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.004212	105.817312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c015484c-591c-4f1d-a8db-43a7f002155c	Highlands Coffee Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.995842	105.868112	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
26199519-1f5a-422b-a487-66ef3676b067	Starbucks Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.996012	105.868421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
5987d71d-b520-4c8d-bc22-b931f329bf5a	The Coffee House Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.995932	105.868312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
406d326a-d9a6-4c58-bf50-e10706a17404	Cộng Cà Phê Minh Khai	300 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.997132	105.867421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
d140153d-24b1-405a-941c-4818bef74b74	AHA Cafe Minh Khai	350 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.996542	105.867912	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
2ca189f6-fcb0-427a-bf03-830959714d1a	Highlands Coffee Vincom Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012421	105.851231	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ddbf5f2b-1d44-407b-ac0b-9fc21781309c	Starbucks Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012531	105.851341	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
b099693a-4c49-4a1f-8ab8-c293f5cd2f81	The Coffee House Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012641	105.851451	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ddd9a3bc-27b9-457a-96a0-bf6db6b93d8c	Cộng Cà Phê Bà Triệu	24 Bà Triệu, Hoàn Kiếm, Hà Nội	\N	21.012751	105.851561	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ce05bdf7-b272-40fc-9401-6de34104526a	AHA Cafe Bà Triệu	50 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012861	105.851671	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
94ad7023-0449-4c0b-a801-8ffdef3a54e9	Highlands Coffee Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024131	105.809561	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
8eed296e-5180-4adf-bb42-986321b4ad69	Starbucks Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024241	105.809671	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
0074e7e3-3952-4deb-9cd5-a0606a02c554	The Coffee House Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024351	105.809781	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
4ea917dc-59d2-4792-ba2e-d4c0c93a3e78	Cộng Cà Phê Nguyễn Chí Thanh	70 Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024461	105.809891	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
15f54f9c-55c0-4d55-9f89-6ab51a45424b	AHA Cafe Nguyễn Chí Thanh	80 Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024571	105.810001	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
894ffb07-bfc7-4937-89ab-483a79c587f3	Highlands Coffee Cầu Giấy	307 Cầu Giấy, Cầu Giấy, Hà Nội	\N	21.033912	105.790214	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6d5d394c-c91c-4c11-a45f-25427ad6dbc4	Starbucks Cầu Giấy	325 Cầu Giấy, Cầu Giấy, Hà Nội	\N	21.034012	105.790314	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6ecf37d6-94ad-4a9c-b5a5-f20a3711080f	The Coffee House Cầu Giấy	337 Cầu Giấy, Cầu Giấy, Hà Nội	\N	21.034112	105.790414	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6622f9f0-96e0-49ea-b0e1-f050b4991273	Cộng Cà Phê Cầu Giấy	356 Cầu Giấy, Cầu Giấy, Hà Nội	\N	21.034212	105.790514	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
38f51497-bb25-4157-82d8-e7b594772bcf	AHA Cafe Cầu Giấy	365 Cầu Giấy, Cầu Giấy, Hà Nội	\N	21.034312	105.790614	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e1e004eb-4f22-4728-8f2b-adddc969df1e	Highlands Coffee Duy Tân	98 Duy Tân, Cầu Giấy, Hà Nội	\N	21.038124	105.791312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3ad750a2-11c1-4daf-a1bc-2e9c15ca4a9f	Starbucks Duy Tân	100 Duy Tân, Cầu Giấy, Hà Nội	\N	21.038224	105.791412	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
39de2792-f53d-4472-af7c-8472ba057f09	The Coffee House Duy Tân	110 Duy Tân, Cầu Giấy, Hà Nội	\N	21.038324	105.791512	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c30d7e53-fa89-44e7-9d4a-17f251ed078e	Cộng Cà Phê Duy Tân	120 Duy Tân, Cầu Giấy, Hà Nội	\N	21.038424	105.791612	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
46920b99-ca56-4959-b626-18edb63014eb	AHA Cafe Duy Tân	130 Duy Tân, Cầu Giấy, Hà Nội	\N	21.038524	105.791712	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6e1e6390-362f-49fe-b91c-3ace1e0f7459	Highlands Coffee Xuân Diệu	30 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05531	105.82021	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c458c11b-5109-4338-b4dd-fed28ed2b963	Starbucks Xuân Diệu	28 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05541	105.82031	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
b695da02-d51a-4978-ad2f-e18800ad0268	The Coffee House Xuân Diệu	26 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05551	105.82041	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
9a060b4b-96ce-4e2b-aae7-372615e07329	Cộng Cà Phê Xuân Diệu	24 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05561	105.82051	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
9275862e-e325-4fac-938d-8aa46c18e4c4	AHA Cafe Xuân Diệu	22 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05571	105.82061	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ac5459af-966d-4fac-9768-1c2b33f41913	Highlands Coffee Láng Hạ	78 Láng Hạ, Đống Đa, Hà Nội	\N	21.018621	105.814214	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
02f56d6a-a299-4f9d-bad5-03776292f291	Starbucks Láng Hạ	80 Láng Hạ, Đống Đa, Hà Nội	\N	21.018721	105.814314	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
baea8873-c732-471c-ba06-04b7e27f92b9	The Coffee House Láng Hạ	82 Láng Hạ, Đống Đa, Hà Nội	\N	21.018821	105.814414	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
5105f205-5ef6-4a26-be39-fc30fbfb8578	Cộng Cà Phê Láng Hạ	84 Láng Hạ, Đống Đa, Hà Nội	\N	21.018921	105.814514	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
8c7f8ef1-e388-456a-9f53-09b62e9904c5	AHA Cafe Láng Hạ	86 Láng Hạ, Đống Đa, Hà Nội	\N	21.019021	105.814614	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
069a5ec8-82e2-46ac-bf7b-ed764c0acb03	Highlands Coffee Kim Mã	360 Kim Mã, Ba Đình, Hà Nội	\N	21.032894	105.813726	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c9deabd3-00d3-4b89-a68e-b77a2c94c1ed	Starbucks Kim Mã	362 Kim Mã, Ba Đình, Hà Nội	\N	21.032994	105.813826	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
74945e40-e044-4cd2-ae74-d3581bc91dd3	The Coffee House Kim Mã	364 Kim Mã, Ba Đình, Hà Nội	\N	21.033094	105.813926	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
04aa605e-2cba-4508-9643-9cf24591dc7e	Cộng Cà Phê Kim Mã	366 Kim Mã, Ba Đình, Hà Nội	\N	21.033194	105.814026	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
cd9d13e7-c2b1-441c-b46e-b24ca32fd910	AHA Cafe Kim Mã	368 Kim Mã, Ba Đình, Hà Nội	\N	21.033294	105.814126	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6f175fc7-3123-41e6-ad66-4f860b719135	Highlands Coffee Giảng Võ	D8 Giảng Võ, Ba Đình, Hà Nội	\N	21.028594	105.819142	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
970f2878-ee49-4aca-89ef-28a5c15cabea	Starbucks Giảng Võ	10 Giảng Võ, Ba Đình, Hà Nội	\N	21.028694	105.819242	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
1fca35da-a744-4b6e-8c0d-307e00b2d54b	The Coffee House Giảng Võ	12 Giảng Võ, Ba Đình, Hà Nội	\N	21.028794	105.819342	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
245ae2a8-d1ca-4cdd-a626-57ca2fc6ccfa	Cộng Cà Phê Giảng Võ	14 Giảng Võ, Ba Đình, Hà Nội	\N	21.028894	105.819442	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
24b91c07-4441-44f9-a899-74d20001d461	AHA Cafe Giảng Võ	16 Giảng Võ, Ba Đình, Hà Nội	\N	21.028994	105.819542	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
4020d106-9a34-418a-b8df-29c93b577b6c	Highlands Coffee Hoàng Quốc Việt	198 Hoàng Quốc Việt, Cầu Giấy, Hà Nội	\N	21.040312	105.843112	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ec9bbe46-a84f-4c33-b13e-ad8bf131e526	Starbucks Hoàng Quốc Việt	200 Hoàng Quốc Việt, Cầu Giấy, Hà Nội	\N	21.040412	105.843212	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
48e2d548-675a-4ec5-bd31-6756c3aff49a	The Coffee House Hoàng Quốc Việt	202 Hoàng Quốc Việt, Cầu Giấy, Hà Nội	\N	21.040512	105.843312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
96c2f987-c917-492c-a19e-d5aa666fdd37	Cộng Cà Phê Hoàng Quốc Việt	204 Hoàng Quốc Việt, Cầu Giấy, Hà Nội	\N	21.040612	105.843412	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
37f1cf6b-5518-45ef-8d82-d65e30898578	AHA Cafe Hoàng Quốc Việt	206 Hoàng Quốc Việt, Cầu Giấy, Hà Nội	\N	21.040712	105.843512	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
f92bc380-1a1f-42b2-a58b-3046ab3b03b2	Highlands Coffee Trần Duy Hưng	222 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.009712	105.800221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
dd1963f6-89db-4f65-b671-9433ab580dc5	Starbucks Trần Duy Hưng	220 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.009812	105.800321	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
da392f16-dcac-41d1-b899-fffb434fe30f	The Coffee House Trần Duy Hưng	218 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.009912	105.800421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
b65399c1-bfda-48ea-8c8c-36d7993c8a8b	Cộng Cà Phê Trần Duy Hưng	216 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.010012	105.800521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
fb35c1db-0e0f-4f42-8a07-9dc66df621af	AHA Cafe Trần Duy Hưng	214 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.010112	105.800621	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
d28c3b81-6a70-4ee9-8671-d20c5405fd1a	Highlands Coffee Nguyễn Khang	10 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.031231	105.793021	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
7df00eb2-6192-4b49-8e04-60f432d8b535	Starbucks Nguyễn Khang	12 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.031331	105.793121	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
7df72573-7f1a-4cae-b877-f3ef96a7cd99	The Coffee House Nguyễn Khang	14 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.031431	105.793221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e6b1ee94-2caa-4e08-b650-e564283f90f7	Cộng Cà Phê Nguyễn Khang	16 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.031531	105.793321	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
1401a5de-3674-4e67-918e-35674c3df2ab	AHA Cafe Nguyễn Khang	18 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.031631	105.793421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
20c314aa-1365-4caf-ab6a-e94258629c36	Highlands Coffee Tây Mỗ	Smart City, Nam Từ Liêm, Hà Nội	\N	20.995832	105.748221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
607e7073-9597-4f83-b0af-7aebaff9d009	Starbucks Smart City	Smart City, Nam Từ Liêm, Hà Nội	\N	20.995932	105.748321	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
dd607a7e-8e2d-4b7d-bad3-a7a57d654c55	The Coffee House Smart City	Smart City, Nam Từ Liêm, Hà Nội	\N	20.996032	105.748421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3670dfec-f243-44c0-b75e-f649614ef532	Cộng Cà Phê Smart City	Smart City, Nam Từ Liêm, Hà Nội	\N	20.996132	105.748521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
b6ad9c06-2121-4490-ad1b-ba2aac38196e	AHA Cafe Smart City	Smart City, Nam Từ Liêm, Hà Nội	\N	20.996232	105.748621	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
5473a867-e0e6-4566-9642-ee89b3351ec0	Highlands Coffee Long Biên	AEON Mall Long Biên, Hà Nội	\N	21.026311	105.900712	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
d3d4e418-e406-430d-ba18-15329ae1c1f1	Starbucks AEON Long Biên	AEON Mall Long Biên, Hà Nội	\N	21.026411	105.900812	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c420c57b-605c-4b4c-8dcb-d26c19235381	The Coffee House Long Biên	AEON Mall Long Biên, Hà Nội	\N	21.026511	105.900912	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
9c18fb35-5c7a-467a-b610-4bd59db38ebc	Cộng Cà Phê Long Biên	Cổ Linh, Long Biên, Hà Nội	\N	21.026611	105.901012	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
636798e9-7356-4409-b317-44e4c7ec5a24	AHA Cafe Long Biên	Cổ Linh, Long Biên, Hà Nội	\N	21.026711	105.901112	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
2cd5de19-17e2-4752-aadb-9ba292fba68b	Highlands Coffee Hoàng Cầu	120 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015432	105.823241	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
4712e979-7eed-4a86-b269-a44ef602c7ac	Starbucks Hoàng Cầu	122 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015532	105.823341	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
bb194b62-e8cd-434d-86fa-45edd7eb04c9	The Coffee House Hoàng Cầu	124 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015632	105.823441	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
35560604-3c2b-4218-95c3-2dee5f7d6d9c	Cộng Cà Phê Hoàng Cầu	126 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015732	105.823541	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
520d7fdd-0f1e-4e49-8f2f-4eee04b794da	AHA Cafe Hoàng Cầu	128 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015832	105.823641	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
42904793-6a6d-4d4e-9aac-264e91bf86bc	Highlands Coffee Lạc Long Quân	25 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.042312	105.815421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c1ffa606-5b7a-4c5e-884d-56c477844b7b	Starbucks Lạc Long Quân	40 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.042412	105.815521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
1ebf6ff5-038a-439c-b580-fdac47c1aaf0	The Coffee House Lạc Long Quân	50 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.042512	105.815621	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
fbc0526a-26bd-43a6-915d-f6511c76e834	Cộng Cà Phê Lạc Long Quân	80 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.042612	105.815721	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e7718f78-aba0-4cef-bf66-59e0fb516e62	AHA Cafe Lạc Long Quân	100 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.042712	105.815821	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3d8be853-2c27-4138-bf57-8848fa13c888	Highlands Coffee Hàng Bài	55 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.026421	105.852341	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
7fb67f09-41f6-4603-b9dc-0301c3b3433c	Starbucks Hàng Bài	57 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.026521	105.852441	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
5a2fe568-13eb-4804-994c-4d4dfb80a9ba	The Coffee House Hàng Bài	59 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.026621	105.852541	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
9e0c8681-5682-40ff-9543-bee77c24cea7	Cộng Cà Phê Hàng Bài	61 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.026721	105.852641	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e0c2f549-344b-4791-a9c5-deeea99d221b	AHA Cafe Hàng Bài	63 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.026821	105.852741	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ea0423e0-0a46-43a7-9b72-a4698fdbbfa4	Highlands Coffee Lê Thái Tổ	4 Lê Thái Tổ, Hoàn Kiếm, Hà Nội	\N	21.028781	105.852861	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
52a0c954-0190-466e-a555-e87a91a500d5	Starbucks Lê Thái Tổ	6 Lê Thái Tổ, Hoàn Kiếm, Hà Nội	\N	21.028881	105.852961	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
4289fa84-24d6-4617-ae10-2f6e2a158c1b	The Coffee House Lê Thái Tổ	8 Lê Thái Tổ, Hoàn Kiếm, Hà Nội	\N	21.028981	105.853061	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
f898fe02-8638-4faf-8040-69e2664fa4af	Cộng Cà Phê Lê Thái Tổ	10 Lê Thái Tổ, Hoàn Kiếm, Hà Nội	\N	21.029081	105.853161	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
336a2fab-bb2c-41c4-80de-911a6cb9c85e	AHA Cafe Lê Thái Tổ	12 Lê Thái Tổ, Hoàn Kiếm, Hà Nội	\N	21.029181	105.853261	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
15c50e63-9dfa-4940-a072-ef412dfb39b9	Highlands Coffee Hàng Trống	92 Hàng Trống, Hoàn Kiếm, Hà Nội	\N	21.030521	105.852741	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6ed9a13e-9613-459c-aaef-79efc11cb8f7	Starbucks Hàng Trống	94 Hàng Trống, Hoàn Kiếm, Hà Nội	\N	21.030621	105.852841	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
cc571311-5fbc-4bd3-aa12-afbea7599a41	The Coffee House Hàng Trống	96 Hàng Trống, Hoàn Kiếm, Hà Nội	\N	21.030721	105.852941	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
bf0f4826-cdc6-4650-b558-835b542484f0	Cộng Cà Phê Hàng Trống	98 Hàng Trống, Hoàn Kiếm, Hà Nội	\N	21.030821	105.853041	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ae9a6199-0671-418f-bf61-bbcfde65d560	AHA Cafe Hàng Trống	100 Hàng Trống, Hoàn Kiếm, Hà Nội	\N	21.030921	105.853141	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ba8e7e97-0a20-445b-bd46-64d30a4cb8de	Highlands Coffee Hàng Bông	122 Hàng Bông, Hoàn Kiếm, Hà Nội	\N	21.028992	105.845824	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e969cf9e-cc2f-4aea-905c-842a5d67e03d	Starbucks Hàng Bông	124 Hàng Bông, Hoàn Kiếm, Hà Nội	\N	21.029092	105.845924	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3cbde107-4ca2-4a2b-9e64-2df8678578a3	The Coffee House Hàng Bông	126 Hàng Bông, Hoàn Kiếm, Hà Nội	\N	21.029192	105.846024	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a901290a-a234-43c1-ae63-b5a0a761819b	Cộng Cà Phê Hàng Bông	128 Hàng Bông, Hoàn Kiếm, Hà Nội	\N	21.029292	105.846124	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
01eb064e-6c22-41ee-bad8-0be43e11e1eb	AHA Cafe Hàng Bông	130 Hàng Bông, Hoàn Kiếm, Hà Nội	\N	21.029392	105.846224	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
5789c23e-9942-49d3-b9dc-c6b3bfa9bb10	Highlands Coffee Bát Đàn	49 Bát Đàn, Hoàn Kiếm, Hà Nội	\N	21.034432	105.847142	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
5ec9b09e-3941-4a28-9c28-528abb06fa46	Starbucks Bát Đàn	51 Bát Đàn, Hoàn Kiếm, Hà Nội	\N	21.034532	105.847242	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
96a6a57c-df1b-438e-b8e5-a666c5091dd1	The Coffee House Bát Đàn	53 Bát Đàn, Hoàn Kiếm, Hà Nội	\N	21.034632	105.847342	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c5d94312-0b62-4a84-980b-d9ac6ee30286	Cộng Cà Phê Bát Đàn	55 Bát Đàn, Hoàn Kiếm, Hà Nội	\N	21.034732	105.847442	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
9a1555f5-7087-42b9-b570-27e152d0355d	AHA Cafe Bát Đàn	57 Bát Đàn, Hoàn Kiếm, Hà Nội	\N	21.034832	105.847542	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6d0e4a00-9d63-4392-ab46-24c902cf9ca9	Highlands Coffee Hàng Đào	45 Hàng Đào, Hoàn Kiếm, Hà Nội	\N	21.033812	105.850941	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
afae4f71-8695-4269-b8e7-25930fd2a25f	Starbucks Hàng Đào	47 Hàng Đào, Hoàn Kiếm, Hà Nội	\N	21.033912	105.851041	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
126a2b96-dfeb-4894-91df-161e3bc51c2e	The Coffee House Hàng Đào	49 Hàng Đào, Hoàn Kiếm, Hà Nội	\N	21.034012	105.851141	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
eb3fb711-718e-456c-94f6-181937ec0fb9	Cộng Cà Phê Hàng Đào	51 Hàng Đào, Hoàn Kiếm, Hà Nội	\N	21.034112	105.851241	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e3db65e5-c49d-4763-a3e1-b7fddf8a1694	AHA Cafe Hàng Đào	53 Hàng Đào, Hoàn Kiếm, Hà Nội	\N	21.034212	105.851341	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
939c53dc-6cf7-4453-886e-191fe952cd78	Highlands Coffee Hàng Ngang	12 Hàng Ngang, Hoàn Kiếm, Hà Nội	\N	21.034912	105.850231	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
0e1c1630-6b55-4a94-a73a-188a74e58e8c	Starbucks Hàng Ngang	14 Hàng Ngang, Hoàn Kiếm, Hà Nội	\N	21.035012	105.850331	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
19256b09-bb5d-411e-ab58-441da2d31828	The Coffee House Hàng Ngang	16 Hàng Ngang, Hoàn Kiếm, Hà Nội	\N	21.035112	105.850431	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a846cd71-935a-490c-8247-e8c7a898280f	Cộng Cà Phê Hàng Ngang	18 Hàng Ngang, Hoàn Kiếm, Hà Nội	\N	21.035212	105.850531	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3eb56eb5-6616-4c41-937c-6a8397796d7f	AHA Cafe Hàng Ngang	20 Hàng Ngang, Hoàn Kiếm, Hà Nội	\N	21.035312	105.850631	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
bad64b22-63e0-4b3b-a444-42cf148bb731	Highlands Coffee Hàng Buồm	22 Hàng Buồm, Hoàn Kiếm, Hà Nội	\N	21.035612	105.850821	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6ab43b4f-9c5c-4a2f-bc95-58f469f26a24	Starbucks Hàng Buồm	24 Hàng Buồm, Hoàn Kiếm, Hà Nội	\N	21.035712	105.850921	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
0ee970d4-c13b-46b4-b23f-beddce378aca	The Coffee House Hàng Buồm	26 Hàng Buồm, Hoàn Kiếm, Hà Nội	\N	21.035812	105.851021	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a7272e2e-c03b-4fe2-a263-665c2851ace2	Cộng Cà Phê Hàng Buồm	28 Hàng Buồm, Hoàn Kiếm, Hà Nội	\N	21.035912	105.851121	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
32e526c0-ada2-477b-8310-646ff1cc965c	AHA Cafe Hàng Buồm	30 Hàng Buồm, Hoàn Kiếm, Hà Nội	\N	21.036012	105.851221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
07d955df-4d8f-450c-8120-820e26b3a869	Highlands Coffee Trần Hưng Đạo	50 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội	\N	21.024321	105.855121	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e7ce9648-dff2-4fc0-aec1-c12613df9b29	Starbucks Trần Hưng Đạo	52 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội	\N	21.024421	105.855221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a566c852-af1c-4786-b5b6-18a83209a4f6	The Coffee House Trần Hưng Đạo	54 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội	\N	21.024521	105.855321	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6629c0e0-c922-4105-97d2-622f1ac2b490	Cộng Cà Phê Trần Hưng Đạo	56 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội	\N	21.024621	105.855421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
2b36b460-654c-4a0a-a20a-438b9826baac	AHA Cafe Trần Hưng Đạo	58 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội	\N	21.024721	105.855521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c68cd4d9-36e8-42a9-b066-6fc738b3a289	Highlands Coffee Phan Chu Trinh	40 Phan Chu Trinh, Hoàn Kiếm, Hà Nội	\N	21.025621	105.857221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
25c7eb41-8a0b-428b-b1d2-595be723d37b	Starbucks Phan Chu Trinh	42 Phan Chu Trinh, Hoàn Kiếm, Hà Nội	\N	21.025721	105.857321	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
5ce572f9-bdeb-4986-89a1-388f9865980a	The Coffee House Phan Chu Trinh	44 Phan Chu Trinh, Hoàn Kiếm, Hà Nội	\N	21.025821	105.857421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
47f35b37-dd99-42f8-b47a-a1930baa0cd7	Cộng Cà Phê Phan Chu Trinh	46 Phan Chu Trinh, Hoàn Kiếm, Hà Nội	\N	21.025921	105.857521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
617060a9-b165-4ab1-bbfd-6d422e15a2be	AHA Cafe Phan Chu Trinh	48 Phan Chu Trinh, Hoàn Kiếm, Hà Nội	\N	21.026021	105.857621	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
362e16a4-5915-4692-ac2e-52d990445172	Highlands Coffee Hai Bà Trưng	120 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.024021	105.856221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
543fc022-046f-4829-8a90-9b6e7cf4b8b1	Starbucks Hai Bà Trưng	122 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.024121	105.856321	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a34f6d4f-7266-47d3-990c-a02eecfed0c4	The Coffee House Hai Bà Trưng	124 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.024221	105.856421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
6a62557a-d595-46a2-addd-8a412a45dfa2	Cộng Cà Phê Hai Bà Trưng	126 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.024321	105.856521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
44ce38bf-301e-485d-86b0-249611eb9578	AHA Cafe Hai Bà Trưng	128 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.024421	105.856621	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c8d0265f-b04a-4dc5-9b52-50f56a119f77	Highlands Coffee Đội Cấn	200 Đội Cấn, Ba Đình, Hà Nội	\N	21.036221	105.823541	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a03d860c-53e8-48f3-ac09-56d0bee7162c	Starbucks Đội Cấn	202 Đội Cấn, Ba Đình, Hà Nội	\N	21.036321	105.823641	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e2548b42-f471-4ccf-8bc7-e0c97309c394	The Coffee House Đội Cấn	204 Đội Cấn, Ba Đình, Hà Nội	\N	21.036421	105.823741	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
eb72267e-768b-4fd1-a16f-5bf817abcb81	Cộng Cà Phê Đội Cấn	206 Đội Cấn, Ba Đình, Hà Nội	\N	21.036521	105.823841	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
13612ae0-7204-48ca-9841-5c253de65ec7	AHA Cafe Đội Cấn	208 Đội Cấn, Ba Đình, Hà Nội	\N	21.036621	105.823941	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a7191f42-4578-4245-b705-5cb1396d8391	Highlands Coffee Tây Hồ	11 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.057321	105.821012	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
1e728529-0724-41b5-bfef-e318a09bebfa	Starbucks Tây Hồ	13 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.057421	105.821112	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
7849e024-a195-4531-9ab6-ca9acedbae68	The Coffee House Tây Hồ	15 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.057521	105.821212	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
942d8174-821c-416a-95c4-decae2c49593	Cộng Cà Phê Tây Hồ	17 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.057621	105.821312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
245d9d42-085a-4d82-8c49-0f05ed08162d	AHA Cafe Tây Hồ	19 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.057721	105.821412	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a8adedd3-1418-4852-b100-bfcacf3ea2b1	Highlands Coffee Hoàng Hoa Thám	100 Hoàng Hoa Thám, Ba Đình, Hà Nội	\N	21.041212	105.822412	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
694b5c34-b61f-4f7a-8d0b-28c076ccb439	Starbucks Hoàng Hoa Thám	102 Hoàng Hoa Thám, Ba Đình, Hà Nội	\N	21.041312	105.822512	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
57be8881-bb0a-44cb-81a3-94a12ba4e660	The Coffee House Hoàng Hoa Thám	104 Hoàng Hoa Thám, Ba Đình, Hà Nội	\N	21.041412	105.822612	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
d44cad34-460f-4e4a-9ce4-b453262909e4	Cộng Cà Phê Hoàng Hoa Thám	106 Hoàng Hoa Thám, Ba Đình, Hà Nội	\N	21.041512	105.822712	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c4edf8af-dc57-4ac5-9037-c5a8585b7aa1	AHA Cafe Hoàng Hoa Thám	108 Hoàng Hoa Thám, Ba Đình, Hà Nội	\N	21.041612	105.822812	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
8165a4eb-8aea-41aa-8f44-2412738909ab	Highlands Coffee Nguyễn Văn Cừ	200 Nguyễn Văn Cừ, Long Biên, Hà Nội	\N	21.043312	105.865312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e204b4ed-147d-4dad-8c19-33cd535c6e25	Starbucks Nguyễn Văn Cừ	202 Nguyễn Văn Cừ, Long Biên, Hà Nội	\N	21.043412	105.865412	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
f5599da7-2bae-47cd-99c3-ac7780f1e857	The Coffee House Nguyễn Văn Cừ	204 Nguyễn Văn Cừ, Long Biên, Hà Nội	\N	21.043512	105.865512	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
848af0c5-eb4c-431f-8893-c8c27c850998	Cộng Cà Phê Nguyễn Văn Cừ	206 Nguyễn Văn Cừ, Long Biên, Hà Nội	\N	21.043612	105.865612	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
61f5c853-ff92-44bf-ad8e-549206794a15	AHA Cafe Nguyễn Văn Cừ	208 Nguyễn Văn Cừ, Long Biên, Hà Nội	\N	21.043712	105.865712	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
0ba954b4-9b01-46ed-ab9b-3e05dab95759	Highlands Coffee Nguyễn Trãi	168 Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.004112	105.817212	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
487286a1-89bd-4607-b3e3-2d1663ef253f	Starbucks Nguyễn Trãi	170 Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.004212	105.817312	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
8bdec6ad-e8d5-4234-a60f-b5efc1d03f5b	The Coffee House Nguyễn Trãi	172 Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.004312	105.817412	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
fc0dfe74-df9e-4c13-91be-fffce2831f2c	Cộng Cà Phê Nguyễn Trãi	174 Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.004412	105.817512	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
bf4987e1-1459-403c-8a7b-cc5589fb8620	AHA Cafe Nguyễn Trãi	176 Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.004512	105.817612	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
04ae5804-1f38-4591-8bcc-9a0e34dc7a52	Highlands Coffee Hà Đông	AEON Mall Hà Đông, Hà Nội	\N	20.971521	105.778421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
326bcac8-d3a0-4079-bd19-7906ac2f8a6e	Starbucks Hà Đông	AEON Mall Hà Đông, Hà Nội	\N	20.971621	105.778521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
15a7cb11-45bc-4b48-9100-fa198c2b5153	The Coffee House Hà Đông	AEON Mall Hà Đông, Hà Nội	\N	20.971721	105.778621	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
0b5a9241-7949-46c2-8a96-85347e9939f7	Cộng Cà Phê Hà Đông	Dương Nội, Hà Đông, Hà Nội	\N	20.971821	105.778721	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c9f52042-4d8a-4684-aa3c-c61386afba6a	AHA Cafe Hà Đông	Dương Nội, Hà Đông, Hà Nội	\N	20.971921	105.778821	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
faa4204b-e744-4b2b-8409-7362f60744cc	Highlands Coffee Mỹ Đình	Keangnam Landmark, Nam Từ Liêm, Hà Nội	\N	21.028321	105.779221	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
677d4f4d-6ac5-4b94-b59d-1a7637aa09cb	Starbucks Mỹ Đình	Keangnam Landmark, Nam Từ Liêm, Hà Nội	\N	21.028421	105.779321	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
fcf96bc1-bd6c-46b1-9fe4-a81c998c0a86	The Coffee House Mỹ Đình	Keangnam Landmark, Nam Từ Liêm, Hà Nội	\N	21.028521	105.779421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
09477b87-1bce-4d98-ba72-098ff8c2e255	Cộng Cà Phê Mỹ Đình	Phạm Hùng, Nam Từ Liêm, Hà Nội	\N	21.028621	105.779521	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
10b35bc2-0b98-4fdf-802d-43e8b954a944	AHA Cafe Mỹ Đình	Phạm Hùng, Nam Từ Liêm, Hà Nội	\N	21.028721	105.779621	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
ba0e5c40-e64f-4c36-8c8a-b7543e111ff2		Khu vực Hương Sơn, gần Chùa Hương, Mỹ Đức, Hà Nội	\N	20.6158	105.7421	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
4e8e4fa4-60c8-4c2b-a1ce-6f58bbba1f08		Bến Đục, Hương Sơn, Mỹ Đức, Hà Nội	\N	20.6078	105.7035	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
de451b86-08cd-4863-a9fc-6d4bc54a2f9c		Khu vực suối Yến, Chùa Hương, Mỹ Đức, Hà Nội	\N	20.6092	105.7058	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
daf9af12-8e6b-49c4-b843-8d7789ef5f92		Hương Sơn, Mỹ Đức, Hà Nội	\N	20.6115	105.708	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
7dbfcae8-81b4-465c-b0cf-4fa9a84773a8		Khu Tế Tiêu, gần Chùa Hương, Mỹ Đức, Hà Nội	\N	20.5979	105.7172	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
af2df0e2-d441-4598-a725-0d661fed23ba		Khu vực Đồi Bù, Chương Mỹ, Hà Nội	\N	20.7428	105.6459	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
619fc013-d9dd-4c85-9d84-923e940c6e5a		Gần khu camping Đồi Bù, Chương Mỹ, Hà Nội	\N	20.7419	105.6438	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
8acdeed0-f1e2-434c-ba33-b7c58dd7be09		Thị trấn Xuân Mai, Chương Mỹ, Hà Nội	\N	20.7385	105.6498	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e39958a9-4d83-42e9-a46e-20ad3a03d267		Khu vực giáp ranh Đồi Bù - Sóc Sơn	\N	20.7442	105.6415	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
39a8ccd3-a6ee-48b8-9247-fb7f909d2400		Chương Mỹ, Hà Nội	\N	20.7407	105.6472	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
8efea4cb-5ed7-492e-bb7d-ae673609869e		Tản Lĩnh, Ba Vì, Hà Nội	\N	21.0778	105.3652	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
4951d6e9-9448-49a2-95d8-af2df8695788		Khu du lịch Ba Vì, Hà Nội	\N	21.0789	105.3628	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3e0aa341-85d1-4918-bbfc-bccf700111ac		Yên Bài, Ba Vì, Hà Nội	\N	21.0725	105.371	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c710bbf6-880b-4bee-8e27-8396bb265b55		Gần cổng VQG Ba Vì, Hà Nội	\N	21.0802	105.3605	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
dbb6516e-14f5-48d9-ba7c-f54b67f0eb3e		Khu vực đồi thông Ba Vì, Hà Nội	\N	21.0748	105.3679	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3ccf4f35-1bdb-48f3-9a78-ff1b10695e10		Đường Lâm, Sơn Tây, Hà Nội	\N	21.1392	105.4075	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
cea7a889-697e-49a9-a3ba-004308b42b67		Thôn Mông Phụ, Đường Lâm	\N	21.1388	105.4068	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
74920e65-6801-47b1-9ce5-7fd0df3f7d38		Đường Lâm, Sơn Tây	\N	21.1405	105.4059	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
2fc80cc8-8d38-4f30-87a0-edcfed61d86d		Đường Lâm, Sơn Tây	\N	21.141	105.4082	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3791d2a9-efe8-448a-b061-2c95e708899b		Cổng làng Đường Lâm	\N	21.1379	105.409	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
d2df931e-3666-4d8c-a2a1-89dfd78757f2		Quốc Oai, Hà Nội	\N	20.9725	105.602	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3564f620-6bfe-4072-9f12-db9a8d5a8ee4		Thạch Thất, Hà Nội	\N	20.9695	105.5905	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
b6388af3-529f-4500-b72c-07bc4149aad4		Khu Hòa Lạc	\N	20.9708	105.5952	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
63785116-3424-4733-ab81-cf165fdd6fb5		Gần Chùa Thầy	\N	20.9732	105.6035	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
3f616663-79a3-417f-8aac-26fd071d7732		Thị trấn Quốc Oai	\N	20.9741	105.6048	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
fd82f432-a474-4189-99ab-e152405f4ebd		Mê Linh, Hà Nội	\N	21.179	105.7255	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a61a25d3-97ab-4341-8f83-c58e088faf00		Gần đền Hai Bà Trưng	\N	21.1782	105.7242	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a47c46b0-612c-47d2-a1f2-96bb54d4fafe		Mê Linh, Hà Nội	\N	21.1803	105.7268	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
39070080-db67-4408-97e6-34bdf270a276		Mê Linh, Hà Nội	\N	21.1775	105.7239	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
a73f463d-bd45-4b99-834e-ff51685cebe7		Mê Linh, Hà Nội	\N	21.1798	105.7272	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
18a20277-a42d-4772-8818-d5ab7b779c16		Sóc Sơn, Hà Nội	\N	21.309	105.7805	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
98832027-5498-478f-ae04-5e8e09781e3d		Gần hồ Hàm Lợn	\N	21.3082	105.7792	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
c9841f31-f39f-4db6-b85d-e1ddf9c37499		Sóc Sơn, Hà Nội	\N	21.307	105.7815	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
03d75378-f37d-4ddb-a7d3-accd1dd74f50		Khu camping Hàm Lợn	\N	21.3102	105.7769	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
459e3d15-37c6-46fc-aceb-d81a1ecb8df3		Xã Minh Trí, Sóc Sơn	\N	21.3055	105.783	cafe	\N	0.0	0	2026-03-23 23:44:55.63658
e17f6915-0096-43b8-88fb-5279f837c8b2	Sofitel Legend Metropole Hanoi	15 Ngô Quyền, Hoàn Kiếm, Hà Nội	\N	21.025456	105.856276	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
d0718a39-1f15-4a5b-a1dc-e2477a6353ef	Apricot Hotel Hanoi	136 Hàng Trống, Hoàn Kiếm, Hà Nội	\N	21.028186	105.852461	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
3eeb5200-8a4f-4c16-aebc-d47550d08c6d	Hanoi La Siesta Hotel & Spa	94 Mã Mây, Hoàn Kiếm, Hà Nội	\N	21.033132	105.851014	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
097efbca-5dab-437d-90df-9f0dc4282caf	Peridot Grand Luxury Boutique Hotel	33 Đường Thành, Hoàn Kiếm, Hà Nội	\N	21.034912	105.846325	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e37974a5-82be-430f-89da-3e455be45894	O'Gallery Premier Hotel & Spa	122 Hàng Bông, Hoàn Kiếm, Hà Nội	\N	21.028992	105.845824	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
4688e405-ae8f-4aac-819b-10b1b7392199	JW Marriott Hotel Hanoi	8 Đỗ Đức Dục, Nam Từ Liêm, Hà Nội	\N	21.005429	105.783689	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
217fbc1c-73d9-4f9f-b867-36739047cf7f	InterContinental Hanoi Westlake	5 Từ Hoa, Tây Hồ, Hà Nội	\N	21.059654	105.818214	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e5952f41-fc8f-48f8-a930-9f714c757191	Pan Pacific Hanoi	1 Thanh Niên, Ba Đình, Hà Nội	\N	21.043392	105.835138	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
069f1eda-2e64-4be0-8939-b1e87a6b09cc	Sheraton Hanoi Hotel	11 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.058267	105.823831	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
afa4a7da-9178-478b-8b34-d7b2035a5515	Somerset West Point Hanoi	2 Tây Hồ, Quảng An, Tây Hồ, Hà Nội	\N	21.061342	105.823241	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
62ce62b0-3891-4e8a-9bfa-06c7d1996cdf	Lotte Hotel Hanoi	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.031536	105.813024	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6c2b28c9-e374-46d9-b0c7-ae4f9faaf85b	Daewoo Hotel Hanoi	360 Kim Mã, Ba Đình, Hà Nội	\N	21.032894	105.813726	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
950d0e0d-9110-4bb3-a393-1e92745016f8	Grand Vista Hanoi	146 Giảng Võ, Ba Đình, Hà Nội	\N	21.024965	105.830264	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
109aa111-0c33-43ab-9b69-4b80a87e34ee	Pullman Hanoi	40 Cát Linh, Đống Đa, Hà Nội	\N	21.029455	105.832921	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
28319d27-440c-4d49-849e-28da2d9d0de5	Hanoi Hotel	D8 Giảng Võ, Ba Đình, Hà Nội	\N	21.028594	105.819142	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c0f44f76-8b52-4391-a312-cb5f45bf573a	Melia Hanoi	44B Lý Thường Kiệt, Hoàn Kiếm, Hà Nội	\N	21.027763	105.847805	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
a3b161dc-453b-4994-b441-4490c6a024bf	Hotel de l'Opera Hanoi	29 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.024921	105.856694	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c20eb9d5-04a8-4476-9c67-21aa3984051d	Hanoi Pearl Hotel	6 Hàng Tre, Hoàn Kiếm, Hà Nội	\N	21.031728	105.851934	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c360ab2a-c6df-4533-9631-34985854678a	The Oriental Jade Hotel	92-94 Hàng Trống, Hoàn Kiếm, Hà Nội	\N	21.030521	105.852741	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
bc6073c9-3aa0-4933-ba9b-27b1f525fe33	La Siesta Classic Ma May	94 Mã Mây, Hoàn Kiếm, Hà Nội	\N	21.033543	105.851183	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
f8cf1c4b-ed41-4aa7-97a6-03698e4c5a79	Fraser Suites Hanoi	51 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.059928	105.820992	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9978548c-8e14-498b-aa86-1095e9dddc18	Elegant Suites Westlake	10B Đặng Thai Mai, Tây Hồ, Hà Nội	\N	21.058233	105.822672	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
8ce144a0-dab8-4d3d-bad7-b0f5668e919c	Diamond Westlake Suites	96 Tô Ngọc Vân, Tây Hồ, Hà Nội	\N	21.053429	105.811236	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b63aba62-e60f-48ce-be92-c26a2d7c43ec	Somerset Grand Hanoi	49 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.027331	105.845191	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
903a312c-8a61-49be-a249-5c0e7b0cbe7d	Oakwood Residence Hanoi	17 Ngõ 35 Đặng Thai Mai, Tây Hồ, Hà Nội	\N	21.060512	105.823115	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
20f3dfd2-7d30-4b17-83db-c1319a726600	Bún Bò Huế O Xuân	21 Phùng Hưng, Hoàn Kiếm, Hà Nội	\N	21.031812	105.847392	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
314cafa9-e242-4b27-a483-b7d5f43caed6	Phở Lý Quốc Sư	10 Lý Quốc Sư, Hoàn Kiếm, Hà Nội	\N	21.029596	105.848437	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b5bf0682-1c84-47eb-b8f7-78a10e5bae82	Bún Riêu Cua Hàng Bạc	11 Hàng Bạc, Hoàn Kiếm, Hà Nội	\N	21.034567	105.851624	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
bc99b08d-a690-4f07-ba4f-3a4f55c398fb	Miến Lươn Đông Thịnh	87 Hàng Điếu, Hoàn Kiếm, Hà Nội	\N	21.033812	105.850112	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
31d6d592-94ad-4b9f-8266-274726fa343e	Bún Thang Cầu Gỗ	48 Cầu Gỗ, Hoàn Kiếm, Hà Nội	\N	21.033102	105.852361	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
afbc7296-08de-466c-8d0c-a74650369cf5	Pizza Hut Vincom Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012543	105.849712	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
1ec2d450-274f-4696-92f0-ac1dd87cf5ad	Al Fresco's Hai Bà Trưng	23L Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.022381	105.854711	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6bd10567-d829-4fbc-a7e6-059547f50f7c	El Gaucho Steakhouse	11 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.023912	105.853624	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ff6a7af6-b3d9-4d09-856d-92199b20679f	Pepperonis Tràng Tiền	14 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.024102	105.854102	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
dbcf60dc-066d-498c-b5a0-89c45cd19b20	Pizza 4P's Lotte Center	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.031581	105.813092	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
7fcb24f8-9d5e-49c4-a7ed-434e22803bf9	Cộng Cà Phê Tràng Tiền	54 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.024862	105.857621	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c347cc1f-a869-450e-b398-f5b4580551e5	The Coffee House Thái Hà	36 Thái Hà, Đống Đa, Hà Nội	\N	21.013621	105.819524	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
908b5169-b598-4a5a-8a33-76b00fca7a69	Highlands Coffee Lotte Center	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.031732	105.812942	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
f4c45439-ad5d-41ff-bede-273b6263ef11	Starbucks Lotte Hanoi	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.031901	105.813274	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
bc5279b1-26fc-4328-aa9a-bbb12959880b	AHA Cafe Thái Hà	36 Thái Hà, Đống Đa, Hà Nội	\N	21.013842	105.819932	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6ef1f1e9-e2fe-48e1-b153-2e21b73a28ab	KFC Hồ Tùng Mậu	136 Hồ Tùng Mậu, Cầu Giấy, Hà Nội	\N	21.036214	105.781432	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
8413597c-eb6e-4ed3-9c36-fed335fbcc51	Lotteria Cầu Giấy	239 Cầu Giấy, Cầu Giấy, Hà Nội	\N	21.033842	105.789214	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
bb71bea2-af97-4fec-a56b-65f511b91da5	McDonald's Keangnam	72 Phạm Hùng, Nam Từ Liêm, Hà Nội	\N	21.016214	105.783561	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c24fab7f-4456-4e8f-9984-7b718c426440	Jollibee Indochina Plaza	241 Xuân Thủy, Cầu Giấy, Hà Nội	\N	21.036781	105.782134	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
cccbed1c-7c0b-4995-b4d0-814f34d36477	Texas Chicken Big C Thăng Long	222 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.009832	105.800212	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b3319c24-841d-495c-b70d-4f5bbc80f67c	Nhà Hàng Lẩu Phan Nguyễn Văn Cừ	92 Nguyễn Văn Cừ, Long Biên, Hà Nội	\N	21.047281	105.857214	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
1ac182da-fb33-437f-aa86-52f47a19843f	Haidilao Vincom Long Biên	AEON Mall Long Biên, Hà Nội	\N	21.026112	105.900741	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
37759390-7312-4e96-9648-f237efc07762	King BBQ AEON Long Biên	AEON Mall Long Biên, Hà Nội	\N	21.026342	105.900912	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
86e19bf9-0783-44eb-951c-bd078f0c95db	Gogi House AEON Long Biên	AEON Mall Long Biên, Hà Nội	\N	21.026401	105.900832	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
12043331-2d6a-4fe9-9f56-265b848bc895	Manwah AEON Long Biên	AEON Mall Long Biên, Hà Nội	\N	21.026221	105.900652	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
d9e1d3aa-f631-4556-9a92-4ab1b5986c21	Bún Đậu Mắm Tôm Hàng Khay	31 Hàng Khay, Hoàn Kiếm, Hà Nội	\N	21.028921	105.853221	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
93472888-19df-48a9-8994-7907ea27dee2	Phở Gia Truyền Bát Đàn	49 Bát Đàn, Hoàn Kiếm, Hà Nội	\N	21.034432	105.847142	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
eb33b12f-9a32-4481-9866-9b7b7ccfdec6	Bánh Mì 25	25 Hàng Cá, Hoàn Kiếm, Hà Nội	\N	21.034512	105.850214	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
5c4cdaa2-6dae-4c14-a519-78b09a8156ef	Bún Chả Hàng Quạt	74 Hàng Quạt, Hoàn Kiếm, Hà Nội	\N	21.032541	105.850734	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
991f7eb7-a57a-4501-884f-5240b1da90da	Miến Trộn Hàng Bạc	22 Hàng Bạc, Hoàn Kiếm, Hà Nội	\N	21.034932	105.851612	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c10d8ff6-c58d-4518-9cd5-37ad2cccc11f	Pizza Hut Cầu Giấy	307 Cầu Giấy, Cầu Giấy, Hà Nội	\N	21.033912	105.790214	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
09c1a7fb-80c5-4fb1-91e0-683e9e66a114	Al Fresco's Xuân Diệu	62 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.057441	105.820712	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0793e240-d7ef-4e77-87cf-146d10f392b4		Vân Hòa, Ba Vì, Hà Nội	\N	21.0689	105.3795	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b2f6dd66-8a30-43cb-8484-6c377aa5fc7f	El Gaucho Tây Hồ	11 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.057321	105.821012	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
4ba40119-2f27-4c97-b91b-f912eee47091	Pepperonis West Lake	23 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.058012	105.822541	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
33607604-83c7-47f4-aca2-7a1dd9e14231	Pizza 4P's Tây Hồ	31 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.058431	105.822873	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0f1d8382-252e-45c4-82e0-d8393d3a8906	Cộng Cà Phê Láng Hạ	78 Láng Hạ, Đống Đa, Hà Nội	\N	21.018621	105.814214	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
db6f8602-8f4d-4881-9edc-a4764aa2b38b	Highlands Coffee Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003211	105.816321	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
1b6df11e-df7b-442d-af6e-2075730dec77	The Coffee House Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003142	105.816512	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6adca2c5-eb5f-4e81-8cd8-62f8ff60019d	Starbucks Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003421	105.816721	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
d4b73aef-9898-4410-98b5-bc4e0002506d	AHA Cafe Nguyễn Trãi	168 Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.004212	105.817212	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e99ae35d-dc53-4f11-a98f-bdc5c820541d	Lotteria Big C Thăng Long	222 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.009712	105.800221	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
4914ebf0-2606-4613-aaa4-d8da9baf89f8	KFC Big C Thăng Long	222 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.009842	105.800412	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
bce5a2a9-f951-4aaf-9dfe-be29ace5af6b	Jollibee Big C Thăng Long	222 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.009931	105.800541	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ca4684c3-6353-4b8a-a4fb-75b19423a9cd	Texas Chicken Big C Thăng Long	222 Trần Duy Hưng, Cầu Giấy, Hà Nội	\N	21.009654	105.800732	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
836bf23f-0994-416c-bfff-3e428411d36a	McDonald's Phạm Hùng	72 Phạm Hùng, Nam Từ Liêm, Hà Nội	\N	21.017321	105.783412	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9e08aea4-735d-43ae-b410-3cdaf1f85a6c	Nhà Hàng Hải Sản Biển Đông	18 Nguyễn Văn Huyên, Cầu Giấy, Hà Nội	\N	21.042132	105.845312	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
8ba55918-34ab-4e98-be49-1b65142d19c7	Nhà Hàng Lẩu Đức Trọc	100 Trần Thái Tông, Cầu Giấy, Hà Nội	\N	21.041231	105.842421	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e8ceef9e-cfb1-47fb-80e7-b393e07f1cb9	Nhà Hàng Nét Huế	198 Hoàng Quốc Việt, Cầu Giấy, Hà Nội	\N	21.040312	105.843112	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
eea6c3a8-a119-4153-b52b-4344514b9f29	Nhà Hàng Vua Chả Cá	269 Hoàng Quốc Việt, Cầu Giấy, Hà Nội	\N	21.041112	105.844321	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b7214895-4dfb-407c-88db-8208d1507cdf	Nhà Hàng Lẩu Wang	235 Hoàng Quốc Việt, Cầu Giấy, Hà Nội	\N	21.039932	105.842981	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
cc297e3a-fd26-4d63-8229-f61cd1d12f3b	Phở Cuốn Hương Mai	25 Ngũ Xã, Ba Đình, Hà Nội	\N	21.056921	105.823412	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
d18b1818-8209-487c-bb2c-1b525022da27	Bún Ốc Cô Huệ	19 Ngũ Xã, Ba Đình, Hà Nội	\N	21.057214	105.822761	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
359b4755-a69c-4e81-a643-ed9d2b6061e8	Bún Cá Sâm Cây Si	5 Trung Yên, Hoàn Kiếm, Hà Nội	\N	21.034981	105.847912	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
8bcf5c35-f005-4141-bb72-254954f81a7b	Bún Chả Sinh Từ	57 Nguyễn Khuyến, Đống Đa, Hà Nội	\N	21.020842	105.836214	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
83dd8042-ea45-4108-b864-1b2a15e4b1fe	Miến Gà Kỳ Đồng	24 Kỳ Đồng, Hai Bà Trưng, Hà Nội	\N	21.018432	105.847221	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
a52c7f05-2d64-4c3e-aa28-e8fd33cb9ec4	Pizza Hut Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003232	105.816421	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c29e8b4e-794d-49ca-b296-a1699922f7d2	Al Fresco's Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003321	105.816512	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
80157f85-1ad9-45c8-97cd-d83ab2bd0f9d	Gogi House Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003451	105.816732	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
f8a83ba4-da04-477a-bb17-928e1751e7a0	King BBQ Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003581	105.816854	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
1a53012e-cdb1-4589-b517-faca688011b1	Manwah Royal City	72A Nguyễn Trãi, Thanh Xuân, Hà Nội	\N	21.003682	105.816912	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
81b0dac1-a447-49e9-9287-8703ff2a4ddf	Highlands Coffee Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.995842	105.868112	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
a2372a98-a6aa-471c-ab48-02ff31d21eab	The Coffee House Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.995932	105.868312	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
cda4bb5f-4c0b-453e-9cc2-ccfba84b577c	Starbucks Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.996012	105.868421	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
140b5867-0f72-47bf-99e1-9b93fe318825	Cộng Cà Phê Minh Khai	300 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.997132	105.867421	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
020b16b8-f830-4fe9-bdef-5d3cb4562219	AHA Cafe Minh Khai	350 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.996542	105.867912	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
d7282ace-52b5-4fc3-b29b-6c71a1b8f8ee	KFC AEON Mall Long Biên	27 Cổ Linh, Long Biên, Hà Nội	\N	21.026311	105.900712	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c4f4682c-6ad0-4069-bd67-ed63f961802d	Lotteria AEON Mall Long Biên	27 Cổ Linh, Long Biên, Hà Nội	\N	21.026411	105.900821	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
5317333f-0771-4f52-9eb4-4e84bec27520	Jollibee AEON Mall Long Biên	27 Cổ Linh, Long Biên, Hà Nội	\N	21.026521	105.900932	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c6094c46-9f29-4f2b-83fd-e9851ccd244b	Texas Chicken AEON Mall Long Biên	27 Cổ Linh, Long Biên, Hà Nội	\N	21.026621	105.900641	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b217f57a-137f-4e1a-b656-024146cb6b92	Pizza Hut AEON Mall Long Biên	27 Cổ Linh, Long Biên, Hà Nội	\N	21.026732	105.900752	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
919ad342-e5ee-47a7-af60-961b8feb82ab	Nhà Hàng Lẩu Nướng Gri & Gri	106 Trần Thái Tông, Cầu Giấy, Hà Nội	\N	21.037212	105.790241	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
56328956-2225-4ada-8bd3-19e60ebec69c	Nhà Hàng Hải Sản Phố	48 Duy Tân, Cầu Giấy, Hà Nội	\N	21.038124	105.791312	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
fd6ab06a-3a1f-4381-a9d0-a813fa45b240	Nhà Hàng Lẩu Phan Duy Tân	80 Duy Tân, Cầu Giấy, Hà Nội	\N	21.038821	105.792014	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c9fbdd8a-d97f-4f75-b5a8-03eaeeeed27f	Nhà Hàng Nướng Xuân Xuân	47 Trần Thái Tông, Cầu Giấy, Hà Nội	\N	21.039214	105.791621	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
67852fc8-7410-485c-a073-e4225fb3a363	Nhà Hàng Vua Lẩu	90 Trần Thái Tông, Cầu Giấy, Hà Nội	\N	21.037821	105.790812	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
00e96306-bb0d-4475-8d97-beb1ed34157d	Bún Bò Huế O Xuân	45 Lý Quốc Sư, Hoàn Kiếm, Hà Nội	\N	21.029412	105.848231	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
3a7b9fc2-73f1-4c00-b4a2-622022028bd8	Bánh Cuốn Bà Hoành	66 Tô Hiến Thành, Hai Bà Trưng, Hà Nội	\N	21.030214	105.848912	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
1549916b-c10c-4fce-8087-a176bc83a5a3	Phở Thìn Bờ Hồ	61 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.028521	105.853621	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b3e2c04e-394c-4dab-9535-291dfae79541	Bún Riêu Cua Hàng Bún	6 Hàng Bún, Ba Đình, Hà Nội	\N	21.036812	105.845912	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e504e306-44cf-497c-8de2-b0bf73055152	Miến Lươn Đông Thịnh	87 Hàng Điếu, Hoàn Kiếm, Hà Nội	\N	21.031942	105.846712	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
56b33d46-f134-42ea-853b-7dc65ca27456	Gogi House Vincom Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012421	105.851231	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ea1d76e6-a8d1-43f8-9a7e-2af072d14773	King BBQ Vincom Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012531	105.851341	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
1c06bc87-42f9-4e4f-b2ff-475852974d41	Kichi Kichi Vincom Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012612	105.851452	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
45015d1f-c502-402e-adb7-3fe655b4204e	Pizza 4P's Bà Triệu	24 Bà Triệu, Hoàn Kiếm, Hà Nội	\N	21.012712	105.851562	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
54fd5abb-fe8d-4dd7-9cdd-8215ad5da590	Sumo BBQ Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.012812	105.851671	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b09d35cd-59e3-4c73-ada7-7b96f2dde3b8	Highlands Coffee Tràng Tiền	1 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.024521	105.857312	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
4ddbaa61-d2cd-407a-9792-5e7214e0e402	Starbucks Tràng Tiền	32 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.024631	105.857421	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
03a3eccd-7839-4074-aac6-7831118a9b78	Cộng Cà Phê Nhà Thờ	27 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.024741	105.857521	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
5a14f47a-6a28-4df4-8738-237bbee283f6	The Coffee House Nhà Thờ	42 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.024852	105.857631	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
5f6c8378-cfb4-4b6d-823e-580d848d78bb	AHA Cafe Nhà Thờ	40 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.024961	105.857742	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
107c3a15-53dc-45b2-9771-7b100ec7adff	Lotteria Vincom Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.023812	105.809221	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0033730b-92b2-4de3-af40-f6fe151b190d	KFC Vincom Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.023912	105.809341	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9c4c4997-ccb8-468a-9f9a-484282b2a26f	Jollibee Vincom Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024021	105.809452	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6152dbc5-8e83-449b-a63c-5558c003f9c7	Pizza Hut Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024131	105.809561	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0ef6251d-5c47-45b4-9cd6-fd1b79c0c1c9	Texas Chicken Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024241	105.809671	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
f4611d48-96a7-4a7a-978f-f6343efd2955	Nhà Hàng Lẩu Phan Nguyễn Khang	92 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.030521	105.792231	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ba8e3dd6-0659-42e7-9aa3-dd121249eb63	Nhà Hàng Hải Sản Biển Đông Cầu Giấy	10 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.031231	105.793021	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0207609b-8086-4e6c-90aa-24c82d77531a	Nhà Hàng Vua Nướng	14 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.031842	105.793621	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
8f6fc2b5-c17b-47b5-b6d0-a340d1475187	Nhà Hàng Lẩu Đức Trọc Cầu Giấy	15 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.032321	105.794112	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9360bb8b-caa1-4a1c-8a79-02f04457a559	Nhà Hàng Lẩu Wang Cầu Giấy	20 Nguyễn Khang, Cầu Giấy, Hà Nội	\N	21.032912	105.794712	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6b19efd7-406d-4183-8347-65ca27b139ed	Bún Chả Hàng Mành	1 Hàng Mành, Hoàn Kiếm, Hà Nội	\N	21.032742	105.850221	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
251ecfaa-f860-4af2-90a8-665216d24ec1	Phở Lý Quốc Sư	10 Lý Quốc Sư, Hoàn Kiếm, Hà Nội	\N	21.029431	105.848122	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e4355868-66c3-46f9-b696-adc59e7fecb2	Bún Thang Bà Đức	48 Cầu Gỗ, Hoàn Kiếm, Hà Nội	\N	21.031542	105.848932	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
71a525e0-728a-496a-86de-56de646836cc	Chả Cá Thăng Long	21 Đường Thành, Hoàn Kiếm, Hà Nội	\N	21.034112	105.847332	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
df192f20-046e-4a50-a625-14503fb7b014	Miến Gà Nguyệt	5B Phủ Doãn, Hoàn Kiếm, Hà Nội	\N	21.034621	105.849441	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
35702ed6-1ee3-483d-814d-6f2c7341d835	Gogi House Vincom Phạm Ngọc Thạch	2 Phạm Ngọc Thạch, Đống Đa, Hà Nội	\N	21.007812	105.835211	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b1c5e749-e515-46ff-9577-42f636771287	Kichi Kichi Vincom Phạm Ngọc Thạch	2 Phạm Ngọc Thạch, Đống Đa, Hà Nội	\N	21.007921	105.835321	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
7bde51bf-3886-4e1c-9c29-b201e3c1e80f	King BBQ Vincom Phạm Ngọc Thạch	2 Phạm Ngọc Thạch, Đống Đa, Hà Nội	\N	21.008012	105.835441	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9d9f932a-1d60-4d2c-a6d8-611b7c5be140	Pizza Hut Phạm Ngọc Thạch	4 Phạm Ngọc Thạch, Đống Đa, Hà Nội	\N	21.008132	105.835551	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
22a6ac69-1fc3-4ba2-8be0-50297f624ed6	Lotteria Phạm Ngọc Thạch	6 Phạm Ngọc Thạch, Đống Đa, Hà Nội	\N	21.008231	105.835661	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
25296565-6dab-41f6-afe2-d22b13771885	Highlands Coffee Lotte Center	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.031521	105.813132	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ab5e38bf-8ce2-40a7-8757-54ec7ffb393c	Starbucks Lotte Center	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.031632	105.813241	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9eb0daeb-1534-4c84-974f-921da43dfa13	Cộng Cà Phê Liễu Giai	56 Liễu Giai, Ba Đình, Hà Nội	\N	21.031742	105.813351	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
f26ce8d0-ebf5-4ee8-bb56-05b49a63f7e7	The Coffee House Liễu Giai	58 Liễu Giai, Ba Đình, Hà Nội	\N	21.031852	105.813462	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
627bfdd0-45eb-4bd2-af74-23d7d9261166	AHA Cafe Liễu Giai	60 Liễu Giai, Ba Đình, Hà Nội	\N	21.031961	105.813571	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
2c456870-c653-45a7-93b9-158a458c418e	KFC Vincom Mega Mall Smart City	Tây Mỗ, Nam Từ Liêm, Hà Nội	\N	20.995832	105.748221	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
3cf54ef0-4674-43da-aa56-8d71def23d67	Lotteria Smart City	Tây Mỗ, Nam Từ Liêm, Hà Nội	\N	20.995921	105.748341	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ea66dae5-f825-44bd-9795-9d782e061aa1	Jollibee Smart City	Tây Mỗ, Nam Từ Liêm, Hà Nội	\N	20.996031	105.748451	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
a9080f85-4b75-448c-a786-2439d806f414	Pizza Hut Smart City	Tây Mỗ, Nam Từ Liêm, Hà Nội	\N	20.996141	105.748561	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
7b3ef7e9-ffdb-4b17-a2fc-cbf360b4f22c	Texas Chicken Smart City	Tây Mỗ, Nam Từ Liêm, Hà Nội	\N	20.996252	105.748671	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6943bc79-fe1f-49d0-a6a4-d9a83279d72b	Nhà Hàng Hải Sản Phố Hoàng Cầu	120 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015432	105.823241	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
16b85eea-2f60-4797-89fd-2c54cef9f0a1	Nhà Hàng Lẩu Đức Trọc Hoàng Cầu	130 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015521	105.823351	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
f1a594c4-d312-4afd-9fc9-4a851d9ebead	Nhà Hàng Lẩu Wang Hoàng Cầu	150 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015642	105.823461	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ec9b3ffa-5aa0-480d-8d0d-0db8d8e90906	Nhà Hàng Vua Nướng Hoàng Cầu	160 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015751	105.823571	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
f737472a-157d-4af5-8f27-c93357380767	Nhà Hàng Buffet Sen Hoàng Cầu	170 Hoàng Cầu, Đống Đa, Hà Nội	\N	21.015861	105.823681	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9f352f89-cbfd-466a-85fd-1b26f0a66b66	Bún Chả Hương Liên	24 Lê Văn Hưu, Hai Bà Trưng, Hà Nội	\N	21.017201	105.851021	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
017d9daa-d4f8-4f48-a491-143c36b65f85	Phở Thìn Lò Đúc	13 Lò Đúc, Hai Bà Trưng, Hà Nội	\N	21.015321	105.856312	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
bc264ceb-eba1-4da0-b54f-435651868372	Bánh Cuốn Gia An	25 Thọ Xương, Hoàn Kiếm, Hà Nội	\N	21.019541	105.850221	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
506ee052-8803-44ad-a4e7-73b0ec8ac146	Miến Gà Phủ Doãn	3 Phủ Doãn, Hoàn Kiếm, Hà Nội	\N	21.030112	105.848912	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
45fe2f26-1256-41e8-9e15-14fde7dd99d8	Bún Cá Hàng Đậu	42 Hàng Đậu, Ba Đình, Hà Nội	\N	21.036212	105.846421	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
a50c7825-ebf6-4bdb-a627-9b00d93ba75e	Gogi House Vincom Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.023951	105.809441	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
587ec386-158c-4244-8d5b-18e56fafa4c9	Kichi Kichi Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024061	105.809551	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
38c5132c-badb-466d-aeb7-e4341c7095c8	King BBQ Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024171	105.809661	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
13eb8d49-b308-470f-943a-c9aaebbf7907	Pizza Hut Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024281	105.809771	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
1d402e61-fc61-4e13-8faf-d54252a4228b	Lotteria Nguyễn Chí Thanh	54A Nguyễn Chí Thanh, Đống Đa, Hà Nội	\N	21.024391	105.809881	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b3285ea5-9b53-473c-a2d4-901f547acd19	Highlands Coffee Hồ Gươm	1-3 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.028341	105.852531	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
f397175f-697c-474d-9dbe-db599cc8be44	Starbucks Nhà Thờ	6 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.025021	105.851921	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
59e32a85-d85f-4398-806d-413b60b65fc0	Cộng Cà Phê Hồ Gươm	7 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.028651	105.852741	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
7ab0f121-8d92-4601-a04f-4ab66ad83af2	The Coffee House Hồ Gươm	4 Lê Thái Tổ, Hoàn Kiếm, Hà Nội	\N	21.028781	105.852861	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
75948d4f-7e5a-45bd-b234-f1b2fc24d073	AHA Cafe Hàng Gai	60 Hàng Gai, Hoàn Kiếm, Hà Nội	\N	21.031421	105.850312	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6430c51a-a36d-487e-9a6c-c66a805072bb	KFC Vincom Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.995912	105.868321	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
975e2b15-4ccb-48d4-b4df-07188a85d9b7	Lotteria Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.996021	105.868431	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
079e6d02-2fa2-40ff-a461-0951b32d9043	Jollibee Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.996131	105.868541	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9fcd7415-b38c-40dd-a5d2-964bec81a182	Pizza Hut Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.996241	105.868651	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
5e082ae1-657a-4f23-8702-c4af153973f4	Texas Chicken Times City	458 Minh Khai, Hai Bà Trưng, Hà Nội	\N	20.996351	105.868761	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0ac266f2-4ce7-45db-849a-1c13ae79b758	Nhà Hàng Lẩu Phan Trung Hòa	100 Trung Hòa, Cầu Giấy, Hà Nội	\N	21.012341	105.801421	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
d2b139cb-82f8-43bf-87dd-f1f8f82b08bb	Nhà Hàng Hải Sản Phố Trung Hòa	120 Trung Hòa, Cầu Giấy, Hà Nội	\N	21.012451	105.801531	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
cea8f034-d755-4891-812f-76f3dcc71e0d	Nhà Hàng Lẩu Wang Trung Hòa	150 Trung Hòa, Cầu Giấy, Hà Nội	\N	21.012561	105.801641	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
997b8405-ee5b-4fc1-8e11-10734ae07162	Nhà Hàng Vua Nướng Trung Hòa	170 Trung Hòa, Cầu Giấy, Hà Nội	\N	21.012671	105.801751	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e575974a-4994-45fa-9ea6-39f5d8290e88	Nhà Hàng Buffet Sen Trung Hòa	200 Trung Hòa, Cầu Giấy, Hà Nội	\N	21.012781	105.801861	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
57277901-7c80-467d-8f35-145d0f3b568d	Bún Bò Huế O Xuân Đống Đa	50 Thái Hà, Đống Đa, Hà Nội	\N	21.014212	105.827241	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
d453a679-8d3d-4364-aa7e-0507f6aa5189	Phở Gà Nguyệt	5B Phủ Doãn, Hoàn Kiếm, Hà Nội	\N	21.015112	105.828231	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
403a9485-f12a-46be-9297-315a74d41211	Bún Riêu Hàng Bạc	11 Hàng Bạc, Hoàn Kiếm, Hà Nội	\N	21.034832	105.851731	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
90f3638f-2188-40e2-bd0c-6164c08a9774	Bánh Mì Bami Bread	98 Hàng Bông, Hoàn Kiếm, Hà Nội	\N	21.029821	105.846521	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ef5202b0-c6ba-406e-ad1a-09b152ed3c8c	Bún Đậu Mắm Tôm Hàng Khay	31 Hàng Khay, Hoàn Kiếm, Hà Nội	\N	21.028751	105.853411	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
964ec174-97b8-4090-a23f-fbb563a04ab7	Pizza 4P's Phan Kế Bính	5 Phan Kế Bính, Ba Đình, Hà Nội	\N	21.034912	105.809321	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
a699f951-6568-412c-b026-3e3345333e97	Al Fresco's Phan Kế Bính	23 Phan Kế Bính, Ba Đình, Hà Nội	\N	21.035021	105.809431	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b954f3ec-1a43-4b6f-8ac0-2e6e2a85c9ac	Gogi House Phan Kế Bính	29 Phan Kế Bính, Ba Đình, Hà Nội	\N	21.035131	105.809541	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ea9b41f9-bfda-4043-945e-1f449a1f4639	King BBQ Phan Kế Bính	33 Phan Kế Bính, Ba Đình, Hà Nội	\N	21.035241	105.809651	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c8d93e27-5051-4483-8f97-088b7edfed91	Kichi Kichi Phan Kế Bính	35 Phan Kế Bính, Ba Đình, Hà Nội	\N	21.035351	105.809761	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
86c9f5c4-08cd-4d85-a513-f8a8b0f38fe6	Nhà Hàng Hải Sản Cua Bay	25 Nguyễn Hoàng Tôn, Tây Hồ, Hà Nội	\N	21.042312	105.815421	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0a8a0e68-6e9c-444d-8dc1-bbc86a3ca73b	Nhà Hàng Lẩu Nướng KiKo	40 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.042421	105.815531	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
2f70a770-8aaf-42dd-954a-6e861bea3cd4	Nhà Hàng Vua Lẩu Tây Hồ	50 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.042531	105.815641	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
c6bd7694-e959-4aea-957e-c61328608c43	Nhà Hàng Buffet Poseidon	98 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.042641	105.815751	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
8623a0fb-3139-4c97-b890-eded537172ff	Nhà Hàng Sen Tây Hồ	614 Lạc Long Quân, Tây Hồ, Hà Nội	\N	21.041912	105.816231	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0a7c1ea4-7cf9-480b-a670-0591f1f3dd62		Xã Hương Sơn, Mỹ Đức, Hà Nội	\N	20.6075	105.7052	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
3f698d0f-cc51-4dd5-bc75-e83985b01ea7		Khu vực bến Đục, Hương Sơn, Mỹ Đức, Hà Nội	\N	20.6081	105.7039	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
76c25051-bb2d-474f-bdb2-3bad7b29d665		Gần bến Yến, Hương Sơn, Mỹ Đức, Hà Nội	\N	20.6068	105.7045	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
9abe94bf-08ff-4d60-a590-3bae4ceaf058		Khu du lịch Chùa Hương, Mỹ Đức, Hà Nội	\N	20.609	105.7061	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ecf36b88-2b47-45bc-b104-baf06536101e		Bến Đục, Hương Sơn, Mỹ Đức, Hà Nội	\N	20.6079	105.703	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
16583be7-af80-4979-a17d-f5dcd9afc477		Cốt 600, Vườn Quốc gia Ba Vì, Hà Nội	\N	21.0793	105.3638	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
2c377fbe-788e-4395-9ca0-096637ac42b1		Khu du lịch Ba Vì, Tản Lĩnh, Ba Vì, Hà Nội	\N	21.0825	105.3609	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e614998b-a204-442d-b8b5-c8a04085e441		Tản Lĩnh, Ba Vì, Hà Nội	\N	21.0752	105.3587	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
817b4320-e398-4fd2-afb3-7aa5ee08341b		Nam Phương Tiến, Chương Mỹ, Hà Nội	\N	20.7412	105.6451	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
6f90783f-a9ed-4dbd-b310-a9c92ca0d277		Thị trấn Xuân Mai, Chương Mỹ, Hà Nội	\N	20.7398	105.6483	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e36d0453-175f-434f-9e58-91537af5f7bd		Khu vực gần Đồi Bù, Chương Mỹ, Hà Nội	\N	20.7425	105.6427	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
083c1bcf-b280-405c-882f-90b3db6d55bd		Xuân Mai, Chương Mỹ, Hà Nội	\N	20.7389	105.647	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
4713987d-6197-4492-b4f8-0ac36e278808		Trung tâm Xuân Mai, Chương Mỹ, Hà Nội	\N	20.7405	105.6492	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
b3108a30-9c3b-4754-90df-9db667e55a88		Làng cổ Đường Lâm, Sơn Tây, Hà Nội	\N	21.1395	105.4078	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
88938982-87d6-4a8c-a790-cdb0d48c0d51		Thôn Mông Phụ, Đường Lâm, Sơn Tây, Hà Nội	\N	21.1387	105.4069	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
26e7d683-43ed-49f0-b397-01c13627cb9c		Trung tâm Sơn Tây, Hà Nội	\N	21.1372	105.4125	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
ace4a961-65db-48bc-b885-b5459da96b54		Sơn Tây, Hà Nội	\N	21.1365	105.414	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
0f08bf4d-d93d-4fc1-aaff-ba6a811b05f4		Đường Lâm, Sơn Tây, Hà Nội	\N	21.1402	105.4055	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
cb0417d1-13e2-47f4-91bf-43994311bf16		Thị trấn Quốc Oai, Hà Nội	\N	20.9735	105.6008	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
a59850dd-9bc2-46f9-b229-21d3860e59c1		Khu vực Hòa Lạc, Quốc Oai, Hà Nội	\N	20.9712	105.5903	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
17589f00-1ab9-455a-a693-9c1639f53819		Thạch Thất, Hà Nội	\N	20.9698	105.5857	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
834eeb68-a2c9-4d57-a373-2c02fb2fdc41		Quốc Oai, Hà Nội	\N	20.9751	105.6032	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
17e5d078-f2e4-43ca-a14f-31483c43672b		Gần Chùa Thầy, Quốc Oai, Hà Nội	\N	20.9724	105.5989	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
4b45252b-5093-4c6a-a771-3e42fad2c561		Mê Linh, Hà Nội	\N	21.1785	105.7253	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
1b91af6e-6bf2-481f-8b76-2bffa7fed39e		Khu vực Mê Linh - Phúc Yên	\N	21.1802	105.7201	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
86c7f15c-c25d-478b-bb90-4d86f5bafab4		Gần Đền Hai Bà Trưng, Mê Linh	\N	21.1769	105.728	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
2a670ff8-ddf5-4c72-b928-7c1341a4d0c3		Mê Linh, Hà Nội	\N	21.1821	105.7235	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
8b7a27a0-b141-423a-a5da-51bfe820e6ac		Gần trung tâm Mê Linh, Hà Nội	\N	21.1794	105.7272	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
e43ec6c7-1622-4f73-8108-6b6cdf394810		Khu vực Hồ Hàm Lợn, Sóc Sơn, Hà Nội	\N	21.3085	105.7802	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
d9cb7be6-4f58-4748-9abf-057a85640cb9		Sóc Sơn, Hà Nội	\N	21.3059	105.782	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
faf7a25d-51b5-40c5-a7ee-86fbbdcf81b3		Gần núi Hàm Lợn, Sóc Sơn, Hà Nội	\N	21.3101	105.7768	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
12372a73-123a-4732-81e6-a62e47b4ef82		Khu vực hồ Hàm Lợn, Hà Nội	\N	21.3073	105.7791	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
85b9a6ea-ca5c-4aee-a4f5-6d304db5909a		Xã Minh Trí, Sóc Sơn, Hà Nội	\N	21.3047	105.7835	restaurant	\N	0.0	0	2026-03-23 23:45:11.676027
8999c993-67d4-448b-aae2-320c9dd088b7	Highlands Coffee Hồ Gươm	10 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.030421	105.852791	shop	\N	0.0	0	2026-03-23 23:45:35.666511
9b8ca875-872c-4300-8a64-1a80de54c270	Circle K Hàng Bài	59 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.027947	105.852329	shop	\N	0.0	0	2026-03-23 23:45:35.666511
a102545f-d07c-4326-a0d1-c57b2138a8e8	Miniso Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.025604	105.854182	shop	\N	0.0	0	2026-03-23 23:45:35.666511
2256b16d-a3fc-4e0a-9663-37d812cb2a4d	Guardian Tràng Tiền	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02593	105.853912	shop	\N	0.0	0	2026-03-23 23:45:35.666511
7c9920b4-d1e4-4034-a28e-9dc731d03170	WinMart Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.025812	105.854116	shop	\N	0.0	0	2026-03-23 23:45:35.666511
545e2e03-c0fe-4b01-9ae6-ee2efd6dd12f	Circle K Tôn Đức Thắng	221 Tôn Đức Thắng, Đống Đa, Hà Nội	\N	21.029411	105.834978	shop	\N	0.0	0	2026-03-23 23:45:35.666511
784f7e94-2ca6-414c-bcd4-16208d85a7a9	Highlands Coffee Quốc Tử Giám	19 Quốc Tử Giám, Đống Đa, Hà Nội	\N	21.02859	105.835821	shop	\N	0.0	0	2026-03-23 23:45:35.666511
6eaff1c8-7f3e-4f3c-9c67-53758a03ac30	WinMart Quốc Tử Giám	58 Quốc Tử Giám, Đống Đa, Hà Nội	\N	21.027512	105.83602	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0850529e-837a-4a9d-a85b-4ecde889c97e	Phúc Long Coffee Đống Đa	54 Quốc Tử Giám, Đống Đa, Hà Nội	\N	21.028931	105.836241	shop	\N	0.0	0	2026-03-23 23:45:35.666511
c8c770ad-9416-47d5-a493-ef7bbd9f5805	Guardian Tôn Đức Thắng	219 Tôn Đức Thắng, Đống Đa, Hà Nội	\N	21.029223	105.835617	shop	\N	0.0	0	2026-03-23 23:45:35.666511
62751c2a-7f25-48a7-986f-ae804853e11e	Circle K Điện Biên Phủ	31 Điện Biên Phủ, Ba Đình, Hà Nội	\N	21.037391	105.833821	shop	\N	0.0	0	2026-03-23 23:45:35.666511
840e4dd7-a3b6-41cd-a7c3-7138f9f7d95e	WinMart Ba Đình	72 Điện Biên Phủ, Ba Đình, Hà Nội	\N	21.036207	105.835028	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1956dff0-019a-4d45-a6fc-110b71a23639	Highlands Coffee Hùng Vương	28 Hùng Vương, Ba Đình, Hà Nội	\N	21.037	105.834	shop	\N	0.0	0	2026-03-23 23:45:35.666511
7980e111-158c-4c56-bf0b-c7a37f1432cf	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03658	105.83621	shop	\N	0.0	0	2026-03-23 23:45:35.666511
451a5d48-6671-4a52-b245-d4d6ac480011	Guardian Kim Mã	636 Kim Mã, Ba Đình, Hà Nội	\N	21.03677	105.83559	shop	\N	0.0	0	2026-03-23 23:45:35.666511
b7670469-2cfc-4c41-8ca8-3bbc712e732c	Circle K Ngọc Hà	45 Ngọc Hà, Ba Đình, Hà Nội	\N	21.03534	105.83312	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1b2d1621-53d1-4b56-8b68-f13a71d59fed	Highlands Coffee Ba Đình	22 Ngọc Hà, Ba Đình, Hà Nội	\N	21.03595	105.83405	shop	\N	0.0	0	2026-03-23 23:45:35.666511
f39ceae1-4851-4572-bb6d-740d612fe97b	WinMart Ngọc Hà	52 Ngọc Hà, Ba Đình, Hà Nội	\N	21.03487	105.8329	shop	\N	0.0	0	2026-03-23 23:45:35.666511
51dd1a68-5409-4e25-a6fe-206569182276	Guardian Đội Cấn	210 Đội Cấn, Ba Đình, Hà Nội	\N	21.03602	105.8321	shop	\N	0.0	0	2026-03-23 23:45:35.666511
64418029-f009-4469-bec4-3e12b4ecf903	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03661	105.8362	shop	\N	0.0	0	2026-03-23 23:45:35.666511
a5f51ab9-8b62-40a6-a848-e78ecacd0368	Circle K Hoàng Diệu	12 Hoàng Diệu, Ba Đình, Hà Nội	\N	21.0359	105.84121	shop	\N	0.0	0	2026-03-23 23:45:35.666511
999d727c-4727-47ce-87b4-c41a3d299757	Highlands Coffee Điện Biên Phủ	45 Điện Biên Phủ, Ba Đình, Hà Nội	\N	21.03487	105.83991	shop	\N	0.0	0	2026-03-23 23:45:35.666511
34d79995-fce6-4185-98d2-f570dcae2718	WinMart Hoàng Thành	19 Hoàng Diệu, Ba Đình, Hà Nội	\N	21.0342	105.8406	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1ad498f5-343f-4f48-b0f7-5c65ed7d7a17	Guardian Nguyễn Thái Học	155 Nguyễn Thái Học, Ba Đình, Hà Nội	\N	21.03391	105.83987	shop	\N	0.0	0	2026-03-23 23:45:35.666511
78078221-1bb4-446e-8ce4-5c4fa15482b7	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03658	105.83621	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5757b4dd-1f4d-41ef-8205-6ec6fcf7ed8f	Circle K Đinh Tiên Hoàng	25 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.03021	105.85202	shop	\N	0.0	0	2026-03-23 23:45:35.666511
dfdb8bbe-5ad5-4a95-922d-6010faad6ebe	Highlands Coffee Hàng Tre	12 Hàng Tre, Hoàn Kiếm, Hà Nội	\N	21.03145	105.85312	shop	\N	0.0	0	2026-03-23 23:45:35.666511
9c2407cd-9b08-41a3-afa6-0341902b3ed2	WinMart Hàng Dầu	1 Hàng Dầu, Hoàn Kiếm, Hà Nội	\N	21.03301	105.85395	shop	\N	0.0	0	2026-03-23 23:45:35.666511
9cf32c01-7504-443a-9d07-4e1e74393a0d	Guardian Hàng Bạc	41 Hàng Bạc, Hoàn Kiếm, Hà Nội	\N	21.03198	105.85172	shop	\N	0.0	0	2026-03-23 23:45:35.666511
9b97a2f5-9639-4dd7-a57b-4b2a874c2b86	Miniso Hàng Ngang	48 Hàng Ngang, Hoàn Kiếm, Hà Nội	\N	21.03252	105.85264	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1c486455-4c52-4b5f-91de-563d78d586c3	Circle K Nguyễn Tri Phương	15 Nguyễn Tri Phương, Ba Đình, Hà Nội	\N	21.03314	105.83921	shop	\N	0.0	0	2026-03-23 23:45:35.666511
6ecca673-18c7-46e6-8907-ea3b09def00e	Highlands Coffee Điện Biên Phủ	55 Điện Biên Phủ, Ba Đình, Hà Nội	\N	21.03287	105.83894	shop	\N	0.0	0	2026-03-23 23:45:35.666511
d248e051-d9a7-4d2f-b832-224d71338fcd	WinMart Nguyễn Thái Học	98 Nguyễn Thái Học, Ba Đình, Hà Nội	\N	21.03198	105.84045	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1aaebfc1-9c88-4d14-ad8f-a089c88efefc	Guardian Kim Mã	298 Kim Mã, Ba Đình, Hà Nội	\N	21.0342	105.83791	shop	\N	0.0	0	2026-03-23 23:45:35.666511
8c66616c-ec5c-4a25-8b0b-76b18fd67a2c	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03658	105.83621	shop	\N	0.0	0	2026-03-23 23:45:35.666511
99abe707-ceb2-4a9b-9fb0-5abb3bcc3c0a	Circle K Hai Bà Trưng	120 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02498	105.84691	shop	\N	0.0	0	2026-03-23 23:45:35.666511
aaeedbdf-d09f-4ffe-a606-196ffd56780d	Highlands Coffee Trần Hưng Đạo	40 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội	\N	21.02542	105.84732	shop	\N	0.0	0	2026-03-23 23:45:35.666511
39dee06f-95ab-4a3c-84ca-3dd924565c63	WinMart Lý Thường Kiệt	92 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội	\N	21.02421	105.84588	shop	\N	0.0	0	2026-03-23 23:45:35.666511
11b86c42-43c3-4a3f-a451-612c342ace5f	Guardian Hàng Bài	45 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.02574	105.84801	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5235336b-399d-47f4-9918-cd5222ce60c7	Miniso Tràng Tiền	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.025604	105.854182	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0c5cafca-79ef-4b06-ae73-be8318309b6c	Circle K Thanh Niên	12 Thanh Niên, Ba Đình, Hà Nội	\N	21.04252	105.83704	shop	\N	0.0	0	2026-03-23 23:45:35.666511
446893c5-75ac-409d-b098-4cd833b48688	Highlands Coffee Quán Thánh	65 Quán Thánh, Ba Đình, Hà Nội	\N	21.04311	105.83587	shop	\N	0.0	0	2026-03-23 23:45:35.666511
c9a2b125-033d-4659-9ef3-4c746c6a3e8d	WinMart Ba Đình	20 Quán Thánh, Ba Đình, Hà Nội	\N	21.04178	105.83691	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5a0feae9-339f-4a3b-81a7-7f98e7681d12	Guardian Phan Đình Phùng	58 Phan Đình Phùng, Ba Đình, Hà Nội	\N	21.04102	105.83811	shop	\N	0.0	0	2026-03-23 23:45:35.666511
aa591d66-a87c-48d5-84d1-519dc3fb3596	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03658	105.83621	shop	\N	0.0	0	2026-03-23 23:45:35.666511
8638f8aa-d9d5-4f86-8659-43c5efdf0209	Circle K Tây Hồ	111 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05482	105.81956	shop	\N	0.0	0	2026-03-23 23:45:35.666511
cf771992-5cb0-4cd8-a763-1222297aaf64	Highlands Coffee Xuân Diệu	85 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05531	105.82021	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5d8956d4-ce53-4e80-8fc2-69dc5ab080ab	WinMart Xuân Diệu	67 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05394	105.82103	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1555d814-5f52-4b08-a4cc-24302b786e5d	Guardian Tây Hồ	51 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05278	105.82054	shop	\N	0.0	0	2026-03-23 23:45:35.666511
a33e85d9-1cd2-4fd2-bc9d-b61abda1b263	Miniso Xuân Diệu	73 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05422	105.82141	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1da506a4-e0fd-4aae-9f51-a26594d56a6d	Circle K Yên Phụ	120 Yên Phụ, Tây Hồ, Hà Nội	\N	21.04821	105.83612	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0c70c4cd-cb6c-4a89-a107-4706d8b9cc81	Highlands Coffee Thanh Niên	35 Thanh Niên, Tây Hồ, Hà Nội	\N	21.04792	105.83554	shop	\N	0.0	0	2026-03-23 23:45:35.666511
90e3f5c3-5e44-4b80-9b37-bbb9ea3b17da	WinMart Yên Phụ	68 Yên Phụ, Tây Hồ, Hà Nội	\N	21.0471	105.83721	shop	\N	0.0	0	2026-03-23 23:45:35.666511
87cf8431-694a-4704-89ab-b0efe4b7456f	Guardian Trúc Bạch	22 Trúc Bạch, Ba Đình, Hà Nội	\N	21.04678	105.83601	shop	\N	0.0	0	2026-03-23 23:45:35.666511
79ae154d-4a53-48a8-b696-9cb32619540e	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03658	105.83621	shop	\N	0.0	0	2026-03-23 23:45:35.666511
475c3aee-cad3-4857-ad6f-9c3856f1b0ae	Circle K Mê Linh	Mê Linh Plaza, Mê Linh, Hà Nội	\N	21.15572	105.73361	shop	\N	0.0	0	2026-03-23 23:45:35.666511
ede10538-ccee-434a-90fc-cbba3133d90c	WinMart Mê Linh	Khu đô thị Quang Minh, Mê Linh, Hà Nội	\N	21.15621	105.73401	shop	\N	0.0	0	2026-03-23 23:45:35.666511
de68b6a7-92ce-4cef-9ff2-c8bed5bcc5b0	Highlands Coffee Mê Linh Plaza	Mê Linh Plaza, Quang Minh, Mê Linh, Hà Nội	\N	21.1572	105.73521	shop	\N	0.0	0	2026-03-23 23:45:35.666511
ec99069f-5af1-4983-b41d-669d292eb695	Guardian Mê Linh	Khu đô thị Quang Minh, Mê Linh, Hà Nội	\N	21.15602	105.73298	shop	\N	0.0	0	2026-03-23 23:45:35.666511
700b3f54-d07a-415a-b974-905c8bdcddcb	Miniso Mê Linh Plaza	Mê Linh Plaza, Quang Minh, Mê Linh, Hà Nội	\N	21.15715	105.73534	shop	\N	0.0	0	2026-03-23 23:45:35.666511
a59a4bdd-bd97-4d99-8dac-b365363f9dcc	Circle K Hương Sơn	Hương Sơn, Mỹ Đức, Hà Nội	\N	20.61841	105.74699	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0e92c4e6-c918-4d5d-8adf-695160e0531e	WinMart Mỹ Đức	Thị trấn Đại Nghĩa, Mỹ Đức, Hà Nội	\N	20.62012	105.74788	shop	\N	0.0	0	2026-03-23 23:45:35.666511
ad789b81-0db2-40f9-b193-ee105441b661	Highlands Coffee Mỹ Đức	Đại Nghĩa, Mỹ Đức, Hà Nội	\N	20.6212	105.74851	shop	\N	0.0	0	2026-03-23 23:45:35.666511
6c3ef950-d548-4ce3-b505-d6cea98a2745	Guardian Mỹ Đức	Trung tâm Mỹ Đức, Hà Nội	\N	20.6199	105.74732	shop	\N	0.0	0	2026-03-23 23:45:35.666511
94a6bf8c-04be-49a7-aeb1-822ed249a694	Miniso Mỹ Đức	Đại Nghĩa, Mỹ Đức, Hà Nội	\N	20.62054	105.74821	shop	\N	0.0	0	2026-03-23 23:45:35.666511
df157102-ed50-4eea-90d1-5a6980bf2a2c	Circle K Quốc Oai	Thị trấn Quốc Oai, Hà Nội	\N	21.02334	105.64678	shop	\N	0.0	0	2026-03-23 23:45:35.666511
01ec4b4a-940c-4e6b-aaf6-2b799069e520	WinMart Quốc Oai	Phố Huyện, Quốc Oai, Hà Nội	\N	21.02281	105.64599	shop	\N	0.0	0	2026-03-23 23:45:35.666511
3e3df373-9c4e-4175-ae73-e4c00759c24b	Highlands Coffee Quốc Oai	Phố Huyện, Quốc Oai, Hà Nội	\N	21.02372	105.64611	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0a95080d-2764-4bed-8150-4002876774f3	Guardian Quốc Oai	Thị trấn Quốc Oai, Hà Nội	\N	21.02256	105.64702	shop	\N	0.0	0	2026-03-23 23:45:35.666511
28d8c99c-162b-4b6b-82e1-1cf7faf34a7f	Miniso Quốc Oai	Trung tâm Quốc Oai, Hà Nội	\N	21.02304	105.64588	shop	\N	0.0	0	2026-03-23 23:45:35.666511
e6391199-178b-4374-a7d8-79a9886c516c	Circle K Xuân Diệu	89 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05381	105.82109	shop	\N	0.0	0	2026-03-23 23:45:35.666511
617985be-b6c8-4d4b-b59a-3780be215394	Highlands Coffee Tây Hồ	95 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05442	105.82054	shop	\N	0.0	0	2026-03-23 23:45:35.666511
658ca549-00d4-4e55-be71-3a27d0e33670	WinMart Xuân Diệu	67 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05394	105.82103	shop	\N	0.0	0	2026-03-23 23:45:35.666511
e93f140e-1b80-44f2-b9c9-390d0b7e9ccb	Guardian Tây Hồ	51 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05278	105.82054	shop	\N	0.0	0	2026-03-23 23:45:35.666511
d29a327b-c33c-4c6b-b639-9c0ea75db92e	Miniso Xuân Diệu	73 Xuân Diệu, Tây Hồ, Hà Nội	\N	21.05422	105.82141	shop	\N	0.0	0	2026-03-23 23:45:35.666511
c862fbfb-faaf-4278-a90d-da740a3afa4a	Circle K Đại Cồ Việt	95 Đại Cồ Việt, Hai Bà Trưng, Hà Nội	\N	21.01502	105.84421	shop	\N	0.0	0	2026-03-23 23:45:35.666511
079c79c8-771e-4ea8-87d4-b02a4b8166ca	Highlands Coffee Lê Duẩn	87 Lê Duẩn, Hai Bà Trưng, Hà Nội	\N	21.01461	105.84359	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0dccd48d-adb3-4999-9956-ed0c18153c32	WinMart Lê Duẩn	112 Lê Duẩn, Hai Bà Trưng, Hà Nội	\N	21.01398	105.84512	shop	\N	0.0	0	2026-03-23 23:45:35.666511
a31c19aa-6d63-4f53-8355-1d777e663fb4	Guardian Hai Bà Trưng	142 Hai Bà Trưng, Hà Nội	\N	21.01434	105.84462	shop	\N	0.0	0	2026-03-23 23:45:35.666511
7ecaf3e6-b5f6-47bf-9279-e0abfa8198ce	Miniso Vincom Bà Triệu	191 Bà Triệu, Hai Bà Trưng, Hà Nội	\N	21.01192	105.84921	shop	\N	0.0	0	2026-03-23 23:45:35.666511
507b0442-487e-43fe-8c15-fcec9ec58bab	Circle K Yên Sở	Tam Trinh, Hoàng Mai, Hà Nội	\N	20.96498	105.85481	shop	\N	0.0	0	2026-03-23 23:45:35.666511
362a2589-2d04-4348-8c7f-eec7f2f91ead	Highlands Coffee Hoàng Mai	885 Tam Trinh, Hoàng Mai, Hà Nội	\N	20.96621	105.85442	shop	\N	0.0	0	2026-03-23 23:45:35.666511
ffe258cd-53e9-4e49-8633-5c0648f50b55	WinMart Hoàng Mai	Tam Trinh, Hoàng Mai, Hà Nội	\N	20.96534	105.85391	shop	\N	0.0	0	2026-03-23 23:45:35.666511
b95ac12a-631d-44f4-9b70-ce06aff581fd	Guardian Hoàng Mai	Khu đô thị Yên Sở, Hoàng Mai, Hà Nội	\N	20.96452	105.85377	shop	\N	0.0	0	2026-03-23 23:45:35.666511
121d1ed1-cb3f-47cb-bc31-a4366713d456	Miniso Hoàng Mai	Gamuda Gardens, Hoàng Mai, Hà Nội	\N	20.96578	105.85521	shop	\N	0.0	0	2026-03-23 23:45:35.666511
01c2fc59-f91e-4c58-a285-cc1b3e71003b	Circle K Kim Mã	304 Kim Mã, Ba Đình, Hà Nội	\N	21.03145	105.80412	shop	\N	0.0	0	2026-03-23 23:45:35.666511
e70dcad0-b757-4743-ad45-8095edd0c608	Highlands Coffee Liễu Giai	29 Liễu Giai, Ba Đình, Hà Nội	\N	21.03098	105.80502	shop	\N	0.0	0	2026-03-23 23:45:35.666511
e121f49d-c39e-42a2-b800-448d3df8477c	WinMart Liễu Giai	54 Liễu Giai, Ba Đình, Hà Nội	\N	21.03121	105.80454	shop	\N	0.0	0	2026-03-23 23:45:35.666511
41dd3e6d-83f7-4435-a605-c0fd7f686bf8	Guardian Lotte Center	Lotte Center, 54 Liễu Giai, Ba Đình, Hà Nội	\N	21.0332	105.81341	shop	\N	0.0	0	2026-03-23 23:45:35.666511
c6629fe5-5544-4ff3-8738-02f0251e94df	Miniso Lotte Center	Lotte Center, 54 Liễu Giai, Ba Đình, Hà Nội	\N	21.03315	105.81332	shop	\N	0.0	0	2026-03-23 23:45:35.666511
f70e109f-ec6c-486d-98b6-1a18c7145dfa	Circle K Nhật Tân	Âu Cơ, Tây Hồ, Hà Nội	\N	21.07892	105.83542	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1d837aaf-4662-49b6-bd1c-e8110922a939	Highlands Coffee Nhật Tân	Âu Cơ, Tây Hồ, Hà Nội	\N	21.07931	105.83601	shop	\N	0.0	0	2026-03-23 23:45:35.666511
7f601e39-19f1-486d-b7b4-6981e5891e4f	WinMart Nhật Tân	Nhật Tân, Tây Hồ, Hà Nội	\N	21.07798	105.83491	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1d0ff4ad-3b78-4ecc-87df-519ad40e7d80	Guardian Nhật Tân	Âu Cơ, Tây Hồ, Hà Nội	\N	21.07821	105.83512	shop	\N	0.0	0	2026-03-23 23:45:35.666511
553bc241-24cc-458f-bfb9-213b95c87394	Miniso Tây Hồ	Âu Cơ, Tây Hồ, Hà Nội	\N	21.07692	105.83398	shop	\N	0.0	0	2026-03-23 23:45:35.666511
2983f990-f7dd-4714-937d-8b7370fef5d2	Circle K Nhật Tân Flower Village	Làng hoa Nhật Tân, Tây Hồ, Hà Nội	\N	21.08412	105.82291	shop	\N	0.0	0	2026-03-23 23:45:35.666511
dd34c6b9-cd47-4c87-bc8a-fed3fa49fe4e	Highlands Coffee Nhật Tân	Nhật Tân, Tây Hồ, Hà Nội	\N	21.08364	105.82321	shop	\N	0.0	0	2026-03-23 23:45:35.666511
8b1ab1a5-4503-4e4f-b395-d570931909ad	WinMart Nhật Tân	Nhật Tân, Tây Hồ, Hà Nội	\N	21.08312	105.82241	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0ec6cae5-3b4c-48e5-a833-d6495d4b5f13	Guardian Tây Hồ	Âu Cơ, Tây Hồ, Hà Nội	\N	21.08254	105.82311	shop	\N	0.0	0	2026-03-23 23:45:35.666511
3f69f171-abb5-4bec-a78d-bd131a89dec1	Miniso Xuân Diệu	Xuân Diệu, Tây Hồ, Hà Nội	\N	21.08192	105.82191	shop	\N	0.0	0	2026-03-23 23:45:35.666511
de270bc0-9b05-475f-a085-4d1c2879efd3	Circle K Sóc Sơn	Thị trấn Sóc Sơn, Hà Nội	\N	21.30241	105.80121	shop	\N	0.0	0	2026-03-23 23:45:35.666511
23b1b66e-6c03-4322-8a3f-38cce1d3819c	Highlands Coffee Sóc Sơn	Phố Núi Đôi, Sóc Sơn, Hà Nội	\N	21.30302	105.80091	shop	\N	0.0	0	2026-03-23 23:45:35.666511
ef3177a5-a6a0-4cb0-b322-6f6798338d88	WinMart Sóc Sơn	Trung tâm Sóc Sơn, Hà Nội	\N	21.30198	105.80214	shop	\N	0.0	0	2026-03-23 23:45:35.666511
63210bdf-8a1f-4c61-abb1-6db8b920b635	Guardian Sóc Sơn	Thị trấn Sóc Sơn, Hà Nội	\N	21.30256	105.80154	shop	\N	0.0	0	2026-03-23 23:45:35.666511
19f797d1-6c60-4c07-b66f-649c1b062e20	Miniso Sóc Sơn Plaza	Sóc Sơn Plaza, Hà Nội	\N	21.30287	105.80074	shop	\N	0.0	0	2026-03-23 23:45:35.666511
443a9a7f-4265-4992-b7bb-1824fc100405	Circle K Chương Mỹ	Thị trấn Chúc Sơn, Chương Mỹ, Hà Nội	\N	20.83291	105.58254	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1a41cea0-c57d-4b75-8a30-3111d4427715	Highlands Coffee Chương Mỹ	Chúc Sơn, Chương Mỹ, Hà Nội	\N	20.83321	105.58302	shop	\N	0.0	0	2026-03-23 23:45:35.666511
cf2cfefa-4aeb-407b-b3b8-bd3a7ee6ac8a	WinMart Chương Mỹ	Trung tâm Chúc Sơn, Chương Mỹ, Hà Nội	\N	20.83211	105.58194	shop	\N	0.0	0	2026-03-23 23:45:35.666511
c20bc781-b3e8-4442-9a45-68bde6806f0a	Guardian Chương Mỹ	Thị trấn Chúc Sơn, Chương Mỹ, Hà Nội	\N	20.83302	105.58221	shop	\N	0.0	0	2026-03-23 23:45:35.666511
211db4ca-feea-43be-a2d1-8acc5fb73814	Miniso Chương Mỹ Center	Trung tâm Chúc Sơn, Chương Mỹ, Hà Nội	\N	20.83254	105.58321	shop	\N	0.0	0	2026-03-23 23:45:35.666511
31819dce-2323-498a-aa68-738130e259c9	Circle K Ba Vì	Thị trấn Tây Đằng, Ba Vì, Hà Nội	\N	21.08172	105.36321	shop	\N	0.0	0	2026-03-23 23:45:35.666511
d5fa2cea-3bac-4979-b3d8-686adb3e83f0	Highlands Coffee Ba Vì	Tây Đằng, Ba Vì, Hà Nội	\N	21.08091	105.36402	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5e3a5c1a-06fb-4ce9-b100-ee1f01f4abfa	WinMart Ba Vì	Trung tâm Tây Đằng, Ba Vì, Hà Nội	\N	21.08211	105.36298	shop	\N	0.0	0	2026-03-23 23:45:35.666511
d70215fb-4c56-4475-8f7b-6bdb37cc57a7	Guardian Ba Vì	Tây Đằng, Ba Vì, Hà Nội	\N	21.08143	105.36378	shop	\N	0.0	0	2026-03-23 23:45:35.666511
47a8c692-a6e5-4aef-ba2b-84b59a5af718	Miniso Ba Vì Plaza	Ba Vì Plaza, Hà Nội	\N	21.08054	105.36421	shop	\N	0.0	0	2026-03-23 23:45:35.666511
320274e3-3dec-48c6-b6c0-50ec74b48146	Circle K Cầu Giấy	85 Cầu Giấy, Hà Nội	\N	21.04112	105.79912	shop	\N	0.0	0	2026-03-23 23:45:35.666511
f243a89b-30ed-4876-a52c-bc7c3497b317	Highlands Coffee Nguyễn Văn Huyên	165 Nguyễn Văn Huyên, Cầu Giấy, Hà Nội	\N	21.04081	105.79862	shop	\N	0.0	0	2026-03-23 23:45:35.666511
41e548e7-6e49-405d-b3d2-c4e54ce7829b	WinMart Cầu Giấy	302 Cầu Giấy, Hà Nội	\N	21.03991	105.79978	shop	\N	0.0	0	2026-03-23 23:45:35.666511
9fc56916-e837-4d54-afeb-221418ce43ea	Guardian Cầu Giấy	165 Cầu Giấy, Hà Nội	\N	21.04021	105.79899	shop	\N	0.0	0	2026-03-23 23:45:35.666511
ceca98ee-34b1-472a-b76b-38bc22c8049a	Miniso Indochina Plaza	Indochina Plaza, 241 Xuân Thủy, Cầu Giấy, Hà Nội	\N	21.03761	105.78298	shop	\N	0.0	0	2026-03-23 23:45:35.666511
e5dd687e-54c9-4950-9098-5822030d5ce3	Circle K Tràng Tiền	8 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.02492	105.85872	shop	\N	0.0	0	2026-03-23 23:45:35.666511
6581bae4-5612-403a-b9e0-caac471aa6cd	Highlands Coffee Tràng Tiền	2 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.02461	105.85821	shop	\N	0.0	0	2026-03-23 23:45:35.666511
2c99a25c-5991-4a16-9fee-554eb855122b	WinMart Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02581	105.85412	shop	\N	0.0	0	2026-03-23 23:45:35.666511
55d0503c-bdf8-4862-a1da-42d73125d824	Guardian Tràng Tiền	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02593	105.85391	shop	\N	0.0	0	2026-03-23 23:45:35.666511
d2a02a78-a307-4fa6-9b2e-0a9013aa145c	Miniso Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.0256	105.85418	shop	\N	0.0	0	2026-03-23 23:45:35.666511
e6eadc5f-3301-4ece-9ca0-1ee6ac4eb8ad	Circle K Nguyễn Thái Học	123 Nguyễn Thái Học, Ba Đình, Hà Nội	\N	21.03098	105.83692	shop	\N	0.0	0	2026-03-23 23:45:35.666511
c0f35802-309c-46f0-87b6-ea0e5ef48c48	Highlands Coffee Nguyễn Thái Học	101 Nguyễn Thái Học, Ba Đình, Hà Nội	\N	21.03041	105.83754	shop	\N	0.0	0	2026-03-23 23:45:35.666511
c455ba48-becd-4e4b-98d8-bdef8a2a2d96	WinMart Đống Đa	58 Nguyễn Thái Học, Ba Đình, Hà Nội	\N	21.02998	105.83611	shop	\N	0.0	0	2026-03-23 23:45:35.666511
3b34fb9b-cd2c-4892-acb6-1b5afc8f2a47	Guardian Kim Mã	298 Kim Mã, Ba Đình, Hà Nội	\N	21.03112	105.83698	shop	\N	0.0	0	2026-03-23 23:45:35.666511
fe1e04f2-b620-43d8-8c8a-4b91239a9b27	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03658	105.83621	shop	\N	0.0	0	2026-03-23 23:45:35.666511
c24d87b2-38b8-4ab3-a2e1-29c8f8a56aac	Circle K Lý Thường Kiệt	25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội	\N	21.02364	105.85232	shop	\N	0.0	0	2026-03-23 23:45:35.666511
2b2a5aeb-b62f-4bb4-b975-0c5742989194	Highlands Coffee Lý Thường Kiệt	27 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội	\N	21.02398	105.85164	shop	\N	0.0	0	2026-03-23 23:45:35.666511
81224abc-8e8a-45b9-a22d-c68044b242b3	WinMart Hoàn Kiếm	31 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội	\N	21.02298	105.85298	shop	\N	0.0	0	2026-03-23 23:45:35.666511
08d1dd23-8a35-4db8-9b83-9415057104dd	Guardian Hàng Bài	45 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.02574	105.84801	shop	\N	0.0	0	2026-03-23 23:45:35.666511
e9a6e8e6-e7a2-400f-98b5-b75baabab856	Miniso Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.025604	105.854182	shop	\N	0.0	0	2026-03-23 23:45:35.666511
53a66359-0b46-4741-a6c1-7b72dd6cb95b	Circle K Nguyễn Thái Học	18 Nguyễn Thái Học, Ba Đình, Hà Nội	\N	21.03521	105.83321	shop	\N	0.0	0	2026-03-23 23:45:35.666511
6fae6d68-0591-4f9f-a07a-a36ee45df201	Highlands Coffee Kim Mã	45 Kim Mã, Ba Đình, Hà Nội	\N	21.03591	105.83401	shop	\N	0.0	0	2026-03-23 23:45:35.666511
dc135190-6c64-49c8-af16-07918e7c33c3	WinMart Ba Đình	72 Điện Biên Phủ, Ba Đình, Hà Nội	\N	21.03621	105.83502	shop	\N	0.0	0	2026-03-23 23:45:35.666511
422df00c-9f05-45e7-9d41-e51b9da46760	Guardian Kim Mã	636 Kim Mã, Ba Đình, Hà Nội	\N	21.03677	105.83559	shop	\N	0.0	0	2026-03-23 23:45:35.666511
b75c1221-e641-470b-8242-f7a2dd857722	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03658	105.83621	shop	\N	0.0	0	2026-03-23 23:45:35.666511
4be2be48-fd9b-4912-9d1c-d0fd2cfaad8c	Circle K Tràng Tiền	8 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.02491	105.85872	shop	\N	0.0	0	2026-03-23 23:45:35.666511
d206fa20-0f42-4c1f-a19d-107427f953a2	Highlands Coffee Nhà Hát Lớn	1 Tràng Tiền, Hoàn Kiếm, Hà Nội	\N	21.02454	105.85791	shop	\N	0.0	0	2026-03-23 23:45:35.666511
02401cb6-bf96-4ac2-9663-b0b06b2bdf47	WinMart Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02581	105.85412	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5d0b1fc4-7f53-4f85-a8ea-395294ab6aa1	Guardian Hàng Bài	45 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.02574	105.84801	shop	\N	0.0	0	2026-03-23 23:45:35.666511
7b9f441d-efda-43ad-9eff-41c56d84c773	Miniso Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.0256	105.85418	shop	\N	0.0	0	2026-03-23 23:45:35.666511
d4a604f5-944f-4cc2-a1d2-989595d22ac1	Circle K Long Biên	2 Ngô Gia Tự, Long Biên, Hà Nội	\N	21.04392	105.85821	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1639ea4a-92f6-4d7c-8ae9-eddfad730851	Highlands Coffee Long Biên	5 Ngô Gia Tự, Long Biên, Hà Nội	\N	21.04421	105.85772	shop	\N	0.0	0	2026-03-23 23:45:35.666511
78d5f422-5112-48bf-8b1c-2c9232fdba2e	WinMart Long Biên	10 Ngô Gia Tự, Long Biên, Hà Nội	\N	21.04291	105.85912	shop	\N	0.0	0	2026-03-23 23:45:35.666511
aa3b6072-ae1a-4797-a673-1010d49b5813	Guardian Long Biên	8 Ngô Gia Tự, Long Biên, Hà Nội	\N	21.04351	105.85864	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5b536451-42e6-42f0-bd1e-f8285ece3236	Miniso AEON Long Biên	AEON Mall Long Biên, 27 Cổ Linh, Long Biên, Hà Nội	\N	21.02661	105.90082	shop	\N	0.0	0	2026-03-23 23:45:35.666511
8c2905f8-9183-43b3-b9b9-3ce9210ffe5d	Circle K Nhà Thờ	7 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.02821	105.84842	shop	\N	0.0	0	2026-03-23 23:45:35.666511
2f05616f-9177-4141-bf4c-58b5b771a638	Highlands Coffee Nhà Thờ	9 Nhà Thờ, Hoàn Kiếm, Hà Nội	\N	21.02864	105.84896	shop	\N	0.0	0	2026-03-23 23:45:35.666511
88179f45-5eb3-463d-b8ee-fabbdfda9dd4	WinMart Hoàn Kiếm	25 Nhà Chung, Hoàn Kiếm, Hà Nội	\N	21.02781	105.84921	shop	\N	0.0	0	2026-03-23 23:45:35.666511
afe27bca-7a4e-4e8a-9efa-b2ca3d316d2a	Guardian Hàng Bông	76 Hàng Bông, Hoàn Kiếm, Hà Nội	\N	21.02894	105.84761	shop	\N	0.0	0	2026-03-23 23:45:35.666511
9914a427-c0ac-46a7-8b87-9a28d1931493	Miniso Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.025604	105.854182	shop	\N	0.0	0	2026-03-23 23:45:35.666511
feb468e0-b01c-4971-a2ee-d83d576cc34a	Circle K Điện Biên Phủ	40 Điện Biên Phủ, Ba Đình, Hà Nội	\N	21.03611	105.83498	shop	\N	0.0	0	2026-03-23 23:45:35.666511
ce494717-f9b7-4f2d-89f6-4854c95dea40	Highlands Coffee Ba Đình	28 Điện Biên Phủ, Ba Đình, Hà Nội	\N	21.03678	105.83452	shop	\N	0.0	0	2026-03-23 23:45:35.666511
ce36a14d-fa54-4e2b-8f1a-231800b09743	WinMart Ba Đình	72 Điện Biên Phủ, Ba Đình, Hà Nội	\N	21.03594	105.83512	shop	\N	0.0	0	2026-03-23 23:45:35.666511
48dcc2e9-5a9c-442e-b1d2-e9f13785e1c1	Guardian Kim Mã	636 Kim Mã, Ba Đình, Hà Nội	\N	21.03677	105.83559	shop	\N	0.0	0	2026-03-23 23:45:35.666511
3b699075-03b1-4320-9e39-7e8c0c8d60f4	Miniso Kim Mã	670 Kim Mã, Ba Đình, Hà Nội	\N	21.03658	105.83621	shop	\N	0.0	0	2026-03-23 23:45:35.666511
d14c02e8-d369-4473-a3f1-657bd7d400df	Circle K Hàng Gai	58 Hàng Gai, Hoàn Kiếm, Hà Nội	\N	21.03164	105.85092	shop	\N	0.0	0	2026-03-23 23:45:35.666511
bc085705-e886-4771-b232-21af9a4a1201	Highlands Coffee Hàng Đào	32 Hàng Đào, Hoàn Kiếm, Hà Nội	\N	21.03198	105.85132	shop	\N	0.0	0	2026-03-23 23:45:35.666511
763a43d2-1c61-498c-9ff0-49043f79eea5	WinMart Hoàn Kiếm	45 Hàng Gai, Hoàn Kiếm, Hà Nội	\N	21.03221	105.85021	shop	\N	0.0	0	2026-03-23 23:45:35.666511
aa243ae0-7da2-4564-a8eb-c9282deb575e	Guardian Hàng Bạc	41 Hàng Bạc, Hoàn Kiếm, Hà Nội	\N	21.03178	105.85164	shop	\N	0.0	0	2026-03-23 23:45:35.666511
b6253de4-90f6-4764-a210-354daffb86fa	Miniso Hàng Ngang	48 Hàng Ngang, Hoàn Kiếm, Hà Nội	\N	21.03252	105.85264	shop	\N	0.0	0	2026-03-23 23:45:35.666511
938897a7-c2c1-49be-830c-59367e208764	Circle K Hàng Buồm	18 Hàng Buồm, Hoàn Kiếm, Hà Nội	\N	21.03421	105.85122	shop	\N	0.0	0	2026-03-23 23:45:35.666511
9f88b307-3f08-4118-bb40-b0c35ecb0487	Highlands Coffee Tạ Hiện	12 Tạ Hiện, Hoàn Kiếm, Hà Nội	\N	21.03512	105.85178	shop	\N	0.0	0	2026-03-23 23:45:35.666511
7a506f3a-ab28-4c13-a17d-8524ba5d6ff7	WinMart Hàng Giấy	28 Hàng Giấy, Hoàn Kiếm, Hà Nội	\N	21.03342	105.85088	shop	\N	0.0	0	2026-03-23 23:45:35.666511
bb0ca9ea-3ffe-4f61-8f14-4d07baf3690b	Guardian Hàng Bạc	41 Hàng Bạc, Hoàn Kiếm, Hà Nội	\N	21.03178	105.85164	shop	\N	0.0	0	2026-03-23 23:45:35.666511
6dbc658a-d072-40f4-aac7-e59835eb736d	Miniso Hàng Ngang	48 Hàng Ngang, Hoàn Kiếm, Hà Nội	\N	21.03252	105.85264	shop	\N	0.0	0	2026-03-23 23:45:35.666511
576404d6-5f9a-42eb-83a7-22437d50d313	Circle K Đinh Tiên Hoàng	25 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.03194	105.85121	shop	\N	0.0	0	2026-03-23 23:45:35.666511
3e9b363a-113f-4497-8f1a-ffb76cd9d773	Highlands Coffee Hồ Gươm	10 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội	\N	21.03121	105.85212	shop	\N	0.0	0	2026-03-23 23:45:35.666511
77af2eeb-5f78-4ebc-a60f-ffd46e6e160c	WinMart Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02581	105.85412	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5b553c4d-ecf1-41ed-90df-ac3b6f5c1f39	Guardian Tràng Tiền	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02593	105.85391	shop	\N	0.0	0	2026-03-23 23:45:35.666511
a7e0be0a-e5d9-4bf3-99aa-61d203290f2c	Miniso Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.025604	105.854182	shop	\N	0.0	0	2026-03-23 23:45:35.666511
97290b08-1976-424b-9aad-025bd656528b	Circle K Hai Bà Trưng	120 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02511	105.84791	shop	\N	0.0	0	2026-03-23 23:45:35.666511
a33a7192-086c-436c-bc64-79c3028db528	Highlands Coffee Phố Sách	19/12 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội	\N	21.02542	105.84832	shop	\N	0.0	0	2026-03-23 23:45:35.666511
43ef1406-2aeb-4ce5-8384-ca3e8ed3563d	WinMart Hai Bà Trưng	150 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.02489	105.84742	shop	\N	0.0	0	2026-03-23 23:45:35.666511
38333528-5567-4c3d-a92c-4f4fa5572691	Guardian Hàng Bài	45 Hàng Bài, Hoàn Kiếm, Hà Nội	\N	21.02574	105.84801	shop	\N	0.0	0	2026-03-23 23:45:35.666511
b0c928e8-fc13-476a-ae3e-8141fa115954	Miniso Tràng Tiền Plaza	24 Hai Bà Trưng, Hoàn Kiếm, Hà Nội	\N	21.025604	105.854182	shop	\N	0.0	0	2026-03-23 23:45:35.666511
1a36c030-9ca6-459a-8ec3-8e3cdae71cfc	Circle K Bát Tràng	Làng gốm Bát Tràng, Gia Lâm, Hà Nội	\N	20.97421	105.91382	shop	\N	0.0	0	2026-03-23 23:45:35.666511
e1faa831-f900-446d-aa7a-78bdbb9d12a6	Highlands Coffee Gia Lâm	Trung tâm Bát Tràng, Gia Lâm, Hà Nội	\N	20.97382	105.91294	shop	\N	0.0	0	2026-03-23 23:45:35.666511
19c48966-7e88-4438-aef1-1e1a7a1e1735	WinMart Gia Lâm	Bát Tràng, Gia Lâm, Hà Nội	\N	20.97521	105.91421	shop	\N	0.0	0	2026-03-23 23:45:35.666511
5c046f41-8c89-4f79-af4c-e7a61f3315d7	Guardian Gia Lâm	Trung tâm Bát Tràng, Gia Lâm, Hà Nội	\N	20.97462	105.91312	shop	\N	0.0	0	2026-03-23 23:45:35.666511
37f5c50d-21df-4593-9be4-9966bcd1a360	Miniso AEON Long Biên	AEON Mall Long Biên, 27 Cổ Linh, Long Biên, Hà Nội	\N	21.02661	105.90082	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0b5ca596-a585-4e4f-a854-57b3dec20785	Circle K Sơn Tây	Trung tâm Sơn Tây, Hà Nội	\N	21.15712	105.47291	shop	\N	0.0	0	2026-03-23 23:45:35.666511
52d9b1ae-0e37-4aa5-8855-526c0331a178	Highlands Coffee Sơn Tây	Phố Quang Trung, Sơn Tây, Hà Nội	\N	21.15821	105.47341	shop	\N	0.0	0	2026-03-23 23:45:35.666511
59f1f7be-020d-4f7c-b48b-f50ccfcc9f97	WinMart Sơn Tây	Quang Trung, Sơn Tây, Hà Nội	\N	21.15682	105.47191	shop	\N	0.0	0	2026-03-23 23:45:35.666511
4e09a1ee-dddf-4959-af57-a7a64fed56a0	Guardian Sơn Tây	Trung tâm Sơn Tây, Hà Nội	\N	21.15754	105.47212	shop	\N	0.0	0	2026-03-23 23:45:35.666511
0833ff9d-a41e-4549-8deb-308fee1042f4	Miniso Sơn Tây Plaza	Sơn Tây Plaza, Hà Nội	\N	21.15798	105.47398	shop	\N	0.0	0	2026-03-23 23:45:35.666511
\.


--
-- TOC entry 5011 (class 0 OID 16518)
-- Dependencies: 223
-- Data for Name: opening_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opening_hours (id, location_id, day_of_week, open_time, close_time) FROM stdin;
d9058400-9886-4dab-9bd3-a824c3086208	e98e3637-02fd-4007-a86f-7a8cbedae14d	monday	00:00	23:59
e4460c36-09c4-4d44-b587-374aad9ff7b8	e98e3637-02fd-4007-a86f-7a8cbedae14d	tuesday	00:00	23:59
6c428181-1881-4b28-a749-985fb8755b2d	e98e3637-02fd-4007-a86f-7a8cbedae14d	wednesday	00:00	23:59
8aeb2529-e06e-4d0c-9efe-74f6628046d4	e98e3637-02fd-4007-a86f-7a8cbedae14d	friday	00:00	23:59
3317d04c-ecf6-47e2-8958-3d97400e8e7e	e98e3637-02fd-4007-a86f-7a8cbedae14d	saturday	00:00	23:59
76705205-728d-4653-823d-1f5ba0b4adb2	e98e3637-02fd-4007-a86f-7a8cbedae14d	sunday	00:00	23:59
4f439193-f003-4773-a72d-a583d96f011e	8a113806-2f0c-43d3-afd1-5f17fe33fa68	monday	00:00	23:59
f2925078-f2fc-40e6-be7b-e7516e0abc05	8a113806-2f0c-43d3-afd1-5f17fe33fa68	tuesday	07:30	11:30
b12d585d-4dfc-4cd6-b037-cd9b2c934c85	8a113806-2f0c-43d3-afd1-5f17fe33fa68	wednesday	07:30	11:30
ab506d51-026a-4dfd-a866-484d743e2b8f	8a113806-2f0c-43d3-afd1-5f17fe33fa68	friday	00:00	23:59
88a3e08c-5fb8-4ded-b4bc-27f914b0b45d	8a113806-2f0c-43d3-afd1-5f17fe33fa68	saturday	07:30	11:30
ae984be4-7946-44bd-b0ea-b2a4349f7ced	8a113806-2f0c-43d3-afd1-5f17fe33fa68	sunday	07:30	11:30
ae68ead9-14ee-4d94-8ff0-192b656b5747	b814d2d7-9afd-4716-8eba-83cadfb40800	monday	07:00	18:00
eb1ba049-c72e-4127-879e-0c8ab9ae3d2c	b814d2d7-9afd-4716-8eba-83cadfb40800	tuesday	07:00	18:00
e65a0506-bcd9-4852-849f-b7ed01de1bc6	b814d2d7-9afd-4716-8eba-83cadfb40800	wednesday	07:00	18:00
41191016-566d-4960-b117-f87cd645a867	b814d2d7-9afd-4716-8eba-83cadfb40800	friday	07:00	18:00
dd7e35a5-f0d3-4048-ba38-c6ad519f4fc5	b814d2d7-9afd-4716-8eba-83cadfb40800	saturday	07:00	18:00
9312963a-4f54-4440-99b9-157247d45a4b	b814d2d7-9afd-4716-8eba-83cadfb40800	sunday	07:00	18:00
bae4fb00-4564-4186-8fe5-687f27d8ce60	1a8cdf42-c231-41d8-8802-e8f0619a3c69	monday	08:00	17:00
220a391e-088b-4a40-95c1-4ca6869f6caa	1a8cdf42-c231-41d8-8802-e8f0619a3c69	tuesday	07:00	18:00
b02b4d28-605d-4a63-857e-38f9904c8d2f	1a8cdf42-c231-41d8-8802-e8f0619a3c69	wednesday	07:00	18:00
04dcafdf-d118-4086-9683-a18e55f45ba4	1a8cdf42-c231-41d8-8802-e8f0619a3c69	friday	07:00	18:00
d06f4967-de2c-4eb9-87fa-876293eed279	1a8cdf42-c231-41d8-8802-e8f0619a3c69	saturday	07:00	18:00
3e13e3f2-12df-4b92-a67f-2b849d583def	1a8cdf42-c231-41d8-8802-e8f0619a3c69	sunday	07:00	18:00
9c1ec582-3fb3-4a31-a9ed-893ab0e7da83	e9a414ee-097e-4935-a7f2-ff9af30e5911	monday	07:00	19:00
d5defa25-8232-4310-8c57-70df3d217403	e9a414ee-097e-4935-a7f2-ff9af30e5911	tuesday	07:00	19:00
b64ce389-62fe-4d83-bed1-279e78849cda	e9a414ee-097e-4935-a7f2-ff9af30e5911	wednesday	07:00	19:00
d05f07f2-5d2c-410a-a3cd-b78cc5af99ef	e9a414ee-097e-4935-a7f2-ff9af30e5911	friday	07:00	22:00
0d4ca825-2b5d-4950-8ab1-5dd55d32abc9	e9a414ee-097e-4935-a7f2-ff9af30e5911	saturday	07:00	22:00
07d21fb4-ac51-412c-90f1-3270619d1dc2	e9a414ee-097e-4935-a7f2-ff9af30e5911	sunday	07:00	22:00
b0d33374-3173-4d56-9bfd-91aa0fdedfc2	a715f38d-7560-48c3-9808-03edd21c6fe9	monday	08:00	17:00
1e9b6310-17a6-4752-a1cd-5b47fb38b3c0	a715f38d-7560-48c3-9808-03edd21c6fe9	tuesday	08:00	17:00
3418931d-c747-4d3b-8caa-a0eedbb8c074	a715f38d-7560-48c3-9808-03edd21c6fe9	wednesday	08:00	17:00
aa982e30-bd46-483b-a2a2-0d84352509da	a715f38d-7560-48c3-9808-03edd21c6fe9	friday	08:00	17:00
7067a3f9-2b69-4ea4-969a-6408c6946e08	a715f38d-7560-48c3-9808-03edd21c6fe9	saturday	08:00	17:00
40351741-0331-44d0-aa5d-c15a5923e063	a715f38d-7560-48c3-9808-03edd21c6fe9	sunday	08:00	17:00
1d4777c1-7b29-4852-8b5a-b58b417fcc1b	b5343ac8-2288-4e10-aca9-7fa2a9377faa	monday	08:00	17:00
df66d954-c2b0-4f14-93ce-792942b79790	b5343ac8-2288-4e10-aca9-7fa2a9377faa	tuesday	08:00	17:00
0bab8873-0cb8-40a3-9df4-15ffe6558d90	b5343ac8-2288-4e10-aca9-7fa2a9377faa	wednesday	08:00	17:00
545d60d6-5a77-45a2-9e97-c09934eb37cb	b5343ac8-2288-4e10-aca9-7fa2a9377faa	friday	08:00	17:00
d40ad1a4-1abe-4d88-b01c-c21560914f77	b5343ac8-2288-4e10-aca9-7fa2a9377faa	saturday	08:00	17:00
c6056fca-8162-433b-8304-9ac4503a487e	b5343ac8-2288-4e10-aca9-7fa2a9377faa	sunday	08:00	17:00
2090a0da-2994-48de-94bf-37af6b71926d	8dc280e5-51bf-4425-9ea4-72658ba86e4e	monday	08:00	17:00
9ffc3ae5-a334-4395-93ff-0bd4c9ca33aa	8dc280e5-51bf-4425-9ea4-72658ba86e4e	tuesday	08:00	17:00
e198c6c5-f03b-47cb-ab45-135f9367b8a3	8dc280e5-51bf-4425-9ea4-72658ba86e4e	wednesday	08:00	17:00
b79a8e8a-ec30-4573-8a5e-102ae0f01e4a	8dc280e5-51bf-4425-9ea4-72658ba86e4e	friday	08:00	17:00
383395e0-8d27-490a-bc3b-70ce49605dcb	8dc280e5-51bf-4425-9ea4-72658ba86e4e	saturday	08:00	17:00
eb72648d-224a-4249-807e-ba555d7d8589	8dc280e5-51bf-4425-9ea4-72658ba86e4e	sunday	08:00	17:00
242f5b41-a5e1-4548-ba0e-fc52593f6759	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	monday	05:00	18:00
6e24c084-72f6-4544-8f0d-c7e706158a96	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	tuesday	05:00	18:00
0386cfd3-f642-4892-82dd-eb6bed53bbe5	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	wednesday	05:00	18:00
03c07be3-d926-40f3-95b6-f564715519ec	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	friday	05:00	18:00
8bd001f4-00e4-46b4-9854-a65c2fbffeae	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	saturday	05:00	18:00
d05e59b7-b17a-41ab-9002-288ed0e4537d	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	sunday	05:00	18:00
af78f481-a8e0-4b48-ad02-75db89285c52	6ca1a762-6d41-4072-a0c3-827c77601871	monday	07:30:00	11:00 13:30-17:00
fd0bae25-c64f-46ee-b0af-2d29b3979602	6ca1a762-6d41-4072-a0c3-827c77601871	tuesday	07:30:00	11:00 13:30-17:00
c29243f1-20b5-494d-aa24-3599e8f082af	6ca1a762-6d41-4072-a0c3-827c77601871	wednesday	07:30:00	11:00 13:30-17:00
baeffdb4-1491-40bb-8cd8-43d7783389ba	6ca1a762-6d41-4072-a0c3-827c77601871	friday	07:30:00	11:00 13:30-17:00
33113a3a-42f0-48e4-9851-125d8abc45c8	6ca1a762-6d41-4072-a0c3-827c77601871	saturday	07:30:00	11:00 13:30-17:00
7ff1048c-bf30-404e-b9ea-12c6d1e595a0	6ca1a762-6d41-4072-a0c3-827c77601871	sunday	07:30:00	11:00 13:30-17:00
9b9a82b3-1413-4cba-8f5d-86e5e103c666	e476ce92-8f33-446a-900b-4ca04e6ff141	monday	06:30	18:30
53966fac-4ce5-4526-bc5a-c32587ae5175	e476ce92-8f33-446a-900b-4ca04e6ff141	tuesday	06:30	18:30
d9907eaf-cafc-4fce-9218-4ea4d8a22234	e476ce92-8f33-446a-900b-4ca04e6ff141	wednesday	06:30	18:30
d815ac5c-72ca-4b3e-87e9-0736b730e507	e476ce92-8f33-446a-900b-4ca04e6ff141	friday	06:30	18:30
3c5dd14c-01bf-48e4-a05d-0c2ed6f13085	e476ce92-8f33-446a-900b-4ca04e6ff141	saturday	06:30	18:30
ce3db6a9-e7f2-4ee7-81f6-c81cf0e18a7e	e476ce92-8f33-446a-900b-4ca04e6ff141	sunday	06:30	18:30
056ab544-3dac-46e9-94fd-5e8ad203ce6c	b6b3878a-61ae-464e-8a00-880c9b7df23a	monday	00:00	23:59
c18bf18c-205f-47e9-afa8-1413643928ac	b6b3878a-61ae-464e-8a00-880c9b7df23a	tuesday	00:00	23:59
41a4cab8-14f4-4157-b759-ec894ac353e4	b6b3878a-61ae-464e-8a00-880c9b7df23a	wednesday	00:00	23:59
ac47e603-803f-4ced-8c17-8e63fa1cfcd3	b6b3878a-61ae-464e-8a00-880c9b7df23a	friday	00:00	23:59
8c54a360-8b87-4690-b163-dd0632e80960	b6b3878a-61ae-464e-8a00-880c9b7df23a	saturday	00:00	23:59
82f7a017-08b1-45cc-aae0-f082dd9c0c18	b6b3878a-61ae-464e-8a00-880c9b7df23a	sunday	00:00	23:59
2237f4bd-aab8-42c1-aa15-eb2612b593c6	227b3fd9-af71-4514-b798-8ac1dc941554	monday	08:00	17:00
35812c4e-a894-4be4-b7f4-6b39288cac39	227b3fd9-af71-4514-b798-8ac1dc941554	tuesday	08:00	17:00
96b741da-fa97-4c0f-b027-a3b5e4173708	227b3fd9-af71-4514-b798-8ac1dc941554	wednesday	08:00	17:00
fd3a40c0-51fe-47c1-a428-c9f487cb01a9	227b3fd9-af71-4514-b798-8ac1dc941554	friday	08:00	17:00
de6f92ed-9757-4aec-a567-ae45fafcdbab	227b3fd9-af71-4514-b798-8ac1dc941554	saturday	08:00	17:00
f8fa8ce3-82aa-4fa3-9846-3477fa68d333	227b3fd9-af71-4514-b798-8ac1dc941554	sunday	08:00	17:00
1d76e26d-2293-44ea-a4c5-c4906c7ab6c9	093a94c5-f7b7-4a99-94d2-74ed61d4786e	monday	00:00	23:59
88c6e99d-8cf1-4726-b5e5-2e58bedf917f	093a94c5-f7b7-4a99-94d2-74ed61d4786e	tuesday	00:00	23:59
4bc96ca5-548d-42dc-a69e-dc9c7a1d31bc	093a94c5-f7b7-4a99-94d2-74ed61d4786e	wednesday	00:00	23:59
80dbec39-cf42-4573-8b6a-dd08f3b33764	093a94c5-f7b7-4a99-94d2-74ed61d4786e	friday	00:00	23:59
1a7ff242-abdf-4f5e-b3f4-7b2cdf43ccc7	093a94c5-f7b7-4a99-94d2-74ed61d4786e	saturday	00:00	23:59
98ae800b-3073-4670-bee0-47c2b67f5ba0	093a94c5-f7b7-4a99-94d2-74ed61d4786e	sunday	00:00	23:59
9e93655d-bad8-4652-856f-ba51ce47ff34	57fc3023-9402-48eb-b128-e3eb44cf4273	monday	06:00	22:00
41a083d7-159b-4d5c-a615-fdf992e17425	57fc3023-9402-48eb-b128-e3eb44cf4273	tuesday	06:00	22:00
5a0a380e-d533-4f41-aac7-fab58e6c8a2c	57fc3023-9402-48eb-b128-e3eb44cf4273	wednesday	06:00	22:00
d8cb72c1-e94b-48c9-9684-326a6faf428e	57fc3023-9402-48eb-b128-e3eb44cf4273	friday	06:00	22:00
fe472b82-461c-41ae-82d1-6440326f8cec	57fc3023-9402-48eb-b128-e3eb44cf4273	saturday	06:00	22:00
36651760-0237-4be1-bc18-778d8edd61e3	57fc3023-9402-48eb-b128-e3eb44cf4273	sunday	06:00	22:00
00e39d07-e379-4d3b-bfa8-0c72e011b42b	5c6160c4-0d3c-4515-b48b-f928294b1800	monday	07:00	23:00
b8b16172-144e-4443-8951-b7481eb80b6e	5c6160c4-0d3c-4515-b48b-f928294b1800	tuesday	07:00	23:00
20916af1-bbd0-4b11-8035-4300acd265fc	5c6160c4-0d3c-4515-b48b-f928294b1800	wednesday	07:00	23:00
436aa014-2a88-4e86-be05-340adcfe4004	5c6160c4-0d3c-4515-b48b-f928294b1800	friday	07:00	23:00
d00b2bc6-cc4e-4cc5-9185-19e51c3aebef	5c6160c4-0d3c-4515-b48b-f928294b1800	saturday	07:00	23:00
e8a29fa0-5249-451c-8110-5bc7e4c4808e	5c6160c4-0d3c-4515-b48b-f928294b1800	sunday	07:00	23:00
2c1b2b42-6dcc-453f-ac52-33703841d663	429f1da2-c572-400d-8e4e-9ecbd096cc08	monday	08:00	18:00
d170bee3-9e49-4e3d-9853-6043c4319901	429f1da2-c572-400d-8e4e-9ecbd096cc08	tuesday	08:00	18:00
7310503c-a496-421f-8c32-0c09494f9953	429f1da2-c572-400d-8e4e-9ecbd096cc08	wednesday	08:00	18:00
66023d0d-556f-4c98-a56c-55e8f221da5f	429f1da2-c572-400d-8e4e-9ecbd096cc08	friday	08:00	18:00
48b99b28-7f89-4956-8041-d1c4abd6ff17	429f1da2-c572-400d-8e4e-9ecbd096cc08	saturday	08:00	18:00
7f86a91f-4faf-4481-a1fb-97fa5aecff46	429f1da2-c572-400d-8e4e-9ecbd096cc08	sunday	08:00	18:00
fe862f5a-0d09-4b8a-bd85-614ba94d0420	bb085c14-2cf1-45fb-a564-42eed70da09b	monday	00:00	23:59
a9b39945-d2a6-4971-a391-82a59c0ea324	bb085c14-2cf1-45fb-a564-42eed70da09b	tuesday	00:00	23:59
b25d9b08-f5e5-436f-9f54-1c702b829931	bb085c14-2cf1-45fb-a564-42eed70da09b	wednesday	00:00	23:59
2aaa22b5-2239-49f2-80fc-f07ae9276f87	bb085c14-2cf1-45fb-a564-42eed70da09b	friday	00:00	23:59
8a5e069a-158d-4084-832f-2f9b256ffc87	bb085c14-2cf1-45fb-a564-42eed70da09b	saturday	00:00	23:59
f937b299-7b99-4a81-91e4-39b9bea0e15b	bb085c14-2cf1-45fb-a564-42eed70da09b	sunday	00:00	23:59
1a649a69-a80b-4439-b763-c65f1a6a0c00	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	monday	09:00	18:00
9a181870-c1d0-405f-bc9f-a7d6ec99b13f	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	tuesday	09:00	18:00
76fac9ad-3221-4e5b-8147-06cd931af595	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	wednesday	09:00	18:00
7eab00d1-9f0c-4556-82c0-fbfa5fe3d77e	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	friday	09:00	18:00
65c0c812-22cc-4cfa-b374-7d0584bcc6a4	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	saturday	09:00	18:00
d2853836-bd9a-4ea9-a6a5-6a5f0418e5a5	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	sunday	09:00	18:00
ec7cb616-068d-4058-9b99-31af93513af0	c9b58d45-a84c-4024-8a8c-6994903079db	monday	05:00	19:00
260f5f55-b9ff-4bd6-81ac-a636a551c496	c9b58d45-a84c-4024-8a8c-6994903079db	tuesday	05:00	19:00
be4fcc1f-658d-43ff-aa8f-dbea839ec9d8	c9b58d45-a84c-4024-8a8c-6994903079db	wednesday	05:00	19:00
a97324e1-86d9-4a86-a8a2-84c53d2b1be9	c9b58d45-a84c-4024-8a8c-6994903079db	friday	05:00	19:00
fcc2c2cf-785d-4d0e-abc4-75837cc530ab	c9b58d45-a84c-4024-8a8c-6994903079db	saturday	04:00	19:00
0c4e68d1-49f2-4045-b404-98e4e9d1d2de	c9b58d45-a84c-4024-8a8c-6994903079db	sunday	04:00	19:00
4e5c1cbe-93b7-4aab-b97b-bb4391ac38c9	837efbb5-f618-4118-9868-6d7ff86588ab	monday	08:30	17:30
0fe230c7-c188-40b0-bf11-1e2c6b423b1e	837efbb5-f618-4118-9868-6d7ff86588ab	tuesday	08:30	17:30
21be637c-1d3d-4017-b090-91a22c45445e	837efbb5-f618-4118-9868-6d7ff86588ab	wednesday	08:30	17:30
a2339735-98fe-4399-8375-da0c2fbec641	837efbb5-f618-4118-9868-6d7ff86588ab	friday	08:30	17:30
36adb8d1-8158-4578-8f9f-cd41d592f2ad	837efbb5-f618-4118-9868-6d7ff86588ab	saturday	08:30	17:30
2cb6bb40-7f61-4983-957a-3ef648092050	837efbb5-f618-4118-9868-6d7ff86588ab	sunday	08:30	17:30
434057ed-a03e-44a5-86cf-2051a521677e	1184dc79-a111-4a8a-8b31-dbfa6f379de1	monday	08:00	17:00
4fc9143a-46b8-40c8-8e25-13057112a7fa	1184dc79-a111-4a8a-8b31-dbfa6f379de1	tuesday	08:00	17:00
98922f17-f76f-4919-9250-e0768ad9340d	1184dc79-a111-4a8a-8b31-dbfa6f379de1	wednesday	08:00	17:00
6d26321c-f8f6-4e88-9325-bc403dbdf951	1184dc79-a111-4a8a-8b31-dbfa6f379de1	friday	08:00	17:00
57ff9a9e-5427-4894-ae90-7b3cfd956305	1184dc79-a111-4a8a-8b31-dbfa6f379de1	saturday	08:00	17:00
076c6cff-1326-4abb-a92c-1913fd405381	1184dc79-a111-4a8a-8b31-dbfa6f379de1	sunday	08:00	17:00
9d77ed01-3cad-442d-a548-a2cf563f6e0a	ecabc48b-5c72-4388-a022-d57fd88856d4	monday	00:00	23:59
193c3438-5405-453b-8e35-9e71fcc57a59	ecabc48b-5c72-4388-a022-d57fd88856d4	tuesday	08:30	17:00
f9b3de74-6590-4030-9575-5185cdbd267e	ecabc48b-5c72-4388-a022-d57fd88856d4	wednesday	08:30	17:00
d49756f2-f93b-47af-8238-a0166a080880	ecabc48b-5c72-4388-a022-d57fd88856d4	friday	08:30	17:00
be54a2e3-58d1-4d1a-aee7-105cdd03e1c5	ecabc48b-5c72-4388-a022-d57fd88856d4	saturday	08:30	17:00
bcb2ddd4-5bba-487f-bcc6-cb70f197f49c	ecabc48b-5c72-4388-a022-d57fd88856d4	sunday	08:30	17:00
5ace63dc-9a7a-4452-bee4-a187a0c93d03	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	monday	00:00	23:59
6b75c46e-ea9e-4324-a89a-19b615b353b3	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	tuesday	00:00	23:59
0337496e-d487-4053-94ae-80378e92702a	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	wednesday	00:00	23:59
8ce53539-bbfb-4ebe-92e2-ddbe6c8a95df	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	friday	00:00	23:59
329e3ead-9589-4eff-8d81-5f4d9c085f7b	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	saturday	00:00	23:59
e714cbf2-e32b-4545-ba1d-efaccc37c6b0	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	sunday	00:00	23:59
17c83451-0862-4603-902e-03bc3b1da993	938aeaf3-a47c-4a1f-8199-1c18f20c0755	monday	00:00	23:59
e7aed462-15af-4a26-b421-8821ac5c4f07	938aeaf3-a47c-4a1f-8199-1c18f20c0755	tuesday	00:00	23:59
02a9d08f-ca17-4bce-b7c3-cac6d2a2cb66	938aeaf3-a47c-4a1f-8199-1c18f20c0755	wednesday	00:00	23:59
e15c2c78-cf9d-4184-95d8-08209875088b	938aeaf3-a47c-4a1f-8199-1c18f20c0755	friday	00:00	23:59
2af657f9-50a7-4364-a419-fff26d976a80	938aeaf3-a47c-4a1f-8199-1c18f20c0755	saturday	00:00	23:59
8dcde701-0e0d-4265-96c3-aac1b13433fa	938aeaf3-a47c-4a1f-8199-1c18f20c0755	sunday	00:00	23:59
f37d1267-877d-4466-9589-fdca7855fc02	af5ccb47-576b-45c8-81dc-23755eb499b2	monday	00:00	23:59
3625bb92-a118-44e6-a445-30e65880099a	af5ccb47-576b-45c8-81dc-23755eb499b2	tuesday	00:00	23:59
d2331618-4778-49bc-a09b-fc17dfc6cd87	af5ccb47-576b-45c8-81dc-23755eb499b2	wednesday	00:00	23:59
e7e7b7e2-7405-4bad-b58e-50a25ef2728c	af5ccb47-576b-45c8-81dc-23755eb499b2	friday	00:00	23:59
e80f2714-e8ee-471e-8425-1fe4daa647d8	af5ccb47-576b-45c8-81dc-23755eb499b2	saturday	00:00	23:59
3b4cce5b-55ca-46a1-8d54-3ea94fd96f02	af5ccb47-576b-45c8-81dc-23755eb499b2	sunday	00:00	23:59
037ad9b5-e83f-476d-ab77-49f22ae56a98	e04e4553-459f-4ed1-9db5-14c50c1edcff	monday	00:00	23:59
de9c5b0d-d6aa-4e84-b22e-0d6efe4e1f27	e04e4553-459f-4ed1-9db5-14c50c1edcff	tuesday	00:00	23:59
355bdd8f-7266-4321-83b2-71fddba76119	e04e4553-459f-4ed1-9db5-14c50c1edcff	wednesday	00:00	23:59
2e3b4394-2735-41e9-87c7-8c43c4f4c1ad	e04e4553-459f-4ed1-9db5-14c50c1edcff	friday	00:00	23:59
a298bb1b-9327-4806-b2b3-b23506f2ddb8	e04e4553-459f-4ed1-9db5-14c50c1edcff	saturday	00:00	23:59
538a75df-2f00-4057-9a09-83edf0a24a5c	e04e4553-459f-4ed1-9db5-14c50c1edcff	sunday	00:00	23:59
ea41f52c-a855-4b41-99fb-d8b6a0ae3aab	07c80f91-6fb0-4dc0-94d3-f70b0000528c	monday	00:00	23:59
a979dc98-9809-44af-ac30-b55f362d6727	07c80f91-6fb0-4dc0-94d3-f70b0000528c	tuesday	00:00	23:59
58bee504-f772-497a-b021-4c665f2d00f6	07c80f91-6fb0-4dc0-94d3-f70b0000528c	wednesday	00:00	23:59
8d9829a8-07d5-4ede-a1f1-2683ed54aa54	07c80f91-6fb0-4dc0-94d3-f70b0000528c	friday	00:00	23:59
76ee3c1a-dfdf-41e0-acb8-b2bbacf29d6e	07c80f91-6fb0-4dc0-94d3-f70b0000528c	saturday	00:00	23:59
e53b1d7e-034d-4a30-b311-50d05e89a4aa	07c80f91-6fb0-4dc0-94d3-f70b0000528c	sunday	00:00	23:59
7b98b3bc-3e29-4cc0-9b1f-2fb74702044e	33a569bd-b6b7-4f77-b1fd-91820407d49c	monday	00:00	23:59
a54d177a-4b3c-4613-802b-d22e1dfc3b06	33a569bd-b6b7-4f77-b1fd-91820407d49c	tuesday	00:00	23:59
a1b1f7c0-c977-4a55-87fb-e8e3254dc9de	33a569bd-b6b7-4f77-b1fd-91820407d49c	wednesday	00:00	23:59
a4194e98-4e35-4294-a310-b976a7d27b2f	33a569bd-b6b7-4f77-b1fd-91820407d49c	friday	00:00	23:59
50e462ee-43f7-44e1-ae81-8763a1393803	33a569bd-b6b7-4f77-b1fd-91820407d49c	saturday	00:00	23:59
12e7ea08-5f33-42d1-b65b-3ecb498eb0c0	33a569bd-b6b7-4f77-b1fd-91820407d49c	sunday	00:00	23:59
02151dfb-b8a4-4b7b-a3f9-7be962d516fa	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	monday	00:00	23:59
d9564bcc-f55d-4e84-b7ae-de3d9851b980	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	tuesday	00:00	23:59
4ce76431-d425-4f42-a72a-623785091ae5	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	wednesday	00:00	23:59
33688b8d-43df-47f8-a9e3-d6f3e7069aa0	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	friday	00:00	23:59
566606da-9a0e-4e84-b101-52ec2bbb6c6c	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	saturday	00:00	23:59
4b57c47a-a1df-4398-ad4a-2c28b4c9132b	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	sunday	00:00	23:59
555769a1-5170-4e44-95d2-33f4dae173b4	c8e43a60-b5b5-4605-b21b-b301bcb10a30	monday	00:00	23:59
18ddad73-48a6-4568-86e2-75e27f6c0f46	c8e43a60-b5b5-4605-b21b-b301bcb10a30	tuesday	00:00	23:59
69df549d-4506-431c-83f4-b20dd42a3c05	c8e43a60-b5b5-4605-b21b-b301bcb10a30	wednesday	00:00	23:59
bde83125-5e7a-47d5-a125-eda5567b6469	c8e43a60-b5b5-4605-b21b-b301bcb10a30	friday	00:00	23:59
7c129e7a-0f17-4008-affe-b0733c82e471	c8e43a60-b5b5-4605-b21b-b301bcb10a30	saturday	00:00	23:59
f6839722-0e1b-4a91-8f78-c9299011f1a3	c8e43a60-b5b5-4605-b21b-b301bcb10a30	sunday	00:00	23:59
b12c9a24-4f98-4ca5-aaa6-7a7553786f3b	f9027e35-0096-4dab-904e-b75256e3dd3a	monday	00:00	23:59
5a271d2a-c1a8-4d69-8f78-2032095e8ff7	f9027e35-0096-4dab-904e-b75256e3dd3a	tuesday	00:00	23:59
3ca58068-7404-4eab-8280-656c724b7907	f9027e35-0096-4dab-904e-b75256e3dd3a	wednesday	00:00	23:59
956bec59-0a98-4dab-b929-63f1b7f827d2	f9027e35-0096-4dab-904e-b75256e3dd3a	friday	00:00	23:59
f949f23c-6c3f-4b64-b232-d060a29fb235	f9027e35-0096-4dab-904e-b75256e3dd3a	saturday	00:00	23:59
c6dc6f1d-abe3-4278-a226-3717cfab902e	f9027e35-0096-4dab-904e-b75256e3dd3a	sunday	00:00	23:59
edf5006a-8520-4bb7-9b05-179d14079878	b7f14550-1f41-46a7-9fd6-19676ff9afa7	monday	00:00	23:59
c1be30db-3d33-4ac7-bb61-2fc231a49db5	b7f14550-1f41-46a7-9fd6-19676ff9afa7	tuesday	00:00	23:59
dba00865-ed94-447a-ae70-ffb1f97780a1	b7f14550-1f41-46a7-9fd6-19676ff9afa7	wednesday	00:00	23:59
8d59ca9d-d71f-495a-add5-b17703b5118d	b7f14550-1f41-46a7-9fd6-19676ff9afa7	friday	00:00	23:59
21f8ea91-75c9-48fc-b2e3-83ef55e25862	b7f14550-1f41-46a7-9fd6-19676ff9afa7	saturday	00:00	23:59
2719240f-490d-49e0-9c68-f6794bbd0db5	b7f14550-1f41-46a7-9fd6-19676ff9afa7	sunday	00:00	23:59
3758a410-92c6-4d46-bd3d-bd71c2b0cbd4	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	monday	00:00	23:59
ebc7af0a-7ee4-4c6d-8f55-3333f5f5106f	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	tuesday	00:00	23:59
83572af7-4221-4c09-9c77-62d5d767e933	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	wednesday	00:00	23:59
90b45e41-32df-49cd-a4c8-f83cc861ed62	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	friday	00:00	23:59
77cab4c2-dc18-407d-9ae9-9b2c373d3f62	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	saturday	00:00	23:59
da86a6b6-7a96-4439-a437-4d96cc659d4d	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	sunday	00:00	23:59
c9068816-24e3-4ff5-91e4-9ac448f63f27	6d9603f9-46dd-45ec-8137-8e57bcb32b19	monday	00:00	23:59
1e0f7927-cbe0-4114-bba1-9afb9231cb38	6d9603f9-46dd-45ec-8137-8e57bcb32b19	tuesday	00:00	23:59
be28283e-f2a1-4aed-8a5a-f2b142282cee	6d9603f9-46dd-45ec-8137-8e57bcb32b19	wednesday	00:00	23:59
f79ae3a1-6ed7-4486-8dcb-c7742950692d	6d9603f9-46dd-45ec-8137-8e57bcb32b19	friday	00:00	23:59
0063ae67-89b5-4f7a-aa6c-622b5eaebdf5	6d9603f9-46dd-45ec-8137-8e57bcb32b19	saturday	00:00	23:59
ada04aa3-07f2-48eb-8f58-2db6396e651b	6d9603f9-46dd-45ec-8137-8e57bcb32b19	sunday	00:00	23:59
54f2fd8f-ba38-48f7-9dc6-769a5658e2a5	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	monday	00:00	23:59
e94927fd-8596-41e0-8d73-c3530a3525f9	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	tuesday	00:00	23:59
8c7fd3ac-68b6-41fa-9e11-c67278c7b42b	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	wednesday	00:00	23:59
6f53ba5d-0da6-4b85-b22b-6ec72a657d3a	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	friday	00:00	23:59
6fb24da8-3b5f-419a-b6d7-c3b95e39e4d8	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	saturday	00:00	23:59
9cd8885e-5b9e-476f-bcd8-b5bbefa1401a	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	sunday	00:00	23:59
90294fff-f968-485d-ad22-ba065b304334	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	monday	00:00	23:59
ff0333c6-3621-4c94-9154-1878214f7012	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	tuesday	00:00	23:59
d149dae4-1990-4e54-9836-d80a3c36f7a9	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	wednesday	00:00	23:59
4046f154-3907-4bed-ac8d-5ec93fa00561	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	friday	00:00	23:59
6d95c1dd-3a9d-476b-9a98-a9e7c1cdf105	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	saturday	00:00	23:59
b5dd8662-856a-446b-afcc-bcbdc774aec0	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	sunday	00:00	23:59
5d07f9bd-99b2-4bb8-bd93-a8bfe952bc8e	e98e3637-02fd-4007-a86f-7a8cbedae14d	thursday	00:00	23:59
07c58b9f-f8cc-4968-b4ae-97251a983844	8a113806-2f0c-43d3-afd1-5f17fe33fa68	thursday	07:30	11:30
6fe24fe8-1d66-4098-8c5c-3eafefa46405	b814d2d7-9afd-4716-8eba-83cadfb40800	thursday	07:00	18:00
84452a6d-052f-48ba-a4df-a724dd733af7	1a8cdf42-c231-41d8-8802-e8f0619a3c69	thursday	07:00	18:00
e3b0a166-79f9-4110-9000-a4bb46560f2c	e9a414ee-097e-4935-a7f2-ff9af30e5911	thursday	07:00	19:00
4e492444-13f6-4f1e-a361-bfd513e174e0	a715f38d-7560-48c3-9808-03edd21c6fe9	thursday	08:00	17:00
a4535ce1-f34b-4551-93e3-c4fd3c114ef4	b5343ac8-2288-4e10-aca9-7fa2a9377faa	thursday	08:00	17:00
6e43fada-20b5-486c-a86a-555d486ea479	8dc280e5-51bf-4425-9ea4-72658ba86e4e	thursday	08:00	17:00
3d66bce5-9985-4998-a283-42c589b0f394	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	thursday	05:00	18:00
8a0e7303-0b2b-47f6-a609-65381fee4644	6ca1a762-6d41-4072-a0c3-827c77601871	thursday	07:30:00	11:00
f344fc30-45ee-4e8d-a589-838a7db42da2	e476ce92-8f33-446a-900b-4ca04e6ff141	thursday	06:30	18:30
442bf58d-cdbf-4c1f-b590-2b41075b3284	b6b3878a-61ae-464e-8a00-880c9b7df23a	thursday	00:00	23:59
86bdc022-1ef9-42ec-a84c-34e92858051e	227b3fd9-af71-4514-b798-8ac1dc941554	thursday	08:00	17:00
7bf89b2e-81ef-4788-ba4f-e70ba213eb2e	093a94c5-f7b7-4a99-94d2-74ed61d4786e	thursday	00:00	23:59
340dd81d-1c1e-4b78-b5ad-7309cea4d974	57fc3023-9402-48eb-b128-e3eb44cf4273	thursday	06:00	22:00
d5cf49b1-d45b-45e9-8b81-32020913a423	5c6160c4-0d3c-4515-b48b-f928294b1800	thursday	07:00	23:00
006ceefc-0c2c-4f17-a837-e6fa37d3af66	429f1da2-c572-400d-8e4e-9ecbd096cc08	thursday	08:00	18:00
90c8c98d-5585-47fc-ac73-d3dfaeb4f539	bb085c14-2cf1-45fb-a564-42eed70da09b	thursday	00:00	23:59
d9fac19c-9bbf-4ea5-ab8b-a91d074eefe6	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	thursday	09:00	18:00
c4f0c32c-e76b-47ae-9ff3-813bcd048d34	c9b58d45-a84c-4024-8a8c-6994903079db	thursday	05:00	19:00
33f121aa-776e-4a8a-bf6e-91d30e6a9692	837efbb5-f618-4118-9868-6d7ff86588ab	thursday	08:30	17:30
cf89c7ba-8b4c-4414-91b8-7ef1afae9a36	1184dc79-a111-4a8a-8b31-dbfa6f379de1	thursday	08:00	17:00
a7ceb749-802f-4040-90fd-c01ecc667f6a	ecabc48b-5c72-4388-a022-d57fd88856d4	thursday	08:30	17:00
ecf8fac0-9c28-43b9-9277-c8677d0eb290	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	thursday	00:00	23:59
6b2a1e6c-673b-4a1f-b137-5cc52653e1df	938aeaf3-a47c-4a1f-8199-1c18f20c0755	thursday	00:00	23:59
fbfe7c6e-9b88-4af7-b4af-1af15e7cb086	af5ccb47-576b-45c8-81dc-23755eb499b2	thursday	00:00	23:59
f19efb95-12ef-4931-9441-60e1838094e8	e04e4553-459f-4ed1-9db5-14c50c1edcff	thursday	00:00	23:59
19b00900-fdf6-4e8b-bfa2-b0e348867a6d	07c80f91-6fb0-4dc0-94d3-f70b0000528c	thursday	00:00	23:59
d9e90cfe-22ea-4e7d-b931-8b7a71d0e309	33a569bd-b6b7-4f77-b1fd-91820407d49c	thursday	00:00	23:59
07558d57-dbc4-41e9-82ef-11207df48146	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	thursday	00:00	23:59
3bf1c86c-b61c-4fa8-9bba-d374170b4522	c8e43a60-b5b5-4605-b21b-b301bcb10a30	thursday	00:00	23:59
f06d6809-bf7d-4209-85a7-cc746ed6edd7	f9027e35-0096-4dab-904e-b75256e3dd3a	thursday	00:00	23:59
725b4e33-81b3-49c1-9c49-88814e9f0d24	b7f14550-1f41-46a7-9fd6-19676ff9afa7	thursday	00:00	23:59
20d8d001-50e4-4c3d-ac22-96b07eb1146f	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	thursday	00:00	23:59
9439b8db-a2ce-46e0-8f53-ecb44744c61a	6d9603f9-46dd-45ec-8137-8e57bcb32b19	thursday	00:00	23:59
4f4c6a4f-9788-4bbe-8000-ac237214651a	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	thursday	00:00	23:59
4266a235-0872-4470-a6ea-42317b386822	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	thursday	00:00	23:59
cbf90c50-9305-419a-8617-07186022bcd0	3ba31f52-39ea-4ca5-b966-20026f40560b	monday	08:00	17:00
c532c60b-dd66-44a3-bc70-2f2324fb254d	3ba31f52-39ea-4ca5-b966-20026f40560b	tuesday	08:00	17:00
6379228f-c4ae-41c0-ae50-91678a6036f6	3ba31f52-39ea-4ca5-b966-20026f40560b	wednesday	08:00	17:00
2213b03c-c134-4925-aa75-56946821c4f3	3ba31f52-39ea-4ca5-b966-20026f40560b	friday	08:00	17:00
3d13d08f-711a-4dcf-a040-1717b006e1f6	3ba31f52-39ea-4ca5-b966-20026f40560b	saturday	08:00	17:00
5d08f0f6-50dc-40ed-8e24-df3072414644	3ba31f52-39ea-4ca5-b966-20026f40560b	sunday	08:00	17:00
3a1256be-91e0-4185-846c-ef787d2550db	3ba31f52-39ea-4ca5-b966-20026f40560b	thursday	08:00	17:00
\.


--
-- TOC entry 5013 (class 0 OID 16546)
-- Dependencies: 225
-- Data for Name: rating_stars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rating_stars (id, location_id, star, count) FROM stdin;
a708711b-43d5-4d8a-acad-94949774b929	e98e3637-02fd-4007-a86f-7a8cbedae14d	3	0
31295c68-c50a-4049-b352-f586b4fffdc5	e98e3637-02fd-4007-a86f-7a8cbedae14d	2	0
17e82d9b-99e2-4ad1-a8ec-07ed4cc1ec0f	e98e3637-02fd-4007-a86f-7a8cbedae14d	1	0
38ce4561-fdb7-4eb7-b7d8-395f6509a5df	8a113806-2f0c-43d3-afd1-5f17fe33fa68	3	0
e6c4bb37-f852-4106-9e60-0eda603bb468	8a113806-2f0c-43d3-afd1-5f17fe33fa68	2	0
ac35a85d-4af8-4424-82ec-72f981cff505	8a113806-2f0c-43d3-afd1-5f17fe33fa68	1	0
89fb7deb-ab1d-4082-b31c-06e5e03139f8	b814d2d7-9afd-4716-8eba-83cadfb40800	4	0
c6b8adc0-1f52-49af-ab29-ac3c219a7a22	b814d2d7-9afd-4716-8eba-83cadfb40800	3	0
505a6ee9-448e-4691-93a3-41a21e20486b	b814d2d7-9afd-4716-8eba-83cadfb40800	2	0
83091afc-0323-444c-979b-87d77d063cc5	b814d2d7-9afd-4716-8eba-83cadfb40800	1	0
941e3b29-c582-45a2-a7e1-56a492005156	1a8cdf42-c231-41d8-8802-e8f0619a3c69	4	0
03576417-a807-4815-9a55-318d001b332a	1a8cdf42-c231-41d8-8802-e8f0619a3c69	3	0
77d4403f-e53b-4bca-8abb-3b74a8cdef59	1a8cdf42-c231-41d8-8802-e8f0619a3c69	2	0
9934c49b-b8b1-4dec-a0ec-3d9103250482	1a8cdf42-c231-41d8-8802-e8f0619a3c69	1	0
9f04e39b-b9ee-4a49-97fd-c070793911f1	e9a414ee-097e-4935-a7f2-ff9af30e5911	4	0
aee465df-337e-411b-a727-7536c2055c2f	e9a414ee-097e-4935-a7f2-ff9af30e5911	3	0
946f7aee-91f1-454d-8d91-16ee7cdc0d64	e9a414ee-097e-4935-a7f2-ff9af30e5911	2	0
65cd989b-a40b-4cba-9e14-72977961124e	e9a414ee-097e-4935-a7f2-ff9af30e5911	1	0
be2ccf13-b6fb-40bc-9b59-93ba9bc7a3d0	a715f38d-7560-48c3-9808-03edd21c6fe9	4	0
4cfa426d-25d6-41bd-88a1-dbd448cb4438	a715f38d-7560-48c3-9808-03edd21c6fe9	3	0
2eb63b56-961d-4dcd-ac13-1dceea69bef5	a715f38d-7560-48c3-9808-03edd21c6fe9	2	0
6f0401ba-7f62-477a-a4bd-aff02badff54	a715f38d-7560-48c3-9808-03edd21c6fe9	1	0
d355ad45-3356-4151-a8b9-b067d7107e12	b5343ac8-2288-4e10-aca9-7fa2a9377faa	4	0
90fab06e-603a-426a-b628-e64c9f51a986	b5343ac8-2288-4e10-aca9-7fa2a9377faa	3	0
e9a18021-0973-426c-810b-b465d1d1fb45	b5343ac8-2288-4e10-aca9-7fa2a9377faa	2	0
0ce09cda-8621-4934-8ce4-c62ce2f7b7d9	b5343ac8-2288-4e10-aca9-7fa2a9377faa	1	0
d4d98100-341c-403f-b675-d1d41136aa10	8dc280e5-51bf-4425-9ea4-72658ba86e4e	3	0
5056fab2-b2eb-44a5-a965-adf6201635d1	8dc280e5-51bf-4425-9ea4-72658ba86e4e	2	0
d827d782-36c3-4a76-b475-588b5a8005ab	8dc280e5-51bf-4425-9ea4-72658ba86e4e	1	0
acec6c59-2669-42cc-a9e1-f5103d0bc213	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	4	0
c1ecf3a3-3216-47af-a9f7-f5e868542628	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	3	0
55f8616b-8f0a-40f3-9884-8da640e3a0d1	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	2	0
10af084c-522b-42e2-a472-491b27197995	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	1	0
036f80f2-5bef-464a-b609-a28278cc32b9	6ca1a762-6d41-4072-a0c3-827c77601871	3	0
d9f63175-3865-489b-a8d3-f536e868d7b4	6ca1a762-6d41-4072-a0c3-827c77601871	2	0
27eba285-0f01-4276-8d02-b047ccc12273	6ca1a762-6d41-4072-a0c3-827c77601871	1	0
e23d0006-46a8-4da7-ba58-b5d15f9056f0	e476ce92-8f33-446a-900b-4ca04e6ff141	4	0
8173948c-f8e3-4759-a50b-678a251c786e	e476ce92-8f33-446a-900b-4ca04e6ff141	3	0
85e499d2-cdf5-4349-8563-5fc7f21d9f04	e476ce92-8f33-446a-900b-4ca04e6ff141	2	0
42d1a4c7-d9da-420d-934e-ef918539ecef	e476ce92-8f33-446a-900b-4ca04e6ff141	1	0
47e4c773-1666-4980-958e-c93a379b17e8	b6b3878a-61ae-464e-8a00-880c9b7df23a	4	0
3d53cab9-b285-403e-bb1f-03afb4477817	b6b3878a-61ae-464e-8a00-880c9b7df23a	3	0
80b7425d-30e3-4856-ae39-6c6e6c1cbc9d	b6b3878a-61ae-464e-8a00-880c9b7df23a	2	0
ce2dbdfd-9fbc-494c-a232-99ece989fa93	b6b3878a-61ae-464e-8a00-880c9b7df23a	1	0
52f696b1-83e1-48ea-93e9-1eef3d7a5834	227b3fd9-af71-4514-b798-8ac1dc941554	3	0
6cee2a81-a612-4ed1-9054-86263e6a9c1d	227b3fd9-af71-4514-b798-8ac1dc941554	2	0
241f3bd6-ba33-494e-9387-e612eea11b1f	227b3fd9-af71-4514-b798-8ac1dc941554	1	0
13b3e171-ac4f-4842-9ece-7adae81a4208	093a94c5-f7b7-4a99-94d2-74ed61d4786e	4	0
ef7abecd-24b8-4f19-85c2-4c4054b7caab	093a94c5-f7b7-4a99-94d2-74ed61d4786e	3	0
ff073739-3646-4e6e-bfec-a6370e6da217	093a94c5-f7b7-4a99-94d2-74ed61d4786e	2	0
4178f821-07ec-4394-9740-a193884fedce	093a94c5-f7b7-4a99-94d2-74ed61d4786e	1	0
99ea5591-2dec-4968-a687-f64058051097	57fc3023-9402-48eb-b128-e3eb44cf4273	3	0
6dd647a9-c34e-4d51-84ab-30c5354b093c	57fc3023-9402-48eb-b128-e3eb44cf4273	2	0
9dcf2221-5e05-4494-9ace-8d04d3e9ffa2	57fc3023-9402-48eb-b128-e3eb44cf4273	1	0
6754d640-e9e4-482b-9bd3-b6cea557a0bc	1a8cdf42-c231-41d8-8802-e8f0619a3c69	5	4
42f5dfcf-e36a-4d05-ab74-a92c63d55970	e9a414ee-097e-4935-a7f2-ff9af30e5911	5	3
aae9b224-5bfd-409c-984e-6e14905efd6f	6ca1a762-6d41-4072-a0c3-827c77601871	4	1
1663e433-5232-438e-b52f-267e0b38f495	6ca1a762-6d41-4072-a0c3-827c77601871	5	3
59ada9c8-39ce-4059-be19-07a7b24291a9	e476ce92-8f33-446a-900b-4ca04e6ff141	5	3
ff9597c5-7703-4b5e-b0ae-aa0b2aeeaaef	a715f38d-7560-48c3-9808-03edd21c6fe9	5	3
3cf9e1c5-f562-44b6-8520-102b58f01d1d	b6b3878a-61ae-464e-8a00-880c9b7df23a	5	3
9dbfe18c-5040-48ae-a7cc-e4c869f8448f	227b3fd9-af71-4514-b798-8ac1dc941554	4	2
d165d034-bffd-4930-8701-510de6b3ef9e	227b3fd9-af71-4514-b798-8ac1dc941554	5	1
d1311f6f-42a4-4cf4-9764-6097e59c3b60	b5343ac8-2288-4e10-aca9-7fa2a9377faa	5	4
18804e87-8dd2-40ae-ae72-1b4870da6125	093a94c5-f7b7-4a99-94d2-74ed61d4786e	5	3
187065df-b553-4a2b-8023-8e8076a08167	57fc3023-9402-48eb-b128-e3eb44cf4273	4	1
c0e03a9e-f43d-4d7e-90a9-7421c735ffc1	57fc3023-9402-48eb-b128-e3eb44cf4273	5	2
ef15263c-2946-497a-a2b8-58f81cb5ab45	8dc280e5-51bf-4425-9ea4-72658ba86e4e	4	2
60bf4855-0e5e-47ea-a54b-4a0eb271f781	8dc280e5-51bf-4425-9ea4-72658ba86e4e	5	1
2157eac6-44c5-4976-9aae-a0ed67e58d0e	8a113806-2f0c-43d3-afd1-5f17fe33fa68	4	1
9fd0042e-dddd-47fc-853f-3a49092ae041	8a113806-2f0c-43d3-afd1-5f17fe33fa68	5	2
f3fc2189-73f7-4e7c-929c-81b208e17e8b	b814d2d7-9afd-4716-8eba-83cadfb40800	5	2
ce604fd3-184a-4481-8ed4-f27e2e0fc5f2	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	5	4
001732f8-c40f-4c65-b6c5-e1960752912b	5c6160c4-0d3c-4515-b48b-f928294b1800	3	0
e4d6adcf-8839-48df-abb2-be2662bbb016	5c6160c4-0d3c-4515-b48b-f928294b1800	2	0
d19e9950-0460-404d-86e0-d9027bc3f5bf	5c6160c4-0d3c-4515-b48b-f928294b1800	1	0
7d7317b5-6ea4-4420-9c27-77384f93967a	429f1da2-c572-400d-8e4e-9ecbd096cc08	3	0
acfcee8f-802c-44bd-b68d-a358b7ac8908	429f1da2-c572-400d-8e4e-9ecbd096cc08	2	0
f1ee3cbc-766d-47ea-ab92-121f0f558447	429f1da2-c572-400d-8e4e-9ecbd096cc08	1	0
b9f99705-d745-47f2-aa3e-fccc48b7c969	bb085c14-2cf1-45fb-a564-42eed70da09b	4	0
d4859c0a-5b68-467d-8fc2-91a0b66e8f0e	bb085c14-2cf1-45fb-a564-42eed70da09b	3	0
ebeae440-85a5-4458-b002-fa4979d758a2	bb085c14-2cf1-45fb-a564-42eed70da09b	2	0
639f9815-9f7b-424c-85f6-70976d26444b	bb085c14-2cf1-45fb-a564-42eed70da09b	1	0
9604bd3f-81d7-438e-b6bc-5da413b77b58	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	3	0
58fb44f3-0a13-4db2-bd5d-246951c14bd5	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	2	0
c9857bdf-c324-4491-8ba1-072ba0bb0799	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	1	0
f1173475-dd3c-49b3-9865-3a6277b28759	c9b58d45-a84c-4024-8a8c-6994903079db	4	0
69d1ff1c-e028-4869-b6a9-a737e49a5344	c9b58d45-a84c-4024-8a8c-6994903079db	2	0
77e5f0fc-42b0-4fc7-8fc6-69055ee1865d	c9b58d45-a84c-4024-8a8c-6994903079db	1	0
503803e3-cd4b-4ee4-80b3-610b1305bd18	837efbb5-f618-4118-9868-6d7ff86588ab	3	0
bc090dc3-97c7-40ce-95dc-e524a7b026b6	837efbb5-f618-4118-9868-6d7ff86588ab	2	0
32f24e26-d0b5-44b7-bb3e-4eed15475d10	1184dc79-a111-4a8a-8b31-dbfa6f379de1	3	0
4c84a7f6-a758-48d6-86ee-dd9954cc47c3	1184dc79-a111-4a8a-8b31-dbfa6f379de1	2	0
8dbcd756-cde4-40d7-84eb-c11cb7423528	1184dc79-a111-4a8a-8b31-dbfa6f379de1	1	0
d0715822-4635-4ec7-9516-52a69cb94458	ecabc48b-5c72-4388-a022-d57fd88856d4	4	0
a224b7ca-4f7d-49ad-b6f4-581db2a2b858	ecabc48b-5c72-4388-a022-d57fd88856d4	2	0
5f843b1a-f2fd-45bb-a976-d82feecd439b	ecabc48b-5c72-4388-a022-d57fd88856d4	1	0
2761e922-9472-4371-b0e9-1185e2515514	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	3	0
e046e68f-c30c-46a4-83b3-bac70ce02968	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	2	0
e8ce6c6a-9677-4a5a-aa47-d19d96224fca	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	1	0
a3d45617-3a5c-415c-9287-dcf4df68bad4	938aeaf3-a47c-4a1f-8199-1c18f20c0755	3	0
f02fd02b-faeb-414d-ba75-051b2c8c40e4	938aeaf3-a47c-4a1f-8199-1c18f20c0755	2	0
c41abe9a-ad49-48d8-aa2b-eb9bb456c669	938aeaf3-a47c-4a1f-8199-1c18f20c0755	1	0
487eed6e-5b62-44ea-8b15-99863f6789d8	af5ccb47-576b-45c8-81dc-23755eb499b2	4	0
f335cb05-4d83-45dd-8d30-80c4fdc6d583	af5ccb47-576b-45c8-81dc-23755eb499b2	3	0
5ad76a3e-e578-4653-ac43-b448fd599843	af5ccb47-576b-45c8-81dc-23755eb499b2	2	0
ccbee5ba-dac6-4d10-82c7-609759d1c724	af5ccb47-576b-45c8-81dc-23755eb499b2	1	0
6d69abc5-7492-48d0-bace-88c7a87e9f68	e04e4553-459f-4ed1-9db5-14c50c1edcff	4	0
6eef74e7-a24e-4609-977c-5db82262dcaa	e04e4553-459f-4ed1-9db5-14c50c1edcff	3	0
7416cff5-7206-49ae-b685-289f893695a2	e04e4553-459f-4ed1-9db5-14c50c1edcff	2	0
cda799ca-7f5f-468e-8d35-f8dd94653f35	e04e4553-459f-4ed1-9db5-14c50c1edcff	1	0
200383fa-451f-4fae-b178-85d1307877fd	07c80f91-6fb0-4dc0-94d3-f70b0000528c	4	0
c9895b8c-3014-4fd4-8282-0b71164fd21f	07c80f91-6fb0-4dc0-94d3-f70b0000528c	3	0
3649dd19-9e09-4fa7-b76b-0b17b91fd728	07c80f91-6fb0-4dc0-94d3-f70b0000528c	2	0
f429e204-0789-41b2-bcdc-f54f37c8a4d5	07c80f91-6fb0-4dc0-94d3-f70b0000528c	1	0
9945beef-87d2-4e7f-a354-90a8feb8e4ca	33a569bd-b6b7-4f77-b1fd-91820407d49c	4	0
30d9dd7a-3169-46df-b130-27ab05c9a08e	33a569bd-b6b7-4f77-b1fd-91820407d49c	3	0
f69b3b43-02de-4a20-b0d7-91e06946a3eb	33a569bd-b6b7-4f77-b1fd-91820407d49c	2	0
74a09177-7a51-410d-8a0b-456f813b9d40	33a569bd-b6b7-4f77-b1fd-91820407d49c	1	0
2653436e-4b74-44e6-aacd-e36850899ba1	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	4	0
a7058532-7edd-435e-b1cc-e49d31ff1dc2	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	3	0
9a2f935f-be1e-4fb4-8a25-82223967321f	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	2	0
3dc37fc3-c75d-4a88-96f1-f5faa814c47b	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	1	0
499b790b-072c-4d88-8b1d-f6ef8977aad4	c8e43a60-b5b5-4605-b21b-b301bcb10a30	4	0
c7be7b3d-954f-4d0f-ba5c-b121d01e2634	c8e43a60-b5b5-4605-b21b-b301bcb10a30	3	0
1c213341-04f6-4fc6-923a-3b48b0bde5ea	c8e43a60-b5b5-4605-b21b-b301bcb10a30	2	0
4714f0b7-04e8-445e-b233-cfa6dcb2d576	c8e43a60-b5b5-4605-b21b-b301bcb10a30	1	0
13f75837-c899-4f89-8679-ecfa9124db46	f9027e35-0096-4dab-904e-b75256e3dd3a	4	0
f644f4ea-bee7-41ae-afd1-f9431b3b85cd	f9027e35-0096-4dab-904e-b75256e3dd3a	3	0
f4776df3-5895-42fb-8314-c56c9232d6f1	f9027e35-0096-4dab-904e-b75256e3dd3a	2	0
dc662814-e153-4043-9cc1-4a20b6779256	f9027e35-0096-4dab-904e-b75256e3dd3a	1	0
98595b2e-de89-4259-8fc6-5e45415085b1	b7f14550-1f41-46a7-9fd6-19676ff9afa7	4	0
5f547609-a229-4618-abb3-06f4f785480d	b7f14550-1f41-46a7-9fd6-19676ff9afa7	3	0
48082543-4518-45a1-ab4b-18b0d947874c	b7f14550-1f41-46a7-9fd6-19676ff9afa7	2	0
d87efa37-e361-4475-a678-5d01c4f4e10d	b7f14550-1f41-46a7-9fd6-19676ff9afa7	1	0
a9980990-a92a-44f2-8ec7-0d17c776460f	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	4	0
cf96f74d-317f-414e-986a-6fc1149061d8	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	3	0
6e8f600e-b67a-4879-9c7f-5f7b7cd76f47	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	2	0
b66c8f11-e308-4d10-b210-3b4f13f581f0	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	1	0
bc192176-203d-4915-9d05-efb2395a4d80	6d9603f9-46dd-45ec-8137-8e57bcb32b19	4	0
ec605fac-0994-49f3-be3d-497f033fdac7	6d9603f9-46dd-45ec-8137-8e57bcb32b19	3	0
521c7f43-d8c7-4a03-a5d1-08ce0f7d2516	6d9603f9-46dd-45ec-8137-8e57bcb32b19	2	0
8208e5e3-bea0-4448-a983-e9ec40ca279a	6d9603f9-46dd-45ec-8137-8e57bcb32b19	1	0
2cd5e0d8-0158-4033-a6b3-fe948253efd0	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	4	0
a6bd536e-e4ee-47a6-9ac8-7b258b609da4	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	3	0
3c001f3d-9d83-42ea-9918-2311fa7bbb69	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	2	0
01117389-91a4-42cc-a37c-7e855ae05471	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	1	0
41d0b27f-278a-497b-a4dc-977c42e9c4bd	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	4	0
4dfdb8e4-302c-45fd-8aca-b07683e5b068	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	3	0
5adfe88b-e983-44c9-89de-5ccd0c66aa69	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	2	0
264f813f-abe7-458c-95fb-fc87062aa35e	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	1	0
974f27eb-ebbe-4d22-9f3c-f7907f6962ce	3ba31f52-39ea-4ca5-b966-20026f40560b	4	0
6add815a-1991-4a02-87aa-982146506999	3ba31f52-39ea-4ca5-b966-20026f40560b	3	0
ef9c79f0-4bc7-46ac-8554-781655187019	3ba31f52-39ea-4ca5-b966-20026f40560b	2	0
8990be2b-7ee6-4567-8e30-b6ff4bb0af03	3ba31f52-39ea-4ca5-b966-20026f40560b	1	0
1c129258-aa76-4d9f-9dba-f16aa76477ef	938aeaf3-a47c-4a1f-8199-1c18f20c0755	4	1
d48c730c-f542-42f9-8de1-b1213bd76c74	ecabc48b-5c72-4388-a022-d57fd88856d4	3	2
0a8be10e-0eeb-4cc9-a772-067fcdd10455	837efbb5-f618-4118-9868-6d7ff86588ab	1	1
f57a66c9-12bb-4eb2-9e69-ce25df0b1e6c	5c6160c4-0d3c-4515-b48b-f928294b1800	4	2
615a6da0-4a36-4738-b775-9d2d6d18abf9	429f1da2-c572-400d-8e4e-9ecbd096cc08	4	1
9ba737bb-144b-4f28-93aa-e944353eadd2	bb085c14-2cf1-45fb-a564-42eed70da09b	5	3
2cf5d2f9-4ffe-49be-a587-b4a2121af118	5c6160c4-0d3c-4515-b48b-f928294b1800	5	1
cf7da3ab-c1fe-40dd-aa5e-addf4d5eee54	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	4	2
c6458cbc-e62f-4af5-a3b5-88341843c422	429f1da2-c572-400d-8e4e-9ecbd096cc08	5	2
a6a249ad-0c2e-46a1-a550-9239716782d2	c9b58d45-a84c-4024-8a8c-6994903079db	3	1
a0875a43-b156-4c22-b9b7-ee26cee64e5c	c9b58d45-a84c-4024-8a8c-6994903079db	5	3
5eed90fa-b4bb-43d1-8fc9-027390cd9b56	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	5	1
e9a80703-7e1d-4195-b2af-1999f53e8da9	1184dc79-a111-4a8a-8b31-dbfa6f379de1	4	1
6c4e0b8d-0803-4938-a4e2-d85d0e1c9ae3	1184dc79-a111-4a8a-8b31-dbfa6f379de1	5	2
42545e20-2640-449c-b0bc-c8b46c91d245	837efbb5-f618-4118-9868-6d7ff86588ab	4	1
8e33382b-113e-4f6c-8369-2d7a96f0ec82	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	4	1
e62c525d-d012-4e7f-9319-681edbd2d2a3	938aeaf3-a47c-4a1f-8199-1c18f20c0755	5	2
90e02219-2b01-4cb9-880b-f67bce05d5f5	e04e4553-459f-4ed1-9db5-14c50c1edcff	5	3
87f0201b-5b86-47ae-b313-6098e30b8864	ecabc48b-5c72-4388-a022-d57fd88856d4	5	1
5ea20a6a-b2da-454b-b17f-9ea9e3b3b8c7	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	5	2
6a6584cf-66d6-4d86-a1b2-59680675d3d0	e98e3637-02fd-4007-a86f-7a8cbedae14d	5	6
7ce0d40d-32bd-4faf-a7d3-eda10b22f70f	3ba31f52-39ea-4ca5-b966-20026f40560b	5	2
faeb398b-769c-46cb-b791-cabf1a2773fc	e98e3637-02fd-4007-a86f-7a8cbedae14d	4	1
526efd88-a1b4-490f-aa58-b508a026eb6d	af5ccb47-576b-45c8-81dc-23755eb499b2	5	2
51a655fc-4818-4309-b5e1-a314283ed586	07c80f91-6fb0-4dc0-94d3-f70b0000528c	5	3
bc4c5b98-b413-4f74-8acf-9891c2411f4f	33a569bd-b6b7-4f77-b1fd-91820407d49c	5	3
60f8473e-0bfd-4d6b-aa79-cc78748131e6	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	5	3
394d2147-58ae-4b68-9787-5dc1026ebf7d	c8e43a60-b5b5-4605-b21b-b301bcb10a30	5	3
f1f9314c-58ba-4f04-a0cc-b5def12e9966	f9027e35-0096-4dab-904e-b75256e3dd3a	5	3
7ce8a836-197d-4eb4-a2ef-5ac110ddd36a	b7f14550-1f41-46a7-9fd6-19676ff9afa7	5	3
6129d535-86cf-4763-a946-8d53423c4024	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	5	3
0d737799-4574-404b-a971-b048cd67ed66	6d9603f9-46dd-45ec-8137-8e57bcb32b19	5	3
4b18418b-b5fd-4ae9-9374-7759a2d65330	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	5	3
72afeb53-06aa-43d5-b93f-73c15e0b1f63	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	5	3
12bacb0c-e3d4-49d0-8acd-3ff73152b468	837efbb5-f618-4118-9868-6d7ff86588ab	5	1
\.


--
-- TOC entry 5008 (class 0 OID 16402)
-- Dependencies: 220
-- Data for Name: referral_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referral_codes (id, user_id, code, created_at) FROM stdin;
fd306052-edfd-4d8f-b612-748f837a28b9	64e36a4a-4661-4a93-8d2c-e0c8a8cac388	A1B2C3D4E5F6	2026-02-12 18:24:36.318602
6b47b3d8-5cd2-4f35-a0c8-5130c1aeeecf	a44fd6ca-f055-46c9-981e-bde29ac48f10	X9Y8Z7W6V5U4	2026-02-12 18:24:36.318602
bb8e6a7a-9350-46c8-9749-a0ad7fc735e9	7818cb97-51f1-462d-8a84-605a01b399b1	Q1W2E3R4T5Y6	2026-02-12 18:24:36.318602
542cdb28-ba2c-4184-871d-2e4e6f30c4a5	7d3465fd-53a3-43bf-980f-9e263f49cff4	M9N8B7V6C5X4	2026-02-12 18:24:36.318602
e9f3193c-ffc2-4457-99f6-67e32b4412be	fa4115c2-2d34-4b84-bb16-ba8086fc9ed2	P0O9I8U7Y6T5	2026-02-12 18:24:36.318602
ce2b670f-99c7-4bd9-b6cf-c719e09f372a	dcdc1673-4ec2-47a4-b49b-89b4df10468d	L1K2J3H4G5F6	2026-02-12 18:24:36.318602
1c60298d-bc20-4e00-9f01-c2d707ede9dc	d4945aa4-9f07-4899-aaec-cb9bcfe97bc6	Z1X2C3V4B5N6	2026-02-12 18:24:36.318602
be3386c4-ad3d-401a-b239-be7d56fc7630	88cba9c9-9597-4c73-9ef9-cb4e60ff3f63	S9D8F7G6H5J4	2026-02-12 18:24:36.318602
7abdcef5-e4a8-494a-938e-791db31833db	0c86ae89-e6c7-46ba-a73b-705071252c03	R1T2Y3U4I5O6	2026-02-12 18:24:36.318602
9aeb3271-139f-4cab-aaef-f6fa2df0afae	3494707c-a476-4af0-b153-05c8ba21d9f6	K9L8M7N6B5V4	2026-02-12 18:24:36.318602
\.


--
-- TOC entry 5016 (class 0 OID 16598)
-- Dependencies: 228
-- Data for Name: review_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_images (id, review_id, url, sort_order) FROM stdin;
5b919dd5-6cc4-4312-b9e4-b08f5e9cc1c4	0c15a082-ce7a-4af0-8438-3403945bc9bb	reviews/0c15a082-ce7a-4af0-8438-3403945bc9bb/4889286d-1732-48b4-8196-2c92dbb54306-1772447674795-d9dc6b0b-093c-41d7-aa94-93f852589901.jpg	1
df060003-271d-44d1-ae5e-9bbf65c1ca8a	f9d342cb-e924-40e2-a43e-3ca590286230	reviews/f9d342cb-e924-40e2-a43e-3ca590286230/4889286d-1732-48b4-8196-2c92dbb54306-1772447955284-b91740fe-603c-46fc-a898-8b08a346812a.jpg	1
273bd2fd-51c1-4c93-86da-529daf3d6c8d	f9d342cb-e924-40e2-a43e-3ca590286230	reviews/f9d342cb-e924-40e2-a43e-3ca590286230/4889286d-1732-48b4-8196-2c92dbb54306-1772447955295-a9d8ba37-7e98-4630-a659-aa3186dd0ed0.jpg	2
b02d5631-5333-4499-b956-1bd99d7c8085	fad641f0-432d-4258-a9e0-20277135dde6	reviews/fad641f0-432d-4258-a9e0-20277135dde6/4889286d-1732-48b4-8196-2c92dbb54306-1772448695520-eb756c52-fa59-4d50-86d5-393211cdd3bf.jpg	1
5b0a6b18-9888-486b-ad97-332baf783f60	fad641f0-432d-4258-a9e0-20277135dde6	reviews/fad641f0-432d-4258-a9e0-20277135dde6/4889286d-1732-48b4-8196-2c92dbb54306-1772448695527-47a9153e-3655-4d57-9416-c4843057ba67.jpg	2
555bdc24-6c30-4d3a-837c-0294f17c4233	447ce407-edc7-4ce4-ac29-219c03df9d83	reviews/447ce407-edc7-4ce4-ac29-219c03df9d83/4889286d-1732-48b4-8196-2c92dbb54306-1772449985809-29f0b3d6-d8e7-41a1-8300-40c9ca8b8f91.jpg	1
7f18f4e8-31aa-4f58-98d3-31538d1cee33	00c27963-9a7a-4ca7-aee6-0dfa061fcb44	reviews/00c27963-9a7a-4ca7-aee6-0dfa061fcb44/4889286d-1732-48b4-8196-2c92dbb54306-1772458550162-13f1c966-4ac9-4372-b0e9-cacd0d8d888a.jpg	1
88a5caf0-4594-4b49-824c-3c92fbd4212d	25a5a706-e0f3-4287-9d36-018802bc2362	reviews/25a5a706-e0f3-4287-9d36-018802bc2362/4889286d-1732-48b4-8196-2c92dbb54306-1772458660427-6881fb4e-d63e-4585-ad05-9d942a7b5232.jpg	1
0b20fd56-fb73-4e1f-9edf-bd842ce6edff	bc45eae5-06fb-409b-b697-63e9f8cc410a	reviews/bc45eae5-06fb-409b-b697-63e9f8cc410a/4889286d-1732-48b4-8196-2c92dbb54306-1772458779767-e140b77b-9cf0-498b-8294-012789610d60.jpg	1
3f8f094d-b60b-4358-91e9-e13414b44b1e	618a0463-afb0-42be-82c3-d77aeb106c15	reviews/618a0463-afb0-42be-82c3-d77aeb106c15/4889286d-1732-48b4-8196-2c92dbb54306-1772458840370-f4a9bf72-ac1d-4f44-bac7-d783e7660512.jpg	1
e3322f73-bae1-464d-83c6-622d1c215449	3c9ed3c9-6130-455a-bd35-6878b786bd6b	reviews/3c9ed3c9-6130-455a-bd35-6878b786bd6b/4889286d-1732-48b4-8196-2c92dbb54306-1772458968674-aaa1c5e9-b3e0-436a-96d8-7e989948068a.jpg	1
b9d27e5a-b165-4d25-a903-c479dacbeb17	25c2ea45-14a3-4975-bb5f-47bf33cb634c	reviews/25c2ea45-14a3-4975-bb5f-47bf33cb634c/4889286d-1732-48b4-8196-2c92dbb54306-1772458995819-7e5d1f6f-ff76-4197-9ae8-680552e041c2.jpg	1
0f47b576-4ddb-47cd-836c-399e8425bcfa	e8724ab4-9c52-4eda-b06a-ec43b8aa2345	reviews/e8724ab4-9c52-4eda-b06a-ec43b8aa2345/4889286d-1732-48b4-8196-2c92dbb54306-1772459017498-edbb7c8b-2c12-4182-b787-772cd4eeaa8f.jpg	1
476216e4-7272-461c-80be-7820739bc9cc	be48d18b-c750-4d21-b3be-658215310b45	reviews/be48d18b-c750-4d21-b3be-658215310b45/4889286d-1732-48b4-8196-2c92dbb54306-1772459039813-b1f36512-183c-452f-a3ce-e761102b1b3d.jpg	1
e6078ad1-c12d-4289-afcc-e6a4327715ee	be48d18b-c750-4d21-b3be-658215310b45	reviews/be48d18b-c750-4d21-b3be-658215310b45/4889286d-1732-48b4-8196-2c92dbb54306-1772459039815-07c21f61-2b53-49aa-a0f3-605ff518986f.jpg	2
b976920f-9283-4cf9-812b-623880bbbd36	9507ae56-253e-4dff-856f-1f12d4fca62e	reviews/9507ae56-253e-4dff-856f-1f12d4fca62e/4889286d-1732-48b4-8196-2c92dbb54306-1772459120879-d4b46fc6-8b25-409c-898c-1e605a5f36fb.jpg	1
322dca46-6c80-43dd-ac33-fc8568d00793	74844894-2aaa-4fb3-beb0-59602a730acd	reviews/74844894-2aaa-4fb3-beb0-59602a730acd/4889286d-1732-48b4-8196-2c92dbb54306-1772459145638-1abd8484-a342-43c2-a352-a2d02258eae6.jpg	1
8e5d6b3d-ea98-45d1-9e79-04111c5ddd93	031a35d4-f178-451d-a8c9-0f8311b7a80e	reviews/031a35d4-f178-451d-a8c9-0f8311b7a80e/4889286d-1732-48b4-8196-2c92dbb54306-1772459170903-33f6b819-a220-4f37-8d62-cb498761854d.jpg	1
fe61a94c-d1df-4d0b-9f59-a1eeb19a3445	b14bc572-f6a7-4429-8e8c-3e37d3bfed47	reviews/b14bc572-f6a7-4429-8e8c-3e37d3bfed47/4889286d-1732-48b4-8196-2c92dbb54306-1772459298325-c3b1c353-d387-46b6-9300-06a1d8c1b350.jpg	1
5cd9603d-0d7a-4f25-84b4-ce46a4a42a04	70af8551-59fc-475f-af29-1a5e63e19507	reviews/70af8551-59fc-475f-af29-1a5e63e19507/4889286d-1732-48b4-8196-2c92dbb54306-1772459317372-68069d97-3311-43e4-8ab2-774c1019fe15.jpg	1
88d3b84a-beee-42a2-8ab1-1797b724e3f9	6ebf4a63-a59b-4f31-9ae8-281580a8ee7f	reviews/6ebf4a63-a59b-4f31-9ae8-281580a8ee7f/4889286d-1732-48b4-8196-2c92dbb54306-1772459335597-3bbadd62-dbae-4d74-9d05-060c2180bc69.jpg	1
24b7991c-f0da-4d76-9cbd-f0bc91e3068c	a41064b6-861c-4d30-935d-ea11976f5a57	reviews/a41064b6-861c-4d30-935d-ea11976f5a57/4889286d-1732-48b4-8196-2c92dbb54306-1772459454207-1d757e47-8bac-4884-bcb7-b6e221ecd323.jpg	1
d2a50d77-bbeb-4834-a4c8-69b6a95d9ead	678e1d2e-50f5-46ab-bdc5-451695b406c1	reviews/678e1d2e-50f5-46ab-bdc5-451695b406c1/4889286d-1732-48b4-8196-2c92dbb54306-1772459475433-6027c64e-220d-4ec1-ba9a-5790c2f96204.jpg	1
af2768cb-14bf-491b-a0ff-941756a73915	2aaf4b40-d2e4-44f4-9c21-a790d5da9151	reviews/2aaf4b40-d2e4-44f4-9c21-a790d5da9151/4889286d-1732-48b4-8196-2c92dbb54306-1772459496460-5bd76b57-c0d1-4f88-b6ab-125f488f4d21.jpg	1
a1626783-f8d0-4ea5-8a66-ae183f7fa7ed	2361487e-8c8f-4cc3-8c54-f91127aeb6d4	reviews/2361487e-8c8f-4cc3-8c54-f91127aeb6d4/4889286d-1732-48b4-8196-2c92dbb54306-1772459592102-0606d7fb-8dce-4422-94d4-e100bd079725.jpg	1
5ffe932b-3557-4bda-8653-11e14cdd57c9	d9f0c791-0fc8-4186-bf2c-0f9c856d65d8	reviews/d9f0c791-0fc8-4186-bf2c-0f9c856d65d8/4889286d-1732-48b4-8196-2c92dbb54306-1772459613696-6ecb6e17-bf64-419f-8271-8b6e625a09be.jpg	1
048d212f-c5c7-4c49-8d96-2c0402d9f672	a1cbae7c-ff69-458b-a487-83d72c555a14	reviews/a1cbae7c-ff69-458b-a487-83d72c555a14/4889286d-1732-48b4-8196-2c92dbb54306-1772459631093-35635de1-e7a2-422f-ad2b-0254f29b56be.jpg	1
be47dcbf-5ad1-418f-933c-4306107c0922	ad4b8c48-860f-4453-aa03-5b2116021ef8	reviews/ad4b8c48-860f-4453-aa03-5b2116021ef8/4889286d-1732-48b4-8196-2c92dbb54306-1772459869277-6c74048d-b01c-4177-beb3-a12ec32ed39a.jpg	1
12ac2be1-b70f-40ae-96d7-3329f587e819	1564a76c-7671-4a3f-8984-3798147f5114	reviews/1564a76c-7671-4a3f-8984-3798147f5114/4889286d-1732-48b4-8196-2c92dbb54306-1772459891903-ca7da292-dfb8-4bcf-b090-84d50081d348.jpg	1
729ea46d-3159-4886-8729-efce61ac2b55	a3018d8e-e727-40ba-b3b0-6ecab88a1ee5	reviews/a3018d8e-e727-40ba-b3b0-6ecab88a1ee5/4889286d-1732-48b4-8196-2c92dbb54306-1772459908544-5de035e3-8c63-4682-bb60-9bd5edc54250.jpg	1
8b1a7054-cf7e-45b4-8bad-e036aa712a70	5393cc14-e9d8-4e12-9f0b-9b87b38df4d2	reviews/5393cc14-e9d8-4e12-9f0b-9b87b38df4d2/4889286d-1732-48b4-8196-2c92dbb54306-1772460006543-49d50957-d27a-4e4f-a9e6-b31f03f73e7a.jpg	1
cef1372d-0e36-4f43-8f09-a42d2b486a6e	f3908ad1-de86-42f8-b028-e45a9eec99f2	reviews/f3908ad1-de86-42f8-b028-e45a9eec99f2/4889286d-1732-48b4-8196-2c92dbb54306-1772460035826-264159c5-451e-488d-9077-b50643c2a5e1.jpg	1
2ecd9f5e-5878-4db8-bbf3-9398d108e36a	63cbf572-cf6d-420c-a1f4-692f536de385	reviews/63cbf572-cf6d-420c-a1f4-692f536de385/4889286d-1732-48b4-8196-2c92dbb54306-1772460072948-6cc42a71-1b3c-48ca-8c9e-e0225a9d54d1.jpg	1
1d099372-475a-423c-8c7b-e80ed96b85ae	d8259ff7-71ff-43ea-a0fd-899eee90ab1e	reviews/d8259ff7-71ff-43ea-a0fd-899eee90ab1e/4889286d-1732-48b4-8196-2c92dbb54306-1772460148006-8ad87318-e4c6-40ec-9aa0-770f20c18985.jpg	1
55386f42-f4b6-4657-bb2b-c458292122b0	e9d151b9-f3b9-4b05-8d92-0caec1ef1e1e	reviews/e9d151b9-f3b9-4b05-8d92-0caec1ef1e1e/4889286d-1732-48b4-8196-2c92dbb54306-1772460164565-29a210e2-6772-4baa-bc23-9beaab167ddb.jpg	1
cd94abf8-da70-4f52-bacc-2bb9a1242f2f	b4d447e9-c828-4527-97e1-7e302871281c	reviews/b4d447e9-c828-4527-97e1-7e302871281c/4889286d-1732-48b4-8196-2c92dbb54306-1772460179310-b4727666-229c-412a-b22e-c0c3c62a7b71.jpg	1
7df5499b-d478-4386-b408-022a93762e95	5479c290-2452-4b7c-8487-9d4def6e7e10	reviews/5479c290-2452-4b7c-8487-9d4def6e7e10/4889286d-1732-48b4-8196-2c92dbb54306-1772460259373-ce821f5b-93b6-4fc5-85af-71085102cebe.jpg	1
4fa468cd-be46-4915-ac7f-e849f2d01066	159f32c0-8638-4c06-afc1-dca723657fd4	reviews/159f32c0-8638-4c06-afc1-dca723657fd4/4889286d-1732-48b4-8196-2c92dbb54306-1772460279126-a96185c8-d4b9-4211-be61-f2783f3e319c.jpg	1
74f8c1bf-a37a-4437-a48c-74e2d89e8871	e95828f1-3576-4947-812d-9c0fbb660075	reviews/e95828f1-3576-4947-812d-9c0fbb660075/4889286d-1732-48b4-8196-2c92dbb54306-1772460295839-e8ae2c09-8d06-48dc-9da5-d24ca0089278.jpg	1
6617109d-2c58-439e-8a63-8cbfe51ea4c2	e5027182-dc46-4e50-81e1-d0d3bdddbebd	reviews/e5027182-dc46-4e50-81e1-d0d3bdddbebd/4889286d-1732-48b4-8196-2c92dbb54306-1772460374191-45a4d5c3-0cda-4da2-9b88-fd8eefba8c92.jpg	1
15a65694-3430-4eed-89e1-6d35898517c4	e7b19d90-98e2-4609-ae64-93bcf8cde9fd	reviews/e7b19d90-98e2-4609-ae64-93bcf8cde9fd/4889286d-1732-48b4-8196-2c92dbb54306-1772460390732-616f1f81-7821-4b3b-bd1b-fc9a8858b98a.jpg	1
f08733ec-8a57-4206-850d-bc5f9ba24744	cf8b1a5c-9692-48ea-a1e7-580565ed8119	reviews/cf8b1a5c-9692-48ea-a1e7-580565ed8119/4889286d-1732-48b4-8196-2c92dbb54306-1772460413097-61eaf4a5-b846-4559-bb8e-dd4beb044395.jpg	1
5f1762c0-3978-406b-ae5e-fa92957c9bef	367d563d-1972-431b-a68d-abc0fdb7adcd	reviews/367d563d-1972-431b-a68d-abc0fdb7adcd/4889286d-1732-48b4-8196-2c92dbb54306-1772460502782-84f5f1d8-87f4-4f58-80fb-2eae981cb699.jpg	1
290b87cf-1c6d-4aed-a9fb-8f2787bcda54	315ac416-248f-442f-9af9-d133ae3d2b3d	reviews/315ac416-248f-442f-9af9-d133ae3d2b3d/4889286d-1732-48b4-8196-2c92dbb54306-1772460522398-c02e9bcb-17eb-4339-bcda-9f22a94e14f1.jpg	1
cbe743b7-bcf0-4ed0-8ce3-f69af5704288	8b10cf22-0a61-4cd0-a7a3-42db59c8b23a	reviews/8b10cf22-0a61-4cd0-a7a3-42db59c8b23a/4889286d-1732-48b4-8196-2c92dbb54306-1772460544674-e92b2a14-64fa-4a66-93b8-1866ea00114c.jpg	1
a6a82268-0321-4373-b9a7-270d5e024491	a5b33474-eda8-43fc-92e1-f9fea0fd1bc9	reviews/a5b33474-eda8-43fc-92e1-f9fea0fd1bc9/4889286d-1732-48b4-8196-2c92dbb54306-1772460552242-672e7cff-6e3d-40b1-823e-51fce46e9840.jpeg	1
9eb42a94-155d-475d-a2fc-e37c96a57098	a5b33474-eda8-43fc-92e1-f9fea0fd1bc9	reviews/a5b33474-eda8-43fc-92e1-f9fea0fd1bc9/4889286d-1732-48b4-8196-2c92dbb54306-1772460552243-fd159e5b-74f6-424a-a7cf-4dac198dc218.jpg	2
46820c1c-75e8-4287-a244-0e3f32425a97	a5b33474-eda8-43fc-92e1-f9fea0fd1bc9	reviews/a5b33474-eda8-43fc-92e1-f9fea0fd1bc9/4889286d-1732-48b4-8196-2c92dbb54306-1772460552245-5ddc7f95-8c0a-4d61-a33f-8a38b541e780.jpg	3
fe806bbb-edcb-42f2-8bad-3acbd5f8b7dd	a5b33474-eda8-43fc-92e1-f9fea0fd1bc9	reviews/a5b33474-eda8-43fc-92e1-f9fea0fd1bc9/4889286d-1732-48b4-8196-2c92dbb54306-1772460552247-7cc90353-4fdb-4836-937a-43a372bc7065.jpg	4
843a1bf8-6286-4fe2-91a6-286133b10d73	a5b33474-eda8-43fc-92e1-f9fea0fd1bc9	reviews/a5b33474-eda8-43fc-92e1-f9fea0fd1bc9/4889286d-1732-48b4-8196-2c92dbb54306-1772460552249-c043f1d8-d2c3-4888-a801-a98edd94562d.jpeg	5
22539897-1208-4d7b-894b-9d5cc87f03c9	a5b33474-eda8-43fc-92e1-f9fea0fd1bc9	reviews/a5b33474-eda8-43fc-92e1-f9fea0fd1bc9/4889286d-1732-48b4-8196-2c92dbb54306-1772460552250-b79cd850-9c40-4ad5-8c66-fba40aa8f7fe.webp	6
3bc250cc-3901-426c-96ee-d0613731c716	dd7eeba7-9976-4eab-8930-c23f1a1c3922	reviews/dd7eeba7-9976-4eab-8930-c23f1a1c3922/4889286d-1732-48b4-8196-2c92dbb54306-1772460633270-d982db19-3208-483d-b08b-c8f7ab56e034.webp	1
89cb74d6-ff68-4cd9-bce3-488dce990943	6943d3fc-c594-4013-b114-b83d481a9dde	reviews/6943d3fc-c594-4013-b114-b83d481a9dde/4889286d-1732-48b4-8196-2c92dbb54306-1772460635029-693342c1-ef85-4117-8924-b56b94f37989.jpg	1
b2642392-b0a5-4d4e-8fd2-9fbabd6bd54c	b59a4f93-fc8d-4f9f-a653-c6d5b6b75f3e	reviews/b59a4f93-fc8d-4f9f-a653-c6d5b6b75f3e/4889286d-1732-48b4-8196-2c92dbb54306-1772460656030-3ab40ebb-3d6c-4359-b409-f802bdc8dea1.jpg	1
ccf56b1e-6e7c-4916-a8f4-68f06fc03c2b	a786b8fa-f451-401c-a0b3-5c08899dd18a	reviews/a786b8fa-f451-401c-a0b3-5c08899dd18a/4889286d-1732-48b4-8196-2c92dbb54306-1772460685959-380ec217-46d0-4f18-bd6b-abc848f6b956.jpg	1
de767a0b-a284-4aaa-9fda-f32ea6b6b99e	30f05c76-0564-4d2a-aed2-8060a18e1369	reviews/30f05c76-0564-4d2a-aed2-8060a18e1369/4889286d-1732-48b4-8196-2c92dbb54306-1772460847610-fcd97a01-f419-4b16-b6f3-7e9f3fe63a3d.jpg	1
608379b5-840f-4830-9110-0cbe43244ec7	9dc40a97-4ffc-4476-8ea8-4edd71249581	reviews/9dc40a97-4ffc-4476-8ea8-4edd71249581/4889286d-1732-48b4-8196-2c92dbb54306-1772460870361-dd7bd8af-9b3d-40be-8d16-c143c5d4f9c2.jpg	1
4576f1f3-3026-4cb5-bf05-a7c302aa61c4	c0f34912-db2a-4247-a82c-815f52d21844	reviews/c0f34912-db2a-4247-a82c-815f52d21844/4889286d-1732-48b4-8196-2c92dbb54306-1772460899350-9e8f9a23-2e42-4854-b56d-00f8c7a66637.jpg	1
d5d65eb9-09e3-4d4d-b0c6-1051d048dd40	032d3992-474c-45b5-8420-d7405555c202	reviews/032d3992-474c-45b5-8420-d7405555c202/4889286d-1732-48b4-8196-2c92dbb54306-1772460995019-dfa27ccf-b76f-4b79-b23a-bcb27de1a920.jpg	1
2dd11f18-688e-45c9-9db3-60c4f2421403	3d4f6c00-eb7f-432a-a4e1-df5fbc4c18ec	reviews/3d4f6c00-eb7f-432a-a4e1-df5fbc4c18ec/4889286d-1732-48b4-8196-2c92dbb54306-1772461013422-7d5d7e18-6e3f-446a-b3c8-a287359fce9e.jpg	1
366ba5d2-5c4b-4b0e-99ae-8394305c36ff	d6279bc4-6c28-45e0-b641-5ba834d89848	reviews/d6279bc4-6c28-45e0-b641-5ba834d89848/4889286d-1732-48b4-8196-2c92dbb54306-1772461039329-749026a8-3fd2-4c82-adab-d57e6ba828e8.jpg	1
b1248550-2cc8-4360-894f-d638227b1f91	6cd1ef22-db6e-4156-952d-f34ad0831138	reviews/6cd1ef22-db6e-4156-952d-f34ad0831138/4889286d-1732-48b4-8196-2c92dbb54306-1772461307071-65de9030-05c0-4788-990d-05b2e3054af4.jpg	1
a9b02b8f-0692-4933-b920-9f75ae2aa616	6cd1ef22-db6e-4156-952d-f34ad0831138	reviews/6cd1ef22-db6e-4156-952d-f34ad0831138/4889286d-1732-48b4-8196-2c92dbb54306-1772461307073-cab6a3ee-a236-4b04-a9d2-f22e838d1e2d.jpg	2
09749295-4884-487c-8464-ebf11f16e1bd	6cd1ef22-db6e-4156-952d-f34ad0831138	reviews/6cd1ef22-db6e-4156-952d-f34ad0831138/4889286d-1732-48b4-8196-2c92dbb54306-1772461307075-a2948610-9135-44b2-84c5-b05256a7fe5d.jpg	3
e7cbccf5-6e9f-4a11-b165-9267074cdf4c	6cd1ef22-db6e-4156-952d-f34ad0831138	reviews/6cd1ef22-db6e-4156-952d-f34ad0831138/4889286d-1732-48b4-8196-2c92dbb54306-1772461307077-86e135ff-e311-4e37-a90e-de477cefa603.jpg	4
aa3ad602-58b3-46a9-912f-04ef1632efa4	6cd1ef22-db6e-4156-952d-f34ad0831138	reviews/6cd1ef22-db6e-4156-952d-f34ad0831138/4889286d-1732-48b4-8196-2c92dbb54306-1772461307081-c6c8be84-aa46-4e98-abef-6633776dda1c.jpg	5
b85efcf8-3409-415f-b4d4-f943587eab39	1af05313-9106-4094-a0e5-6468559f1709	reviews/1af05313-9106-4094-a0e5-6468559f1709/4889286d-1732-48b4-8196-2c92dbb54306-1772461516433-aa950590-757f-401d-ba90-c1f372c25d4f.jpg	1
1fb016fc-e6ad-4c9e-a5e9-b1ce6a73ab9c	1af05313-9106-4094-a0e5-6468559f1709	reviews/1af05313-9106-4094-a0e5-6468559f1709/4889286d-1732-48b4-8196-2c92dbb54306-1772461516436-1668941b-0aff-4c88-af0a-1792ee186d51.jpg	2
485d11af-4965-40c6-9e55-4525e7ea4ce4	416afdf2-cf64-4bc0-980d-3624417dfccc	reviews/416afdf2-cf64-4bc0-980d-3624417dfccc/4889286d-1732-48b4-8196-2c92dbb54306-1772461552072-c38bef79-aa99-4d2a-ab76-ea4ecab8b5f1.jpg	1
f03eefa3-eafd-440a-96da-04b2583f1ec5	8b46d47b-1068-4522-8c3f-18e1a02fb220	reviews/8b46d47b-1068-4522-8c3f-18e1a02fb220/4889286d-1732-48b4-8196-2c92dbb54306-1772461568099-3d20e3c4-5052-4e2d-9267-c91535611bdb.jpg	1
5fbedd6c-172f-4380-b792-6c84eaadc7a9	8b46d47b-1068-4522-8c3f-18e1a02fb220	reviews/8b46d47b-1068-4522-8c3f-18e1a02fb220/4889286d-1732-48b4-8196-2c92dbb54306-1772461568101-6f20765a-0ccc-474e-871d-3bb16a8abeb5.jpg	2
ba1c0a9b-1ce6-4b41-87cd-0ff53e5004e7	a57ae723-b7c2-46d6-a48f-8b37fde5b81f	reviews/a57ae723-b7c2-46d6-a48f-8b37fde5b81f/4889286d-1732-48b4-8196-2c92dbb54306-1772461592942-957ad57e-810e-42dc-bb67-f7de27102774.jpg	1
05a0e34a-ceea-4722-a20c-f54caf42efa0	a57ae723-b7c2-46d6-a48f-8b37fde5b81f	reviews/a57ae723-b7c2-46d6-a48f-8b37fde5b81f/4889286d-1732-48b4-8196-2c92dbb54306-1772461592944-be388cf6-3890-4347-803b-8ac834b169b2.jpg	2
ca5fe2ec-c8a8-46f9-9c17-4f8cc98735aa	73b55c16-19e1-4968-ba33-9ed858d2c3a7	reviews/73b55c16-19e1-4968-ba33-9ed858d2c3a7/4889286d-1732-48b4-8196-2c92dbb54306-1772461838969-756fb5c7-958d-49e9-958e-d06e1e5e34aa.jpeg	1
b9c54267-a4eb-41a3-abaf-71a8896153b7	73b55c16-19e1-4968-ba33-9ed858d2c3a7	reviews/73b55c16-19e1-4968-ba33-9ed858d2c3a7/4889286d-1732-48b4-8196-2c92dbb54306-1772461838974-a7748958-2f18-4b45-9205-f796c430df87.jpg	2
41c7265a-72bb-47db-b294-f5938814cc1d	7cb31d8e-9f2a-4619-a4c6-3a206e6b1cf1	reviews/7cb31d8e-9f2a-4619-a4c6-3a206e6b1cf1/4889286d-1732-48b4-8196-2c92dbb54306-1772461920163-00191909-dc5b-4fa5-a292-a2273bfa7cfb.jpg	1
28849da6-7824-4f9a-b8a2-98074fc389a4	7cb31d8e-9f2a-4619-a4c6-3a206e6b1cf1	reviews/7cb31d8e-9f2a-4619-a4c6-3a206e6b1cf1/4889286d-1732-48b4-8196-2c92dbb54306-1772461920166-e84c41ce-4bc0-4247-bd08-d6d60f8f81e7.jpg	2
75ba354b-e661-4f3a-9fb4-675265a907d1	cf67044a-ed03-4704-a9c2-51844b1fbeab	reviews/cf67044a-ed03-4704-a9c2-51844b1fbeab/4889286d-1732-48b4-8196-2c92dbb54306-1772461961389-6fb6c488-9bd3-49b4-b7ec-a8bf28ef9740.jpg	1
cbad34af-2d6b-4982-8b95-b75826763e56	cf67044a-ed03-4704-a9c2-51844b1fbeab	reviews/cf67044a-ed03-4704-a9c2-51844b1fbeab/4889286d-1732-48b4-8196-2c92dbb54306-1772461961392-d2bc619d-2827-4da0-b426-a8a80a9d7ff2.jpg	2
4ac23011-b861-40e3-a6e7-20b0557bfdae	1e2c96be-6fdd-497d-9449-d420a50b2be7	reviews/1e2c96be-6fdd-497d-9449-d420a50b2be7/4889286d-1732-48b4-8196-2c92dbb54306-1772462217224-46f458f9-d95a-4dd1-bb64-ee58fc8de14b.webp	1
cf1f94d1-d538-4183-8e6c-36b4d0021b47	1e2c96be-6fdd-497d-9449-d420a50b2be7	reviews/1e2c96be-6fdd-497d-9449-d420a50b2be7/4889286d-1732-48b4-8196-2c92dbb54306-1772462217227-8687ee8a-73b4-44bf-862f-0f68fe16ff2c.webp	2
bb1f687a-4c1d-4842-aca2-c7848a12a7b5	b7e54d99-c1bf-4f36-9d7e-02264f60e16e	reviews/b7e54d99-c1bf-4f36-9d7e-02264f60e16e/4889286d-1732-48b4-8196-2c92dbb54306-1772462247233-d4ecfce5-570a-400f-af03-67db26369210.jpeg	1
556c7327-4b61-4d4f-839d-006dc429ca09	b7e54d99-c1bf-4f36-9d7e-02264f60e16e	reviews/b7e54d99-c1bf-4f36-9d7e-02264f60e16e/4889286d-1732-48b4-8196-2c92dbb54306-1772462247236-b8036380-85ab-46f0-b903-998ee2b2b58b.jpg	2
06b02778-4ae3-4421-970d-999803c976f2	78353017-92f8-4a0d-af12-7fba35454ad5	reviews/78353017-92f8-4a0d-af12-7fba35454ad5/4889286d-1732-48b4-8196-2c92dbb54306-1772462272475-9667c583-fef4-4d21-9148-915778b44d95.webp	1
3e08463e-9686-4285-8c29-6099d635f618	78353017-92f8-4a0d-af12-7fba35454ad5	reviews/78353017-92f8-4a0d-af12-7fba35454ad5/4889286d-1732-48b4-8196-2c92dbb54306-1772462272477-242aa921-9df9-4c01-b458-13735967c7fa.webp	2
51514765-1f37-4ed8-b68d-79b0ea79a305	de9fa9b1-47a3-451b-bfb5-d6ed269bcb41	reviews/de9fa9b1-47a3-451b-bfb5-d6ed269bcb41/4889286d-1732-48b4-8196-2c92dbb54306-1772462301315-1e1d36ed-d4fa-4c7f-8ff4-45c4f5a92220.jpg	1
8c9db2f4-decc-4cc0-ab46-0e8fa9c32c3a	de9fa9b1-47a3-451b-bfb5-d6ed269bcb41	reviews/de9fa9b1-47a3-451b-bfb5-d6ed269bcb41/4889286d-1732-48b4-8196-2c92dbb54306-1772462301316-e975cdfb-3f31-4408-a4f0-fcddd12bd55b.jpg	2
4ca2f455-9787-4c7b-bae9-76f5f221ce3e	176f3245-9a5e-4e8b-9ded-915d54fdcde7	reviews/176f3245-9a5e-4e8b-9ded-915d54fdcde7/4889286d-1732-48b4-8196-2c92dbb54306-1772462384954-acd4fcfb-4bee-4225-b677-6867611f4edd.jpeg	1
38c76153-51f5-4f5d-90d6-bf26d485e541	176f3245-9a5e-4e8b-9ded-915d54fdcde7	reviews/176f3245-9a5e-4e8b-9ded-915d54fdcde7/4889286d-1732-48b4-8196-2c92dbb54306-1772462384958-7c3c8a25-bfc3-42b8-b076-29a7b9d3e03e.jpg	2
c9e0f52f-0de9-497d-a6c2-fab74077a014	176f3245-9a5e-4e8b-9ded-915d54fdcde7	reviews/176f3245-9a5e-4e8b-9ded-915d54fdcde7/4889286d-1732-48b4-8196-2c92dbb54306-1772462384960-4d97c3e1-a118-4d9f-a47e-d686eb4431f6.jpg	3
98ba52b2-d9cb-4b90-8429-b44f9e6699a6	176f3245-9a5e-4e8b-9ded-915d54fdcde7	reviews/176f3245-9a5e-4e8b-9ded-915d54fdcde7/4889286d-1732-48b4-8196-2c92dbb54306-1772462384962-7e711038-da0d-4af8-896d-135ef31ae758.jpg	4
a0ef3a24-3453-4161-9dd1-426b2431a1f1	02eed253-19d7-4db7-96ec-36badd9976ab	reviews/02eed253-19d7-4db7-96ec-36badd9976ab/4889286d-1732-48b4-8196-2c92dbb54306-1772462642245-062a61e4-f9f9-4282-98bf-386ed65d1016.jpeg	1
f785b937-f9b4-4452-b1ca-d8889ef0cd45	02eed253-19d7-4db7-96ec-36badd9976ab	reviews/02eed253-19d7-4db7-96ec-36badd9976ab/4889286d-1732-48b4-8196-2c92dbb54306-1772462642259-689abda5-46b7-4c34-a856-43436c372ed5.jpg	2
7d0e8a7c-79d9-4fad-b811-b01c1c7e6b12	829a7367-18ff-428b-9345-5b52e42b5ebd	reviews/829a7367-18ff-428b-9345-5b52e42b5ebd/4889286d-1732-48b4-8196-2c92dbb54306-1772463154696-dc9f1dd4-e923-4665-99b6-764f6c358aca.jpg	1
923effc1-8785-413c-bdba-c88e562baaa6	829a7367-18ff-428b-9345-5b52e42b5ebd	reviews/829a7367-18ff-428b-9345-5b52e42b5ebd/4889286d-1732-48b4-8196-2c92dbb54306-1772463154700-1f444d3a-e357-4392-aed5-f04889ba9a35.jpg	2
bdc14b41-3663-4cc8-a7b2-ab8824927eb0	1e46d7ec-1db0-4fc6-995e-abc021c87714	reviews/1e46d7ec-1db0-4fc6-995e-abc021c87714/4889286d-1732-48b4-8196-2c92dbb54306-1772463273672-6c661202-e54d-4ec9-88fe-808721947d73.jpg	1
807b3af5-b77b-4e3b-a292-2032d6c07e4a	1e46d7ec-1db0-4fc6-995e-abc021c87714	reviews/1e46d7ec-1db0-4fc6-995e-abc021c87714/4889286d-1732-48b4-8196-2c92dbb54306-1772463273675-58e8a98c-7c5e-4104-9dd2-1a3847ad517a.jpg	2
b46c7ea4-8a35-434e-971d-97f06006ac82	5451c234-0ec8-454c-99d1-8773f6888e66	reviews/5451c234-0ec8-454c-99d1-8773f6888e66/4889286d-1732-48b4-8196-2c92dbb54306-1772463330824-ea53d9e0-8c16-46fc-8921-b6b8e421b3c7.jpeg	1
3568a577-f031-4bd1-981a-19cf1328c981	389291f8-ec12-4cb3-9dbc-848a38d835bf	reviews/389291f8-ec12-4cb3-9dbc-848a38d835bf/4889286d-1732-48b4-8196-2c92dbb54306-1772463360186-5b3dab1d-374e-43dc-bb59-3c352f364fb1.jpeg	1
733a78b3-1abd-48a1-8db3-1e8168a87b67	ae9c900a-773f-4203-99f5-fb85cb8e2f03	reviews/ae9c900a-773f-4203-99f5-fb85cb8e2f03/4889286d-1732-48b4-8196-2c92dbb54306-1772463397586-0290d685-bd8b-4b1d-ac97-62c680609f84.jpg	1
579f8fce-0f68-4abd-a2b2-b30c2cfe26b2	ae9c900a-773f-4203-99f5-fb85cb8e2f03	reviews/ae9c900a-773f-4203-99f5-fb85cb8e2f03/4889286d-1732-48b4-8196-2c92dbb54306-1772463397589-8a9d39a0-5b57-4b51-998e-cae8141cdb9c.jpeg	2
932e749a-e53a-45f6-afb2-8ccda1b1e93a	f18eb77a-e2ea-4109-97a1-93563d729237	reviews/f18eb77a-e2ea-4109-97a1-93563d729237/4889286d-1732-48b4-8196-2c92dbb54306-1772463515790-4215287e-d260-465e-903a-f0af80fac522.jpg	1
9dc574eb-2700-4572-80ba-a8f2d7a3a2b1	f18eb77a-e2ea-4109-97a1-93563d729237	reviews/f18eb77a-e2ea-4109-97a1-93563d729237/4889286d-1732-48b4-8196-2c92dbb54306-1772463515795-c7582748-bb17-44bb-97f7-bd035a5b5c09.webp	2
ea3dcb55-c962-4cb8-aaae-5500fb667384	f3ccd408-74de-48c6-ae0f-0c8adaa0b49d	reviews/f3ccd408-74de-48c6-ae0f-0c8adaa0b49d/4889286d-1732-48b4-8196-2c92dbb54306-1772463569919-b872935b-9b67-461d-91e3-7290755f1e8f.jpg	1
6ef6b4fc-750d-4b63-8bba-924a0a5814d5	f3ccd408-74de-48c6-ae0f-0c8adaa0b49d	reviews/f3ccd408-74de-48c6-ae0f-0c8adaa0b49d/4889286d-1732-48b4-8196-2c92dbb54306-1772463569921-4bfdb498-10ab-4faf-ac84-b5ed80633e4d.jpg	2
e28ca552-d258-4097-af39-1518828a6267	9def036c-8031-4e1e-988c-b42387cac7be	reviews/9def036c-8031-4e1e-988c-b42387cac7be/4889286d-1732-48b4-8196-2c92dbb54306-1772463613106-f27be26a-90c6-4082-aba0-83e78e3e329e.jpg	1
1567ea5f-be40-46a0-946a-3a37449470a2	9def036c-8031-4e1e-988c-b42387cac7be	reviews/9def036c-8031-4e1e-988c-b42387cac7be/4889286d-1732-48b4-8196-2c92dbb54306-1772463613109-1666b125-94ad-4c6c-93a3-a1fdf668e4ca.jpg	2
da9bc156-0bc4-4ccf-a46b-a1d44e559318	cca7cb8a-144b-4027-aa8e-04a4187c02f7	reviews/cca7cb8a-144b-4027-aa8e-04a4187c02f7/4889286d-1732-48b4-8196-2c92dbb54306-1772463833172-99f0d23d-fbb5-4e40-826c-b92d05d76136.webp	1
7ba537fa-fc99-4a0a-8853-7116aa95ec53	cca7cb8a-144b-4027-aa8e-04a4187c02f7	reviews/cca7cb8a-144b-4027-aa8e-04a4187c02f7/4889286d-1732-48b4-8196-2c92dbb54306-1772463833176-4b14af06-753d-4258-862a-b043ca6001b6.jpeg	2
cbb5317b-7a23-4f97-954b-10e72a3b9172	b4f922fb-a65b-450c-be6c-9d3cbc0c958c	reviews/b4f922fb-a65b-450c-be6c-9d3cbc0c958c/4889286d-1732-48b4-8196-2c92dbb54306-1772463881512-22ba6e26-a18e-4303-b98f-8a82dec61003.jpg	1
68340ca0-b595-4df0-b8de-84f513680841	b4f922fb-a65b-450c-be6c-9d3cbc0c958c	reviews/b4f922fb-a65b-450c-be6c-9d3cbc0c958c/4889286d-1732-48b4-8196-2c92dbb54306-1772463881516-32e31ab8-a206-4cf2-b875-c3a3f53a8c4a.jpg	2
05b96dcb-c4b9-4d36-a7f6-1182e1fa4c95	0746c080-caf0-44fe-8b71-b08a1dcced4c	reviews/0746c080-caf0-44fe-8b71-b08a1dcced4c/4889286d-1732-48b4-8196-2c92dbb54306-1772463924614-7a093481-71be-49ce-b078-31d7034ee0dd.jpg	1
76545e8c-fefc-484d-a78f-0c4ec3266cd4	0746c080-caf0-44fe-8b71-b08a1dcced4c	reviews/0746c080-caf0-44fe-8b71-b08a1dcced4c/4889286d-1732-48b4-8196-2c92dbb54306-1772463924619-27a98180-5c4e-4628-a6b3-638ef1a4d700.jpg	2
2d2ed94f-253a-4711-88a6-03912ae39918	256ab0eb-fe80-4f5d-aafc-37df4c979856	reviews/256ab0eb-fe80-4f5d-aafc-37df4c979856/4889286d-1732-48b4-8196-2c92dbb54306-1772464251606-16682052-a0a1-4543-aa86-2524c8c4e84d.jpg	1
47630dfa-ebc0-4a42-ac8d-5cd492d12b84	256ab0eb-fe80-4f5d-aafc-37df4c979856	reviews/256ab0eb-fe80-4f5d-aafc-37df4c979856/4889286d-1732-48b4-8196-2c92dbb54306-1772464251609-4143ddd0-a1a6-4772-a8ed-0d3dcae543ac.jpg	2
574d6fa3-5d0d-467e-9d07-97c9739a2341	e30be9f4-09d1-40a8-be12-d1b69f64fbe2	reviews/e30be9f4-09d1-40a8-be12-d1b69f64fbe2/4889286d-1732-48b4-8196-2c92dbb54306-1772464253155-82506e7a-28e0-4f0c-8f42-6b2fa1817af3.jpg	1
bf6dc292-e79b-412d-9155-cdea8060f167	e30be9f4-09d1-40a8-be12-d1b69f64fbe2	reviews/e30be9f4-09d1-40a8-be12-d1b69f64fbe2/4889286d-1732-48b4-8196-2c92dbb54306-1772464253157-d8a6edf0-0f5a-4436-a9e1-1e8361bc7845.jpg	2
ea2d39fd-51af-46fc-a15b-140efd839863	6f2e5584-08ee-4e46-83af-00b381f9afcf	reviews/6f2e5584-08ee-4e46-83af-00b381f9afcf/4889286d-1732-48b4-8196-2c92dbb54306-1772464299072-15435dea-a791-4878-9228-e1127fc1f668.webp	1
b18b3dfb-c349-469c-888d-ceebe7779ef2	6f2e5584-08ee-4e46-83af-00b381f9afcf	reviews/6f2e5584-08ee-4e46-83af-00b381f9afcf/4889286d-1732-48b4-8196-2c92dbb54306-1772464299076-e3756732-2b6f-4240-9591-2fdabfa1a6d7.jpeg	2
ac5edd68-61e0-4a15-8007-f87d0d530002	377e199d-3938-4aee-9cb5-bd9af3a5222c	reviews/377e199d-3938-4aee-9cb5-bd9af3a5222c/4889286d-1732-48b4-8196-2c92dbb54306-1772464341063-c33638b4-4667-4457-aad4-9d7d81762580.webp	1
f44f3134-bb9f-405e-b92b-1f166d6f7a9f	377e199d-3938-4aee-9cb5-bd9af3a5222c	reviews/377e199d-3938-4aee-9cb5-bd9af3a5222c/4889286d-1732-48b4-8196-2c92dbb54306-1772464341066-40696557-fcb3-4bf8-8408-f252f44a8c70.jpg	2
6a7cb980-8f05-4f51-99c1-00c21efcc0a5	a09f3195-d272-4299-b210-3d577c5058e1	reviews/a09f3195-d272-4299-b210-3d577c5058e1/4889286d-1732-48b4-8196-2c92dbb54306-1772464567587-35b4dde6-bfb8-4172-803c-e0b1e9bce910.jpeg	1
39327d96-28e6-4007-a141-4fda27020f73	a09f3195-d272-4299-b210-3d577c5058e1	reviews/a09f3195-d272-4299-b210-3d577c5058e1/4889286d-1732-48b4-8196-2c92dbb54306-1772464567601-3ea1c47d-0702-417d-ad31-2059806d56cd.jpg	2
43f0f593-9d12-4772-a089-5d4725b541d6	5aa50343-b98e-413a-a662-356c7612dd6b	reviews/5aa50343-b98e-413a-a662-356c7612dd6b/4889286d-1732-48b4-8196-2c92dbb54306-1772464624460-184a4be1-f5e7-47c8-a6bd-63e1d0a24af1.jpg	1
303279d1-f2e9-451b-9392-bd2208cdc3c2	ef2a9a48-c770-4f31-bc35-f6c3351bbb79	reviews/ef2a9a48-c770-4f31-bc35-f6c3351bbb79/4889286d-1732-48b4-8196-2c92dbb54306-1772464689829-61166478-e17c-48ae-b123-8b880ef98892.jfif	1
61fbe0fa-b18e-493f-9b76-1c4abbc06840	2658a74b-2c3b-4307-879f-aa6d2a25213c	reviews/2658a74b-2c3b-4307-879f-aa6d2a25213c/4889286d-1732-48b4-8196-2c92dbb54306-1772464704018-fd280f68-3358-48b1-a9ca-92a61d54f294.jpg	1
0b0b73dc-2cd0-41bd-be2c-a66a4f356182	2658a74b-2c3b-4307-879f-aa6d2a25213c	reviews/2658a74b-2c3b-4307-879f-aa6d2a25213c/4889286d-1732-48b4-8196-2c92dbb54306-1772464704020-d03665c9-a575-4bbf-9b0e-4063318ffece.jpeg	2
a529729e-8f95-49c3-8cce-6cc2e5c3e5c7	d2312809-812e-43b9-9eec-fb4e5f89b0b2	reviews/d2312809-812e-43b9-9eec-fb4e5f89b0b2/4889286d-1732-48b4-8196-2c92dbb54306-1772464731884-82fd9fb3-1ab4-4403-bb04-63e31c226e61.jfif	1
66a5912c-0142-41ca-ba07-a0f5a8fec110	d2312809-812e-43b9-9eec-fb4e5f89b0b2	reviews/d2312809-812e-43b9-9eec-fb4e5f89b0b2/4889286d-1732-48b4-8196-2c92dbb54306-1772464731886-5fe01a6b-d115-425a-9e26-a2f7ad026385.jfif	2
1fa72243-c720-41b5-bf91-ad3d447e4b3f	d2312809-812e-43b9-9eec-fb4e5f89b0b2	reviews/d2312809-812e-43b9-9eec-fb4e5f89b0b2/4889286d-1732-48b4-8196-2c92dbb54306-1772464731888-07ff1213-4b35-4da3-90d0-16bc633a7183.jfif	3
00008b18-e3cb-422a-99f1-6f7c785352af	494597ac-061e-4735-b26d-e2af1c4cb6ac	reviews/494597ac-061e-4735-b26d-e2af1c4cb6ac/4889286d-1732-48b4-8196-2c92dbb54306-1772464745955-95a76422-382b-41b7-ab05-96464c883b1f.jpg	1
2d7f540d-4316-46a3-bd12-6a649c8dd7ad	494597ac-061e-4735-b26d-e2af1c4cb6ac	reviews/494597ac-061e-4735-b26d-e2af1c4cb6ac/4889286d-1732-48b4-8196-2c92dbb54306-1772464745957-cbf95b21-79dc-4969-bd3b-825c29c1fc4f.jpeg	2
eed6e8d8-96ab-48cd-879a-7a87e4f0135f	ac0c0189-7394-4e38-afca-72a17654328c	reviews/ac0c0189-7394-4e38-afca-72a17654328c/4889286d-1732-48b4-8196-2c92dbb54306-1772464927704-3ddb9909-bc12-4837-b3cf-8a18e1abb4f9.jpg	1
25e6db24-a6d7-4bd5-bf8a-af030138f3ad	ac0c0189-7394-4e38-afca-72a17654328c	reviews/ac0c0189-7394-4e38-afca-72a17654328c/4889286d-1732-48b4-8196-2c92dbb54306-1772464927711-3db4bb2f-f4e9-4184-8de9-4b7002ee99ce.jpg	2
a0816671-2167-441a-8b98-cfccaa3fc050	db161df1-694b-492b-8ed3-5b24bf143a49	reviews/db161df1-694b-492b-8ed3-5b24bf143a49/4889286d-1732-48b4-8196-2c92dbb54306-1772464969934-e488e269-1912-4339-a220-7db2c902865a.jpg	1
769fc521-5bac-41d3-98c6-b73601afce70	db161df1-694b-492b-8ed3-5b24bf143a49	reviews/db161df1-694b-492b-8ed3-5b24bf143a49/4889286d-1732-48b4-8196-2c92dbb54306-1772464969941-30b2c999-b630-4932-b3d6-207b5d2d58c1.webp	2
ae5799af-66d7-4e87-9b11-a5dda378a81e	2baa19a4-8943-4a47-87d9-57a0f255218b	reviews/2baa19a4-8943-4a47-87d9-57a0f255218b/4889286d-1732-48b4-8196-2c92dbb54306-1772465064832-cf23cdf6-1a0f-4c33-bf69-aef9e280065e.webp	1
f0575287-f82f-4e90-9234-834e9e551da2	fa15b8e7-cdaa-478d-859b-f23a35272d15	reviews/fa15b8e7-cdaa-478d-859b-f23a35272d15/4889286d-1732-48b4-8196-2c92dbb54306-1772465160876-f58fef05-daf0-473b-ac05-7d73b4513f35.jpg	1
6f482c87-1670-47f9-9a8d-240b42091e3a	fa15b8e7-cdaa-478d-859b-f23a35272d15	reviews/fa15b8e7-cdaa-478d-859b-f23a35272d15/4889286d-1732-48b4-8196-2c92dbb54306-1772465160882-5fd9cf90-f572-4ad9-a17f-53b99bd8aeb4.jpeg	2
79d13a40-8a30-48e7-91f1-33164f666e39	86ff4281-659c-44eb-89f6-1d1a8238d43f	reviews/86ff4281-659c-44eb-89f6-1d1a8238d43f/4889286d-1732-48b4-8196-2c92dbb54306-1772465194196-970c284e-9e64-49e3-9228-76f81e74057f.jpg	1
042dd279-b17a-42c8-aa7b-03dde842077c	86ff4281-659c-44eb-89f6-1d1a8238d43f	reviews/86ff4281-659c-44eb-89f6-1d1a8238d43f/4889286d-1732-48b4-8196-2c92dbb54306-1772465194199-7dc3d6ed-0a87-4a7e-a285-4f09079b33e5.jpg	2
190e7eb2-06e8-4d14-8660-41e3e69da6a7	15b2ebbc-7363-4a92-a020-1642e7ecb807	reviews/15b2ebbc-7363-4a92-a020-1642e7ecb807/4889286d-1732-48b4-8196-2c92dbb54306-1772465252176-085975bd-c506-473e-9299-f0ad434de911.jpg	1
ae13781c-d1a1-4b87-91b7-7532285db818	15b2ebbc-7363-4a92-a020-1642e7ecb807	reviews/15b2ebbc-7363-4a92-a020-1642e7ecb807/4889286d-1732-48b4-8196-2c92dbb54306-1772465252180-eafe7bb0-5316-48c6-9f8c-9f38c9711f0a.webp	2
a0e5a0ae-14b9-4814-a4e1-215d1d3a6bf0	ebb88186-94bf-49e5-bd0a-3bb4bb1fa6bb	reviews/ebb88186-94bf-49e5-bd0a-3bb4bb1fa6bb/4889286d-1732-48b4-8196-2c92dbb54306-1772465419337-a8419aa1-02b5-46ea-aebb-7b9c3a8166bd.jpg	1
11d4253f-6ad1-4b2a-a601-edc529415ef8	ebb88186-94bf-49e5-bd0a-3bb4bb1fa6bb	reviews/ebb88186-94bf-49e5-bd0a-3bb4bb1fa6bb/4889286d-1732-48b4-8196-2c92dbb54306-1772465419340-9e700ca1-d927-400e-9ca7-13b308515d5a.jpg	2
2c596f00-d440-4bf6-a011-36a3b16d7dec	842bcf6d-4cb0-4da9-85d9-4691131fecf7	reviews/842bcf6d-4cb0-4da9-85d9-4691131fecf7/4889286d-1732-48b4-8196-2c92dbb54306-1772465451491-96dd9113-f760-4e19-8d1f-68f475283f83.jpg	1
66ec1e17-6241-42da-bff4-85b8d2899c9b	842bcf6d-4cb0-4da9-85d9-4691131fecf7	reviews/842bcf6d-4cb0-4da9-85d9-4691131fecf7/4889286d-1732-48b4-8196-2c92dbb54306-1772465451495-0fdc6079-8a90-45af-99f8-d55c0e27f647.jpg	2
9906151c-f252-4a82-9767-8e20c347b86d	05239fbb-0ad6-4db5-8821-26125a785b2c	reviews/05239fbb-0ad6-4db5-8821-26125a785b2c/4889286d-1732-48b4-8196-2c92dbb54306-1772465474148-8ef40326-942e-45e3-9dd8-aa216eefa1ed.jpg	1
51b8b70d-b2c1-4e39-930a-fdff5b7818d5	89a52783-4983-4cda-b65e-d60b215a6b15	reviews/89a52783-4983-4cda-b65e-d60b215a6b15/4889286d-1732-48b4-8196-2c92dbb54306-1772465572706-12f1ebe2-2f3b-48ac-8dfe-b976334b35a1.webp	1
ee9f366d-09d4-4892-9a98-b916e9a24c10	89a52783-4983-4cda-b65e-d60b215a6b15	reviews/89a52783-4983-4cda-b65e-d60b215a6b15/4889286d-1732-48b4-8196-2c92dbb54306-1772465572710-6bedd31a-7c9d-4775-b971-867ffe98dd1a.webp	2
1c4fc6b9-af94-49f9-bdf5-3d38fd55670a	90ab0d79-188b-413e-b6ec-251931c8208e	reviews/90ab0d79-188b-413e-b6ec-251931c8208e/4889286d-1732-48b4-8196-2c92dbb54306-1772465625552-54c41665-d72b-4136-bc01-4c870cc84d3b.jpg	1
3eecd9c6-aa4f-44b7-84e3-386c3d12f70b	e3de6d4c-4343-4f4b-81fb-6d48a8550075	reviews/e3de6d4c-4343-4f4b-81fb-6d48a8550075/4889286d-1732-48b4-8196-2c92dbb54306-1772465648782-2a514da9-d330-40ca-8c46-246507bf88c2.jpg	1
05031fb1-3c46-4b16-bb9b-0748c8342154	12ec8994-4203-474f-96fe-c2c52bd59d0b	reviews/12ec8994-4203-474f-96fe-c2c52bd59d0b/4889286d-1732-48b4-8196-2c92dbb54306-1772465742261-3ec6b57c-0fea-4a23-8655-ce3a27515875.jpg	1
5cbdb599-5f44-4882-9931-e8d666421aaf	dc5af608-8996-4c20-b2e2-253635e45118	reviews/dc5af608-8996-4c20-b2e2-253635e45118/4889286d-1732-48b4-8196-2c92dbb54306-1772465772355-c10cb352-e970-4d57-87ae-1b77c5c8c848.jpg	1
98c17aa9-67c3-4321-9254-3bc9f6bde348	aa4a0ec8-7707-43a1-909f-57b2e1eec6bd	reviews/aa4a0ec8-7707-43a1-909f-57b2e1eec6bd/4889286d-1732-48b4-8196-2c92dbb54306-1772465808270-6d31c3db-4264-4347-b3f3-2d3d6f554fde.jpg	1
a39e7695-42d1-421e-a786-a5c105b21da5	aa4a0ec8-7707-43a1-909f-57b2e1eec6bd	reviews/aa4a0ec8-7707-43a1-909f-57b2e1eec6bd/4889286d-1732-48b4-8196-2c92dbb54306-1772465808273-4d3384e8-0937-4e86-8925-aa92f9f06a76.jfif	2
7474fe33-2d09-49d3-9776-9807ce7f6b81	e872b26d-ba92-477c-a9ce-19d1af5c1ca3	reviews/e872b26d-ba92-477c-a9ce-19d1af5c1ca3/4889286d-1732-48b4-8196-2c92dbb54306-1772465897457-08119bdf-3b31-42e2-9826-232eb74f20f9.webp	1
937ed9dc-a93e-468d-884b-15e3aa64f173	e872b26d-ba92-477c-a9ce-19d1af5c1ca3	reviews/e872b26d-ba92-477c-a9ce-19d1af5c1ca3/4889286d-1732-48b4-8196-2c92dbb54306-1772465897460-f16e048e-8846-4831-9b11-c6f0cf47432e.webp	2
224ea5ce-4c5e-441e-89ce-f945bd3ae756	e872b26d-ba92-477c-a9ce-19d1af5c1ca3	reviews/e872b26d-ba92-477c-a9ce-19d1af5c1ca3/4889286d-1732-48b4-8196-2c92dbb54306-1772465897463-f44c0cbf-c3af-47ee-ba94-ec49a21c1374.jpg	3
e5cf9d13-9c3b-4795-8000-edc7932d9e57	3ab45b8a-a5b5-453f-8fc2-1595f137e55a	reviews/3ab45b8a-a5b5-453f-8fc2-1595f137e55a/4889286d-1732-48b4-8196-2c92dbb54306-1772465989362-aba0c17b-eab3-4ec3-93b1-877ba097b8ec.jpg	1
4e2d441a-f546-4331-aa1a-dd3952191112	3ab45b8a-a5b5-453f-8fc2-1595f137e55a	reviews/3ab45b8a-a5b5-453f-8fc2-1595f137e55a/4889286d-1732-48b4-8196-2c92dbb54306-1772465989365-f436f4bc-9a0f-48e0-8ace-269c2ed8d707.jpeg	2
d8207348-6b26-477e-9167-5b1d5ee0ea78	5a6103e6-aa75-4432-a7f9-e965ef924db2	reviews/5a6103e6-aa75-4432-a7f9-e965ef924db2/4889286d-1732-48b4-8196-2c92dbb54306-1772466015937-5e8123c8-a598-409f-acca-3234f784ae74.jpg	1
ae1b2355-6f60-4af3-8edf-739ddea4c00e	b2790f8b-db09-4363-808c-d3f0119cf68c	reviews/b2790f8b-db09-4363-808c-d3f0119cf68c/4889286d-1732-48b4-8196-2c92dbb54306-1772466151983-ad9918d5-ea20-4337-8648-ee43e3ba0db7.jpg	1
5c4a2d69-dc62-486f-8dbf-b6515fb7606c	b2790f8b-db09-4363-808c-d3f0119cf68c	reviews/b2790f8b-db09-4363-808c-d3f0119cf68c/4889286d-1732-48b4-8196-2c92dbb54306-1772466151999-090907b1-3aa1-487e-938d-31e457018b8d.jpg	2
0c863f93-67fe-4af7-b98c-7c2c3f88a71d	e52d414d-5c84-40bd-9d09-60f20767e53c	reviews/e52d414d-5c84-40bd-9d09-60f20767e53c/4889286d-1732-48b4-8196-2c92dbb54306-1772466187151-76cce17e-7425-46c3-a0b9-8874744a3333.jpg	1
683b3b01-d9aa-4da4-a8d0-35b588318fd8	0e0b185a-9961-4872-be69-5c76c8f2e257	reviews/0e0b185a-9961-4872-be69-5c76c8f2e257/4889286d-1732-48b4-8196-2c92dbb54306-1772466234210-fb828ce4-e9be-48ae-82a3-656f8efc774e.jpg	1
559f76b3-639a-464b-a83e-750936a3b759	0e0b185a-9961-4872-be69-5c76c8f2e257	reviews/0e0b185a-9961-4872-be69-5c76c8f2e257/4889286d-1732-48b4-8196-2c92dbb54306-1772466234215-1421c134-24e3-40d0-8b1b-a7f081624b64.webp	2
34d49090-e3fb-4880-be95-cc5b840579ee	97755a43-16c7-482d-a86c-589d4b215dd5	reviews/97755a43-16c7-482d-a86c-589d4b215dd5/4889286d-1732-48b4-8196-2c92dbb54306-1772466341600-7d56ef67-ef14-4edb-b9bb-651b5c1293e9.jpg	1
5ada89b3-163e-426d-b172-9bad46ecda91	97755a43-16c7-482d-a86c-589d4b215dd5	reviews/97755a43-16c7-482d-a86c-589d4b215dd5/4889286d-1732-48b4-8196-2c92dbb54306-1772466341604-eb67cc6d-1444-4b57-9fe5-47b7b8403d51.jpg	2
4074a17b-0db3-41e1-90a4-1e6b07b6bc7e	09e7c9a1-44f0-4455-a185-674a90c3ff42	reviews/09e7c9a1-44f0-4455-a185-674a90c3ff42/4889286d-1732-48b4-8196-2c92dbb54306-1772466366955-fa9d1123-fb40-4be9-97a5-d3235d5df8a4.jpg	1
2b9b3307-cf0a-42b0-b7c9-668c118b8903	09e7c9a1-44f0-4455-a185-674a90c3ff42	reviews/09e7c9a1-44f0-4455-a185-674a90c3ff42/4889286d-1732-48b4-8196-2c92dbb54306-1772466366957-ede06f45-eabc-4a47-9ead-66db70970670.jpg	2
a30bd81c-02b6-4be3-85db-551910a1a748	4898f81d-fafd-4293-8854-78b49d852ade	reviews/4898f81d-fafd-4293-8854-78b49d852ade/4889286d-1732-48b4-8196-2c92dbb54306-1772466403094-f83dc7a6-d72b-4a4c-ad62-9cc7318dc566.webp	1
e0ebfdb1-5210-4a7c-a539-2cce9f07cb3b	6a934420-03cf-4762-a9ed-ad979e9a8433	reviews/6a934420-03cf-4762-a9ed-ad979e9a8433/4889286d-1732-48b4-8196-2c92dbb54306-1772466485473-7d5ac034-3e04-405e-9dc4-fcfb94c7edb3.jpg	1
1a553768-1ed2-4225-9a08-dcf3de6fa87a	6a934420-03cf-4762-a9ed-ad979e9a8433	reviews/6a934420-03cf-4762-a9ed-ad979e9a8433/4889286d-1732-48b4-8196-2c92dbb54306-1772466485476-8c5429dd-b0df-4fec-a6f0-30e7c95a19c4.png	2
8c3a5800-2a68-43a7-8cc1-b4348b4b8217	52bb9715-c710-4638-bf73-faf5468b4e92	reviews/52bb9715-c710-4638-bf73-faf5468b4e92/4889286d-1732-48b4-8196-2c92dbb54306-1772466518506-22431dcd-4aff-4741-a4f2-304aeb3898a8.jpg	1
7f551c1d-314b-4bfe-8341-00b5854731b3	52bb9715-c710-4638-bf73-faf5468b4e92	reviews/52bb9715-c710-4638-bf73-faf5468b4e92/4889286d-1732-48b4-8196-2c92dbb54306-1772466518511-01ca4f36-d659-4bde-b01c-60e13798c2c7.webp	2
03087263-f9e6-45f9-9342-3c0c6b40305f	6717233a-3a1d-41ef-a89f-87e9a90ad487	reviews/6717233a-3a1d-41ef-a89f-87e9a90ad487/4889286d-1732-48b4-8196-2c92dbb54306-1772466545040-1c778fe5-eb86-4bae-a2c7-f60207ddec86.jpg	1
0d105ff1-e1e8-44f2-9dc3-c19f3558beed	c57a028d-3948-46a0-af01-1ec10b009103	reviews/c57a028d-3948-46a0-af01-1ec10b009103/4889286d-1732-48b4-8196-2c92dbb54306-1772466631927-6536c7a3-6aeb-44c6-9b7d-51e59385aad6.jpg	1
90ff3b40-520d-4a27-a93a-a7744bcae48d	c57a028d-3948-46a0-af01-1ec10b009103	reviews/c57a028d-3948-46a0-af01-1ec10b009103/4889286d-1732-48b4-8196-2c92dbb54306-1772466631932-9043c723-1846-4a85-8061-7c3bf10d9e25.jpg	2
5df10978-3e86-482c-a795-852fb4abf535	cac252b9-1647-448f-b657-a8f33877101d	reviews/cac252b9-1647-448f-b657-a8f33877101d/4889286d-1732-48b4-8196-2c92dbb54306-1772466667196-84493f5b-e356-462f-9a03-0b35ef0f393e.jpg	1
7b9cf43f-1db6-467b-a16d-bc81e3d4423b	cac252b9-1647-448f-b657-a8f33877101d	reviews/cac252b9-1647-448f-b657-a8f33877101d/4889286d-1732-48b4-8196-2c92dbb54306-1772466667199-244dbb0a-4417-42e5-9c63-0a87cda49c51.jpg	2
9be93f99-2e88-4794-bf81-452f7097d493	c5572ef5-b3a4-4619-a032-f5e2e8233fe1	reviews/c5572ef5-b3a4-4619-a032-f5e2e8233fe1/4889286d-1732-48b4-8196-2c92dbb54306-1772466693879-a0c64a27-1b16-435b-8fb5-2535b362793f.jpg	1
2232b2cf-708b-45f0-99fe-6440d2cfc9e6	1ad8c1f4-937c-42cb-b508-5e2a7f561301	reviews/1ad8c1f4-937c-42cb-b508-5e2a7f561301/4889286d-1732-48b4-8196-2c92dbb54306-1772466770991-72b53814-d508-49d2-baa3-2172df7cf92b.jpg	1
80ad2c9f-9304-48fc-b6b6-b8101d3c4366	1ad8c1f4-937c-42cb-b508-5e2a7f561301	reviews/1ad8c1f4-937c-42cb-b508-5e2a7f561301/4889286d-1732-48b4-8196-2c92dbb54306-1772466770994-dbe751de-501b-4010-b889-41422f2cad95.jpg	2
3b904f89-f659-4e85-8d6d-9affc9a0fd18	fafda201-002a-40ea-a82b-de16b104353c	reviews/fafda201-002a-40ea-a82b-de16b104353c/4889286d-1732-48b4-8196-2c92dbb54306-1772466802785-3b7eeca2-20b3-40f2-9f7c-279956139f3b.jpg	1
2ad4720f-6e4e-41e1-9bb2-4b9048f35d3d	fafda201-002a-40ea-a82b-de16b104353c	reviews/fafda201-002a-40ea-a82b-de16b104353c/4889286d-1732-48b4-8196-2c92dbb54306-1772466802788-18158ed0-8f76-44c5-a8ab-d1b394e649a3.jpg	2
2b11e75a-f741-450e-b92b-95ba82bfab08	0ef08b13-0331-4cbb-bff3-234f212a56b4	reviews/0ef08b13-0331-4cbb-bff3-234f212a56b4/4889286d-1732-48b4-8196-2c92dbb54306-1772466835235-a4046896-343c-4e29-8eb6-f2a0735d2034.jpg	1
\.


--
-- TOC entry 5017 (class 0 OID 16613)
-- Dependencies: 229
-- Data for Name: review_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_likes (id, review_id, user_id, created_at) FROM stdin;
\.


--
-- TOC entry 5015 (class 0 OID 16576)
-- Dependencies: 227
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, location_id, user_id, rating, content, created_at, status) FROM stdin;
0c15a082-ce7a-4af0-8438-3403945bc9bb	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	0		2026-03-02 17:34:34.7618	draft
f9d342cb-e924-40e2-a43e-3ca590286230	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	5	Hồ Gươm nay thành phố đi bộ rồi ạ ❤\r\nNhớ năm 2009-2010 ở đây nhốn nháo lắm, giờ quy hoạch thành phố đi bộ đẹp hẳn ra ❤\r\n+dịch vụ giữ xe miễn phí, nvs miến phí nữa...tuyệt vời 👍	2026-03-02 17:39:15.256175	published
fad641f0-432d-4258-a9e0-20277135dde6	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	4	Tôi đến hồ này để đi dạo buổi sáng. Đây là một nơi đẹp và yên bình để thư giãn và tận hưởng khung cảnh tuyệt đẹp. Hồ khá rộng, có một ngôi đền nằm trên một hòn đảo nhỏ được nối với đảo bằng một cây cầu gỗ xinh xắn. Phí vào cửa đền là 50.000 đồng/người.	2026-03-02 17:51:35.448356	published
447ce407-edc7-4ce4-ac29-219c03df9d83	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	5	Hồ Gươm đẹp quá.	2026-03-02 18:13:05.766606	published
00c27963-9a7a-4ca7-aee6-0dfa061fcb44	6ca1a762-6d41-4072-a0c3-827c77601871	4889286d-1732-48b4-8196-2c92dbb54306	5	Chùa Trấn Quốc được xây dựng từ thế kỷ 6, ban đầu tên là Khai Quốc và được đổi tên thành Trấn Quốc (bảo vệ quốc gia) vào thế kỷ 17. Từng là trung tâm Phật giáo lớn thời Lý - Trần, là biểu tượng văn hóa, tâm linh quan trọng của Thăng Long – Hà Nội.\r\nKiến trúc và cảnh quan hài hòa giữa thiên nhiên, nổi bật với các công trình như Tiền đường, Thượng điện và đặc biệt là Bảo tháp Lục Độ Đài Sen 11 tầng, cao 15m.\r\nCảnh chùa bao quanh bởi cây xanh và mặt nước Hồ Tây, tạo nên vẻ đẹp thơ mộng, thanh tịnh, là nơi lý tưởng để thư giãn và chiêm bái.\r\nChùa Trấn Quốc được công nhận là di tích lịch sử văn hóa cấp quốc gia năm 1962.\r\nLà điểm đến hấp dẫn, thu hút hàng nghìn du khách, Phật tử đến chiêm bái, cầu bình an	2026-03-02 20:35:50.140875	published
25a5a706-e0f3-4287-9d36-018802bc2362	6ca1a762-6d41-4072-a0c3-827c77601871	4889286d-1732-48b4-8196-2c92dbb54306	4	Chùa Trấn Quốc là một trong những ngôi chùa đẹp và cổ kính bậc nhất Hà Nội, mang đến cảm giác bình yên rất đặc trưng ngay giữa lòng thành phố nhộn nhịp. Nằm bên Hồ Tây, chùa sở hữu vị trí vô cùng đắc địa với không gian thoáng đãng, gió mát và mặt nước trong xanh, tạo nên khung cảnh hài hòa, thơ mộng. Kiến trúc chùa nổi bật với tháp Bảo Tâm đỏ rực, các mái chùa cong mềm mại, hài hòa với cây xanh và mặt hồ, rất thích hợp để tham quan, chụp ảnh và tĩnh tâm. Dù đến vào buổi sáng hay chiều muộn, nơi đây đều mang vẻ đẹp trầm mặc, thanh tịnh và giàu giá trị văn hóa, lịch sử.\r\n\r\nTuy nhiên, điểm trừ lớn nhất của chùa Trấn Quốc là lượng du khách quá đông, đặc biệt vào cuối tuần và ngày lễ. Nhiều thời điểm rất khó để cảm nhận trọn vẹn sự yên tĩnh vốn có của chốn tâm linh vì tiếng nói chuyện, chụp ảnh và di chuyển liên tục. Dù vậy, với vẻ đẹp nổi bật và ý nghĩa lâu đời, chùa Trấn Quốc vẫn hoàn toàn xứng đáng 5 sao và là điểm đến nên ghé thăm khi đến Hà Nội.	2026-03-02 20:37:40.404848	published
bc45eae5-06fb-409b-b697-63e9f8cc410a	6ca1a762-6d41-4072-a0c3-827c77601871	4889286d-1732-48b4-8196-2c92dbb54306	5	Chùa Trấn Quốc là một trong những ngôi chùa cổ kính và linh thiêng nhất Hà Nội, tọa lạc trên bán đảo nhỏ bên Hồ Tây. Không gian yên bình, kiến trúc hài hòa giữa tháp bảo, cây xanh và mặt nước tạo cảm giác thanh tịnh, thư thái cho du khách. Chùa mang giá trị lớn về lịch sử, văn hóa và tâm linh, thu hút cả người dân địa phương lẫn khách quốc tế. Đây là điểm đến lý tưởng để tham quan, chiêm bái, chụp ảnh và tìm lại sự an yên giữa nhịp sống đô thị sôi động.	2026-03-02 20:39:39.755122	published
618a0463-afb0-42be-82c3-d77aeb106c15	6ca1a762-6d41-4072-a0c3-827c77601871	4889286d-1732-48b4-8196-2c92dbb54306	5	Chùa Trấn Quốc là một trong những ngôi chùa đẹp và cổ kính bậc nhất Hà Nội, mang đến cảm giác bình yên rất đặc trưng ngay giữa lòng thành phố nhộn nhịp. Nằm bên Hồ Tây, chùa sở hữu vị trí vô cùng đắc địa với không gian thoáng đãng, gió mát và mặt nước trong xanh, tạo nên khung cảnh hài hòa, thơ mộng. Kiến trúc chùa nổi bật với tháp Bảo Tâm đỏ rực, các mái chùa cong mềm mại, hài hòa với cây xanh và mặt hồ, rất thích hợp để tham quan, chụp ảnh và tĩnh tâm. Dù đến vào buổi sáng hay chiều muộn, nơi đây đều mang vẻ đẹp trầm mặc, thanh tịnh và giàu giá trị văn hóa, lịch sử.\r\n\r\nTuy nhiên, điểm trừ lớn nhất của chùa Trấn Quốc là lượng du khách quá đông, đặc biệt vào cuối tuần và ngày lễ. Nhiều thời điểm rất khó để cảm nhận trọn vẹn sự yên tĩnh vốn có của chốn tâm linh vì tiếng nói chuyện, chụp ảnh và di chuyển liên tục. Dù vậy, với vẻ đẹp nổi bật và ý nghĩa lâu đời, chùa Trấn Quốc vẫn hoàn toàn xứng đáng 5 sao và là điểm đến nên ghé thăm khi đến Hà Nội.	2026-03-02 20:40:40.350547	published
3c9ed3c9-6130-455a-bd35-6878b786bd6b	e476ce92-8f33-446a-900b-4ca04e6ff141	4889286d-1732-48b4-8196-2c92dbb54306	5	Hôm nay có dịp về Mê Linh, quê hương của hai bà Trưng Trắc, và Trưng Nhị. Đền rộng rãi, không gian thoáng và có nhiều cây xanh, nhất là hoa hồng - đặc sản của vùng đất nơi đây.\r\n\r\nTừ cổng tam quan, đầu tiên quý khách sẽ tới Đền Trình. Dọc đoạn này có một số hàng quán, giới thiệu sản phẩm OCOP. Sau đó là đến hệ thống các Đền thờ, gồm Hai Bà Trưng, ba mẹ của hai bà, và đền thờ các nữ tướng dưới thời Hai Bà Trưng.\r\n\r\nThời gian mở cửa: tất cả các ngày từ 6h30 đến 18h30. Ngày Lễ, Tết sẽ mở sớm và đóng muộn hơn. Từ Đê tả sông Hồng, đền chỉ cách có ~200m.\r\n\r\nNgày thường thì xe ô tô được vào trong khuôn viên Đền nhưng vẫn sẽ mất phí, xe máy thì hên xui 😄. Còn dịp Lễ hội thì tất cả phải gửi ở bãi xe bên ngoài.	2026-03-02 20:42:48.65676	published
25c2ea45-14a3-4975-bb5f-47bf33cb634c	e476ce92-8f33-446a-900b-4ca04e6ff141	4889286d-1732-48b4-8196-2c92dbb54306	5	Đền rộng, khuôn viên rộng rãi, có tượng Hai Bà Trưng và kiệu bên trong, cũng có các em đến chụp ảnh, mùa hè ở đây chắc mát lắm	2026-03-02 20:43:15.812247	published
e8724ab4-9c52-4eda-b06a-ec43b8aa2345	e476ce92-8f33-446a-900b-4ca04e6ff141	4889286d-1732-48b4-8196-2c92dbb54306	5	Mình đã đến đây, khuôn viên rộng rãi thoáng mát nhiều cây xanh và rất linh thiêng ạ. Mọi người nhớ tới thắp hương hai bà nha	2026-03-02 20:43:37.490708	published
be48d18b-c750-4d21-b3be-658215310b45	c9b58d45-a84c-4024-8a8c-6994903079db	4889286d-1732-48b4-8196-2c92dbb54306	5	dep qua, minh da di va muon trai nghiem lai	2026-03-02 20:43:59.804488	published
9507ae56-253e-4dff-856f-1f12d4fca62e	b6b3878a-61ae-464e-8a00-880c9b7df23a	4889286d-1732-48b4-8196-2c92dbb54306	5	Di Tích Tâm Linh - Chùa Hương ngày cuối năm khá vắng, hợp với bạn nào ko quá thích ồn ào 😅\r\nĐỡ phải chen chúc 😅\r\nNói chung là nơi đây rất yên bình, nếu các bạn lên Động Nam Thiên thì lên đi cáp treo nhé chứ leo bộ lên ấy là ko thở nổi đâu...gần 2km dốc đứng lên núi, có bệnh nền như: huyết áp, tim mạch ..vv..vv... Tuyệt đối ko đc leo bộ lên nhé 🙏😅	2026-03-02 20:45:20.86314	published
74844894-2aaa-4fb3-beb0-59602a730acd	b6b3878a-61ae-464e-8a00-880c9b7df23a	4889286d-1732-48b4-8196-2c92dbb54306	5	Mỗi năm lại thêm thay đổi. Thay đổi tốt hơn nha!!!\r\nDịch vụ tốt hơn, an toàn hơn.\r\nƯớc gì có dòng sông trong và nhiều rong ngày xưa cách đây 25 năm 🤩🤩🤩	2026-03-02 20:45:45.623756	published
031a35d4-f178-451d-a8c9-0f8311b7a80e	b6b3878a-61ae-464e-8a00-880c9b7df23a	4889286d-1732-48b4-8196-2c92dbb54306	5	Được đi trên chiếc xuống ngắm cảnh sông nước núi non\r\n\r\nChùa cổ thanh tịnh nơi gìn giữ nét văn hoá dân tộc	2026-03-02 20:46:10.895658	published
b14bc572-f6a7-4429-8e8c-3e37d3bfed47	227b3fd9-af71-4514-b798-8ac1dc941554	4889286d-1732-48b4-8196-2c92dbb54306	4	Ngôi chùa cổ nằm dưới chân núi Sài Sơn. Toàn bộ không gian khu di tích Chùa Thầy bao gồm Chùa Cả, thủy đình ở hồ Long Trì, các đền am thờ trên núi Sài Sơn, hang Cắc Cớ và một số đền chùa nhỏ xung quanh.\r\n\r\nDi chuyển từ trung tâm Hà Nội rất dễ dàng, chỉ cần đi dọc theo cao tốc Hòa Lạc tầm 15 km thì sẽ thấy biển chỉ dẫn đường vào chùa. Khu vực xung quanh chùa đông đúc cư dân, hàng quán nên không sợ đi chơi bị đói đâu nhé. Vé vào khu di tích là 10k/người. Có khu vực bãi đỗ xe.\r\n\r\nKiến trúc chùa đẹp. Mình đi vào đúng ngày khá đông các bạn đến mặc áo dài chụp ảnh nên không cảm nhận hết được không gian linh thiêng, cổ kính. Những ai đủ sức khỏe có thể leo lên các đền thờ trên núi Sài Sơn, sau đó vào hang Cắc Cớ. Dọc đường lên sẽ có nhiều người bán hàng rong, nếu muốn thì có thể mua vài gói bánh kẹo để đặt vào ban thờ, không mua hương thẻ vì ban quản lý đã đốt sẵn hương vòng ở các ban thờ rồi.\r\n\r\nHang Cắc Cớ rất tối, nhưng phần cho khách tham quan không sâu lắm đâu. Đừng nghe mấy cô ở đấy bảo dẫn đường vào hang cho. Các bạn có thể thuê đèn của một ông ở ngay cửa hang, 5k một lượt, rồi tự vào bên trong. Độ sáng của đèn flash điện thoại không đủ tốt để quan sát cảnh trong hang.	2026-03-02 20:48:18.293507	published
70af8551-59fc-475f-af29-1a5e63e19507	227b3fd9-af71-4514-b798-8ac1dc941554	4889286d-1732-48b4-8196-2c92dbb54306	4	Kiến trúc chùa đẹp. Nhiều góc thơ. Đi lên trên hơi mệt không dành cho người bị đau khớp gối 😅. Được cái lên thì mát mỗi tội là có nhiều người đi loanh quanh giới thiệu rồi chèo kéo mua bùa vòng cầu may 50k/ cái dù miệng nói là "chị mời em" nhưng cầm cái là lật thành "chị mời em mua" :)))\r\nVì không rõ chỗ gửi xe nên tôi mất 10k gửi xe một cô bán nước dưới cổng lên chùa. Phí vào chùa tham quan thì 10k. Đi hang động thì có mấy người chèo kéo kêu là trong hang đang không có điện nên muốn vào thì 5k đèn hoặc thuê người dắt vào :))\r\nNói chung danh lam thắng cảnh thì đẹp mà bị nhiều người dí theo chèo kéo thì mất vui 🤦🏻‍♀️	2026-03-02 20:48:37.360877	published
6ebf4a63-a59b-4f31-9ae8-281580a8ee7f	227b3fd9-af71-4514-b798-8ac1dc941554	4889286d-1732-48b4-8196-2c92dbb54306	5	Chùa cao trong quần thể di tích chùa thấy  hà nội\r\nChùa có không gian cổ kính\r\nLà nơi hành hương lễ phật của phật tử gần xa	2026-03-02 20:48:55.589875	published
a41064b6-861c-4d30-935d-ea11976f5a57	093a94c5-f7b7-4a99-94d2-74ed61d4786e	4889286d-1732-48b4-8196-2c92dbb54306	5	Hồ Tây là điểm thư giãn giữa lòng Hà Nội, nước rộng, gió mát và cảnh đẹp. Đường đi bộ ven hồ phù hợp cho tập thể dục, ngắm hoàng hôn hoặc cà phê. Không khí yên bình, nhiều quán gần đó. Đây là nơi lý tưởng để giải tỏa căng thẳng chụp ảnh.	2026-03-02 20:50:54.177878	published
678e1d2e-50f5-46ab-bdc5-451695b406c1	093a94c5-f7b7-4a99-94d2-74ed61d4786e	4889286d-1732-48b4-8196-2c92dbb54306	5	Hồ Tây đẹp chấn động. Chill kinh khủng. Chiều chiều mát mát dạo 1 vòng hồ nó đãa. Nhưng sập tối thì lạnh nha =))) Lạnh run luôn	2026-03-02 20:51:15.423113	published
2aaf4b40-d2e4-44f4-9c21-a790d5da9151	093a94c5-f7b7-4a99-94d2-74ed61d4786e	4889286d-1732-48b4-8196-2c92dbb54306	5	Hồ Tây rất đẹp, Chill ngồi cafe lúc rảnh thư giãn lắm.\r\nTối đi làm về ra đạp xe tận 2 vòng hồ 🤣\r\nMọi đến Hà Nội nhớ đến Hồ Tây nhé, một địa điểm không thể bỏ qua khi đến Hà Nội …	2026-03-02 20:51:36.453371	published
2361487e-8c8f-4cc3-8c54-f91127aeb6d4	57fc3023-9402-48eb-b128-e3eb44cf4273	4889286d-1732-48b4-8196-2c92dbb54306	5	Sau hơn 20 năm mới quay lại sở thú HN, có một cái gì đó rất hoài niệm về tuổi thơ đc bố mẹ cho đi chơi. Giá vé hiện tại ko quá cao, chỉ có 50k/ng lớn. Các khu động vật vẫn như thế, có chăng mọi thứ đã hơi cũ mang nét đẹp hoài cổ của thời gian. Khu vực thú dữ như hổ, sư tử đã đc xây chuồng mới cao to và sạch sẽ hơn. Chuồng voi đã ko còn cảnh voi bị xích chân nữa, thay vào đó là hàng rào điện\r\n\r\nVườn thú nhiều cây xanh và có hồ nước nên đi bộ ko khí rất trong lành, hàng quán ăn vặt cũng nhiều nên khỏi phải lo đói hay khát nước	2026-03-02 20:53:12.08433	published
d9f0c791-0fc8-4186-bf2c-0f9c856d65d8	57fc3023-9402-48eb-b128-e3eb44cf4273	4889286d-1732-48b4-8196-2c92dbb54306	5	Hôm mình đi thứ 3 trong tuần, sở thú hơi vắng khách nên khá thoải mái. Không gian xanh mướt, không khí trong lành, nhiều cây cối, hoa tươi, ao hồ, vấn đề vệ sinh môi trường tốt. Mấy em hổ, cá sấu, sư tử khá lười, toàn thấy ngủ, trái ngược với em voi rất chịu khó catwalk, tương tác với mọi người, service 10 đỉm. Còn mấy em hươu, cừu, ngựa sống hơi vật chất, thấy có đồ ăn mới chịu tương tác, còn không có thì quay đít bỏ đi vào trong, rất bùn😭. Còn mấy chuồng khỉ các bé ăn uống nhiều nên hơi bốc mùi 1 tí. Mong sở thú làm ăn khấm khá để nuôi các bé càng béo ú vàcó thêm nhìu thú hơn nữa nhen😻	2026-03-02 20:53:33.688437	published
a1cbae7c-ff69-458b-a487-83d72c555a14	57fc3023-9402-48eb-b128-e3eb44cf4273	4889286d-1732-48b4-8196-2c92dbb54306	4	Vườn thú có giá vé 30k cho người dưới 1,3m và 50k cho người trên 1,3m, nhiều trò chơi tính phí với vé 30k/trò, vườn thú chưa đa dạng thú, thiếu nhiều loài ví dụ hươu cao cổ, đười ươi, khỉ đột,…	2026-03-02 20:53:51.085968	published
ad4b8c48-860f-4453-aa03-5b2116021ef8	5c6160c4-0d3c-4515-b48b-f928294b1800	4889286d-1732-48b4-8196-2c92dbb54306	4	Khu vực dành cho các chị em chụp ảnh nhiều cảnh\r\nCác mức giá vé theo bên du lịch họ đã quy định:\r\nTrại 250k (không được ở qua đêm)\r\nXe 50k (đưa tới chỗ này chỗ kia)\r\nTrượt 50k\r\nVé vào cổng 70 (người lớn tuổi 50, sinh viên trẻ con đều đc giảm)	2026-03-02 20:57:49.258935	published
1564a76c-7671-4a3f-8984-3798147f5114	5c6160c4-0d3c-4515-b48b-f928294b1800	4889286d-1732-48b4-8196-2c92dbb54306	5	Không gian rộng rãi, thoáng, hợp đi picnic cuối tuần cùng gia đình, bạn bè, trẻ con đi chơi.\r\nBên trong có khu cà phê, khu vui chơi, nhiều góc chụp ảnh sống ảo, mấy vườn hoa lên hình cũng xinh.\r\nDạo này khu này được sửa sang và mở rộng hơn trước, có thêm khu nuôi động vật: cừu, dê, thỏ…\r\n\r\nVé vào cửa người lớn: 70.000đ/ người	2026-03-02 20:58:11.902351	published
db161df1-694b-492b-8ed3-5b24bf143a49	07c80f91-6fb0-4dc0-94d3-f70b0000528c	4889286d-1732-48b4-8196-2c92dbb54306	5	Công trình bắt đầu xây dựng năm 1884 và hoàn thành năm 1887 dưới thời Pháp thuộc, là một trong những công trình Công giáo đầu tiên do Pháp xây tại Hà Nội. Nhà thờ được xây trên nền của chùa Báo Thiên, một trung tâm Phật giáo lớn từ thời Lý – Trần. Nhà thờ được xây theo phong cách Gothic Revival (Tân Gothic), giống như Nhà thờ Đức Bà Paris.	2026-03-02 22:22:49.897476	published
a3018d8e-e727-40ba-b3b0-6ecab88a1ee5	5c6160c4-0d3c-4515-b48b-f928294b1800	4889286d-1732-48b4-8196-2c92dbb54306	4	Bãi đá sông Hồng ở đâu? Bãi đá sông Hồng nằm ở cuối ngõ 264 Âu Cơ, Tây Hồ, Hà Nội, cách trung tâm hành phố khoảng 30 phút lái xe. Tại đây có một vườn hoa rộng lớn với đủ các sắc hoa nở rộ làm rực cả một khung trời. Khoác lên mình vẻ đẹp nhẹ nhàng, bình yên, nơi đây trở thành địa điểm vui chơi cuối tuần ở Hà Nội hấp dẫn thu hút du khách tìm đến tận hưởng không khí trong lành, không gian mát mẻ và chụp hình “sống ảo”.\r\n\r\nHiện nay giá vé vào bãi đá sông Hồng là miễn phí. Nếu du khách có nhu cầu tham quan vườn hoa thì mất phí khoảng 70.000 VNĐ/người lớn và 40.000 VNĐ/trẻ em. Tuy nhiêu, giá vé này chỉ mang tính tham khảo, tùy thời điểm tham quan, giá có thể thay đổi.	2026-03-02 20:58:28.536671	published
5393cc14-e9d8-4e12-9f0b-9b87b38df4d2	429f1da2-c572-400d-8e4e-9ecbd096cc08	4889286d-1732-48b4-8196-2c92dbb54306	5	hoa nở đẹp lắm nên đến checkin nha mọi người	2026-03-02 21:00:06.520293	published
f3908ad1-de86-42f8-b028-e45a9eec99f2	429f1da2-c572-400d-8e4e-9ecbd096cc08	4889286d-1732-48b4-8196-2c92dbb54306	4	nên đi vào dịp cuối năm vào lúc hoa nở đẹp nhất	2026-03-02 21:00:35.82073	published
63cbf572-cf6d-420c-a1f4-692f536de385	429f1da2-c572-400d-8e4e-9ecbd096cc08	4889286d-1732-48b4-8196-2c92dbb54306	5	đây là địa điểm hot để checkin vào dịp tết	2026-03-02 21:01:12.923478	published
d8259ff7-71ff-43ea-a0fd-899eee90ab1e	bb085c14-2cf1-45fb-a564-42eed70da09b	4889286d-1732-48b4-8196-2c92dbb54306	5	Trekking tại Hàm Lợn là hành trình chinh phục nóc nhà Thủ đô đầy thú vị. Cảm giác vượt qua những con dốc vắt vẻo, băng qua rừng thông xanh ngát và hít hà mùi nhựa thông thơm nồng thật sự sảng khoái. Khi chạm đỉnh, toàn cảnh hồ núi nên thơ thu vào tầm mắt, xua tan mọi mệt mỏi. Đây là trải nghiệm tuyệt vời để rèn luyện sức bền và đổi gió cùng bạn bè vào cuối tuần.	2026-03-02 21:02:27.987511	published
e9d151b9-f3b9-4b05-8d92-0caec1ef1e1e	bb085c14-2cf1-45fb-a564-42eed70da09b	4889286d-1732-48b4-8196-2c92dbb54306	5	Rừng thông rất đẹp nhưng nhiều người cắm trại ý thức quá kém. Đến ăn uống đốt lửa, xả rác bừa bãi khắp nơi. Có mỗi việc gom rác mang đi khó đến thế sao? Rồi tiếng ồn thì kinh khủng, từ đầu này sang đầu kia chỗ nào cũng có tiếng hát karaoke đinh tai nhức óc, không biết là mình đang làm ảnh hưởng đến người khác hoặc biết nhưng không có liêm sỉ nên mặc kệ.	2026-03-02 21:02:44.558322	published
b4d447e9-c828-4527-97e1-7e302871281c	bb085c14-2cf1-45fb-a564-42eed70da09b	4889286d-1732-48b4-8196-2c92dbb54306	5	Nước hồ rất trong và mát vì có một con suối nhỏ chảy ra. Nên hỏi trước các khu camping quanh đó xem hồ cạn hay đầy, nhưng dù sao thì cả mùa cạn hay mùa đầy cũng vẫn nên đến. 10/10.	2026-03-02 21:02:59.303544	published
5479c290-2452-4b7c-8487-9d4def6e7e10	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	4889286d-1732-48b4-8196-2c92dbb54306	5	Nhờ cảnh quan rộng rãi, còn nguyên nét hoang sơ, đồi Bù còn là điểm chụp ảnh lý tưởng. Tiết trời mát mẻ quanh năm nhưng đồi Bù thu hút nhiều bạn trẻ check-in nhất vẫn là những tháng cuối năm khi mùa cỏ lau nở.	2026-03-02 21:04:19.351932	published
159f32c0-8638-4c06-afc1-dca723657fd4	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	4889286d-1732-48b4-8196-2c92dbb54306	4	Tuyệt vời, khuyến cáo bạn nào say xe nên uống thuốc trước khi chơi. Nên đi tầm tháng 11, 12 ngắm đồi cỏ lau và ruộng lúa bên dưới siêu đẹp	2026-03-02 21:04:39.119246	published
e95828f1-3576-4947-812d-9c0fbb660075	b6cb31e8-ceff-416a-82f0-2dc36f2520a8	4889286d-1732-48b4-8196-2c92dbb54306	4	Đường lên hơi khó để đi xe máy 😂 còn cảnh trên đỉnh thì tuyệt vời …	2026-03-02 21:04:55.830929	published
e5027182-dc46-4e50-81e1-d0d3bdddbebd	c9b58d45-a84c-4024-8a8c-6994903079db	4889286d-1732-48b4-8196-2c92dbb54306	5	Vườn quốc gia Ba Vì nổi tiếng bởi có đền mẫu Thượng Thiên và đền thờ Bác Hồ cao nhất trên đỉnh. Vào khoảng tháng 10-11, vườn quốc gia thu hút hàng nghìn khách du lịch đến đây bởi có hoa dã quỳ nở rộ, trải dài đường đi và các triền núi tạo nên những thảm hoa vàng đẹp mắt. Các bạn trẻ lên Ba Vì để săn mây, để check in cùng hoa dã quỳ rất đông. Các gia đình thường đến đây vào cuối tuần để cùng các con cắm trại ở đồi thông rồi cùng nướng đồ ăn, tận hưởng không khí mùa thu mát mẻ và sự ấm cúng, quây quần bên nhau.\r\nTôi thực sự thích cái không khí và quang cảnh ở đây, khuyến khích mọi người nên đến để trải nghiệm. Giá vé vào cổng 60k/người lớn, vé gửi xe ô tô 25k/cái.	2026-03-02 21:06:14.17119	published
e7b19d90-98e2-4609-ae64-93bcf8cde9fd	c9b58d45-a84c-4024-8a8c-6994903079db	4889286d-1732-48b4-8196-2c92dbb54306	5	Vườn Quốc Gia Ba Vì là một trong những nơi đáng đến nhất quanh Hà Nội. Không khí mát mẻ, rừng xanh mướt và đường lên đỉnh rất dễ đi. Mình thích nhất khu nhà thờ cổ và đỉnh Tản Viên – vừa linh thiêng vừa có view rất đẹp. Đây thật sự là điểm đến tuyệt vời để thư giãn cuối tuần, tránh xa ồn ào thành phố. Rất khuyến khích mọi người tới trải nghiệm!	2026-03-02 21:06:30.725038	published
cf8b1a5c-9692-48ea-a1e7-580565ed8119	c9b58d45-a84c-4024-8a8c-6994903079db	4889286d-1732-48b4-8196-2c92dbb54306	3	Rất đông\r\nVé vào cổng 60k thì phải, dịch vụ ở trong free, k mất thêm tiền gửi xe\r\nĐi vào mùa hoa dã quỳ nên đông rất đông, ai cũng bẻ hoa nên nhìn ý thức hơi chán\r\nView đồi núi đẹp	2026-03-02 21:06:53.089968	published
367d563d-1972-431b-a68d-abc0fdb7adcd	837efbb5-f618-4118-9868-6d7ff86588ab	4889286d-1732-48b4-8196-2c92dbb54306	4	Ngày cuối tuần đông. Gửi xe 5k, phải xếp hàng mua vé hơi lâu 40k/người. Nhà về sinh khu vực trong nhà sạch sẽ, bên ngoài có 1 cái wc mà mình thấy có vẻ k sạch lắm. Tham quan bên ngoài thì có nhà tranh vách nứa, nhà vách đất, nhà rông, nhà sàn. Bên trong nhà thì có 1 số tư liệu liên quan đến 54 dân tộc VN nhưng mình thấy ít k nhiều như bảo tàng QN. Có 1 khu diễn múa rối nước bán vé riêng nữa nhưng mình k vào xem. Ncl đi tham quan cho biết thôi ạ	2026-03-02 21:08:22.762985	published
315ac416-248f-442f-9af9-d133ae3d2b3d	837efbb5-f618-4118-9868-6d7ff86588ab	4889286d-1732-48b4-8196-2c92dbb54306	5	Em với bạn đã đi vào thứ 3 tuần trước. Vào cổng là mua vé và dùng vé đó để soát vào bảo tàng ở ngay cổng luôn ạ. Các anh chị và các bác hướng dẫn rất nhiệt tình luôn ạ.\r\n- Về phía bên trong nhà sẽ có 2 tầng, mn hãy lựa chọn cách đi theo tập gấp sơ đồ để tránh bỏ sót khu vực nha\r\n- Phía ngoài trưng bày mô phỏng không gian sinh sống của 1 vài dân tộc từ miền Bắc vào miền nam rất đẹp và rộng rãi luôn ạ. Cảm giác đi du lịch được rất nhiều nơi và khám phá văn hóa của nhiều dân tộc❤💚.\r\nHãy đi sớm và khám phá thật kĩ từ phía trong ra ngoài nha mn. Do bảo tàng khá rộng nên sẽ mất khá nhiều thời gian để khám phá đó ạ.\r\nLưu ý 1 chút là mùa này khá nhiều nàng thơ, quý bà, quý cô, mợ chụp ảnh nên sẽ khá đông ở phía ngoài nên nhiều lúc hơi bất tiện 1 chút❤💚	2026-03-02 21:08:42.391433	published
2baa19a4-8943-4a47-87d9-57a0f255218b	07c80f91-6fb0-4dc0-94d3-f70b0000528c	4889286d-1732-48b4-8196-2c92dbb54306	5	Nhà thờ Lớn Hà Nội vào mùa thu thật sự rất đẹp và thơ mộng. Không khí mát mẻ, ánh nắng nhẹ nhàng khiến khung cảnh thêm phần lãng mạn. Đến đây buổi sáng, bạn có thể thưởng thức món xôi cốm ngay gần nhà thờ, giá khoảng 50k cho 2 lạng, dẻo thơm và rất đáng thử.	2026-03-02 22:24:24.813387	published
8b10cf22-0a61-4cd0-a7a3-42db59c8b23a	837efbb5-f618-4118-9868-6d7ff86588ab	4889286d-1732-48b4-8196-2c92dbb54306	1	Bảo tàng đẹp nhưng văn hoá của người dân đi chụp ảnh rất kém duyên, quát tháo đuổi khách tham quan để chiếm chỗ chụp ảnh. Tôi tự hỏi đây là studio nhiếp ảnh hay bảo tàng? Cơ quan nên chấn chỉnh lại để không bị du khách (kể cả quốc tế) đánh giá thấp người Việt Nam.\r\n\r\nThe museum is beautiful, but the behavior of the people taking photos is very rude; they yell at and chase away visitors to take up photo spots. I wonder if this is a photography studio or a museum? The authorities should rectify this so that tourists (including international visitors) don't have a low opinion of Vietnamese people	2026-03-02 21:09:04.648083	published
a5b33474-eda8-43fc-92e1-f9fea0fd1bc9	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	5	Hồ Hoàn Kiếm nằm giữa lòng Hà Nội như một viên ngọc xanh, mang vẻ đẹp vừa cổ kính vừa thơ mộng. Mặt hồ phẳng lặng soi bóng những hàng cây rợp mát, tháp Rùa nhỏ bé nhưng uy nghiêm đứng giữa, gợi nhớ bao truyền thuyết linh thiêng. Sáng sớm, làn sương mờ giăng nhẹ khiến cảnh hồ thêm huyền ảo; chiều xuống, ánh hoàng hôn nhuộm vàng mặt nước, tạo nên bức tranh yên bình. Dạo quanh hồ, người ta cảm nhận nhịp sống chậm rãi, hòa quyện giữa thiên nhiên và lịch sử, khiến Hồ Hoàn Kiếm trở thành biểu tượng đẹp đẽ của Thủ đô.	2026-03-02 21:09:12.234625	published
dd7eeba7-9976-4eab-8930-c23f1a1c3922	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	0		2026-03-02 21:10:33.244432	draft
6943d3fc-c594-4013-b114-b83d481a9dde	1184dc79-a111-4a8a-8b31-dbfa6f379de1	4889286d-1732-48b4-8196-2c92dbb54306	4	Mình ghé qua bảo tàng vào một ngày trong tuần, buổi sáng gần trưa. Hôm đó đúng ngày có 2 trường dẫn học sinh tới tham quan nên bảo tàng khá đông, có tiếng trẻ nô đùa nhưng không đến mức quá ồn ào.\r\n\r\nKiến trúc bên ngoài của bảo tàng rất đẹp, hôm đó mà không nắng quá thì mình cũng đã tranh thủ chụp hình bên ngoài rồi.\r\n\r\nHiện vật trưng bày bên trong được bảo quản tốt, nhưng số lượng thì không nhiều. Trước đây khi mình ghé bảo tàng cỡ 15 năm trước, tuổi còn nhỏ, thì mình thấy ấn tượng và thích thú, nhưng khi lớn lên rồi thì lại cảm giác chưa đủ sâu.\r\n\r\nHi vọng nếu lúc nào có điều kiện thì bảo tàng có thể revise lại các bảng biển, vì hiện tại lỗi sai chính tả tiếng Anh còn tương đối nhiều.	2026-03-02 21:10:35.019693	published
b59a4f93-fc8d-4f9f-a653-c6d5b6b75f3e	1184dc79-a111-4a8a-8b31-dbfa6f379de1	4889286d-1732-48b4-8196-2c92dbb54306	5	Số 1 Đường Tràng Tiền, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Hà Nội\r\n- Số 216 Đường Trần Quang Khải, Phường Tràng Tiền, Quận Hoàn Kiếm, Hà Nội\r\nThời gian mở cửa:\r\n- Buổi sáng: Từ 8 giờ sáng đến 12 giờ trưa\r\n- Buổi chiều: Từ 13 giờ 30 chiều đến 17 giờ chiều\r\n(Mở cửa tất cả các ngày trong tuần, trừ ngày thứ Hai đầu tiên hàng tháng)\r\n\r\nGiá vé tham khảo:\r\n- Người lớn: 40.000 VNĐ/lượt/người\r\n- Sinh viên các trường Đại học, Cao đẳng, Trung cấp, dạy nghề: 20.000 VNĐ/lượt/người\r\n- Học sinh: 10.000 VNĐ/lượt/người\r\n- Miễn phí vé với trẻ em dưới 6 tuổi, người khuyết tật đặc biệt nặng theo quy định hiện hành.\r\n- Chính sách giảm giá vé: Giảm 50% mức phí tham quan cho các đối tượng được hưởng chính sách ưu đãi, người cao tuổi, người khuyết tật nặng theo quy định hiện hành.\r\nKhoản phí khác:\r\n- Chụp ảnh: 15.000 VNĐ/máy\r\n- Quay phim: 30.000 VNĐ/máy	2026-03-02 21:10:56.023126	published
35015eb3-3044-473b-a5c8-ea13c0f9ca7d	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	5	Hồ Hoàn Kiếm hay còn gọi là Hồ Gươm tọa lạc ngay trung tâm thủ đô Hà Nội và được bao quanh bởi 3 con phố Hàng Khay – Lê Thái Tổ – Đinh Tiên Hoàng.\n\nDo nằm ở vị trí đắc địa, là nơi kết nối giữa khu phố cổ như Hàng Ngang, Hàng Đào, Cầu Gỗ, Lương Văn Can... với khu phố Tây là Nhà Thờ, Tràng Thi, Hàng Bài, Tràng Tiền, Hàng Khay... nên Hồ Hoàn Kiếm thu hút nhiều du khách trong và ngoài nước đến tham quan, khám phá trong chuyến du lịch Hà Nội.	2026-03-02 21:11:01.28438	published
a786b8fa-f451-401c-a0b3-5c08899dd18a	1184dc79-a111-4a8a-8b31-dbfa6f379de1	4889286d-1732-48b4-8196-2c92dbb54306	5	🏛 Bảo tàng Lịch sử Quốc gia – Nơi lưu giữ linh hồn nghìn năm của dân tộc Việt\r\n\r\nGiữa trung tâm Thủ đô Hà Nội, Bảo tàng Lịch sử Quốc gia như một “cuốn sử sống” kể lại hành trình dựng nước và giữ nước suốt hàng ngàn năm của dân tộc Việt Nam.\r\nTọa lạc tại số 1 Tràng Tiền, quận Hoàn Kiếm, công trình không chỉ nổi bật bởi kiến trúc độc đáo mà còn bởi kho tàng hiện vật quý giá trải dài từ thời tiền sử đến thời đại Hồ Chí Minh.\r\n\r\nĐược xây dựng từ năm 1926 – 1932 dưới thời Pháp thuộc, tòa nhà ban đầu là Bảo tàng Louis Finot, với phong cách kiến trúc kết hợp hài hòa giữa Pháp cổ điển và Á Đông truyền thống. Mái ngói cong, cửa gỗ, họa tiết trang trí lấy cảm hứng từ hoa sen, rồng phượng... tạo nên nét vừa sang trọng, vừa gần gũi với văn hóa Việt.	2026-03-02 21:11:25.951674	published
30f05c76-0564-4d2a-aed2-8060a18e1369	ecabc48b-5c72-4388-a022-d57fd88856d4	4889286d-1732-48b4-8196-2c92dbb54306	5	Bảo tàng có nhiều khu trưng bày theo từng thời kỳ và các chất liệu khác nhau, có khu dân gian ứng dụng rất đẹp và độc đáo. Bên cạnh đó còn có một phòng chiếu phim tài liệu nho nhỏ để giới thiệu tác phẩm tới người xem. Một số dịp mà bảo tàng sẽ miễn phí vé vào cửa như hôm mình đi vô tình trúng dịp đó nữa hehe	2026-03-02 21:14:07.591579	published
9dc40a97-4ffc-4476-8ea8-4edd71249581	ecabc48b-5c72-4388-a022-d57fd88856d4	4889286d-1732-48b4-8196-2c92dbb54306	3	Bảo tàng mỹ thuật trưng bày nhiều tác phẩm nghệ thuật xuyên suốt chiều dài lịch sử dân tộc. Bảo tàng chỉ đơn giản là trình bày hiện vật, thậm chí mỗi hiện vật cũng chỉ vài ba dòng thông tin cơ bản. Thiếu tính tương tác với khách tham quan. Nói chung bảo tàng cần nâng cấp hơn để tăng tính trải nghiệm.	2026-03-02 21:14:30.355985	published
c0f34912-db2a-4247-a82c-815f52d21844	ecabc48b-5c72-4388-a022-d57fd88856d4	4889286d-1732-48b4-8196-2c92dbb54306	3	Vé người lớn vào bảo tàng là 40k, có hướng dẫn các cửa vào tham quan tranh ảnh và hiện vận được bảo tàng trưng bày, không gian trầm lặng mát mẻ ít khách tham quan, phù hợp cho tất cả mọi người, tham quan để hiểu biết thêm các giá trị văn hoá nước Việt	2026-03-02 21:14:59.343524	published
032d3992-474c-45b5-8420-d7405555c202	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	4889286d-1732-48b4-8196-2c92dbb54306	5	cũng lâu r mình mới tham quan lại, không gian cơ bản k thay đổi nhiều, khu trưng bày chia thành 4 tầng, chứa nhiều thông tin thú vị, đề cao giá trị người phụ nữ ngày xưa tới thời bình thông qua các phong tục tập quán, nếp sống, hoạt động phong trào,... mình khá ấn tượng khu trưng bày tín ngưỡng thờ Mẫu và Phụ nữ trong lịch sử, ngoài ra cả sự đa sắc của các dân tộc thông qua những tập tục của họ.\r\n\r\nbảo tàng k quá đông vào cuối tuần, khách nước ngoài tới đây tham quan khá nhiều.\r\n\r\ngiá vé 40k/người lớn, 20k cho HS,SV có xuất trình thẻ, nếu có dịp mng có thể ghé thăm bảo tàng	2026-03-02 21:16:34.997595	published
3d4f6c00-eb7f-432a-a4e1-df5fbc4c18ec	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	4889286d-1732-48b4-8196-2c92dbb54306	5	Bảo tàng Phụ nữ Việt Nam tọa lạc tại một trong những con phố đẹp nhất Hà Nội và là điểm đến lý tưởng nếu bạn muốn hiểu rõ về vai trò và tầm quan trọng của phụ nữ Việt Nam trong dòng chảy lịch sử và văn hóa đất nước. Bảo tàng Hà Nội này hiện đang lưu giữ nhiều tài liệu có giá trị được trưng bày một cách khoa học và ấn tượng, kể về câu chuyện của phụ nữ khắp mọi miền đất nước, thể hiện sự đóng góp và hy sinh thầm lặng của họ trong quá khứ, hiện tại và tương lai	2026-03-02 21:16:53.415336	published
d6279bc4-6c28-45e0-b641-5ba834d89848	45c13fc6-2e5f-4b48-9fd7-771c4cbf97a1	4889286d-1732-48b4-8196-2c92dbb54306	4	Không hiểu sao nhưng mà nhìn mấy bộ trang phục các thứ thấy hơi khó thở một chút, cứ sợ sợ kiểu gì ý	2026-03-02 21:17:19.322234	published
6cd1ef22-db6e-4156-952d-f34ad0831138	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	4889286d-1732-48b4-8196-2c92dbb54306	5	Phủ Tây Hồ gửi xe miễn phí đến hết mùng 6 tết. Chuẩn bị một tâm hồn thâth đẹp để đi bộ 1.3km/ chiều nhé. Hàng bán bánh tôm, hàng bán đồ lễ, các cụ ngồi viết chữ ngồi dọc trục đường vào phủ. Cá, ốc, trạch phóng sinh 100k/ chậu nhỏ nhỏ. Chim phóng sinh 130k/ 5 con..	2026-03-02 21:21:47.03427	published
1af05313-9106-4094-a0e5-6468559f1709	938aeaf3-a47c-4a1f-8199-1c18f20c0755	4889286d-1732-48b4-8196-2c92dbb54306	5	Bảo tàng rộng đẹp, nhiều tranh và hiện vật lịch sử	2026-03-02 21:25:16.415608	published
416afdf2-cf64-4bc0-980d-3624417dfccc	938aeaf3-a47c-4a1f-8199-1c18f20c0755	4889286d-1732-48b4-8196-2c92dbb54306	5	Đánh 1 sao cho nhiều người đọc hơn, chứ tui chấm 5 sao	2026-03-02 21:25:52.052097	published
8b46d47b-1068-4522-8c3f-18e1a02fb220	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	5	Không gian liền kề  vườn cây nhỏ trên vỉa hè . Sáng sớm tầm 6 giờ 30 rất thú vị nếu trời không mưa. Có đền trên đảo trong hồ  và cầu dẫn vào đền. Nhà hát múa rối Thăng Long gần sát bên hồ . Các quán ăn uống liền kề . Các cửa hàng mua sắm ngay các  phố gần hồ .	2026-03-02 21:26:08.092246	published
a57ae723-b7c2-46d6-a48f-8b37fde5b81f	938aeaf3-a47c-4a1f-8199-1c18f20c0755	4889286d-1732-48b4-8196-2c92dbb54306	4	lịch sự, vui vẻ	2026-03-02 21:26:32.935103	published
73b55c16-19e1-4968-ba33-9ed858d2c3a7	e98e3637-02fd-4007-a86f-7a8cbedae14d	4889286d-1732-48b4-8196-2c92dbb54306	5	Mệnh danh Hồ Hoàn Kiếm là "trái tim của thủ đô Hà Nội" vì vị trí trung tâm, giá trị văn hóa, lịch sử sâu sắc và cảnh quan thơ mộng, là biểu tượng của thủ đô ngàn năm văn hiến. Nơi đây không chỉ thu hút du khách mà còn là không gian xanh mát, bình yên giữa lòng thành phố nhộn nhịp, đồng thời gắn liền với nhiều câu chuyện lịch sử, truyền thuyết quan trọng	2026-03-02 21:30:38.94493	published
7cb31d8e-9f2a-4619-a4c6-3a206e6b1cf1	3ba31f52-39ea-4ca5-b966-20026f40560b	4889286d-1732-48b4-8196-2c92dbb54306	5	Một nơi tuyệt vời, tâm linh linh thiêng. Mang đến cho mỗi người đến nơi này sự thanh thản, cầu nguyện cho những điều tốt đẹp. Có sẵn các hàng mua hoa quả lễ hương ở đường vào nhưng mình nên tự chuẩn bị trước ở nhà thì tốt hơn.	2026-03-02 21:32:00.144504	published
cf67044a-ed03-4704-a9c2-51844b1fbeab	3ba31f52-39ea-4ca5-b966-20026f40560b	4889286d-1732-48b4-8196-2c92dbb54306	5	Một nơi rất nên đến khi tới Hà Nội.Vị trí ngay bên hồ Tây (Có một hàng bán kẹo đậu phộng rất ngon bên trong khuôn viên, có thể mua về làm quà, người bán nhận gửi giúp hàng theo giá các dịch vụ vận chuyển).	2026-03-02 21:32:41.3709	published
1e2c96be-6fdd-497d-9449-d420a50b2be7	af5ccb47-576b-45c8-81dc-23755eb499b2	4889286d-1732-48b4-8196-2c92dbb54306	5	đẹp, cổ điển	2026-03-02 21:36:57.199461	published
b7e54d99-c1bf-4f36-9d7e-02264f60e16e	8a113806-2f0c-43d3-afd1-5f17fe33fa68	4889286d-1732-48b4-8196-2c92dbb54306	5	Một nơi rất nên đến khi tới Hà Nội.Vị trí ngay bên hồ Tây (Có một hàng bán kẹo đậu phộng rất ngon bên trong khuôn viên, có thể mua về làm quà, người bán nhận gửi giúp hàng theo giá các dịch vụ vận chuyển).Lăng chủ tịch Hồ Chí Minh, vị lãnh tụ vĩ đại của dân tộc Việt Nam, ánh dương soi đường của giai cấp công nhân và vô sản thế giới; được ví như trái tim của đất nước Việt Nam, tọa lạc trên Quảng trường Ba Đình lịch sử. Đây là nơi mà mỗi người con đất Việt, nếu có cơ hội nên đến một lần trong đời, để thể hiện lòng thành kính trước vị Cha già dân tộc, đã hy sinh cả cuộc đời mình cho sự nghiệp đấu tranh giải phóng để giành độc lập và họa nên hình hài đất nước. Nghi lễ thượng cờ và hạ cờ được thực hiện mỗi ngày trong không khí trang nghiêm. Cảm giác hòa mình vào dòng người vào mỗi sáng, trong tiếng Quốc ca cất vang và nhìn Quốc kỳ được kéo lên tung bay trong ánh bình minh rực rỡ là trải nghiệm khó quên tại địa điểm lịch sử và thiêng liêng này.	2026-03-02 21:37:27.226094	published
78353017-92f8-4a0d-af12-7fba35454ad5	af5ccb47-576b-45c8-81dc-23755eb499b2	4889286d-1732-48b4-8196-2c92dbb54306	5	Trải nghiệm tuyệt vời, rất rất đỉnh	2026-03-02 21:37:52.468018	published
de9fa9b1-47a3-451b-bfb5-d6ed269bcb41	8a113806-2f0c-43d3-afd1-5f17fe33fa68	4889286d-1732-48b4-8196-2c92dbb54306	5	Nơi thiêng liêng khi đến Hà Nội phải ghé qua thăm Bác, người lãnh tụ vĩ đại nước của đất nước. Luôn biết ơn bác vì đã cho bản thân cuộc sống thoải mái và hạnh phúc như ngày hôm nay\r\nSáng 6h30 mình được tham dự lễ thượng cờ, dù trời có mưa lâm râm nhẹ nhưng vẫn diễn ra hết sức trang trọng và nghiêm túc. Cảm giác lần đầu đc chứng kiến và tham dự rất xúc động và bồi hồi\r\nSau đó 8h thì được vào thăm lăng Bác, dù rất đông người đứng đợi nhưng ko ai kêu ca hay chen lấn, rất nôn nóng để vào gặp Bác. Thật sự rất tuyệt vời luôn	2026-03-02 21:38:21.308387	published
176f3245-9a5e-4e8b-9ded-915d54fdcde7	8a113806-2f0c-43d3-afd1-5f17fe33fa68	4889286d-1732-48b4-8196-2c92dbb54306	4	Lăng Chủ tịch Hồ Chí Minh là công trình kiến trúc thiêng liêng và trang nghiêm bậc nhất tại Việt Nam, nằm ngay trung tâm Quảng trường Ba Đình.\r\nLăng được xây dựng để bảo quản thi hài Bác Hồ, vị lãnh tụ vĩ đại của dân tộc. Kiến trúc lăng mang đậm nét kiên cố và trang trọng, sử dụng đá quý và các vật liệu bền vững. Điều đặc biệt là Lăng luôn duy trì được không khí tôn nghiêm, thu hút hàng triệu lượt khách cả trong và ngoài nước đến viếng thăm. Đây là nơi thể hiện lòng biết ơn và tôn kính vô hạn của nhân dân Việt Nam đối với Chủ tịch Hồ Chí Minh.	2026-03-02 21:39:44.936769	published
02eed253-19d7-4db7-96ec-36badd9976ab	b814d2d7-9afd-4716-8eba-83cadfb40800	4889286d-1732-48b4-8196-2c92dbb54306	5	Một kiệt tác kiến trúc của Việt Nam! Chùa Một Cột không chỉ là biểu tượng tâm linh mà còn là niềm tự hào về óc sáng tạo của cha ông từ thời Lý. Ngôi chùa được tạo hình như một đóa hoa sen nở rộ trên mặt nước, đứng vững chỉ trên một cột đá duy nhất. Dù không gian không quá lớn nhưng sự tinh xảo trong từng nét chạm trổ và ý nghĩa triết học đằng sau nó khiến mình thực sự khâm phục. Một điểm đến nhất định phải ghé khi thăm cụm di tích Lăng Bác.	2026-03-02 21:44:02.222216	published
829a7367-18ff-428b-9345-5b52e42b5ebd	b814d2d7-9afd-4716-8eba-83cadfb40800	4889286d-1732-48b4-8196-2c92dbb54306	5	Chùa Một Cột (Liên Hoa Đài) là một trong những di tích lịch sử và kiến trúc độc đáo nhất tại Hà Nội, được xây dựng từ thời vua Lý Thái Tông (1049).\r\nĐiểm đặc sắc nhất là kiến trúc mô phỏng đóa sen nở trên mặt nước, đứng vững trên một cột đá duy nhất. Điều này thể hiện sự thanh khiết, thoát tục của Phật giáo. Dù trải qua nhiều lần trùng tu, đặc biệt là sau khi bị quân Pháp phá hủy năm 1954, ngôi chùa vẫn giữ được vẻ đẹp tao nhã, tinh tế và là biểu tượng văn hóa quan trọng của Thủ đô.	2026-03-02 21:52:34.672359	published
1e46d7ec-1db0-4fc6-995e-abc021c87714	1a8cdf42-c231-41d8-8802-e8f0619a3c69	4889286d-1732-48b4-8196-2c92dbb54306	5	Cảnh đẹp, nhiều hiện vật trưng bày để tham quan, chụp ảnh, mình hay đi vào mấy ngày free vé, nhân viên đôi khi hơi gắt gỏng nhưng vẫn giải thích những gì mình thắc mắc, múa rối nước cũng rất hay.	2026-03-02 21:54:33.65445	published
5451c234-0ec8-454c-99d1-8773f6888e66	1a8cdf42-c231-41d8-8802-e8f0619a3c69	4889286d-1732-48b4-8196-2c92dbb54306	5	Một hành trình xuyên không về quá khứ đầy cảm xúc! Hoàng Thành Thăng Long không chỉ là những bức tường thành cũ, mà là nơi bạn có thể thấy rõ sự chồng lớp của lịch sử từ thời Lý, Trần, Lê đến thời đại Hồ Chí Minh. Đặc biệt, khu khảo cổ 18 Hoàng Diệu với những nền móng cung điện xưa cũ khiến mình thực sự choáng ngợp trước quy mô của kinh đô Thăng Long một thời. Đây là địa điểm giáo dục lịch sử tuyệt vời cho các bạn trẻ	2026-03-02 21:55:30.79361	published
389291f8-ec12-4cb3-9dbc-848a38d835bf	1a8cdf42-c231-41d8-8802-e8f0619a3c69	4889286d-1732-48b4-8196-2c92dbb54306	5	Một hành trình xuyên không về quá khứ đầy cảm xúc! Hoàng Thành Thăng Long không chỉ là những bức tường thành cũ, mà là nơi bạn có thể thấy rõ sự chồng lớp của lịch sử từ thời Lý, Trần, Lê đến thời đại Hồ Chí Minh. Đặc biệt, khu khảo cổ 18 Hoàng Diệu với những nền móng cung điện xưa cũ khiến mình thực sự choáng ngợp trước quy mô của kinh đô Thăng Long một thời. Đây là địa điểm giáo dục lịch sử tuyệt vời cho các bạn trẻ	2026-03-02 21:56:00.179508	published
ae9c900a-773f-4203-99f5-fb85cb8e2f03	1a8cdf42-c231-41d8-8802-e8f0619a3c69	4889286d-1732-48b4-8196-2c92dbb54306	5	Nơi này tuyệt đẹp, cảnh vật cổ kính gợi nhớ về trung tâm chính trị, văn hóa , xa xã hội của đất nước qua các triều đại phong kiến. Quá thật không có mỹ từ nào có thể miêu tả được vẻ đẹp, sự hùng vĩ, tráng lệ và tầm vóc của nơi này	2026-03-02 21:56:37.564479	published
f18eb77a-e2ea-4109-97a1-93563d729237	e9a414ee-097e-4935-a7f2-ff9af30e5911	4889286d-1732-48b4-8196-2c92dbb54306	5	Mình ghé thăm Đền Ngọc Sơn và Tháp Rùa vào ngày 19/10, thời tiết dễ chịu nên khung cảnh quanh hồ thật tuyệt. Đi dọc cầu Thê Húc nổi bật với sắc đỏ rực rỡ, soi bóng xuống mặt nước xanh tĩnh lặng, cảm giác như lạc vào bức tranh cổ. Bên trong đền khá linh thiêng, có nhiều hiện vật và thông tin thú vị về lịch sử Thăng Long – Hà Nội. Tháp Rùa nằm giữa hồ, nhìn từ xa vẫn thấy nét cổ kính trầm mặc. Không khí trong lành, tiếng gió và tiếng chuông hòa quyện khiến lòng rất nhẹ nhàng. Nếu bạn muốn tìm một nơi vừa mang màu sắc văn hóa cổ, vừa yên bình giữa lòng thành phố, nhất định nên ghé đây một lần.	2026-03-02 21:58:35.771311	published
f3ccd408-74de-48c6-ae0f-0c8adaa0b49d	e9a414ee-097e-4935-a7f2-ff9af30e5911	4889286d-1732-48b4-8196-2c92dbb54306	5	Mình đến Hà Nội lần này vào tối muộn, nên chỉ kịp dạo một vòng quanh hồ mà không vào đền vì đền đóng cửa vào buổi tối. Trước đây được miễn phí vào đền, nhưng không biết từ lúc nào vào đền thì phải mua vé, nói chung nên vào một lần cho biết nha mọi người.	2026-03-02 21:59:29.899887	published
9def036c-8031-4e1e-988c-b42387cac7be	e9a414ee-097e-4935-a7f2-ff9af30e5911	4889286d-1732-48b4-8196-2c92dbb54306	5	Giữa mặt nước xanh biếc của Hồ Gươm, Cầu Thê Húc hiện lên như một “dải lụa đỏ” nổi bật, dẫn lối du khách đến với đền Ngọc Sơn linh thiêng. Cây cầu này không chỉ là một công trình kiến trúc độc đáo mà còn là biểu tượng văn hóa, gắn liền với những truyền thuyết và lịch sử của Thủ đô Hà Nội.\r\n\r\nCầu Thê Húc được xây dựng vào năm 1865 dưới thời vua Tự Đức, do Nguyễn Văn Siêu (hay còn gọi là Thần Siêu) chủ trì. Ông là một nhà thơ, nhà văn, nhà chính trị nổi tiếng thời Nguyễn. Cây cầu được xây dựng để nối từ bờ Hồ Hoàn Kiếm đến đền Ngọc Sơn trên đảo Ngọc. Tên gọi “Thê Húc” có nghĩa là “nơi ánh sáng ban mai đậu lại”, thể hiện ý nghĩa tâm linh của cây cầu.	2026-03-02 22:00:13.086141	published
cca7cb8a-144b-4027-aa8e-04a4187c02f7	a715f38d-7560-48c3-9808-03edd21c6fe9	4889286d-1732-48b4-8196-2c92dbb54306	5	Một nơi, một chứng tích hào hùng của dân tộc trong công cuộc bảo vệ, xây dựng đất nước. Cột cờ hoàn thành năm 1812, đến nay đã được hơn 200 năm và là biểu tượng của thành phố Hà Nội. Đây là địa điểm đẹp rất nên đến tham quan, trải nghiệm đặc biệt trong các dịp lễ, Tết.	2026-03-02 22:03:53.1495	published
b4f922fb-a65b-450c-be6c-9d3cbc0c958c	a715f38d-7560-48c3-9808-03edd21c6fe9	4889286d-1732-48b4-8196-2c92dbb54306	5	Cột cờ Hà Nội hay còn gọi Kỳ đài Hà Nội là một kết cấu dạng tháp được xây dựng cùng thời với thành Hà Nội dưới triều nhà Nguyễn (bắt đầu năm 1805, hoàn thành năm 1812). Kiến trúc cột cờ bao gồm ba tầng đế và một thân cột, được coi là một trong những biểu tượng của thành phố.	2026-03-02 22:04:41.487741	published
0746c080-caf0-44fe-8b71-b08a1dcced4c	a715f38d-7560-48c3-9808-03edd21c6fe9	4889286d-1732-48b4-8196-2c92dbb54306	5	Cột Cờ Hà Nội là biểu tượng lịch sử nổi tiếng của Thủ đô, nằm trên đỉnh đồi Lý Thái Tổ trong Khu di tích Hoàng Thành Thăng Long. Công trình cao 33 mét, dựng từ gạch và đá vững chãi, là nơi treo lá cờ tổ quốc lớn, thể hiện ý chí và tinh thần dân tộc. Du khách có thể tham quan, chụp ảnh toàn cảnh Hà Nội từ chân cột và tìm hiểu về lịch sử hào hùng của đất Thăng Long – Hà Nội. Đây là điểm đến không thể bỏ qua để kết hợp giữa du lịch và trải nghiệm giá trị văn hóa – lịch sử.	2026-03-02 22:05:24.59559	published
256ab0eb-fe80-4f5d-aafc-37df4c979856	b5343ac8-2288-4e10-aca9-7fa2a9377faa	4889286d-1732-48b4-8196-2c92dbb54306	5	Di tích Nhà tù Hỏa Lò là một điểm đến đầy ám ảnh nhưng vô cùng giá trị tại Hà Nội. Dưới đây là những nhận xét ngắn gọn nhất về nơi này:\r\n• Về ý nghĩa lịch sử: Được ví như "Địa ngục trần gian" giữa lòng Thủ đô, nơi đây lưu giữ bằng chứng sống động về tinh thần kiên trung, bất khuất của các chiến sĩ cách mạng Việt Nam trước sự tra tấn dã man của thực dân Pháp.\r\n• Về trải nghiệm du lịch: Hỏa Lò hiện là một trong những di tích làm nội dung (content) và truyền thông xuất sắc nhất Việt Nam. Cách trưng bày hiện đại, kết hợp âm thanh và ánh sáng tạo cảm giác chân thực, xúc động.\r\n• Điểm nhấn đặc biệt: Tour đêm "Đêm thiêng liêng" là một trải nghiệm không thể bỏ qua, giúp du khách chạm sâu hơn vào cảm xúc và những câu chuyện lịch sử hào hùng qua các hoạt cảnh sân khấu hóa.	2026-03-02 22:10:51.577586	published
e30be9f4-09d1-40a8-be12-d1b69f64fbe2	b5343ac8-2288-4e10-aca9-7fa2a9377faa	4889286d-1732-48b4-8196-2c92dbb54306	5	Di tích Nhà tù Hỏa Lò là một điểm đến đầy ám ảnh nhưng vô cùng giá trị tại Hà Nội. Dưới đây là những nhận xét ngắn gọn nhất về nơi này:\r\n• Về ý nghĩa lịch sử: Được ví như "Địa ngục trần gian" giữa lòng Thủ đô, nơi đây lưu giữ bằng chứng sống động về tinh thần kiên trung, bất khuất của các chiến sĩ cách mạng Việt Nam trước sự tra tấn dã man của thực dân Pháp.\r\n• Về trải nghiệm du lịch: Hỏa Lò hiện là một trong những di tích làm nội dung (content) và truyền thông xuất sắc nhất Việt Nam. Cách trưng bày hiện đại, kết hợp âm thanh và ánh sáng tạo cảm giác chân thực, xúc động.\r\n• Điểm nhấn đặc biệt: Tour đêm "Đêm thiêng liêng" là một trải nghiệm không thể bỏ qua, giúp du khách chạm sâu hơn vào cảm xúc và những câu chuyện lịch sử hào hùng qua các hoạt cảnh sân khấu hóa.	2026-03-02 22:10:53.146796	published
6f2e5584-08ee-4e46-83af-00b381f9afcf	b5343ac8-2288-4e10-aca9-7fa2a9377faa	4889286d-1732-48b4-8196-2c92dbb54306	5	Nhà tù Hỏa Lò, hay còn gọi là Ngục Hỏa Lò, là một trong những di tích lịch sử tại Hà Nội, được thực dân Pháp xây dựng vào năm 1896, nơi đây từng là “địa ngục trần gian”, giam giữ và tra tấn hàng ngàn chiến sĩ cách mạng Việt Nam. Với diện tích ban đầu hơn 12.000m², nhà tù được thiết kế kiên cố với những bức tường đá cao 4m, dày 0,5m, và dây thép gai bao quanh. Hiện nay, khu di tích được bảo tồn với diện tích khoảng 2.434m², trở thành điểm đến thu hút đông đảo du khách trong và ngoài nước.	2026-03-02 22:11:39.052846	published
377e199d-3938-4aee-9cb5-bd9af3a5222c	b5343ac8-2288-4e10-aca9-7fa2a9377faa	4889286d-1732-48b4-8196-2c92dbb54306	5	Di tích Nhà tù Hỏa Lò là một trong những địa điểm lịch sử tiêu biểu tại Hà Nội, thu hút đông đảo du khách trong và ngoài nước. Nơi đây từng là nhà tù do thực dân Pháp xây dựng, giam giữ nhiều chiến sĩ cách mạng Việt Nam. Không gian trưng bày được sắp xếp khoa học, tái hiện chân thực cuộc sống, tinh thần đấu tranh kiên cường của các tù nhân. Các hiện vật, hình ảnh và tư liệu lịch sử mang lại nhiều cảm xúc và giá trị giáo dục sâu sắc. Đây là điểm đến ý nghĩa giúp thế hệ trẻ hiểu hơn về lịch sử dân tộc.	2026-03-02 22:12:21.04257	published
a09f3195-d272-4299-b210-3d577c5058e1	8dc280e5-51bf-4425-9ea4-72658ba86e4e	4889286d-1732-48b4-8196-2c92dbb54306	5	Đền Quán Thánh.\r\nĐền Quán Thánh (còn gọi là Trấn Vũ Quán) nằm ở đường Thanh Niên, quận Ba Đình, Hà Nội. Đền được xây dựng từ thời Lý Thái Tổ (thế kỷ XI), gắn liền với việc dời đô ra Thăng Long. Đây là một trong Tứ Trấn của kinh thành Thăng Long, giữ vị trí trấn giữ phương Bắc. Qua nhiều triều đại Lý – Trần – Lê – Nguyễn, đền được trùng tu nhiều lần, nhưng vẫn giữ được giá trị kiến trúc và tinh thần cổ xưa. Điểm nổi bật nhất là tượng đồng Huyền Thiên Trấn Vũ đúc năm 1677, cao gần 4m, nặng khoảng 4 tấn – một kiệt tác nghệ thuật và tâm linh của Việt Nam.\r\nÝ nghĩa tâm linh\r\nĐền thờ Huyền Thiên Trấn Vũ, vị thần trấn phương Bắc, biểu trưng cho sức mạnh chính khí, sự bảo hộ và trấn áp tà khí. Trong tín ngưỡng dân gian, ngài giúp bảo vệ kinh thành, điều hòa thiên – địa – nhân, mang lại bình an, ổn định và trí tuệ sáng suốt. Người dân thường đến đền cầu bình an, giải trừ xui rủi, vững tâm trí, hanh thông công việc và học hành. Về mặt sâu xa, Quán Thánh còn tượng trưng cho sự cân bằng âm dương và sức mạnh nội tâm, nhắc con người sống ngay chính, thuận theo đạo trời.	2026-03-02 22:16:07.547117	published
5aa50343-b98e-413a-a662-356c7612dd6b	e04e4553-459f-4ed1-9db5-14c50c1edcff	4889286d-1732-48b4-8196-2c92dbb54306	5	Cầu xây 1899 - 1902 nhà thầu Daydé & Pillé - Paris\r\nCầu đã 124 tuổi\r\nRất nhiều người đến đây chụp ảnh và thăm quan khi đến Hà Nội	2026-03-02 22:17:04.439873	published
ef2a9a48-c770-4f31-bc35-f6c3351bbb79	e04e4553-459f-4ed1-9db5-14c50c1edcff	4889286d-1732-48b4-8196-2c92dbb54306	5	Một địa điểm có giá trị lịch sử. Nhất định phải đến khi ghé thăm thành phố này.	2026-03-02 22:18:09.805411	published
2658a74b-2c3b-4307-879f-aa6d2a25213c	8dc280e5-51bf-4425-9ea4-72658ba86e4e	4889286d-1732-48b4-8196-2c92dbb54306	4	đền quán thánh (trấn vũ quán) là một trong bốn ngôi đền linh thiêng trong "thăng long tứ trấn," có nhiệm vụ trấn giữ phía bắc kinh thành xưa.\r\nđền xây năm 1010 ban đầu tên là trấn vũ quán. năm 1842, đổi tên là đền quán thánh.\r\nđền thờ thần huyền thiên trấn vũ, vị thần có sức mạnh trừ yêu diệt quái, phù hộ cho sự bình an.\r\ndân chúng thường đến đây cầu xin sức khỏe, bình an và may mắn.\r\ntrong đền có tượng trấn vũ, đúc năm 1677, cao 3.96m, nặng 3960kg bằng đồng đen, là tượng đồng lớn nhất của nghệ thuật đúc đồng thế kỷ XVII ở việt nam.\r\nkiến trúc đền quán thánh có bố cục chữ “công” với nét u tịch – cổ kính:\r\ncổng tam quan: phong cách kiến trúc thời nguyễn, có tháp chuông và mái ngói rêu phong.\r\nsân đền: rộng, có cây bồ đề cổ thụ hơn 100 năm tuổi.\r\nđại bái – trung cung – hậu cung: làm bằng gỗ lim, chạm trổ tinh xảo, hậu cung đặt tượng trấn vũ.\r\nchuông đồng lớn: đúc năm 1670, nặng 1500 kg, là một trong những chuông lớn nhất thăng long.\r\nđền được trùng tu các năm: 1474 (lê thánh tông), 1677 (lê hy tông), 1731, 1842, 1941.\r\nhiện nay đền vẫn có dáng vẻ cổ kính và lưu giữ nhiều hiện vật quý.	2026-03-02 22:18:24.010718	published
d2312809-812e-43b9-9eec-fb4e5f89b0b2	e04e4553-459f-4ed1-9db5-14c50c1edcff	4889286d-1732-48b4-8196-2c92dbb54306	5	Chúng tôi đã tham gia một tour xe đạp ở Hà Nội. Đó thực sự là một cuộc phiêu lưu với giao thông hỗn loạn trên đường phố.	2026-03-02 22:18:51.877373	published
494597ac-061e-4735-b26d-e2af1c4cb6ac	8dc280e5-51bf-4425-9ea4-72658ba86e4e	4889286d-1732-48b4-8196-2c92dbb54306	4	Đền Quán Thánh, danh bất hư truyền là Trấn Vũ Quán, chính là một trong "Thăng Long Tứ Trấn" lẫy lừng của kinh thành xưa. Tọa lạc bên bờ Hồ Tây thơ mộng, ngôi đền là nơi phụng thờ Đức Huyền Thiên Trấn Vũ – vị thần trấn giữ phương Bắc, biểu tượng cho sức mạnh tâm linh bảo vệ sự bình yên của quốc gia. Với bề dày lịch sử được khởi dựng từ thời vua Lý Thái Tổ, nơi đây không chỉ là một công trình kiến trúc cổ kính mà còn là "chứng nhân" lịch sử, lưu giữ linh hồn và khí phách của vùng đất ngàn năm văn hiến.	2026-03-02 22:19:05.947145	published
ac0c0189-7394-4e38-afca-72a17654328c	07c80f91-6fb0-4dc0-94d3-f70b0000528c	4889286d-1732-48b4-8196-2c92dbb54306	5	Công trình bắt đầu xây dựng năm 1884 và hoàn thành năm 1887 dưới thời Pháp thuộc, là một trong những công trình Công giáo đầu tiên do Pháp xây tại Hà Nội. Nhà thờ được xây trên nền của chùa Báo Thiên, một trung tâm Phật giáo lớn từ thời Lý – Trần. Nhà thờ được xây theo phong cách Gothic Revival (Tân Gothic), giống như Nhà thờ Đức Bà Paris.	2026-03-02 22:22:07.680042	published
fa15b8e7-cdaa-478d-859b-f23a35272d15	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	4889286d-1732-48b4-8196-2c92dbb54306	5	Phủ Tây Hồ thờ Liễu Hạnh Công chúa, một trong bốn vị thánh bất tử trong tín ngưỡng của người Việt bên cạnh Chử Đồng Tử, Thánh Gióng, Sơn Tinh. Truyền thuyết kể rằng Liễu Hạnh là Ngọc Hoa, con gái thứ 2 của Ngọc Hoàng vì làm vỡ ly ngọc quý mà bị đày xuống trần gian. Sau khi hạ phàm tại Đảo Hồ Tây, bà giúp người dân trừ ma, diệt yêu, an cư lạc nghiệp, trừng phạt tham quan.\r\nCho đến thời điểm hiện tại, người ta vẫn chưa biết thời gian cụ thể xây dựng Phủ Tây Hồ. Nó được dự đoán vào khoảng thế kỉ 17 nhưng có thể muộn hơn. Trong các cuốn sách đầu tiên về các di tích của Thăng Long - Hà Nội cũng đều không có ghi chép về di tích này. Năm 1996, Phủ Tây Hồ đã được bộ Văn hóa - Thể thao và Du lịch cấp bằng di tích Lịch sử - Văn hóa.\r\nPhủ Tây Hồ là một quần thể gồm Phủ Chính, Điện Sơn Trang, lầu cô, lầu cậu được bố trí theo thứ tự từ trong ra ngoài. Kiến trúc chính của Phủ được xây theo kiểu tam quan, có 3 nếp Tam Tòa Thánh Mẫu. Phủ chính có quy mô lớn nhất với mặt trước là cửa tam quan 2 tầng, trên mái có ghi “Tây Hồ hiển tích” bằng tiếng Hán khá tỉ mỉ, công phu. Bốn cánh cửa giữa phần trên chạm tứ quý, phần dưới chạm tứ linh, giữa chạm đào thọ.	2026-03-02 22:26:00.84162	published
86ff4281-659c-44eb-89f6-1d1a8238d43f	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	4889286d-1732-48b4-8196-2c92dbb54306	5	Nằm ngay mép hồ tây nên gọi Phủ tây hồ, tên đủ lad Phủ Tây hồ đền Kim ngưu. Dọc đường vào lad quán xá, bên quán ăn đặc trưng là bánh tôm, bên lad viết sớ , lế lạp. Hơi sẩm tối, đèn điện sáng trưng nhìn vui mắt,nhất là bên viết sớ, vời các ông lão bận áo the xưa ,ngồi có thể xem luôn vận may rủi. Qua cổng tam quan, men hồ đi vô đôi 50m, là vào điện chính 3 gian, thờ ngọc hoàng,kiến trúc đúng kiểu đền. Bên mé trái điện chính, có điện cũng 3 gian thờ thánh mấu có nhiều sắc xanh cổ vịt. Các điện trông ra mặt hồ. Cảnh quan thanh bình, nghiêm trang và có phần rất linh khác lạ.	2026-03-02 22:26:34.175481	published
15b2ebbc-7363-4a92-a020-1642e7ecb807	c4345c0a-7412-4aea-a6d6-8af91d5c8b99	4889286d-1732-48b4-8196-2c92dbb54306	5	Phủ Tây Hồ ngày rằm hay mùng 1 là luôn đông từ sáng tới tối 😅\r\nĐi sớm hoặc muộn muộn thì có thể vào trong gần cổng gửi xe, đi giờ hành chính là thấy các chú công an phường chặn luôn 2 đường vào (1 là cái ngõ nhỏ cạnh quán cà phê), 2 là đường ven hồ :3 nên ta chịu khó đi sớm sớm hoặc muộn muộn xíu thì không phải gửi xe xa.\r\nĐông đúc lắm nên điện thoại, ví là cất cho cẩn thận kẻo bị móc mất 😅	2026-03-02 22:27:32.156443	published
ebb88186-94bf-49e5-bd0a-3bb4bb1fa6bb	33a569bd-b6b7-4f77-b1fd-91820407d49c	4889286d-1732-48b4-8196-2c92dbb54306	5	Quảng trường Ba Đình là một không gian rộng lớn, trang nghiêm và giàu giá trị lịch sử, gắn liền với nhiều sự kiện trọng đại của đất nước.	2026-03-02 22:30:19.314531	published
842bcf6d-4cb0-4da9-85d9-4691131fecf7	33a569bd-b6b7-4f77-b1fd-91820407d49c	4889286d-1732-48b4-8196-2c92dbb54306	5	Nằm ngay trung tâm thủ đô, nơi đây tạo cảm giác yên bình nhưng vẫn rất thiêng liêng, đặc biệt khi đứng trước Lăng Chủ tịch Hồ Chí Minh.	2026-03-02 22:30:51.465438	published
05239fbb-0ad6-4db5-8821-26125a785b2c	33a569bd-b6b7-4f77-b1fd-91820407d49c	4889286d-1732-48b4-8196-2c92dbb54306	5	Đây là điểm đến không chỉ thu hút du khách trong và ngoài nước mà còn là nơi người dân thể hiện lòng tự hào dân tộc	2026-03-02 22:31:14.141467	published
89a52783-4983-4cda-b65e-d60b215a6b15	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	4889286d-1732-48b4-8196-2c92dbb54306	5	Cái tên Đông Kinh Nghĩa Thục không phải ngẫu nhiên được đặt cho quảng trường này. Nó là sự tưởng niệm phong trào duy tân cùng tên (trường học miễn phí vì việc nghĩa) cực kỳ nổi tiếng năm 1907, do các sĩ phu yêu nước như Lương Văn Can, Nguyễn Quyền khởi xướng.	2026-03-02 22:32:52.686462	published
90ab0d79-188b-413e-b6ec-251931c8208e	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	4889286d-1732-48b4-8196-2c92dbb54306	5	Quảng Trường nằm ở vị trí trung tâm quận Hoàn Kiếm, ngay cạnh hồ Gươm - trái tim thủ đô Hà Nội.	2026-03-02 22:33:45.530693	published
e3de6d4c-4343-4f4b-81fb-6d48a8550075	b4fdf881-3ae3-4bdb-9976-dcfb6d743d40	4889286d-1732-48b4-8196-2c92dbb54306	5	Quảng trường Đông Kinh Nghĩa Thục: Trái tim sống động của Hà Nội	2026-03-02 22:34:08.775164	published
12ec8994-4203-474f-96fe-c2c52bd59d0b	c8e43a60-b5b5-4605-b21b-b301bcb10a30	4889286d-1732-48b4-8196-2c92dbb54306	5	Thật khó để diễn tả hết cảm xúc mỗi khi mình dành trọn một ngày để lang thang khắp các ngõ ngách của Phố cổ Hà Nội.	2026-03-02 22:35:42.240857	published
dc5af608-8996-4c20-b2e2-253635e45118	c8e43a60-b5b5-4605-b21b-b301bcb10a30	4889286d-1732-48b4-8196-2c92dbb54306	5	Phố cổ Hà Nội là trái tim văn hoá lâu đời của Thủ đô, nơi hội tụ sắc màu đa dạng từ những ngôi nhà cổ kính, các cửa hàng thủ công truyền thống, đến hương vị ẩm thực đặc trưng ngàn đời. Ban ngày, phố phường rộn ràng với những khu chợ sớm đầy ắp sản vật, còn khi đêm xuống, không gian lại bừng sáng bởi hàng quán, ẩm thực đường phố và nhịp sống sôi động. Đây là nơi du khách cảm nhận rõ nét nhất tinh hoa văn hoá, sự dung hoà giữa truyền thống và hiện đại của Hà Nội.	2026-03-02 22:36:12.33568	published
aa4a0ec8-7707-43a1-909f-57b2e1eec6bd	c8e43a60-b5b5-4605-b21b-b301bcb10a30	4889286d-1732-48b4-8196-2c92dbb54306	5	Phố cổ Hà Nội là khu vực lịch sử nổi tiếng với 36 phố phường, mỗi phố mang tên một mặt hàng thủ công truyền thống như Hàng Bạc, Hàng Gai, Hàng Chiếu. Nơi đây giữ trọn vẹn nét kiến trúc đặc trưng với những ngôi nhà ống, mái ngói rêu phong và những con phố nhỏ chằng chịt. Phố cổ là linh hồn của Thủ đô, vừa mang vẻ đẹp cổ kính, vừa sôi động với ẩm thực đường phố và nhịp sống hối hả, tạo nên một nét văn hóa độc đáo không thể trộn lẫn.	2026-03-02 22:36:48.255162	published
e872b26d-ba92-477c-a9ce-19d1af5c1ca3	f9027e35-0096-4dab-904e-b75256e3dd3a	4889286d-1732-48b4-8196-2c92dbb54306	5	Phố đi bộ Hồ Hoàn Kiếm (hay còn gọi là Phố đi bộ Hồ Gươm) là một trong những điểm đến văn hóa và giải trí sầm uất nhất tại Hà Nội vào mỗi dịp cuối tuần. Đây là không gian dành riêng cho người đi bộ, nơi diễn ra nhiều hoạt động văn nghệ, trò chơi dân gian và sự kiện cộng đồng đặc sắc	2026-03-02 22:38:17.434839	published
3ab45b8a-a5b5-453f-8fc2-1595f137e55a	f9027e35-0096-4dab-904e-b75256e3dd3a	4889286d-1732-48b4-8196-2c92dbb54306	5	Thông thường, không gian đi bộ khu vực hồ Hoàn Kiếm và phụ cận mở cửa vào các khoảng thời gian sau:\r\n​Từ 19:00 Thứ Sáu đến 24:00 Chủ Nhật hàng tuần.\r\n​Vào các ngày lễ lớn, lịch hoạt động có thể được điều chỉnh hoặc kéo dài hơn.	2026-03-02 22:39:49.351301	published
5a6103e6-aa75-4432-a7f9-e965ef924db2	f9027e35-0096-4dab-904e-b75256e3dd3a	4889286d-1732-48b4-8196-2c92dbb54306	5	​Trò chơi dân gian: Bạn có thể tham gia hoặc xem các trò chơi truyền thống như kéo co, đá cầu, chơi ô ăn quan, nhảy dây... ngay trên lòng đường.\r\n​Biểu diễn nghệ thuật: Từ nhạc dân tộc, hát xẩm, đến các ban nhạc đường phố chơi rock, pop hay trình diễn nhảy hiện đại	2026-03-02 22:40:15.933267	published
b2790f8b-db09-4363-808c-d3f0119cf68c	b7f14550-1f41-46a7-9fd6-19676ff9afa7	4889286d-1732-48b4-8196-2c92dbb54306	5	Trước đây khá xưa là con phố nhỏ xuyên qua chợ cóc tối và ẩm, nối 2 phố lớn một bên là Hai Bà Trưng và bên kia là Lý Thường Kiệt. Giờ là con phố đi bộ,lát đá ô, hai bên là các shop sách , giữa xen kẽ là cẫc hàng ghế ,ngồi cafe ,nghỉ xem sách mua được hay tán gẫu khá chill. Đi xe máy gửi xe ngay ngoài và chỉ nhận trả tiền coi bằng việc quét QR	2026-03-02 22:42:31.958791	published
e52d414d-5c84-40bd-9d09-60f20767e53c	b7f14550-1f41-46a7-9fd6-19676ff9afa7	4889286d-1732-48b4-8196-2c92dbb54306	5	Một không gian đọc sách dễ chịu giữa lòng Hà Nội, gọn gàng, sạch sẽ với nhiều gian hàng sách đa dạng. Phù hợp để dạo bộ, đọc sách hoặc ngồi cà phê thư giãn.\r\nMột số thời điểm khá vắng, thiếu sự kiện hoặc hoạt động giao lưu.	2026-03-02 22:43:07.124228	published
0e0b185a-9961-4872-be69-5c76c8f2e257	b7f14550-1f41-46a7-9fd6-19676ff9afa7	4889286d-1732-48b4-8196-2c92dbb54306	5	Phố sách đang trang trí giáng sinh  rất là đẹp luôn! Mọi người ghé chơi nhé	2026-03-02 22:43:54.190408	published
97755a43-16c7-482d-a86c-589d4b215dd5	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	4889286d-1732-48b4-8196-2c92dbb54306	5	Cv vào giữa mùa đông rất đẹp, có tàu hoả đi vòng quanh cv giá vé là 30k còn vé xe máy là 5k	2026-03-02 22:45:41.572989	published
09e7c9a1-44f0-4455-a185-674a90c3ff42	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	4889286d-1732-48b4-8196-2c92dbb54306	5	Một trong những công viên đẹp và rộng nhất Hà Nội. Cây xanh nhiều, hồ lớn tạo không gian rất thư thái. Rất phù hợp để đi dạo, picnic nhẹ hoặc đơn giản là ngồi ngắm cảnh. Ai thích chụp ảnh thiên nhiên cũng có nhiều góc đẹp.	2026-03-02 22:46:06.948531	published
4898f81d-fafd-4293-8854-78b49d852ade	89d1aa99-363b-40f7-a6d3-e06dfc3a6252	4889286d-1732-48b4-8196-2c92dbb54306	5	Công viên Thống Nhất rộng hơn 50 hecta, là công viên lớn nhất trong nội đô Hà Nội, được bao quanh bởi các phố Nguyễn Đình Chiểu, Lê Duẩn, Đại Cồ Việt và Trần Nhân Tông. Trong đó, hồ Bảy Mẫu chiếm phần lớn diện tích, còn lại là cây xanh và các công trình.\r\nHơn 50 hecta	2026-03-02 22:46:43.078617	published
6a934420-03cf-4762-a9ed-ad979e9a8433	6d9603f9-46dd-45ec-8137-8e57bcb32b19	4889286d-1732-48b4-8196-2c92dbb54306	5	Chiều nay có cơ hội đưa gia đình đến đây và có một số nhận xét về các hạng mục như sau:\r\n1. Đường đi: Khá thuận tiện ( mình từ Vĩnh tuy đi mất khoảng 20p)\r\n2. Bãi đỗ xe: Rộng rãi, chi phí hợp lý ( 30k )\r\n3. Vào bên trong có phân ra nhiều khu ( cắm trại, vui chơi tự do, nướng ăn uống)\r\nKhông khí trong lành, hồ rộng. Có thể thuê xe đạp đi vòng quanh.	2026-03-02 22:48:05.455188	published
52bb9715-c710-4638-bf73-faf5468b4e92	6d9603f9-46dd-45ec-8137-8e57bcb32b19	4889286d-1732-48b4-8196-2c92dbb54306	5	Nếu Hà Nội là một chiếc nồi áp suất thì Công viên Yên Sở chính là cái van xả stress 😆. Mỗi lần mệt mỏi, chỉ cần xách xe chạy ra đây là thấy người nhẹ hẳn, não bớt “lag	2026-03-02 22:48:38.484845	published
6717233a-3a1d-41ef-a89f-87e9a90ad487	6d9603f9-46dd-45ec-8137-8e57bcb32b19	4889286d-1732-48b4-8196-2c92dbb54306	5	Trải nghiệm rất thoải mái cùng gia đình tại đây.\r\nCông viên rộng rãi, sạch sẽ có thêm các khu Wc thì tốt hơn.\r\n- Đỗ xe thoải mái\r\n- Hồ rộng, khu đá bóng, chạy nhẩy tmai.\r\n- Khu cắm trại ân uống rộng.\r\n- Đủ dịch vụ cafe, thuê đồ cắm trại đầy đủ.	2026-03-02 22:49:05.033177	published
c57a028d-3948-46a0-af01-1ec10b009103	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	4889286d-1732-48b4-8196-2c92dbb54306	5	Đi Làng gốm bát tràng từ mấy tháng trước, nhưng vẫn nhớ gần như các chi tiết và trải nghiệm.\r\nCác tầng đầu thì sẽ tham quan các đồ vật liên quan đến gốm. Đa phần thì sẽ là quầy trưng bày. Có nhiều đồ vật mọi người làm bằng gốm tương đối sáng tạo.\r\nNhớ nhất và ấn tượng nhất chắc là màn điêu khắc ánh sáng để kể lại các câu chuyện lịch sử phục nước dựng nước và dựng nước của ông cha ta mà nghe nó cuốn nó tự hào dã man	2026-03-02 22:50:31.903787	published
cac252b9-1647-448f-b657-a8f33877101d	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	4889286d-1732-48b4-8196-2c92dbb54306	5	Một trải nghiệm tuyệt vời tại làng cổ Bát Tràng! Không chỉ được dạo quanh những con ngõ nhỏ rêu phong, tôi còn được tận mắt xem các nghệ nhân nặn gốm, vẽ men và nung lò – tất cả đều toát lên nét tinh hoa của làng nghề trăm năm tuổi.	2026-03-02 22:51:07.177786	published
c5572ef5-b3a4-4619-a032-f5e2e8233fe1	ca0746f4-a0f2-4ad2-be25-65023d95f3cc	4889286d-1732-48b4-8196-2c92dbb54306	5	Ngôi làng cổ nằm sát bờ sông Hồng có nghề làm gốm lâu đời với sản phẩm rất đa dạng. Gốm Bát Tràng phát triển mạnh mẽ trong những năm gần đây khi nhu cầu tăng về cả số lượng lẫn thẩm mỹ. Ở vùng Bắc Ninh còn có loại gốm truyền thống Phù lãng cũng rất nổi tiếng và hai loại gốm này khác nhau rất nhiều.	2026-03-02 22:51:33.872791	published
1ad8c1f4-937c-42cb-b508-5e2a7f561301	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	4889286d-1732-48b4-8196-2c92dbb54306	5	Đường Lâm trong mắt mình là một khoảng lặng đầy hoài niệm, nơi mà thời gian dường như chẳng nỡ làm phai đi nét rêu phong của một vùng quê Bắc Bộ. Khi đặt chân đến đây, cảm giác đầu tiên chạm vào lòng mình không phải là sự kỳ vĩ, mà là sự ấm áp từ những bức tường đá ong màu vàng sậm, xù xì nhưng chứa đựng cả một bầu trời ký ức	2026-03-02 22:52:50.972368	published
fafda201-002a-40ea-a82b-de16b104353c	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	4889286d-1732-48b4-8196-2c92dbb54306	5	Vé 20k gửi xe 5-10k gì đó, mình thấy làng nhỏ có thể đi bộ đc ko xa như lời mấy cô bảo thuê xe đạp vì xa lắm đâu, nên đi bộ để trải no trọn vẹn hơn vì nếu vào thăm nhà cổ hay vào mấy điểm chùa đình mà để xe đạp ở ngoài sợ mất lắm. Cái bản đồ trong nó to mà nó lằng nhằng vậy chứ có chút xíu à.	2026-03-02 22:53:22.766716	published
0ef08b13-0331-4cbb-bff3-234f212a56b4	2f5093b4-e390-4dd8-867e-78d1e56d0ca5	4889286d-1732-48b4-8196-2c92dbb54306	5	Làng cổ Đường Lâm, cách Hà Nội không xa, là một điểm đến tuyệt vời để khám phá vẻ đẹp cổ kính và nền văn hóa truyền thống của miền Bắc. Đến đây, mình như lạc vào một không gian thời gian, với những ngôi nhà mái ngói, tường gạch đỏ, và những con đường làng nhỏ, vắng vẻ. Cảm giác như thời gian ở đây chậm lại, mọi thứ vẫn giữ nguyên vẻ đẹp mộc mạc, giản dị. Làng còn nổi bật với những di tích lịch sử như đền thờ, miếu, và đặc biệt là nhà thờ tổ của các dòng họ nổi tiếng. Thực sự, Đường Lâm là nơi tuyệt vời để tìm hiểu về lịch sử, văn hóa, và con người Việt Nam qua các thế hệ.	2026-03-02 22:53:55.220126	published
\.


--
-- TOC entry 5018 (class 0 OID 16634)
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
-- TOC entry 5021 (class 0 OID 16705)
-- Dependencies: 233
-- Data for Name: user_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_addresses (id, user_id, label, address, lat, lon, is_default, created_at) FROM stdin;
\.


--
-- TOC entry 5009 (class 0 OID 16413)
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
-- TOC entry 4817 (class 2606 OID 16569)
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- TOC entry 4843 (class 2606 OID 16686)
-- Name: list_items list_items_list_id_location_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_items
    ADD CONSTRAINT list_items_list_id_location_id_key UNIQUE (list_id, location_id);


--
-- TOC entry 4845 (class 2606 OID 16684)
-- Name: list_items list_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_items
    ADD CONSTRAINT list_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4839 (class 2606 OID 16666)
-- Name: lists lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 16539)
-- Name: location_images location_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_images
    ADD CONSTRAINT location_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4804 (class 2606 OID 16515)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4807 (class 2606 OID 16524)
-- Name: opening_hours opening_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opening_hours
    ADD CONSTRAINT opening_hours_pkey PRIMARY KEY (id);


--
-- TOC entry 4813 (class 2606 OID 16555)
-- Name: rating_stars rating_stars_location_id_star_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating_stars
    ADD CONSTRAINT rating_stars_location_id_star_key UNIQUE (location_id, star);


--
-- TOC entry 4815 (class 2606 OID 16553)
-- Name: rating_stars rating_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating_stars
    ADD CONSTRAINT rating_stars_pkey PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 16412)
-- Name: referral_codes referral_codes_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referral_codes
    ADD CONSTRAINT referral_codes_code_key UNIQUE (code);


--
-- TOC entry 4790 (class 2606 OID 16408)
-- Name: referral_codes referral_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referral_codes
    ADD CONSTRAINT referral_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 16410)
-- Name: referral_codes referral_codes_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referral_codes
    ADD CONSTRAINT referral_codes_user_id_key UNIQUE (user_id);


--
-- TOC entry 4825 (class 2606 OID 16606)
-- Name: review_images review_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_images
    ADD CONSTRAINT review_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4829 (class 2606 OID 16619)
-- Name: review_likes review_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_likes
    ADD CONSTRAINT review_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 4831 (class 2606 OID 16621)
-- Name: review_likes review_likes_review_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_likes
    ADD CONSTRAINT review_likes_review_id_user_id_key UNIQUE (review_id, user_id);


--
-- TOC entry 4822 (class 2606 OID 16585)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4835 (class 2606 OID 16642)
-- Name: search_history search_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4847 (class 2606 OID 16714)
-- Name: user_addresses user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 4796 (class 2606 OID 16424)
-- Name: users users_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_code_key UNIQUE (code);


--
-- TOC entry 4798 (class 2606 OID 16422)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 16426)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4818 (class 1259 OID 16575)
-- Name: idx_articles_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_articles_location ON public.articles USING btree (location_id);


--
-- TOC entry 4840 (class 1259 OID 16697)
-- Name: idx_list_items_list; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_list_items_list ON public.list_items USING btree (list_id);


--
-- TOC entry 4841 (class 1259 OID 16698)
-- Name: idx_list_items_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_list_items_location ON public.list_items USING btree (location_id);


--
-- TOC entry 4836 (class 1259 OID 16673)
-- Name: idx_lists_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lists_type ON public.lists USING btree (type);


--
-- TOC entry 4837 (class 1259 OID 16672)
-- Name: idx_lists_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lists_user ON public.lists USING btree (user_id);


--
-- TOC entry 4808 (class 1259 OID 16545)
-- Name: idx_location_images_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_location_images_location ON public.location_images USING btree (location_id);


--
-- TOC entry 4801 (class 1259 OID 16516)
-- Name: idx_locations_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_locations_category ON public.locations USING btree (category);


--
-- TOC entry 4802 (class 1259 OID 16517)
-- Name: idx_locations_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_locations_name ON public.locations USING btree (name);


--
-- TOC entry 4805 (class 1259 OID 16530)
-- Name: idx_opening_hours_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_opening_hours_location ON public.opening_hours USING btree (location_id);


--
-- TOC entry 4811 (class 1259 OID 16561)
-- Name: idx_rating_stars_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_rating_stars_location ON public.rating_stars USING btree (location_id);


--
-- TOC entry 4823 (class 1259 OID 16612)
-- Name: idx_review_images_review; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_review_images_review ON public.review_images USING btree (review_id);


--
-- TOC entry 4826 (class 1259 OID 16632)
-- Name: idx_review_likes_review; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_review_likes_review ON public.review_likes USING btree (review_id);


--
-- TOC entry 4827 (class 1259 OID 16633)
-- Name: idx_review_likes_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_review_likes_user ON public.review_likes USING btree (user_id);


--
-- TOC entry 4819 (class 1259 OID 16596)
-- Name: idx_reviews_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reviews_location ON public.reviews USING btree (location_id);


--
-- TOC entry 4820 (class 1259 OID 16597)
-- Name: idx_reviews_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reviews_user ON public.reviews USING btree (user_id);


--
-- TOC entry 4832 (class 1259 OID 16654)
-- Name: idx_search_history_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_search_history_created ON public.search_history USING btree (created_at DESC);


--
-- TOC entry 4833 (class 1259 OID 16653)
-- Name: idx_search_history_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_search_history_user ON public.search_history USING btree (user_id);


--
-- TOC entry 4793 (class 1259 OID 16503)
-- Name: idx_users_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_code ON public.users USING btree (code);


--
-- TOC entry 4794 (class 1259 OID 16504)
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_username ON public.users USING btree (username);


--
-- TOC entry 4851 (class 2606 OID 16570)
-- Name: articles articles_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- TOC entry 4860 (class 2606 OID 16687)
-- Name: list_items list_items_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_items
    ADD CONSTRAINT list_items_list_id_fkey FOREIGN KEY (list_id) REFERENCES public.lists(id) ON DELETE CASCADE;


--
-- TOC entry 4861 (class 2606 OID 16692)
-- Name: list_items list_items_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_items
    ADD CONSTRAINT list_items_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- TOC entry 4859 (class 2606 OID 16667)
-- Name: lists lists_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4849 (class 2606 OID 16540)
-- Name: location_images location_images_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_images
    ADD CONSTRAINT location_images_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- TOC entry 4848 (class 2606 OID 16525)
-- Name: opening_hours opening_hours_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opening_hours
    ADD CONSTRAINT opening_hours_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- TOC entry 4850 (class 2606 OID 16556)
-- Name: rating_stars rating_stars_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating_stars
    ADD CONSTRAINT rating_stars_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- TOC entry 4854 (class 2606 OID 16607)
-- Name: review_images review_images_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_images
    ADD CONSTRAINT review_images_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id) ON DELETE CASCADE;


--
-- TOC entry 4855 (class 2606 OID 16622)
-- Name: review_likes review_likes_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_likes
    ADD CONSTRAINT review_likes_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id) ON DELETE CASCADE;


--
-- TOC entry 4856 (class 2606 OID 16627)
-- Name: review_likes review_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_likes
    ADD CONSTRAINT review_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4852 (class 2606 OID 16586)
-- Name: reviews reviews_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


--
-- TOC entry 4853 (class 2606 OID 16591)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 4857 (class 2606 OID 16648)
-- Name: search_history search_history_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- TOC entry 4858 (class 2606 OID 16643)
-- Name: search_history search_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4862 (class 2606 OID 16715)
-- Name: user_addresses user_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-03-31 09:01:14

--
-- PostgreSQL database dump complete
--

\unrestrict ZMo0eMvFPA9ZxZgXjE56fdWkXVsk01XrJTJpAMQeMS3rAc14Rq2DKlNeAXhdPae

