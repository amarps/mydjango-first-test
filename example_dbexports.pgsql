--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blogs_analytics; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.blogs_analytics (
    id integer NOT NULL,
    who_visit character varying(1) NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    time_visited double precision NOT NULL,
    updated integer NOT NULL,
    last_visited timestamp with time zone NOT NULL,
    "like" integer NOT NULL,
    dislike integer NOT NULL,
    num_comment integer NOT NULL,
    num_visited integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.blogs_analytics OWNER TO admin;

--
-- Name: blogs_analytics_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.blogs_analytics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_analytics_id_seq OWNER TO admin;

--
-- Name: blogs_analytics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.blogs_analytics_id_seq OWNED BY public.blogs_analytics.id;


--
-- Name: blogs_comment; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.blogs_comment (
    id integer NOT NULL,
    text text NOT NULL,
    created_date timestamp with time zone NOT NULL,
    published_date timestamp with time zone,
    author_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.blogs_comment OWNER TO admin;

--
-- Name: blogs_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.blogs_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_comment_id_seq OWNER TO admin;

--
-- Name: blogs_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.blogs_comment_id_seq OWNED BY public.blogs_comment.id;


--
-- Name: blogs_nationality; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.blogs_nationality (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.blogs_nationality OWNER TO admin;

--
-- Name: blogs_nationality_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.blogs_nationality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_nationality_id_seq OWNER TO admin;

--
-- Name: blogs_nationality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.blogs_nationality_id_seq OWNED BY public.blogs_nationality.id;


--
-- Name: blogs_person; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.blogs_person (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    nationality_id integer NOT NULL
);


ALTER TABLE public.blogs_person OWNER TO admin;

--
-- Name: blogs_person_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.blogs_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_person_id_seq OWNER TO admin;

--
-- Name: blogs_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.blogs_person_id_seq OWNED BY public.blogs_person.id;


--
-- Name: blogs_post; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.blogs_post (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    categories character varying(1) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    published_date timestamp with time zone,
    author_id integer NOT NULL
);


ALTER TABLE public.blogs_post OWNER TO admin;

--
-- Name: blogs_post_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.blogs_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_post_id_seq OWNER TO admin;

--
-- Name: blogs_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.blogs_post_id_seq OWNED BY public.blogs_post.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blogs_analytics id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_analytics ALTER COLUMN id SET DEFAULT nextval('public.blogs_analytics_id_seq'::regclass);


--
-- Name: blogs_comment id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_comment ALTER COLUMN id SET DEFAULT nextval('public.blogs_comment_id_seq'::regclass);


--
-- Name: blogs_nationality id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_nationality ALTER COLUMN id SET DEFAULT nextval('public.blogs_nationality_id_seq'::regclass);


--
-- Name: blogs_person id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_person ALTER COLUMN id SET DEFAULT nextval('public.blogs_person_id_seq'::regclass);


--
-- Name: blogs_post id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_post ALTER COLUMN id SET DEFAULT nextval('public.blogs_post_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
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
25	Can add post	7	add_post
26	Can change post	7	change_post
27	Can delete post	7	delete_post
28	Can view post	7	view_post
29	Can add comment	8	add_comment
30	Can change comment	8	change_comment
31	Can delete comment	8	delete_comment
32	Can view comment	8	view_comment
33	Can add analytics	9	add_analytics
34	Can change analytics	9	change_analytics
35	Can delete analytics	9	delete_analytics
36	Can view analytics	9	view_analytics
37	Can add nationality	10	add_nationality
38	Can change nationality	10	change_nationality
39	Can delete nationality	10	delete_nationality
40	Can view nationality	10	view_nationality
41	Can add person	11	add_person
42	Can change person	11	change_person
43	Can delete person	11	delete_person
44	Can view person	11	view_person
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$M7vsRfHbrym3$JAKoX8o6smNhpoJxyZS5ezd8LVNBBJFIAkfTQ0RCIEU=	2019-05-20 22:08:44.280692+07	t	admin			admin@admin.admin	t	t	2019-05-20 22:08:08.473471+07
2	pbkdf2_sha256$150000$QQ7zpNyDvs9L$kIz/HbXHeANIUjGxfRmaXWwzuGjwjX9JVL7EWy81PUw=	2019-05-20 23:35:34.076516+07	f	user			user@user.user	f	t	2019-05-20 23:35:15.217341+07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blogs_analytics; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.blogs_analytics (id, who_visit, last_updated, time_visited, updated, last_visited, "like", dislike, num_comment, num_visited, post_id) FROM stdin;
9		2019-05-20 23:33:46.85479+07	450	0	2019-05-20 23:34:29.407672+07	2	0	0	6	12
10		2019-05-20 23:36:28.134736+07	225	0	2019-05-20 23:36:40.412843+07	0	1	0	3	13
11		2019-05-20 23:38:17.177254+07	150	0	2019-05-20 23:39:17.967439+07	1	0	0	2	14
12		2019-05-20 23:39:58.155596+07	75	0	2019-05-20 23:39:58.221735+07	0	0	0	1	15
13		2019-05-20 23:40:57.01382+07	75	0	2019-05-20 23:40:57.071695+07	0	0	0	1	16
14		2019-05-20 23:42:11.812345+07	75	0	2019-05-20 23:42:11.879036+07	0	0	0	1	17
15		2019-05-20 23:47:25.717537+07	75	0	2019-05-20 23:47:25.814327+07	0	0	0	1	18
2		2019-05-20 22:11:18.699185+07	1575	0	2019-05-20 22:38:33.590829+07	3	2	0	21	5
16		2019-05-20 23:47:45.500584+07	75	0	2019-05-20 23:47:45.588892+07	0	0	0	1	19
3		2019-05-20 23:11:35.303429+07	300	0	2019-05-20 23:11:45.453268+07	0	0	0	4	6
17		2019-05-20 23:48:00.056738+07	75	0	2019-05-20 23:48:00.113961+07	0	0	0	1	20
18		2019-05-20 23:48:19.318259+07	75	0	2019-05-20 23:48:19.481902+07	0	0	0	1	21
4		2019-05-20 23:13:57.260484+07	300	0	2019-05-20 23:14:03.380971+07	0	0	0	4	7
19		2019-05-20 23:48:32.723698+07	75	0	2019-05-20 23:48:32.841308+07	0	0	0	1	22
20		2019-05-20 23:48:49.715701+07	75	0	2019-05-20 23:48:49.858706+07	0	0	0	1	23
21		2019-05-20 23:49:11.882025+07	75	0	2019-05-20 23:49:11.972564+07	0	0	0	1	24
6		2019-05-20 23:16:10.690751+07	150	0	2019-05-20 23:16:48.604563+07	1	0	0	2	9
22		2019-05-20 23:49:37.363802+07	75	0	2019-05-20 23:49:37.44448+07	0	0	0	1	25
23		2019-05-20 23:54:28.562071+07	75	0	2019-05-20 23:54:28.685957+07	0	0	0	1	26
7		2019-05-20 23:31:31.734644+07	225	0	2019-05-20 23:31:45.601516+07	1	1	0	3	10
24		2019-05-20 23:54:42.742529+07	75	0	2019-05-20 23:54:42.874565+07	0	0	0	1	27
25		2019-05-20 23:54:56.468773+07	75	0	2019-05-20 23:54:56.532733+07	0	0	0	1	28
8		2019-05-20 23:32:32.751752+07	225	0	2019-05-20 23:32:48.749658+07	1	0	0	3	11
26		2019-05-20 23:55:26.236731+07	75	0	2019-05-20 23:55:26.315492+07	0	0	0	1	29
27		2019-05-20 23:55:38.755638+07	75	0	2019-05-20 23:55:38.820427+07	0	0	0	1	30
28		2019-05-20 23:56:14.444647+07	75	0	2019-05-20 23:56:14.500023+07	0	0	0	1	31
29		2019-05-20 23:56:27.695259+07	75	0	2019-05-20 23:56:27.753515+07	0	0	0	1	32
31		2019-05-20 23:57:12.188103+07	75	0	2019-05-20 23:57:12.305412+07	0	0	0	1	34
32		2019-05-20 23:57:32.477453+07	75	0	2019-05-20 23:57:32.555182+07	0	0	0	1	35
5		2019-05-20 23:14:43.344064+07	600	0	2019-05-21 01:35:00.70093+07	0	1	0	8	8
30		2019-05-20 23:56:49.867927+07	150	0	2019-05-21 19:06:50.998195+07	0	0	0	2	33
33		2019-05-20 23:58:05.618655+07	225	0	2019-05-21 19:22:42.161858+07	1	0	0	3	36
34		2019-05-20 23:58:21.802436+07	150	0	2019-05-21 21:13:12.50693+07	0	0	0	2	37
\.


--
-- Data for Name: blogs_comment; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.blogs_comment (id, text, created_date, published_date, author_id, post_id) FROM stdin;
\.


--
-- Data for Name: blogs_nationality; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.blogs_nationality (id, name) FROM stdin;
1	afganistan
2	algeria
3	andorra
4	angola
5	argentina
6	australia
7	austria
8	bolivia
9	brazil
10	bulgaria
\.


--
-- Data for Name: blogs_person; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.blogs_person (id, name, nationality_id) FROM stdin;
1	jhon	2
2	jhin	5
3	jhun	7
4	doew	3
5	udi	10
6	dodo	5
7	bodag	6
8	meow	8
9	gudag	10
10	mimi	5
11	mona	1
12	moni	3
13	monu	5
\.


--
-- Data for Name: blogs_post; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.blogs_post (id, title, text, categories, created_date, published_date, author_id) FROM stdin;
11	Dragon Ball Super: Broly	The latest in the long line of films based off of the Dragon Ball series, Dragon Ball Super: Broly has already accrued quite a few accolades leading up to its western release and is certain to be among the best new anime of 2019.\r\n\r\nBefore the events of the main series, the Saiyan home planet of Vegeta was completely annihilated by Frieza. Of the entire population, only three Saiyan children were spared from its destruction: The low-class Goku, the prince Vegeta, and the barbaric Broly.\r\n\r\nMany years later, the three are reunited on Earth, though it proves anything but friendly. It isn’t long before Broly has gone berserk, leaving Goku and Vegeta to team up and stop the monster before he lays their home planet to waste.\r\n\r\nFrom what has already been said about the film, fans know they are in for some of the most well-animated fight scenes in the series to date. That said, there’s also more than enough spectacle to draw in newer fans, making it an experience that any fan of anime should be psyched for.	F	2019-05-20 23:32:32.647081+07	2019-05-20 23:32:32.648737+07	1
12	One Punch Man	While the production studio Madhouse may not be behind the series’ second season, there’s still plenty to be excited about from the return of anime’s greatest one hit wonder, One Punch Man.\r\n\r\nFollowing the events of the first season, Saitama and his cybernetic pupil Genos are still hard at work climbing the hero ranking ladder. It is still unknown that Saitama saved the world from destruction – let alone that he may be the world’s most powerful hero – and so he continues his daily heroics uninterrupted.\r\n\r\nUnfortunately, a new threat has emerged for him to conquer. A hero hunter, intent on becoming an unbeatable monster, has been sighted taking down heroes left and right. There’s no telling how many he’ll leave in his wake before reaching Saitama, but the cue-balled crusher is more than ready for a worthy opponent.\r\n\r\nThe season currently has an Apr. 2019 release window, and given the first season’s availability on several platforms over the years, there’ll likely be no shortage of options for legal streaming come its release.	F	2019-05-20 23:33:46.798998+07	2019-05-20 23:33:46.800797+07	1
14	Kakegurui	The tale of the gambling-crazed enigma named Yumeko Jabami continues with its second season, boasting stakes and challenges all more devious than the last.\r\n\r\nAfter the events of the first season, Yumeko and her friends draw the attention of student council secretary Sayaka Igarashi. She invites Yumeko to take on a tower filled to the brim with eccentric challengers, with each round of games judged by the student council president Momobami.\r\n\r\nObsessed with finding new ways to gamble and eager to challenge Momobami once again, Yumeko accepts and begins her climb toward another confrontation with the only person as recklessly committed to gambling as she is.\r\n\r\nSlated for a Jan. 8, 2019 release in Japan, the series is still licensed by Netflix and will likely see a release sometime later in the year. It’ll also once again feature animation work from Mappa, ensuring there will still be plenty of enticing visuals to go along with the high stakes drama.	F	2019-05-20 23:38:17.135067+07	2019-05-20 23:38:17.137814+07	2
15	Attack On Titan	Where the third season of Attack on Titan sought to take the series in some interesting new directions, season four appears set to return to its high stakes battles with titans.\r\n\r\nFollowing a clash with the hidden royal family and their forces, Eren has finally gained the power he needs to seal the hole in the wall near his hometown of Shiganshina.\r\n\r\nMore importantly, though, is that he can finally reach his father’s basement, which hides a clue as to why humanity must face the titans in the first place.\r\n\r\nWith his friends and allies in the scouting regiment behind him, he sets out to reclaim the territory for humanity and uncover his father’s secrets, all the while preparing for a confrontation with the ones responsible for his home town’s destruction.\r\n\r\nIt’s sure to be a season full of revelations and high stakes battles, especially after the forbidding teaser found during the credits of season three’s finale. Fans can look forward to seeing everything the next season has to offer when it airs in Apr. 2019.	F	2019-05-20 23:39:58.112044+07	2019-05-20 23:39:58.113679+07	2
16	Code Geass: Lelouch of the Re;surrection	A new addition to the beloved series’ story, Code Geass: Lelouch of the Re;surrection drops viewers into a new conflict that arises two years after the completion of the Zero Requiem and the death of Lelouch vi Britannia.\r\n\r\nFollowing a brief period of peace, Nunnally and Suzaku – now acting as Zero – face a new threat in the form of the Zilkhstan Kingdom. Eager to fill the void left by Lelouch’s death and take control of the world, they stage an all out attack upon the world with Knightmares and Geass alike at their disposal.\r\n\r\nWith no other choice, Suzaku once again returns to the fray, desperate to maintain the peace his friend sacrificed his life for. Behind the scenes though, other forces are at work that may see a new plan enacted by his deceased comrade.\r\n\r\nThough not ideal for some who enjoyed the series’ original ending, it’s undeniably exciting that Code Geass’ story will be continued in earnest. The film is currently slated for a Feb. 2019 release in Japan, and Funimation has already licensed it for a western release sometime later this year.	F	2019-05-20 23:40:56.729819+07	2019-05-20 23:40:56.733369+07	2
17	Mob Psycho 100	A satirical tale of self acceptance mixed with over the top psychic-powered action, Mob Psycho 100 quickly became a fan favorite when it premiered in 2016. As such, it’s little surprise that a second season is nearly upon us, touted to include just as much excitement, comedy and self discovery as the first.\r\n\r\nAfter surviving the events of the first season, Mob finds his life has settled into a peaceful routine. He goes to school, spends time with his friends and family and works his part time job as an exorcist with his master Reigen.\r\n\r\nBefore long though, new forces emerge that will push his powers to their very limit, so much so that his mind may snap under the pressure of trying to control them for the good of those he cares about.\r\n\r\nIt’s currently slated for a Jan. 6 premiere on Crunchyroll too, so fans don’t have long to wait before they can dive back into the fun and insanity.	F	2019-05-20 23:42:11.775282+07	2019-05-20 23:42:11.777798+07	2
5	Abaddon	As you see, on output tuples are always enclosed in parentheses, so that nested tuples are interpreted correctly; they may be input with or without surrounding parentheses, although often parentheses are necessary anyway (if the tuple is part of a larger expression). It is not possible to assign to the individual items of a tuple, however it is possible to create tuples which contain mutable objects, such as lists.\r\n\r\nThough tuples may seem similar to lists, they are often used in different situations and for different purposes. Tuples are immutable, and usually contain a heterogeneous sequence of elements that are accessed via unpacking (see later in this section) or indexing (or even by attribute in the case of namedtuples). Lists are mutable, and their elements are usually homogeneous and are accessed by iterating over the list.\r\n\r\nA special problem is the construction of tuples containing 0 or 1 items: the syntax has some extra quirks to accommodate these. Empty tuples are constructed by an empty pair of parentheses; a tuple with one item is constructed by following a value with a comma (it is not sufficient to enclose a single value in parentheses). Ugly, but effective. For example:\r\n>>>\r\n\r\n>>> empty = ()\r\n>>> singleton = 'hello',    # <-- note trailing comma\r\n>>> len(empty)\r\n0\r\n>>> len(singleton)\r\n1\r\n>>> singleton\r\n('hello',)\r\n\r\nThe statement t = 12345, 54321, 'hello!' is an example of tuple packing: the values 12345, 54321 and 'hello!' are packed together in a tuple. The reverse operation is also possible:\r\n>>>\r\n\r\n>>> x, y, z = t\r\n\r\nThis is called, appropriately enough, sequence unpacking and works for any sequence on the right-hand side. Sequence unpacking requires that there are as many variables on the left side of the equals sign as there are elements in the sequence. Note that multiple assignment is really just a combination of tuple packing and sequence unpacking.\r\n5.4. Sets\r\n\r\nPython also includes a data type for sets. A set is an unordered collection with no duplicate elements. Basic uses include membership testing and eliminating duplicate entries. Set objects also support mathematical operations like union, intersection, difference, and symmetric difference.\r\n\r\nCurly braces or the set() function can be used to create sets. Note: to create an empty set you have to use set(), not {}; the latter creates an empty dictionary, a data structure that we discuss in the next section.\r\n\r\nHere is a brief demonstration:	G	2019-05-20 22:11:18.663611+07	2019-05-20 22:11:18.665356+07	1
6	spongebob opening chord	SpongeBob SquarePants Opening Theme\r\n\r\n\r\n\r\nAre you ready kids? "Aye Aye Captain!!"\r\n\r\nI can't hear you?! "AYE AYE CAPTAIN!!"\r\n\r\nOhh...!!\r\n\r\n\r\n\r\n    G                                   G\r\n\r\nWho lives in a pineapple under the sea? "SpongeBob SquarePants!"\r\n\r\n  C                                   C\r\n\r\nAbsorbent and yellow and porous is he "SpongeBob SquarePants!"\r\n\r\n   G                                        G\r\n\r\nIf nautical nonsense be something you wish! "Spongebob Squarepants!"\r\n\r\n     C                                       C\r\n\r\nThen drop on the deck and flop like a fish! "Spongebob Squarepants!" READY?!\r\n\r\nG\r\n\r\nSpongeBob SquarePants!\r\n\r\nG\r\n\r\nSpongeBob SquarePants!\r\n\r\nG\r\n\r\nSpongeBob SquarePants!\r\n\r\nG    C    D     G\r\n\r\nSPONGEBOB SQUAREPANTS! AH AHH AHH AHAHAHAHAHAHAHHH...\r\n\r\n\r\n\r\n\r\n\r\n____________________________________\r\n\r\nFor Melissa, SpongeBob's biggest fan	M	2019-05-20 23:11:35.22447+07	2019-05-20 23:11:35.226801+07	1
7	Zombie Ipsum	Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium. Qui animated corpse, cricket bat max brucks terribilem incessu zomby. The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi eorum defunctis go lum cerebro. Nescio brains an Undead zombies. Sicut malus putrid voodoo horror. Nigh tofth eliv ingdead.	P	2019-05-20 23:13:57.220304+07	2019-05-20 23:13:57.223133+07	1
8	Zombie Ipsum Combo 3	Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium. Qui animated corpse, cricket bat max brucks terribilem incessu zomby. The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi eorum defunctis go lum cerebro. Nescio brains an Undead zombies. Sicut malus putrid voodoo horror. Nigh tofth eliv ingdead.\r\n\r\nCum horribilem walking dead resurgere de crazed sepulcris creaturis, zombie sicut de grave feeding iride et serpens. Pestilentia, shaun ofthe dead scythe animated corpses ipsa screams. Pestilentia est plague haec decaying ambulabat mortuos. Sicut zeder apathetic malus voodoo. Aenean a dolor plan et terror soulless vulnerum contagium accedunt, mortui iam vivam unlife. Qui tardius moveri, brid eof reanimator sed in magna copia sint terribiles undeath legionis. Alii missing oculis aliorum sicut serpere crabs nostram. Putridi braindead odores kill and infect, aere implent left four dead.\r\n\r\nLucio fulci tremor est dark vivos magna. Expansis creepy arm yof darkness ulnis witchcraft missing carnem armis Kirkman Moore and Adlard caeruleum in locis. Romero morbo Congress amarus in auras. Nihil horum sagittis tincidunt, zombie slack-jawed gelida survival portenta. The unleashed virus est, et iam zombie mortui ambulabunt super terram. Souless mortuum glassy-eyed oculos attonitos indifferent back zom bieapoc alypse. An hoc dead snow braaaiiiins sociopathic incipere Clairvius Narcisse, an ante? Is bello mundi z?	P	2019-05-20 23:14:43.279229+07	2019-05-20 23:14:43.280842+07	1
9	My Hero Academia	2019 is shaping up to be a breakout year for anime releases, with everything from the latest shonen sensations to long awaited adaptations of seinin classics. Of what’s already been confirmed, whether it is brand new shows, or returning shows with new seasons, these are the 15 best new anime of 2019 to have on your radar.\r\n\r\nMy Hero Academia had a fantastic year in 2018. Its popularity only grew thanks to a stellar third season, the release of its first feature film My Hero Academia: Two Heroes in theaters worldwide, and a video game adaptation in the form of My Hero: One’s Justice.\r\n\r\nIt look like it’ll keep up that momentum too, with a fourth season confirmed for release in Oct. 2019 in early December. The announcement came with a key visual of series protagonist Izuku “Deku” Midoriya running alongside Mirio “Lemillion” Togata, one of the top three students at UA.\r\n\r\nThough little else has been revealed at this point, the plot points left hanging at the end of season three point toward a new threat emerging to cause havoc and destruction. Midoriya will have to further understand his quirk One for All to stop it, though Mirio and his master may be able to help him along the way.\r\n\r\nStudio Bones will retain their role as the series’ production studio, ensuring fans can look forward to plenty more stellar animation and fight scenes. There’s still plenty of time for newcomers to catch up on the series as well, with seasons one through three available subbed via Crunchyroll and dubbed via Funimation.	F	2019-05-20 23:16:10.618256+07	2019-05-20 23:16:10.619892+07	1
10	The Promised Neverland	Ask anyone who has been keeping up with shonen manga about The Promised Neverland and there’s a good chance they’ll talk your ear off about how long they’ve been looking forward to its anime adaptation.\r\n\r\nSet in a world where humans are secretly farmed as food for demons, the plot focuses on Emma, Ray and Norman, three genius children who uncover their twisted fate through chance.\r\n\r\nUnwilling to accept their deaths, they begin to plot their escape from the facility where they were raised, all the while outwitting the adults in charge of cultivating them for their eventual slaughter.\r\n\r\nEqual parts Hunter X Hunter and Death Note, The Promised Neverland has more brains and creativity than a lot of other anime out there. It’ll be readily available on Crunchyroll starting Jan. 11, 2019 too, making it that much easier to give it a look.	F	2019-05-20 23:31:31.605199+07	2019-05-20 23:31:31.606842+07	1
13	One Piece	15 Best New Anime of 2019 to Have on Your Radar\r\n\r\nBy\r\n\r\nKeenan McCall\r\nPublished on December 27, 2018 | Updated on April 15th, 2019 at 02:28 pm\r\n\r\nHome » Entertainment » 15 Best New Anime of 2019 to Have on Your Radar\r\n\r\n    Share\r\n    Tweet\r\n    Night Mode\r\n\r\n1. My Hero Academia Season 4\r\n\r\nbest new anime 2019\r\n\r\n2019 is shaping up to be a breakout year for anime releases, with everything from the latest shonen sensations to long awaited adaptations of seinin classics. Of what’s already been confirmed, whether it is brand new shows, or returning shows with new seasons, these are the 15 best new anime of 2019 to have on your radar.\r\n\r\nMy Hero Academia had a fantastic year in 2018. Its popularity only grew thanks to a stellar third season, the release of its first feature film My Hero Academia: Two Heroes in theaters worldwide, and a video game adaptation in the form of My Hero: One’s Justice.\r\n\r\nIt look like it’ll keep up that momentum too, with a fourth season confirmed for release in Oct. 2019 in early December. The announcement came with a key visual of series protagonist Izuku “Deku” Midoriya running alongside Mirio “Lemillion” Togata, one of the top three students at UA.\r\n\r\nThough little else has been revealed at this point, the plot points left hanging at the end of season three point toward a new threat emerging to cause havoc and destruction. Midoriya will have to further understand his quirk One for All to stop it, though Mirio and his master may be able to help him along the way.\r\n\r\nStudio Bones will retain their role as the series’ production studio, ensuring fans can look forward to plenty more stellar animation and fight scenes. There’s still plenty of time for newcomers to catch up on the series as well, with seasons one through three available subbed via Crunchyroll and dubbed via Funimation.\r\n2. The Promised Neverland\r\n\r\nbest new anime 2019\r\n\r\nAsk anyone who has been keeping up with shonen manga about The Promised Neverland and there’s a good chance they’ll talk your ear off about how long they’ve been looking forward to its anime adaptation.\r\n\r\nSet in a world where humans are secretly farmed as food for demons, the plot focuses on Emma, Ray and Norman, three genius children who uncover their twisted fate through chance.\r\n\r\nUnwilling to accept their deaths, they begin to plot their escape from the facility where they were raised, all the while outwitting the adults in charge of cultivating them for their eventual slaughter.\r\n\r\nEqual parts Hunter X Hunter and Death Note, The Promised Neverland has more brains and creativity than a lot of other anime out there. It’ll be readily available on Crunchyroll starting Jan. 11, 2019 too, making it that much easier to give it a look.\r\n3. Dragon Ball Super: Broly\r\n\r\nbest new anime 2019\r\n\r\nThe latest in the long line of films based off of the Dragon Ball series, Dragon Ball Super: Broly has already accrued quite a few accolades leading up to its western release and is certain to be among the best new anime of 2019.\r\n\r\nBefore the events of the main series, the Saiyan home planet of Vegeta was completely annihilated by Frieza. Of the entire population, only three Saiyan children were spared from its destruction: The low-class Goku, the prince Vegeta, and the barbaric Broly.\r\n\r\nMany years later, the three are reunited on Earth, though it proves anything but friendly. It isn’t long before Broly has gone berserk, leaving Goku and Vegeta to team up and stop the monster before he lays their home planet to waste.\r\n\r\nFrom what has already been said about the film, fans know they are in for some of the most well-animated fight scenes in the series to date. That said, there’s also more than enough spectacle to draw in newer fans, making it an experience that any fan of anime should be psyched for.\r\n\r\n4. One Punch Man Season 2\r\n\r\nbest new anime 2019\r\n\r\nWhile the production studio Madhouse may not be behind the series’ second season, there’s still plenty to be excited about from the return of anime’s greatest one hit wonder, One Punch Man.\r\n\r\nFollowing the events of the first season, Saitama and his cybernetic pupil Genos are still hard at work climbing the hero ranking ladder. It is still unknown that Saitama saved the world from destruction – let alone that he may be the world’s most powerful hero – and so he continues his daily heroics uninterrupted.\r\n\r\nUnfortunately, a new threat has emerged for him to conquer. A hero hunter, intent on becoming an unbeatable monster, has been sighted taking down heroes left and right. There’s no telling how many he’ll leave in his wake before reaching Saitama, but the cue-balled crusher is more than ready for a worthy opponent.\r\n\r\nThe season currently has an Apr. 2019 release window, and given the first season’s availability on several platforms over the years, there’ll likely be no shortage of options for legal streaming come its release.\r\n5. Dr. Stone\r\n\r\nbest new anime 2019\r\n\r\nAnother recent adaptation of an up and coming Shonen Jump series, Dr. Stone promises to be a novel offering compared to its contemporaries in 2019.\r\n\r\nFollowing a strange flash of life that turns every human on Earth into stone, the young genius Senku awakens to find the world reverted to its primitive, stone age state.\r\n\r\nHumans are no longer at the top of the food chain, and those that have awakened from their stone slumber must make due without the inventions that made them the world’s ruling creature.\r\n\r\nEager to return the world’s populace to normal and uncover what caused it in the first place, he sets about reconstructing every major scientific invention he can with what is available to him.\r\n\r\nBefore long, he discovers that he isn’t the only human on the planet, and that he’ll have more than enough allies in his journey to reclaim mankind’s scientific progress and ensure their survival.\r\n6. Ultraman\r\n\r\nAn adaptation of the latest take on the prolific series, Netflix’s Ultraman follows a young man named Shinjiro after he discovers he is the son of the original Ultraman. Unlike his father however, he can’t freely control Ultraman’s power on his own, having only been born with part of the factor that causes it to trigger.\r\n\r\nAs such, he must don a mechanized suit capable of harnessing his latent abilities, allowing him to take up his father’s mantle and challenge the evil forces that have appeared. With it, he’ll start a new legend and take up the torch from his father, sparking a new Ultraman legend in the process.\r\n\r\nSlated for an Apr. 1, 2019 release on Netflix, the series shows potential as a fresh take on a beloved series a la Devilman Crybaby.\r\n\r\nAcclaimed animation studio Production I.G. is likewise helming the show’s production, and given their experience with 3D animated shows in the past, there’s plenty stacking up in this show’s favor.\r\n\r\n7. One Piece: Stampede\r\n\r\nbest new anime 2019\r\n\r\nAnnounced as a celebratory project in honor of the One Piece anime’s 20th anniversary, One Piece: Stampede already has a fair bit of hype behind it.\r\n\r\nTouted by series creator Eichiro Oda as something that could only be made due to the series’ 20 years in existence, the film has only received one ominous trailer so far. It shows Monkey D. Luffy’s trademark straw hat drifting through the wind, tattered by what could only be another life or death battle on the high seas.\r\n\r\nLittle is known about the film save for its Aug. 5, 2019 release in Japan, but given the show’s growing popularity in the west over the years, it’s safe to assume it’ll see a widespread release shortly after.\r\n\r\nThere’s also plenty of proof that One Piece films can be unique and entertaining anime experiences based on past films like Strong World and Film Gold, so fans and newcomers alike will want to stay tuned for more info on this film as it surfaces.	F	2019-05-20 23:36:27.965748+07	2019-05-20 23:36:27.967661+07	2
18	Cupcake Ipsum	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	P	2019-05-20 23:47:25.615743+07	2019-05-20 23:47:25.617362+07	2
19	bengbeng ipsum	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	P	2019-05-20 23:47:45.479467+07	2019-05-20 23:47:45.481614+07	2
20	nabati ipsum	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	P	2019-05-20 23:47:59.994406+07	2019-05-20 23:47:59.996176+07	2
21	uduk ipsum	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	P	2019-05-20 23:48:19.255629+07	2019-05-20 23:48:19.257542+07	2
22	tea ipsum	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	P	2019-05-20 23:48:32.674861+07	2019-05-20 23:48:32.676684+07	2
23	brownies ipsum	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	P	2019-05-20 23:48:49.622772+07	2019-05-20 23:48:49.625389+07	2
24	milk ipsum	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	P	2019-05-20 23:49:11.836219+07	2019-05-20 23:49:11.838048+07	2
25	pudding ipsum	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	P	2019-05-20 23:49:37.247715+07	2019-05-20 23:49:37.253408+07	2
26	mortal kombat	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	G	2019-05-20 23:54:28.447313+07	2019-05-20 23:54:28.449145+07	2
27	gta	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	G	2019-05-20 23:54:42.697386+07	2019-05-20 23:54:42.69898+07	2
28	skyrim	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	G	2019-05-20 23:54:56.439232+07	2019-05-20 23:54:56.44113+07	2
29	Meepo	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	G	2019-05-20 23:55:26.187409+07	2019-05-20 23:55:26.189323+07	2
30	Ursa	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	G	2019-05-20 23:55:38.727129+07	2019-05-20 23:55:38.729188+07	2
31	harvest moon	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	G	2019-05-20 23:56:14.365535+07	2019-05-20 23:56:14.367145+07	2
32	Team Buddies	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	G	2019-05-20 23:56:27.631871+07	2019-05-20 23:56:27.633595+07	2
33	pepsi man	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	G	2019-05-20 23:56:49.81028+07	2019-05-20 23:56:49.815721+07	2
34	Anji	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	M	2019-05-20 23:57:12.12354+07	2019-05-20 23:57:12.125712+07	2
35	Bruno	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	M	2019-05-20 23:57:32.387882+07	2019-05-20 23:57:32.397442+07	2
36	bieber	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	M	2019-05-20 23:58:05.530538+07	2019-05-20 23:58:05.532494+07	2
37	ed	Fruitcake candy wafer croissant soufflé. Bonbon donut biscuit marshmallow I love. Cookie cookie chocolate cake cupcake cookie. Pastry dessert tiramisu fruitcake carrot cake sweet roll cupcake pastry. I love bonbon pastry sweet roll bear claw cotton candy tart cake chocolate bar. Soufflé wafer jujubes chupa chups marzipan chocolate cake. Lemon drops tiramisu chocolate bar I love bear claw ice cream sweet tart. Jelly dessert I love sweet fruitcake. Cake ice cream gummies dragée dessert apple pie oat cake. Dragée jelly marshmallow cupcake donut candy ice cream. Fruitcake icing cotton candy caramels powder pastry. Gummies halvah apple pie tart bear claw. Chocolate croissant bear claw chocolate bar apple pie carrot cake croissant chupa chups I love. Gummi bears bonbon biscuit sweet roll I love.\r\n\r\nTiramisu croissant sesame snaps apple pie I love. Chocolate chocolate liquorice cheesecake gingerbread fruitcake biscuit jelly beans cake. Jelly beans gummi bears muffin dessert jujubes macaroon. Croissant bonbon bear claw I love carrot cake lollipop dessert caramels gummi bears. Toffee gingerbread soufflé wafer chocolate. Tiramisu halvah jelly-o chocolate cake marzipan gummi bears chocolate cake. Candy brownie halvah liquorice powder carrot cake. I love candy canes tootsie roll tart biscuit muffin bonbon oat cake caramels. Sesame snaps dessert tart macaroon oat cake. Ice cream danish cheesecake donut. Lemon drops lemon drops jelly-o bonbon dessert halvah tart carrot cake. Marzipan candy chocolate ice cream marshmallow I love halvah.\r\n\r\nWafer gingerbread toffee tootsie roll. Sweet roll I love cake halvah wafer halvah. Biscuit I love bear claw pastry I love jelly marshmallow bonbon. Caramels jelly oat cake sweet roll ice cream. Apple pie fruitcake I love. Pastry bear claw chocolate chocolate bar cheesecake powder powder. Ice cream cake jelly oat cake gummi bears cupcake sesame snaps I love. Chupa chups caramels oat cake pastry cake tart dragée. Gummies sweet roll caramels. Sesame snaps pudding cookie. Dessert wafer icing chupa chups topping croissant lemon drops cake donut. Pastry pie croissant topping lollipop I love jelly beans. Sesame snaps muffin I love. Sweet candy dessert cookie.\r\n\r\nBear claw caramels liquorice I love liquorice soufflé. Pastry wafer dessert I love. Donut I love liquorice tart. Cheesecake candy canes chocolate cake topping jelly beans. Caramels jujubes chocolate cake macaroon gummi bears. Marzipan danish pie. Gummi bears I love ice cream topping marzipan I love caramels. Donut I love biscuit jujubes chupa chups apple pie liquorice wafer. Ice cream jelly cake jelly muffin ice cream cake candy canes biscuit. Cupcake cotton candy I love toffee topping carrot cake candy canes I love. Toffee I love I love I love lemon drops. I love I love jelly donut ice cream jelly-o ice cream. Gingerbread jujubes I love gummies cookie liquorice chocolate cake sesame snaps macaroon. Sugar plum bonbon cake cotton candy cotton candy.\r\n\r\nLemon drops lollipop powder cake. Fruitcake topping I love brownie. Sweet roll biscuit I love. Lollipop chupa chups sugar plum tootsie roll ice cream jelly cookie. I love tiramisu dessert tiramisu topping lemon drops brownie gummies oat cake. Wafer danish danish topping cookie candy jelly sugar plum chupa chups. Chocolate cake lemon drops pastry lollipop. Chocolate cake I love cake candy ice cream chocolate cake brownie. Jelly jelly dessert cotton candy cheesecake I love ice cream macaroon. Croissant ice cream oat cake macaroon pastry. Pie candy muffin I love chocolate bar halvah cupcake candy canes. Dessert ice cream wafer cookie. Cupcake tiramisu cake.	M	2019-05-20 23:58:21.763079+07	2019-05-20 23:58:21.764942+07	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	blogs	post
8	blogs	comment
9	blogs	analytics
10	blogs	nationality
11	blogs	person
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-05-20 22:07:37.930913+07
2	auth	0001_initial	2019-05-20 22:07:38.377221+07
3	admin	0001_initial	2019-05-20 22:07:39.124092+07
4	admin	0002_logentry_remove_auto_add	2019-05-20 22:07:39.306576+07
5	admin	0003_logentry_add_action_flag_choices	2019-05-20 22:07:39.413576+07
6	contenttypes	0002_remove_content_type_name	2019-05-20 22:07:39.522305+07
7	auth	0002_alter_permission_name_max_length	2019-05-20 22:07:39.559512+07
8	auth	0003_alter_user_email_max_length	2019-05-20 22:07:39.613398+07
9	auth	0004_alter_user_username_opts	2019-05-20 22:07:39.659414+07
10	auth	0005_alter_user_last_login_null	2019-05-20 22:07:39.705235+07
11	auth	0006_require_contenttypes_0002	2019-05-20 22:07:39.717144+07
12	auth	0007_alter_validators_add_error_messages	2019-05-20 22:07:39.763158+07
13	auth	0008_alter_user_username_max_length	2019-05-20 22:07:39.855024+07
14	auth	0009_alter_user_last_name_max_length	2019-05-20 22:07:39.91583+07
15	auth	0010_alter_group_name_max_length	2019-05-20 22:07:39.964672+07
16	auth	0011_update_proxy_permissions	2019-05-20 22:07:40.016639+07
17	blogs	0001_initial	2019-05-20 22:07:40.400134+07
18	sessions	0001_initial	2019-05-20 22:07:40.71091+07
19	blogs	0002_nationality_person	2019-05-21 19:47:10.012732+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blogs_analytics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.blogs_analytics_id_seq', 34, true);


--
-- Name: blogs_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.blogs_comment_id_seq', 1, false);


--
-- Name: blogs_nationality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.blogs_nationality_id_seq', 10, true);


--
-- Name: blogs_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.blogs_person_id_seq', 13, true);


--
-- Name: blogs_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.blogs_post_id_seq', 37, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blogs_analytics blogs_analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_analytics
    ADD CONSTRAINT blogs_analytics_pkey PRIMARY KEY (id);


--
-- Name: blogs_comment blogs_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_comment
    ADD CONSTRAINT blogs_comment_pkey PRIMARY KEY (id);


--
-- Name: blogs_nationality blogs_nationality_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_nationality
    ADD CONSTRAINT blogs_nationality_pkey PRIMARY KEY (id);


--
-- Name: blogs_person blogs_person_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_person
    ADD CONSTRAINT blogs_person_pkey PRIMARY KEY (id);


--
-- Name: blogs_post blogs_post_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_post
    ADD CONSTRAINT blogs_post_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blogs_analytics_post_id_66cd6fb2; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX blogs_analytics_post_id_66cd6fb2 ON public.blogs_analytics USING btree (post_id);


--
-- Name: blogs_comment_author_id_cf100e65; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX blogs_comment_author_id_cf100e65 ON public.blogs_comment USING btree (author_id);


--
-- Name: blogs_comment_post_id_670c072f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX blogs_comment_post_id_670c072f ON public.blogs_comment USING btree (post_id);


--
-- Name: blogs_person_nationality_id_fc1e848b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX blogs_person_nationality_id_fc1e848b ON public.blogs_person USING btree (nationality_id);


--
-- Name: blogs_post_author_id_c7d05c07; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX blogs_post_author_id_c7d05c07 ON public.blogs_post USING btree (author_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blogs_analytics blogs_analytics_post_id_66cd6fb2_fk_blogs_post_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_analytics
    ADD CONSTRAINT blogs_analytics_post_id_66cd6fb2_fk_blogs_post_id FOREIGN KEY (post_id) REFERENCES public.blogs_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blogs_comment blogs_comment_author_id_cf100e65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_comment
    ADD CONSTRAINT blogs_comment_author_id_cf100e65_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blogs_comment blogs_comment_post_id_670c072f_fk_blogs_post_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_comment
    ADD CONSTRAINT blogs_comment_post_id_670c072f_fk_blogs_post_id FOREIGN KEY (post_id) REFERENCES public.blogs_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blogs_person blogs_person_nationality_id_fc1e848b_fk_blogs_nationality_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_person
    ADD CONSTRAINT blogs_person_nationality_id_fc1e848b_fk_blogs_nationality_id FOREIGN KEY (nationality_id) REFERENCES public.blogs_nationality(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blogs_post blogs_post_author_id_c7d05c07_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blogs_post
    ADD CONSTRAINT blogs_post_author_id_c7d05c07_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

