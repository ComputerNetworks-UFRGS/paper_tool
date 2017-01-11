create sequence papers_viz_comments_seq;

create table papers_viz_comments (
	id			integer NOT NULL DEFAULT nextval('papers_viz_comments_seq'),
	comments	text,
	time		timestamp	DEFAULT current_timestamp,
	user_id		integer,	
	paper_id	integer,
	primary key (id),
   	foreign key (user_id) references users (id),
	foreign key (paper_id) references papers (id)
);

grant all on papers_viz_comments to tool;
grant all on sequence papers_viz_comments_seq to tool;
