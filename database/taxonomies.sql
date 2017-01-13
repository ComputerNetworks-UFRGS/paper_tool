
create sequence taxonomies_seq;
create table taxonomies (
    id integer DEFAULT nextval('taxonomies_seq'::regclass) NOT NULL,
    name text,
    description text,
    active smallint DEFAULT 1,
    created_by integer
);

ALTER TABLE public.users OWNER TO tool;
ALTER TABLE ONLY taxonomies ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);
ALTER TABLE ONLY taxonomies ADD CONSTRAINT user_fkey FOREIGN KEY (created_by) REFERENCES users (id);
