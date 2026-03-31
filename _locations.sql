--
-- PostgreSQL database dump
--

\restrict TXnU7cepD8Y35I2FPlRgpccQWRnicTEK7Ay7MiOzwwmT3JwPdSQAO1gIaq8GycQ

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

-- Started on 2026-03-31 08:46:00

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
-- TOC entry 4886 (class 0 OID 16505)
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
-- TOC entry 4740 (class 2606 OID 16515)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 1259 OID 16516)
-- Name: idx_locations_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_locations_category ON public.locations USING btree (category);


--
-- TOC entry 4738 (class 1259 OID 16517)
-- Name: idx_locations_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_locations_name ON public.locations USING btree (name);


-- Completed on 2026-03-31 08:46:00

--
-- PostgreSQL database dump complete
--

\unrestrict TXnU7cepD8Y35I2FPlRgpccQWRnicTEK7Ay7MiOzwwmT3JwPdSQAO1gIaq8GycQ

