--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: catalog_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_author (
    id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    date_of_birth date,
    date_of_death date
);


ALTER TABLE public.catalog_author OWNER TO postgres;

--
-- Name: catalog_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_author_id_seq OWNER TO postgres;

--
-- Name: catalog_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_author_id_seq OWNED BY public.catalog_author.id;


--
-- Name: catalog_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_book (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    summary text NOT NULL,
    isbn character varying(13) NOT NULL,
    author_id bigint,
    language_id bigint
);


ALTER TABLE public.catalog_book OWNER TO postgres;

--
-- Name: catalog_book_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_book_genre (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE public.catalog_book_genre OWNER TO postgres;

--
-- Name: catalog_book_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_book_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_book_genre_id_seq OWNER TO postgres;

--
-- Name: catalog_book_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_book_genre_id_seq OWNED BY public.catalog_book_genre.id;


--
-- Name: catalog_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_book_id_seq OWNER TO postgres;

--
-- Name: catalog_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_book_id_seq OWNED BY public.catalog_book.id;


--
-- Name: catalog_bookinstance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_bookinstance (
    id uuid NOT NULL,
    imprint character varying(200) NOT NULL,
    due_back date,
    status character varying(1) NOT NULL,
    book_id bigint,
    borrower_id integer
);


ALTER TABLE public.catalog_bookinstance OWNER TO postgres;

--
-- Name: catalog_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_genre (
    id bigint NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.catalog_genre OWNER TO postgres;

--
-- Name: catalog_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_genre_id_seq OWNER TO postgres;

--
-- Name: catalog_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_genre_id_seq OWNED BY public.catalog_genre.id;


--
-- Name: catalog_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_language (
    id bigint NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.catalog_language OWNER TO postgres;

--
-- Name: catalog_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_language_id_seq OWNER TO postgres;

--
-- Name: catalog_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_language_id_seq OWNED BY public.catalog_language.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: catalog_author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_author ALTER COLUMN id SET DEFAULT nextval('public.catalog_author_id_seq'::regclass);


--
-- Name: catalog_book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book ALTER COLUMN id SET DEFAULT nextval('public.catalog_book_id_seq'::regclass);


--
-- Name: catalog_book_genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book_genre ALTER COLUMN id SET DEFAULT nextval('public.catalog_book_genre_id_seq'::regclass);


--
-- Name: catalog_genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_genre ALTER COLUMN id SET DEFAULT nextval('public.catalog_genre_id_seq'::regclass);


--
-- Name: catalog_language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_language ALTER COLUMN id SET DEFAULT nextval('public.catalog_language_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
2	Library Members
1	Librarian
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	45
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add book instance	7	add_bookinstance
26	Can change book instance	7	change_bookinstance
27	Can delete book instance	7	delete_bookinstance
28	Can view book instance	7	view_bookinstance
29	Can add book	8	add_book
30	Can change book	8	change_book
31	Can delete book	8	delete_book
32	Can view book	8	view_book
33	Can add genre	9	add_genre
34	Can change genre	9	change_genre
35	Can delete genre	9	delete_genre
36	Can view genre	9	view_genre
37	Can add author	10	add_author
38	Can change author	10	change_author
39	Can delete author	10	delete_author
40	Can view author	10	view_author
41	Can add language	11	add_language
42	Can change language	11	change_language
43	Can delete language	11	delete_language
44	Can view language	11	view_language
45	Set book as returned	7	can_mark_returned
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$9ZuOAxzHgTAXfhRAgIZdBa$r60JiOBAw43OK9JTB+aUz/VsaEoAe3OweP8AbpF64mU=	2021-12-06 14:22:22.739237+05:30	t	srldc			kalikiri616@gmail.com	t	t	2021-11-17 11:43:26.423085+05:30
3	pbkdf2_sha256$260000$iLyF8t0LMjpB6VnqqbdiXV$P38Vfj8wFgEXSpECxHTDgQpNty1Y0FsS1pOpcmu48tc=	\N	f	librarian1				f	t	2021-11-18 14:34:57+05:30
5	pbkdf2_sha256$260000$1NefLmIToiQitITGPa8ELT$kDc/uRBZGfTMsCIhpconuro9jbHMzB6aK0hS7veXR8A=	2021-11-23 14:38:15.976416+05:30	f	member2				f	t	2021-11-18 14:36:31+05:30
2	pbkdf2_sha256$260000$fkAVLIa9RiHW5N9rgkuaQB$HWKQ8sBjp+VdtePQcGqEoWnU1i9I5WW4C6BZmVKKrMY=	2021-11-23 16:14:39.289137+05:30	f	librarian				f	t	2021-11-18 14:33:38+05:30
4	pbkdf2_sha256$260000$pQ5kIu1gNz7jiD6Pg3UJ0P$D0+0lvhoFxa+IFwQjnaWSi0GLaQXw4b8vugvrdE5pY8=	2021-12-02 09:47:29.394012+05:30	f	member1				f	t	2021-11-18 14:35:54+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
2	3	1
3	4	2
4	5	2
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: catalog_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_author (id, first_name, last_name, date_of_birth, date_of_death) FROM stdin;
3	mdileep	kumar	2018-10-01	2026-07-21
1	bal reddy	kalikiri	2018-10-01	2022-08-29
5	Raghava	mvd	2018-10-01	2022-11-06
\.


--
-- Data for Name: catalog_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_book (id, title, summary, isbn, author_id, language_id) FROM stdin;
6	messageapp	message app developed by delhi babu	1234567890128	3	1
7	remc	remc by delhi babu	1234567890129	3	2
3	java	java by balu	1234567890125	1	2
8	stock market	always in stocks	1234567890130	5	2
5	donga nayalu	veedu pedda donga	1234567890127	5	1
2	how to be cunning	cunning fellow raghava	1234567890124	5	2
4	HTML	HTML balu	1234567890126	1	3
1	python	python written by balreddy	1234567890187	1	1
\.


--
-- Data for Name: catalog_book_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_book_genre (id, book_id, genre_id) FROM stdin;
2	2	2
3	3	3
5	5	3
6	6	3
7	7	3
9	8	2
10	4	6
11	1	6
\.


--
-- Data for Name: catalog_bookinstance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_bookinstance (id, imprint, due_back, status, book_id, borrower_id) FROM stdin;
6e64ee93-d6dd-4be3-a380-bd1a527b1052	remcapp	2021-12-02	m	7	\N
971cc046-adcb-41b5-9789-dc0b60151c97	message	2022-01-14	a	6	\N
e71ccdf2-e082-4cee-a32b-328b186246e3	stocks	2021-11-24	a	8	5
e5d475c4-5824-42ca-90f6-d2b3b6a6124b	helllo python	\N	m	1	2
c6ae1ba9-0212-4ee6-a5ec-b4b267492347	cunning hello	\N	a	2	\N
8442c51c-732e-41e1-93e5-98a5a0e6ee1a	raghava gadu	\N	r	5	5
8d08cb49-0c01-4188-9f76-98b9f3fdeb3c	java1	2021-12-10	o	3	5
e203f723-daed-456f-a19b-12aac4a9f21e	java2	2021-11-30	o	3	4
fe0d72a0-0d84-4877-bf89-43e5483295a5	python 2	2021-12-21	o	1	4
0e163cdb-e7b2-4fa7-80be-bc5550025add	cunning hello	\N	a	1	\N
\.


--
-- Data for Name: catalog_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_genre (id, name) FROM stdin;
2	horror
3	romance
4	science fiction
5	science
6	technical
\.


--
-- Data for Name: catalog_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_language (id, name) FROM stdin;
1	english
2	telugu
3	french1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-11-17 11:44:42.339699+05:30	1	kalikiri, bal reddy	1	[{"added": {}}]	10	1
2	2021-11-17 11:45:49.3563+05:30	2	raghava mvd	1	[{"added": {}}]	10	1
3	2021-11-17 11:46:01.164658+05:30	3	kumar mdileep	1	[{"added": {}}]	10	1
4	2021-11-17 11:46:24.00986+05:30	1	science fiction	1	[{"added": {}}]	9	1
5	2021-11-17 11:46:31.888404+05:30	2	horror	1	[{"added": {}}]	9	1
6	2021-11-17 11:46:37.42226+05:30	3	romance	1	[{"added": {}}]	9	1
7	2021-11-17 11:46:47.339135+05:30	1	english	1	[{"added": {}}]	11	1
8	2021-11-17 11:46:53.723045+05:30	2	telugu	1	[{"added": {}}]	11	1
9	2021-11-17 11:46:59.399766+05:30	3	french	1	[{"added": {}}]	11	1
10	2021-11-17 11:47:59.365455+05:30	1	python	1	[{"added": {}}]	8	1
11	2021-11-17 11:49:54.945535+05:30	1	python	2	[{"changed": {"fields": ["Language"]}}]	8	1
12	2021-11-17 11:50:39.408235+05:30	2	how to be cunning	1	[{"added": {}}]	8	1
13	2021-11-17 11:52:06.7826+05:30	e5d475c4-5824-42ca-90f6-d2b3b6a6124b	e5d475c4-5824-42ca-90f6-d2b3b6a6124b (python)	1	[{"added": {}}]	7	1
14	2021-11-17 11:52:33.410254+05:30	e5d475c4-5824-42ca-90f6-d2b3b6a6124b	e5d475c4-5824-42ca-90f6-d2b3b6a6124b (python)	2	[{"changed": {"fields": ["Imprint"]}}]	7	1
15	2021-11-17 11:52:53.591668+05:30	c6ae1ba9-0212-4ee6-a5ec-b4b267492347	c6ae1ba9-0212-4ee6-a5ec-b4b267492347 (how to be cunning)	1	[{"added": {}}]	7	1
16	2021-11-17 11:54:38.651313+05:30	3	java	1	[{"added": {}}]	8	1
17	2021-11-17 11:55:00.360045+05:30	4	HTML	1	[{"added": {}}]	8	1
18	2021-11-17 11:55:32.351827+05:30	5	donga nayalu	1	[{"added": {}}]	8	1
19	2021-11-17 11:56:11.329332+05:30	6	messageapp	1	[{"added": {}}]	8	1
20	2021-11-17 11:57:16.280788+05:30	7	remc	1	[{"added": {}}]	8	1
21	2021-11-17 11:57:44.1091+05:30	fe0d72a0-0d84-4877-bf89-43e5483295a5	fe0d72a0-0d84-4877-bf89-43e5483295a5 (python)	1	[{"added": {}}]	7	1
22	2021-11-17 11:58:03.289934+05:30	8d08cb49-0c01-4188-9f76-98b9f3fdeb3c	8d08cb49-0c01-4188-9f76-98b9f3fdeb3c (java)	1	[{"added": {}}]	7	1
23	2021-11-17 11:58:19.620386+05:30	e203f723-daed-456f-a19b-12aac4a9f21e	e203f723-daed-456f-a19b-12aac4a9f21e (java)	1	[{"added": {}}]	7	1
24	2021-11-17 11:58:36.329256+05:30	8442c51c-732e-41e1-93e5-98a5a0e6ee1a	8442c51c-732e-41e1-93e5-98a5a0e6ee1a (donga nayalu)	1	[{"added": {}}]	7	1
25	2021-11-17 11:58:52.821936+05:30	6e64ee93-d6dd-4be3-a380-bd1a527b1052	6e64ee93-d6dd-4be3-a380-bd1a527b1052 (remc)	1	[{"added": {}}]	7	1
26	2021-11-17 11:59:17.65321+05:30	971cc046-adcb-41b5-9789-dc0b60151c97	971cc046-adcb-41b5-9789-dc0b60151c97 (messageapp)	1	[{"added": {}}]	7	1
27	2021-11-17 12:02:17.112134+05:30	1	kalikiri bal reddy	2	[]	10	1
28	2021-11-17 12:49:48.212223+05:30	fe0d72a0-0d84-4877-bf89-43e5483295a5	fe0d72a0-0d84-4877-bf89-43e5483295a5 (python)	2	[]	7	1
29	2021-11-17 14:53:09.173689+05:30	3	java	2	[]	8	1
30	2021-11-17 14:53:18.113671+05:30	3	java	2	[]	8	1
31	2021-11-17 15:07:39.625314+05:30	2	raghava mvd	2	[{"added": {"name": "book", "object": "stock market"}}]	10	1
32	2021-11-17 16:49:52.596428+05:30	4	science fiction	1	[{"added": {}}]	9	1
33	2021-11-17 16:49:59.502523+05:30	1	science fiction	3		9	1
34	2021-11-17 16:50:08.475894+05:30	5	science	1	[{"added": {}}]	9	1
35	2021-11-17 17:07:55.880871+05:30	e71ccdf2-e082-4cee-a32b-328b186246e3	e71ccdf2-e082-4cee-a32b-328b186246e3 (stock market)	1	[{"added": {}}]	7	1
36	2021-11-18 14:32:44.913295+05:30	1	Library Members	1	[{"added": {}}]	3	1
37	2021-11-18 14:33:38.967186+05:30	2	librarian	1	[{"added": {}}]	4	1
38	2021-11-18 14:34:25.885343+05:30	2	librarian	2	[{"changed": {"fields": ["Groups"]}}]	4	1
39	2021-11-18 14:34:58.290872+05:30	3	librarian1	1	[{"added": {}}]	4	1
40	2021-11-18 14:35:07.860952+05:30	3	librarian1	2	[{"changed": {"fields": ["Groups"]}}]	4	1
41	2021-11-18 14:35:18.625945+05:30	1	Librarian	2	[{"changed": {"fields": ["Name"]}}]	3	1
42	2021-11-18 14:35:36.760959+05:30	2	Library Members	1	[{"added": {}}]	3	1
43	2021-11-18 14:35:55.386064+05:30	4	member1	1	[{"added": {}}]	4	1
44	2021-11-18 14:36:04.965128+05:30	4	member1	2	[{"changed": {"fields": ["Groups"]}}]	4	1
45	2021-11-18 14:36:31.702316+05:30	5	member2	1	[{"added": {}}]	4	1
46	2021-11-18 14:36:39.063757+05:30	5	member2	2	[{"changed": {"fields": ["Groups"]}}]	4	1
47	2021-11-23 12:27:56.646745+05:30	fe0d72a0-0d84-4877-bf89-43e5483295a5	fe0d72a0-0d84-4877-bf89-43e5483295a5 (python)	2	[{"changed": {"fields": ["Borrower"]}}]	7	1
48	2021-11-23 12:28:12.025882+05:30	e71ccdf2-e082-4cee-a32b-328b186246e3	e71ccdf2-e082-4cee-a32b-328b186246e3 (stock market)	2	[{"changed": {"fields": ["Due back", "Borrower"]}}]	7	1
49	2021-11-23 12:28:21.673935+05:30	fe0d72a0-0d84-4877-bf89-43e5483295a5	fe0d72a0-0d84-4877-bf89-43e5483295a5 (python)	2	[{"changed": {"fields": ["Due back"]}}]	7	1
50	2021-11-23 12:28:40.622762+05:30	e203f723-daed-456f-a19b-12aac4a9f21e	e203f723-daed-456f-a19b-12aac4a9f21e (java)	2	[{"changed": {"fields": ["Status", "Due back"]}}]	7	1
51	2021-11-23 12:29:49.75753+05:30	e203f723-daed-456f-a19b-12aac4a9f21e	e203f723-daed-456f-a19b-12aac4a9f21e (java)	2	[{"changed": {"fields": ["Due back"]}}]	7	1
52	2021-11-23 12:30:18.041654+05:30	e203f723-daed-456f-a19b-12aac4a9f21e	e203f723-daed-456f-a19b-12aac4a9f21e (java)	2	[{"changed": {"fields": ["Borrower"]}}]	7	1
53	2021-11-23 12:31:00.550796+05:30	8d08cb49-0c01-4188-9f76-98b9f3fdeb3c	8d08cb49-0c01-4188-9f76-98b9f3fdeb3c (java)	2	[{"changed": {"fields": ["Status", "Borrower"]}}]	7	1
54	2021-11-23 12:31:14.869475+05:30	e5d475c4-5824-42ca-90f6-d2b3b6a6124b	e5d475c4-5824-42ca-90f6-d2b3b6a6124b (python)	2	[{"changed": {"fields": ["Due back", "Borrower"]}}]	7	1
55	2021-11-23 12:31:42.284676+05:30	c6ae1ba9-0212-4ee6-a5ec-b4b267492347	c6ae1ba9-0212-4ee6-a5ec-b4b267492347 (how to be cunning)	2	[{"changed": {"fields": ["Due back"]}}]	7	1
56	2021-11-23 12:32:04.787758+05:30	8442c51c-732e-41e1-93e5-98a5a0e6ee1a	8442c51c-732e-41e1-93e5-98a5a0e6ee1a (donga nayalu)	2	[{"changed": {"fields": ["Status", "Due back", "Borrower"]}}]	7	1
57	2021-11-23 14:40:09.05545+05:30	e203f723-daed-456f-a19b-12aac4a9f21e	e203f723-daed-456f-a19b-12aac4a9f21e (java)	2	[{"changed": {"fields": ["Due back"]}}]	7	1
58	2021-11-23 14:53:36.289117+05:30	1	Librarian	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
59	2021-11-23 16:19:32.314564+05:30	fe0d72a0-0d84-4877-bf89-43e5483295a5	fe0d72a0-0d84-4877-bf89-43e5483295a5 (python)	2	[{"changed": {"fields": ["Status", "Due back"]}}]	7	1
60	2021-11-30 14:43:13.105123+05:30	8	stock market	2	[{"changed": {"fields": ["Author", "Genre"]}}]	8	1
61	2021-11-30 14:43:21.602626+05:30	5	donga nayalu	2	[{"changed": {"fields": ["Author"]}}]	8	1
62	2021-11-30 14:43:29.176724+05:30	2	how to be cunning	2	[{"changed": {"fields": ["Author"]}}]	8	1
63	2021-11-30 14:43:44.450218+05:30	6	technical	1	[{"added": {}}]	9	1
64	2021-11-30 14:43:47.262401+05:30	4	HTML	2	[{"changed": {"fields": ["Genre"]}}]	8	1
65	2021-11-30 14:43:56.487787+05:30	1	python	2	[{"changed": {"fields": ["Genre"]}}]	8	1
66	2021-12-01 11:43:02.506027+05:30	7	dev santosh	1	[{"added": {}}]	10	1
67	2021-12-01 11:43:25.586002+05:30	8	dev santosh	1	[{"added": {}}]	10	1
68	2021-12-01 11:44:05.541588+05:30	8	dev santosh	3		10	1
69	2021-12-01 11:44:10.985717+05:30	7	dev santosh	3		10	1
70	2021-12-01 11:44:25.732479+05:30	4	tamil	1	[{"added": {}}]	11	1
71	2021-12-01 11:45:04.017196+05:30	5	tamil	1	[{"added": {}}]	11	1
72	2021-12-01 11:45:22.404538+05:30	5	tamil	3		11	1
73	2021-12-01 11:45:22.417145+05:30	4	tamil	3		11	1
74	2021-12-01 11:45:36.600927+05:30	6	tamil	1	[{"added": {}}]	11	1
75	2021-12-01 11:45:55.92404+05:30	7	test	1	[{"added": {}}]	11	1
76	2021-12-01 11:46:14.082557+05:30	7	test	3		11	1
77	2021-12-01 11:46:18.976596+05:30	6	tamil	3		11	1
78	2021-12-01 11:46:40.508036+05:30	3	french1	2	[{"changed": {"fields": ["Name"]}}]	11	1
79	2021-12-01 11:58:47.610854+05:30	0e163cdb-e7b2-4fa7-80be-bc5550025add	0e163cdb-e7b2-4fa7-80be-bc5550025add (python)	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	catalog	bookinstance
8	catalog	book
9	catalog	genre
10	catalog	author
11	catalog	language
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-17 10:37:07.964104+05:30
2	auth	0001_initial	2021-11-17 10:37:08.25901+05:30
3	admin	0001_initial	2021-11-17 10:37:08.33514+05:30
4	admin	0002_logentry_remove_auto_add	2021-11-17 10:37:08.3587+05:30
5	admin	0003_logentry_add_action_flag_choices	2021-11-17 10:37:08.386395+05:30
6	contenttypes	0002_remove_content_type_name	2021-11-17 10:37:08.449985+05:30
7	auth	0002_alter_permission_name_max_length	2021-11-17 10:37:08.477649+05:30
8	auth	0003_alter_user_email_max_length	2021-11-17 10:37:08.503106+05:30
9	auth	0004_alter_user_username_opts	2021-11-17 10:37:08.527584+05:30
10	auth	0005_alter_user_last_login_null	2021-11-17 10:37:08.549824+05:30
11	auth	0006_require_contenttypes_0002	2021-11-17 10:37:08.558224+05:30
12	auth	0007_alter_validators_add_error_messages	2021-11-17 10:37:08.582949+05:30
13	auth	0008_alter_user_username_max_length	2021-11-17 10:37:08.626127+05:30
14	auth	0009_alter_user_last_name_max_length	2021-11-17 10:37:08.649824+05:30
15	auth	0010_alter_group_name_max_length	2021-11-17 10:37:08.68127+05:30
16	auth	0011_update_proxy_permissions	2021-11-17 10:37:08.710253+05:30
17	auth	0012_alter_user_first_name_max_length	2021-11-17 10:37:08.73864+05:30
18	sessions	0001_initial	2021-11-17 10:37:08.792858+05:30
19	catalog	0001_initial	2021-11-17 11:30:50.439069+05:30
20	catalog	0002_language	2021-11-17 11:34:09.148891+05:30
21	catalog	0003_book_language	2021-11-17 11:49:38.254671+05:30
22	catalog	0004_auto_20211123_1221	2021-11-23 12:21:53.870202+05:30
23	catalog	0005_alter_bookinstance_options	2021-11-23 14:31:13.095319+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
yx6d5wv0yvx56kz47tonfe221fsppyo9	.eJxVjMsOgjAUBf-la9NYoLVl6d5vaO6rUh8loeDG-O9CwkK3Z-bMW0VY5iEuVaaYWfXKqMPvhkB3KRvgG5TrqGks85RRb4readWXkeVx3t2_wAB1WN_iw4mJTMLUdHK0EqRl1_kgiEjJggtgPXBKbCySJcGWEgEG0znDzRotyzO-cs2z6s3nC3ecPqQ:1mskmr:qgddLYvvLnCvA0KXuUVCHOi0_U5U5f26-B0-wk9QAm0	2021-12-16 17:32:05.033623+05:30
e3b9z0mmgh3wlsvei2pqbv0y32sl0ldl	eyJudW1fdmlzaXQiOjEwfQ:1mu8HN:zVOCghd-vKGWR0vS9_htl5NBqVK2hu5dlUooEnPItVE	2021-12-20 12:49:17.73715+05:30
uhpz4eq9saghsapcv28l6jthigdt7b2m	.eJxVjDkOgzAUBe_y68iKARNMmZ4zWH9zcBYjYUgT5e4JEg3tm5n3gby-wjuVtEBvTxBwXcawFp1DEujBwmEj5IfmDcgd820yPOVlTmQ2xey0mGESfV5393AwYhn_tXb-Isw2UqwaPTv1WkvbdF6JiKPD1qPrUGIU64gdK9UcGcnbprVSwfcHetI-pA:1mu9jS:V0DhYViQd01aV0IFT3BwraYryjK39FrhYIm34HhNXZc	2021-12-20 14:22:22.744566+05:30
mo7826ewueu4shvg3fh6r691bnmooqkk	eyJudW1fdmlzaXQiOjJ9:1nKb6p:H2c0I7QqnVcVboezD0a3hRmxBhpTsnzusG-FWb8F-Q0	2022-03-03 12:51:47.069276+05:30
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 45, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 4, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: catalog_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_author_id_seq', 8, true);


--
-- Name: catalog_book_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_book_genre_id_seq', 13, true);


--
-- Name: catalog_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_book_id_seq', 10, true);


--
-- Name: catalog_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_genre_id_seq', 6, true);


--
-- Name: catalog_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_language_id_seq', 7, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 79, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: catalog_author catalog_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_author
    ADD CONSTRAINT catalog_author_pkey PRIMARY KEY (id);


--
-- Name: catalog_book_genre catalog_book_genre_book_id_genre_id_d15f6922_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book_genre
    ADD CONSTRAINT catalog_book_genre_book_id_genre_id_d15f6922_uniq UNIQUE (book_id, genre_id);


--
-- Name: catalog_book_genre catalog_book_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book_genre
    ADD CONSTRAINT catalog_book_genre_pkey PRIMARY KEY (id);


--
-- Name: catalog_book catalog_book_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book
    ADD CONSTRAINT catalog_book_isbn_key UNIQUE (isbn);


--
-- Name: catalog_book catalog_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book
    ADD CONSTRAINT catalog_book_pkey PRIMARY KEY (id);


--
-- Name: catalog_bookinstance catalog_bookinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_bookinstance
    ADD CONSTRAINT catalog_bookinstance_pkey PRIMARY KEY (id);


--
-- Name: catalog_genre catalog_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_genre
    ADD CONSTRAINT catalog_genre_pkey PRIMARY KEY (id);


--
-- Name: catalog_language catalog_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_language
    ADD CONSTRAINT catalog_language_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: catalog_book_author_id_b0849980; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_book_author_id_b0849980 ON public.catalog_book USING btree (author_id);


--
-- Name: catalog_book_genre_book_id_e5a77c43; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_book_genre_book_id_e5a77c43 ON public.catalog_book_genre USING btree (book_id);


--
-- Name: catalog_book_genre_genre_id_77d7ffde; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_book_genre_genre_id_77d7ffde ON public.catalog_book_genre USING btree (genre_id);


--
-- Name: catalog_book_isbn_30805834_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_book_isbn_30805834_like ON public.catalog_book USING btree (isbn varchar_pattern_ops);


--
-- Name: catalog_book_language_id_447f859e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_book_language_id_447f859e ON public.catalog_book USING btree (language_id);


--
-- Name: catalog_bookinstance_book_id_69f93415; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_bookinstance_book_id_69f93415 ON public.catalog_bookinstance USING btree (book_id);


--
-- Name: catalog_bookinstance_borrower_id_0d71c37c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_bookinstance_borrower_id_0d71c37c ON public.catalog_bookinstance USING btree (borrower_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_book catalog_book_author_id_b0849980_fk_catalog_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book
    ADD CONSTRAINT catalog_book_author_id_b0849980_fk_catalog_author_id FOREIGN KEY (author_id) REFERENCES public.catalog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_book_genre catalog_book_genre_book_id_e5a77c43_fk_catalog_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book_genre
    ADD CONSTRAINT catalog_book_genre_book_id_e5a77c43_fk_catalog_book_id FOREIGN KEY (book_id) REFERENCES public.catalog_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_book_genre catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book_genre
    ADD CONSTRAINT catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id FOREIGN KEY (genre_id) REFERENCES public.catalog_genre(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_book catalog_book_language_id_447f859e_fk_catalog_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_book
    ADD CONSTRAINT catalog_book_language_id_447f859e_fk_catalog_language_id FOREIGN KEY (language_id) REFERENCES public.catalog_language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_bookinstance catalog_bookinstance_book_id_69f93415_fk_catalog_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_bookinstance
    ADD CONSTRAINT catalog_bookinstance_book_id_69f93415_fk_catalog_book_id FOREIGN KEY (book_id) REFERENCES public.catalog_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_bookinstance catalog_bookinstance_borrower_id_0d71c37c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_bookinstance
    ADD CONSTRAINT catalog_bookinstance_borrower_id_0d71c37c_fk_auth_user_id FOREIGN KEY (borrower_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

