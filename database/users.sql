--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: tool; Tablespace: 
--

CREATE SEQUENCE users_seq;

CREATE TABLE users (
    id integer DEFAULT nextval('users_seq'::regclass) NOT NULL,
    username text,
    password text,
    email text,
    active smallint DEFAULT 1,
    valid_until timestamp without time zone,
    role_id integer
);


ALTER TABLE public.users OWNER TO tool;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tool
--

INSERT INTO users VALUES (1, 'admin', '704b037a97fa9b25522b7c014c300f8a', 'vicoguim@gmail.com', 1, NULL, 1);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: tool; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tool
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- PostgreSQL database dump complete
--

