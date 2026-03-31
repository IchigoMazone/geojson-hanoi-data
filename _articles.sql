--
-- PostgreSQL database dump
--

\restrict 5BwOekLDNW5OdYR9LSWrShEVNFbRRXGxD2UccNXQGHcLn89sCYYxMSxe1zUKhVl

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

-- Started on 2026-03-31 08:43:37

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
-- TOC entry 4883 (class 0 OID 16562)
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
-- TOC entry 4735 (class 2606 OID 16569)
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- TOC entry 4736 (class 1259 OID 16575)
-- Name: idx_articles_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_articles_location ON public.articles USING btree (location_id);


--
-- TOC entry 4737 (class 2606 OID 16570)
-- Name: articles articles_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;


-- Completed on 2026-03-31 08:43:38

--
-- PostgreSQL database dump complete
--

\unrestrict 5BwOekLDNW5OdYR9LSWrShEVNFbRRXGxD2UccNXQGHcLn89sCYYxMSxe1zUKhVl

