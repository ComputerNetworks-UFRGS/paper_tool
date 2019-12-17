--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

--
-- Name: access_control_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.access_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_control_seq OWNER TO tool;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access_control; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.access_control (
    id integer DEFAULT nextval('public.access_control_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    project_id integer,
    role_id integer NOT NULL
);


ALTER TABLE public.access_control OWNER TO tool;

--
-- Name: papers_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.papers_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_seq OWNER TO tool;

--
-- Name: papers; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.papers (
    id integer DEFAULT nextval('public.papers_seq'::regclass) NOT NULL,
    year integer,
    citations integer,
    title text,
    venue text,
    site text,
    status smallint DEFAULT 1,
    comments text,
    file text,
    rating integer DEFAULT 0,
    for_discussion smallint,
    gray_area smallint,
    same_as integer,
    bibtex text,
    upload_by integer,
    active smallint DEFAULT 1,
    assigned_to integer,
    dl_link text,
    doi text,
    keywords text,
    pdf_link text,
    project_id integer NOT NULL,
    "time" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.papers OWNER TO tool;

--
-- Name: papers_comments_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.papers_comments_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_comments_seq OWNER TO tool;

--
-- Name: papers_comments; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.papers_comments (
    id integer DEFAULT nextval('public.papers_comments_seq'::regclass) NOT NULL,
    comment text,
    "time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer,
    paper_id integer
);


ALTER TABLE public.papers_comments OWNER TO tool;

--
-- Name: papers_taxonomies_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.papers_taxonomies_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_taxonomies_seq OWNER TO tool;

--
-- Name: papers_taxonomies; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.papers_taxonomies (
    id integer DEFAULT nextval('public.papers_taxonomies_seq'::regclass) NOT NULL,
    paper_id integer NOT NULL,
    taxonomy_id integer NOT NULL,
    topic_id integer NOT NULL
);


ALTER TABLE public.papers_taxonomies OWNER TO tool;

--
-- Name: papers_users_answers_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.papers_users_answers_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_users_answers_seq OWNER TO tool;

--
-- Name: papers_users_answers; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.papers_users_answers (
    id integer DEFAULT nextval('public.papers_users_answers_seq'::regclass) NOT NULL,
    answer text,
    "time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    question_id integer,
    user_id integer,
    paper_id integer
);


ALTER TABLE public.papers_users_answers OWNER TO tool;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.permissions (
    name text NOT NULL,
    active smallint DEFAULT 1 NOT NULL,
    is_global smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.permissions OWNER TO tool;

--
-- Name: projects_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.projects_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_seq OWNER TO tool;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.projects (
    id integer DEFAULT nextval('public.projects_seq'::regclass) NOT NULL,
    name text NOT NULL,
    owner integer NOT NULL,
    active smallint DEFAULT 1 NOT NULL,
    "time" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.projects OWNER TO tool;

--
-- Name: questions_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.questions_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_seq OWNER TO tool;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.questions (
    id integer DEFAULT nextval('public.questions_seq'::regclass) NOT NULL,
    question text,
    answer_type smallint DEFAULT 1,
    created_by integer,
    active smallint DEFAULT 1,
    project_id integer NOT NULL,
    "time" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.questions OWNER TO tool;

--
-- Name: roles_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.roles_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_seq OWNER TO tool;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.roles (
    id integer DEFAULT nextval('public.roles_seq'::regclass) NOT NULL,
    active smallint DEFAULT 1 NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.roles OWNER TO tool;

--
-- Name: roles_permissions_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.roles_permissions_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_permissions_seq OWNER TO tool;

--
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.roles_permissions (
    id integer DEFAULT nextval('public.roles_permissions_seq'::regclass) NOT NULL,
    role_id integer NOT NULL,
    permission text NOT NULL
);


ALTER TABLE public.roles_permissions OWNER TO tool;

--
-- Name: taxonomies_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.taxonomies_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxonomies_seq OWNER TO tool;

--
-- Name: taxonomies; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.taxonomies (
    id integer DEFAULT nextval('public.taxonomies_seq'::regclass) NOT NULL,
    name text,
    description text,
    active smallint DEFAULT 1,
    created_by integer,
    project_id integer NOT NULL
);


ALTER TABLE public.taxonomies OWNER TO tool;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.tickets (
    code character(16) NOT NULL,
    type smallint NOT NULL,
    email text NOT NULL,
    expiration timestamp without time zone NOT NULL,
    used smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.tickets OWNER TO tool;

--
-- Name: tickets_projects; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.tickets_projects (
    code character(16) NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.tickets_projects OWNER TO tool;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_seq OWNER TO tool;

--
-- Name: users; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_seq'::regclass) NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    active smallint DEFAULT 1,
    name text NOT NULL,
    confirmed smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO tool;

--
-- Name: users_log_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE public.users_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_log_seq OWNER TO tool;

--
-- Name: users_log; Type: TABLE; Schema: public; Owner: tool
--

CREATE TABLE public.users_log (
    id integer DEFAULT nextval('public.users_log_seq'::regclass) NOT NULL,
    user_id integer,
    date_hour timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_agent text
);


ALTER TABLE public.users_log OWNER TO tool;


--
-- Data for Name: access_control; Type: TABLE DATA; Schema: public; Owner: tool
--

INSERT INTO public.access_control(id, user_id, project_id, role_id) VALUES(1, 1, null, 1);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: tool
--

INSERT INTO public.permissions(name, active, is_global) VALUES('paper_view', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_add', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_rate', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_add_comment', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_view_comments', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_delete', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_assign_user', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_view_taxonomy', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_edit_taxonomy', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_view_answers', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('paper_edit_answers', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('project_view', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('taxonomy_add', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('taxonomy_edit', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('taxonomy_delete', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('g_project_view', 1, 1);
INSERT INTO public.permissions(name, active, is_global) VALUES('g_user_edit', 1, 1);
INSERT INTO public.permissions(name, active, is_global) VALUES('g_user_delete', 1, 1);
INSERT INTO public.permissions(name, active, is_global) VALUES('g_project_add', 1, 1);
INSERT INTO public.permissions(name, active, is_global) VALUES('g_user_add', 1, 1);
INSERT INTO public.permissions(name, active, is_global) VALUES('g_user_view', 1, 1);
INSERT INTO public.permissions(name, active, is_global) VALUES('g_user_reset_password', 1, 1);
INSERT INTO public.permissions(name, active, is_global) VALUES('project_edit_users', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('project_delete', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('project_edit_questions', 1, 0);
INSERT INTO public.permissions(name, active, is_global) VALUES('project_answer_questions', 1, 0);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: tool
--

INSERT INTO public.roles (id, active, name) VALUES(1, 1, 'Admin');
INSERT INTO public.roles (id, active, name) VALUES(2, 1, 'Project owner');
INSERT INTO public.roles (id, active, name) VALUES(3, 1, 'Project admin');
INSERT INTO public.roles (id, active, name) VALUES(4, 1, 'Project collaborator');


--
-- Data for Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: tool
--

INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(2, 1, 'g_user_add');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(3, 1, 'g_user_view');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(4, 1, 'g_user_edit');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(5, 1, 'g_user_delete');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(6, 1, 'g_user_reset_password');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(7, 1, 'g_project_add');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(8, 1, 'g_project_view');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(9, 2, 'paper_view');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(10, 2, 'paper_add');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(11, 2, 'paper_rate');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(12, 2, 'paper_add_comment');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(13, 2, 'paper_view_comments');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(14, 2, 'paper_delete');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(15, 2, 'paper_assign_user');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(16, 2, 'paper_view_taxonomy');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(17, 2, 'paper_edit_taxonomy');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(18, 2, 'paper_view_answers');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(19, 2, 'paper_edit_answers');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(20, 2, 'project_view');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(21, 2, 'taxonomy_add');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(22, 2, 'taxonomy_edit');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(23, 2, 'taxonomy_delete');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(24, 2, 'project_edit_users');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(26, 3, 'paper_view');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(27, 3, 'paper_add');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(28, 3, 'paper_rate');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(29, 3, 'paper_add_comment');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(30, 3, 'paper_view_comments');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(31, 3, 'paper_delete');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(32, 3, 'paper_assign_user');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(33, 3, 'paper_view_taxonomy');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(34, 3, 'paper_edit_taxonomy');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(35, 3, 'paper_view_answers');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(36, 3, 'paper_edit_answers');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(37, 3, 'project_view');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(38, 3, 'taxonomy_add');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(39, 3, 'taxonomy_edit');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(40, 3, 'taxonomy_delete');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(41, 3, 'project_edit_users');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(42, 4, 'paper_view');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(43, 4, 'paper_add');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(44, 4, 'paper_rate');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(45, 4, 'paper_add_comment');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(46, 4, 'paper_view_comments');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(47, 4, 'paper_delete');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(48, 4, 'paper_assign_user');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(50, 4, 'paper_edit_taxonomy');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(51, 4, 'paper_view_answers');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(52, 4, 'paper_edit_answers');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(53, 4, 'project_view');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(55, 4, 'taxonomy_edit');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(56, 4, 'taxonomy_delete');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(57, 2, 'project_edit_questions');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(59, 2, 'project_answer_questions');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(60, 3, 'project_answer_questions');
INSERT INTO public.roles_permissions (id, role_id, permission) VALUES(61, 4, 'project_answer_questions');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tool
--

INSERT INTO public.users (id, username, password, email, active, name, confirmed) VALUES(1, 'admin', 'a1debe4d85ce0ffd022b9f4066c8d8ec', 'admin@localhost', 1, 'Admininstrator', 1); --password is "admin_"


--
-- Name: access_control_seq; Type: SEQUENCE SET; Schema: public; Owner: tool
--

SELECT pg_catalog.setval('public.access_control_seq', 1, true);


--
-- Name: roles_permissions_seq; Type: SEQUENCE SET; Schema: public; Owner: tool
--

SELECT pg_catalog.setval('public.roles_permissions_seq', 61, true);


--
-- Name: roles_seq; Type: SEQUENCE SET; Schema: public; Owner: tool
--

SELECT pg_catalog.setval('public.roles_seq', 4, true);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: tool
--

SELECT pg_catalog.setval('public.users_seq', 1, true);


--
-- Name: access_control access_control_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.access_control
    ADD CONSTRAINT access_control_pkey PRIMARY KEY (id);


--
-- Name: papers_comments papers_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_comments
    ADD CONSTRAINT papers_comments_pkey PRIMARY KEY (id);


--
-- Name: papers papers_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (id);


--
-- Name: papers_taxonomies papers_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_taxonomies
    ADD CONSTRAINT papers_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: papers_users_answers papers_users_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_users_answers
    ADD CONSTRAINT papers_users_answers_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (name);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: roles_permissions roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT roles_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: taxonomies taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.taxonomies
    ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pk; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pk PRIMARY KEY (code);


--
-- Name: tickets_projects tickets_projects_pk; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.tickets_projects
    ADD CONSTRAINT tickets_projects_pk PRIMARY KEY (code, project_id);


--
-- Name: users_log users_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.users_log
    ADD CONSTRAINT users_log_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: papers_comments paper_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_comments
    ADD CONSTRAINT paper_fkey FOREIGN KEY (paper_id) REFERENCES public.papers(id);


--
-- Name: papers_taxonomies paper_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_taxonomies
    ADD CONSTRAINT paper_fkey FOREIGN KEY (paper_id) REFERENCES public.papers(id);


--
-- Name: papers_users_answers paper_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_users_answers
    ADD CONSTRAINT paper_fkey FOREIGN KEY (paper_id) REFERENCES public.papers(id);


--
-- Name: roles_permissions permissions_roles_permissions_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT permissions_roles_permissions_fk1 FOREIGN KEY (permission) REFERENCES public.permissions(name);


--
-- Name: access_control projects_access_control_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.access_control
    ADD CONSTRAINT projects_access_control_fk1 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: papers projects_papers_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT projects_papers_fk1 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: questions projects_questions_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT projects_questions_fk1 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: taxonomies projects_taxonomies_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.taxonomies
    ADD CONSTRAINT projects_taxonomies_fk1 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: papers_users_answers question_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_users_answers
    ADD CONSTRAINT question_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: access_control roles_access_control_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.access_control
    ADD CONSTRAINT roles_access_control_fk1 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: roles_permissions roles_roles_permissions_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT roles_roles_permissions_fk1 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: papers_taxonomies taxonomy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_taxonomies
    ADD CONSTRAINT taxonomy_fkey FOREIGN KEY (taxonomy_id) REFERENCES public.taxonomies(id);


--
-- Name: tickets_projects tickets_projects_projects_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.tickets_projects
    ADD CONSTRAINT tickets_projects_projects_project_id_fk FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tickets_projects tickets_projects_tickets_code_fk; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.tickets_projects
    ADD CONSTRAINT tickets_projects_tickets_code_fk FOREIGN KEY (code) REFERENCES public.tickets(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: papers user_assigned_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT user_assigned_fkey FOREIGN KEY (assigned_to) REFERENCES public.users(id);


--
-- Name: papers user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT user_fkey FOREIGN KEY (upload_by) REFERENCES public.users(id);


--
-- Name: papers_comments user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_comments
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: taxonomies user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.taxonomies
    ADD CONSTRAINT user_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: questions user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT user_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: papers_users_answers user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.papers_users_answers
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_log user_log_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.users_log
    ADD CONSTRAINT user_log_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: access_control users_access_control_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.access_control
    ADD CONSTRAINT users_access_control_fk1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: projects users_projects_fk1; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT users_projects_fk1 FOREIGN KEY (owner) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

