--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: nm_subtopic_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nm_subtopic_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nm_subtopic_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: nm_subtopic; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nm_subtopic (
    id integer DEFAULT nextval('nm_subtopic_seq'::regclass) NOT NULL,
    description text,
    active smallint DEFAULT 1,
    topic_id integer
);


ALTER TABLE public.nm_subtopic OWNER TO postgres;

--
-- Name: nm_topic; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nm_topic (
    id integer NOT NULL,
    description text,
    active smallint DEFAULT 1
);


ALTER TABLE public.nm_topic OWNER TO postgres;

--
-- Name: papers_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE papers_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_seq OWNER TO postgres;

--
-- Name: papers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE papers (
    id integer DEFAULT nextval('papers_seq'::regclass) NOT NULL,
    year integer,
    citations integer,
    title text,
    vehicle text,
    site text,
    status smallint DEFAULT 1,
    comments text,
    file text
);


ALTER TABLE public.papers OWNER TO postgres;

--
-- Name: papers_nm_comments_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE papers_nm_comments_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_nm_comments_seq OWNER TO postgres;

--
-- Name: papers_nm_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE papers_nm_comments (
    id integer DEFAULT nextval('papers_nm_comments_seq'::regclass) NOT NULL,
    comments text,
    "time" timestamp without time zone DEFAULT now(),
    user_id integer,
    paper_id integer
);


ALTER TABLE public.papers_nm_comments OWNER TO postgres;

--
-- Name: papers_nm_subtopic_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE papers_nm_subtopic_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.papers_nm_subtopic_seq OWNER TO postgres;

--
-- Name: papers_nm_subtopic; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE papers_nm_subtopic (
    id integer DEFAULT nextval('papers_nm_subtopic_seq'::regclass) NOT NULL,
    paper_id integer,
    nm_subtopic_id integer
);


ALTER TABLE public.papers_nm_subtopic OWNER TO postgres;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: tool
--

CREATE SEQUENCE users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_seq OWNER TO tool;

--
-- Name: users; Type: TABLE; Schema: public; Owner: tool; Tablespace: 
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_seq'::regclass) NOT NULL,
    username text,
    password text,
    email text,
    active smallint DEFAULT 1
);


ALTER TABLE public.users OWNER TO tool;

--
-- Data for Name: nm_subtopic; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO nm_subtopic VALUES (1, 'Ad-hoc networks', 1, 1);
INSERT INTO nm_subtopic VALUES (2, 'Wireless & mobile networks', 1, 1);
INSERT INTO nm_subtopic VALUES (3, 'IP networks', 1, 1);
INSERT INTO nm_subtopic VALUES (4, 'LANs', 1, 1);
INSERT INTO nm_subtopic VALUES (5, 'Optical Networks', 1, 1);
INSERT INTO nm_subtopic VALUES (6, 'Sensor Networks', 1, 1);
INSERT INTO nm_subtopic VALUES (7, 'Overlay Networks', 1, 1);
INSERT INTO nm_subtopic VALUES (8, 'Virtual Networks', 1, 1);
INSERT INTO nm_subtopic VALUES (9, 'Software Defined and Programmable Networks', 1, 1);
INSERT INTO nm_subtopic VALUES (10, 'Data Center Networks', 1, 1);
INSERT INTO nm_subtopic VALUES (11, 'Smart Grids', 1, 1);
INSERT INTO nm_subtopic VALUES (12, 'Multimedia services (e.g., voice, video)', 1, 2);
INSERT INTO nm_subtopic VALUES (13, 'Data services (e.g., email, web)', 1, 2);
INSERT INTO nm_subtopic VALUES (14, 'Hosting (virtual machines)', 1, 2);
INSERT INTO nm_subtopic VALUES (15, 'Grids', 1, 2);
INSERT INTO nm_subtopic VALUES (16, 'Cloud services', 1, 2);
INSERT INTO nm_subtopic VALUES (17, 'Resource provisioning and management', 1, 2);
INSERT INTO nm_subtopic VALUES (18, 'QoE-centric management', 1, 2);
INSERT INTO nm_subtopic VALUES (19, 'Service discovery, migration and orchestration', 1, 2);
INSERT INTO nm_subtopic VALUES (20, 'Legal & ethical issues', 1, 3);
INSERT INTO nm_subtopic VALUES (21, 'Process management', 1, 3);
INSERT INTO nm_subtopic VALUES (22, 'Fault management', 1, 4);
INSERT INTO nm_subtopic VALUES (23, 'Configuration management', 1, 4);
INSERT INTO nm_subtopic VALUES (24, 'Accounting management', 1, 4);
INSERT INTO nm_subtopic VALUES (25, 'Performance management', 1, 4);
INSERT INTO nm_subtopic VALUES (26, 'Security management', 1, 4);
INSERT INTO nm_subtopic VALUES (27, 'SLA management', 1, 4);
INSERT INTO nm_subtopic VALUES (28, 'Event management', 1, 4);
INSERT INTO nm_subtopic VALUES (29, 'Centralized management', 1, 5);
INSERT INTO nm_subtopic VALUES (30, 'Distributed management', 1, 5);
INSERT INTO nm_subtopic VALUES (31, 'Autonomic and self management', 1, 5);
INSERT INTO nm_subtopic VALUES (32, 'Policy-based management', 1, 5);
INSERT INTO nm_subtopic VALUES (33, 'Federated network management', 1, 5);
INSERT INTO nm_subtopic VALUES (34, 'Pro-active management', 1, 5);
INSERT INTO nm_subtopic VALUES (35, 'Energy-aware network management', 1, 5);
INSERT INTO nm_subtopic VALUES (36, 'Protocols', 1, 6);
INSERT INTO nm_subtopic VALUES (37, 'Middleware', 1, 6);
INSERT INTO nm_subtopic VALUES (38, 'Mobile agents', 1, 6);
INSERT INTO nm_subtopic VALUES (39, 'P2P', 1, 6);
INSERT INTO nm_subtopic VALUES (40, 'Grids', 1, 6);
INSERT INTO nm_subtopic VALUES (41, 'Data, information, and semantic modeling', 1, 6);
INSERT INTO nm_subtopic VALUES (42, 'Cloud computing', 1, 6);
INSERT INTO nm_subtopic VALUES (43, 'Internet of Things', 1, 6);
INSERT INTO nm_subtopic VALUES (44, 'Human Machine interaction', 1, 6);
INSERT INTO nm_subtopic VALUES (45, 'Operations and Business Support Systems (OSS/BSS)', 1, 6);
INSERT INTO nm_subtopic VALUES (46, 'Control theories', 1, 7);
INSERT INTO nm_subtopic VALUES (47, 'Optimization theories', 1, 7);
INSERT INTO nm_subtopic VALUES (48, 'Economic theories', 1, 7);
INSERT INTO nm_subtopic VALUES (49, 'Machine learning and genetic algorithms', 1, 7);
INSERT INTO nm_subtopic VALUES (50, 'Logics', 1, 7);
INSERT INTO nm_subtopic VALUES (51, 'Probabilistic, stochastic processes, queuing theory', 1, 7);
INSERT INTO nm_subtopic VALUES (52, 'Simulation', 1, 7);
INSERT INTO nm_subtopic VALUES (53, 'Experimental approach', 1, 7);
INSERT INTO nm_subtopic VALUES (54, 'Design', 1, 7);
INSERT INTO nm_subtopic VALUES (55, 'Monitoring & Measurements', 1, 7);
INSERT INTO nm_subtopic VALUES (56, 'Data mining and (big) data analytics', 1, 7);


--
-- Name: nm_subtopic_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nm_subtopic_seq', 56, true);


--
-- Data for Name: nm_topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO nm_topic VALUES (1, 'Network Management', 1);
INSERT INTO nm_topic VALUES (2, 'Service Management', 1);
INSERT INTO nm_topic VALUES (3, 'Business Management', 1);
INSERT INTO nm_topic VALUES (4, 'Functional Areas', 1);
INSERT INTO nm_topic VALUES (5, 'Management Approaches', 1);
INSERT INTO nm_topic VALUES (6, 'Technologies', 1);
INSERT INTO nm_topic VALUES (7, 'Methods', 1);


