
create sequence papers_seq;
create table papers (
    id integer DEFAULT nextval('papers_seq'::regclass) NOT NULL,
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
    active smallint DEFAULT 1
);

ALTER TABLE public.papers OWNER TO tool;
ALTER TABLE ONLY papers ADD CONSTRAINT papers_pkey PRIMARY KEY (id);
ALTER TABLE ONLY papers ADD CONSTRAINT user_fkey FOREIGN KEY (upload_by) REFERENCES users (id);

create sequence papers_comments_seq;
create table papers_comments (
    id          integer NOT NULL DEFAULT nextval('papers_comments_seq'),
    comment     text,
    time        timestamp   DEFAULT current_timestamp,
    user_id     integer,    
    paper_id    integer,
    taxonomy_id integer
);

ALTER TABLE public.papers_comments OWNER TO tool;
ALTER TABLE ONLY papers_comments ADD CONSTRAINT papers_comments_pkey PRIMARY KEY (id);
ALTER TABLE ONLY papers_comments ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE ONLY papers_comments ADD CONSTRAINT paper_fkey FOREIGN KEY (paper_id) REFERENCES papers (id);
ALTER TABLE ONLY papers_comments ADD CONSTRAINT taxonomy_fkey FOREIGN KEY (taxonomy_id) REFERENCES taxonomies(id);
