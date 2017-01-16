
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

INSERT INTO users (username,password,email,active) VALUES 
				  ('vicoguim', 'b60ee53c669aa8f5bc723b41b7377f04', 'vicoguim@gmail.com', 1);

INSERT INTO users (username,password,email,active) VALUES 
				  ('lisandro', 'acb9bbaeb22f2c22e0d5dd292c81c7cb', 'lisandro.granville@gmail.com', 1);
