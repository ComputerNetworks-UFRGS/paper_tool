
create sequence questions_seq;
alter sequence public.questions_seq OWNER TO tool;
create table questions (
    id integer DEFAULT nextval('questions_seq'::regclass) NOT NULL,
    question text,
    answer_type smallint DEFAULT 1, -- for future implementations ...
    created_by integer,
    active smallint DEFAULT 1
);

ALTER TABLE public.questions OWNER TO tool;
ALTER TABLE ONLY questions ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY questions ADD CONSTRAINT user_fkey FOREIGN KEY (created_by) REFERENCES users (id);

insert into questions (question,created_by) values ('What are the strengths of the paper?',1);
insert into questions (question,created_by) values ('What are the weaknesses of the paper?',1);
insert into questions (question,created_by) values ('Did you recommend this paper?',1);
insert into questions (question,created_by) values ('What are the main topics of the paper?',1);

create sequence papers_users_answers_seq;
alter sequence public.papers_users_answers_seq OWNER TO tool;
create table papers_users_answers (
    id          integer NOT NULL DEFAULT nextval('papers_users_answers_seq'),
    answer      text,
    time        timestamp   DEFAULT current_timestamp,
    question_id integer,
    user_id     integer,    
    paper_id    integer
);

ALTER TABLE public.papers_users_answers OWNER TO tool;
ALTER TABLE ONLY papers_users_answers ADD CONSTRAINT papers_users_answers_pkey PRIMARY KEY (id);
ALTER TABLE ONLY papers_users_answers ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE ONLY papers_users_answers ADD CONSTRAINT paper_fkey FOREIGN KEY (paper_id) REFERENCES papers (id);
ALTER TABLE ONLY papers_users_answers ADD CONSTRAINT question_fkey FOREIGN KEY (question_id) REFERENCES questions (id);
