
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

create sequence papers_taxonomies_seq;
create table papers_taxonomies (
	id integer DEFAULT nextval('papers_taxonomies_seq'::regclass) NOT NULL,
    paper_id integer NOT NULL,
    taxonomy_id integer NOT NULL,
    topic_id integer NOT NULL
);

ALTER TABLE public.papers_taxonomies OWNER TO tool;
ALTER TABLE ONLY papers_taxonomies ADD CONSTRAINT papers_taxonomies_pkey PRIMARY KEY (id);
ALTER TABLE ONLY papers_taxonomies ADD CONSTRAINT paper_fkey FOREIGN KEY (paper_id) REFERENCES papers (id);
ALTER TABLE ONLY papers_taxonomies ADD CONSTRAINT taxonomy_fkey FOREIGN KEY (taxonomy_id) REFERENCES taxonomies (id);