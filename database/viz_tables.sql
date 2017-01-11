drop table papers_viz_subtopic;
drop table viz_subtopic;
drop table viz_topic;

drop sequence viz_subtopic_seq;
drop sequence papers_viz_subtopic_seq;

create sequence viz_subtopic_seq;
create sequence papers_viz_subtopic_seq;

create table viz_topic (
	id			integer NOT NULL,
	description		text,
	active			smallint DEFAULT 1,
	color			text,
	primary key	(id)	
);

grant all on viz_topic to tool;

insert into viz_topic (id,description) values ('1','Dataset types');
insert into viz_topic (id,description) values ('2','Visualization Technique');
insert into viz_topic (id,description) values ('3','Tasks');

create table viz_subtopic (
	id				integer NOT NULL DEFAULT nextval('viz_subtopic_seq'), 
	description		text,
	active			smallint DEFAULT 1,
	topic_id		integer,
	primary key (id),
	foreign key (topic_id) references viz_topic (id)
);

grant all on viz_subtopic to tool;
grant all on sequence viz_subtopic_seq to tool;

insert into viz_subtopic (description,topic_id) values ('Tables','1');
insert into viz_subtopic (description,topic_id) values ('Multidimensional tables','1');
insert into viz_subtopic (description,topic_id) values ('Link/Node','1');
insert into viz_subtopic (description,topic_id) values ('Trees','1');
insert into viz_subtopic (description,topic_id) values ('Fields','1');
insert into viz_subtopic (description,topic_id) values ('Geometry','1');
insert into viz_subtopic (description,topic_id) values ('Static file','1');
insert into viz_subtopic (description,topic_id) values ('Dynamic stream','1');

insert into viz_subtopic (description,topic_id) values ('Standard 2D/3D displays','2');
insert into viz_subtopic (description,topic_id) values ('Geometrically transformed displays','2');
insert into viz_subtopic (description,topic_id) values ('Icon-based displays','2');
insert into viz_subtopic (description,topic_id) values ('Dense pixel displays','2');
insert into viz_subtopic (description,topic_id) values ('Stacked displays','2');
insert into viz_subtopic (description,topic_id) values ('Clustering?','2');

insert into viz_subtopic (description,topic_id) values ('Overview (Shneiderman)','3');
insert into viz_subtopic (description,topic_id) values ('Zoom (Shneiderman)','3');
insert into viz_subtopic (description,topic_id) values ('Filter (Shneiderman)','3');
insert into viz_subtopic (description,topic_id) values ('Details-on-demand (Shneiderman)','3');
insert into viz_subtopic (description,topic_id) values ('Relate (Shneiderman)','3');
insert into viz_subtopic (description,topic_id) values ('History (Shneiderman)','3');
insert into viz_subtopic (description,topic_id) values ('Extract (Shneiderman)','3');
insert into viz_subtopic (description,topic_id) values ('Interactive Projection (Keim) ?','3');
insert into viz_subtopic (description,topic_id) values ('Interactive Filtering (Keim)','3');
insert into viz_subtopic (description,topic_id) values ('Interactive Zooming (Keim) ? ','3');
insert into viz_subtopic (description,topic_id) values ('Interactive Distortion (Keim) ?','3');
insert into viz_subtopic (description,topic_id) values ('Linking and Brushing (Keim)','3');
insert into viz_subtopic (description,topic_id) values ('Animation?','3');
insert into viz_subtopic (description,topic_id) values ('Moving/Rotate','3');

create table papers_viz_subtopic (
	id              integer NOT NULL DEFAULT nextval('papers_viz_subtopic_seq'),
	paper_id		integer,
	viz_subtopic_id	integer,
	primary key (id),
	foreign key (paper_id) references papers (id),
	foreign key (viz_subtopic_id) references viz_subtopic (id)
);

grant all on papers_viz_subtopic to tool;
grant all on sequence papers_viz_subtopic_seq to tool;
