SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: number_of_projects; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.number_of_projects AS ENUM (
    'no experience',
    '1',
    '2',
    '3',
    '4',
    '5-10',
    '10+'
);


--
-- Name: total_experience; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.total_experience AS ENUM (
    'no experience',
    'less than a month',
    '1-3 months',
    '3-6 months',
    '6-12 months',
    '1-2 years',
    '2-5 years',
    '5+ years'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: companies_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies_skills (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    skill_id bigint NOT NULL
);


--
-- Name: companies_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_skills_id_seq OWNED BY public.companies_skills.id;


--
-- Name: interviewees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interviewees (
    id bigint NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL
);


--
-- Name: interviewees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interviewees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interviewees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interviewees_id_seq OWNED BY public.interviewees.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: self_evaluations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.self_evaluations (
    id bigint NOT NULL,
    interviewee_id bigint NOT NULL,
    submitted_at timestamp without time zone
);


--
-- Name: self_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.self_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: self_evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.self_evaluations_id_seq OWNED BY public.self_evaluations.id;


--
-- Name: skill_self_evaluations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skill_self_evaluations (
    id bigint NOT NULL,
    self_evaluation_id bigint NOT NULL,
    skill_id bigint NOT NULL,
    level integer,
    number_of_projects public.number_of_projects,
    total_experience public.total_experience
);


--
-- Name: skill_self_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.skill_self_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skill_self_evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.skill_self_evaluations_id_seq OWNED BY public.skill_self_evaluations.id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skills (
    id bigint NOT NULL,
    name character varying NOT NULL,
    standartized boolean DEFAULT false NOT NULL
);


--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: companies_skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_skills ALTER COLUMN id SET DEFAULT nextval('public.companies_skills_id_seq'::regclass);


--
-- Name: interviewees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interviewees ALTER COLUMN id SET DEFAULT nextval('public.interviewees_id_seq'::regclass);


--
-- Name: self_evaluations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.self_evaluations ALTER COLUMN id SET DEFAULT nextval('public.self_evaluations_id_seq'::regclass);


--
-- Name: skill_self_evaluations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_self_evaluations ALTER COLUMN id SET DEFAULT nextval('public.skill_self_evaluations_id_seq'::regclass);


--
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: companies_skills companies_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_skills
    ADD CONSTRAINT companies_skills_pkey PRIMARY KEY (id);


--
-- Name: interviewees interviewees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interviewees
    ADD CONSTRAINT interviewees_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: self_evaluations self_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.self_evaluations
    ADD CONSTRAINT self_evaluations_pkey PRIMARY KEY (id);


--
-- Name: skill_self_evaluations skill_self_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_self_evaluations
    ADD CONSTRAINT skill_self_evaluations_pkey PRIMARY KEY (id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: index_companies_skills_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_skills_on_company_id ON public.companies_skills USING btree (company_id);


--
-- Name: index_companies_skills_on_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_skills_on_skill_id ON public.companies_skills USING btree (skill_id);


--
-- Name: index_self_evaluations_on_interviewee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_self_evaluations_on_interviewee_id ON public.self_evaluations USING btree (interviewee_id);


--
-- Name: index_skill_self_evaluations_on_self_evaluation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_skill_self_evaluations_on_self_evaluation_id ON public.skill_self_evaluations USING btree (self_evaluation_id);


--
-- Name: index_skill_self_evaluations_on_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_skill_self_evaluations_on_skill_id ON public.skill_self_evaluations USING btree (skill_id);


--
-- Name: self_evaluations fk_rails_84fcb1791b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.self_evaluations
    ADD CONSTRAINT fk_rails_84fcb1791b FOREIGN KEY (interviewee_id) REFERENCES public.interviewees(id);


--
-- Name: skill_self_evaluations fk_rails_87b23802dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_self_evaluations
    ADD CONSTRAINT fk_rails_87b23802dc FOREIGN KEY (self_evaluation_id) REFERENCES public.self_evaluations(id);


--
-- Name: companies_skills fk_rails_b607e99003; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_skills
    ADD CONSTRAINT fk_rails_b607e99003 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: companies_skills fk_rails_f4128fd41d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_skills
    ADD CONSTRAINT fk_rails_f4128fd41d FOREIGN KEY (skill_id) REFERENCES public.skills(id);


--
-- Name: skill_self_evaluations fk_rails_f93169c1ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skill_self_evaluations
    ADD CONSTRAINT fk_rails_f93169c1ee FOREIGN KEY (skill_id) REFERENCES public.skills(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200125131557'),
('20200125131558'),
('20200125131559'),
('20200125132156'),
('20200125134922'),
('20200125134930'),
('20200125143746'),
('20200125151113');


