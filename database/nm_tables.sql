drop table papers_nm_subtopic;
drop table papers;
drop table nm_subtopic;
drop table nm_topic;

drop sequence nm_subtopic_seq;
drop sequence papers_seq;
drop sequence papers_nm_subtopic_seq;

create sequence nm_subtopic_seq;
create sequence papers_seq;
create sequence papers_nm_subtopic_seq;

create table nm_topic (
	id				integer NOT NULL,
	description		text,
	active			smallint DEFAULT 1,
	primary key	(id)	
);

grant all on nm_topic to tool;
grant all on sequence papers_nm_topic_seq to tool;

insert into nm_topic (id,description) values ('1','');
insert into nm_topic (id,description) values ('2','');
insert into nm_topic (id,description) values ('3','');
insert into nm_topic (id,description) values ('4','');
insert into nm_topic (id,description) values ('5','');
insert into nm_topic (id,description) values ('6','');
insert into nm_topic (id,description) values ('7','');

create table nm_subtopic (
	id				integer NOT NULL DEFAULT nextval('nm_subtopic_seq'), 
	description		text,
	active			smallint DEFAULT 1,
	topic_id		integer,
	primary key (id),
	foreign key (topic_id) references nm_topic (id)
);

grant all on nm_subtopic to tool;
grant all on sequence nm_subtopic_seq to tool;

insert into nm_subtopic (description,topic_id) values ('Ad-hoc networks','1');
insert into nm_subtopic (description,topic_id) values ('Wireless & mobile networks','1');
insert into nm_subtopic (description,topic_id) values ('IP networks','1');
insert into nm_subtopic (description,topic_id) values ('LANs','1');
insert into nm_subtopic (description,topic_id) values ('Optical Networks','1');
insert into nm_subtopic (description,topic_id) values ('Sensor Networks','1');
insert into nm_subtopic (description,topic_id) values ('Overlay Networks','1');
insert into nm_subtopic (description,topic_id) values ('Virtual Networks','1');
insert into nm_subtopic (description,topic_id) values ('Software Defined and Programmable Networks','1');
insert into nm_subtopic (description,topic_id) values ('Data Center Networks','1');
insert into nm_subtopic (description,topic_id) values ('Smart Grids','1');

insert into nm_subtopic (description,topic_id) values ('Multimedia services (e.g., voice, video)','2');
insert into nm_subtopic (description,topic_id) values ('Data services (e.g., email, web)','2');
insert into nm_subtopic (description,topic_id) values ('Hosting (virtual machines)','2');
insert into nm_subtopic (description,topic_id) values ('Grids','2');
insert into nm_subtopic (description,topic_id) values ('Cloud services','2');
insert into nm_subtopic (description,topic_id) values ('Resource provisioning and management','2');
insert into nm_subtopic (description,topic_id) values ('QoE-centric management','2');
insert into nm_subtopic (description,topic_id) values ('Service discovery, migration and orchestration','2');

insert into nm_subtopic (description,topic_id) values ('Legal & ethical issues','3');
insert into nm_subtopic (description,topic_id) values ('Process management','3');

insert into nm_subtopic (description,topic_id) values ('Fault management','4');
insert into nm_subtopic (description,topic_id) values ('Configuration management','4');
insert into nm_subtopic (description,topic_id) values ('Accounting management','4');
insert into nm_subtopic (description,topic_id) values ('Performance management','4');
insert into nm_subtopic (description,topic_id) values ('Security management','4');
insert into nm_subtopic (description,topic_id) values ('SLA management','4');
insert into nm_subtopic (description,topic_id) values ('Event management','4');

insert into nm_subtopic (description,topic_id) values ('Centralized management','5');
insert into nm_subtopic (description,topic_id) values ('Distributed management','5');
insert into nm_subtopic (description,topic_id) values ('Autonomic and self management','5');
insert into nm_subtopic (description,topic_id) values ('Policy-based management','5');
insert into nm_subtopic (description,topic_id) values ('Federated network management','5');
insert into nm_subtopic (description,topic_id) values ('Pro-active management','5');
insert into nm_subtopic (description,topic_id) values ('Energy-aware network management','5');

insert into nm_subtopic (description,topic_id) values ('Protocols','6');
insert into nm_subtopic (description,topic_id) values ('Middleware','6');
insert into nm_subtopic (description,topic_id) values ('Mobile agents','6');
insert into nm_subtopic (description,topic_id) values ('P2P','6');
insert into nm_subtopic (description,topic_id) values ('Grids','6');
insert into nm_subtopic (description,topic_id) values ('Data, information, and semantic modeling','6');
insert into nm_subtopic (description,topic_id) values ('Cloud computing','6');
insert into nm_subtopic (description,topic_id) values ('Internet of Things','6');
insert into nm_subtopic (description,topic_id) values ('Human Machine interaction','6');
insert into nm_subtopic (description,topic_id) values ('Operations and Business Support Systems (OSS/BSS)','6');

insert into nm_subtopic (description,topic_id) values ('Control theories','7');
insert into nm_subtopic (description,topic_id) values ('Optimization theories','7');
insert into nm_subtopic (description,topic_id) values ('Economic theories','7');
insert into nm_subtopic (description,topic_id) values ('Machine learning and genetic algorithms','7');
insert into nm_subtopic (description,topic_id) values ('Logics','7');
insert into nm_subtopic (description,topic_id) values ('Probabilistic, stochastic processes, queuing theory','7');
insert into nm_subtopic (description,topic_id) values ('Simulation','7');
insert into nm_subtopic (description,topic_id) values ('Experimental approach','7');
insert into nm_subtopic (description,topic_id) values ('Design','7');
insert into nm_subtopic (description,topic_id) values ('Monitoring & Measurements','7');
insert into nm_subtopic (description,topic_id) values ('Data mining and (big) data analytics','7');

create table papers (
	id				integer NOT NULL DEFAULT nextval('papers_seq'),
	year			integer,
	citations		integer,
	title			text,
	vehicle			text,
	site			text,
	primary key (id)
);

grant all on papers to tool;
grant all on sequence papers_seq to tool;

create table papers_nm_subtopic (
	id              integer NOT NULL DEFAULT nextval('papers_nm_subtopic_seq'),
	paper_id		integer,
	nm_subtopic_id	integer,
	primary key (id),
	foreign key (paper_id) references papers (id),
	foreign key (nm_subtopic_id) references nm_subtopic (id)
);

grant all on papers_nm_subtopic to tool;
grant all on sequence papers_nm_subtopic_seq to tool;
