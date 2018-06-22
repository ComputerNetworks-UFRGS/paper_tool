
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

create sequence users_log_seq;
create table users_log (
    id integer DEFAULT nextval('users_log_seq'::regclass) NOT NULL,
    user_id integer,
    date_hour timestamp DEFAULT current_timestamp,
    user_agent text
);

ALTER TABLE public.users_log OWNER TO tool;
ALTER TABLE ONLY users_log ADD CONSTRAINT users_log_pkey PRIMARY KEY (id);
ALTER TABLE ONLY users_log ADD CONSTRAINT user_log_fkey FOREIGN KEY (user_id) REFERENCES users (id);

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

-- s3rr4t
INSERT INTO users (username,password,email,active) VALUES 
				  ('joan', 'cd579e2ee11b340d800ea795bd65350f', 'serrat@tsc.upc.edu', 1);

-- m4rcusbr1t0
INSERT INTO users (username,password,email,active) VALUES 
				  ('marcus', 'da03aa8d26a48be9d4cc83b773ed05a1', 'marcus.silva@inf.ufrgs.br', 1);

-- ch4r4l4mb1d3s
INSERT INTO users (username,password,email,active) VALUES 
				  ('charalambides', '4965f335fbb2ae9b02caeb535fbcbbba', 'marinos.charalambides@ucl.ac.uk', 1);

-- tunc3r
INSERT INTO users (username,password,email,active) VALUES 
				  ('tuncer', '163a9594c4bc21886842e935b4edcea5', 'd.tuncer@ucl.ac.uk', 1);

-- m4m4t4s
INSERT INTO users (username,password,email,active) VALUES 
				  ('mamatas', 'ae3178bcb68fd7d1ffacc99062dc521d', 'emamatas@uom.edu.gr', 1);

-- th30d0r0u
INSERT INTO users (username,password,email,active) VALUES 
				  ('theodorou', '28a7d537ed61b649c97bade8ecaa8d6f', 'tryfonthe@gmail.com', 1);

-- v10l3tt4s
INSERT INTO users (username,password,email,active) VALUES 
				  ('violettas', 'f66024fce42b11e81cf5605d8715107f', 'georgevio@gmail.com', 1);

-- sl4w0m1r
INSERT INTO users (username,password,email,active) VALUES 
				  ('slawomir', 'e53b8b8244998552e1edcd47423bedac', 'slawomir.kuklinski@gmail.com', 1);

-- lu1sm1gu3l
INSERT INTO users (username,password,email,active) VALUES 
				  ('luismiguel', 'fab16f1a0772183f7fe97ec2bdf43d3b', 'luismiguel.contrerasmurillo@telefonica.com', 1);

-- luc14n0
INSERT INTO users (username,password,email,active) VALUES 
				  ('luciano', 'eff43e210bcb0034144b7e877f5608fc', 'zembruzki558@gmail.com', 1);
