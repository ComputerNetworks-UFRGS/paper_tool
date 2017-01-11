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
    active smallint DEFAULT 1,
    color text
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
    file text,
    network_rating integer DEFAULT 0,
    visualization_rating integer DEFAULT 0
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

INSERT INTO nm_topic VALUES (4, 'Functional Areas', 1, '#0000CF');
INSERT INTO nm_topic VALUES (5, 'Management Approaches', 1, '#B800B8');
INSERT INTO nm_topic VALUES (6, 'Technologies', 1, '#FFA500');
INSERT INTO nm_topic VALUES (1, 'Network Management', 1, '#D50000');
INSERT INTO nm_topic VALUES (7, 'Methods', 1, '#CCCC03');
INSERT INTO nm_topic VALUES (2, 'Service Management', 1, '#22AC00');
INSERT INTO nm_topic VALUES (3, 'Business Management', 1, '#06DDE6');


--
-- Data for Name: papers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO papers VALUES (914, 2007, 2, 'A novel visualization approach for efficient network-wide traffic monitoring', 'E2EMON', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4261330', 1, NULL, '914.pdf', 2, 0);
INSERT INTO papers VALUES (806, 2004, 19, 'A novel visualization technique for network anomaly detection', 'PST', 'http://www.informatik.uni-trier.de/~ley/db/conf/pst/pst2004.html', 1, NULL, '806.pdf', 3, 0);
INSERT INTO papers VALUES (1094, 2013, 0, 'Method for visualizing information from  large-scale carrier networks', 'APNOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6648475', 1, '', '1094.pdf', 2, 0);
INSERT INTO papers VALUES (804, 2007, 20, 'An Interactive Attack Graph Cascade and Reachability Display', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '804.pdf', 3, 0);
INSERT INTO papers VALUES (1063, 2003, 60, 'Visual problem- solving support for new event triage in centralized network security monitoring- Challenges, tools and benefits', 'IMF', 'http://www.informatik.uni-trier.de/~ley/db/conf/sidar/sidar2003.html', 1, NULL, '1063.pdf', 2, 0);
INSERT INTO papers VALUES (1095, 2012, 1, 'A Framework to Leverage Domain Expertise to  Support Novice Users in the Visual Exploration of  Home Area Networks', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6203618', 1, '', '1095.pdf', 2, 0);
INSERT INTO papers VALUES (865, 2007, 8, 'High Level Internet Scale Traffic Visualization Using Hilbert Curve Mapping', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '865.pdf', 2, 0);
INSERT INTO papers VALUES (716, 1996, 8, 'Visualizing the World Wide Web', 'AVI', 'http://www.interaction-design.org/references/conferences/avi_1996_-_proceedings_of_the_workshop_on_advanced_visual_interfaces.html', 1, NULL, '716.pdf', 1, 0);
INSERT INTO papers VALUES (1096, 2012, 0, 'Share and visualize your data using the perfSONAR NC framework', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6203618', 1, '', '1096.pdf', 4, 0);
INSERT INTO papers VALUES (821, 2007, 16, 'Interactive wormhole detection and evaluation', 'Information Visualization', 'http://ivi.sagepub.com/', 1, NULL, '821.pdf', 4, 0);
INSERT INTO papers VALUES (1087, 2011, 14, 'An information plane architecture supporting home network management', 'IM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5976317', 1, 'This paper does not address visualizations, although the Authors highlight it.', '1087.pdf', 3, 0);
INSERT INTO papers VALUES (832, 2007, 14, 'SpiralView- Towards Security Policies Assessment through Visual Correlation of Network Resources with Evolution of Alarms', 'VAST', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4388976', 1, NULL, '832.pdf', 3, 0);
INSERT INTO papers VALUES (1088, 2013, 0, 'MANET Viewer III: 3D Visualization System for Mobile Ad-hoc Networks', 'NBiS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6684444', 1, '', '1088.pdf', 4, 0);
INSERT INTO papers VALUES (883, 2007, 5, 'Visual Analysis of Corporate Network Intelligence- Abstracting and Reasoning on Yesterdays for Acting Today', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '883.pdf', 3, 0);
INSERT INTO papers VALUES (1089, 2013, 2, 'Analytical Visualization Techniques  for Security Information and Event Management', 'PDP', 'http://www.pdp2013.org/‎', 1, '', '1089.pdf', 2, 0);
INSERT INTO papers VALUES (793, 2006, 25, 'Countering Security Information Overload through Alert and Packet Visualization', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '793.pdf', 5, 0);
INSERT INTO papers VALUES (1090, 2012, 1, 'Wireless Sensor Network Security Visualization', 'ICUMT', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6449582', 1, '', '1090.pdf', 0, 0);
INSERT INTO papers VALUES (1066, 2006, 0, 'Processing Data to Construct Practical Visualizations for Network Security', 'CSIAC', 'https://www.thecsiac.com/journal/processing-data-construct-practical-visualizations-network-security', 1, NULL, '1066.pdf', 2, 0);
INSERT INTO papers VALUES (1091, 2012, 4, 'RelEx: Visualization for Actively Changing Overlay Network Speciﬁcations', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, '', '1091.pdf', 0, 0);
INSERT INTO papers VALUES (935, 2009, 0, 'Interactive Visualization of Network Anomalous Events', 'ICCS', 'http://www.iccs-meeting.org/iccs2009/', 1, NULL, '935.pdf', 0, 0);
INSERT INTO papers VALUES (746, 2005, 77, 'IDS RainStorm Visualizing IDS Alarms', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '746.pdf', 3, 0);
INSERT INTO papers VALUES (908, 2001, 2, 'Network Management Visualization with PingTV', 'LCN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7773', 1, NULL, '908.pdf', 1, 0);
INSERT INTO papers VALUES (917, 2007, 2, 'Intelligent Classification and Visualization of Network Scans', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '917.pdf', 2, 0);
INSERT INTO papers VALUES (795, 2005, 24, 'Information Assurance Visualizations for Specific Stages of Situational Awareness and Intended Uses- Lessons Learned', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '795.pdf', 2, 0);
INSERT INTO papers VALUES (909, 2001, 2, 'PingTV- a case study in visual network monitoring', 'VIS', 'http://ieeevis.org/', 1, NULL, '909.pdf', 1, 0);
INSERT INTO papers VALUES (868, 2007, 8, 'NetBytes Viewer- An Entity-Based NetFlow Visualization Utility for Identifying Intrusive Behavior', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '868.pdf', 3, 0);
INSERT INTO papers VALUES (898, 2006, 3, 'Interactive Network Management Visualization with SVG and AJAX', 'LISA', 'https://www.usenix.org/legacy/events/lisa06/index.html', 1, NULL, '898.pdf', 4, 0);
INSERT INTO papers VALUES (913, 2006, 2, 'Tool update- NVisionIP improvements (difference view, sparklines, and shapes)', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '913.pdf', 2, 0);
INSERT INTO papers VALUES (911, 2005, 2, 'An intelligent self-learning algorithm for IP network topology discovery', 'LANMAN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10349', 0, NULL, '911.pdf', 0, 0);
INSERT INTO papers VALUES (787, 2005, 28, 'Visual correlation of host processes and network traffic', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '787.pdf', 5, 0);
INSERT INTO papers VALUES (815, 2003, 17, 'A visualization tool for situational awareness of tactical and strategic security events on large and complex computer networks', 'MILCOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=9057', 1, NULL, '815.pdf', 2, 0);
INSERT INTO papers VALUES (720, 1996, 73, 'Aspects of Network Visualization', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '720.pdf', 4, 0);
INSERT INTO papers VALUES (735, 2000, 187, 'Mapping and visualizing the internet', 'USENIX', 'http://www.informatik.uni-trier.de/~ley/db/conf/usenix/usenix2000g.html', 1, NULL, '735.pdf', 0, 0);
INSERT INTO papers VALUES (986, 2011, 1, 'Data visualization technique framework for intrusion detection', 'IJCSI', 'http://www.ijcsi.org/', 1, NULL, '986.pdf', 0, 0);
INSERT INTO papers VALUES (881, 2008, 6, 'Existence Plots- A Low-Resolution Time Series for Port Behavior Analysis', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '881.pdf', 0, 0);
INSERT INTO papers VALUES (756, 2002, 46, 'Mielog- A Highly Interactive Visual Log Browser Using Information Visualization and Statistical Analysis', 'LISA', 'https://www.usenix.org/legacy/publications/library/proceedings/lisa02/', 1, NULL, '756.pdf', 0, 0);
INSERT INTO papers VALUES (906, 2009, 3, 'Visualizing Firewall Configurations Using Created Voids', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '906.pdf', 0, 0);
INSERT INTO papers VALUES (970, 2010, 2, 'Expert-Aware Approach- A New Approach to Improve Network Security Visualization Tool', 'CICSYN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5613973', 1, NULL, '970.pdf', 0, 0);
INSERT INTO papers VALUES (1086, 2010, 6, 'NetViewer: A Universal Visualization Tool for Wireless Sensor Networks', 'GLOBECOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5682081', 1, 'Paper published in GLOBECOM 2010.', '1086.pdf', 0, 0);
INSERT INTO papers VALUES (978, 2011, 2, 'A Method of Network Topology Visualization Based on SNMP', 'IMCCC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6119177', 1, NULL, '978.pdf', 0, 0);
INSERT INTO papers VALUES (901, 2008, 3, 'Improving Security Visualization with Exposure Map Filtering', 'ACSAC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4721525', 1, NULL, '901.pdf', 0, 0);
INSERT INTO papers VALUES (902, 2008, 3, 'A Task Centered Framework for Computer Security Data Visualization', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '902.pdf', 0, 0);
INSERT INTO papers VALUES (903, 2009, 3, 'Study On Advanced Visualization Tools In Network Monitoring Platform', 'EMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5358680', 1, NULL, '903.pdf', 0, 0);
INSERT INTO papers VALUES (910, 2004, 2, 'Researchers develop network-security visualization tools', 'COMPUTER', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2', 1, NULL, '910.pdf', 0, 0);
INSERT INTO papers VALUES (918, 2008, 2, 'A Novel Visualization Approach for Efficient Network Scans Detection', 'SECTECH', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4725323', 1, NULL, '918.pdf', 0, 0);
INSERT INTO papers VALUES (920, 2008, 2, 'Wireless Cyber Assets Discovery Visualization', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '920.pdf', 0, 0);
INSERT INTO papers VALUES (833, 2000, 13, 'Automatic construction of dynamic 3D metaphoric worlds- An application to network management', 'SPIE 3960', 'http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=920397', 1, NULL, '833.pdf', 0, 0);
INSERT INTO papers VALUES (749, 2002, 56, 'Network intrusion visualization with NIVA, an intrusion detection visual analyzer with haptic integration', 'HAPTICS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7836', 1, NULL, '749.pdf', 2, 0);
INSERT INTO papers VALUES (1092, 2013, 0, 'Mesh Net Viewer: A Visualization System for Wireless Mesh Networks', 'BWCCA', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6689793', 1, '', '1092.pdf', 3, 0);
INSERT INTO papers VALUES (870, 2009, 8, 'SURFmap - A network monitoring tool based on the Google Maps API', 'IM', 'https://www.google.com.br/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CC0QFjAA&url=http%3A%2F%2Fim2009.ieee-im.org%2F&ei=cEVcUpW1LYKUqgHE5YAw&usg=AFQjCNGN155Lbe_Ww00r6ZFU2q62EmrUnQ&sig2=0Y1f7TO4IPetJSj1tl-kgA&bvm=bv.53899372,d.aWM', 1, NULL, '870.pdf', 0, 0);
INSERT INTO papers VALUES (921, 2008, 2, 'Backhoe, a Packet Trace and Log Browser', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '921.pdf', 0, 0);
INSERT INTO papers VALUES (922, 2009, 2, 'A Visual Analytic Framework for Exploring Relationships in Textual Contents of Digital Forensics Evidence', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '922.pdf', 0, 0);
INSERT INTO papers VALUES (981, 2010, 1, 'Alerts Analysis and Visualization in Network-based Intrusion Detection Systems', 'SOCIALCOM', 'http://www.ieee.org/conferences_events/conferences/conferencedetails/index.html?Conf_ID=17735', 1, NULL, '981.pdf', 0, 0);
INSERT INTO papers VALUES (1006, 2010, 0, 'Correlation, Visualization, and Usability Analysis of Routing Policy Configurations', 'TNSM', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=4275028', 1, NULL, '1006.pdf', 0, 0);
INSERT INTO papers VALUES (1029, 2012, 0, 'A system to provide real-time collaborative situational awareness by Web enabling a distributed sensor network', 'SWE', 'http://acmgis2012.cs.umd.edu/', 1, NULL, '1029.pdf', 0, 0);
INSERT INTO papers VALUES (1048, 2013, 0, 'Visualization of web form submissions for security analysis', 'International Journal of Web Information Systems', 'http://www.emeraldinsight.com/products/journals/journals.htm?id=ijwis', 1, NULL, '1048.pdf', 0, 0);
INSERT INTO papers VALUES (1052, 2013, 0, 'ELVIS- Extensible Log VISualization', 'VizSec', 'http://vizsec.org/', 1, NULL, '1052.pdf', 0, 0);
INSERT INTO papers VALUES (927, 2008, 1, 'Network Traffic Exploration Application- A Tool to Assess, Visualize, and Analyze Network Security Events', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '927.pdf', 0, 0);
INSERT INTO papers VALUES (929, 2009, 1, 'Visualization of Network Security Traffic using Hexagonal Self-Organizing Maps', 'CAINE', 'http://www.informatik.uni-trier.de/~ley/db/conf/caine/caine2009.html', 1, NULL, '929.pdf', 0, 0);
INSERT INTO papers VALUES (930, 2009, 1, 'RadialNet- An Interactive Network Topology Visualization Tool with Visual Auditing Support', 'CRITIS', 'http://link.springer.com/book/10.1007/978-3-642-03552-4/page/1', 1, NULL, '930.pdf', 0, 0);
INSERT INTO papers VALUES (887, 2009, 5, 'Visualization of node interaction dynamics in network traces', 'AIMS', 'http://dl.acm.org/citation.cfm?id=1574663', 1, NULL, '887.pdf', 0, 0);
INSERT INTO papers VALUES (904, 2009, 3, 'Visualization of complex attacks and state of attacked network', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '904.pdf', 0, 0);
INSERT INTO papers VALUES (907, 2009, 3, 'SecVizer- A Security Visualization Tool for QualNetGenerated Traffic Traces', 'THS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5159754', 1, NULL, '907.pdf', 0, 0);
INSERT INTO papers VALUES (780, 2005, 30, 'Attacking information visualization system usability overloading and deceiving the human', 'SOUPS', 'http://cups.cs.cmu.edu/soups/2005/', 1, NULL, '780.pdf', 0, 0);
INSERT INTO papers VALUES (957, 2011, 4, 'Malware images- visualization and automatic classification', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '957.pdf', 0, 0);
INSERT INTO papers VALUES (958, 2011, 4, 'TVi- a visual querying system for network monitoring and anomaly detection', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '958.pdf', 0, 0);
INSERT INTO papers VALUES (959, 2011, 4, 'Sybil attack detection through global topology pattern visualization', 'Information Visualization', 'http://ivi.sagepub.com/', 1, NULL, '959.pdf', 0, 0);
INSERT INTO papers VALUES (961, 2010, 3, 'An ontology-driven approach to support wireless network monitoring for home area networks', 'CNSM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6093621', 1, NULL, '961.pdf', 0, 0);
INSERT INTO papers VALUES (964, 2010, 3, 'Visualisation and Verification of Communication Protocols for Networked Distributed Systems', 'Enterprise Networks and Logistics for Agile Manufacturing', 'http://link.springer.com/chapter/10.1007%2F978-1-84996-244-5_16', 1, NULL, '964.pdf', 0, 0);
INSERT INTO papers VALUES (919, 2008, 2, 'An investigation of visualization techniques forSNMP traffic traces', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4567164', 1, NULL, '919.pdf', 0, 0);
INSERT INTO papers VALUES (892, 2007, 4, 'Visually Understanding Jam Resistant Communication', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '892.pdf', 0, 0);
INSERT INTO papers VALUES (934, 2008, 0, 'A Real-Time Interactive Visualization System for DNS Amplification Attack Challenges', 'ICIS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4529779', 1, NULL, '934.pdf', 0, 0);
INSERT INTO papers VALUES (936, 2011, 79, 'Neural visualization of network traffic data for intrusion detection', 'Applied Soft Computing', 'http://www.sciencedirect.com/science/journal/15684946', 1, NULL, '936.pdf', 0, 0);
INSERT INTO papers VALUES (939, 2010, 15, 'Predictive Network Anomaly Detection and Visualization', 'TIFS', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=10206', 1, NULL, '939.pdf', 0, 0);
INSERT INTO papers VALUES (926, 2007, 1, 'Measuring the Complexity of Computer Security Visualization Designs', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '926.pdf', 3, 0);
INSERT INTO papers VALUES (925, 2007, 1, 'Adapting Personas for Use in Security Visualization Design', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '925.pdf', 3, 0);
INSERT INTO papers VALUES (915, 2007, 2, 'Integrated Environment Management for Information Operations Testbeds', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '915.pdf', 2, 0);
INSERT INTO papers VALUES (912, 2006, 2, 'Grid Based Network Address Space Browsing for Network Traffic Visualization', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10992', 1, NULL, '912.pdf', 4, 0);
INSERT INTO papers VALUES (916, 2007, 2, 'VisAlert- From Idea to Product', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '916.pdf', 2, 0);
INSERT INTO papers VALUES (924, 2007, 1, 'Visualizing Network Status', 'ICMLC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4370103', 1, NULL, '924.pdf', 2, 0);
INSERT INTO papers VALUES (900, 2006, 3, 'Visualization assisted detection of sybil attacks in wireless networks', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '900.pdf', 3, 0);
INSERT INTO papers VALUES (899, 2006, 3, 'Tool update- high alarm count issues in IDS rainstorm', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '899.pdf', 2, 0);
INSERT INTO papers VALUES (896, 2005, 3, 'IPMatrix- an effective visual- ization framework for cyber threat monitoring', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10086', 1, NULL, '896.pdf', 2, 0);
INSERT INTO papers VALUES (748, 2002, 56, 'Case Study - Interactive Visualization for Internet Security', 'VISUAL', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=8436', 1, NULL, '748.pdf', 2, 0);
INSERT INTO papers VALUES (923, 2005, 1, 'SVision- A network host-centered anomaly visualization technique', 'ISC', 'http://www.informatik.uni-trier.de/~ley/db/conf/isw/isc2005.html', 1, NULL, '923.pdf', 2, 0);
INSERT INTO papers VALUES (729, 1999, 6, 'Navigation in huge information hierarchies application to network management', 'CIKM', 'http://www.cikmconference.org/1999/', 1, NULL, '729.pdf', 1, 0);
INSERT INTO papers VALUES (771, 2001, 33, 'Visual Traffic Monitoring and Evaluation', 'SPIE 4523', 'http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=896054', 1, NULL, '771.pdf', 1, 0);
INSERT INTO papers VALUES (1061, 2000, 49, 'Supporting intrusion detection by graph clustering and graph drawing', 'RAID', 'http://www.raid-symposium.org/raid2000/', 1, NULL, '1061.pdf', 2, 0);
INSERT INTO papers VALUES (715, 1995, 384, 'Visualizing Network Data', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '715.pdf', 5, 0);
INSERT INTO papers VALUES (940, 2010, 12, 'Visualizing Attack Graphs, Reachability, and Trust Relationships with NAVIGATOR', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '940.pdf', 0, 0);
INSERT INTO papers VALUES (941, 2010, 10, 'Visualizing graph dynamics and similarity for enterprise network security and management', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '941.pdf', 0, 0);
INSERT INTO papers VALUES (942, 2010, 9, 'Real-Time Visualization of Network Behaviors for Situational Awareness', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '942.pdf', 0, 0);
INSERT INTO papers VALUES (945, 2010, 7, 'Visual Analysis of Code Security', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '945.pdf', 0, 0);
INSERT INTO papers VALUES (946, 2010, 7, 'Detection, Correlation, and Visualization of Attacks Against Critical Infrastructure Systems', 'PST', 'http://xplqa30.ieee.org/xpl/mostRecentIssue.jsp?punumber=5564352', 1, NULL, '946.pdf', 0, 0);
INSERT INTO papers VALUES (937, 2010, 23, 'Eden- supporting home network management through interactive visual tools', 'UIST', 'http://www.acm.org/uist/uist2010/', 1, NULL, '937.pdf', 0, 0);
INSERT INTO papers VALUES (953, 2010, 4, 'A new concentric-circle visualization of multi-dimensional data and its application in network security', 'Journal of Visual Languages and Computing', 'http://www.journals.elsevier.com/journal-of-visual-languages-and-computing/', 1, NULL, '953.pdf', 0, 0);
INSERT INTO papers VALUES (987, 2011, 1, 'Atypical Behavior Identification in Large-Scale Network Traffic', 'LDAV', 'http://vis.cs.ucdavis.edu/LDAV/', 1, NULL, '987.pdf', 0, 0);
INSERT INTO papers VALUES (943, 2010, 9, 'What Happened in my Network? Mining Network Events from Router Syslogs', 'IMC', 'http://conferences.sigcomm.org/imc/2010/', 1, NULL, '943.pdf', 0, 0);
INSERT INTO papers VALUES (962, 2010, 3, 'EMBER- A Global Perspective on Extreme Malicious Behavior', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '962.pdf', 0, 0);
INSERT INTO papers VALUES (948, 2010, 5, 'Managing networks through context- Graph visualization and exploration', 'ComNet', 'http://www.journals.elsevier.com/computer-networks/', 1, NULL, '948.pdf', 0, 0);
INSERT INTO papers VALUES (949, 2010, 5, 'Applied parallel coordinates for logs and network traffic attack analysis', 'Journal of Computer Virology and Hacking Techniques', 'http://link.springer.com/journal/11416', 1, NULL, '949.pdf', 0, 0);
INSERT INTO papers VALUES (952, 2012, 5, 'Visual Analysis of Complex Firewall Configurations', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '952.pdf', 0, 0);
INSERT INTO papers VALUES (954, 2010, 4, 'Towards non-expert users monitoring networks and services through semantically enhanced visualizations', 'CNSM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5668576', 1, NULL, '954.pdf', 0, 0);
INSERT INTO papers VALUES (956, 2010, 4, 'Proposing a Multi-touch Interface for Intrusion Detection Environments', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '956.pdf', 0, 0);
INSERT INTO papers VALUES (969, 2012, 3, 'Visual Spam Campaigns Analysis Using Abstract Graphs Representation', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '969.pdf', 0, 0);
INSERT INTO papers VALUES (967, 2011, 3, 'Visualizing Network Activity using Parallel Coordinates', 'HICSS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5716643', 1, NULL, '967.pdf', 0, 0);
INSERT INTO papers VALUES (971, 2010, 2, 'NetVis- A network security management visualization tool based on treemap', 'ICACC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5481671', 1, NULL, '971.pdf', 0, 0);
INSERT INTO papers VALUES (960, 2012, 4, 'A survey of security visualization for computer network logs', 'Security and Communication Networks', 'http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1939-0122', 0, NULL, NULL, 0, 0);
INSERT INTO papers VALUES (972, 2010, 2, 'NevML- A Markup Language for Network Topology Visualization', 'ICFN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5431685', 1, NULL, '972.pdf', 0, 0);
INSERT INTO papers VALUES (973, 2010, 2, 'PeekKernelFlows- Peeking into IP flows', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '973.pdf', 0, 0);
INSERT INTO papers VALUES (974, 2010, 2, 'Visualizing host traffic through graphs', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '974.pdf', 0, 0);
INSERT INTO papers VALUES (977, 2010, 2, 'Interactive Visual Analysis of Hierarchical Enterprise Data', 'CEC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5706807', 1, NULL, '977.pdf', 0, 0);
INSERT INTO papers VALUES (979, 2012, 2, 'Contextualized Monitoring and Root Cause Discovery in IPTV Systems Using Data Visualization', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '979.pdf', 0, 0);
INSERT INTO papers VALUES (950, 2010, 5, 'Nimble cybersecurity incident management through visualization and defensible recommendations', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '950.pdf', 0, 0);
INSERT INTO papers VALUES (938, 2012, 22, 'A Survey of Visualization Systems for Network Security', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '938.pdf', 0, 0);
INSERT INTO papers VALUES (955, 2010, 4, 'Ids Alert Visualization and Monitoring through Heuristic Host Selection', 'ICCS', 'http://www.iccs-meeting.org/iccs2010/', 1, NULL, '955.pdf', 0, 0);
INSERT INTO papers VALUES (976, 2010, 2, 'TelescopeVisualizer - A Real-time Internet Information Visualizer With a Flexible User Interface', 'AINTEC', 'http://www.interlab.ait.ac.th/aintec2010/', 1, NULL, '976.pdf', 0, 0);
INSERT INTO papers VALUES (963, 2010, 3, 'From a Mess to Graphic Maps- Visualization of Large-Scale Heterogeneous Networks', 'ICCMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5420948', 1, NULL, '963.pdf', 0, 0);
INSERT INTO papers VALUES (975, 2010, 2, 'Traffic Classification Using Visual Motifs- An Empirical Evaluation', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '975.pdf', 0, 0);
INSERT INTO papers VALUES (944, 2010, 8, 'A Visual Tool for Forensic Analysis of Mobile Phone Traffic', 'MiFor', 'http://madm.dfki.de/mifor2010/MiFor2010.html', 1, NULL, '944.pdf', 0, 0);
INSERT INTO papers VALUES (982, 2010, 1, 'Intelligent Expertise Classification Approach - An Innovative Artificial  Intelligence Approach To Accelerate Network Data Visualization', 'ICACTE', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5564353', 1, NULL, '982.pdf', 0, 0);
INSERT INTO papers VALUES (984, 2010, 1, 'Interactive Detection of Network Anomalies via Coordinated Multiple Views', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '984.pdf', 0, 0);
INSERT INTO papers VALUES (985, 2011, 1, 'A novel three-tiered visualization approach for firewall rule validation', 'Journal of Visual Languages and Computing', 'http://www.journals.elsevier.com/journal-of-visual-languages-and-computing/', 1, NULL, '985.pdf', 0, 0);
INSERT INTO papers VALUES (988, 2011, 1, 'A web-based what-if scenario analysis tool for performance improvement of IT support organizations', 'CNSM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6093621', 1, NULL, '988.pdf', 0, 0);
INSERT INTO papers VALUES (989, 2012, 1, 'Intelligent network management using graph differential anomaly visualization', 'NOMS', 'http://noms2012.ieee-noms.org/techcfp.html', 1, NULL, '989.pdf', 0, 0);
INSERT INTO papers VALUES (834, 2001, 13, 'Methods of Visualizing Temporal Patterns in and Mission Impact of Computer Security Breaches', 'DISCEX', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7418', 1, NULL, '834.pdf', 2, 0);
INSERT INTO papers VALUES (758, 2006, 46, 'Visual Correlation of Network Alerts', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '758.pdf', 4, 0);
INSERT INTO papers VALUES (1059, 1992, 12, 'Visualizing packet traces', 'SIGCOMM', 'http://www.sigcomm.org/', 1, NULL, '1059.pdf', 2, 0);
INSERT INTO papers VALUES (1060, 1994, 7, 'Real-time Bifocal Network-Visualization', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5189', 1, NULL, '1060.pdf', 2, 0);
INSERT INTO papers VALUES (990, 2012, 1, 'Automated Tracing and Visualization of Software Security Structure and Properties', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '990.pdf', 0, 0);
INSERT INTO papers VALUES (991, 2012, 1, 'NV- Nessus Vulnerability Visualization for the Web', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '991.pdf', 0, 0);
INSERT INTO papers VALUES (993, 2012, 1, 'A real-time visualization framework for IDS alerts', 'VINCI', 'http://www.cad.zju.edu.cn/home/chenwei/VINCI2012/', 1, NULL, '993.pdf', 0, 0);
INSERT INTO papers VALUES (994, 2012, 1, 'Analysis of Rogue Anti-Virus Campaigns Using Hidden Structures in k-Partite Graphs', 'CANS', 'http://cans2012.cased.de/', 1, NULL, '994.pdf', 0, 0);
INSERT INTO papers VALUES (995, 2012, 1, 'Hierarchical Visualization of BGP Routing Changes Using Entropy Measures', 'ISVC', 'http://www.isvc.net/12/', 1, NULL, '995.pdf', 0, 0);
INSERT INTO papers VALUES (996, 2012, 1, 'The Research on Network Security Visualization Key Technology', 'MINES', 'http://www.ieee-mines.org/2012/index.htm', 1, NULL, '996.pdf', 0, 0);
INSERT INTO papers VALUES (997, 2012, 1, 'LiveSec- Towards Effective Security Management in Large-scale Production Networks', 'ICDCSW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6257103', 1, NULL, '997.pdf', 0, 0);
INSERT INTO papers VALUES (998, 2012, 1, '3DSVAT- A 3D Stereoscopic Vulnerability Assessment Tool for Network Security', 'LCN', 'http://www.ieeelcn.org/prior/LCN37/', 1, NULL, '998.pdf', 0, 0);
INSERT INTO papers VALUES (1000, 2010, 0, 'Expert-Aware Approach Towards Network Security Visualization Tool Services', 'NETAPPS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5634611', 1, NULL, '1000.pdf', 0, 0);
INSERT INTO papers VALUES (1002, 2010, 0, 'Interactive SNMP traffic analysis through information visualization', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5482535', 1, NULL, '1002.pdf', 0, 0);
INSERT INTO papers VALUES (1003, 2010, 0, 'Network topology description and visualization', 'ICACTE', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5564353', 1, NULL, '1003.pdf', 0, 0);
INSERT INTO papers VALUES (1004, 2010, 0, 'An interactive visualization framework for next generation networks', 'CoNEXT', 'http://conferences.sigcomm.org/co-next/2010/', 1, NULL, '1004.pdf', 0, 0);
INSERT INTO papers VALUES (1005, 2010, 0, 'Case Study - Visualization Methodology For Analysing Network Data', 'UKSim', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5479086', 1, NULL, '1005.pdf', 0, 0);
INSERT INTO papers VALUES (1007, 2011, 0, 'Cover-VT- Converged Security Visualization Tool', 'IM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5976317', 1, NULL, '1007.pdf', 0, 0);
INSERT INTO papers VALUES (1008, 2011, 0, 'Control and visualization system for managed self-organization network', 'CNSM', 'http://cnsm.loria.fr/', 1, NULL, '1008.pdf', 0, 0);
INSERT INTO papers VALUES (1009, 2011, 0, 'VisVerND- Visual Verification of Network Traffic Dataset', 'CNSR', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5769515', 1, NULL, '1009.pdf', 0, 0);
INSERT INTO papers VALUES (965, 2011, 3, 'Visual Clustering of Spam Emails for DDoS Analysis', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6003377', 1, NULL, '965.pdf', 0, 0);
INSERT INTO papers VALUES (966, 2011, 3, 'Supporting the Cyber Analytic Process Using Visual History on Large Displays', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '966.pdf', 0, 0);
INSERT INTO papers VALUES (968, 2011, 3, 'BURN- Baring Unknown Rogue Networks', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '968.pdf', 0, 0);
INSERT INTO papers VALUES (1018, 2012, 0, 'Design and Implementation of a Network Management System for Service Oriented Network', 'WTC', 'http://www.ieice.org/~wtc2012/', 1, NULL, '1018.pdf', 0, 0);
INSERT INTO papers VALUES (1015, 2011, 0, 'Visual Analysis of Goal-Directed Network Defense Decisions', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '1015.pdf', 0, 0);
INSERT INTO papers VALUES (1019, 2012, 0, 'Nviz - a general purpose visualization tool for Wireless Sensor Networks', 'ECTI-CON', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6243514', 1, NULL, '1019.pdf', 0, 0);
INSERT INTO papers VALUES (1020, 2012, 0, 'The study on network topology discovery algorithm based on SNMP protocol and ICMP protocol', 'ICSESS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6260028', 1, NULL, '1020.pdf', 0, 0);
INSERT INTO papers VALUES (1021, 2012, 0, 'An Implementation of Visualization System for Visualizing Network Topology and Packet Flow in Mobile Ad Hoc Networks', 'NBIS', 'http://www.takilab.org/conf/nbis/2012/', 1, NULL, '1021.pdf', 0, 0);
INSERT INTO papers VALUES (1022, 2012, 0, 'Practical Firewall Policy Inspection Using Anomaly Detection and Its Visualization', 'ICITCS', 'http://conf.kcis.kr/main/main.asp', 1, NULL, '1022.pdf', 0, 0);
INSERT INTO papers VALUES (1023, 2012, 0, 'Network Topology Visualization and Monitoring for Multi-hop Wireless Networks', 'BROADNETS', 'http://broadnets.org/show/home', 1, NULL, '1023.pdf', 0, 0);
INSERT INTO papers VALUES (1025, 2012, 0, 'Visualization of Shared System Call Sequence Relationships in Large Malware Corpora', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1025.pdf', 0, 0);
INSERT INTO papers VALUES (1058, 2013, 0, 'P3D- A Parallel 3D Coordinate Visualization for Advanced Network Scans', 'ICC', 'http://www.ieee-icc.org/2013/', 1, NULL, '1058.pdf', 0, 0);
INSERT INTO papers VALUES (1062, 2002, 60, 'An approach to usable security based on event monitoring and visualization', 'NSPW', 'http://www.nspw.org/2002/', 1, NULL, '1062.pdf', 0, 0);
INSERT INTO papers VALUES (1064, 2004, 59, 'Anomaly Detection Using Layered Networks Based on Eigen Co-occurrence Matrix', 'RAID', 'http://raid04.eurecom.fr/', 1, NULL, '1064.pdf', 0, 0);
INSERT INTO papers VALUES (1067, 2012, 1, 'Change-Link- A Digital Forensic Tool for Visualizing Changes to Directory Trees', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1067.pdf', 0, 0);
INSERT INTO papers VALUES (1068, 2012, 2, 'DAEDALUS-VIZ- Novel Real-time 3D Visualization for Darknet Monitoring-based Alert System', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1068.pdf', 0, 0);
INSERT INTO papers VALUES (999, 2013, 1, 'Christopher Alexanders fifteen properties- Toward developing evaluation metrics for security visualizations', 'ISI', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6571725', 1, NULL, '999.pdf', 0, 0);
INSERT INTO papers VALUES (1001, 2010, 0, 'Using geographic information systems for enhanced network security visualization', 'COM.Geo', 'http://www.com-geo.org/conferences/2010/', 1, NULL, '1001.pdf', 0, 0);
INSERT INTO papers VALUES (1016, 2011, 0, 'Multiresolution Semantic Visualization of Network Traffic', 'ICSC', 'http://www.ieee-icsc.org/ICSC2011/', 1, NULL, '1016.pdf', 0, 0);
INSERT INTO papers VALUES (1013, 2011, 0, 'A New Network Topology Visualization Algorithm', 'IMCCC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6119177', 1, NULL, '1013.pdf', 0, 0);
INSERT INTO papers VALUES (1024, 2012, 0, 'Visualization Design for Immediate High-Level Situational assessment', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1024.pdf', 0, 0);
INSERT INTO papers VALUES (1014, 2011, 0, 'Web-based automatic network discovery - Map Systems', 'ICCAIE', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6153634', 1, NULL, '1014.pdf', 0, 0);
INSERT INTO papers VALUES (992, 2012, 1, 'Visual analytics for BGP monitoring and prefix hijacking identification', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '992.pdf', 0, 0);
INSERT INTO papers VALUES (747, 2004, 75, 'Passive visual fingerprinting of network attack tools', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '747.pdf', 4, 0);
INSERT INTO papers VALUES (1065, 2004, 1, 'Visawin-Visualising a Wireless Network', 'VTC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=9530', 1, NULL, '1065.pdf', 1, 0);
INSERT INTO papers VALUES (1028, 2012, 0, 'VisTracer- A Visual Analytics Tool to Investigate Routing Anomalies in Traceroutes', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1028.pdf', 0, 0);
INSERT INTO papers VALUES (1030, 2012, 0, 'Pathsift- A Library for Separating the Effects of Topology, Policy, and Protocols on IP Routing', 'SIMUTOOLS', 'http://simutools.org/2012/', 1, NULL, '1030.pdf', 0, 0);
INSERT INTO papers VALUES (1031, 2012, 0, 'Visualizing Semantics in Passwords- The Role of Dates', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1031.pdf', 0, 0);
INSERT INTO papers VALUES (1033, 2013, 0, 'Visualization of abnormal behavior detection using parallel coordinate and correspondence analysis', '--', '--', 1, NULL, '1033.pdf', 0, 0);
INSERT INTO papers VALUES (1034, 2013, 0, 'Network Data Visualization Using Parallel Coordinates Version of Time-tunnel with 2Dto2D Visualization for Intrusion Detection', 'WAINA', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6532127', 1, NULL, '1034.pdf', 0, 0);
INSERT INTO papers VALUES (1036, 2013, 0, 'Visualizing Geolocation of Spam Email', 'ComComAp', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6523354', 1, NULL, '1036.pdf', 0, 0);
INSERT INTO papers VALUES (1038, 2013, 0, 'Visualizing big network traffic data using frequent pattern mining and hypergraphs', 'Computing', 'http://link.springer.com/journal/607', 1, NULL, '1038.pdf', 0, 0);
INSERT INTO papers VALUES (1039, 2013, 0, 'Flexible Web Visualization for Alert-Based Network Security Analytics', 'VizSec', 'http://vizsec.org/', 1, NULL, '1039.pdf', 0, 0);
INSERT INTO papers VALUES (1041, 2013, 0, 'Towards Visualizing Mobile Network Data', 'ISCIS', 'http://san.ee.ic.ac.uk/iscis2013/', 1, NULL, '1041.pdf', 0, 0);
INSERT INTO papers VALUES (1043, 2013, 0, 'IDSRadar- a real-time visualization framework for IDS alerts', 'Science China Information Sciences', 'http://link.springer.com/journal/11432', 1, NULL, '1043.pdf', 0, 0);
INSERT INTO papers VALUES (1045, 2013, 0, 'Visualization Technology for flow-based nwtworks and communication services', 'FUJITSU SCI TECH J', 'http://www.researchgate.net/journal/0016-2523_Fujitsu_scientific_technical_journal', 1, NULL, '1045.pdf', 0, 0);
INSERT INTO papers VALUES (1046, 2013, 0, 'Risk Visualization and Alerting System- Architecture and Proof-of-Concept Implementation', 'SESP', 'http://doe.cs.northwestern.edu/SESP/', 1, NULL, '1046.pdf', 0, 0);
INSERT INTO papers VALUES (1047, 2013, 0, 'An Online Visualization System for Streaming Log Data of Computing Clusters', 'TST', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=5971803', 1, NULL, '1047.pdf', 0, 0);
INSERT INTO papers VALUES (1049, 2013, 0, 'Traffic Flow Optimization and Visualization in MPLS Networks', 'WCE', 'http://www.iaeng.org/WCE2013/', 1, NULL, '1049.pdf', 0, 0);
INSERT INTO papers VALUES (1010, 2011, 0, 'Peer-to-Peer File Sharing Communication Detection Using Spherical SOM Visualization for Network Management', 'HCII', 'http://www.hcii2011.org/', 1, NULL, '1010.pdf', 0, 0);
INSERT INTO papers VALUES (1012, 2011, 0, 'MANET-Viewer II- A Visualization System for Visualizing Packet Flow in Mobile Ad-hoc Networks', 'WAINA', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5762827', 1, NULL, '1012.pdf', 0, 0);
INSERT INTO papers VALUES (1017, 2011, 0, 'Acquisition and Visualization of Hosts Connected to the Network', 'SAINT', 'http://www.saintconference.org/2011/', 1, NULL, '1017.pdf', 0, 0);
INSERT INTO papers VALUES (1053, 2013, 0, 'Change-Link 2.0- A Digital Forensic Tool for Visualizing Changes to Shadow Volume Data', 'VizSec', 'http://vizsec.org/', 1, NULL, '1053.pdf', 0, 0);
INSERT INTO papers VALUES (1056, 2013, 0, 'BGPfuse- Using visual feature fusion for the detection and attribution of BGP anomalies', 'VizSec', 'http://vizsec.org/', 1, NULL, '1056.pdf', 0, 0);
INSERT INTO papers VALUES (1057, 2013, 0, 'Finding Anomalies in Time-Series using Visual Correlation for Interactive Root Cause Analysis', 'VizSec', 'http://vizsec.org/', 1, NULL, '1057.pdf', 0, 0);
INSERT INTO papers VALUES (727, 1999, 1, 'Conceptualizing bandwidth allocation in network management', 'CIKM', 'http://www.cikmconference.org/1999/', 1, NULL, '727.pdf', 0, 0);
INSERT INTO papers VALUES (738, 2004, 136, 'Managing Attack Graph Complexity Through Visual Hierarchical Aggregation', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '738.pdf', 3, 0);
INSERT INTO papers VALUES (742, 2004, 116, 'Home-centric visualization of network traffic for security administration', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '742.pdf', 5, 0);
INSERT INTO papers VALUES (743, 2002, 115, 'Intrusion and Misuse Detection in Large-Scale Systems', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '743.pdf', 5, 0);
INSERT INTO papers VALUES (741, 2004, 123, 'PortVis- a tool for port-based detection of security events', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '741.pdf', 4, 0);
INSERT INTO papers VALUES (745, 2004, 82, 'SnortView- visualization system of snort logs', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '745.pdf', 4, 0);
INSERT INTO papers VALUES (740, 2004, 135, 'VisFlowConnect NetFlow Visualizations of Link Relationships for Security Situational Awareness', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '740.pdf', 5, 0);
INSERT INTO papers VALUES (733, 1999, 59, 'An eye on network intruder-administrator shootouts', 'WIDNM', 'https://www.usenix.org/legacy/publications/library/proceedings/detection99/', 1, NULL, '733.pdf', 2, 0);
INSERT INTO papers VALUES (744, 2000, 93, 'Network Visualization with Nam, the VINT Network Animator', 'COMPUTER', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2', 1, NULL, '744.pdf', 4, 0);
INSERT INTO papers VALUES (730, 1999, 6, 'Large scale network visualization', 'SIGGRAPH', 'http://www.siggraph.org/publications/newsletter/v33n3/', 1, NULL, '730.pdf', 1, 0);
INSERT INTO papers VALUES (731, 1999, 24, 'Visualizing large telecommunication data sets', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '731.pdf', 3, 0);
INSERT INTO papers VALUES (732, 1999, 50, 'Visualizing large-scale telecommunication networks and services', 'VISUAL', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6578', 1, NULL, '732.pdf', 1, 0);
INSERT INTO papers VALUES (728, 1999, 4, 'XML and Information Visualization Application to Network Management', 'MC', 'http://www.balisage.net/', 1, NULL, '728.pdf', 1, 0);
INSERT INTO papers VALUES (723, 1997, 81, 'Web-based information visualization', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '723.pdf', 4, 0);
INSERT INTO papers VALUES (724, 1998, 12, 'Floodar Flow Visualization of Network Traffic', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '724.pdf', 2, 0);
INSERT INTO papers VALUES (722, 1997, 49, 'An architecture for monitoring, visualization, and control of gigabit networks', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '722.pdf', 2, 0);
INSERT INTO papers VALUES (718, 1996, 32, 'Techniques for Automated Network Map Generation Using SNMP', 'INFOCOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=3539', 1, NULL, '718.pdf', 2, 0);
INSERT INTO papers VALUES (714, 1995, 30, 'Case study- 3D displays of Internet traffic', 'INFVIS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4050', 1, NULL, '714.pdf', 2, 0);
INSERT INTO papers VALUES (721, 1996, 73, 'Visualizing the Global Topology of the Mbone', 'INFVIS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4136', 1, NULL, '721.pdf', 3, 0);
INSERT INTO papers VALUES (713, 1993, 32, 'Supporting Network Management through Declaratively Specified Data Visualizations', 'IM*', 'http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.55.4575&rep=rep1&type=pdf', 1, NULL, '713.pdf', 2, 0);
INSERT INTO papers VALUES (712, 1993, 12, 'Management of broadband networks using 3D virtual world', 'HPDC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=465', 1, NULL, '712.pdf', 2, 0);
INSERT INTO papers VALUES (757, 2002, 46, 'Tudumi- information visualization system for monitoring and auditing computer logs', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=7989', 1, NULL, '757.pdf', 0, 0);
INSERT INTO papers VALUES (1050, 2013, 0, 'Visualization and Clustering for SNMP Intrusion Detection', 'Cybernetics and Systems', 'http://www.tandfonline.com/toc/ucbs20/current#.UlcD6mSc5bU', 1, NULL, '1050.pdf', 0, 0);
INSERT INTO papers VALUES (1051, 2013, 0, 'Visualizing PHPIDS Log Files for Better Understanding of Web Server Attacks', 'VizSec', 'http://vizsec.org/', 1, NULL, '1051.pdf', 0, 0);
INSERT INTO papers VALUES (1055, 2013, 0, 'NAVSEC - A Recommender System for 3D Network Security Visualizations', 'VizSec', 'http://vizsec.org/', 1, NULL, '1055.pdf', 0, 0);
INSERT INTO papers VALUES (783, 2009, 30, 'MOVIH-IDS- A mobile-visualization hybrid intrusion detection system', 'NEUROCOMPUTING', 'http://www.sciencedirect.com/science/journal/09252312', 1, NULL, '783.pdf', 0, 0);
INSERT INTO papers VALUES (786, 2008, 29, 'Large-Scale Network Monitoring for Visual Analysis of Attacks', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '786.pdf', 0, 0);
INSERT INTO papers VALUES (788, 2008, 28, 'Improving Attack Graph Visualization through Data Reduction and Attack Grouping', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '788.pdf', 0, 0);
INSERT INTO papers VALUES (802, 2009, 21, 'Visualizing Compiled Executables for Malware Analysis', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '802.pdf', 0, 0);
INSERT INTO papers VALUES (778, 2007, 31, 'SNMP Traffic Analysis Approaches, Tools, and First Results', 'IM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4258513', 1, NULL, '778.pdf', 4, 0);
INSERT INTO papers VALUES (803, 2006, 20, 'Detecting Distributed Scans Using High-Performance Query-Driven Visualization', 'SC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4090162', 1, NULL, '803.pdf', 3, 0);
INSERT INTO papers VALUES (776, 2006, 31, 'Enhancing Visual Analysis of Network Traffic Using a Knowledge Representation', 'VAST', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4035729', 1, NULL, '776.pdf', 3, 0);
INSERT INTO papers VALUES (766, 2006, 36, 'Interactive Visualization for Network and Port Scan Detection', 'RAID', 'http://www.raid-symposium.org/raid2006/', 1, NULL, '766.pdf', 4, 0);
INSERT INTO papers VALUES (751, 2006, 54, 'Hierarchical visualization of network intrusion detection data', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '751.pdf', 5, 0);
INSERT INTO papers VALUES (791, 2005, 25, 'A User-Centered Approach to Visualizing Network Traffic for Intrusion Detection', 'CHI', 'http://www.chi2005.org/', 1, NULL, '791.pdf', 3, 0);
INSERT INTO papers VALUES (777, 2006, 31, 'Monitoring Network Traffic with Radial Traffic Analyzer', 'VAST', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4035729', 1, NULL, '777.pdf', 3, 0);
INSERT INTO papers VALUES (789, 2005, 27, 'A study of analyzing network traffic as images in real-time', 'INFOCOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=9990', 1, NULL, '789.pdf', 3, 0);
INSERT INTO papers VALUES (765, 2005, 36, 'A user-centered look at glyph-based security visualization', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '765.pdf', 4, 0);
INSERT INTO papers VALUES (801, 2005, 21, 'Closing-the-Loop in NVisionIP Integrating Discovery and Search in Security Visualizations', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '801.pdf', 0, 0);
INSERT INTO papers VALUES (763, 2005, 39, 'A Visualization Methodology for Characterization of Network Scans', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '763.pdf', 3, 0);
INSERT INTO papers VALUES (753, 2005, 51, 'A Visualization Paradigm for Network Intrusion Detection', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10007', 1, NULL, '753.pdf', 2, 0);
INSERT INTO papers VALUES (792, 2005, 25, 'Exploring Three-dimensional Visualization for Intrusion Detection', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '792.pdf', 2, 0);
INSERT INTO papers VALUES (760, 2005, 42, 'In the eye of the beholder- A visualization-based approach to information system security', 'IJHCS', 'http://www.sciencedirect.com/science/journal/10715819', 1, NULL, '760.pdf', 4, 0);
INSERT INTO papers VALUES (774, 2005, 31, 'IDGraphs Intrusion Detection and Analysis Using Histographs', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '774.pdf', 2, 0);
INSERT INTO papers VALUES (754, 2005, 51, 'Real-time and forensic network data analysis using animated and coordinated visualization', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10007', 1, NULL, '754.pdf', 2, 0);
INSERT INTO papers VALUES (781, 2005, 30, 'Manifold Learning Visualization of Network Traffic Data', 'MineNet', 'http://conferences.sigcomm.org/sigcomm/2005/', 1, NULL, '781.pdf', 3, 0);
INSERT INTO papers VALUES (752, 2005, 52, 'Multiple Coordinated Views for Network Attack Graphs', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '752.pdf', 2, 0);
INSERT INTO papers VALUES (750, 2005, 56, 'Preserving the Big Picture- Visual Network Traffic Analysis with TNV', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '750.pdf', 4, 0);
INSERT INTO papers VALUES (755, 2005, 49, 'Visualizing Network Data for Intrusion Detection', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10007', 1, NULL, '755.pdf', 2, 0);
INSERT INTO papers VALUES (782, 2005, 30, 'Visualizing cyber attacks using IP matrix', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '782.pdf', 3, 0);
INSERT INTO papers VALUES (779, 2005, 30, 'Visualizing Interdomain Routing with BGPlay', 'JGAA', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '779.pdf', 4, 0);
INSERT INTO papers VALUES (769, 2004, 34, 'Combining a bayesian classifier with visualisation- understanding the IDS', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '769.pdf', 2, 0);
INSERT INTO papers VALUES (762, 2004, 40, 'An Information Visualization Framework for Intrusion Detection', 'CHI', 'http://www.sigchi.org/chi2004/', 1, NULL, '762.pdf', 2, 0);
INSERT INTO papers VALUES (770, 2004, 34, 'Combining Visual and Automated Data Mining for Near-Real- Time Anomaly Detection and Analysis in bgp', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '770.pdf', 3, 0);
INSERT INTO papers VALUES (767, 2004, 35, 'Real-time visualization of network attacks on high-speed links', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '767.pdf', 2, 0);
INSERT INTO papers VALUES (759, 2004, 44, 'Detecting flaws and intruders with visual data analysis', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '759.pdf', 3, 0);
INSERT INTO papers VALUES (796, 2004, 23, 'Scatter (and other) plots for visualizing user profiling data and network traffic', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '796.pdf', 1, 0);
INSERT INTO papers VALUES (799, 2003, 21, 'Ecological interface design- a new approach for visualizing network management', 'ComNet', 'http://www.sciencedirect.com/science/journal/13891286', 1, NULL, '799.pdf', 4, 0);
INSERT INTO papers VALUES (739, 2004, 136, 'The Spinning Cube of Potential Doom', 'CACM', 'http://cacm.acm.org/', 1, NULL, '739.pdf', 2, 0);
INSERT INTO papers VALUES (764, 2003, 38, 'A Visual Exploration Process for the Analysis of Internet Routing Data', 'VIS', 'http://vis.computer.org/vis2003/', 1, NULL, '764.pdf', 3, 0);
INSERT INTO papers VALUES (768, 2003, 34, 'Two Visual Computer Network Security Monitoring Tools Incorporating Operator Interface Requirements', 'WHCISEC', 'http://www.andrewpatrick.ca/CHI2003/HCISEC/HCISEC-cfp.html', 1, NULL, '768.pdf', 3, 0);
INSERT INTO papers VALUES (736, 2000, 171, 'FlowScan- A Network Traffic Flow Reporting and Visualization Tool', 'LISA', 'https://www.usenix.org/legacy/events/lisa00/', 1, NULL, '736.pdf', 3, 0);
INSERT INTO papers VALUES (761, 2000, 41, 'Network Performance Visualization- Insight through animation', 'PAM', 'http://www.ripe.net/ripe/mail/archives/tt-host/1999-August/000175.html', 1, NULL, '761.pdf', 3, 0);
INSERT INTO papers VALUES (809, 2008, 19, 'GARNET- A Graphical Attack Graph and Reachability Network Evaluation Tool', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '809.pdf', 0, 0);
INSERT INTO papers VALUES (810, 2008, 19, 'Visual Reverse Engineering of Binary and Data Files', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '810.pdf', 0, 0);
INSERT INTO papers VALUES (813, 2009, 18, 'FloVis-Flow Visualization System', 'CATCH', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4804413', 1, NULL, '813.pdf', 0, 0);
INSERT INTO papers VALUES (814, 2009, 18, 'Visual support for analyzing network traffic and intrusion detection events using TreeMap and graph representations', 'CHiMiT', 'http://www.chimit09.org/', 1, NULL, '814.pdf', 0, 0);
INSERT INTO papers VALUES (827, 2009, 15, 'Fast detection and visualization of network attacks on parallel coordinates', 'Computers & Security', 'http://www.sciencedirect.com/science/journal/01674048', 1, NULL, '827.pdf', 0, 0);
INSERT INTO papers VALUES (839, 2008, 13, 'NetFlow Data Visualization Based on Graphs', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '839.pdf', 0, 0);
INSERT INTO papers VALUES (840, 2008, 13, 'Visualization Based Policy Analysis- Case Study in SELinux', 'SACMAT', 'http://www.sacmat.org/2014/index.php', 1, NULL, '840.pdf', 0, 0);
INSERT INTO papers VALUES (846, 2009, 12, 'Visual Analysis of Malware Behavior Using Treemaps and Thread Graphs', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '846.pdf', 0, 0);
INSERT INTO papers VALUES (849, 2008, 11, 'A Graph-Theoretic Visualization Approach to Network Risk Analysis', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '849.pdf', 0, 0);
INSERT INTO papers VALUES (850, 2009, 11, 'Visualizing Cyber Security- Usable Workspaces', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '850.pdf', 0, 0);
INSERT INTO papers VALUES (797, 2007, 22, 'Visual Analysis of Network Flow Data with Timelines and Event Plots', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '797.pdf', 3, 0);
INSERT INTO papers VALUES (807, 2006, 19, 'An intelligent, interactive tool for exploration and visualization of time-oriented security data', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '807.pdf', 3, 0);
INSERT INTO papers VALUES (842, 2007, 12, 'Visualising Communication Network Security Attacks', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4271943', 1, NULL, '842.pdf', 2, 0);
INSERT INTO papers VALUES (845, 2007, 12, 'Visualizing Network Security Events Using Compound Glyphs from a Service-Oriented Perspective', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '845.pdf', 4, 0);
INSERT INTO papers VALUES (775, 2006, 31, 'Accelerating Network Traffic Analytics Using Query-Driven Visualization', 'VAST', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4035729', 1, NULL, '775.pdf', 2, 0);
INSERT INTO papers VALUES (838, 2006, 13, 'Flowtag- a collaborative attack-analysis, reporting, and sharing tool for security researchers', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '838.pdf', 2, 0);
INSERT INTO papers VALUES (812, 2006, 18, 'Bgp Eye- A New Visualization Tool for Real-Time Detection and Analysis of bgp Anomalies', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '812.pdf', 3, 0);
INSERT INTO papers VALUES (847, 2006, 11, 'Interactively combining 2D and 3D visualization for network traffic monitoring', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '847.pdf', 2, 0);
INSERT INTO papers VALUES (773, 2006, 32, 'Focusing on Context in Network Traffic Analysis', 'CGA', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=38', 1, NULL, '773.pdf', 5, 0);
INSERT INTO papers VALUES (818, 2006, 16, 'Interactive Exploration of Data Traffic with Hierarchical Network Maps', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '818.pdf', 4, 0);
INSERT INTO papers VALUES (858, 2006, 9, 'MOVICAB-IDS Visual Analysis of Network Traffic Data Streams for Intrusion Detection', 'IDEAL', 'http://www2.ubu.es/ideal2006/', 1, NULL, '858.pdf', 2, 0);
INSERT INTO papers VALUES (824, 2006, 15, 'Visualizations to improve reactivity towards security incidents inside corporate networks', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '824.pdf', 3, 0);
INSERT INTO papers VALUES (820, 2006, 16, 'Real-time collaborative network monitoring and control using 3D game engines for representation and interaction', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '820.pdf', 2, 0);
INSERT INTO papers VALUES (837, 2006, 13, 'STARMINE- a visualization system for cyber attacks', 'APVis', 'http://www.informatik.uni-trier.de/~ley/db/conf/apvis/apvis2006.html', 1, NULL, '837.pdf', 3, 0);
INSERT INTO papers VALUES (831, 2006, 14, 'Understanding multistage attacks by attack-track based visualization of heterogeneous event streams', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '831.pdf', 2, 0);
INSERT INTO papers VALUES (816, 2006, 17, 'VISUALISING INTRUSIONS- WATCHING THE WEBSERVER', 'AIS', 'http://link.springer.com/book/10.1007/0-387-27636-X/page/1', 1, NULL, '816.pdf', 0, 0);
INSERT INTO papers VALUES (819, 2006, 16, 'Visualizing DNS Traffic', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '819.pdf', 3, 0);
INSERT INTO papers VALUES (841, 2005, 12, 'Designing Visualization Capabilities for IDS Challenges', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '841.pdf', 2, 0);
INSERT INTO papers VALUES (808, 2006, 19, 'Visualizing Internet Routing Changes', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '808.pdf', 0, 0);
INSERT INTO papers VALUES (823, 2005, 15, 'Root Polar Layout of Internet Address Data for Security Administration', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '823.pdf', 1, 0);
INSERT INTO papers VALUES (853, 2005, 10, 'NetViewer A Network Traffic Visualization and Analysis Tool', 'LISA', 'https://www.usenix.org/legacy/events/lisa05/index.html', 1, NULL, '853.pdf', 3, 0);
INSERT INTO papers VALUES (817, 2004, 16, 'Cyberseer- 3D audio-visual Immersion for Network Security and Management', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '817.pdf', 2, 0);
INSERT INTO papers VALUES (772, 2005, 33, 'Visual firewall- real-time network security monitor', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '772.pdf', 3, 0);
INSERT INTO papers VALUES (855, 2005, 10, 'Visualization of Automated Trust Negotiation', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '855.pdf', 3, 0);
INSERT INTO papers VALUES (811, 2004, 18, 'Efficient visualization of large routing topologies', 'IJNM', 'http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1099-1190', 1, NULL, '811.pdf', 2, 0);
INSERT INTO papers VALUES (805, 2003, 19, 'A Prototype Tool for Visual Data Mining of Network Traffic for Intrusion Detection', 'DMSEC', 'http://cs.fit.edu/~pkc/dmsec03/', 1, NULL, '805.pdf', 3, 0);
INSERT INTO papers VALUES (800, 2003, 21, 'Intrusion behavior detection through visualization', 'ICSMC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=8811', 1, NULL, '800.pdf', 1, 0);
INSERT INTO papers VALUES (790, 2003, 26, 'Visualization for Intrusion Detection- Hooking the Worm', 'ESORICS', 'http://link.springer.com/book/10.1007/b13237/page/1', 1, NULL, '790.pdf', 2, 0);
INSERT INTO papers VALUES (857, 2001, 9, 'Case study- Visualization and information retrieval techniques for network intrusion detection', 'TCVG', 'http://www.springer.com/computer/image+processing/book/978-3-211-83674-3', 1, NULL, '857.pdf', 2, 0);
INSERT INTO papers VALUES (852, 2002, 10, 'A visual technique for internet anomaly detection', 'CGIM ', 'http://www.iasted.org/conferences/pastinfo-358.html', 1, NULL, '852.pdf', 2, 0);
INSERT INTO papers VALUES (829, 2002, 14, 'Glyph-based generic network visualization', 'SPI 4665', 'http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=876617', 1, NULL, '829.pdf', 3, 0);
INSERT INTO papers VALUES (822, 2001, 15, 'Visual behavior characterization for intrusion detection in large scale systems', 'VIIP', 'https://www.iasted.org/conferences/pastinfo-652.html', 1, NULL, '822.pdf', 1, 0);
INSERT INTO papers VALUES (860, 2009, 9, 'OverFlow-An Overview Visualization for Network Analysis', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '860.pdf', 0, 0);
INSERT INTO papers VALUES (861, 2009, 9, 'VIAssist- Visual analytics for cyber defense', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '861.pdf', 0, 0);
INSERT INTO papers VALUES (869, 2008, 8, 'Effective Visualization of File System Access-Control', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '869.pdf', 0, 0);
INSERT INTO papers VALUES (905, 2009, 3, 'Visualizing Keyboard Pattern Passwords', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '905.pdf', 0, 0);
INSERT INTO papers VALUES (710, 1993, 7, 'Using Hy+ for network management and distributed debugging', 'CASCON', 'http://dl.acm.org/citation.cfm?id=962367', 1, NULL, '710.pdf', 0, 0);
INSERT INTO papers VALUES (884, 2008, 5, 'Visual Analysis of Program Flow Data with Data Propagation', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '884.pdf', 0, 0);
INSERT INTO papers VALUES (932, 2008, 0, 'Show Me How You See- Lessons from Studying Computer Forensics Experts for Visualization', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '932.pdf', 0, 0);
INSERT INTO papers VALUES (933, 2008, 0, 'Modeling of Network Situation Awareness', 'ICCCAS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4636103', 1, NULL, '933.pdf', 0, 0);
INSERT INTO papers VALUES (980, 2012, 2, 'The Future of Security Visualization- Lessons from Network Visualization', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '980.pdf', 0, 0);
INSERT INTO papers VALUES (983, 2010, 1, 'Visualizing Your Key for Secure Phone Calls And Language Independence', 'VizSec', 'http://www.vizsec.org/vizsec2010/', 1, NULL, '983.pdf', 0, 0);
INSERT INTO papers VALUES (874, 2008, 7, 'A Term Distribution Visualization Approach to Digital Forensic String Search', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '874.pdf', 0, 0);
INSERT INTO papers VALUES (875, 2009, 7, 'Visualization is Better! A Comparative Evaluation', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '875.pdf', 0, 0);
INSERT INTO papers VALUES (879, 2008, 6, 'Using visualization to support network and application management in a data center', 'INETMW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4656372', 1, NULL, '879.pdf', 0, 0);
INSERT INTO papers VALUES (880, 2008, 6, 'Mesh Topology Viewer (MTV) - an SVG-Based Interactive Mesh Network Topology Visualization Tool', 'ISCC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4607772', 1, NULL, '880.pdf', 0, 0);
INSERT INTO papers VALUES (851, 2002, 10, 'Intrusion Detection- Visualizing Attacks in IDS Data', 'GIAC-GCIA', 'http://www.giac.org/', 1, NULL, '851.pdf', 0, 0);
INSERT INTO papers VALUES (859, 2007, 9, 'Network visualisation- a review', 'IetCom', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=4105970', 1, NULL, '859.pdf', 3, 0);
INSERT INTO papers VALUES (876, 2007, 6, 'Integrated visualization system for monitoring security in large-scale local area network', 'APVis', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4126199', 1, NULL, '876.pdf', 2, 0);
INSERT INTO papers VALUES (873, 2007, 7, 'Progressive multiples for communication-minded visualization', 'GI', 'http://dl.acm.org/citation.cfm?id=1268517&picked=prox', 1, NULL, '873.pdf', 2, 0);
INSERT INTO papers VALUES (785, 2007, 29, 'Visual Analysis of Network Traffic for Resource Planning, Interactive Monitoring, and Interpretation of Security Threats', 'TVCG', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=2945', 1, NULL, '785.pdf', 4, 0);
INSERT INTO papers VALUES (844, 2007, 12, 'The Real Work of Computer Network Defense Analysts- The Analysis Roles and Processes that Transform Network Data into Security Situation Awareness', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '844.pdf', 3, 0);
INSERT INTO papers VALUES (866, 2007, 8, 'Visualization of Host Behavior for Network Security', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '866.pdf', 3, 0);
INSERT INTO papers VALUES (836, 2006, 13, 'Flamingo- Visualizing Internet Traffic', 'NOMS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=11101', 1, NULL, '836.pdf', 5, 0);
INSERT INTO papers VALUES (871, 2005, 7, 'Network visualisation and analysis tool based on logical network abridgment', 'MILCOM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10687', 1, NULL, '871.pdf', 3, 0);
INSERT INTO papers VALUES (825, 2006, 15, 'Using visual motifs to classify encrypted traffic', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '825.pdf', 2, 0);
INSERT INTO papers VALUES (864, 2006, 8, 'Visual toolkit for network security experiment specification and data analysis', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '864.pdf', 2, 0);
INSERT INTO papers VALUES (872, 2006, 7, 'Visualization for privacy compliance', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '872.pdf', 1, 0);
INSERT INTO papers VALUES (835, 2005, 13, 'Internet Routing Anomaly Detection and Visualization', 'DSN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=9904', 1, NULL, '835.pdf', 2, 0);
INSERT INTO papers VALUES (737, 2004, 157, 'NVisionIP NetFlow Visualizations of System State for Security Situational Awareness', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '737.pdf', 5, 0);
INSERT INTO papers VALUES (725, 1998, 87, 'A visual approach for monitoring logs', 'LISA', 'https://www.usenix.org/legacy/events/lisa98/', 1, NULL, '725.pdf', 3, 0);
INSERT INTO papers VALUES (830, 2004, 14, 'Scalable visualization of propagating internet phenomena', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '830.pdf', 2, 0);
INSERT INTO papers VALUES (862, 2003, 8, 'QMTool- an XML-based management platform for QoS-aware IP networks', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '862.pdf', 3, 0);
INSERT INTO papers VALUES (828, 2000, 14, 'A management and visualization framework for reconfigurable WDM optical networks', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '828.pdf', 2, 0);
INSERT INTO papers VALUES (882, 2000, 5, 'CyberNet- A framework for managing networks using 3D metaphoric worlds', 'Annals of Telecommunications', 'http://link.springer.com/journal/12243', 1, NULL, '882.pdf', 2, 0);
INSERT INTO papers VALUES (784, 2000, 29, 'Visualization in detection of intrusions and misuse in large scale networks', 'IV', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6925', 1, NULL, '784.pdf', 2, 0);
INSERT INTO papers VALUES (734, 1999, 69, 'Network visualization with the VINT network animator nam', 'USC Technical Report', 'http://www.cs.usc.edu/assets/003/83132.pdf', 1, NULL, '734.pdf', 3, 0);
INSERT INTO papers VALUES (711, 1993, 11, 'Graphical methods to analyze network data', 'ICC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=3171', 1, NULL, '711.pdf', 2, 0);
INSERT INTO papers VALUES (726, 1998, 169, 'MRTG-The Multi Router Traffic Grapher', 'LISA', 'https://www.usenix.org/legacy/events/lisa98/', 1, NULL, '726.pdf', 3, 0);
INSERT INTO papers VALUES (709, 1993, 2, 'A Virtual World for Network Management', 'VRAIS', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=3045', 1, NULL, '709.pdf', 1, 0);
INSERT INTO papers VALUES (708, 1992, 1, 'Concurrent Use of Parallel Communication to Enable Remote Visualization', 'ICCI', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=410', 0, NULL, '708.pdf', 0, 0);
INSERT INTO papers VALUES (707, 1990, 13, 'Dynamic graphics for network visualization', 'VISUAL', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=311', 1, NULL, '707.pdf', 1, 0);
INSERT INTO papers VALUES (705, 1989, 1, 'A graphical representation for network management', 'LCN', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=256', 1, NULL, '705.pdf', 2, 0);
INSERT INTO papers VALUES (717, 1996, 9, 'Using Visualization in System and Network Administration', 'LISA', 'https://www.usenix.org/legacy/publications/library/proceedings/lisa96/', 1, NULL, '717.pdf', 0, 0);
INSERT INTO papers VALUES (951, 2011, 5, 'Monitoring large IP spaces with ClockView', 'VizSec', 'http://www.vizsec2011.org/', 1, NULL, '951.pdf', 0, 0);
INSERT INTO papers VALUES (893, 2008, 4, 'Using visualization techniques for SNMP traffic analyses', 'ISCC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4607772', 1, NULL, '893.pdf', 0, 0);
INSERT INTO papers VALUES (894, 2008, 4, 'Using Time Series 3D AlertGraph and False Alert Classification to Analyse Snort Alerts', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '894.pdf', 0, 0);
INSERT INTO papers VALUES (895, 2009, 4, 'NetViewer- A Visualization Tool for Network Security Events', 'NSWCTC', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=4908190', 1, NULL, '895.pdf', 0, 0);
INSERT INTO papers VALUES (1027, 2012, 0, 'Visualizing Distributed Memory Computations with Hive Plots', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1027.pdf', 0, 0);
INSERT INTO papers VALUES (885, 2008, 5, 'BGPeep- An IP-Space Centered View for Internet Routing Data', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '885.pdf', 0, 0);
INSERT INTO papers VALUES (886, 2008, 5, 'Visualizing Real-Time Network Resource Usage', 'VizSec', 'http://www.vizsec.org/vizsec2008/', 1, NULL, '886.pdf', 0, 0);
INSERT INTO papers VALUES (889, 2009, 5, 'Security Visualization Tools and IPv6 Addresses', 'VizSec', 'http://vizsec.org/vizsec2009/', 1, NULL, '889.pdf', 0, 0);
INSERT INTO papers VALUES (1037, 2013, 0, 'SRNET- A Real-time, Cross-based Anomaly Detection and Visualization System for Wireless Sensor Networks', 'VizSec', 'http://vizsec.org/', 1, NULL, '1037.pdf', 0, 0);
INSERT INTO papers VALUES (1035, 2013, 0, 'An Integrated Environment for Visualization of Distributed Wireless Sensor Networks', 'ICCA', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=6550152', 1, NULL, '1035.pdf', 0, 0);
INSERT INTO papers VALUES (1042, 2013, 0, 'Visualization Framework for Inter-Domain Access Control Policy Integration', 'CC', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=6245522', 1, NULL, '1042.pdf', 0, 0);
INSERT INTO papers VALUES (1044, 2013, 0, 'Real-time Network Security Situation Visualization and Threat Assessment Based on Semi-Markov Process', 'ICMV', 'http://www.conferencealerts.com/show-event?id=103602', 1, NULL, '1044.pdf', 0, 0);
INSERT INTO papers VALUES (1054, 2013, 0, 'CyberSAVe-Situational Awareness Visualization for Cyber Security of Smart Grid Systems', 'VizSec', 'http://vizsec.org/', 1, NULL, '1054.pdf', 0, 0);
INSERT INTO papers VALUES (1026, 2012, 0, 'MalwareVis- Entry-based Visualization of Malware Network Traces', 'VizSec', 'http://www.vizsec.org/vizsec2012/', 1, NULL, '1026.pdf', 0, 0);
INSERT INTO papers VALUES (1032, 2013, 0, 'Static Validation of Network Device Configurations in Virtualized Multi-tenant Datacenters', 'IM', 'http://www.im2013.org/', 1, NULL, '1032.pdf', 0, 0);
INSERT INTO papers VALUES (877, 2007, 6, 'Putting Security in Context- Visual Correlation of Network Activity with Real-World Information', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '877.pdf', 4, 0);
INSERT INTO papers VALUES (854, 2005, 10, 'User Requirements and Design of a Visualization for Intrusion Detection Analysis', 'IAW', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=10007', 1, NULL, '854.pdf', 5, 0);
INSERT INTO papers VALUES (878, 2007, 6, 'Using InetVis to Evaluate Snort and Bro Scan Detection on a Network Telescope', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '878.pdf', 2, 0);
INSERT INTO papers VALUES (890, 2006, 4, 'Discovering an RC4 anomaly through visualization', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '890.pdf', 1, 0);
INSERT INTO papers VALUES (794, 2005, 24, 'Visual exploration of malicious network objects using semantic zoom, interactive encoding and dynamic queries', 'VizSec', 'http://www.cs.ucdavis.edu/~ma/VizSEC05/', 1, NULL, '794.pdf', 2, 0);
INSERT INTO papers VALUES (1040, 2013, 0, 'A survey on security visualization techniques for web information systems', 'International Journal of Web Information Systems', 'http://www.emeraldinsight.com/products/journals/journals.htm?id=ijwis', 1, NULL, '1040.pdf', 0, 0);
INSERT INTO papers VALUES (843, 2007, 12, 'Introduction to Visualization for Computer Security', 'VizSec', 'http://www.vizsec.org/vizsec2007/', 1, NULL, '843.pdf', 3, 0);
INSERT INTO papers VALUES (719, 1996, 68, 'Real-time geographic visualization of World Wide Web traffic', 'Computer Networks and ISDN Systems', 'http://www.sciencedirect.com/science/journal/01697552', 1, NULL, '719.pdf', 3, 0);
INSERT INTO papers VALUES (891, 2006, 4, 'USEable security- interface design strategies for improving security', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '891.pdf', 2, 0);
INSERT INTO papers VALUES (897, 2005, 3, 'Visualising internet traffic data with three-dimensional spherical display', 'APVis', 'http://www.informatik.uni-trier.de/~ley/db/conf/apvis/apvis2005.html', 1, NULL, '897.pdf', 2, 0);
INSERT INTO papers VALUES (856, 2006, 10, 'Vast- Visualizing Autonomous System Topology', 'VizSec', 'http://www.sigsac.org/ccs/CCS2006/', 1, NULL, '856.pdf', 3, 0);
INSERT INTO papers VALUES (706, 1988, 32, 'Heuristic layout algorithms for network management presentation services', 'MNET', 'http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=65', 1, NULL, '706.pdf', 2, 0);
INSERT INTO papers VALUES (863, 2004, 8, 'Network Eye- End-to-End Computer Security Visualization', 'VizSec', 'http://cs.fit.edu/~pkc/vizdmsec04/', 1, NULL, '863.pdf', 4, 0);
INSERT INTO papers VALUES (704, 1985, 29, 'CNMGRAF-graphic presentation services for network management', 'Symposium on Data communications', 'http://dl.acm.org/citation.cfm?id=319056&picked=prox', 1, NULL, '704.pdf', 2, 0);
INSERT INTO papers VALUES (1093, 2011, 0, 'Network Topology Visualization and  Monitoring for Multi-Hop Wireless  Networks ', 'IM', 'http://ieeexplore.ieee.org/xpl/mostRecentIssue.jsp?punumber=5976317', 1, '', '1093.pdf', 4, 0);


--
-- Data for Name: papers_nm_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO papers_nm_comments VALUES (10, 'A good paper for WSN networks.', '2014-01-28 14:38:38.479548', 1, 1086);
INSERT INTO papers_nm_comments VALUES (11, 'The reference below is important for visualization evaluations.

Plaisant (2004) listed the challenges with current information visualization measurement methods and proposed possible steps to improve the evaluation and facilitate wide adoption of visualization tools by the public users.', '2014-02-10 09:42:35.586624', 1, 1040);
INSERT INTO papers_nm_comments VALUES (12, 'Data sources types used for visualizations are divided in three classes:

- Network packet data
- Flow data
- Application generated data

Several references are provided for each one.', '2014-02-10 09:54:56.301082', 1, 1040);
INSERT INTO papers_nm_comments VALUES (14, 'This paper addresses the monitoring of log data from computing clusters. I''m not 100% confident if this paper should compose the survey, since the focus is not directly related to the network discipline.', '2014-02-10 10:44:30.660905', 1, 1047);
INSERT INTO papers_nm_comments VALUES (15, 'I marked this paper in the field "Probabilistic, stochastic processes, queuing theory". However, I have doubt between this field or the field "Data mining and (big) data analytics".', '2014-02-10 11:22:39.430023', 1, 1056);
INSERT INTO papers_nm_comments VALUES (16, 'This paper presents a digital forensic tool for exploring changes to
directories and files within shadow volume data. I''m not sure if this work should appear in the survey.', '2014-02-10 11:29:12.933927', 1, 1053);
INSERT INTO papers_nm_comments VALUES (17, 'This paper is focused on evaluation of visualization techniques for security analysis. In this way, it does not address a network management gap that could be enhanced by visualizations.', '2014-02-10 11:36:43.958684', 1, 999);
INSERT INTO papers_nm_comments VALUES (18, 'The authors propose a mathematical approach for a trust model. I marked "design" in the "Methods" section, but i''m not sure.', '2014-02-10 11:50:59.78305', 1, 1054);
INSERT INTO papers_nm_comments VALUES (19, 'The ELVIS tool uses standard web technologies: HTML5, Javascript, CSS and SVG.

- use the D3.chart library from the Miso project

- they also created multiple parsers for multiple log formats', '2014-02-10 13:12:42.219882', 1, 1052);
INSERT INTO papers_nm_comments VALUES (20, 'I''m not sure if Control theories fit on this paper (Fourier and wavelet to time-series transformation).', '2014-02-10 13:26:00.503606', 1, 1057);
INSERT INTO papers_nm_comments VALUES (21, 'Important sentence in the introduction:

A common comment was: "Researchers come to us and say, Here''s a visualization tool, let''s t your problem to this tool. But what we need is a tool built to t our problem."', '2014-02-10 13:29:57.724735', 1, 1039);
INSERT INTO papers_nm_comments VALUES (22, 'This work uses Information Entropy, a concept proposed by Shannon in 1948. I didn''t find an appropriate field in the methods section.', '2014-02-10 13:47:32.832316', 1, 1043);
INSERT INTO papers_nm_comments VALUES (23, 'It is important to review the web approach deployed by authors.', '2014-02-10 13:49:13.637951', 1, 1039);
INSERT INTO papers_nm_comments VALUES (24, 'The authors present a recommender system for 3D network security visualization tools called NAVSEC. They use the nearest neighbor recommendation algorithm.', '2014-02-10 13:55:46.094975', 1, 1055);
INSERT INTO papers_nm_comments VALUES (25, 'This paper is more related to visualizations than to network management.', '2014-02-10 14:03:43.931842', 1, 1034);
INSERT INTO papers_nm_comments VALUES (26, 'This paper exploits a 3D approach for network scans. In essence, the approach is more focused in visualization techniques than in the network issues.', '2014-02-10 14:17:49.47818', 1, 1058);
INSERT INTO papers_nm_comments VALUES (27, 'This paper shows a little bit of visualization. Its main topic is related to use of semi-Markov process to quantify the transition probabilities from the current state to security failure state.', '2014-02-10 14:25:02.16836', 1, 1044);
INSERT INTO papers_nm_comments VALUES (28, 'This paper could be used as base for investigations about visualizations and IoT.', '2014-02-10 14:39:24.939624', 1, 1037);
INSERT INTO papers_nm_comments VALUES (29, 'This paper does not explore visualizations in deep. Visualizations are just a secondary result. However, the paper is really focused on network management discipline.', '2014-02-10 14:55:16.606646', 1, 1032);
INSERT INTO papers_nm_comments VALUES (30, 'Visualizations are too superficial in this paper.', '2014-02-10 15:24:37.500191', 1, 1049);
INSERT INTO papers_nm_comments VALUES (31, 'Visualizations are less addressed in this paper. The authors are more focused on the clustering model. Additionally, they study the vulnerabilities around SNMP protocol.', '2014-02-10 15:33:52.495079', 1, 1050);
INSERT INTO papers_nm_comments VALUES (32, 'I have found this paper on the Internet, but I didn''t find where it was published.', '2014-02-10 15:53:41.418548', 1, 1033);
INSERT INTO papers_nm_comments VALUES (33, 'The purpose of this paper is to propose novel information visualization and interaction
techniques to help security administrators analyze past web form submissions, with the goals of searching, inspecting, verifying, and understanding about malicious submissions.', '2014-02-10 16:03:47.138473', 1, 1048);
INSERT INTO papers_nm_comments VALUES (34, 'This is an approach to visualize netflow records.', '2014-02-10 16:17:10.32035', 1, 1038);
INSERT INTO papers_nm_comments VALUES (35, 'The visualization is based only on the google maps interface.', '2014-02-10 16:33:04.468278', 1, 1036);
INSERT INTO papers_nm_comments VALUES (36, 'The authors use Prefuse to build visualizations.', '2014-02-10 16:39:17.202878', 1, 1051);
INSERT INTO papers_nm_comments VALUES (37, 'The authors are really direct. They explain the problem addressed and show a set of visualization techniques to analyze php and web-server logs.', '2014-02-10 16:43:02.439346', 1, 1051);
INSERT INTO papers_nm_comments VALUES (38, 'This paper exploits a 3D approach for network security. In essence, the approach is more focused in visualization techniques than in the network issues.

The authors are the same of paper:

P3D- A Parallel 3D Coordinate Visualization for Advanced Network Scans', '2014-02-10 20:55:02.288067', 1, 998);
INSERT INTO papers_nm_comments VALUES (39, 'This paper focuses on visualization techniques as well as in the network security field. It is a good paper to exemplify the synergy between those areas.', '2014-02-10 21:08:14.593936', 1, 993);
INSERT INTO papers_nm_comments VALUES (40, 'I guess the entropy could be classified in the Optimization theories.', '2014-02-10 21:20:01.634054', 1, 1043);
INSERT INTO papers_nm_comments VALUES (41, '- This paper is a good example for further IoT visualizations.
- This presents two systems that together attempt  to realize the sensor web vision of spatially distributed sensor resources working together to increase information availability. 
- The paper has minor attention to visualization.', '2014-02-10 21:40:24.591704', 1, 1029);
INSERT INTO papers_nm_comments VALUES (42, 'This paper uses visualization to represent the network  topology, the state of each node, and the packet flow in Mobile Ad-hoc Networks. They introduce three visualization modes and an implementation of the Dynamic Source Routing (DSR) protocol.', '2014-02-11 11:58:22.246578', 1, 1021);
INSERT INTO papers_nm_comments VALUES (43, 'The paper take advantage of the structural properties of the
k-partite graph to identify rogue anti-virus enterprises. The main focus is in the problem definition using math fundamentals.', '2014-02-13 10:39:25.653987', 1, 994);
INSERT INTO papers_nm_comments VALUES (44, 'I''m not sure whether this paper should be part of the survey. It is focused on analyze software security structure and properties, to support first step of security analysis methodologies.', '2014-02-13 10:51:00.99179', 1, 990);
INSERT INTO papers_nm_comments VALUES (45, 'The paper goal is as follow:

A customizable data exploration tool which empowers the user to see visual  representations of directories that have changed over time within a computer operating system that supports the Microsoft Volume Shadow Copy Service.

I''m not sure whether this paper should be part of the survey.', '2014-02-13 13:58:30.783464', 1, 1067);
INSERT INTO papers_nm_comments VALUES (46, 'This paper is very interesting because it addresses IPTV issues (e.g., QoS, QoE, and data analysis).', '2014-02-13 14:10:10.419642', 1, 979);
INSERT INTO papers_nm_comments VALUES (47, 'This paper shows an example of security alert in XML format. This format was designed to the proposed tool and might be a good example for other applications.', '2014-02-13 14:17:30.613848', 1, 1068);
INSERT INTO papers_nm_comments VALUES (48, 'This paper addresses the management of Service Oriented Networks. The approach is interesting and might be used as base for further researches.', '2014-02-13 14:29:15.451858', 1, 1018);
INSERT INTO papers_nm_comments VALUES (49, 'The authors of this paper are the same of others papers. They are experts on BGP features, and deploy visualisation to help in BGP analysis.', '2014-02-13 14:41:52.234819', 1, 995);
INSERT INTO papers_nm_comments VALUES (50, 'This paper is interesting because the authors show a monitoring solution where the measurement information are shown in a Web Dashboard. This architecture is  a good example to use as base for others scenarios of network management.', '2014-02-13 20:08:55.020044', 1, 1023);
INSERT INTO papers_nm_comments VALUES (51, 'Another paper that emphasizes the use of Web-based environment. 

- A framework for building web-based visualizations that
avoid sending sensitive data to servers.

- A framework for building web-based visualizations that avoid sending sensitive data to servers.', '2014-02-13 20:12:54.147664', 1, 991);
INSERT INTO papers_nm_comments VALUES (52, 'Paper does not show the developed visualizations.', '2014-02-13 20:23:08.669721', 1, 1019);
INSERT INTO papers_nm_comments VALUES (53, 'In this paper, visualizations are employed to help on understanding the routing protocols from simulations.', '2014-02-13 20:27:55.524142', 1, 1030);
INSERT INTO papers_nm_comments VALUES (54, 'I have not classified this paper in the taxonomy fields, because it is a general survey about security visualizations. However, this paper is a very important reading, since it addresses previous researches as well as novel trends.', '2014-02-13 20:42:14.511436', 1, 980);
INSERT INTO papers_nm_comments VALUES (55, 'This paper might be used as a first step for researches involving situation awareness and visualizations.', '2014-02-13 20:46:04.083547', 1, 996);
INSERT INTO papers_nm_comments VALUES (56, 'This paper is too poor.', '2014-02-13 20:49:50.533582', 1, 1020);
INSERT INTO papers_nm_comments VALUES (57, 'This paper presents a survey of visualization methods that have been developed for BGP monitoring, in particular for the identification of prefix hijacks.', '2014-02-13 21:06:18.333703', 1, 992);
INSERT INTO papers_nm_comments VALUES (58, 'Interesting because the proposed solution provides generalized support for situational awareness in any domain.', '2014-02-13 21:16:42.010007', 1, 1024);
INSERT INTO papers_nm_comments VALUES (59, 'Chapter 3 is interesting because it introduces an approach for visualization design process.', '2014-02-13 21:20:59.19689', 1, 1024);
INSERT INTO papers_nm_comments VALUES (60, 'I''m not 100% confident whether this paper is within the scope of the survey. It addresses computer security, specifically, malwares.', '2014-02-13 21:28:09.457808', 1, 1025);
INSERT INTO papers_nm_comments VALUES (61, 'I''m not 100% confident whether this paper is within the scope of the survey. It focuses on dates that composes passwords, designing an interative visualization for their detailed analysis, and using it to explore the RockYou datase of over 32 million passwords.', '2014-02-13 21:37:24.8011', 1, 1031);
INSERT INTO papers_nm_comments VALUES (62, 'This paper is too poor. I think it should be dropped.', '2014-02-16 15:25:16.705712', 1, 978);
INSERT INTO papers_nm_comments VALUES (63, 'This work show a good example of publication regarding visualization and network security. It focuses on firewall rules issues.', '2014-02-16 15:36:36.594524', 1, 985);
INSERT INTO papers_nm_comments VALUES (64, 'I''m not sure if the problem addressed by this paper is relevant.', '2014-02-16 16:00:13.649293', 1, 1017);
INSERT INTO papers_nm_comments VALUES (65, 'This is a short paper. However, it might be used as a starting point for researches regarding virtual networks and visualizations.', '2014-02-16 16:20:26.432838', 1, 1008);
INSERT INTO papers_nm_comments VALUES (66, 'This paper is too poor. I think it should be dropped.', '2014-02-16 16:26:37.227141', 1, 986);
INSERT INTO papers_nm_comments VALUES (67, 'I''m not sure if this paper should be used in the survey.', '2014-02-16 16:29:07.096626', 1, 957);
INSERT INTO papers_nm_comments VALUES (68, 'This paper emphasizes the use of AI in a IDS.', '2014-02-16 16:46:58.717809', 1, 936);
INSERT INTO papers_nm_comments VALUES (69, 'This paper is more focused on visualization methodologies.', '2014-02-16 16:57:08.57033', 1, 966);
INSERT INTO papers_nm_comments VALUES (70, 'I''m not sure if this paper should be regarded in the survey.

"We describe a tool to support the visual analysis of a hierarchical decision structure represented in a  portable, file-based database. The tool visualizes and traces relationships between decision goals, sub-goals, decisions, information requirements, and data sources."', '2014-02-16 17:07:45.831138', 1, 1015);
INSERT INTO papers_nm_comments VALUES (71, 'This paper is a good example of the parallel coordinates technique.', '2014-02-16 17:13:29.687031', 1, 967);
INSERT INTO papers_nm_comments VALUES (72, 'This work introduces visualizations using new web trends such as HTML5.', '2014-02-16 17:20:49.505812', 1, 1014);
INSERT INTO papers_nm_comments VALUES (73, 'It is based on Cacti tool.', '2014-02-16 17:21:47.353574', 1, 1014);
INSERT INTO papers_nm_comments VALUES (74, 'This paper is focused on a new visualization method. Network intrusion detection were used as a case of study.', '2014-02-16 18:09:48.893093', 1, 953);
INSERT INTO papers_nm_comments VALUES (75, 'This paper is good example that uses data from mobile phone networks.', '2014-02-16 18:13:20.208903', 1, 944);
INSERT INTO papers_nm_comments VALUES (76, 'This is a short paper (two pages).', '2014-02-16 18:17:54.85167', 1, 1004);
INSERT INTO papers_nm_comments VALUES (77, 'This paper address a interesting topic: Supporting ordinary home users to diagnose and resolve potential problems in their home wireless networks 
presents a significant opportunity to reduce support costs and increase user satisfaction ... This paper introduces an approach for expert-derived semantic annotation of this raw data in order to allow end users to understand and resolve common network-related problems in real time.', '2014-02-16 18:20:56.469154', 1, 961);
INSERT INTO papers_nm_comments VALUES (78, 'This paper is too poor.', '2014-02-16 18:29:12.315313', 1, 1005);
INSERT INTO papers_nm_comments VALUES (79, 'The problem is very interesting, but the visualizations were not explored in deep. -- We propose a system that helps decode network conﬁgurations by interpreting low-level fragmented conﬁgurations and then presenting their high-level intended policies.', '2014-02-16 18:35:33.418396', 1, 1006);
INSERT INTO papers_nm_comments VALUES (80, 'This paper does not explore visualizations in deep.', '2014-02-16 18:43:09.908638', 1, 946);
INSERT INTO papers_nm_comments VALUES (81, 'Another paper about home network management.', '2014-02-16 19:35:15.424334', 1, 937);
INSERT INTO papers_nm_comments VALUES (82, 'I''m in doubt if "Probabilistic, stochastic processes, queuing theory" is adequate for this paper.', '2014-02-16 19:54:52.021297', 1, 955);
INSERT INTO papers_nm_comments VALUES (83, 'This paper is more focused on visualization aspects.', '2014-02-18 13:44:33.838838', 1, 984);
INSERT INTO papers_nm_comments VALUES (84, 'I guess this paper should not be regarded in the survey.', '2014-02-18 13:50:58.204794', 1, 977);
INSERT INTO papers_nm_comments VALUES (85, 'Interesting paper. I need read again.

Good example: In the network management domain, the gap between the daily network monitoring and the high level decision making is currently not well bridged by any interactive tool.', '2014-02-18 14:00:16.834565', 1, 948);
INSERT INTO papers_nm_comments VALUES (86, 'This paper is interesting because it shows that the proposed solution was tested by security analysts. This evaluation approach might be employed in other works.', '2014-02-18 14:18:56.553867', 1, 950);
INSERT INTO papers_nm_comments VALUES (87, 'Visualizations are few addressed in this paper.', '2014-02-18 14:32:06.470732', 1, 939);
INSERT INTO papers_nm_comments VALUES (88, 'This paper is a survey about visualizations (weaknesses and challenges) in security field.', '2014-02-18 14:38:14.014602', 1, 956);
INSERT INTO papers_nm_comments VALUES (89, 'An aspect to be analyzed:

"One comment we heard many times when talking with analysts was the desire to know what is normal for their network. If they can efficiently compare current activities to known normal (or at least acceptable) profiles for users, hosts, or groups on their network, analysis of the deviations from expected behavior can give a strong starting point for investigation."', '2014-02-18 14:46:01.522788', 1, 942);
INSERT INTO papers_nm_comments VALUES (90, 'Read the study design.

', '2014-02-18 15:13:35.528478', 1, 1001);
INSERT INTO papers_nm_comments VALUES (91, 'I think this paper should not be used in the survey, since it explores code vulnerabilities.', '2014-02-18 15:18:53.815405', 1, 945);
INSERT INTO papers_nm_comments VALUES (92, 'I''m not confident whether this paper should appear in the survey.', '2014-02-18 15:21:52.907211', 1, 964);
INSERT INTO papers_nm_comments VALUES (93, 'Read the section 3.1 about situational awareness.', '2014-02-18 15:31:53.25025', 1, 974);
INSERT INTO papers_nm_comments VALUES (94, 'I''m not confident whether this paper should appear in the survey.', '2014-02-18 15:35:27.498673', 1, 983);
INSERT INTO papers_nm_comments VALUES (95, 'I think this paper is out of the context of the survey.', '2014-02-20 13:43:19.771771', 1, 922);
INSERT INTO papers_nm_comments VALUES (96, 'This paper is interesting because they explain about parallel coordinates technique for flow visualizations.', '2014-02-20 13:49:20.429778', 1, 827);
INSERT INTO papers_nm_comments VALUES (97, 'This paper might be used as an example to recognize situation''s patterns.', '2014-02-20 13:50:24.651525', 1, 827);
INSERT INTO papers_nm_comments VALUES (98, 'This paper is more focused on visualizations.', '2014-02-20 14:01:46.191632', 1, 935);
INSERT INTO papers_nm_comments VALUES (99, 'In this paper visualizations are less exploited.', '2014-02-20 14:04:41.064617', 1, 783);
INSERT INTO papers_nm_comments VALUES (100, 'This paper address situational awareness and visualizations for security purpose.', '2014-02-20 14:14:18.397958', 1, 860);
INSERT INTO papers_nm_comments VALUES (101, 'Brazilian work.', '2014-02-20 14:17:06.245466', 1, 930);
INSERT INTO papers_nm_comments VALUES (102, 'This paper is too poor.', '2014-02-20 14:28:35.075256', 1, 903);
INSERT INTO papers_nm_comments VALUES (103, 'This paper uses Google Maps API.', '2014-02-20 14:31:36.469476', 1, 870);
INSERT INTO papers_nm_comments VALUES (104, 'This paper is focused on malware. I think it is out of scope of the survey.', '2014-02-20 14:37:45.846985', 1, 846);
INSERT INTO papers_nm_comments VALUES (105, 'HTML is not a protocol. --->  "Bots take their orders from bot masters via command and control centers (C&C) using various protocols, such as HTML, Internet Relay Chat (IRC), and Peer-to-Peer (P2P). Estimates of the numbers and sizes of botnets vary, but one study, for example[21], discovered 3,290 unique IRC botnets with 700,700 distinct IP addresses."', '2014-02-20 14:56:00.89927', 1, 929);
INSERT INTO papers_nm_comments VALUES (106, 'This paper is focused on malware. I think it is out of scope of the survey.', '2014-02-20 15:01:28.756647', 1, 802);
INSERT INTO papers_nm_comments VALUES (107, 'I don''t know if this paper should be regarded in the survey.', '2014-02-20 15:09:41.930745', 1, 850);
INSERT INTO papers_nm_comments VALUES (108, 'I don''t know if this paper should be regarded in the survey.', '2014-02-20 15:10:43.895688', 1, 905);
INSERT INTO papers_nm_comments VALUES (109, 'I don''t know if this paper should be regarded in the survey.', '2014-02-20 15:39:59.913855', 1, 902);
INSERT INTO papers_nm_comments VALUES (110, 'I don''t know if this paper should be regarded in the survey. They talk about digital forensic strings.', '2014-02-20 15:43:14.029928', 1, 874);
INSERT INTO papers_nm_comments VALUES (111, 'I don''t know if this paper should be regarded in the survey. They talk about file system access-Control (e.g., NTFS).', '2014-02-20 15:54:05.108858', 1, 869);
INSERT INTO papers_nm_comments VALUES (112, 'This paper is a tutorial on the construction and use of existence plots.', '2014-02-20 15:56:49.928645', 1, 881);
INSERT INTO papers_nm_comments VALUES (113, 'The flow data analysis is interesting in this paper.', '2014-02-20 16:22:21.941077', 1, 786);
INSERT INTO papers_nm_comments VALUES (114, 'This paper talks about Network Situation Awareness. It is simple, but might be used as an start point for studies about situational awareness.', '2014-02-23 09:55:52.328856', 1, 933);
INSERT INTO papers_nm_comments VALUES (115, 'This paper is pretty interesting for netflow-based visualizations.', '2014-02-23 09:59:24.505487', 1, 839);
INSERT INTO papers_nm_comments VALUES (116, 'This paper was written by the Defence Research and Development Canada (DRDC). In 2007, they developed a big research report regarding visualization techniques and network management.', '2014-02-23 10:09:44.177566', 1, 927);
INSERT INTO papers_nm_comments VALUES (117, 'I''m not sure whether this paper should be part of the survey. However, this paper introduces a  Analyze-Visualize-Validate for visualizations in forensic analysis. It might be used as base for evaluation purpose.', '2014-02-23 10:16:28.493332', 1, 932);
INSERT INTO papers_nm_comments VALUES (118, 'This paper shows an User Evaluation. It could be interesting.', '2014-02-23 10:20:06.331354', 1, 894);
INSERT INTO papers_nm_comments VALUES (119, 'This paper is interesting because it is focused in general data center issues. I need to read in more detail.', '2014-02-23 10:27:10.908458', 1, 879);
INSERT INTO papers_nm_comments VALUES (120, 'I''m not sure whether this paper should be part of the survey.', '2014-02-23 10:31:03.446471', 1, 884);
INSERT INTO papers_nm_comments VALUES (121, 'I''m not sure whether this paper should be part of the survey.', '2014-02-23 10:32:23.22121', 1, 810);
INSERT INTO papers_nm_comments VALUES (122, 'I''m not sure whether this paper should be part of the survey.', '2014-02-23 10:33:50.627278', 1, 840);
INSERT INTO papers_nm_comments VALUES (123, 'The paper is interesting.', '2014-02-23 10:35:34.585057', 1, 840);
INSERT INTO papers_nm_comments VALUES (124, 'This paper is very interesting.', '2014-02-23 10:38:33.433535', 1, 886);
INSERT INTO papers_nm_comments VALUES (125, 'I''m not sure whether this paper should be appear in the survey. However, the addressed issue is interesting: "We address this gap through an in-depth exploration of an HCI methodology aimed at translating user requirements data into the software prototypes. We also demonstrate through a case study how a light-weight user-centered design process can be used to better ensure the usability of the resulting software.".', '2014-02-23 14:39:49.247648', 1, 925);
INSERT INTO papers_nm_comments VALUES (126, 'This paper addresses a network testbed.', '2014-02-23 14:56:40.207769', 1, 915);
INSERT INTO papers_nm_comments VALUES (127, 'The proposal of this paper is interesting. However, the paper is too brief.', '2014-02-23 15:01:08.848274', 1, 876);
INSERT INTO papers_nm_comments VALUES (128, 'The paper is long and explores machine learning techniques and visualizations. However, it is too abstract.', '2014-02-23 15:07:02.639865', 1, 917);
INSERT INTO papers_nm_comments VALUES (129, 'This paper is a survey about VizSec.', '2014-02-23 15:16:10.481477', 1, 843);
INSERT INTO papers_nm_comments VALUES (130, 'This paper is interesting for evaluations.', '2014-02-23 15:19:33.002208', 1, 926);
INSERT INTO papers_nm_comments VALUES (131, 'I''m not sure how this paper could be regarded in the survey.', '2014-02-23 15:20:37.942264', 1, 926);
INSERT INTO papers_nm_comments VALUES (132, 'This paper is a survey. It might be used as an example.', '2014-02-23 15:28:16.90027', 1, 859);
INSERT INTO papers_nm_comments VALUES (133, 'It is like a report.', '2014-02-23 15:50:20.690114', 1, 844);
INSERT INTO papers_nm_comments VALUES (134, 'This is more focused in visualizations. However, the case study are interesting.', '2014-02-23 18:17:57.813359', 1, 785);
INSERT INTO papers_nm_comments VALUES (135, 'This paper shows an evaluation of its visualizations.', '2014-02-23 18:36:25.364899', 1, 845);
INSERT INTO papers_nm_comments VALUES (136, 'They explore visualization too little.', '2014-02-23 18:40:58.365105', 1, 924);
INSERT INTO papers_nm_comments VALUES (137, 'I''m not confident whether this paper should be part of the survey.', '2014-02-23 18:46:10.903877', 1, 892);
INSERT INTO papers_nm_comments VALUES (138, 'This paper is more focused in the visualization field.', '2014-02-24 09:36:05.976189', 1, 775);
INSERT INTO papers_nm_comments VALUES (139, 'This paper is more focused in the visualization field and network security is a case study.', '2014-02-24 11:23:15.826301', 1, 803);
INSERT INTO papers_nm_comments VALUES (140, 'I need to read this paper in more detail.', '2014-02-24 14:16:02.225804', 1, 836);
INSERT INTO papers_nm_comments VALUES (141, 'This paper introduces a collaborative approach.', '2014-02-24 14:19:51.066187', 1, 838);
INSERT INTO papers_nm_comments VALUES (142, 'Good paper. I need to read in more detail.', '2014-02-24 14:31:36.789513', 1, 773);
INSERT INTO papers_nm_comments VALUES (143, 'This paper is well organized.', '2014-02-24 14:37:12.0438', 1, 912);
INSERT INTO papers_nm_comments VALUES (144, 'This paper shows an approach to evaluate the visualizations.', '2014-02-24 14:49:48.697083', 1, 818);
INSERT INTO papers_nm_comments VALUES (145, 'Web approach.', '2014-02-24 14:54:58.922126', 1, 898);
INSERT INTO papers_nm_comments VALUES (146, 'I''m not sure if this paper could be classified on Ad-hoc or wireless networks.', '2014-02-24 15:37:44.554272', 1, 891);
INSERT INTO papers_nm_comments VALUES (147, 'This papers shows an usability test. The tests are brief, but might be useful.', '2014-02-27 09:55:55.818189', 1, 791);
INSERT INTO papers_nm_comments VALUES (148, 'This paper shows an USER-CENTERED DESIGN METHODOLOGY. Additionally, they show USABILITY STUDY RESULTS.', '2014-02-27 10:01:03.210262', 1, 765);
INSERT INTO papers_nm_comments VALUES (149, 'I need to read in more detail.', '2014-02-27 10:01:38.589504', 1, 765);
INSERT INTO papers_nm_comments VALUES (150, 'I''m not 100% confident whether this paper should be part of the survey.', '2014-02-27 14:55:17.266274', 1, 780);
INSERT INTO papers_nm_comments VALUES (151, 'I need to read the section: "Initial usage experiences"', '2014-02-28 15:52:50.866448', 1, 760);
INSERT INTO papers_nm_comments VALUES (152, 'I need to read in more detail.', '2014-02-28 17:38:43.820486', 1, 854);
INSERT INTO papers_nm_comments VALUES (153, 'This paper introduces an interesting USABILITY STUDY. I need to read in more detail.', '2014-03-02 15:34:35.44639', 1, 787);
INSERT INTO papers_nm_comments VALUES (154, 'I''m not 100% confident whether this paper should be part of the survey.', '2014-03-02 16:10:01.86276', 1, 1064);
INSERT INTO papers_nm_comments VALUES (155, 'This paper show an USABILITY STUDY. I need to read in more detail.', '2014-03-02 16:30:23.581193', 1, 742);
INSERT INTO papers_nm_comments VALUES (156, 'This paper is very interesting. They present the background for Situational Awareness and Visualization.', '2014-03-02 16:40:02.502077', 1, 737);
INSERT INTO papers_nm_comments VALUES (157, 'This paper shows a good example of the usage of parallel coordinates technique.', '2014-03-02 16:57:22.752026', 1, 740);
INSERT INTO papers_nm_comments VALUES (158, 'This approach is pretty different from the majority.', '2014-03-02 17:41:58.123884', 1, 799);
INSERT INTO papers_nm_comments VALUES (159, 'This paper presents a GUI, i.e., it is not really focused in visualization techniques. ', '2014-03-02 17:47:09.294337', 1, 862);
INSERT INTO papers_nm_comments VALUES (160, 'I''m not sure whether this paper should be part of the survey.', '2014-03-02 18:25:14.763308', 1, 1062);
INSERT INTO papers_nm_comments VALUES (161, 'It seems a report.', '2014-03-02 18:32:13.077091', 1, 851);
INSERT INTO papers_nm_comments VALUES (162, 'This paper is more related to host management.', '2014-03-02 18:35:11.945768', 1, 756);
INSERT INTO papers_nm_comments VALUES (163, 'This paper is more related to host management.', '2014-03-02 18:38:18.353065', 1, 757);
INSERT INTO papers_nm_comments VALUES (164, 'I''m not sure whether this paper should be part of the survey.', '2014-03-02 19:26:46.613521', 1, 727);
INSERT INTO papers_nm_comments VALUES (165, 'I''m not sure whether this paper should be part of the survey.', '2014-03-02 22:46:51.929796', 1, 717);
INSERT INTO papers_nm_comments VALUES (166, 'I''m not sure whether this paper should be part of the survey. This is very similar to the paper entitled "Supporting Network Management through Declaratively Specified Data Visualizations".', '2014-03-03 14:55:59.160447', 1, 710);
INSERT INTO papers_nm_comments VALUES (167, 'I don''t know how to classify this paper.', '2014-03-06 16:44:45.202985', 1, 1091);


--
-- Name: papers_nm_comments_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('papers_nm_comments_seq', 167, true);


--
-- Data for Name: papers_nm_subtopic; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO papers_nm_subtopic VALUES (2922, 748, 3);
INSERT INTO papers_nm_subtopic VALUES (2923, 748, 26);
INSERT INTO papers_nm_subtopic VALUES (2924, 748, 36);
INSERT INTO papers_nm_subtopic VALUES (272, 1056, 3);
INSERT INTO papers_nm_subtopic VALUES (273, 1056, 26);
INSERT INTO papers_nm_subtopic VALUES (274, 1056, 36);
INSERT INTO papers_nm_subtopic VALUES (275, 1056, 51);
INSERT INTO papers_nm_subtopic VALUES (276, 1053, 3);
INSERT INTO papers_nm_subtopic VALUES (277, 1053, 26);
INSERT INTO papers_nm_subtopic VALUES (278, 1053, 44);
INSERT INTO papers_nm_subtopic VALUES (279, 1052, 3);
INSERT INTO papers_nm_subtopic VALUES (280, 1052, 13);
INSERT INTO papers_nm_subtopic VALUES (135, 1041, 2);
INSERT INTO papers_nm_subtopic VALUES (136, 1041, 26);
INSERT INTO papers_nm_subtopic VALUES (137, 1041, 51);
INSERT INTO papers_nm_subtopic VALUES (138, 1041, 53);
INSERT INTO papers_nm_subtopic VALUES (139, 1041, 54);
INSERT INTO papers_nm_subtopic VALUES (281, 1052, 26);
INSERT INTO papers_nm_subtopic VALUES (282, 1052, 44);
INSERT INTO papers_nm_subtopic VALUES (20, 1086, 2);
INSERT INTO papers_nm_subtopic VALUES (21, 1086, 6);
INSERT INTO papers_nm_subtopic VALUES (528, 1026, 3);
INSERT INTO papers_nm_subtopic VALUES (529, 1026, 26);
INSERT INTO papers_nm_subtopic VALUES (24, 1035, 6);
INSERT INTO papers_nm_subtopic VALUES (25, 1035, 52);
INSERT INTO papers_nm_subtopic VALUES (26, 1035, 55);
INSERT INTO papers_nm_subtopic VALUES (283, 1052, 53);
INSERT INTO papers_nm_subtopic VALUES (28, 1047, 55);
INSERT INTO papers_nm_subtopic VALUES (284, 1052, 54);
INSERT INTO papers_nm_subtopic VALUES (530, 1026, 44);
INSERT INTO papers_nm_subtopic VALUES (531, 1026, 53);
INSERT INTO papers_nm_subtopic VALUES (532, 1026, 54);
INSERT INTO papers_nm_subtopic VALUES (539, 1023, 2);
INSERT INTO papers_nm_subtopic VALUES (540, 1023, 22);
INSERT INTO papers_nm_subtopic VALUES (37, 1054, 11);
INSERT INTO papers_nm_subtopic VALUES (38, 1054, 26);
INSERT INTO papers_nm_subtopic VALUES (39, 1054, 53);
INSERT INTO papers_nm_subtopic VALUES (40, 1054, 54);
INSERT INTO papers_nm_subtopic VALUES (285, 1057, 3);
INSERT INTO papers_nm_subtopic VALUES (286, 1057, 13);
INSERT INTO papers_nm_subtopic VALUES (287, 1057, 26);
INSERT INTO papers_nm_subtopic VALUES (288, 1057, 44);
INSERT INTO papers_nm_subtopic VALUES (289, 1057, 46);
INSERT INTO papers_nm_subtopic VALUES (403, 1029, 1);
INSERT INTO papers_nm_subtopic VALUES (290, 1057, 53);
INSERT INTO papers_nm_subtopic VALUES (291, 1057, 55);
INSERT INTO papers_nm_subtopic VALUES (292, 1043, 26);
INSERT INTO papers_nm_subtopic VALUES (65, 1039, 26);
INSERT INTO papers_nm_subtopic VALUES (66, 1039, 44);
INSERT INTO papers_nm_subtopic VALUES (67, 1039, 53);
INSERT INTO papers_nm_subtopic VALUES (68, 1039, 54);
INSERT INTO papers_nm_subtopic VALUES (404, 1029, 2);
INSERT INTO papers_nm_subtopic VALUES (405, 1029, 6);
INSERT INTO papers_nm_subtopic VALUES (406, 1029, 44);
INSERT INTO papers_nm_subtopic VALUES (407, 1029, 53);
INSERT INTO papers_nm_subtopic VALUES (408, 1029, 54);
INSERT INTO papers_nm_subtopic VALUES (293, 1043, 44);
INSERT INTO papers_nm_subtopic VALUES (294, 1043, 47);
INSERT INTO papers_nm_subtopic VALUES (295, 1043, 53);
INSERT INTO papers_nm_subtopic VALUES (296, 1043, 54);
INSERT INTO papers_nm_subtopic VALUES (297, 1043, 55);
INSERT INTO papers_nm_subtopic VALUES (298, 1055, 3);
INSERT INTO papers_nm_subtopic VALUES (409, 1029, 55);
INSERT INTO papers_nm_subtopic VALUES (416, 1021, 1);
INSERT INTO papers_nm_subtopic VALUES (417, 1021, 2);
INSERT INTO papers_nm_subtopic VALUES (299, 1055, 13);
INSERT INTO papers_nm_subtopic VALUES (418, 1021, 25);
INSERT INTO papers_nm_subtopic VALUES (419, 1021, 36);
INSERT INTO papers_nm_subtopic VALUES (300, 1055, 26);
INSERT INTO papers_nm_subtopic VALUES (301, 1055, 44);
INSERT INTO papers_nm_subtopic VALUES (302, 1055, 49);
INSERT INTO papers_nm_subtopic VALUES (303, 1055, 53);
INSERT INTO papers_nm_subtopic VALUES (420, 1021, 53);
INSERT INTO papers_nm_subtopic VALUES (421, 1021, 54);
INSERT INTO papers_nm_subtopic VALUES (422, 994, 3);
INSERT INTO papers_nm_subtopic VALUES (423, 994, 20);
INSERT INTO papers_nm_subtopic VALUES (424, 994, 26);
INSERT INTO papers_nm_subtopic VALUES (425, 994, 51);
INSERT INTO papers_nm_subtopic VALUES (426, 994, 53);
INSERT INTO papers_nm_subtopic VALUES (427, 994, 54);
INSERT INTO papers_nm_subtopic VALUES (304, 1055, 54);
INSERT INTO papers_nm_subtopic VALUES (305, 1034, 3);
INSERT INTO papers_nm_subtopic VALUES (108, 1046, 26);
INSERT INTO papers_nm_subtopic VALUES (109, 1046, 53);
INSERT INTO papers_nm_subtopic VALUES (110, 1046, 54);
INSERT INTO papers_nm_subtopic VALUES (111, 1046, 55);
INSERT INTO papers_nm_subtopic VALUES (117, 1037, 2);
INSERT INTO papers_nm_subtopic VALUES (118, 1037, 6);
INSERT INTO papers_nm_subtopic VALUES (119, 1037, 26);
INSERT INTO papers_nm_subtopic VALUES (120, 1037, 52);
INSERT INTO papers_nm_subtopic VALUES (121, 1037, 53);
INSERT INTO papers_nm_subtopic VALUES (122, 1037, 54);
INSERT INTO papers_nm_subtopic VALUES (435, 979, 3);
INSERT INTO papers_nm_subtopic VALUES (436, 979, 12);
INSERT INTO papers_nm_subtopic VALUES (437, 979, 18);
INSERT INTO papers_nm_subtopic VALUES (438, 979, 25);
INSERT INTO papers_nm_subtopic VALUES (439, 979, 53);
INSERT INTO papers_nm_subtopic VALUES (306, 1034, 26);
INSERT INTO papers_nm_subtopic VALUES (307, 1034, 53);
INSERT INTO papers_nm_subtopic VALUES (192, 1032, 10);
INSERT INTO papers_nm_subtopic VALUES (193, 1032, 23);
INSERT INTO papers_nm_subtopic VALUES (194, 1032, 52);
INSERT INTO papers_nm_subtopic VALUES (195, 1032, 53);
INSERT INTO papers_nm_subtopic VALUES (196, 1032, 54);
INSERT INTO papers_nm_subtopic VALUES (308, 1058, 3);
INSERT INTO papers_nm_subtopic VALUES (309, 1058, 26);
INSERT INTO papers_nm_subtopic VALUES (310, 1058, 52);
INSERT INTO papers_nm_subtopic VALUES (440, 979, 54);
INSERT INTO papers_nm_subtopic VALUES (441, 979, 55);
INSERT INTO papers_nm_subtopic VALUES (447, 1068, 3);
INSERT INTO papers_nm_subtopic VALUES (311, 1058, 53);
INSERT INTO papers_nm_subtopic VALUES (312, 1058, 54);
INSERT INTO papers_nm_subtopic VALUES (210, 1038, 3);
INSERT INTO papers_nm_subtopic VALUES (211, 1038, 22);
INSERT INTO papers_nm_subtopic VALUES (212, 1038, 23);
INSERT INTO papers_nm_subtopic VALUES (213, 1038, 25);
INSERT INTO papers_nm_subtopic VALUES (214, 1038, 26);
INSERT INTO papers_nm_subtopic VALUES (215, 1038, 53);
INSERT INTO papers_nm_subtopic VALUES (216, 1038, 54);
INSERT INTO papers_nm_subtopic VALUES (217, 1038, 56);
INSERT INTO papers_nm_subtopic VALUES (313, 1044, 3);
INSERT INTO papers_nm_subtopic VALUES (314, 1044, 26);
INSERT INTO papers_nm_subtopic VALUES (315, 1044, 51);
INSERT INTO papers_nm_subtopic VALUES (316, 1044, 52);
INSERT INTO papers_nm_subtopic VALUES (317, 1044, 53);
INSERT INTO papers_nm_subtopic VALUES (223, 1036, 3);
INSERT INTO papers_nm_subtopic VALUES (224, 1036, 13);
INSERT INTO papers_nm_subtopic VALUES (225, 1036, 26);
INSERT INTO papers_nm_subtopic VALUES (226, 1036, 53);
INSERT INTO papers_nm_subtopic VALUES (227, 1036, 54);
INSERT INTO papers_nm_subtopic VALUES (448, 1068, 26);
INSERT INTO papers_nm_subtopic VALUES (449, 1068, 44);
INSERT INTO papers_nm_subtopic VALUES (450, 1068, 53);
INSERT INTO papers_nm_subtopic VALUES (451, 1068, 54);
INSERT INTO papers_nm_subtopic VALUES (324, 1050, 3);
INSERT INTO papers_nm_subtopic VALUES (325, 1050, 26);
INSERT INTO papers_nm_subtopic VALUES (326, 1050, 53);
INSERT INTO papers_nm_subtopic VALUES (327, 1050, 54);
INSERT INTO papers_nm_subtopic VALUES (328, 1050, 55);
INSERT INTO papers_nm_subtopic VALUES (329, 1050, 56);
INSERT INTO papers_nm_subtopic VALUES (330, 1049, 3);
INSERT INTO papers_nm_subtopic VALUES (331, 1049, 18);
INSERT INTO papers_nm_subtopic VALUES (332, 1049, 25);
INSERT INTO papers_nm_subtopic VALUES (333, 1049, 47);
INSERT INTO papers_nm_subtopic VALUES (334, 1049, 53);
INSERT INTO papers_nm_subtopic VALUES (335, 1049, 54);
INSERT INTO papers_nm_subtopic VALUES (247, 1051, 3);
INSERT INTO papers_nm_subtopic VALUES (248, 1051, 13);
INSERT INTO papers_nm_subtopic VALUES (249, 1051, 26);
INSERT INTO papers_nm_subtopic VALUES (250, 1051, 53);
INSERT INTO papers_nm_subtopic VALUES (251, 1051, 54);
INSERT INTO papers_nm_subtopic VALUES (252, 1051, 55);
INSERT INTO papers_nm_subtopic VALUES (253, 998, 26);
INSERT INTO papers_nm_subtopic VALUES (254, 998, 53);
INSERT INTO papers_nm_subtopic VALUES (255, 998, 54);
INSERT INTO papers_nm_subtopic VALUES (343, 1042, 3);
INSERT INTO papers_nm_subtopic VALUES (461, 1018, 3);
INSERT INTO papers_nm_subtopic VALUES (462, 1018, 16);
INSERT INTO papers_nm_subtopic VALUES (463, 1018, 25);
INSERT INTO papers_nm_subtopic VALUES (464, 1018, 42);
INSERT INTO papers_nm_subtopic VALUES (465, 1018, 53);
INSERT INTO papers_nm_subtopic VALUES (466, 1018, 54);
INSERT INTO papers_nm_subtopic VALUES (344, 1042, 26);
INSERT INTO papers_nm_subtopic VALUES (345, 1042, 32);
INSERT INTO papers_nm_subtopic VALUES (346, 1042, 41);
INSERT INTO papers_nm_subtopic VALUES (347, 1042, 42);
INSERT INTO papers_nm_subtopic VALUES (348, 1042, 53);
INSERT INTO papers_nm_subtopic VALUES (349, 1042, 54);
INSERT INTO papers_nm_subtopic VALUES (350, 1033, 3);
INSERT INTO papers_nm_subtopic VALUES (351, 1033, 26);
INSERT INTO papers_nm_subtopic VALUES (352, 1033, 51);
INSERT INTO papers_nm_subtopic VALUES (353, 1033, 53);
INSERT INTO papers_nm_subtopic VALUES (354, 1033, 55);
INSERT INTO papers_nm_subtopic VALUES (355, 1048, 3);
INSERT INTO papers_nm_subtopic VALUES (356, 1048, 13);
INSERT INTO papers_nm_subtopic VALUES (357, 1048, 26);
INSERT INTO papers_nm_subtopic VALUES (358, 1048, 44);
INSERT INTO papers_nm_subtopic VALUES (359, 1048, 52);
INSERT INTO papers_nm_subtopic VALUES (360, 1048, 53);
INSERT INTO papers_nm_subtopic VALUES (361, 1048, 54);
INSERT INTO papers_nm_subtopic VALUES (362, 993, 3);
INSERT INTO papers_nm_subtopic VALUES (363, 993, 13);
INSERT INTO papers_nm_subtopic VALUES (364, 993, 26);
INSERT INTO papers_nm_subtopic VALUES (365, 993, 44);
INSERT INTO papers_nm_subtopic VALUES (366, 993, 47);
INSERT INTO papers_nm_subtopic VALUES (367, 993, 53);
INSERT INTO papers_nm_subtopic VALUES (368, 993, 54);
INSERT INTO papers_nm_subtopic VALUES (369, 1045, 3);
INSERT INTO papers_nm_subtopic VALUES (370, 1045, 8);
INSERT INTO papers_nm_subtopic VALUES (371, 1045, 12);
INSERT INTO papers_nm_subtopic VALUES (372, 1045, 13);
INSERT INTO papers_nm_subtopic VALUES (373, 1045, 17);
INSERT INTO papers_nm_subtopic VALUES (374, 1045, 23);
INSERT INTO papers_nm_subtopic VALUES (375, 1045, 25);
INSERT INTO papers_nm_subtopic VALUES (376, 1045, 47);
INSERT INTO papers_nm_subtopic VALUES (377, 1045, 54);
INSERT INTO papers_nm_subtopic VALUES (378, 1045, 55);
INSERT INTO papers_nm_subtopic VALUES (467, 1018, 55);
INSERT INTO papers_nm_subtopic VALUES (742, 968, 3);
INSERT INTO papers_nm_subtopic VALUES (743, 968, 19);
INSERT INTO papers_nm_subtopic VALUES (481, 995, 3);
INSERT INTO papers_nm_subtopic VALUES (482, 995, 36);
INSERT INTO papers_nm_subtopic VALUES (483, 995, 53);
INSERT INTO papers_nm_subtopic VALUES (484, 995, 54);
INSERT INTO papers_nm_subtopic VALUES (485, 995, 56);
INSERT INTO papers_nm_subtopic VALUES (744, 968, 26);
INSERT INTO papers_nm_subtopic VALUES (745, 968, 44);
INSERT INTO papers_nm_subtopic VALUES (746, 968, 53);
INSERT INTO papers_nm_subtopic VALUES (747, 968, 54);
INSERT INTO papers_nm_subtopic VALUES (541, 1023, 25);
INSERT INTO papers_nm_subtopic VALUES (542, 1023, 30);
INSERT INTO papers_nm_subtopic VALUES (543, 1023, 53);
INSERT INTO papers_nm_subtopic VALUES (544, 1023, 54);
INSERT INTO papers_nm_subtopic VALUES (545, 1023, 55);
INSERT INTO papers_nm_subtopic VALUES (756, 1008, 8);
INSERT INTO papers_nm_subtopic VALUES (757, 1008, 17);
INSERT INTO papers_nm_subtopic VALUES (505, 989, 3);
INSERT INTO papers_nm_subtopic VALUES (506, 989, 22);
INSERT INTO papers_nm_subtopic VALUES (507, 989, 25);
INSERT INTO papers_nm_subtopic VALUES (508, 989, 26);
INSERT INTO papers_nm_subtopic VALUES (509, 989, 44);
INSERT INTO papers_nm_subtopic VALUES (510, 989, 53);
INSERT INTO papers_nm_subtopic VALUES (511, 989, 54);
INSERT INTO papers_nm_subtopic VALUES (758, 1008, 31);
INSERT INTO papers_nm_subtopic VALUES (759, 1008, 53);
INSERT INTO papers_nm_subtopic VALUES (760, 1008, 54);
INSERT INTO papers_nm_subtopic VALUES (761, 1007, 3);
INSERT INTO papers_nm_subtopic VALUES (762, 1007, 26);
INSERT INTO papers_nm_subtopic VALUES (763, 1007, 44);
INSERT INTO papers_nm_subtopic VALUES (562, 991, 3);
INSERT INTO papers_nm_subtopic VALUES (563, 991, 26);
INSERT INTO papers_nm_subtopic VALUES (564, 991, 44);
INSERT INTO papers_nm_subtopic VALUES (521, 997, 9);
INSERT INTO papers_nm_subtopic VALUES (522, 997, 14);
INSERT INTO papers_nm_subtopic VALUES (523, 997, 26);
INSERT INTO papers_nm_subtopic VALUES (524, 997, 32);
INSERT INTO papers_nm_subtopic VALUES (525, 997, 53);
INSERT INTO papers_nm_subtopic VALUES (526, 997, 54);
INSERT INTO papers_nm_subtopic VALUES (527, 997, 55);
INSERT INTO papers_nm_subtopic VALUES (565, 991, 53);
INSERT INTO papers_nm_subtopic VALUES (566, 991, 54);
INSERT INTO papers_nm_subtopic VALUES (567, 1019, 2);
INSERT INTO papers_nm_subtopic VALUES (568, 1019, 6);
INSERT INTO papers_nm_subtopic VALUES (569, 1019, 23);
INSERT INTO papers_nm_subtopic VALUES (570, 1019, 52);
INSERT INTO papers_nm_subtopic VALUES (571, 1019, 54);
INSERT INTO papers_nm_subtopic VALUES (764, 1007, 53);
INSERT INTO papers_nm_subtopic VALUES (765, 1007, 54);
INSERT INTO papers_nm_subtopic VALUES (766, 986, 3);
INSERT INTO papers_nm_subtopic VALUES (767, 986, 26);
INSERT INTO papers_nm_subtopic VALUES (768, 986, 53);
INSERT INTO papers_nm_subtopic VALUES (577, 1030, 3);
INSERT INTO papers_nm_subtopic VALUES (578, 1030, 23);
INSERT INTO papers_nm_subtopic VALUES (579, 1030, 36);
INSERT INTO papers_nm_subtopic VALUES (580, 1030, 52);
INSERT INTO papers_nm_subtopic VALUES (581, 1030, 53);
INSERT INTO papers_nm_subtopic VALUES (582, 1030, 54);
INSERT INTO papers_nm_subtopic VALUES (769, 986, 54);
INSERT INTO papers_nm_subtopic VALUES (776, 1012, 1);
INSERT INTO papers_nm_subtopic VALUES (777, 1012, 2);
INSERT INTO papers_nm_subtopic VALUES (592, 1022, 3);
INSERT INTO papers_nm_subtopic VALUES (593, 1022, 26);
INSERT INTO papers_nm_subtopic VALUES (594, 1022, 32);
INSERT INTO papers_nm_subtopic VALUES (595, 1022, 53);
INSERT INTO papers_nm_subtopic VALUES (596, 1022, 54);
INSERT INTO papers_nm_subtopic VALUES (778, 1012, 36);
INSERT INTO papers_nm_subtopic VALUES (779, 1012, 53);
INSERT INTO papers_nm_subtopic VALUES (780, 1012, 54);
INSERT INTO papers_nm_subtopic VALUES (781, 951, 3);
INSERT INTO papers_nm_subtopic VALUES (601, 996, 3);
INSERT INTO papers_nm_subtopic VALUES (602, 996, 26);
INSERT INTO papers_nm_subtopic VALUES (603, 996, 53);
INSERT INTO papers_nm_subtopic VALUES (604, 996, 54);
INSERT INTO papers_nm_subtopic VALUES (605, 1020, 3);
INSERT INTO papers_nm_subtopic VALUES (606, 1020, 29);
INSERT INTO papers_nm_subtopic VALUES (607, 1020, 53);
INSERT INTO papers_nm_subtopic VALUES (608, 1020, 54);
INSERT INTO papers_nm_subtopic VALUES (782, 951, 26);
INSERT INTO papers_nm_subtopic VALUES (783, 951, 44);
INSERT INTO papers_nm_subtopic VALUES (784, 951, 53);
INSERT INTO papers_nm_subtopic VALUES (785, 951, 54);
INSERT INTO papers_nm_subtopic VALUES (786, 1016, 3);
INSERT INTO papers_nm_subtopic VALUES (787, 1016, 26);
INSERT INTO papers_nm_subtopic VALUES (788, 1016, 36);
INSERT INTO papers_nm_subtopic VALUES (789, 1016, 41);
INSERT INTO papers_nm_subtopic VALUES (790, 1016, 53);
INSERT INTO papers_nm_subtopic VALUES (618, 1028, 3);
INSERT INTO papers_nm_subtopic VALUES (619, 1028, 26);
INSERT INTO papers_nm_subtopic VALUES (620, 1028, 36);
INSERT INTO papers_nm_subtopic VALUES (621, 1028, 53);
INSERT INTO papers_nm_subtopic VALUES (622, 1028, 54);
INSERT INTO papers_nm_subtopic VALUES (623, 1028, 55);
INSERT INTO papers_nm_subtopic VALUES (791, 1016, 54);
INSERT INTO papers_nm_subtopic VALUES (798, 936, 3);
INSERT INTO papers_nm_subtopic VALUES (799, 936, 26);
INSERT INTO papers_nm_subtopic VALUES (633, 952, 3);
INSERT INTO papers_nm_subtopic VALUES (634, 952, 26);
INSERT INTO papers_nm_subtopic VALUES (635, 952, 44);
INSERT INTO papers_nm_subtopic VALUES (636, 952, 53);
INSERT INTO papers_nm_subtopic VALUES (637, 952, 54);
INSERT INTO papers_nm_subtopic VALUES (800, 936, 53);
INSERT INTO papers_nm_subtopic VALUES (801, 936, 54);
INSERT INTO papers_nm_subtopic VALUES (802, 936, 56);
INSERT INTO papers_nm_subtopic VALUES (803, 1010, 3);
INSERT INTO papers_nm_subtopic VALUES (642, 992, 3);
INSERT INTO papers_nm_subtopic VALUES (643, 992, 26);
INSERT INTO papers_nm_subtopic VALUES (644, 992, 36);
INSERT INTO papers_nm_subtopic VALUES (645, 992, 53);
INSERT INTO papers_nm_subtopic VALUES (804, 1010, 26);
INSERT INTO papers_nm_subtopic VALUES (805, 1010, 39);
INSERT INTO papers_nm_subtopic VALUES (806, 1010, 53);
INSERT INTO papers_nm_subtopic VALUES (807, 1010, 54);
INSERT INTO papers_nm_subtopic VALUES (650, 969, 3);
INSERT INTO papers_nm_subtopic VALUES (651, 969, 26);
INSERT INTO papers_nm_subtopic VALUES (652, 969, 41);
INSERT INTO papers_nm_subtopic VALUES (653, 969, 53);
INSERT INTO papers_nm_subtopic VALUES (654, 969, 54);
INSERT INTO papers_nm_subtopic VALUES (808, 1010, 55);
INSERT INTO papers_nm_subtopic VALUES (809, 1010, 56);
INSERT INTO papers_nm_subtopic VALUES (814, 966, 3);
INSERT INTO papers_nm_subtopic VALUES (815, 966, 26);
INSERT INTO papers_nm_subtopic VALUES (816, 966, 53);
INSERT INTO papers_nm_subtopic VALUES (817, 966, 54);
INSERT INTO papers_nm_subtopic VALUES (668, 1024, 3);
INSERT INTO papers_nm_subtopic VALUES (669, 1024, 22);
INSERT INTO papers_nm_subtopic VALUES (670, 1024, 26);
INSERT INTO papers_nm_subtopic VALUES (671, 1024, 41);
INSERT INTO papers_nm_subtopic VALUES (672, 1024, 44);
INSERT INTO papers_nm_subtopic VALUES (673, 1024, 53);
INSERT INTO papers_nm_subtopic VALUES (674, 1024, 54);
INSERT INTO papers_nm_subtopic VALUES (829, 959, 2);
INSERT INTO papers_nm_subtopic VALUES (830, 959, 26);
INSERT INTO papers_nm_subtopic VALUES (831, 959, 51);
INSERT INTO papers_nm_subtopic VALUES (832, 959, 52);
INSERT INTO papers_nm_subtopic VALUES (687, 1027, 4);
INSERT INTO papers_nm_subtopic VALUES (688, 1027, 10);
INSERT INTO papers_nm_subtopic VALUES (689, 1027, 26);
INSERT INTO papers_nm_subtopic VALUES (690, 1027, 40);
INSERT INTO papers_nm_subtopic VALUES (691, 1027, 42);
INSERT INTO papers_nm_subtopic VALUES (692, 1027, 53);
INSERT INTO papers_nm_subtopic VALUES (693, 1027, 54);
INSERT INTO papers_nm_subtopic VALUES (833, 959, 53);
INSERT INTO papers_nm_subtopic VALUES (834, 959, 54);
INSERT INTO papers_nm_subtopic VALUES (701, 1013, 3);
INSERT INTO papers_nm_subtopic VALUES (702, 1013, 44);
INSERT INTO papers_nm_subtopic VALUES (703, 1013, 53);
INSERT INTO papers_nm_subtopic VALUES (704, 1013, 54);
INSERT INTO papers_nm_subtopic VALUES (840, 958, 3);
INSERT INTO papers_nm_subtopic VALUES (841, 958, 26);
INSERT INTO papers_nm_subtopic VALUES (842, 958, 41);
INSERT INTO papers_nm_subtopic VALUES (843, 958, 53);
INSERT INTO papers_nm_subtopic VALUES (844, 958, 54);
INSERT INTO papers_nm_subtopic VALUES (845, 958, 55);
INSERT INTO papers_nm_subtopic VALUES (846, 958, 56);
INSERT INTO papers_nm_subtopic VALUES (847, 965, 3);
INSERT INTO papers_nm_subtopic VALUES (713, 985, 3);
INSERT INTO papers_nm_subtopic VALUES (714, 985, 26);
INSERT INTO papers_nm_subtopic VALUES (715, 985, 53);
INSERT INTO papers_nm_subtopic VALUES (716, 985, 54);
INSERT INTO papers_nm_subtopic VALUES (717, 988, 17);
INSERT INTO papers_nm_subtopic VALUES (718, 988, 21);
INSERT INTO papers_nm_subtopic VALUES (719, 988, 44);
INSERT INTO papers_nm_subtopic VALUES (720, 988, 52);
INSERT INTO papers_nm_subtopic VALUES (721, 988, 53);
INSERT INTO papers_nm_subtopic VALUES (722, 988, 54);
INSERT INTO papers_nm_subtopic VALUES (723, 1017, 3);
INSERT INTO papers_nm_subtopic VALUES (724, 1017, 4);
INSERT INTO papers_nm_subtopic VALUES (725, 1017, 19);
INSERT INTO papers_nm_subtopic VALUES (726, 1017, 36);
INSERT INTO papers_nm_subtopic VALUES (727, 1017, 53);
INSERT INTO papers_nm_subtopic VALUES (728, 1017, 54);
INSERT INTO papers_nm_subtopic VALUES (729, 1017, 55);
INSERT INTO papers_nm_subtopic VALUES (848, 965, 13);
INSERT INTO papers_nm_subtopic VALUES (849, 965, 26);
INSERT INTO papers_nm_subtopic VALUES (850, 965, 53);
INSERT INTO papers_nm_subtopic VALUES (851, 965, 54);
INSERT INTO papers_nm_subtopic VALUES (852, 967, 3);
INSERT INTO papers_nm_subtopic VALUES (853, 967, 26);
INSERT INTO papers_nm_subtopic VALUES (736, 987, 3);
INSERT INTO papers_nm_subtopic VALUES (737, 987, 26);
INSERT INTO papers_nm_subtopic VALUES (738, 987, 41);
INSERT INTO papers_nm_subtopic VALUES (739, 987, 51);
INSERT INTO papers_nm_subtopic VALUES (740, 987, 53);
INSERT INTO papers_nm_subtopic VALUES (741, 987, 54);
INSERT INTO papers_nm_subtopic VALUES (854, 967, 44);
INSERT INTO papers_nm_subtopic VALUES (855, 967, 53);
INSERT INTO papers_nm_subtopic VALUES (856, 967, 54);
INSERT INTO papers_nm_subtopic VALUES (857, 1009, 3);
INSERT INTO papers_nm_subtopic VALUES (858, 1009, 41);
INSERT INTO papers_nm_subtopic VALUES (859, 1009, 53);
INSERT INTO papers_nm_subtopic VALUES (860, 1009, 54);
INSERT INTO papers_nm_subtopic VALUES (861, 1014, 3);
INSERT INTO papers_nm_subtopic VALUES (862, 1014, 22);
INSERT INTO papers_nm_subtopic VALUES (863, 1014, 23);
INSERT INTO papers_nm_subtopic VALUES (864, 1014, 24);
INSERT INTO papers_nm_subtopic VALUES (865, 1014, 25);
INSERT INTO papers_nm_subtopic VALUES (866, 1014, 26);
INSERT INTO papers_nm_subtopic VALUES (867, 1014, 27);
INSERT INTO papers_nm_subtopic VALUES (868, 1014, 28);
INSERT INTO papers_nm_subtopic VALUES (869, 1014, 36);
INSERT INTO papers_nm_subtopic VALUES (870, 1014, 53);
INSERT INTO papers_nm_subtopic VALUES (871, 1014, 54);
INSERT INTO papers_nm_subtopic VALUES (872, 953, 3);
INSERT INTO papers_nm_subtopic VALUES (873, 953, 26);
INSERT INTO papers_nm_subtopic VALUES (874, 953, 53);
INSERT INTO papers_nm_subtopic VALUES (1571, 876, 3);
INSERT INTO papers_nm_subtopic VALUES (880, 944, 2);
INSERT INTO papers_nm_subtopic VALUES (881, 944, 26);
INSERT INTO papers_nm_subtopic VALUES (882, 944, 44);
INSERT INTO papers_nm_subtopic VALUES (883, 944, 54);
INSERT INTO papers_nm_subtopic VALUES (884, 944, 55);
INSERT INTO papers_nm_subtopic VALUES (1572, 876, 4);
INSERT INTO papers_nm_subtopic VALUES (1122, 954, 2);
INSERT INTO papers_nm_subtopic VALUES (1123, 954, 31);
INSERT INTO papers_nm_subtopic VALUES (1124, 954, 33);
INSERT INTO papers_nm_subtopic VALUES (889, 981, 3);
INSERT INTO papers_nm_subtopic VALUES (890, 981, 26);
INSERT INTO papers_nm_subtopic VALUES (891, 981, 53);
INSERT INTO papers_nm_subtopic VALUES (892, 981, 54);
INSERT INTO papers_nm_subtopic VALUES (893, 1004, 9);
INSERT INTO papers_nm_subtopic VALUES (894, 1004, 54);
INSERT INTO papers_nm_subtopic VALUES (1125, 954, 53);
INSERT INTO papers_nm_subtopic VALUES (1126, 954, 54);
INSERT INTO papers_nm_subtopic VALUES (1127, 954, 55);
INSERT INTO papers_nm_subtopic VALUES (1573, 876, 20);
INSERT INTO papers_nm_subtopic VALUES (1574, 876, 26);
INSERT INTO papers_nm_subtopic VALUES (903, 961, 2);
INSERT INTO papers_nm_subtopic VALUES (904, 961, 22);
INSERT INTO papers_nm_subtopic VALUES (905, 961, 41);
INSERT INTO papers_nm_subtopic VALUES (906, 961, 44);
INSERT INTO papers_nm_subtopic VALUES (907, 961, 53);
INSERT INTO papers_nm_subtopic VALUES (908, 961, 54);
INSERT INTO papers_nm_subtopic VALUES (913, 949, 3);
INSERT INTO papers_nm_subtopic VALUES (914, 949, 26);
INSERT INTO papers_nm_subtopic VALUES (915, 949, 54);
INSERT INTO papers_nm_subtopic VALUES (916, 949, 56);
INSERT INTO papers_nm_subtopic VALUES (1139, 975, 3);
INSERT INTO papers_nm_subtopic VALUES (920, 1005, 3);
INSERT INTO papers_nm_subtopic VALUES (921, 1005, 44);
INSERT INTO papers_nm_subtopic VALUES (922, 1005, 54);
INSERT INTO papers_nm_subtopic VALUES (1140, 975, 26);
INSERT INTO papers_nm_subtopic VALUES (1141, 975, 36);
INSERT INTO papers_nm_subtopic VALUES (1142, 975, 49);
INSERT INTO papers_nm_subtopic VALUES (1143, 975, 53);
INSERT INTO papers_nm_subtopic VALUES (1144, 975, 54);
INSERT INTO papers_nm_subtopic VALUES (1145, 975, 55);
INSERT INTO papers_nm_subtopic VALUES (934, 1006, 3);
INSERT INTO papers_nm_subtopic VALUES (935, 1006, 23);
INSERT INTO papers_nm_subtopic VALUES (936, 1006, 32);
INSERT INTO papers_nm_subtopic VALUES (937, 1006, 36);
INSERT INTO papers_nm_subtopic VALUES (938, 1006, 44);
INSERT INTO papers_nm_subtopic VALUES (939, 1006, 53);
INSERT INTO papers_nm_subtopic VALUES (940, 1006, 54);
INSERT INTO papers_nm_subtopic VALUES (941, 946, 3);
INSERT INTO papers_nm_subtopic VALUES (942, 946, 26);
INSERT INTO papers_nm_subtopic VALUES (943, 946, 53);
INSERT INTO papers_nm_subtopic VALUES (944, 946, 54);
INSERT INTO papers_nm_subtopic VALUES (945, 946, 55);
INSERT INTO papers_nm_subtopic VALUES (1155, 1001, 3);
INSERT INTO papers_nm_subtopic VALUES (1156, 1001, 26);
INSERT INTO papers_nm_subtopic VALUES (1157, 1001, 44);
INSERT INTO papers_nm_subtopic VALUES (1158, 1001, 53);
INSERT INTO papers_nm_subtopic VALUES (1159, 1001, 54);
INSERT INTO papers_nm_subtopic VALUES (1160, 940, 3);
INSERT INTO papers_nm_subtopic VALUES (956, 937, 3);
INSERT INTO papers_nm_subtopic VALUES (957, 937, 18);
INSERT INTO papers_nm_subtopic VALUES (958, 937, 25);
INSERT INTO papers_nm_subtopic VALUES (959, 937, 26);
INSERT INTO papers_nm_subtopic VALUES (960, 937, 44);
INSERT INTO papers_nm_subtopic VALUES (961, 937, 53);
INSERT INTO papers_nm_subtopic VALUES (962, 937, 54);
INSERT INTO papers_nm_subtopic VALUES (1161, 940, 26);
INSERT INTO papers_nm_subtopic VALUES (1162, 940, 53);
INSERT INTO papers_nm_subtopic VALUES (1163, 940, 54);
INSERT INTO papers_nm_subtopic VALUES (972, 962, 3);
INSERT INTO papers_nm_subtopic VALUES (973, 962, 26);
INSERT INTO papers_nm_subtopic VALUES (974, 962, 52);
INSERT INTO papers_nm_subtopic VALUES (975, 962, 53);
INSERT INTO papers_nm_subtopic VALUES (976, 962, 54);
INSERT INTO papers_nm_subtopic VALUES (977, 1000, 3);
INSERT INTO papers_nm_subtopic VALUES (978, 1000, 26);
INSERT INTO papers_nm_subtopic VALUES (979, 1000, 53);
INSERT INTO papers_nm_subtopic VALUES (980, 1000, 54);
INSERT INTO papers_nm_subtopic VALUES (981, 970, 3);
INSERT INTO papers_nm_subtopic VALUES (982, 970, 26);
INSERT INTO papers_nm_subtopic VALUES (983, 970, 53);
INSERT INTO papers_nm_subtopic VALUES (984, 970, 54);
INSERT INTO papers_nm_subtopic VALUES (985, 963, 3);
INSERT INTO papers_nm_subtopic VALUES (986, 963, 53);
INSERT INTO papers_nm_subtopic VALUES (987, 963, 54);
INSERT INTO papers_nm_subtopic VALUES (1170, 941, 3);
INSERT INTO papers_nm_subtopic VALUES (1171, 941, 26);
INSERT INTO papers_nm_subtopic VALUES (1172, 941, 53);
INSERT INTO papers_nm_subtopic VALUES (1173, 941, 54);
INSERT INTO papers_nm_subtopic VALUES (1174, 941, 56);
INSERT INTO papers_nm_subtopic VALUES (1177, 974, 3);
INSERT INTO papers_nm_subtopic VALUES (1178, 974, 26);
INSERT INTO papers_nm_subtopic VALUES (1179, 974, 53);
INSERT INTO papers_nm_subtopic VALUES (1180, 974, 54);
INSERT INTO papers_nm_subtopic VALUES (1181, 974, 55);
INSERT INTO papers_nm_subtopic VALUES (1001, 955, 3);
INSERT INTO papers_nm_subtopic VALUES (1002, 955, 26);
INSERT INTO papers_nm_subtopic VALUES (1003, 955, 53);
INSERT INTO papers_nm_subtopic VALUES (1004, 955, 54);
INSERT INTO papers_nm_subtopic VALUES (1186, 943, 3);
INSERT INTO papers_nm_subtopic VALUES (1187, 943, 53);
INSERT INTO papers_nm_subtopic VALUES (1188, 943, 54);
INSERT INTO papers_nm_subtopic VALUES (1189, 943, 56);
INSERT INTO papers_nm_subtopic VALUES (1014, 982, 3);
INSERT INTO papers_nm_subtopic VALUES (1015, 982, 53);
INSERT INTO papers_nm_subtopic VALUES (1016, 982, 54);
INSERT INTO papers_nm_subtopic VALUES (1017, 982, 55);
INSERT INTO papers_nm_subtopic VALUES (1018, 982, 56);
INSERT INTO papers_nm_subtopic VALUES (1192, 827, 3);
INSERT INTO papers_nm_subtopic VALUES (1193, 827, 26);
INSERT INTO papers_nm_subtopic VALUES (1194, 827, 53);
INSERT INTO papers_nm_subtopic VALUES (1195, 827, 54);
INSERT INTO papers_nm_subtopic VALUES (1196, 827, 55);
INSERT INTO papers_nm_subtopic VALUES (1202, 813, 3);
INSERT INTO papers_nm_subtopic VALUES (1203, 813, 26);
INSERT INTO papers_nm_subtopic VALUES (1204, 813, 53);
INSERT INTO papers_nm_subtopic VALUES (1205, 813, 54);
INSERT INTO papers_nm_subtopic VALUES (1206, 813, 55);
INSERT INTO papers_nm_subtopic VALUES (1207, 935, 3);
INSERT INTO papers_nm_subtopic VALUES (1208, 935, 22);
INSERT INTO papers_nm_subtopic VALUES (1036, 984, 2);
INSERT INTO papers_nm_subtopic VALUES (1037, 984, 26);
INSERT INTO papers_nm_subtopic VALUES (1038, 984, 52);
INSERT INTO papers_nm_subtopic VALUES (1039, 984, 53);
INSERT INTO papers_nm_subtopic VALUES (1040, 984, 54);
INSERT INTO papers_nm_subtopic VALUES (1041, 1002, 3);
INSERT INTO papers_nm_subtopic VALUES (1042, 1002, 36);
INSERT INTO papers_nm_subtopic VALUES (1043, 1002, 53);
INSERT INTO papers_nm_subtopic VALUES (1044, 1002, 54);
INSERT INTO papers_nm_subtopic VALUES (1209, 935, 26);
INSERT INTO papers_nm_subtopic VALUES (1210, 935, 52);
INSERT INTO papers_nm_subtopic VALUES (1211, 783, 3);
INSERT INTO papers_nm_subtopic VALUES (1212, 783, 26);
INSERT INTO papers_nm_subtopic VALUES (1213, 783, 49);
INSERT INTO papers_nm_subtopic VALUES (1214, 783, 54);
INSERT INTO papers_nm_subtopic VALUES (1051, 948, 3);
INSERT INTO papers_nm_subtopic VALUES (1052, 948, 21);
INSERT INTO papers_nm_subtopic VALUES (1053, 948, 49);
INSERT INTO papers_nm_subtopic VALUES (1054, 948, 53);
INSERT INTO papers_nm_subtopic VALUES (1055, 948, 54);
INSERT INTO papers_nm_subtopic VALUES (1056, 948, 55);
INSERT INTO papers_nm_subtopic VALUES (1057, 948, 56);
INSERT INTO papers_nm_subtopic VALUES (1058, 971, 3);
INSERT INTO papers_nm_subtopic VALUES (1059, 971, 26);
INSERT INTO papers_nm_subtopic VALUES (1060, 971, 53);
INSERT INTO papers_nm_subtopic VALUES (1061, 971, 54);
INSERT INTO papers_nm_subtopic VALUES (1062, 1003, 3);
INSERT INTO papers_nm_subtopic VALUES (1063, 1003, 53);
INSERT INTO papers_nm_subtopic VALUES (1064, 1003, 54);
INSERT INTO papers_nm_subtopic VALUES (1065, 972, 3);
INSERT INTO papers_nm_subtopic VALUES (1066, 972, 53);
INSERT INTO papers_nm_subtopic VALUES (1067, 972, 54);
INSERT INTO papers_nm_subtopic VALUES (1215, 895, 3);
INSERT INTO papers_nm_subtopic VALUES (1216, 895, 26);
INSERT INTO papers_nm_subtopic VALUES (1217, 895, 53);
INSERT INTO papers_nm_subtopic VALUES (1218, 895, 54);
INSERT INTO papers_nm_subtopic VALUES (1074, 950, 3);
INSERT INTO papers_nm_subtopic VALUES (1075, 950, 26);
INSERT INTO papers_nm_subtopic VALUES (1076, 950, 44);
INSERT INTO papers_nm_subtopic VALUES (1077, 950, 49);
INSERT INTO papers_nm_subtopic VALUES (1078, 950, 53);
INSERT INTO papers_nm_subtopic VALUES (1079, 950, 54);
INSERT INTO papers_nm_subtopic VALUES (1080, 973, 3);
INSERT INTO papers_nm_subtopic VALUES (1081, 973, 26);
INSERT INTO papers_nm_subtopic VALUES (1082, 973, 49);
INSERT INTO papers_nm_subtopic VALUES (1083, 973, 53);
INSERT INTO papers_nm_subtopic VALUES (1084, 973, 54);
INSERT INTO papers_nm_subtopic VALUES (1085, 973, 55);
INSERT INTO papers_nm_subtopic VALUES (1086, 939, 3);
INSERT INTO papers_nm_subtopic VALUES (1087, 939, 26);
INSERT INTO papers_nm_subtopic VALUES (1088, 939, 49);
INSERT INTO papers_nm_subtopic VALUES (1089, 939, 51);
INSERT INTO papers_nm_subtopic VALUES (1090, 939, 53);
INSERT INTO papers_nm_subtopic VALUES (1091, 939, 54);
INSERT INTO papers_nm_subtopic VALUES (1092, 956, 3);
INSERT INTO papers_nm_subtopic VALUES (1093, 956, 26);
INSERT INTO papers_nm_subtopic VALUES (1094, 956, 53);
INSERT INTO papers_nm_subtopic VALUES (1095, 956, 54);
INSERT INTO papers_nm_subtopic VALUES (1096, 956, 55);
INSERT INTO papers_nm_subtopic VALUES (1223, 860, 3);
INSERT INTO papers_nm_subtopic VALUES (1224, 860, 26);
INSERT INTO papers_nm_subtopic VALUES (1101, 942, 3);
INSERT INTO papers_nm_subtopic VALUES (1102, 942, 26);
INSERT INTO papers_nm_subtopic VALUES (1103, 942, 34);
INSERT INTO papers_nm_subtopic VALUES (1104, 942, 53);
INSERT INTO papers_nm_subtopic VALUES (1105, 942, 54);
INSERT INTO papers_nm_subtopic VALUES (1106, 942, 55);
INSERT INTO papers_nm_subtopic VALUES (1111, 976, 3);
INSERT INTO papers_nm_subtopic VALUES (1112, 976, 41);
INSERT INTO papers_nm_subtopic VALUES (1113, 976, 53);
INSERT INTO papers_nm_subtopic VALUES (1114, 976, 54);
INSERT INTO papers_nm_subtopic VALUES (1115, 976, 55);
INSERT INTO papers_nm_subtopic VALUES (1225, 860, 44);
INSERT INTO papers_nm_subtopic VALUES (1226, 860, 53);
INSERT INTO papers_nm_subtopic VALUES (1227, 860, 54);
INSERT INTO papers_nm_subtopic VALUES (1560, 915, 3);
INSERT INTO papers_nm_subtopic VALUES (1234, 930, 3);
INSERT INTO papers_nm_subtopic VALUES (1235, 930, 26);
INSERT INTO papers_nm_subtopic VALUES (1236, 930, 44);
INSERT INTO papers_nm_subtopic VALUES (1237, 930, 53);
INSERT INTO papers_nm_subtopic VALUES (1238, 930, 54);
INSERT INTO papers_nm_subtopic VALUES (1239, 930, 55);
INSERT INTO papers_nm_subtopic VALUES (1561, 915, 52);
INSERT INTO papers_nm_subtopic VALUES (1562, 915, 53);
INSERT INTO papers_nm_subtopic VALUES (1563, 915, 54);
INSERT INTO papers_nm_subtopic VALUES (1575, 876, 53);
INSERT INTO papers_nm_subtopic VALUES (1576, 876, 54);
INSERT INTO papers_nm_subtopic VALUES (1245, 889, 3);
INSERT INTO papers_nm_subtopic VALUES (1246, 889, 26);
INSERT INTO papers_nm_subtopic VALUES (1247, 889, 36);
INSERT INTO papers_nm_subtopic VALUES (1248, 889, 52);
INSERT INTO papers_nm_subtopic VALUES (1249, 889, 54);
INSERT INTO papers_nm_subtopic VALUES (1250, 907, 3);
INSERT INTO papers_nm_subtopic VALUES (1251, 907, 26);
INSERT INTO papers_nm_subtopic VALUES (1252, 907, 52);
INSERT INTO papers_nm_subtopic VALUES (1253, 907, 54);
INSERT INTO papers_nm_subtopic VALUES (1254, 903, 3);
INSERT INTO papers_nm_subtopic VALUES (1255, 903, 54);
INSERT INTO papers_nm_subtopic VALUES (1256, 903, 55);
INSERT INTO papers_nm_subtopic VALUES (1577, 876, 55);
INSERT INTO papers_nm_subtopic VALUES (1261, 870, 3);
INSERT INTO papers_nm_subtopic VALUES (1262, 870, 53);
INSERT INTO papers_nm_subtopic VALUES (1263, 870, 54);
INSERT INTO papers_nm_subtopic VALUES (1264, 870, 55);
INSERT INTO papers_nm_subtopic VALUES (1265, 861, 3);
INSERT INTO papers_nm_subtopic VALUES (1266, 861, 26);
INSERT INTO papers_nm_subtopic VALUES (1267, 861, 53);
INSERT INTO papers_nm_subtopic VALUES (1268, 861, 54);
INSERT INTO papers_nm_subtopic VALUES (1269, 861, 55);
INSERT INTO papers_nm_subtopic VALUES (1915, 803, 3);
INSERT INTO papers_nm_subtopic VALUES (1916, 803, 26);
INSERT INTO papers_nm_subtopic VALUES (1593, 917, 3);
INSERT INTO papers_nm_subtopic VALUES (1594, 917, 26);
INSERT INTO papers_nm_subtopic VALUES (1595, 917, 49);
INSERT INTO papers_nm_subtopic VALUES (1596, 917, 53);
INSERT INTO papers_nm_subtopic VALUES (1276, 814, 3);
INSERT INTO papers_nm_subtopic VALUES (1277, 814, 26);
INSERT INTO papers_nm_subtopic VALUES (1278, 814, 53);
INSERT INTO papers_nm_subtopic VALUES (1279, 814, 54);
INSERT INTO papers_nm_subtopic VALUES (1280, 814, 55);
INSERT INTO papers_nm_subtopic VALUES (1281, 875, 3);
INSERT INTO papers_nm_subtopic VALUES (1282, 875, 26);
INSERT INTO papers_nm_subtopic VALUES (1283, 875, 53);
INSERT INTO papers_nm_subtopic VALUES (1597, 917, 54);
INSERT INTO papers_nm_subtopic VALUES (1917, 803, 53);
INSERT INTO papers_nm_subtopic VALUES (1918, 803, 54);
INSERT INTO papers_nm_subtopic VALUES (1919, 803, 56);
INSERT INTO papers_nm_subtopic VALUES (1288, 904, 3);
INSERT INTO papers_nm_subtopic VALUES (1289, 904, 26);
INSERT INTO papers_nm_subtopic VALUES (1290, 904, 53);
INSERT INTO papers_nm_subtopic VALUES (1291, 904, 54);
INSERT INTO papers_nm_subtopic VALUES (1292, 929, 3);
INSERT INTO papers_nm_subtopic VALUES (1293, 929, 26);
INSERT INTO papers_nm_subtopic VALUES (1294, 929, 54);
INSERT INTO papers_nm_subtopic VALUES (1299, 887, 3);
INSERT INTO papers_nm_subtopic VALUES (1300, 887, 36);
INSERT INTO papers_nm_subtopic VALUES (1301, 887, 53);
INSERT INTO papers_nm_subtopic VALUES (1302, 887, 54);
INSERT INTO papers_nm_subtopic VALUES (1303, 887, 55);
INSERT INTO papers_nm_subtopic VALUES (1307, 906, 3);
INSERT INTO papers_nm_subtopic VALUES (1308, 906, 26);
INSERT INTO papers_nm_subtopic VALUES (1309, 906, 53);
INSERT INTO papers_nm_subtopic VALUES (1310, 906, 54);
INSERT INTO papers_nm_subtopic VALUES (1311, 849, 3);
INSERT INTO papers_nm_subtopic VALUES (1312, 849, 26);
INSERT INTO papers_nm_subtopic VALUES (1313, 849, 53);
INSERT INTO papers_nm_subtopic VALUES (1314, 849, 54);
INSERT INTO papers_nm_subtopic VALUES (1315, 918, 3);
INSERT INTO papers_nm_subtopic VALUES (1316, 918, 26);
INSERT INTO papers_nm_subtopic VALUES (1317, 918, 53);
INSERT INTO papers_nm_subtopic VALUES (1318, 918, 54);
INSERT INTO papers_nm_subtopic VALUES (1319, 934, 3);
INSERT INTO papers_nm_subtopic VALUES (1320, 934, 26);
INSERT INTO papers_nm_subtopic VALUES (1321, 934, 36);
INSERT INTO papers_nm_subtopic VALUES (1322, 934, 53);
INSERT INTO papers_nm_subtopic VALUES (1323, 934, 54);
INSERT INTO papers_nm_subtopic VALUES (1324, 919, 3);
INSERT INTO papers_nm_subtopic VALUES (1325, 919, 36);
INSERT INTO papers_nm_subtopic VALUES (1326, 919, 53);
INSERT INTO papers_nm_subtopic VALUES (1327, 919, 54);
INSERT INTO papers_nm_subtopic VALUES (1331, 921, 3);
INSERT INTO papers_nm_subtopic VALUES (1332, 921, 36);
INSERT INTO papers_nm_subtopic VALUES (1333, 921, 53);
INSERT INTO papers_nm_subtopic VALUES (1334, 921, 54);
INSERT INTO papers_nm_subtopic VALUES (1335, 885, 3);
INSERT INTO papers_nm_subtopic VALUES (1336, 885, 26);
INSERT INTO papers_nm_subtopic VALUES (1337, 885, 36);
INSERT INTO papers_nm_subtopic VALUES (1338, 885, 53);
INSERT INTO papers_nm_subtopic VALUES (1339, 885, 54);
INSERT INTO papers_nm_subtopic VALUES (1340, 881, 3);
INSERT INTO papers_nm_subtopic VALUES (1341, 881, 26);
INSERT INTO papers_nm_subtopic VALUES (1342, 881, 53);
INSERT INTO papers_nm_subtopic VALUES (1343, 881, 54);
INSERT INTO papers_nm_subtopic VALUES (1348, 809, 3);
INSERT INTO papers_nm_subtopic VALUES (1349, 809, 26);
INSERT INTO papers_nm_subtopic VALUES (1350, 809, 53);
INSERT INTO papers_nm_subtopic VALUES (1351, 809, 54);
INSERT INTO papers_nm_subtopic VALUES (1649, 873, 3);
INSERT INTO papers_nm_subtopic VALUES (1650, 873, 26);
INSERT INTO papers_nm_subtopic VALUES (1651, 873, 44);
INSERT INTO papers_nm_subtopic VALUES (1361, 788, 3);
INSERT INTO papers_nm_subtopic VALUES (1362, 788, 26);
INSERT INTO papers_nm_subtopic VALUES (1363, 788, 41);
INSERT INTO papers_nm_subtopic VALUES (1364, 788, 53);
INSERT INTO papers_nm_subtopic VALUES (1365, 788, 54);
INSERT INTO papers_nm_subtopic VALUES (1366, 901, 3);
INSERT INTO papers_nm_subtopic VALUES (1367, 901, 26);
INSERT INTO papers_nm_subtopic VALUES (1368, 901, 53);
INSERT INTO papers_nm_subtopic VALUES (1369, 901, 54);
INSERT INTO papers_nm_subtopic VALUES (1652, 873, 53);
INSERT INTO papers_nm_subtopic VALUES (1653, 873, 54);
INSERT INTO papers_nm_subtopic VALUES (1658, 778, 3);
INSERT INTO papers_nm_subtopic VALUES (1659, 778, 36);
INSERT INTO papers_nm_subtopic VALUES (1660, 778, 53);
INSERT INTO papers_nm_subtopic VALUES (1375, 786, 3);
INSERT INTO papers_nm_subtopic VALUES (1376, 786, 26);
INSERT INTO papers_nm_subtopic VALUES (1377, 786, 53);
INSERT INTO papers_nm_subtopic VALUES (1378, 786, 54);
INSERT INTO papers_nm_subtopic VALUES (1379, 786, 55);
INSERT INTO papers_nm_subtopic VALUES (1661, 778, 54);
INSERT INTO papers_nm_subtopic VALUES (1389, 880, 2);
INSERT INTO papers_nm_subtopic VALUES (1390, 880, 23);
INSERT INTO papers_nm_subtopic VALUES (1391, 880, 25);
INSERT INTO papers_nm_subtopic VALUES (1392, 880, 53);
INSERT INTO papers_nm_subtopic VALUES (1393, 880, 54);
INSERT INTO papers_nm_subtopic VALUES (1399, 933, 3);
INSERT INTO papers_nm_subtopic VALUES (1400, 933, 26);
INSERT INTO papers_nm_subtopic VALUES (1401, 933, 53);
INSERT INTO papers_nm_subtopic VALUES (1402, 933, 54);
INSERT INTO papers_nm_subtopic VALUES (1700, 878, 3);
INSERT INTO papers_nm_subtopic VALUES (1701, 878, 26);
INSERT INTO papers_nm_subtopic VALUES (1408, 839, 3);
INSERT INTO papers_nm_subtopic VALUES (1409, 839, 24);
INSERT INTO papers_nm_subtopic VALUES (1410, 839, 25);
INSERT INTO papers_nm_subtopic VALUES (1411, 839, 41);
INSERT INTO papers_nm_subtopic VALUES (1412, 839, 53);
INSERT INTO papers_nm_subtopic VALUES (1413, 839, 54);
INSERT INTO papers_nm_subtopic VALUES (1414, 839, 55);
INSERT INTO papers_nm_subtopic VALUES (1702, 878, 53);
INSERT INTO papers_nm_subtopic VALUES (1703, 878, 54);
INSERT INTO papers_nm_subtopic VALUES (1417, 927, 3);
INSERT INTO papers_nm_subtopic VALUES (1418, 927, 26);
INSERT INTO papers_nm_subtopic VALUES (1419, 927, 41);
INSERT INTO papers_nm_subtopic VALUES (1420, 927, 53);
INSERT INTO papers_nm_subtopic VALUES (1421, 927, 54);
INSERT INTO papers_nm_subtopic VALUES (1422, 927, 55);
INSERT INTO papers_nm_subtopic VALUES (1708, 916, 3);
INSERT INTO papers_nm_subtopic VALUES (1709, 916, 26);
INSERT INTO papers_nm_subtopic VALUES (1710, 916, 53);
INSERT INTO papers_nm_subtopic VALUES (1711, 916, 54);
INSERT INTO papers_nm_subtopic VALUES (1716, 883, 3);
INSERT INTO papers_nm_subtopic VALUES (1717, 883, 26);
INSERT INTO papers_nm_subtopic VALUES (1718, 883, 53);
INSERT INTO papers_nm_subtopic VALUES (1430, 894, 3);
INSERT INTO papers_nm_subtopic VALUES (1431, 894, 26);
INSERT INTO papers_nm_subtopic VALUES (1432, 894, 44);
INSERT INTO papers_nm_subtopic VALUES (1433, 894, 49);
INSERT INTO papers_nm_subtopic VALUES (1434, 894, 53);
INSERT INTO papers_nm_subtopic VALUES (1435, 894, 54);
INSERT INTO papers_nm_subtopic VALUES (1719, 883, 54);
INSERT INTO papers_nm_subtopic VALUES (1440, 893, 3);
INSERT INTO papers_nm_subtopic VALUES (1441, 893, 36);
INSERT INTO papers_nm_subtopic VALUES (1442, 893, 53);
INSERT INTO papers_nm_subtopic VALUES (1443, 893, 54);
INSERT INTO papers_nm_subtopic VALUES (1452, 879, 10);
INSERT INTO papers_nm_subtopic VALUES (1453, 879, 16);
INSERT INTO papers_nm_subtopic VALUES (1454, 879, 22);
INSERT INTO papers_nm_subtopic VALUES (1455, 879, 23);
INSERT INTO papers_nm_subtopic VALUES (1456, 879, 25);
INSERT INTO papers_nm_subtopic VALUES (1457, 879, 53);
INSERT INTO papers_nm_subtopic VALUES (1458, 879, 54);
INSERT INTO papers_nm_subtopic VALUES (1459, 840, 3);
INSERT INTO papers_nm_subtopic VALUES (1460, 840, 26);
INSERT INTO papers_nm_subtopic VALUES (1461, 840, 32);
INSERT INTO papers_nm_subtopic VALUES (1462, 840, 53);
INSERT INTO papers_nm_subtopic VALUES (1463, 886, 3);
INSERT INTO papers_nm_subtopic VALUES (1464, 886, 25);
INSERT INTO papers_nm_subtopic VALUES (1465, 886, 26);
INSERT INTO papers_nm_subtopic VALUES (1466, 886, 53);
INSERT INTO papers_nm_subtopic VALUES (1467, 886, 54);
INSERT INTO papers_nm_subtopic VALUES (1468, 886, 55);
INSERT INTO papers_nm_subtopic VALUES (1477, 920, 2);
INSERT INTO papers_nm_subtopic VALUES (1478, 920, 26);
INSERT INTO papers_nm_subtopic VALUES (1479, 920, 53);
INSERT INTO papers_nm_subtopic VALUES (1480, 920, 54);
INSERT INTO papers_nm_subtopic VALUES (1553, 865, 3);
INSERT INTO papers_nm_subtopic VALUES (1517, 1040, 3);
INSERT INTO papers_nm_subtopic VALUES (1518, 1040, 13);
INSERT INTO papers_nm_subtopic VALUES (1519, 1040, 26);
INSERT INTO papers_nm_subtopic VALUES (1554, 865, 26);
INSERT INTO papers_nm_subtopic VALUES (1555, 865, 53);
INSERT INTO papers_nm_subtopic VALUES (1556, 865, 54);
INSERT INTO papers_nm_subtopic VALUES (1899, 812, 3);
INSERT INTO papers_nm_subtopic VALUES (1900, 812, 26);
INSERT INTO papers_nm_subtopic VALUES (1901, 812, 36);
INSERT INTO papers_nm_subtopic VALUES (1902, 812, 53);
INSERT INTO papers_nm_subtopic VALUES (1903, 812, 54);
INSERT INTO papers_nm_subtopic VALUES (1528, 914, 3);
INSERT INTO papers_nm_subtopic VALUES (1529, 914, 26);
INSERT INTO papers_nm_subtopic VALUES (1530, 914, 53);
INSERT INTO papers_nm_subtopic VALUES (1531, 914, 54);
INSERT INTO papers_nm_subtopic VALUES (1532, 914, 55);
INSERT INTO papers_nm_subtopic VALUES (1904, 812, 55);
INSERT INTO papers_nm_subtopic VALUES (1910, 793, 3);
INSERT INTO papers_nm_subtopic VALUES (1911, 793, 26);
INSERT INTO papers_nm_subtopic VALUES (1912, 793, 44);
INSERT INTO papers_nm_subtopic VALUES (1913, 793, 53);
INSERT INTO papers_nm_subtopic VALUES (1914, 793, 54);
INSERT INTO papers_nm_subtopic VALUES (1920, 890, 3);
INSERT INTO papers_nm_subtopic VALUES (1540, 804, 3);
INSERT INTO papers_nm_subtopic VALUES (1541, 804, 26);
INSERT INTO papers_nm_subtopic VALUES (1542, 804, 53);
INSERT INTO papers_nm_subtopic VALUES (1543, 804, 54);
INSERT INTO papers_nm_subtopic VALUES (1921, 890, 26);
INSERT INTO papers_nm_subtopic VALUES (1922, 890, 53);
INSERT INTO papers_nm_subtopic VALUES (2925, 748, 53);
INSERT INTO papers_nm_subtopic VALUES (2926, 748, 54);
INSERT INTO papers_nm_subtopic VALUES (1613, 821, 2);
INSERT INTO papers_nm_subtopic VALUES (1614, 821, 26);
INSERT INTO papers_nm_subtopic VALUES (1615, 821, 52);
INSERT INTO papers_nm_subtopic VALUES (1616, 821, 53);
INSERT INTO papers_nm_subtopic VALUES (1617, 821, 54);
INSERT INTO papers_nm_subtopic VALUES (1618, 821, 55);
INSERT INTO papers_nm_subtopic VALUES (1934, 776, 3);
INSERT INTO papers_nm_subtopic VALUES (1935, 776, 25);
INSERT INTO papers_nm_subtopic VALUES (1936, 776, 41);
INSERT INTO papers_nm_subtopic VALUES (1937, 776, 53);
INSERT INTO papers_nm_subtopic VALUES (1938, 776, 54);
INSERT INTO papers_nm_subtopic VALUES (1939, 776, 55);
INSERT INTO papers_nm_subtopic VALUES (1641, 868, 3);
INSERT INTO papers_nm_subtopic VALUES (1642, 868, 4);
INSERT INTO papers_nm_subtopic VALUES (1643, 868, 13);
INSERT INTO papers_nm_subtopic VALUES (1644, 868, 14);
INSERT INTO papers_nm_subtopic VALUES (1645, 868, 22);
INSERT INTO papers_nm_subtopic VALUES (1646, 868, 26);
INSERT INTO papers_nm_subtopic VALUES (1647, 868, 53);
INSERT INTO papers_nm_subtopic VALUES (1648, 868, 54);
INSERT INTO papers_nm_subtopic VALUES (1654, 877, 3);
INSERT INTO papers_nm_subtopic VALUES (1655, 877, 26);
INSERT INTO papers_nm_subtopic VALUES (1656, 877, 53);
INSERT INTO papers_nm_subtopic VALUES (1657, 877, 54);
INSERT INTO papers_nm_subtopic VALUES (1948, 836, 3);
INSERT INTO papers_nm_subtopic VALUES (1679, 832, 3);
INSERT INTO papers_nm_subtopic VALUES (1680, 832, 26);
INSERT INTO papers_nm_subtopic VALUES (1681, 832, 32);
INSERT INTO papers_nm_subtopic VALUES (1682, 832, 44);
INSERT INTO papers_nm_subtopic VALUES (1683, 832, 53);
INSERT INTO papers_nm_subtopic VALUES (1684, 832, 54);
INSERT INTO papers_nm_subtopic VALUES (1689, 844, 3);
INSERT INTO papers_nm_subtopic VALUES (1690, 844, 4);
INSERT INTO papers_nm_subtopic VALUES (1691, 844, 26);
INSERT INTO papers_nm_subtopic VALUES (1692, 844, 45);
INSERT INTO papers_nm_subtopic VALUES (1949, 836, 25);
INSERT INTO papers_nm_subtopic VALUES (1950, 836, 26);
INSERT INTO papers_nm_subtopic VALUES (1951, 836, 53);
INSERT INTO papers_nm_subtopic VALUES (1952, 836, 54);
INSERT INTO papers_nm_subtopic VALUES (1953, 836, 55);
INSERT INTO papers_nm_subtopic VALUES (1963, 838, 3);
INSERT INTO papers_nm_subtopic VALUES (1964, 838, 26);
INSERT INTO papers_nm_subtopic VALUES (1965, 838, 44);
INSERT INTO papers_nm_subtopic VALUES (1966, 838, 53);
INSERT INTO papers_nm_subtopic VALUES (1967, 838, 54);
INSERT INTO papers_nm_subtopic VALUES (1742, 797, 3);
INSERT INTO papers_nm_subtopic VALUES (1743, 797, 4);
INSERT INTO papers_nm_subtopic VALUES (1744, 797, 26);
INSERT INTO papers_nm_subtopic VALUES (1745, 797, 41);
INSERT INTO papers_nm_subtopic VALUES (1746, 797, 53);
INSERT INTO papers_nm_subtopic VALUES (1747, 797, 54);
INSERT INTO papers_nm_subtopic VALUES (1748, 797, 55);
INSERT INTO papers_nm_subtopic VALUES (1972, 773, 3);
INSERT INTO papers_nm_subtopic VALUES (1973, 773, 26);
INSERT INTO papers_nm_subtopic VALUES (1974, 773, 53);
INSERT INTO papers_nm_subtopic VALUES (1975, 773, 54);
INSERT INTO papers_nm_subtopic VALUES (1985, 912, 3);
INSERT INTO papers_nm_subtopic VALUES (1986, 912, 26);
INSERT INTO papers_nm_subtopic VALUES (1987, 912, 53);
INSERT INTO papers_nm_subtopic VALUES (1988, 912, 54);
INSERT INTO papers_nm_subtopic VALUES (1989, 912, 55);
INSERT INTO papers_nm_subtopic VALUES (1995, 751, 3);
INSERT INTO papers_nm_subtopic VALUES (1773, 785, 3);
INSERT INTO papers_nm_subtopic VALUES (1774, 785, 26);
INSERT INTO papers_nm_subtopic VALUES (1775, 785, 53);
INSERT INTO papers_nm_subtopic VALUES (1776, 785, 54);
INSERT INTO papers_nm_subtopic VALUES (1777, 785, 55);
INSERT INTO papers_nm_subtopic VALUES (1778, 785, 56);
INSERT INTO papers_nm_subtopic VALUES (1996, 751, 26);
INSERT INTO papers_nm_subtopic VALUES (1997, 751, 41);
INSERT INTO papers_nm_subtopic VALUES (1998, 751, 53);
INSERT INTO papers_nm_subtopic VALUES (1999, 751, 54);
INSERT INTO papers_nm_subtopic VALUES (1783, 842, 3);
INSERT INTO papers_nm_subtopic VALUES (1784, 842, 26);
INSERT INTO papers_nm_subtopic VALUES (1785, 842, 53);
INSERT INTO papers_nm_subtopic VALUES (1786, 842, 54);
INSERT INTO papers_nm_subtopic VALUES (2000, 818, 3);
INSERT INTO papers_nm_subtopic VALUES (2001, 818, 26);
INSERT INTO papers_nm_subtopic VALUES (2002, 818, 41);
INSERT INTO papers_nm_subtopic VALUES (2003, 818, 53);
INSERT INTO papers_nm_subtopic VALUES (2004, 818, 54);
INSERT INTO papers_nm_subtopic VALUES (2005, 898, 3);
INSERT INTO papers_nm_subtopic VALUES (2006, 898, 29);
INSERT INTO papers_nm_subtopic VALUES (2007, 898, 53);
INSERT INTO papers_nm_subtopic VALUES (2008, 898, 54);
INSERT INTO papers_nm_subtopic VALUES (1798, 866, 3);
INSERT INTO papers_nm_subtopic VALUES (1799, 866, 13);
INSERT INTO papers_nm_subtopic VALUES (1800, 866, 26);
INSERT INTO papers_nm_subtopic VALUES (1801, 866, 53);
INSERT INTO papers_nm_subtopic VALUES (1802, 866, 54);
INSERT INTO papers_nm_subtopic VALUES (1803, 866, 55);
INSERT INTO papers_nm_subtopic VALUES (1809, 845, 3);
INSERT INTO papers_nm_subtopic VALUES (1810, 845, 13);
INSERT INTO papers_nm_subtopic VALUES (1811, 845, 26);
INSERT INTO papers_nm_subtopic VALUES (1812, 845, 53);
INSERT INTO papers_nm_subtopic VALUES (1813, 845, 54);
INSERT INTO papers_nm_subtopic VALUES (2016, 766, 3);
INSERT INTO papers_nm_subtopic VALUES (2017, 766, 26);
INSERT INTO papers_nm_subtopic VALUES (2018, 766, 41);
INSERT INTO papers_nm_subtopic VALUES (2019, 766, 53);
INSERT INTO papers_nm_subtopic VALUES (2020, 766, 54);
INSERT INTO papers_nm_subtopic VALUES (2030, 847, 3);
INSERT INTO papers_nm_subtopic VALUES (2031, 847, 26);
INSERT INTO papers_nm_subtopic VALUES (2032, 847, 53);
INSERT INTO papers_nm_subtopic VALUES (2033, 847, 54);
INSERT INTO papers_nm_subtopic VALUES (2034, 847, 55);
INSERT INTO papers_nm_subtopic VALUES (2041, 777, 3);
INSERT INTO papers_nm_subtopic VALUES (2042, 777, 22);
INSERT INTO papers_nm_subtopic VALUES (2043, 777, 25);
INSERT INTO papers_nm_subtopic VALUES (2044, 777, 53);
INSERT INTO papers_nm_subtopic VALUES (2045, 777, 54);
INSERT INTO papers_nm_subtopic VALUES (2046, 777, 55);
INSERT INTO papers_nm_subtopic VALUES (1845, 924, 3);
INSERT INTO papers_nm_subtopic VALUES (1846, 924, 22);
INSERT INTO papers_nm_subtopic VALUES (1847, 924, 26);
INSERT INTO papers_nm_subtopic VALUES (1848, 924, 53);
INSERT INTO papers_nm_subtopic VALUES (1849, 924, 54);
INSERT INTO papers_nm_subtopic VALUES (1850, 924, 55);
INSERT INTO papers_nm_subtopic VALUES (1851, 924, 56);
INSERT INTO papers_nm_subtopic VALUES (1854, 775, 3);
INSERT INTO papers_nm_subtopic VALUES (1855, 775, 26);
INSERT INTO papers_nm_subtopic VALUES (1856, 775, 53);
INSERT INTO papers_nm_subtopic VALUES (2056, 858, 3);
INSERT INTO papers_nm_subtopic VALUES (2057, 858, 26);
INSERT INTO papers_nm_subtopic VALUES (2058, 858, 49);
INSERT INTO papers_nm_subtopic VALUES (2059, 858, 54);
INSERT INTO papers_nm_subtopic VALUES (2060, 858, 55);
INSERT INTO papers_nm_subtopic VALUES (2066, 1066, 3);
INSERT INTO papers_nm_subtopic VALUES (2067, 1066, 26);
INSERT INTO papers_nm_subtopic VALUES (2068, 1066, 53);
INSERT INTO papers_nm_subtopic VALUES (2069, 1066, 54);
INSERT INTO papers_nm_subtopic VALUES (2070, 1066, 55);
INSERT INTO papers_nm_subtopic VALUES (1882, 807, 3);
INSERT INTO papers_nm_subtopic VALUES (1883, 807, 26);
INSERT INTO papers_nm_subtopic VALUES (1884, 807, 41);
INSERT INTO papers_nm_subtopic VALUES (1885, 807, 44);
INSERT INTO papers_nm_subtopic VALUES (1886, 807, 53);
INSERT INTO papers_nm_subtopic VALUES (1887, 807, 54);
INSERT INTO papers_nm_subtopic VALUES (1888, 807, 55);
INSERT INTO papers_nm_subtopic VALUES (1889, 807, 56);
INSERT INTO papers_nm_subtopic VALUES (2075, 820, 3);
INSERT INTO papers_nm_subtopic VALUES (2076, 820, 26);
INSERT INTO papers_nm_subtopic VALUES (2077, 820, 44);
INSERT INTO papers_nm_subtopic VALUES (2078, 820, 53);
INSERT INTO papers_nm_subtopic VALUES (2079, 820, 54);
INSERT INTO papers_nm_subtopic VALUES (2084, 837, 3);
INSERT INTO papers_nm_subtopic VALUES (2085, 837, 26);
INSERT INTO papers_nm_subtopic VALUES (2086, 837, 53);
INSERT INTO papers_nm_subtopic VALUES (2087, 837, 54);
INSERT INTO papers_nm_subtopic VALUES (2092, 899, 3);
INSERT INTO papers_nm_subtopic VALUES (2093, 899, 26);
INSERT INTO papers_nm_subtopic VALUES (2094, 899, 53);
INSERT INTO papers_nm_subtopic VALUES (2095, 899, 54);
INSERT INTO papers_nm_subtopic VALUES (2096, 913, 3);
INSERT INTO papers_nm_subtopic VALUES (2097, 913, 26);
INSERT INTO papers_nm_subtopic VALUES (2098, 913, 54);
INSERT INTO papers_nm_subtopic VALUES (2099, 913, 55);
INSERT INTO papers_nm_subtopic VALUES (2104, 831, 3);
INSERT INTO papers_nm_subtopic VALUES (2105, 831, 26);
INSERT INTO papers_nm_subtopic VALUES (2106, 831, 53);
INSERT INTO papers_nm_subtopic VALUES (2107, 831, 54);
INSERT INTO papers_nm_subtopic VALUES (2361, 746, 3);
INSERT INTO papers_nm_subtopic VALUES (2362, 746, 26);
INSERT INTO papers_nm_subtopic VALUES (2363, 746, 53);
INSERT INTO papers_nm_subtopic VALUES (2364, 746, 54);
INSERT INTO papers_nm_subtopic VALUES (2365, 746, 55);
INSERT INTO papers_nm_subtopic VALUES (2118, 891, 3);
INSERT INTO papers_nm_subtopic VALUES (2119, 891, 26);
INSERT INTO papers_nm_subtopic VALUES (2120, 891, 44);
INSERT INTO papers_nm_subtopic VALUES (2121, 891, 53);
INSERT INTO papers_nm_subtopic VALUES (2122, 891, 54);
INSERT INTO papers_nm_subtopic VALUES (2376, 760, 3);
INSERT INTO papers_nm_subtopic VALUES (2377, 760, 26);
INSERT INTO papers_nm_subtopic VALUES (2378, 760, 39);
INSERT INTO papers_nm_subtopic VALUES (2379, 760, 53);
INSERT INTO papers_nm_subtopic VALUES (2380, 760, 54);
INSERT INTO papers_nm_subtopic VALUES (2956, 834, 3);
INSERT INTO papers_nm_subtopic VALUES (2957, 834, 26);
INSERT INTO papers_nm_subtopic VALUES (2958, 834, 53);
INSERT INTO papers_nm_subtopic VALUES (2959, 834, 54);
INSERT INTO papers_nm_subtopic VALUES (2386, 795, 3);
INSERT INTO papers_nm_subtopic VALUES (2387, 795, 26);
INSERT INTO papers_nm_subtopic VALUES (2388, 795, 44);
INSERT INTO papers_nm_subtopic VALUES (2137, 825, 3);
INSERT INTO papers_nm_subtopic VALUES (2138, 825, 13);
INSERT INTO papers_nm_subtopic VALUES (2139, 825, 26);
INSERT INTO papers_nm_subtopic VALUES (2140, 825, 53);
INSERT INTO papers_nm_subtopic VALUES (2141, 825, 54);
INSERT INTO papers_nm_subtopic VALUES (2389, 795, 53);
INSERT INTO papers_nm_subtopic VALUES (2390, 795, 54);
INSERT INTO papers_nm_subtopic VALUES (2147, 856, 3);
INSERT INTO papers_nm_subtopic VALUES (2148, 856, 26);
INSERT INTO papers_nm_subtopic VALUES (2149, 856, 36);
INSERT INTO papers_nm_subtopic VALUES (2150, 856, 53);
INSERT INTO papers_nm_subtopic VALUES (2151, 856, 54);
INSERT INTO papers_nm_subtopic VALUES (2397, 835, 3);
INSERT INTO papers_nm_subtopic VALUES (2398, 835, 26);
INSERT INTO papers_nm_subtopic VALUES (2157, 758, 3);
INSERT INTO papers_nm_subtopic VALUES (2158, 758, 26);
INSERT INTO papers_nm_subtopic VALUES (2159, 758, 52);
INSERT INTO papers_nm_subtopic VALUES (2160, 758, 53);
INSERT INTO papers_nm_subtopic VALUES (2161, 758, 54);
INSERT INTO papers_nm_subtopic VALUES (2399, 835, 36);
INSERT INTO papers_nm_subtopic VALUES (2400, 835, 53);
INSERT INTO papers_nm_subtopic VALUES (2401, 835, 54);
INSERT INTO papers_nm_subtopic VALUES (2402, 835, 55);
INSERT INTO papers_nm_subtopic VALUES (2166, 864, 3);
INSERT INTO papers_nm_subtopic VALUES (2167, 864, 26);
INSERT INTO papers_nm_subtopic VALUES (2168, 864, 53);
INSERT INTO papers_nm_subtopic VALUES (2169, 864, 54);
INSERT INTO papers_nm_subtopic VALUES (2406, 896, 3);
INSERT INTO papers_nm_subtopic VALUES (2407, 896, 26);
INSERT INTO papers_nm_subtopic VALUES (2408, 896, 53);
INSERT INTO papers_nm_subtopic VALUES (2409, 896, 54);
INSERT INTO papers_nm_subtopic VALUES (2179, 816, 3);
INSERT INTO papers_nm_subtopic VALUES (2180, 816, 13);
INSERT INTO papers_nm_subtopic VALUES (2181, 816, 26);
INSERT INTO papers_nm_subtopic VALUES (2182, 816, 53);
INSERT INTO papers_nm_subtopic VALUES (2188, 900, 2);
INSERT INTO papers_nm_subtopic VALUES (2189, 900, 26);
INSERT INTO papers_nm_subtopic VALUES (2190, 900, 53);
INSERT INTO papers_nm_subtopic VALUES (2191, 900, 54);
INSERT INTO papers_nm_subtopic VALUES (2421, 781, 3);
INSERT INTO papers_nm_subtopic VALUES (2422, 781, 22);
INSERT INTO papers_nm_subtopic VALUES (2198, 872, 3);
INSERT INTO papers_nm_subtopic VALUES (2199, 872, 10);
INSERT INTO papers_nm_subtopic VALUES (2200, 872, 20);
INSERT INTO papers_nm_subtopic VALUES (2201, 872, 26);
INSERT INTO papers_nm_subtopic VALUES (2202, 872, 53);
INSERT INTO papers_nm_subtopic VALUES (2203, 872, 54);
INSERT INTO papers_nm_subtopic VALUES (2423, 781, 53);
INSERT INTO papers_nm_subtopic VALUES (2424, 781, 54);
INSERT INTO papers_nm_subtopic VALUES (2425, 781, 55);
INSERT INTO papers_nm_subtopic VALUES (2426, 781, 56);
INSERT INTO papers_nm_subtopic VALUES (2431, 752, 3);
INSERT INTO papers_nm_subtopic VALUES (2432, 752, 26);
INSERT INTO papers_nm_subtopic VALUES (2214, 824, 3);
INSERT INTO papers_nm_subtopic VALUES (2215, 824, 26);
INSERT INTO papers_nm_subtopic VALUES (2216, 824, 44);
INSERT INTO papers_nm_subtopic VALUES (2217, 824, 53);
INSERT INTO papers_nm_subtopic VALUES (2218, 824, 54);
INSERT INTO papers_nm_subtopic VALUES (2219, 824, 55);
INSERT INTO papers_nm_subtopic VALUES (2433, 752, 53);
INSERT INTO papers_nm_subtopic VALUES (2434, 752, 54);
INSERT INTO papers_nm_subtopic VALUES (2228, 819, 3);
INSERT INTO papers_nm_subtopic VALUES (2229, 819, 26);
INSERT INTO papers_nm_subtopic VALUES (2230, 819, 36);
INSERT INTO papers_nm_subtopic VALUES (2231, 819, 44);
INSERT INTO papers_nm_subtopic VALUES (2232, 819, 53);
INSERT INTO papers_nm_subtopic VALUES (2233, 819, 54);
INSERT INTO papers_nm_subtopic VALUES (2441, 853, 3);
INSERT INTO papers_nm_subtopic VALUES (2442, 853, 25);
INSERT INTO papers_nm_subtopic VALUES (2443, 853, 26);
INSERT INTO papers_nm_subtopic VALUES (2444, 853, 53);
INSERT INTO papers_nm_subtopic VALUES (2238, 808, 3);
INSERT INTO papers_nm_subtopic VALUES (2239, 808, 36);
INSERT INTO papers_nm_subtopic VALUES (2240, 808, 53);
INSERT INTO papers_nm_subtopic VALUES (2241, 808, 54);
INSERT INTO papers_nm_subtopic VALUES (2445, 853, 54);
INSERT INTO papers_nm_subtopic VALUES (2446, 853, 55);
INSERT INTO papers_nm_subtopic VALUES (2447, 871, 3);
INSERT INTO papers_nm_subtopic VALUES (2448, 871, 25);
INSERT INTO papers_nm_subtopic VALUES (2449, 871, 36);
INSERT INTO papers_nm_subtopic VALUES (2247, 789, 3);
INSERT INTO papers_nm_subtopic VALUES (2248, 789, 26);
INSERT INTO papers_nm_subtopic VALUES (2249, 789, 51);
INSERT INTO papers_nm_subtopic VALUES (2250, 789, 53);
INSERT INTO papers_nm_subtopic VALUES (2251, 789, 55);
INSERT INTO papers_nm_subtopic VALUES (2450, 871, 52);
INSERT INTO papers_nm_subtopic VALUES (2451, 871, 54);
INSERT INTO papers_nm_subtopic VALUES (2456, 750, 3);
INSERT INTO papers_nm_subtopic VALUES (2259, 791, 3);
INSERT INTO papers_nm_subtopic VALUES (2260, 791, 26);
INSERT INTO papers_nm_subtopic VALUES (2261, 791, 44);
INSERT INTO papers_nm_subtopic VALUES (2262, 791, 53);
INSERT INTO papers_nm_subtopic VALUES (2457, 750, 26);
INSERT INTO papers_nm_subtopic VALUES (2458, 750, 53);
INSERT INTO papers_nm_subtopic VALUES (2459, 750, 54);
INSERT INTO papers_nm_subtopic VALUES (2460, 754, 3);
INSERT INTO papers_nm_subtopic VALUES (2461, 754, 26);
INSERT INTO papers_nm_subtopic VALUES (2462, 754, 53);
INSERT INTO papers_nm_subtopic VALUES (2463, 754, 54);
INSERT INTO papers_nm_subtopic VALUES (2464, 754, 55);
INSERT INTO papers_nm_subtopic VALUES (2465, 823, 3);
INSERT INTO papers_nm_subtopic VALUES (2466, 823, 26);
INSERT INTO papers_nm_subtopic VALUES (2273, 765, 3);
INSERT INTO papers_nm_subtopic VALUES (2274, 765, 26);
INSERT INTO papers_nm_subtopic VALUES (2275, 765, 44);
INSERT INTO papers_nm_subtopic VALUES (2276, 765, 53);
INSERT INTO papers_nm_subtopic VALUES (2277, 765, 54);
INSERT INTO papers_nm_subtopic VALUES (2467, 823, 53);
INSERT INTO papers_nm_subtopic VALUES (2473, 923, 3);
INSERT INTO papers_nm_subtopic VALUES (2474, 923, 26);
INSERT INTO papers_nm_subtopic VALUES (2475, 923, 53);
INSERT INTO papers_nm_subtopic VALUES (2476, 923, 54);
INSERT INTO papers_nm_subtopic VALUES (2477, 923, 55);
INSERT INTO papers_nm_subtopic VALUES (2292, 763, 3);
INSERT INTO papers_nm_subtopic VALUES (2293, 763, 26);
INSERT INTO papers_nm_subtopic VALUES (2294, 763, 51);
INSERT INTO papers_nm_subtopic VALUES (2295, 763, 53);
INSERT INTO papers_nm_subtopic VALUES (2296, 763, 54);
INSERT INTO papers_nm_subtopic VALUES (2297, 763, 55);
INSERT INTO papers_nm_subtopic VALUES (2481, 854, 3);
INSERT INTO papers_nm_subtopic VALUES (2482, 854, 26);
INSERT INTO papers_nm_subtopic VALUES (2483, 854, 44);
INSERT INTO papers_nm_subtopic VALUES (2303, 753, 3);
INSERT INTO papers_nm_subtopic VALUES (2304, 753, 26);
INSERT INTO papers_nm_subtopic VALUES (2305, 753, 53);
INSERT INTO papers_nm_subtopic VALUES (2306, 753, 54);
INSERT INTO papers_nm_subtopic VALUES (2307, 753, 55);
INSERT INTO papers_nm_subtopic VALUES (2315, 801, 3);
INSERT INTO papers_nm_subtopic VALUES (2316, 801, 26);
INSERT INTO papers_nm_subtopic VALUES (2317, 801, 44);
INSERT INTO papers_nm_subtopic VALUES (2318, 801, 53);
INSERT INTO papers_nm_subtopic VALUES (2319, 801, 54);
INSERT INTO papers_nm_subtopic VALUES (2320, 801, 56);
INSERT INTO papers_nm_subtopic VALUES (2498, 787, 3);
INSERT INTO papers_nm_subtopic VALUES (2499, 787, 26);
INSERT INTO papers_nm_subtopic VALUES (2500, 787, 44);
INSERT INTO papers_nm_subtopic VALUES (2329, 841, 3);
INSERT INTO papers_nm_subtopic VALUES (2330, 841, 26);
INSERT INTO papers_nm_subtopic VALUES (2331, 841, 44);
INSERT INTO papers_nm_subtopic VALUES (2332, 841, 53);
INSERT INTO papers_nm_subtopic VALUES (2333, 841, 54);
INSERT INTO papers_nm_subtopic VALUES (2501, 787, 53);
INSERT INTO papers_nm_subtopic VALUES (2502, 787, 54);
INSERT INTO papers_nm_subtopic VALUES (2342, 792, 3);
INSERT INTO papers_nm_subtopic VALUES (2343, 792, 26);
INSERT INTO papers_nm_subtopic VALUES (2344, 792, 53);
INSERT INTO papers_nm_subtopic VALUES (2345, 792, 54);
INSERT INTO papers_nm_subtopic VALUES (2509, 794, 3);
INSERT INTO papers_nm_subtopic VALUES (2510, 794, 26);
INSERT INTO papers_nm_subtopic VALUES (2511, 794, 44);
INSERT INTO papers_nm_subtopic VALUES (2512, 794, 53);
INSERT INTO papers_nm_subtopic VALUES (2513, 794, 54);
INSERT INTO papers_nm_subtopic VALUES (2351, 774, 3);
INSERT INTO papers_nm_subtopic VALUES (2352, 774, 26);
INSERT INTO papers_nm_subtopic VALUES (2353, 774, 53);
INSERT INTO papers_nm_subtopic VALUES (2354, 774, 54);
INSERT INTO papers_nm_subtopic VALUES (2355, 774, 55);
INSERT INTO papers_nm_subtopic VALUES (2514, 794, 55);
INSERT INTO papers_nm_subtopic VALUES (2529, 772, 3);
INSERT INTO papers_nm_subtopic VALUES (2530, 772, 23);
INSERT INTO papers_nm_subtopic VALUES (2531, 772, 26);
INSERT INTO papers_nm_subtopic VALUES (2532, 772, 53);
INSERT INTO papers_nm_subtopic VALUES (2533, 772, 54);
INSERT INTO papers_nm_subtopic VALUES (2537, 897, 3);
INSERT INTO papers_nm_subtopic VALUES (2538, 897, 53);
INSERT INTO papers_nm_subtopic VALUES (2539, 897, 54);
INSERT INTO papers_nm_subtopic VALUES (2546, 855, 3);
INSERT INTO papers_nm_subtopic VALUES (2547, 855, 26);
INSERT INTO papers_nm_subtopic VALUES (2548, 855, 32);
INSERT INTO papers_nm_subtopic VALUES (2549, 855, 36);
INSERT INTO papers_nm_subtopic VALUES (2550, 855, 53);
INSERT INTO papers_nm_subtopic VALUES (2551, 855, 54);
INSERT INTO papers_nm_subtopic VALUES (2932, 829, 3);
INSERT INTO papers_nm_subtopic VALUES (2933, 829, 13);
INSERT INTO papers_nm_subtopic VALUES (2934, 829, 26);
INSERT INTO papers_nm_subtopic VALUES (2935, 829, 53);
INSERT INTO papers_nm_subtopic VALUES (2936, 829, 54);
INSERT INTO papers_nm_subtopic VALUES (2557, 782, 3);
INSERT INTO papers_nm_subtopic VALUES (2558, 782, 26);
INSERT INTO papers_nm_subtopic VALUES (2559, 782, 53);
INSERT INTO papers_nm_subtopic VALUES (2560, 782, 54);
INSERT INTO papers_nm_subtopic VALUES (2561, 782, 55);
INSERT INTO papers_nm_subtopic VALUES (2937, 829, 55);
INSERT INTO papers_nm_subtopic VALUES (2948, 749, 3);
INSERT INTO papers_nm_subtopic VALUES (2949, 749, 26);
INSERT INTO papers_nm_subtopic VALUES (2565, 779, 3);
INSERT INTO papers_nm_subtopic VALUES (2566, 779, 23);
INSERT INTO papers_nm_subtopic VALUES (2567, 779, 36);
INSERT INTO papers_nm_subtopic VALUES (2568, 779, 53);
INSERT INTO papers_nm_subtopic VALUES (2569, 779, 54);
INSERT INTO papers_nm_subtopic VALUES (2950, 749, 53);
INSERT INTO papers_nm_subtopic VALUES (2951, 749, 54);
INSERT INTO papers_nm_subtopic VALUES (2960, 908, 3);
INSERT INTO papers_nm_subtopic VALUES (2961, 908, 4);
INSERT INTO papers_nm_subtopic VALUES (2962, 908, 25);
INSERT INTO papers_nm_subtopic VALUES (2963, 908, 53);
INSERT INTO papers_nm_subtopic VALUES (2964, 908, 54);
INSERT INTO papers_nm_subtopic VALUES (2578, 755, 3);
INSERT INTO papers_nm_subtopic VALUES (2579, 755, 26);
INSERT INTO papers_nm_subtopic VALUES (2580, 755, 53);
INSERT INTO papers_nm_subtopic VALUES (2581, 755, 54);
INSERT INTO papers_nm_subtopic VALUES (2582, 755, 55);
INSERT INTO papers_nm_subtopic VALUES (2594, 806, 3);
INSERT INTO papers_nm_subtopic VALUES (2595, 806, 13);
INSERT INTO papers_nm_subtopic VALUES (2596, 806, 26);
INSERT INTO papers_nm_subtopic VALUES (2597, 806, 53);
INSERT INTO papers_nm_subtopic VALUES (2598, 806, 54);
INSERT INTO papers_nm_subtopic VALUES (2599, 806, 55);
INSERT INTO papers_nm_subtopic VALUES (2605, 762, 3);
INSERT INTO papers_nm_subtopic VALUES (2606, 762, 26);
INSERT INTO papers_nm_subtopic VALUES (2607, 762, 44);
INSERT INTO papers_nm_subtopic VALUES (2608, 762, 53);
INSERT INTO papers_nm_subtopic VALUES (2609, 762, 54);
INSERT INTO papers_nm_subtopic VALUES (2610, 769, 3);
INSERT INTO papers_nm_subtopic VALUES (2611, 769, 26);
INSERT INTO papers_nm_subtopic VALUES (2612, 769, 51);
INSERT INTO papers_nm_subtopic VALUES (2613, 769, 53);
INSERT INTO papers_nm_subtopic VALUES (2614, 769, 54);
INSERT INTO papers_nm_subtopic VALUES (2622, 770, 3);
INSERT INTO papers_nm_subtopic VALUES (2623, 770, 26);
INSERT INTO papers_nm_subtopic VALUES (2624, 770, 53);
INSERT INTO papers_nm_subtopic VALUES (2625, 770, 54);
INSERT INTO papers_nm_subtopic VALUES (2626, 770, 55);
INSERT INTO papers_nm_subtopic VALUES (2627, 770, 56);
INSERT INTO papers_nm_subtopic VALUES (2628, 817, 3);
INSERT INTO papers_nm_subtopic VALUES (2629, 817, 26);
INSERT INTO papers_nm_subtopic VALUES (2630, 817, 53);
INSERT INTO papers_nm_subtopic VALUES (2631, 817, 54);
INSERT INTO papers_nm_subtopic VALUES (2632, 817, 55);
INSERT INTO papers_nm_subtopic VALUES (2639, 759, 3);
INSERT INTO papers_nm_subtopic VALUES (2640, 759, 26);
INSERT INTO papers_nm_subtopic VALUES (2641, 759, 36);
INSERT INTO papers_nm_subtopic VALUES (2642, 759, 53);
INSERT INTO papers_nm_subtopic VALUES (2643, 759, 54);
INSERT INTO papers_nm_subtopic VALUES (2644, 759, 56);
INSERT INTO papers_nm_subtopic VALUES (2653, 811, 3);
INSERT INTO papers_nm_subtopic VALUES (2654, 811, 36);
INSERT INTO papers_nm_subtopic VALUES (2655, 811, 53);
INSERT INTO papers_nm_subtopic VALUES (2656, 811, 54);
INSERT INTO papers_nm_subtopic VALUES (2660, 742, 3);
INSERT INTO papers_nm_subtopic VALUES (2661, 742, 26);
INSERT INTO papers_nm_subtopic VALUES (2662, 742, 44);
INSERT INTO papers_nm_subtopic VALUES (2663, 742, 53);
INSERT INTO papers_nm_subtopic VALUES (2664, 742, 54);
INSERT INTO papers_nm_subtopic VALUES (2675, 738, 3);
INSERT INTO papers_nm_subtopic VALUES (2676, 738, 26);
INSERT INTO papers_nm_subtopic VALUES (2677, 738, 44);
INSERT INTO papers_nm_subtopic VALUES (2678, 738, 53);
INSERT INTO papers_nm_subtopic VALUES (2679, 738, 54);
INSERT INTO papers_nm_subtopic VALUES (3085, 733, 3);
INSERT INTO papers_nm_subtopic VALUES (2685, 863, 3);
INSERT INTO papers_nm_subtopic VALUES (2686, 863, 26);
INSERT INTO papers_nm_subtopic VALUES (2687, 863, 53);
INSERT INTO papers_nm_subtopic VALUES (2688, 863, 54);
INSERT INTO papers_nm_subtopic VALUES (2689, 863, 55);
INSERT INTO papers_nm_subtopic VALUES (3086, 733, 26);
INSERT INTO papers_nm_subtopic VALUES (3087, 733, 53);
INSERT INTO papers_nm_subtopic VALUES (3088, 733, 54);
INSERT INTO papers_nm_subtopic VALUES (3093, 729, 53);
INSERT INTO papers_nm_subtopic VALUES (3094, 729, 54);
INSERT INTO papers_nm_subtopic VALUES (3101, 734, 2);
INSERT INTO papers_nm_subtopic VALUES (3102, 734, 3);
INSERT INTO papers_nm_subtopic VALUES (3103, 734, 36);
INSERT INTO papers_nm_subtopic VALUES (3104, 734, 52);
INSERT INTO papers_nm_subtopic VALUES (3105, 734, 53);
INSERT INTO papers_nm_subtopic VALUES (2700, 737, 3);
INSERT INTO papers_nm_subtopic VALUES (2701, 737, 26);
INSERT INTO papers_nm_subtopic VALUES (2702, 737, 53);
INSERT INTO papers_nm_subtopic VALUES (2703, 737, 54);
INSERT INTO papers_nm_subtopic VALUES (2704, 737, 55);
INSERT INTO papers_nm_subtopic VALUES (3106, 734, 54);
INSERT INTO papers_nm_subtopic VALUES (3110, 732, 3);
INSERT INTO papers_nm_subtopic VALUES (3111, 732, 53);
INSERT INTO papers_nm_subtopic VALUES (3112, 732, 54);
INSERT INTO papers_nm_subtopic VALUES (3115, 725, 3);
INSERT INTO papers_nm_subtopic VALUES (3116, 725, 26);
INSERT INTO papers_nm_subtopic VALUES (3117, 725, 49);
INSERT INTO papers_nm_subtopic VALUES (3118, 725, 53);
INSERT INTO papers_nm_subtopic VALUES (3119, 725, 54);
INSERT INTO papers_nm_subtopic VALUES (3123, 724, 53);
INSERT INTO papers_nm_subtopic VALUES (2715, 747, 3);
INSERT INTO papers_nm_subtopic VALUES (2716, 747, 26);
INSERT INTO papers_nm_subtopic VALUES (2717, 747, 53);
INSERT INTO papers_nm_subtopic VALUES (2718, 747, 54);
INSERT INTO papers_nm_subtopic VALUES (2719, 747, 55);
INSERT INTO papers_nm_subtopic VALUES (3124, 724, 54);
INSERT INTO papers_nm_subtopic VALUES (3125, 724, 55);
INSERT INTO papers_nm_subtopic VALUES (3131, 726, 3);
INSERT INTO papers_nm_subtopic VALUES (3132, 726, 41);
INSERT INTO papers_nm_subtopic VALUES (3133, 726, 53);
INSERT INTO papers_nm_subtopic VALUES (3134, 726, 54);
INSERT INTO papers_nm_subtopic VALUES (3135, 726, 55);
INSERT INTO papers_nm_subtopic VALUES (3141, 722, 3);
INSERT INTO papers_nm_subtopic VALUES (3142, 722, 23);
INSERT INTO papers_nm_subtopic VALUES (3143, 722, 28);
INSERT INTO papers_nm_subtopic VALUES (3144, 722, 53);
INSERT INTO papers_nm_subtopic VALUES (3145, 722, 54);
INSERT INTO papers_nm_subtopic VALUES (2734, 741, 3);
INSERT INTO papers_nm_subtopic VALUES (2735, 741, 26);
INSERT INTO papers_nm_subtopic VALUES (2736, 741, 44);
INSERT INTO papers_nm_subtopic VALUES (2737, 741, 53);
INSERT INTO papers_nm_subtopic VALUES (2738, 741, 54);
INSERT INTO papers_nm_subtopic VALUES (2739, 767, 3);
INSERT INTO papers_nm_subtopic VALUES (2740, 767, 26);
INSERT INTO papers_nm_subtopic VALUES (2741, 767, 52);
INSERT INTO papers_nm_subtopic VALUES (2742, 767, 54);
INSERT INTO papers_nm_subtopic VALUES (3161, 720, 22);
INSERT INTO papers_nm_subtopic VALUES (3162, 720, 24);
INSERT INTO papers_nm_subtopic VALUES (2749, 830, 3);
INSERT INTO papers_nm_subtopic VALUES (2750, 830, 26);
INSERT INTO papers_nm_subtopic VALUES (2751, 830, 53);
INSERT INTO papers_nm_subtopic VALUES (2752, 830, 54);
INSERT INTO papers_nm_subtopic VALUES (2753, 830, 55);
INSERT INTO papers_nm_subtopic VALUES (2754, 830, 56);
INSERT INTO papers_nm_subtopic VALUES (3163, 720, 25);
INSERT INTO papers_nm_subtopic VALUES (3164, 720, 53);
INSERT INTO papers_nm_subtopic VALUES (3165, 720, 54);
INSERT INTO papers_nm_subtopic VALUES (3166, 720, 55);
INSERT INTO papers_nm_subtopic VALUES (2762, 796, 3);
INSERT INTO papers_nm_subtopic VALUES (2763, 796, 26);
INSERT INTO papers_nm_subtopic VALUES (2764, 796, 53);
INSERT INTO papers_nm_subtopic VALUES (2765, 796, 54);
INSERT INTO papers_nm_subtopic VALUES (3179, 719, 3);
INSERT INTO papers_nm_subtopic VALUES (3180, 719, 13);
INSERT INTO papers_nm_subtopic VALUES (3181, 719, 25);
INSERT INTO papers_nm_subtopic VALUES (2770, 745, 3);
INSERT INTO papers_nm_subtopic VALUES (2771, 745, 26);
INSERT INTO papers_nm_subtopic VALUES (2772, 745, 53);
INSERT INTO papers_nm_subtopic VALUES (2773, 745, 54);
INSERT INTO papers_nm_subtopic VALUES (3182, 719, 53);
INSERT INTO papers_nm_subtopic VALUES (3183, 719, 54);
INSERT INTO papers_nm_subtopic VALUES (2776, 739, 3);
INSERT INTO papers_nm_subtopic VALUES (2777, 739, 26);
INSERT INTO papers_nm_subtopic VALUES (2778, 739, 53);
INSERT INTO papers_nm_subtopic VALUES (2779, 739, 54);
INSERT INTO papers_nm_subtopic VALUES (3184, 719, 56);
INSERT INTO papers_nm_subtopic VALUES (2795, 740, 3);
INSERT INTO papers_nm_subtopic VALUES (2796, 740, 4);
INSERT INTO papers_nm_subtopic VALUES (2797, 740, 26);
INSERT INTO papers_nm_subtopic VALUES (2798, 740, 53);
INSERT INTO papers_nm_subtopic VALUES (2799, 740, 54);
INSERT INTO papers_nm_subtopic VALUES (2803, 1065, 2);
INSERT INTO papers_nm_subtopic VALUES (2804, 1065, 53);
INSERT INTO papers_nm_subtopic VALUES (2805, 1065, 54);
INSERT INTO papers_nm_subtopic VALUES (2806, 805, 3);
INSERT INTO papers_nm_subtopic VALUES (2807, 805, 26);
INSERT INTO papers_nm_subtopic VALUES (2808, 805, 53);
INSERT INTO papers_nm_subtopic VALUES (2809, 805, 54);
INSERT INTO papers_nm_subtopic VALUES (2816, 764, 3);
INSERT INTO papers_nm_subtopic VALUES (2817, 764, 26);
INSERT INTO papers_nm_subtopic VALUES (2818, 764, 36);
INSERT INTO papers_nm_subtopic VALUES (2819, 764, 44);
INSERT INTO papers_nm_subtopic VALUES (2820, 764, 53);
INSERT INTO papers_nm_subtopic VALUES (2821, 764, 54);
INSERT INTO papers_nm_subtopic VALUES (2822, 815, 3);
INSERT INTO papers_nm_subtopic VALUES (2823, 815, 26);
INSERT INTO papers_nm_subtopic VALUES (2824, 815, 53);
INSERT INTO papers_nm_subtopic VALUES (2825, 815, 54);
INSERT INTO papers_nm_subtopic VALUES (2826, 815, 55);
INSERT INTO papers_nm_subtopic VALUES (2839, 799, 3);
INSERT INTO papers_nm_subtopic VALUES (2840, 799, 22);
INSERT INTO papers_nm_subtopic VALUES (2841, 799, 23);
INSERT INTO papers_nm_subtopic VALUES (2842, 799, 25);
INSERT INTO papers_nm_subtopic VALUES (2843, 799, 53);
INSERT INTO papers_nm_subtopic VALUES (2844, 799, 54);
INSERT INTO papers_nm_subtopic VALUES (2938, 743, 3);
INSERT INTO papers_nm_subtopic VALUES (2939, 743, 13);
INSERT INTO papers_nm_subtopic VALUES (2940, 743, 26);
INSERT INTO papers_nm_subtopic VALUES (2941, 743, 53);
INSERT INTO papers_nm_subtopic VALUES (2942, 743, 54);
INSERT INTO papers_nm_subtopic VALUES (2943, 743, 55);
INSERT INTO papers_nm_subtopic VALUES (2952, 857, 3);
INSERT INTO papers_nm_subtopic VALUES (2953, 857, 26);
INSERT INTO papers_nm_subtopic VALUES (2853, 800, 3);
INSERT INTO papers_nm_subtopic VALUES (2854, 800, 26);
INSERT INTO papers_nm_subtopic VALUES (2855, 800, 53);
INSERT INTO papers_nm_subtopic VALUES (2856, 800, 54);
INSERT INTO papers_nm_subtopic VALUES (2954, 857, 53);
INSERT INTO papers_nm_subtopic VALUES (2955, 857, 54);
INSERT INTO papers_nm_subtopic VALUES (2965, 909, 3);
INSERT INTO papers_nm_subtopic VALUES (2966, 909, 4);
INSERT INTO papers_nm_subtopic VALUES (2967, 909, 25);
INSERT INTO papers_nm_subtopic VALUES (2968, 909, 53);
INSERT INTO papers_nm_subtopic VALUES (2969, 909, 54);
INSERT INTO papers_nm_subtopic VALUES (2864, 862, 3);
INSERT INTO papers_nm_subtopic VALUES (2865, 862, 22);
INSERT INTO papers_nm_subtopic VALUES (2866, 862, 23);
INSERT INTO papers_nm_subtopic VALUES (2867, 862, 25);
INSERT INTO papers_nm_subtopic VALUES (2868, 862, 53);
INSERT INTO papers_nm_subtopic VALUES (2869, 862, 54);
INSERT INTO papers_nm_subtopic VALUES (2870, 862, 55);
INSERT INTO papers_nm_subtopic VALUES (2974, 822, 3);
INSERT INTO papers_nm_subtopic VALUES (2975, 822, 26);
INSERT INTO papers_nm_subtopic VALUES (2976, 822, 53);
INSERT INTO papers_nm_subtopic VALUES (2977, 822, 54);
INSERT INTO papers_nm_subtopic VALUES (2875, 768, 3);
INSERT INTO papers_nm_subtopic VALUES (2876, 768, 26);
INSERT INTO papers_nm_subtopic VALUES (2877, 768, 53);
INSERT INTO papers_nm_subtopic VALUES (2878, 768, 54);
INSERT INTO papers_nm_subtopic VALUES (2982, 771, 3);
INSERT INTO papers_nm_subtopic VALUES (2983, 771, 25);
INSERT INTO papers_nm_subtopic VALUES (2984, 771, 53);
INSERT INTO papers_nm_subtopic VALUES (2985, 771, 54);
INSERT INTO papers_nm_subtopic VALUES (2994, 828, 5);
INSERT INTO papers_nm_subtopic VALUES (2995, 828, 22);
INSERT INTO papers_nm_subtopic VALUES (2996, 828, 23);
INSERT INTO papers_nm_subtopic VALUES (2997, 828, 25);
INSERT INTO papers_nm_subtopic VALUES (2998, 828, 28);
INSERT INTO papers_nm_subtopic VALUES (2999, 828, 53);
INSERT INTO papers_nm_subtopic VALUES (3000, 828, 54);
INSERT INTO papers_nm_subtopic VALUES (3001, 828, 55);
INSERT INTO papers_nm_subtopic VALUES (3008, 882, 3);
INSERT INTO papers_nm_subtopic VALUES (3009, 882, 13);
INSERT INTO papers_nm_subtopic VALUES (3010, 882, 22);
INSERT INTO papers_nm_subtopic VALUES (3011, 882, 25);
INSERT INTO papers_nm_subtopic VALUES (3012, 882, 53);
INSERT INTO papers_nm_subtopic VALUES (2896, 1063, 3);
INSERT INTO papers_nm_subtopic VALUES (2897, 1063, 26);
INSERT INTO papers_nm_subtopic VALUES (2898, 1063, 28);
INSERT INTO papers_nm_subtopic VALUES (2899, 1063, 53);
INSERT INTO papers_nm_subtopic VALUES (2900, 1063, 54);
INSERT INTO papers_nm_subtopic VALUES (2901, 1063, 55);
INSERT INTO papers_nm_subtopic VALUES (3013, 882, 55);
INSERT INTO papers_nm_subtopic VALUES (3023, 736, 3);
INSERT INTO papers_nm_subtopic VALUES (3024, 736, 22);
INSERT INTO papers_nm_subtopic VALUES (3025, 736, 24);
INSERT INTO papers_nm_subtopic VALUES (3026, 736, 25);
INSERT INTO papers_nm_subtopic VALUES (3027, 736, 26);
INSERT INTO papers_nm_subtopic VALUES (3028, 736, 32);
INSERT INTO papers_nm_subtopic VALUES (3029, 736, 53);
INSERT INTO papers_nm_subtopic VALUES (2910, 790, 3);
INSERT INTO papers_nm_subtopic VALUES (2911, 790, 26);
INSERT INTO papers_nm_subtopic VALUES (2912, 790, 53);
INSERT INTO papers_nm_subtopic VALUES (2913, 790, 54);
INSERT INTO papers_nm_subtopic VALUES (3030, 736, 54);
INSERT INTO papers_nm_subtopic VALUES (3031, 736, 55);
INSERT INTO papers_nm_subtopic VALUES (2916, 852, 3);
INSERT INTO papers_nm_subtopic VALUES (2917, 852, 22);
INSERT INTO papers_nm_subtopic VALUES (2918, 852, 36);
INSERT INTO papers_nm_subtopic VALUES (2919, 852, 53);
INSERT INTO papers_nm_subtopic VALUES (2920, 852, 54);
INSERT INTO papers_nm_subtopic VALUES (2921, 852, 55);
INSERT INTO papers_nm_subtopic VALUES (3037, 761, 3);
INSERT INTO papers_nm_subtopic VALUES (3038, 761, 25);
INSERT INTO papers_nm_subtopic VALUES (3039, 761, 53);
INSERT INTO papers_nm_subtopic VALUES (3040, 761, 54);
INSERT INTO papers_nm_subtopic VALUES (3041, 761, 55);
INSERT INTO papers_nm_subtopic VALUES (3056, 744, 2);
INSERT INTO papers_nm_subtopic VALUES (3057, 744, 3);
INSERT INTO papers_nm_subtopic VALUES (3058, 744, 4);
INSERT INTO papers_nm_subtopic VALUES (3059, 744, 36);
INSERT INTO papers_nm_subtopic VALUES (3060, 744, 52);
INSERT INTO papers_nm_subtopic VALUES (3061, 744, 54);
INSERT INTO papers_nm_subtopic VALUES (3067, 1061, 3);
INSERT INTO papers_nm_subtopic VALUES (3068, 1061, 26);
INSERT INTO papers_nm_subtopic VALUES (3069, 1061, 53);
INSERT INTO papers_nm_subtopic VALUES (3070, 1061, 54);
INSERT INTO papers_nm_subtopic VALUES (3071, 1061, 55);
INSERT INTO papers_nm_subtopic VALUES (3074, 784, 3);
INSERT INTO papers_nm_subtopic VALUES (3075, 784, 26);
INSERT INTO papers_nm_subtopic VALUES (3089, 730, 3);
INSERT INTO papers_nm_subtopic VALUES (3090, 730, 53);
INSERT INTO papers_nm_subtopic VALUES (3091, 730, 54);
INSERT INTO papers_nm_subtopic VALUES (3092, 730, 55);
INSERT INTO papers_nm_subtopic VALUES (3107, 731, 3);
INSERT INTO papers_nm_subtopic VALUES (3108, 731, 53);
INSERT INTO papers_nm_subtopic VALUES (3109, 731, 54);
INSERT INTO papers_nm_subtopic VALUES (3113, 728, 53);
INSERT INTO papers_nm_subtopic VALUES (3114, 728, 54);
INSERT INTO papers_nm_subtopic VALUES (3146, 723, 3);
INSERT INTO papers_nm_subtopic VALUES (3147, 723, 53);
INSERT INTO papers_nm_subtopic VALUES (3148, 723, 55);
INSERT INTO papers_nm_subtopic VALUES (3192, 718, 3);
INSERT INTO papers_nm_subtopic VALUES (3193, 718, 23);
INSERT INTO papers_nm_subtopic VALUES (3194, 718, 53);
INSERT INTO papers_nm_subtopic VALUES (3195, 718, 54);
INSERT INTO papers_nm_subtopic VALUES (3209, 721, 3);
INSERT INTO papers_nm_subtopic VALUES (3210, 721, 22);
INSERT INTO papers_nm_subtopic VALUES (3211, 721, 25);
INSERT INTO papers_nm_subtopic VALUES (3212, 721, 53);
INSERT INTO papers_nm_subtopic VALUES (3213, 721, 54);
INSERT INTO papers_nm_subtopic VALUES (3214, 716, 3);
INSERT INTO papers_nm_subtopic VALUES (3215, 716, 13);
INSERT INTO papers_nm_subtopic VALUES (3216, 716, 53);
INSERT INTO papers_nm_subtopic VALUES (3217, 716, 54);
INSERT INTO papers_nm_subtopic VALUES (3218, 714, 3);
INSERT INTO papers_nm_subtopic VALUES (3219, 714, 25);
INSERT INTO papers_nm_subtopic VALUES (3220, 714, 54);
INSERT INTO papers_nm_subtopic VALUES (3230, 715, 3);
INSERT INTO papers_nm_subtopic VALUES (3231, 715, 22);
INSERT INTO papers_nm_subtopic VALUES (3232, 715, 25);
INSERT INTO papers_nm_subtopic VALUES (3233, 715, 53);
INSERT INTO papers_nm_subtopic VALUES (3234, 715, 54);
INSERT INTO papers_nm_subtopic VALUES (3248, 1060, 3);
INSERT INTO papers_nm_subtopic VALUES (3249, 1060, 28);
INSERT INTO papers_nm_subtopic VALUES (3250, 1060, 53);
INSERT INTO papers_nm_subtopic VALUES (3251, 1060, 54);
INSERT INTO papers_nm_subtopic VALUES (3252, 1060, 55);
INSERT INTO papers_nm_subtopic VALUES (3257, 709, 3);
INSERT INTO papers_nm_subtopic VALUES (3258, 709, 52);
INSERT INTO papers_nm_subtopic VALUES (3259, 709, 53);
INSERT INTO papers_nm_subtopic VALUES (3260, 709, 54);
INSERT INTO papers_nm_subtopic VALUES (3269, 711, 22);
INSERT INTO papers_nm_subtopic VALUES (3270, 711, 25);
INSERT INTO papers_nm_subtopic VALUES (3271, 711, 53);
INSERT INTO papers_nm_subtopic VALUES (3272, 711, 54);
INSERT INTO papers_nm_subtopic VALUES (3277, 712, 3);
INSERT INTO papers_nm_subtopic VALUES (3278, 712, 25);
INSERT INTO papers_nm_subtopic VALUES (3279, 712, 41);
INSERT INTO papers_nm_subtopic VALUES (3280, 712, 53);
INSERT INTO papers_nm_subtopic VALUES (3281, 712, 54);
INSERT INTO papers_nm_subtopic VALUES (3282, 712, 55);
INSERT INTO papers_nm_subtopic VALUES (3283, 713, 3);
INSERT INTO papers_nm_subtopic VALUES (3284, 713, 22);
INSERT INTO papers_nm_subtopic VALUES (3285, 713, 53);
INSERT INTO papers_nm_subtopic VALUES (3286, 713, 54);
INSERT INTO papers_nm_subtopic VALUES (3287, 713, 56);
INSERT INTO papers_nm_subtopic VALUES (3294, 1059, 36);
INSERT INTO papers_nm_subtopic VALUES (3295, 1059, 41);
INSERT INTO papers_nm_subtopic VALUES (3296, 1059, 53);
INSERT INTO papers_nm_subtopic VALUES (3297, 1059, 54);
INSERT INTO papers_nm_subtopic VALUES (3298, 707, 25);
INSERT INTO papers_nm_subtopic VALUES (3299, 707, 53);
INSERT INTO papers_nm_subtopic VALUES (3300, 707, 54);
INSERT INTO papers_nm_subtopic VALUES (3301, 707, 55);
INSERT INTO papers_nm_subtopic VALUES (3308, 705, 4);
INSERT INTO papers_nm_subtopic VALUES (3309, 705, 22);
INSERT INTO papers_nm_subtopic VALUES (3310, 705, 24);
INSERT INTO papers_nm_subtopic VALUES (3311, 705, 25);
INSERT INTO papers_nm_subtopic VALUES (3312, 705, 41);
INSERT INTO papers_nm_subtopic VALUES (3313, 705, 53);
INSERT INTO papers_nm_subtopic VALUES (3314, 705, 54);
INSERT INTO papers_nm_subtopic VALUES (3317, 706, 53);
INSERT INTO papers_nm_subtopic VALUES (3318, 706, 54);
INSERT INTO papers_nm_subtopic VALUES (3319, 704, 41);
INSERT INTO papers_nm_subtopic VALUES (3320, 704, 53);
INSERT INTO papers_nm_subtopic VALUES (3321, 704, 54);
INSERT INTO papers_nm_subtopic VALUES (3322, 1089, 26);
INSERT INTO papers_nm_subtopic VALUES (3323, 1089, 28);
INSERT INTO papers_nm_subtopic VALUES (3324, 1089, 53);
INSERT INTO papers_nm_subtopic VALUES (3325, 1089, 54);
INSERT INTO papers_nm_subtopic VALUES (3331, 1088, 1);
INSERT INTO papers_nm_subtopic VALUES (3332, 1088, 2);
INSERT INTO papers_nm_subtopic VALUES (3333, 1088, 25);
INSERT INTO papers_nm_subtopic VALUES (3334, 1088, 53);
INSERT INTO papers_nm_subtopic VALUES (3335, 1088, 54);
INSERT INTO papers_nm_subtopic VALUES (3336, 1092, 2);
INSERT INTO papers_nm_subtopic VALUES (3337, 1092, 22);
INSERT INTO papers_nm_subtopic VALUES (3338, 1092, 25);
INSERT INTO papers_nm_subtopic VALUES (3339, 1092, 53);
INSERT INTO papers_nm_subtopic VALUES (3340, 1092, 54);
INSERT INTO papers_nm_subtopic VALUES (3341, 1092, 55);
INSERT INTO papers_nm_subtopic VALUES (3342, 1094, 22);
INSERT INTO papers_nm_subtopic VALUES (3343, 1094, 53);
INSERT INTO papers_nm_subtopic VALUES (3344, 1094, 54);
INSERT INTO papers_nm_subtopic VALUES (3345, 1095, 3);
INSERT INTO papers_nm_subtopic VALUES (3346, 1095, 12);
INSERT INTO papers_nm_subtopic VALUES (3347, 1095, 13);
INSERT INTO papers_nm_subtopic VALUES (3348, 1095, 22);
INSERT INTO papers_nm_subtopic VALUES (3349, 1095, 23);
INSERT INTO papers_nm_subtopic VALUES (3350, 1095, 25);
INSERT INTO papers_nm_subtopic VALUES (3351, 1095, 53);
INSERT INTO papers_nm_subtopic VALUES (3352, 1095, 54);
INSERT INTO papers_nm_subtopic VALUES (3359, 1096, 3);
INSERT INTO papers_nm_subtopic VALUES (3360, 1096, 23);
INSERT INTO papers_nm_subtopic VALUES (3361, 1096, 25);
INSERT INTO papers_nm_subtopic VALUES (3362, 1096, 53);
INSERT INTO papers_nm_subtopic VALUES (3363, 1096, 54);
INSERT INTO papers_nm_subtopic VALUES (3364, 1096, 55);
INSERT INTO papers_nm_subtopic VALUES (3371, 1087, 3);
INSERT INTO papers_nm_subtopic VALUES (3372, 1087, 12);
INSERT INTO papers_nm_subtopic VALUES (3373, 1087, 13);
INSERT INTO papers_nm_subtopic VALUES (3374, 1087, 23);
INSERT INTO papers_nm_subtopic VALUES (3375, 1087, 25);
INSERT INTO papers_nm_subtopic VALUES (3376, 1087, 32);
INSERT INTO papers_nm_subtopic VALUES (3377, 1087, 53);
INSERT INTO papers_nm_subtopic VALUES (3378, 1087, 54);
INSERT INTO papers_nm_subtopic VALUES (3383, 1093, 2);
INSERT INTO papers_nm_subtopic VALUES (3384, 1093, 25);
INSERT INTO papers_nm_subtopic VALUES (3385, 1093, 53);
INSERT INTO papers_nm_subtopic VALUES (3386, 1093, 54);
INSERT INTO papers_nm_subtopic VALUES (3387, 1093, 55);


--
-- Name: papers_nm_subtopic_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('papers_nm_subtopic_seq', 3387, true);


--
-- Name: papers_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('papers_seq', 1096, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tool
--

INSERT INTO users VALUES (2, 'lisandro', 'e856ffdb3370d1b2825dc5a520457efa', '', 1);
INSERT INTO users VALUES (3, 'ramin', 'e856ffdb3370d1b2825dc5a520457efa', '', 1);
INSERT INTO users VALUES (1, 'vinicius', '704b037a97fa9b25522b7c014c300f8a', 'vicoguim@gmail.com', 1);
INSERT INTO users VALUES (4, 'carla', 'e856ffdb3370d1b2825dc5a520457efa', '', 1);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: tool
--

SELECT pg_catalog.setval('users_seq', 4, true);


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

