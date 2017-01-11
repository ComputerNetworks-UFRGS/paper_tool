
create sequence users_seq;
create table users (
    id integer DEFAULT nextval('users_seq'::regclass) NOT NULL,
    username text,
    password text,
    email text,
    active smallint DEFAULT 1
);

ALTER TABLE public.users OWNER TO tool;
ALTER TABLE ONLY users ADD CONSTRAINT users_pkey PRIMARY KEY (id);

INSERT INTO users (username,password,email,active) VALUES 
				  ('admin', '704b037a97fa9b25522b7c014c300f8a', 'vicoguim@gmail.com', 1);