--
-- Data for Name: papers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO papers VALUES (735, 2000, 187, 'Mapping and visualizing the internet', 'USENIX', 'http://www.informatik.uni-trier.de/~ley/db/conf/usenix/usenix2000g.html', 1, NULL, '735.pdf');
INSERT INTO papers VALUES (756, 2002, 46, 'Mielog- A Highly Interactive Visual Log Browser Using Information Visualization and Statistical Analysis', 'LISA', 'https://www.usenix.org/legacy/publications/library/proceedings/lisa02/', 1, NULL, '756.pdf');
INSERT INTO papers VALUES (898, 2006, 3, 'Interactive Network Management Visualization with SVG and AJAX', 'LISA', 'https://www.usenix.org/legacy/events/lisa06/index.html', 1, NULL, '898.pdf');
INSERT INTO papers VALUES (906, 2009, 3, 'Visualizing Firewall Configurations Using Created Voids', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '906.pdf');
INSERT INTO papers VALUES (749, 2002, 56, 'Network intrusion visualization with NIVA, an intrusion detection visual analyzer with haptic integration', 'HAPTICS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7836', 1, NULL, '749.pdf');
INSERT INTO papers VALUES (970, 2010, 2, 'Expert-Aware Approach- A New Approach to Improve Network Security Visualization Tool', 'CICSYN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5613973', 1, NULL, '970.pdf');
INSERT INTO papers VALUES (787, 2005, 28, 'Visual correlation of host processes and network traffic', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '787.pdf');
INSERT INTO papers VALUES (978, 2011, 2, 'A Method of Network Topology Visualization Based on SNMP', 'IMCCC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6119177', 1, NULL, '978.pdf');
INSERT INTO papers VALUES (795, 2005, 24, 'Information Assurance Visualizations for Specific Stages of Situational Awareness and Intended Uses- Lessons Learned', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '795.pdf');
INSERT INTO papers VALUES (815, 2003, 17, 'A visualization tool for situational awareness of tactical and strategic security events on large and complex computer networks', 'MILCOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=9057', 1, NULL, '815.pdf');
INSERT INTO papers VALUES (901, 2008, 3, 'Improving Security Visualization with Exposure Map Filtering', 'ACSAC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4721525', 1, NULL, '901.pdf');
INSERT INTO papers VALUES (902, 2008, 3, 'A Task Centered Framework for Computer Security Data Visualization', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '902.pdf');
INSERT INTO papers VALUES (903, 2009, 3, 'Study On Advanced Visualization Tools In Network Monitoring Platform', 'EMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5358680', 1, NULL, '903.pdf');
INSERT INTO papers VALUES (908, 2001, 2, 'Network Management Visualization with PingTV', 'LCN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7773', 1, NULL, '908.pdf');
INSERT INTO papers VALUES (909, 2001, 2, 'PingTV- a case study in visual network monitoring', 'VIS', 'http://ieeevis.org/', 1, NULL, '909.pdf');
INSERT INTO papers VALUES (910, 2004, 2, 'Researchers develop network-security visualization tools', 'COMPUTER', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2', 1, NULL, '910.pdf');
INSERT INTO papers VALUES (911, 2005, 2, 'An intelligent self-learning algorithm for IP network topology discovery', 'LANMAN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10349', 1, NULL, '911.pdf');
INSERT INTO papers VALUES (913, 2006, 2, 'Tool update- NVisionIP improvements (difference view, sparklines, and shapes)', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '913.pdf');
INSERT INTO papers VALUES (917, 2007, 2, 'Intelligent Classification and Visualization of Network Scans', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '917.pdf');
INSERT INTO papers VALUES (918, 2008, 2, 'A Novel Visualization Approach for Efficient Network Scans Detection', 'SECTECH', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4725323', 1, NULL, '918.pdf');
INSERT INTO papers VALUES (920, 2008, 2, 'Wireless Cyber Assets Discovery Visualization', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '920.pdf');
INSERT INTO papers VALUES (833, 2000, 13, 'Automatic construction of dynamic 3D metaphoric worlds- An application to network management', 'SPIE 3960', 'http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=920397', 1, NULL, '833.pdf');
INSERT INTO papers VALUES (868, 2007, 8, 'NetBytes Viewer- An Entity-Based NetFlow Visualization Utility for Identifying Intrusive Behavior', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '868.pdf');
INSERT INTO papers VALUES (870, 2009, 8, 'SURFmap - A network monitoring tool based on the Google Maps API', 'IM', 'https://www.google.com.br/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CC0QFjAA&url=http%3A%2F%2Fim2009.ieee-im.org%2F&ei=cEVcUpW1LYKUqgHE5YAw&usg=AFQjCNGN155Lbe_Ww00r6ZFU2q62EmrUnQ&sig2=0Y1f7TO4IPetJSj1tl-kgA&bvm=bv.53899372,d.aWM', 1, NULL, '870.pdf');
INSERT INTO papers VALUES (921, 2008, 2, 'Backhoe, a Packet Trace and Log Browser', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '921.pdf');
INSERT INTO papers VALUES (922, 2009, 2, 'A Visual Analytic Framework for Exploring Relationships in Textual Contents of Digital Forensics Evidence', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '922.pdf');
INSERT INTO papers VALUES (981, 2010, 1, 'Alerts Analysis and Visualization in Network-based Intrusion Detection Systems', 'SOCIALCOM', 'http://www.ieee.org/conferences_events/conferences/conferencedetails/index.html?Conf_ID=17735', 1, NULL, '981.pdf');
INSERT INTO papers VALUES (900, 2006, 3, 'Visualization assisted detection of sybil attacks in wireless networks', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '900.pdf');
INSERT INTO papers VALUES (1006, 2010, 0, 'Correlation, Visualization, and Usability Analysis of Routing Policy Configurations', 'TNSM', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=4275028', 1, NULL, '1006.pdf');
INSERT INTO papers VALUES (1029, 2012, 0, 'A system to provide real-time collaborative situational awareness by Web enabling a distributed sensor network', 'SWE', 'http://acmgis2012.cs.umd.edu/', 1, NULL, '1029.pdf');
INSERT INTO papers VALUES (1048, 2013, 0, 'Visualization of web form submissions for security analysis', 'International Journal of Web Information Systems', 'http://www.emeraldinsight.com/products/journals/journals.htm?id=ijwis', 1, NULL, '1048.pdf');
INSERT INTO papers VALUES (729, 1999, 6, 'Navigation in huge information hierarchies application to network management', 'CIKM', 'http://www.cikmconference.org/1999/', 1, NULL, '729.pdf');
INSERT INTO papers VALUES (748, 2002, 56, 'Case Study - Interactive Visualization for Internet Security', 'VISUAL', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=8436', 1, NULL, '748.pdf');
INSERT INTO papers VALUES (771, 2001, 33, 'Visual Traffic Monitoring and Evaluation', 'SPIE 4523', 'http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=896054', 1, NULL, '771.pdf');
INSERT INTO papers VALUES (923, 2005, 1, 'SVision- A network host-centered anomaly visualization technique', 'ISC', 'http://www.informatik.uni-trier.de/~ley/db/conf/isw/isc2005.html', 1, NULL, '923.pdf');
INSERT INTO papers VALUES (924, 2007, 1, 'Visualizing Network Status', 'ICMLC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4370103', 1, NULL, '924.pdf');
INSERT INTO papers VALUES (1061, 2000, 49, 'Supporting intrusion detection by graph clustering and graph drawing', 'RAID', 'http://www.raid-symposium.org/raid2000/', 1, NULL, '1061.pdf');
INSERT INTO papers VALUES (927, 2008, 1, 'Network Traffic Exploration Application- A Tool to Assess, Visualize, and Analyze Network Security Events', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '927.pdf');
INSERT INTO papers VALUES (929, 2009, 1, 'Visualization of Network Security Traffic using Hexagonal Self-Organizing Maps', 'CAINE', 'http://www.informatik.uni-trier.de/~ley/db/conf/caine/caine2009.html', 1, NULL, '929.pdf');
INSERT INTO papers VALUES (930, 2009, 1, 'RadialNet- An Interactive Network Topology Visualization Tool with Visual Auditing Support', 'CRITIS', 'http://link.springer.com/book/10.1007/978-3-642-03552-4/page/1', 1, NULL, '930.pdf');
INSERT INTO papers VALUES (887, 2009, 5, 'Visualization of node interaction dynamics in network traces', 'AIMS', 'http://dl.acm.org/citation.cfm?id=1574663', 1, NULL, '887.pdf');
INSERT INTO papers VALUES (912, 2006, 2, 'Grid Based Network Address Space Browsing for Network Traffic Visualization', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10992', 1, NULL, '912.pdf');
INSERT INTO papers VALUES (896, 2005, 3, 'IPMatrix- an effective visual- ization framework for cyber threat monitoring', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10086', 1, NULL, '896.pdf');
INSERT INTO papers VALUES (899, 2006, 3, 'Tool update- high alarm count issues in IDS rainstorm', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '899.pdf');
INSERT INTO papers VALUES (904, 2009, 3, 'Visualization of complex attacks and state of attacked network', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '904.pdf');
INSERT INTO papers VALUES (907, 2009, 3, 'SecVizer- A Security Visualization Tool for QualNetGenerated Traffic Traces', 'THS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5159754', 1, NULL, '907.pdf');
INSERT INTO papers VALUES (715, 1995, 384, 'Visualizing Network Data', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '715.pdf');
INSERT INTO papers VALUES (780, 2005, 30, 'Attacking information visualization system usability overloading and deceiving the human', 'SOUPS', 'http://cups.cs.cmu.edu/soups/2005/', 1, NULL, '780.pdf');
INSERT INTO papers VALUES (957, 2011, 4, 'Malware images- visualization and automatic classification', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '957.pdf');
INSERT INTO papers VALUES (958, 2011, 4, 'TVi- a visual querying system for network monitoring and anomaly detection', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '958.pdf');
INSERT INTO papers VALUES (959, 2011, 4, 'Sybil attack detection through global topology pattern visualization', 'Information Visualization', 'http://ivi.sagepub.com/', 1, NULL, '959.pdf');
INSERT INTO papers VALUES (961, 2010, 3, 'An ontology-driven approach to support wireless network monitoring for home area networks', 'CNSM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6093621', 1, NULL, '961.pdf');
INSERT INTO papers VALUES (964, 2010, 3, 'Visualisation and Verification of Communication Protocols for Networked Distributed Systems', 'Enterprise Networks and Logistics for Agile Manufacturing', 'http://link.springer.com/chapter/10.1007%2F978-1-84996-244-5_16', 1, NULL, '964.pdf');
INSERT INTO papers VALUES (915, 2007, 2, 'Integrated Environment Management for Information Operations Testbeds', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '915.pdf');
INSERT INTO papers VALUES (916, 2007, 2, 'VisAlert- From Idea to Product', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '916.pdf');
INSERT INTO papers VALUES (925, 2007, 1, 'Adapting Personas for Use in Security Visualization Design', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '925.pdf');
INSERT INTO papers VALUES (919, 2008, 2, 'An investigation of visualization techniques forSNMP traffic traces', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4567164', 1, NULL, '919.pdf');
INSERT INTO papers VALUES (926, 2007, 1, 'Measuring the Complexity of Computer Security Visualization Designs', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '926.pdf');
INSERT INTO papers VALUES (892, 2007, 4, 'Visually Understanding Jam Resistant Communication', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '892.pdf');
INSERT INTO papers VALUES (934, 2008, 0, 'A Real-Time Interactive Visualization System for DNS Amplification Attack Challenges', 'ICIS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4529779', 1, NULL, '934.pdf');
INSERT INTO papers VALUES (936, 2011, 79, 'Neural visualization of network traffic data for intrusion detection', 'Applied Soft Computing', 'http://www.sciencedirect.com/science/journal/15684946', 1, NULL, '936.pdf');
INSERT INTO papers VALUES (914, 2007, 2, 'A novel visualization approach for efficient network-wide traffic monitoring', 'E2EMON', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4261330', 1, NULL, '914.pdf');
INSERT INTO papers VALUES (939, 2010, 15, 'Predictive Network Anomaly Detection and Visualization', 'TIFS', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=10206', 1, NULL, '939.pdf');
INSERT INTO papers VALUES (940, 2010, 12, 'Visualizing Attack Graphs, Reachability, and Trust Relationships with NAVIGATOR', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '940.pdf');
INSERT INTO papers VALUES (941, 2010, 10, 'Visualizing graph dynamics and similarity for enterprise network security and management', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '941.pdf');
INSERT INTO papers VALUES (942, 2010, 9, 'Real-Time Visualization of Network Behaviors for Situational Awareness', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '942.pdf');
INSERT INTO papers VALUES (945, 2010, 7, 'Visual Analysis of Code Security', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '945.pdf');
INSERT INTO papers VALUES (946, 2010, 7, 'Detection, Correlation, and Visualization of Attacks Against Critical Infrastructure Systems', 'PST', 'http://xplqa30.ieee.org/xpl/mostRecentIssue.jsp?punumber=5564352', 1, NULL, '946.pdf');
INSERT INTO papers VALUES (834, 2001, 13, 'Methods of Visualizing Temporal Patterns in and Mission Impact of Computer Security Breaches', 'DISCEX', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7418', 1, NULL, '834.pdf');
INSERT INTO papers VALUES (937, 2010, 23, 'Eden- supporting home network management through interactive visual tools', 'UIST', 'http://www.acm.org/uist/uist2010/', 1, NULL, '937.pdf');
INSERT INTO papers VALUES (953, 2010, 4, 'A new concentric-circle visualization of multi-dimensional data and its application in network security', 'Journal of Visual Languages and Computing', 'http://www.journals.elsevier.com/journal-of-visual-languages-and-computing/', 1, NULL, '953.pdf');
INSERT INTO papers VALUES (794, 2005, 24, 'Visual exploration of malicious network objects using semantic zoom, interactive encoding and dynamic queries', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '794.pdf');
INSERT INTO papers VALUES (883, 2007, 5, 'Visual Analysis of Corporate Network Intelligence- Abstracting and Reasoning on Yesterdays for Acting Today', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '883.pdf');
INSERT INTO papers VALUES (987, 2011, 1, 'Atypical Behavior Identification in Large-Scale Network Traffic', 'LDAV', 'http://vis.cs.ucdavis.edu/LDAV/', 1, NULL, '987.pdf');
INSERT INTO papers VALUES (943, 2010, 9, 'What Happened in my Network? Mining Network Events from Router Syslogs', 'IMC', 'http://conferences.sigcomm.org/imc/2010/', 1, NULL, '943.pdf');
INSERT INTO papers VALUES (962, 2010, 3, 'EMBER- A Global Perspective on Extreme Malicious Behavior', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '962.pdf');
INSERT INTO papers VALUES (758, 2006, 46, 'Visual Correlation of Network Alerts', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '758.pdf');
INSERT INTO papers VALUES (948, 2010, 5, 'Managing networks through context- Graph visualization and exploration', 'ComNet', 'http://www.journals.elsevier.com/computer-networks/', 1, NULL, '948.pdf');
INSERT INTO papers VALUES (949, 2010, 5, 'Applied parallel coordinates for logs and network traffic attack analysis', 'Journal of Computer Virology and Hacking Techniques', 'http://link.springer.com/journal/11416', 1, NULL, '949.pdf');
INSERT INTO papers VALUES (952, 2012, 5, 'Visual Analysis of Complex Firewall Configurations', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '952.pdf');
INSERT INTO papers VALUES (954, 2010, 4, 'Towards non-expert users monitoring networks and services through semantically enhanced visualizations', 'CNSM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5668576', 1, NULL, '954.pdf');
INSERT INTO papers VALUES (956, 2010, 4, 'Proposing a Multi-touch Interface for Intrusion Detection Environments', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '956.pdf');
INSERT INTO papers VALUES (969, 2012, 3, 'Visual Spam Campaigns Analysis Using Abstract Graphs Representation', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '969.pdf');
INSERT INTO papers VALUES (967, 2011, 3, 'Visualizing Network Activity using Parallel Coordinates', 'HICSS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5716643', 1, NULL, '967.pdf');
INSERT INTO papers VALUES (971, 2010, 2, 'NetVis- A network security management visualization tool based on treemap', 'ICACC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5481671', 1, NULL, '971.pdf');
INSERT INTO papers VALUES (960, 2012, 4, 'A survey of security visualization for computer network logs', 'Security and Communication Networks', 'http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1939-0122', 0, NULL, NULL);
INSERT INTO papers VALUES (972, 2010, 2, 'NevML- A Markup Language for Network Topology Visualization', 'ICFN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5431685', 1, NULL, '972.pdf');
INSERT INTO papers VALUES (973, 2010, 2, 'PeekKernelFlows- Peeking into IP flows', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '973.pdf');
INSERT INTO papers VALUES (974, 2010, 2, 'Visualizing host traffic through graphs', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '974.pdf');
INSERT INTO papers VALUES (977, 2010, 2, 'Interactive Visual Analysis of Hierarchical Enterprise Data', 'CEC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5706807', 1, NULL, '977.pdf');
INSERT INTO papers VALUES (979, 2012, 2, 'Contextualized Monitoring and Root Cause Discovery in IPTV Systems Using Data Visualization', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '979.pdf');
INSERT INTO papers VALUES (950, 2010, 5, 'Nimble cybersecurity incident management through visualization and defensible recommendations', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '950.pdf');
INSERT INTO papers VALUES (1059, 1992, 12, 'Visualizing packet traces', 'SIGCOMM', 'http://www.sigcomm.org/', 1, NULL, '1059.pdf');
INSERT INTO papers VALUES (1060, 1994, 7, 'Real-time Bifocal Network-Visualization', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5189', 1, NULL, '1060.pdf');
INSERT INTO papers VALUES (938, 2012, 22, 'A Survey of Visualization Systems for Network Security', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '938.pdf');
INSERT INTO papers VALUES (955, 2010, 4, 'Ids Alert Visualization and Monitoring through Heuristic Host Selection', 'ICCS', 'http://www.iccs-meeting.org/iccs2010/', 1, NULL, '955.pdf');
INSERT INTO papers VALUES (976, 2010, 2, 'TelescopeVisualizer - A Real-time Internet Information Visualizer With a Flexible User Interface', 'AINTEC', 'http://www.interlab.ait.ac.th/aintec2010/', 1, NULL, '976.pdf');
INSERT INTO papers VALUES (963, 2010, 3, 'From a Mess to Graphic Maps- Visualization of Large-Scale Heterogeneous Networks', 'ICCMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5420948', 1, NULL, '963.pdf');
INSERT INTO papers VALUES (975, 2010, 2, 'Traffic Classification Using Visual Motifs- An Empirical Evaluation', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '975.pdf');
INSERT INTO papers VALUES (944, 2010, 8, 'A Visual Tool for Forensic Analysis of Mobile Phone Traffic', 'MiFor', 'http://madm.dfki.de/mifor2010/MiFor2010.html', 1, NULL, '944.pdf');
INSERT INTO papers VALUES (982, 2010, 1, 'Intelligent Expertise Classification Approach - An Innovative Artificial  Intelligence Approach To Accelerate Network Data Visualization', 'ICACTE', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5564353', 1, NULL, '982.pdf');
INSERT INTO papers VALUES (984, 2010, 1, 'Interactive Detection of Network Anomalies via Coordinated Multiple Views', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '984.pdf');
INSERT INTO papers VALUES (985, 2011, 1, 'A novel three-tiered visualization approach for firewall rule validation', 'Journal of Visual Languages and Computing', 'http://www.journals.elsevier.com/journal-of-visual-languages-and-computing/', 1, NULL, '985.pdf');
INSERT INTO papers VALUES (988, 2011, 1, 'A web-based what-if scenario analysis tool for performance improvement of IT support organizations', 'CNSM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6093621', 1, NULL, '988.pdf');
INSERT INTO papers VALUES (989, 2012, 1, 'Intelligent network management using graph differential anomaly visualization', 'NOMS', 'http://noms2012.ieee-noms.org/techcfp.html', 1, NULL, '989.pdf');
INSERT INTO papers VALUES (990, 2012, 1, 'Automated Tracing and Visualization of Software Security Structure and Properties', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '990.pdf');
INSERT INTO papers VALUES (991, 2012, 1, 'NV- Nessus Vulnerability Visualization for the Web', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '991.pdf');
INSERT INTO papers VALUES (993, 2012, 1, 'A real-time visualization framework for IDS alerts', 'VINCI', 'http://www.cad.zju.edu.cn/home/chenwei/VINCI2012/', 1, NULL, '993.pdf');
INSERT INTO papers VALUES (994, 2012, 1, 'Analysis of Rogue Anti-Virus Campaigns Using Hidden Structures in k-Partite Graphs', 'CANS', 'http://cans2012.cased.de/', 1, NULL, '994.pdf');
INSERT INTO papers VALUES (995, 2012, 1, 'Hierarchical Visualization of BGP Routing Changes Using Entropy Measures', 'ISVC', 'http://www.isvc.net/12/', 1, NULL, '995.pdf');
INSERT INTO papers VALUES (996, 2012, 1, 'The Research on Network Security Visualization Key Technology', 'MINES', 'http://www.ieee-mines.org/2012/index.htm', 1, NULL, '996.pdf');
INSERT INTO papers VALUES (997, 2012, 1, 'LiveSec- Towards Effective Security Management in Large-scale Production Networks', 'ICDCSW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6257103', 1, NULL, '997.pdf');
INSERT INTO papers VALUES (998, 2012, 1, '3DSVAT- A 3D Stereoscopic Vulnerability Assessment Tool for Network Security', 'LCN', 'http://www.ieeelcn.org/prior/LCN37/', 1, NULL, '998.pdf');
INSERT INTO papers VALUES (1000, 2010, 0, 'Expert-Aware Approach Towards Network Security Visualization Tool Services', 'NETAPPS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5634611', 1, NULL, '1000.pdf');
INSERT INTO papers VALUES (1002, 2010, 0, 'Interactive SNMP traffic analysis through information visualization', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5482535', 1, NULL, '1002.pdf');
INSERT INTO papers VALUES (1003, 2010, 0, 'Network topology description and visualization', 'ICACTE', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5564353', 1, NULL, '1003.pdf');
INSERT INTO papers VALUES (1004, 2010, 0, 'An interactive visualization framework for next generation networks', 'CoNEXT', 'http://conferences.sigcomm.org/co-next/2010/', 1, NULL, '1004.pdf');
INSERT INTO papers VALUES (1005, 2010, 0, 'Case Study - Visualization Methodology For Analysing Network Data', 'UKSim', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5479086', 1, NULL, '1005.pdf');
INSERT INTO papers VALUES (1007, 2011, 0, 'Cover-VT- Converged Security Visualization Tool', 'IM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5976317', 1, NULL, '1007.pdf');
INSERT INTO papers VALUES (1008, 2011, 0, 'Control and visualization system for managed self-organization network', 'CNSM', 'http://cnsm.loria.fr/', 1, NULL, '1008.pdf');
INSERT INTO papers VALUES (1009, 2011, 0, 'VisVerND- Visual Verification of Network Traffic Dataset', 'CNSR', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5769515', 1, NULL, '1009.pdf');
INSERT INTO papers VALUES (965, 2011, 3, 'Visual Clustering of Spam Emails for DDoS Analysis', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6003377', 1, NULL, '965.pdf');
INSERT INTO papers VALUES (966, 2011, 3, 'Supporting the Cyber Analytic Process Using Visual History on Large Displays', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '966.pdf');
INSERT INTO papers VALUES (968, 2011, 3, 'BURN- Baring Unknown Rogue Networks', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '968.pdf');
INSERT INTO papers VALUES (1018, 2012, 0, 'Design and Implementation of a Network Management System for Service Oriented Network', 'WTC', 'http://www.ieice.org/~wtc2012/', 1, NULL, '1018.pdf');
INSERT INTO papers VALUES (1015, 2011, 0, 'Visual Analysis of Goal-Directed Network Defense Decisions', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '1015.pdf');
INSERT INTO papers VALUES (1019, 2012, 0, 'Nviz - a general purpose visualization tool for Wireless Sensor Networks', 'ECTI-CON', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6243514', 1, NULL, '1019.pdf');
INSERT INTO papers VALUES (1020, 2012, 0, 'The study on network topology discovery algorithm based on SNMP protocol and ICMP protocol', 'ICSESS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6260028', 1, NULL, '1020.pdf');
INSERT INTO papers VALUES (1021, 2012, 0, 'An Implementation of Visualization System for Visualizing Network Topology and Packet Flow in Mobile Ad Hoc Networks', 'NBIS', 'http://www.takilab.org/conf/nbis/2012/', 1, NULL, '1021.pdf');
INSERT INTO papers VALUES (1022, 2012, 0, 'Practical Firewall Policy Inspection Using Anomaly Detection and Its Visualization', 'ICITCS', 'http://conf.kcis.kr/main/main.asp', 1, NULL, '1022.pdf');
INSERT INTO papers VALUES (1023, 2012, 0, 'Network Topology Visualization and Monitoring for Multi-hop Wireless Networks', 'BROADNETS', 'http://broadnets.org/show/home', 1, NULL, '1023.pdf');
INSERT INTO papers VALUES (1025, 2012, 0, 'Visualization of Shared System Call Sequence Relationships in Large Malware Corpora', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1025.pdf');
INSERT INTO papers VALUES (986, 2011, 1, 'Data visualization technique framework for intrusion detection', 'IJCSI', 'http://www.ijcsi.org/', 1, NULL, '986.pdf');
INSERT INTO papers VALUES (1058, 2013, 0, 'P3D- A Parallel 3D Coordinate Visualization for Advanced Network Scans', 'ICC', 'http://www.ieee-icc.org/2013/', 1, NULL, '1058.pdf');
INSERT INTO papers VALUES (1062, 2002, 60, 'An approach to usable security based on event monitoring and visualization', 'NSPW', 'http://www.nspw.org/2002/', 1, NULL, '1062.pdf');
INSERT INTO papers VALUES (1063, 2003, 60, 'Visual problem- solving support for new event triage in centralized network security monitoring- Challenges, tools and benefits', 'IMF', 'http://www.informatik.uni-trier.de/~ley/db/conf/sidar/sidar2003.html', 1, NULL, '1063.pdf');
INSERT INTO papers VALUES (1064, 2004, 59, 'Anomaly Detection Using Layered Networks Based on Eigen Co-occurrence Matrix', 'RAID', 'http://raid04.eurecom.fr/', 1, NULL, '1064.pdf');
INSERT INTO papers VALUES (1065, 2004, 1, 'Visawin-Visualising a Wireless Network', 'VTC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=9530', 1, NULL, '1065.pdf');
INSERT INTO papers VALUES (1066, 2006, 0, 'Processing Data to Construct Practical Visualizations for Network Security', 'CSIAC', 'https://www.thecsiac.com/journal/processing-data-construct-practical-visualizations-network-security', 1, NULL, '1066.pdf');
INSERT INTO papers VALUES (1067, 2012, 1, 'Change-Link- A Digital Forensic Tool for Visualizing Changes to Directory Trees', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1067.pdf');
INSERT INTO papers VALUES (1068, 2012, 2, 'DAEDALUS-VIZ- Novel Real-time 3D Visualization for Darknet Monitoring-based Alert System', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1068.pdf');
INSERT INTO papers VALUES (999, 2013, 1, 'Christopher Alexanders fifteen properties- Toward developing evaluation metrics for security visualizations', 'ISI', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6571725', 1, NULL, '999.pdf');
INSERT INTO papers VALUES (1001, 2010, 0, 'Using geographic information systems for enhanced network security visualization', 'COM.Geo', 'http://www.com-geo.org/conferences/2010/', 1, NULL, '1001.pdf');
INSERT INTO papers VALUES (1016, 2011, 0, 'Multiresolution Semantic Visualization of Network Traffic', 'ICSC', 'http://www.ieee-icsc.org/ICSC2011/', 1, NULL, '1016.pdf');
INSERT INTO papers VALUES (1013, 2011, 0, 'A New Network Topology Visualization Algorithm', 'IMCCC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6119177', 1, NULL, '1013.pdf');
INSERT INTO papers VALUES (1024, 2012, 0, 'Visualization Design for Immediate High-Level Situational assessment', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1024.pdf');
INSERT INTO papers VALUES (1014, 2011, 0, 'Web-based automatic network discovery - Map Systems', 'ICCAIE', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6153634', 1, NULL, '1014.pdf');
INSERT INTO papers VALUES (992, 2012, 1, 'Visual analytics for BGP monitoring and prefix hijacking identification', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '992.pdf');
INSERT INTO papers VALUES (1028, 2012, 0, 'VisTracer- A Visual Analytics Tool to Investigate Routing Anomalies in Traceroutes', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1028.pdf');
INSERT INTO papers VALUES (1030, 2012, 0, 'Pathsift- A Library for Separating the Effects of Topology, Policy, and Protocols on IP Routing', 'SIMUTOOLS', 'http://simutools.org/2012/', 1, NULL, '1030.pdf');
INSERT INTO papers VALUES (1031, 2012, 0, 'Visualizing Semantics in Passwords- The Role of Dates', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1031.pdf');
INSERT INTO papers VALUES (1033, 2013, 0, 'Visualization of abnormal behavior detection using parallel coordinate and correspondence analysis', '--', '--', 1, NULL, '1033.pdf');
INSERT INTO papers VALUES (1034, 2013, 0, 'Network Data Visualization Using Parallel Coordinates Version of Time-tunnel with 2Dto2D Visualization for Intrusion Detection', 'WAINA', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6532127', 1, NULL, '1034.pdf');
INSERT INTO papers VALUES (1036, 2013, 0, 'Visualizing Geolocation of Spam Email', 'ComComAp', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6523354', 1, NULL, '1036.pdf');
INSERT INTO papers VALUES (1038, 2013, 0, 'Visualizing big network traffic data using frequent pattern mining and hypergraphs', 'Computing', 'http://link.springer.com/journal/607', 1, NULL, '1038.pdf');
INSERT INTO papers VALUES (1039, 2013, 0, 'Flexible Web Visualization for Alert-Based Network Security Analytics', 'VizSec', 'http://vizsec.org/', 1, NULL, '1039.pdf');
INSERT INTO papers VALUES (1041, 2013, 0, 'Towards Visualizing Mobile Network Data', 'ISCIS', 'http://san.ee.ic.ac.uk/iscis2013/', 1, NULL, '1041.pdf');
INSERT INTO papers VALUES (1043, 2013, 0, 'IDSRadar- a real-time visualization framework for IDS alerts', 'Science China Information Sciences', 'http://link.springer.com/journal/11432', 1, NULL, '1043.pdf');
INSERT INTO papers VALUES (1045, 2013, 0, 'Visualization Technology for flow-based nwtworks and communication services', 'FUJITSU SCI TECH J', 'http://www.researchgate.net/journal/0016-2523_Fujitsu_scientific_technical_journal', 1, NULL, '1045.pdf');
INSERT INTO papers VALUES (1046, 2013, 0, 'Risk Visualization and Alerting System- Architecture and Proof-of-Concept Implementation', 'SESP', 'http://doe.cs.northwestern.edu/SESP/', 1, NULL, '1046.pdf');
INSERT INTO papers VALUES (1047, 2013, 0, 'An Online Visualization System for Streaming Log Data of Computing Clusters', 'TST', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=5971803', 1, NULL, '1047.pdf');
INSERT INTO papers VALUES (1049, 2013, 0, 'Traffic Flow Optimization and Visualization in MPLS Networks', 'WCE', 'http://www.iaeng.org/WCE2013/', 1, NULL, '1049.pdf');
INSERT INTO papers VALUES (1010, 2011, 0, 'Peer-to-Peer File Sharing Communication Detection Using Spherical SOM Visualization for Network Management', 'HCII', 'http://www.hcii2011.org/', 1, NULL, '1010.pdf');
INSERT INTO papers VALUES (1012, 2011, 0, 'MANET-Viewer II- A Visualization System for Visualizing Packet Flow in Mobile Ad-hoc Networks', 'WAINA', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5762827', 1, NULL, '1012.pdf');
INSERT INTO papers VALUES (1017, 2011, 0, 'Acquisition and Visualization of Hosts Connected to the Network', 'SAINT', 'http://www.saintconference.org/2011/', 1, NULL, '1017.pdf');
INSERT INTO papers VALUES (1053, 2013, 0, 'Change-Link 2.0- A Digital Forensic Tool for Visualizing Changes to Shadow Volume Data', 'VizSec', 'http://vizsec.org/', 1, NULL, '1053.pdf');
INSERT INTO papers VALUES (1056, 2013, 0, 'BGPfuse- Using visual feature fusion for the detection and attribution of BGP anomalies', 'VizSec', 'http://vizsec.org/', 1, NULL, '1056.pdf');
INSERT INTO papers VALUES (1057, 2013, 0, 'Finding Anomalies in Time-Series using Visual Correlation for Interactive Root Cause Analysis', 'VizSec', 'http://vizsec.org/', 1, NULL, '1057.pdf');
INSERT INTO papers VALUES (712, 1993, 12, 'Management of broadband networks using 3D virtual world', 'HPDC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=465', 1, NULL, '712.pdf');
INSERT INTO papers VALUES (713, 1993, 32, 'Supporting Network Management through Declaratively Specified Data Visualizations', 'IM*', 'http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.55.4575&rep=rep1&type=pdf', 1, NULL, '713.pdf');
INSERT INTO papers VALUES (714, 1995, 30, 'Case study- 3D displays of Internet traffic', 'INFVIS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4050', 1, NULL, '714.pdf');
INSERT INTO papers VALUES (716, 1996, 8, 'Visualizing the World Wide Web', 'AVI', 'http://www.interaction-design.org/references/conferences/avi_1996_-_proceedings_of_the_workshop_on_advanced_visual_interfaces.html', 1, NULL, '716.pdf');
INSERT INTO papers VALUES (718, 1996, 32, 'Techniques for Automated Network Map Generation Using SNMP', 'INFOCOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=3539', 1, NULL, '718.pdf');
INSERT INTO papers VALUES (720, 1996, 73, 'Aspects of Network Visualization', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '720.pdf');
INSERT INTO papers VALUES (721, 1996, 73, 'Visualizing the Global Topology of the Mbone', 'INFVIS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4136', 1, NULL, '721.pdf');
INSERT INTO papers VALUES (722, 1997, 49, 'An architecture for monitoring, visualization, and control of gigabit networks', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '722.pdf');
INSERT INTO papers VALUES (723, 1997, 81, 'Web-based information visualization', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '723.pdf');
INSERT INTO papers VALUES (724, 1998, 12, 'Floodar Flow Visualization of Network Traffic', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '724.pdf');
INSERT INTO papers VALUES (727, 1999, 1, 'Conceptualizing bandwidth allocation in network management', 'CIKM', 'http://www.cikmconference.org/1999/', 1, NULL, '727.pdf');
INSERT INTO papers VALUES (728, 1999, 4, 'XML and Information Visualization Application to Network Management', 'MC', 'http://www.balisage.net/', 1, NULL, '728.pdf');
INSERT INTO papers VALUES (730, 1999, 6, 'Large scale network visualization', 'SIGGRAPH', 'http://www.siggraph.org/publications/newsletter/v33n3/', 1, NULL, '730.pdf');
INSERT INTO papers VALUES (731, 1999, 24, 'Visualizing large telecommunication data sets', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '731.pdf');
INSERT INTO papers VALUES (732, 1999, 50, 'Visualizing large-scale telecommunication networks and services', 'VISUAL', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6578', 1, NULL, '732.pdf');
INSERT INTO papers VALUES (733, 1999, 59, 'An eye on network intruder-administrator shootouts', 'WIDNM', 'https://www.usenix.org/legacy/publications/library/proceedings/detection99/', 1, NULL, '733.pdf');
INSERT INTO papers VALUES (738, 2004, 136, 'Managing Attack Graph Complexity Through Visual Hierarchical Aggregation', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '738.pdf');
INSERT INTO papers VALUES (740, 2004, 135, 'VisFlowConnect NetFlow Visualizations of Link Relationships for Security Situational Awareness', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '740.pdf');
INSERT INTO papers VALUES (741, 2004, 123, 'PortVis- a tool for port-based detection of security events', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '741.pdf');
INSERT INTO papers VALUES (742, 2004, 116, 'Home-centric visualization of network traffic for security administration', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '742.pdf');
INSERT INTO papers VALUES (743, 2002, 115, 'Intrusion and Misuse Detection in Large-Scale Systems', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '743.pdf');
INSERT INTO papers VALUES (744, 2000, 93, 'Network Visualization with Nam, the VINT Network Animator', 'COMPUTER', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2', 1, NULL, '744.pdf');
INSERT INTO papers VALUES (745, 2004, 82, 'SnortView- visualization system of snort logs', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '745.pdf');
INSERT INTO papers VALUES (746, 2005, 77, 'IDS RainStorm Visualizing IDS Alarms', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '746.pdf');
INSERT INTO papers VALUES (747, 2004, 75, 'Passive visual fingerprinting of network attack tools', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '747.pdf');
INSERT INTO papers VALUES (751, 2006, 54, 'Hierarchical visualization of network intrusion detection data', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '751.pdf');
INSERT INTO papers VALUES (752, 2005, 52, 'Multiple Coordinated Views for Network Attack Graphs', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '752.pdf');
INSERT INTO papers VALUES (753, 2005, 51, 'A Visualization Paradigm for Network Intrusion Detection', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10007', 1, NULL, '753.pdf');
INSERT INTO papers VALUES (754, 2005, 51, 'Real-time and forensic network data analysis using animated and coordinated visualization', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10007', 1, NULL, '754.pdf');
INSERT INTO papers VALUES (755, 2005, 49, 'Visualizing Network Data for Intrusion Detection', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10007', 1, NULL, '755.pdf');
INSERT INTO papers VALUES (757, 2002, 46, 'Tudumi- information visualization system for monitoring and auditing computer logs', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7989', 1, NULL, '757.pdf');
INSERT INTO papers VALUES (759, 2004, 44, 'Detecting flaws and intruders with visual data analysis', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '759.pdf');
INSERT INTO papers VALUES (760, 2005, 42, 'In the eye of the beholder- A visualization-based approach to information system security', 'IJHCS', 'http://www.sciencedirect.com/science/journal/10715819', 1, NULL, '760.pdf');
INSERT INTO papers VALUES (762, 2004, 40, 'An Information Visualization Framework for Intrusion Detection', 'CHI', 'http://www.sigchi.org/chi2004/', 1, NULL, '762.pdf');
INSERT INTO papers VALUES (763, 2005, 39, 'A Visualization Methodology for Characterization of Network Scans', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '763.pdf');
INSERT INTO papers VALUES (764, 2003, 38, 'A Visual Exploration Process for the Analysis of Internet Routing Data', 'VIS', 'http://vis.computer.org/vis2003/', 1, NULL, '764.pdf');
INSERT INTO papers VALUES (765, 2005, 36, 'A user-centered look at glyph-based security visualization', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '765.pdf');
INSERT INTO papers VALUES (766, 2006, 36, 'Interactive Visualization for Network and Port Scan Detection', 'RAID', 'http://www.raid-symposium.org/raid2006/', 1, NULL, '766.pdf');
INSERT INTO papers VALUES (1050, 2013, 0, 'Visualization and Clustering for SNMP Intrusion Detection', 'Cybernetics and Systems', 'http://www.tandfonline.com/toc/ucbs20/current#.UlcD6mSc5bU', 1, NULL, '1050.pdf');
INSERT INTO papers VALUES (1051, 2013, 0, 'Visualizing PHPIDS Log Files for Better Understanding of Web Server Attacks', 'VizSec', 'http://vizsec.org/', 1, NULL, '1051.pdf');
INSERT INTO papers VALUES (1055, 2013, 0, 'NAVSEC - A Recommender System for 3D Network Security Visualizations', 'VizSec', 'http://vizsec.org/', 1, NULL, '1055.pdf');
INSERT INTO papers VALUES (777, 2006, 31, 'Monitoring Network Traffic with Radial Traffic Analyzer', 'VAST', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4035729', 1, NULL, '777.pdf');
INSERT INTO papers VALUES (778, 2007, 31, 'SNMP Traffic Analysis Approaches, Tools, and First Results', 'IM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4258513', 1, NULL, '778.pdf');
INSERT INTO papers VALUES (774, 2005, 31, 'IDGraphs Intrusion Detection and Analysis Using Histographs', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '774.pdf');
INSERT INTO papers VALUES (781, 2005, 30, 'Manifold Learning Visualization of Network Traffic Data', 'MineNet', 'http://conferences.sigcomm.org/sigcomm/2005/', 1, NULL, '781.pdf');
INSERT INTO papers VALUES (783, 2009, 30, 'MOVIH-IDS- A mobile-visualization hybrid intrusion detection system', 'NEUROCOMPUTING', 'http://www.sciencedirect.com/science/journal/09252312', 1, NULL, '783.pdf');
INSERT INTO papers VALUES (761, 2000, 41, 'Network Performance Visualization- Insight through animation', 'PAM', 'http://www.ripe.net/ripe/mail/archives/tt-host/1999-August/000175.html', 1, NULL, '761.pdf');
INSERT INTO papers VALUES (739, 2004, 136, 'The Spinning Cube of Potential Doom', 'CACM', 'http://cacm.acm.org/', 1, NULL, '739.pdf');
INSERT INTO papers VALUES (750, 2005, 56, 'Preserving the Big Picture- Visual Network Traffic Analysis with TNV', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '750.pdf');
INSERT INTO papers VALUES (767, 2004, 35, 'Real-time visualization of network attacks on high-speed links', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '767.pdf');
INSERT INTO papers VALUES (768, 2003, 34, 'Two Visual Computer Network Security Monitoring Tools Incorporating Operator Interface Requirements', 'WHCISEC', 'http://www.andrewpatrick.ca/CHI2003/HCISEC/HCISEC-cfp.html', 1, NULL, '768.pdf');
INSERT INTO papers VALUES (770, 2004, 34, 'Combining Visual and Automated Data Mining for Near-Real- Time Anomaly Detection and Analysis in bgp', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '770.pdf');
INSERT INTO papers VALUES (776, 2006, 31, 'Enhancing Visual Analysis of Network Traffic Using a Knowledge Representation', 'VAST', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4035729', 1, NULL, '776.pdf');
INSERT INTO papers VALUES (779, 2005, 30, 'Visualizing Interdomain Routing with BGPlay', 'JGAA', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '779.pdf');
INSERT INTO papers VALUES (782, 2005, 30, 'Visualizing cyber attacks using IP matrix', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '782.pdf');
INSERT INTO papers VALUES (736, 2000, 171, 'FlowScan- A Network Traffic Flow Reporting and Visualization Tool', 'LISA', 'https://www.usenix.org/legacy/events/lisa00/', 1, NULL, '736.pdf');
INSERT INTO papers VALUES (769, 2004, 34, 'Combining a bayesian classifier with visualisation- understanding the IDS', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '769.pdf');
INSERT INTO papers VALUES (786, 2008, 29, 'Large-Scale Network Monitoring for Visual Analysis of Attacks', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '786.pdf');
INSERT INTO papers VALUES (788, 2008, 28, 'Improving Attack Graph Visualization through Data Reduction and Attack Grouping', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '788.pdf');
INSERT INTO papers VALUES (789, 2005, 27, 'A study of analyzing network traffic as images in real-time', 'INFOCOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=9990', 1, NULL, '789.pdf');
INSERT INTO papers VALUES (791, 2005, 25, 'A User-Centered Approach to Visualizing Network Traffic for Intrusion Detection', 'CHI', 'http://www.chi2005.org/', 1, NULL, '791.pdf');
INSERT INTO papers VALUES (792, 2005, 25, 'Exploring Three-dimensional Visualization for Intrusion Detection', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '792.pdf');
INSERT INTO papers VALUES (793, 2006, 25, 'Countering Security Information Overload through Alert and Packet Visualization', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '793.pdf');
INSERT INTO papers VALUES (796, 2004, 23, 'Scatter (and other) plots for visualizing user profiling data and network traffic', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '796.pdf');
INSERT INTO papers VALUES (799, 2003, 21, 'Ecological interface design- a new approach for visualizing network management', 'ComNet', 'http://www.sciencedirect.com/science/journal/13891286', 1, NULL, '799.pdf');
INSERT INTO papers VALUES (801, 2005, 21, 'Closing-the-Loop in NVisionIP Integrating Discovery and Search in Security Visualizations', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '801.pdf');
INSERT INTO papers VALUES (802, 2009, 21, 'Visualizing Compiled Executables for Malware Analysis', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '802.pdf');
INSERT INTO papers VALUES (803, 2006, 20, 'Detecting Distributed Scans Using High-Performance Query-Driven Visualization', 'SC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4090162', 1, NULL, '803.pdf');
INSERT INTO papers VALUES (804, 2007, 20, 'An Interactive Attack Graph Cascade and Reachability Display', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '804.pdf');
INSERT INTO papers VALUES (805, 2003, 19, 'A Prototype Tool for Visual Data Mining of Network Traffic for Intrusion Detection', 'DMSEC', 'http://cs.fit.edu/~pkc/dmsec03/', 1, NULL, '805.pdf');
INSERT INTO papers VALUES (806, 2004, 19, 'A novel visualization technique for network anomaly detection', 'PST', 'http://www.informatik.uni-trier.de/~ley/db/conf/pst/pst2004.html', 1, NULL, '806.pdf');
INSERT INTO papers VALUES (807, 2006, 19, 'An intelligent, interactive tool for exploration and visualization of time-oriented security data', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '807.pdf');
INSERT INTO papers VALUES (809, 2008, 19, 'GARNET- A Graphical Attack Graph and Reachability Network Evaluation Tool', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '809.pdf');
INSERT INTO papers VALUES (810, 2008, 19, 'Visual Reverse Engineering of Binary and Data Files', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '810.pdf');
INSERT INTO papers VALUES (813, 2009, 18, 'FloVis-Flow Visualization System', 'CATCH', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4804413', 1, NULL, '813.pdf');
INSERT INTO papers VALUES (814, 2009, 18, 'Visual support for analyzing network traffic and intrusion detection events using TreeMap and graph representations', 'CHiMiT', 'http://www.chimit09.org/', 1, NULL, '814.pdf');
INSERT INTO papers VALUES (818, 2006, 16, 'Interactive Exploration of Data Traffic with Hierarchical Network Maps', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '818.pdf');
INSERT INTO papers VALUES (819, 2006, 16, 'Visualizing DNS Traffic', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '819.pdf');
INSERT INTO papers VALUES (821, 2007, 16, 'Interactive wormhole detection and evaluation', 'Information Visualization', 'http://ivi.sagepub.com/', 1, NULL, '821.pdf');
INSERT INTO papers VALUES (822, 2001, 15, 'Visual behavior characterization for intrusion detection in large scale systems', 'VIIP', 'https://www.iasted.org/conferences/pastinfo-652.html', 1, NULL, '822.pdf');
INSERT INTO papers VALUES (824, 2006, 15, 'Visualizations to improve reactivity towards security incidents inside corporate networks', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '824.pdf');
INSERT INTO papers VALUES (772, 2005, 33, 'Visual firewall- real-time network security monitor', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '772.pdf');
INSERT INTO papers VALUES (773, 2006, 32, 'Focusing on Context in Network Traffic Analysis', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '773.pdf');
INSERT INTO papers VALUES (775, 2006, 31, 'Accelerating Network Traffic Analytics Using Query-Driven Visualization', 'VAST', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4035729', 1, NULL, '775.pdf');
INSERT INTO papers VALUES (790, 2003, 26, 'Visualization for Intrusion Detection- Hooking the Worm', 'ESORICS', 'http://link.springer.com/book/10.1007/b13237/page/1', 1, NULL, '790.pdf');
INSERT INTO papers VALUES (800, 2003, 21, 'Intrusion behavior detection through visualization', 'ICSMC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=8811', 1, NULL, '800.pdf');
INSERT INTO papers VALUES (829, 2002, 14, 'Glyph-based generic network visualization', 'SPI 4665', 'http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=876617', 1, NULL, '829.pdf');
INSERT INTO papers VALUES (808, 2006, 19, 'Visualizing Internet Routing Changes', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '808.pdf');
INSERT INTO papers VALUES (811, 2004, 18, 'Efficient visualization of large routing topologies', 'IJNM', 'http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1099-1190', 1, NULL, '811.pdf');
INSERT INTO papers VALUES (812, 2006, 18, 'Bgp Eye- A New Visualization Tool for Real-Time Detection and Analysis of bgp Anomalies', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '812.pdf');
INSERT INTO papers VALUES (816, 2006, 17, 'VISUALISING INTRUSIONS- WATCHING THE WEBSERVER', 'AIS', 'http://link.springer.com/book/10.1007/0-387-27636-X/page/1', 1, NULL, '816.pdf');
INSERT INTO papers VALUES (817, 2004, 16, 'Cyberseer- 3D audio-visual Immersion for Network Security and Management', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '817.pdf');
INSERT INTO papers VALUES (823, 2005, 15, 'Root Polar Layout of Internet Address Data for Security Administration', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '823.pdf');
INSERT INTO papers VALUES (827, 2009, 15, 'Fast detection and visualization of network attacks on parallel coordinates', 'Computers & Security', 'http://www.sciencedirect.com/science/journal/01674048', 1, NULL, '827.pdf');
INSERT INTO papers VALUES (831, 2006, 14, 'Understanding multistage attacks by attack-track based visualization of heterogeneous event streams', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '831.pdf');
INSERT INTO papers VALUES (797, 2007, 22, 'Visual Analysis of Network Flow Data with Timelines and Event Plots', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '797.pdf');
INSERT INTO papers VALUES (820, 2006, 16, 'Real-time collaborative network monitoring and control using 3D game engines for representation and interaction', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '820.pdf');
INSERT INTO papers VALUES (837, 2006, 13, 'STARMINE- a visualization system for cyber attacks', 'APVis', 'http://www.informatik.uni-trier.de/~ley/db/conf/apvis/apvis2006.html', 1, NULL, '837.pdf');
INSERT INTO papers VALUES (838, 2006, 13, 'Flowtag- a collaborative attack-analysis, reporting, and sharing tool for security researchers', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '838.pdf');
INSERT INTO papers VALUES (839, 2008, 13, 'NetFlow Data Visualization Based on Graphs', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '839.pdf');
INSERT INTO papers VALUES (840, 2008, 13, 'Visualization Based Policy Analysis- Case Study in SELinux', 'SACMAT', 'http://www.sacmat.org/2014/index.php', 1, NULL, '840.pdf');
INSERT INTO papers VALUES (841, 2005, 12, 'Designing Visualization Capabilities for IDS Challenges', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '841.pdf');
INSERT INTO papers VALUES (842, 2007, 12, 'Visualising Communication Network Security Attacks', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4271943', 1, NULL, '842.pdf');
INSERT INTO papers VALUES (845, 2007, 12, 'Visualizing Network Security Events Using Compound Glyphs from a Service-Oriented Perspective', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '845.pdf');
INSERT INTO papers VALUES (846, 2009, 12, 'Visual Analysis of Malware Behavior Using Treemaps and Thread Graphs', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '846.pdf');
INSERT INTO papers VALUES (847, 2006, 11, 'Interactively combining 2D and 3D visualization for network traffic monitoring', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '847.pdf');
INSERT INTO papers VALUES (849, 2008, 11, 'A Graph-Theoretic Visualization Approach to Network Risk Analysis', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '849.pdf');
INSERT INTO papers VALUES (850, 2009, 11, 'Visualizing Cyber Security- Usable Workspaces', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '850.pdf');
INSERT INTO papers VALUES (852, 2002, 10, 'A visual technique for internet anomaly detection', 'CGIM ', 'http://www.iasted.org/conferences/pastinfo-358.html', 1, NULL, '852.pdf');
INSERT INTO papers VALUES (853, 2005, 10, 'NetViewer A Network Traffic Visualization and Analysis Tool', 'LISA', 'https://www.usenix.org/legacy/events/lisa05/index.html', 1, NULL, '853.pdf');
INSERT INTO papers VALUES (855, 2005, 10, 'Visualization of Automated Trust Negotiation', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '855.pdf');
INSERT INTO papers VALUES (857, 2001, 9, 'Case study- Visualization and information retrieval techniques for network intrusion detection', 'TCVG', 'http://www.springer.com/computer/image+processing/book/978-3-211-83674-3', 1, NULL, '857.pdf');
INSERT INTO papers VALUES (858, 2006, 9, 'MOVICAB-IDS Visual Analysis of Network Traffic Data Streams for Intrusion Detection', 'IDEAL', 'http://www2.ubu.es/ideal2006/', 1, NULL, '858.pdf');
INSERT INTO papers VALUES (859, 2007, 9, 'Network visualisation- a review', 'IetCom', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=4105970', 1, NULL, '859.pdf');
INSERT INTO papers VALUES (860, 2009, 9, 'OverFlow-An Overview Visualization for Network Analysis', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '860.pdf');
INSERT INTO papers VALUES (861, 2009, 9, 'VIAssist- Visual analytics for cyber defense', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '861.pdf');
INSERT INTO papers VALUES (862, 2003, 8, 'QMTool- an XML-based management platform for QoS-aware IP networks', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '862.pdf');
INSERT INTO papers VALUES (864, 2006, 8, 'Visual toolkit for network security experiment specification and data analysis', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '864.pdf');
INSERT INTO papers VALUES (866, 2007, 8, 'Visualization of Host Behavior for Network Security', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '866.pdf');
INSERT INTO papers VALUES (867, 2007, 8, 'Visualization of Host Behavior for Network Security', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '867.pdf');
INSERT INTO papers VALUES (869, 2008, 8, 'Effective Visualization of File System Access-Control', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '869.pdf');
INSERT INTO papers VALUES (871, 2005, 7, 'Network visualisation and analysis tool based on logical network abridgment', 'MILCOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10687', 1, NULL, '871.pdf');
INSERT INTO papers VALUES (872, 2006, 7, 'Visualization for privacy compliance', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '872.pdf');
INSERT INTO papers VALUES (873, 2007, 7, 'Progressive multiples for communication-minded visualization', 'GI', 'http://dl.acm.org/citation.cfm?id=1268517&picked=prox', 1, NULL, '873.pdf');
INSERT INTO papers VALUES (825, 2006, 15, 'Using visual motifs to classify encrypted traffic', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '825.pdf');
INSERT INTO papers VALUES (828, 2000, 14, 'A management and visualization framework for reconfigurable WDM optical networks', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '828.pdf');
INSERT INTO papers VALUES (830, 2004, 14, 'Scalable visualization of propagating internet phenomena', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '830.pdf');
INSERT INTO papers VALUES (725, 1998, 87, 'A visual approach for monitoring logs', 'LISA', 'https://www.usenix.org/legacy/events/lisa98/', 1, NULL, '725.pdf');
INSERT INTO papers VALUES (905, 2009, 3, 'Visualizing Keyboard Pattern Passwords', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '905.pdf');
INSERT INTO papers VALUES (709, 1993, 2, 'A Virtual World for Network Management', 'VRAIS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=3045', 1, NULL, '709.pdf');
INSERT INTO papers VALUES (710, 1993, 7, 'Using Hy+ for network management and distributed debugging', 'CASCON', 'http://dl.acm.org/citation.cfm?id=962367', 1, NULL, '710.pdf');
INSERT INTO papers VALUES (711, 1993, 11, 'Graphical methods to analyze network data', 'ICC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=3171', 1, NULL, '711.pdf');
INSERT INTO papers VALUES (734, 1999, 69, 'Network visualization with the VINT network animator nam', 'USC Technical Report', 'http://www.cs.usc.edu/assets/003/83132.pdf', 1, NULL, '734.pdf');
INSERT INTO papers VALUES (737, 2004, 157, 'NVisionIP NetFlow Visualizations of System State for Security Situational Awareness', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '737.pdf');
INSERT INTO papers VALUES (784, 2000, 29, 'Visualization in detection of intrusions and misuse in large scale networks', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6925', 1, NULL, '784.pdf');
INSERT INTO papers VALUES (785, 2007, 29, 'Visual Analysis of Network Traffic for Resource Planning, Interactive Monitoring, and Interpretation of Security Threats', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '785.pdf');
INSERT INTO papers VALUES (832, 2007, 14, 'SpiralView- Towards Security Policies Assessment through Visual Correlation of Network Resources with Evolution of Alarms', 'VAST', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4388976', 1, NULL, '832.pdf');
INSERT INTO papers VALUES (881, 2008, 6, 'Existence Plots- A Low-Resolution Time Series for Port Behavior Analysis', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '881.pdf');
INSERT INTO papers VALUES (882, 2000, 5, 'CyberNet- A framework for managing networks using 3D metaphoric worlds', 'Annals of Telecommunications', 'http://link.springer.com/journal/12243', 1, NULL, '882.pdf');
INSERT INTO papers VALUES (884, 2008, 5, 'Visual Analysis of Program Flow Data with Data Propagation', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '884.pdf');
INSERT INTO papers VALUES (932, 2008, 0, 'Show Me How You See- Lessons from Studying Computer Forensics Experts for Visualization', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '932.pdf');
INSERT INTO papers VALUES (933, 2008, 0, 'Modeling of Network Situation Awareness', 'ICCCAS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4636103', 1, NULL, '933.pdf');
INSERT INTO papers VALUES (935, 2009, 0, 'Interactive Visualization of Network Anomalous Events', 'ICCS', 'http://www.iccs-meeting.org/iccs2009/', 1, NULL, '935.pdf');
INSERT INTO papers VALUES (980, 2012, 2, 'The Future of Security Visualization- Lessons from Network Visualization', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '980.pdf');
INSERT INTO papers VALUES (983, 2010, 1, 'Visualizing Your Key for Secure Phone Calls And Language Independence', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '983.pdf');
INSERT INTO papers VALUES (874, 2008, 7, 'A Term Distribution Visualization Approach to Digital Forensic String Search', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '874.pdf');
INSERT INTO papers VALUES (875, 2009, 7, 'Visualization is Better! A Comparative Evaluation', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '875.pdf');
INSERT INTO papers VALUES (876, 2007, 6, 'Integrated visualization system for monitoring security in large-scale local area network', 'APVis', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4126199', 1, NULL, '876.pdf');
INSERT INTO papers VALUES (726, 1998, 169, 'MRTG-The Multi Router Traffic Grapher', 'LISA', 'https://www.usenix.org/legacy/events/lisa98/', 1, NULL, '726.pdf');
INSERT INTO papers VALUES (707, 1990, 13, 'Dynamic graphics for network visualization', 'VISUAL', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=311', 1, NULL, '707.pdf');
INSERT INTO papers VALUES (879, 2008, 6, 'Using visualization to support network and application management in a data center', 'INETMW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4656372', 1, NULL, '879.pdf');
INSERT INTO papers VALUES (835, 2005, 13, 'Internet Routing Anomaly Detection and Visualization', 'DSN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=9904', 1, NULL, '835.pdf');
INSERT INTO papers VALUES (836, 2006, 13, 'Flamingo- Visualizing Internet Traffic', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=11101', 1, NULL, '836.pdf');
INSERT INTO papers VALUES (844, 2007, 12, 'The Real Work of Computer Network Defense Analysts- The Analysis Roles and Processes that Transform Network Data into Security Situation Awareness', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '844.pdf');
INSERT INTO papers VALUES (880, 2008, 6, 'Mesh Topology Viewer (MTV) - an SVG-Based Interactive Mesh Network Topology Visualization Tool', 'ISCC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4607772', 1, NULL, '880.pdf');
INSERT INTO papers VALUES (865, 2007, 8, 'High Level Internet Scale Traffic Visualization Using Hilbert Curve Mapping', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '865.pdf');
INSERT INTO papers VALUES (705, 1989, 1, 'A graphical representation for network management', 'LCN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=256', 1, NULL, '705.pdf');
INSERT INTO papers VALUES (851, 2002, 10, 'Intrusion Detection- Visualizing Attacks in IDS Data', 'GIAC-GCIA', 'http://www.giac.org/', 1, NULL, '851.pdf');
INSERT INTO papers VALUES (708, 1992, 1, 'Concurrent Use of Parallel Communication to Enable Remote Visualization', 'ICCI', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=410', 1, NULL, '708.pdf');
INSERT INTO papers VALUES (706, 1988, 32, 'Heuristic layout algorithms for network management presentation services', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '706.pdf');
INSERT INTO papers VALUES (717, 1996, 9, 'Using Visualization in System and Network Administration', 'LISA', 'https://www.usenix.org/legacy/publications/library/proceedings/lisa96/', 1, NULL, '717.pdf');
INSERT INTO papers VALUES (719, 1996, 68, 'Real-time geographic visualization of World Wide Web traffic', 'Computer Networks and ISDN Systems', 'http://www.sciencedirect.com/science/journal/01697552', 1, NULL, '719.pdf');
INSERT INTO papers VALUES (951, 2011, 5, 'Monitoring large IP spaces with ClockView', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '951.pdf');
INSERT INTO papers VALUES (704, 1985, 29, 'CNMGRAF-graphic presentation services for network management', 'Symposium on Data communications', 'http://dl.acm.org/citation.cfm?id=319056&picked=prox', 1, NULL, '704.pdf');
INSERT INTO papers VALUES (891, 2006, 4, 'USEable security- interface design strategies for improving security', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '891.pdf');
INSERT INTO papers VALUES (893, 2008, 4, 'Using visualization techniques for SNMP traffic analyses', 'ISCC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4607772', 1, NULL, '893.pdf');
INSERT INTO papers VALUES (894, 2008, 4, 'Using Time Series 3D AlertGraph and False Alert Classification to Analyse Snort Alerts', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '894.pdf');
INSERT INTO papers VALUES (895, 2009, 4, 'NetViewer- A Visualization Tool for Network Security Events', 'NSWCTC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4908190', 1, NULL, '895.pdf');
INSERT INTO papers VALUES (897, 2005, 3, 'Visualising internet traffic data with three-dimensional spherical display', 'APVis', 'http://www.informatik.uni-trier.de/~ley/db/conf/apvis/apvis2005.html', 1, NULL, '897.pdf');
INSERT INTO papers VALUES (854, 2005, 10, 'User Requirements and Design of a Visualization for Intrusion Detection Analysis', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10007', 1, NULL, '854.pdf');
INSERT INTO papers VALUES (1027, 2012, 0, 'Visualizing Distributed Memory Computations with Hive Plots', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1027.pdf');
INSERT INTO papers VALUES (856, 2006, 10, 'Vast- Visualizing Autonomous System Topology', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '856.pdf');
INSERT INTO papers VALUES (863, 2004, 8, 'Network Eye- End-to-End Computer Security Visualization', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '863.pdf');
INSERT INTO papers VALUES (877, 2007, 6, 'Putting Security in Context- Visual Correlation of Network Activity with Real-World Information', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '877.pdf');
INSERT INTO papers VALUES (878, 2007, 6, 'Using InetVis to Evaluate Snort and Bro Scan Detection on a Network Telescope', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '878.pdf');
INSERT INTO papers VALUES (843, 2007, 12, 'Introduction to Visualization for Computer Security', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '843.pdf');
INSERT INTO papers VALUES (885, 2008, 5, 'BGPeep- An IP-Space Centered View for Internet Routing Data', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '885.pdf');
INSERT INTO papers VALUES (886, 2008, 5, 'Visualizing Real-Time Network Resource Usage', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '886.pdf');
INSERT INTO papers VALUES (889, 2009, 5, 'Security Visualization Tools and IPv6 Addresses', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '889.pdf');
INSERT INTO papers VALUES (890, 2006, 4, 'Discovering an RC4 anomaly through visualization', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '890.pdf');
INSERT INTO papers VALUES (1037, 2013, 0, 'SRNET- A Real-time, Cross-based Anomaly Detection and Visualization System for Wireless Sensor Networks', 'VizSec', 'http://vizsec.org/', 1, NULL, '1037.pdf');
INSERT INTO papers VALUES (1035, 2013, 0, 'An Integrated Environment for Visualization of Distributed Wireless Sensor Networks', 'ICCA', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6550152', 1, NULL, '1035.pdf');
INSERT INTO papers VALUES (1042, 2013, 0, 'Visualization Framework for Inter-Domain Access Control Policy Integration', 'CC', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=6245522', 1, NULL, '1042.pdf');
INSERT INTO papers VALUES (1044, 2013, 0, 'Real-time Network Security Situation Visualization and Threat Assessment Based on Semi-Markov Process', 'ICMV', 'http://www.conferencealerts.com/show-event?id=103602', 1, NULL, '1044.pdf');
INSERT INTO papers VALUES (1052, 2013, 0, 'ELVIS- Extensible Log VISualization', 'VizSec', 'http://vizsec.org/', 1, NULL, '1052.pdf');
INSERT INTO papers VALUES (1054, 2013, 0, 'CyberSAVe-Situational Awareness Visualization for Cyber Security of Smart Grid Systems', 'VizSec', 'http://vizsec.org/', 1, NULL, '1054.pdf');
INSERT INTO papers VALUES (1026, 2012, 0, 'MalwareVis- Entry-based Visualization of Malware Network Traces', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1026.pdf');
INSERT INTO papers VALUES (1032, 2013, 0, 'Static Validation of Network Device Configurations in Virtualized Multi-tenant Datacenters', 'IM', 'http://www.im2013.org/', 1, NULL, '1032.pdf');
INSERT INTO papers VALUES (1040, 2013, 0, 'A survey on security visualization techniques for web information systems', 'International Journal of Web Information Systems', 'http://www.emeraldinsight.com/products/journals/journals.htm?id=ijwis', 1, NULL, '1040.pdf');


--
-- Data for Name: papers_nm_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: papers_nm_comments_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('papers_nm_comments_seq', 9, true);


--
-- Data for Name: papers_nm_subtopic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: papers_nm_subtopic_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('papers_nm_subtopic_seq', 19, true);


--
-- Name: papers_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('papers_seq', 1085, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tool
--

INSERT INTO users VALUES (1, 'admin', '704b037a97fa9b25522b7c014c300f8a', 'vicoguim@gmail.com', 1);
INSERT INTO users VALUES (2, 'lisandro', 'e856ffdb3370d1b2825dc5a520457efa', '', 1);
INSERT INTO users VALUES (3, 'ramin', 'e856ffdb3370d1b2825dc5a520457efa', '', 1);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: tool
--

SELECT pg_catalog.setval('users_seq', 1, false);


--
-- Name: nm_subtopic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nm_subtopic
    ADD CONSTRAINT nm_subtopic_pkey PRIMARY KEY (id);


--
-- Name: nm_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nm_topic
    ADD CONSTRAINT nm_topic_pkey PRIMARY KEY (id);


--
-- Name: papers_nm_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY papers_nm_comments
    ADD CONSTRAINT papers_nm_comments_pkey PRIMARY KEY (id);


--
-- Name: papers_nm_subtopic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY papers_nm_subtopic
    ADD CONSTRAINT papers_nm_subtopic_pkey PRIMARY KEY (id);


--
-- Name: papers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: tool; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: nm_subtopic_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nm_subtopic
    ADD CONSTRAINT nm_subtopic_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES nm_topic(id);


--
-- Name: papers_nm_comments_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY papers_nm_comments
    ADD CONSTRAINT papers_nm_comments_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES papers(id);


--
-- Name: papers_nm_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY papers_nm_comments
    ADD CONSTRAINT papers_nm_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: papers_nm_subtopic_nm_subtopic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY papers_nm_subtopic
    ADD CONSTRAINT papers_nm_subtopic_nm_subtopic_id_fkey FOREIGN KEY (nm_subtopic_id) REFERENCES nm_subtopic(id);


--
-- Name: papers_nm_subtopic_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY papers_nm_subtopic
    ADD CONSTRAINT papers_nm_subtopic_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES papers(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: nm_subtopic_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE nm_subtopic_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE nm_subtopic_seq FROM postgres;
GRANT ALL ON SEQUENCE nm_subtopic_seq TO postgres;
GRANT ALL ON SEQUENCE nm_subtopic_seq TO tool;


--
-- Name: nm_subtopic; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE nm_subtopic FROM PUBLIC;
REVOKE ALL ON TABLE nm_subtopic FROM postgres;
GRANT ALL ON TABLE nm_subtopic TO postgres;
GRANT ALL ON TABLE nm_subtopic TO tool;


--
-- Name: nm_topic; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE nm_topic FROM PUBLIC;
REVOKE ALL ON TABLE nm_topic FROM postgres;
GRANT ALL ON TABLE nm_topic TO postgres;
GRANT ALL ON TABLE nm_topic TO tool;


--
-- Name: papers_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE papers_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE papers_seq FROM postgres;
GRANT ALL ON SEQUENCE papers_seq TO postgres;
GRANT ALL ON SEQUENCE papers_seq TO tool;


--
-- Name: papers; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE papers FROM PUBLIC;
REVOKE ALL ON TABLE papers FROM postgres;
GRANT ALL ON TABLE papers TO postgres;
GRANT ALL ON TABLE papers TO tool;


--
-- Name: papers_nm_comments_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE papers_nm_comments_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE papers_nm_comments_seq FROM postgres;
GRANT ALL ON SEQUENCE papers_nm_comments_seq TO postgres;
GRANT ALL ON SEQUENCE papers_nm_comments_seq TO tool;


--
-- Name: papers_nm_comments; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE papers_nm_comments FROM PUBLIC;
REVOKE ALL ON TABLE papers_nm_comments FROM postgres;
GRANT ALL ON TABLE papers_nm_comments TO postgres;
GRANT ALL ON TABLE papers_nm_comments TO tool;


--
-- Name: papers_nm_subtopic_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE papers_nm_subtopic_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE papers_nm_subtopic_seq FROM postgres;
GRANT ALL ON SEQUENCE papers_nm_subtopic_seq TO postgres;
GRANT ALL ON SEQUENCE papers_nm_subtopic_seq TO tool;


--
-- Name: papers_nm_subtopic; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE papers_nm_subtopic FROM PUBLIC;
REVOKE ALL ON TABLE papers_nm_subtopic FROM postgres;
GRANT ALL ON TABLE papers_nm_subtopic TO postgres;
GRANT ALL ON TABLE papers_nm_subtopic TO tool;


--
-- PostgreSQL database dump complete
--

