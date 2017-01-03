--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: enum_predicate_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE enum_predicate_type AS ENUM (
    'device',
    'link',
    'other'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: device_definitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE device_definitions (
    id integer NOT NULL,
    problem_id integer,
    predicate_id integer,
    name text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: device_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE device_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: device_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE device_definitions_id_seq OWNED BY device_definitions.id;


--
-- Name: domains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE domains (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: domains_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domains_id_seq OWNED BY domains.id;


--
-- Name: floorplan_objects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE floorplan_objects (
    id integer NOT NULL,
    angle double precision,
    background_color text,
    fill text,
    height double precision,
    width double precision,
    "left" double precision,
    top double precision,
    opacity double precision,
    scale_x double precision,
    scale_y double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type text,
    device_definition_id integer
);


--
-- Name: floorplan_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE floorplan_objects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: floorplan_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE floorplan_objects_id_seq OWNED BY floorplan_objects.id;


--
-- Name: floorplans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE floorplans (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    domain_id integer
);


--
-- Name: floorplans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE floorplans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: floorplans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE floorplans_id_seq OWNED BY floorplans.id;


--
-- Name: predicate_params; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predicate_params (
    id integer NOT NULL,
    name text,
    param_type text,
    predicate_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: predicate_params_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE predicate_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: predicate_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE predicate_params_id_seq OWNED BY predicate_params.id;


--
-- Name: predicates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predicates (
    id integer NOT NULL,
    keyword text,
    domain_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    predicate_type enum_predicate_type DEFAULT 'other'::enum_predicate_type NOT NULL
);


--
-- Name: predicates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE predicates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: predicates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE predicates_id_seq OWNED BY predicates.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE problems (
    id integer NOT NULL,
    name text,
    floorplan_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE problems_id_seq OWNED BY problems.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: device_definitions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_definitions ALTER COLUMN id SET DEFAULT nextval('device_definitions_id_seq'::regclass);


--
-- Name: domains id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains ALTER COLUMN id SET DEFAULT nextval('domains_id_seq'::regclass);


--
-- Name: floorplan_objects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY floorplan_objects ALTER COLUMN id SET DEFAULT nextval('floorplan_objects_id_seq'::regclass);


--
-- Name: floorplans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY floorplans ALTER COLUMN id SET DEFAULT nextval('floorplans_id_seq'::regclass);


--
-- Name: predicate_params id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY predicate_params ALTER COLUMN id SET DEFAULT nextval('predicate_params_id_seq'::regclass);


--
-- Name: predicates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY predicates ALTER COLUMN id SET DEFAULT nextval('predicates_id_seq'::regclass);


--
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY problems ALTER COLUMN id SET DEFAULT nextval('problems_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: device_definitions device_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_definitions
    ADD CONSTRAINT device_definitions_pkey PRIMARY KEY (id);


--
-- Name: domains domains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains
    ADD CONSTRAINT domains_pkey PRIMARY KEY (id);


--
-- Name: floorplan_objects floorplan_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY floorplan_objects
    ADD CONSTRAINT floorplan_objects_pkey PRIMARY KEY (id);


--
-- Name: floorplans floorplans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY floorplans
    ADD CONSTRAINT floorplans_pkey PRIMARY KEY (id);


--
-- Name: predicate_params predicate_params_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predicate_params
    ADD CONSTRAINT predicate_params_pkey PRIMARY KEY (id);


--
-- Name: predicates predicates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predicates
    ADD CONSTRAINT predicates_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES
('20161229085437'),
('20161229091048'),
('20170102191415'),
('20170102191505'),
('20170102191904'),
('20170102192027'),
('20170102204658'),
('20170103095631'),
('20170103184035'),
('20170103192049'),
('20170103192150');


