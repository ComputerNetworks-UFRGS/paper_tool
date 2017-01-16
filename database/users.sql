
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
-- xururu
INSERT INTO users (username,password,email,active) VALUES 
				  ('vicoguim', 'b60ee53c669aa8f5bc723b41b7377f04', 'vicoguim@gmail.com', 1);
-- l1s4ndr0
INSERT INTO users (username,password,email,active) VALUES 
				  ('lisandro', 'acb9bbaeb22f2c22e0d5dd292c81c7cb', 'lisandro.granville@gmail.com', 1);
-- v4l0cch1
INSERT INTO users (username,password,email,active) VALUES 
				  ('dario', 'af1f188fb79acb08186632f49d36ea87', 'd.valocchi@ucl.ac.uk', 1);				
-- fr4nc3sc0tus4
INSERT INTO users (username,password,email,active) VALUES 
				  ('francesco', '30c4bae96b3898d0031e6d28b7f3b22a', 'francesco.tusa@ucl.ac.uk', 1);
-- m41n1
INSERT INTO users (username,password,email,active) VALUES 
				  ('elisa', '276e9c52fb5f84b8b3eb9f216522e782', 'e.maini@ucl.ac.uk', 1);
-- g4l1s
INSERT INTO users (username,password,email,active) VALUES 
				  ('alex', '00b7ab5afd20166513efadcec29d03b1', 'a.galis@ucl.ac.uk', 1);				 				  
-- cl4ym4n
INSERT INTO users (username,password,email,active) VALUES 
				  ('stuart', 'ae2b43c35c2c717cec7478cd9692b7f3', 's.clayman@ucl.ac.uk', 1);
-- xuz1chu4n
INSERT INTO users (username,password,email,active) VALUES 
				  ('zichuan', 'a61354ee2ef6e0b1a49d26d45e201e7d', 'z.xu@ucl.ac.uk', 1);				  				  