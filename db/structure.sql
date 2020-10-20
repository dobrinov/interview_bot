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

SET default_table_access_method = heap;

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
-- Name: job_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.job_applications (
    id bigint NOT NULL,
    role_description_id bigint,
    interviewee_id bigint
);


--
-- Name: job_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.job_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: job_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.job_applications_id_seq OWNED BY public.job_applications.id;


--
-- Name: role_descriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_descriptions (
    id bigint NOT NULL,
    name character varying NOT NULL,
    company_id bigint
);


--
-- Name: role_descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_descriptions_id_seq OWNED BY public.role_descriptions.id;


--
-- Name: role_descriptions_technologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_descriptions_technologies (
    id bigint NOT NULL,
    role_description_id bigint,
    technology_id bigint
);


--
-- Name: role_descriptions_technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_descriptions_technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_descriptions_technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_descriptions_technologies_id_seq OWNED BY public.role_descriptions_technologies.id;


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
    job_application_id bigint NOT NULL,
    slug character varying NOT NULL,
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
-- Name: technologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.technologies (
    id bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.technologies_id_seq OWNED BY public.technologies.id;


--
-- Name: technology_self_evaluations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.technology_self_evaluations (
    id bigint NOT NULL,
    self_evaluation_id bigint NOT NULL,
    technology_id bigint NOT NULL,
    level integer,
    number_of_projects public.number_of_projects,
    total_experience public.total_experience
);


--
-- Name: technology_self_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.technology_self_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: technology_self_evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.technology_self_evaluations_id_seq OWNED BY public.technology_self_evaluations.id;


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: interviewees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interviewees ALTER COLUMN id SET DEFAULT nextval('public.interviewees_id_seq'::regclass);


--
-- Name: job_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_applications ALTER COLUMN id SET DEFAULT nextval('public.job_applications_id_seq'::regclass);


--
-- Name: role_descriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_descriptions ALTER COLUMN id SET DEFAULT nextval('public.role_descriptions_id_seq'::regclass);


--
-- Name: role_descriptions_technologies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_descriptions_technologies ALTER COLUMN id SET DEFAULT nextval('public.role_descriptions_technologies_id_seq'::regclass);


--
-- Name: self_evaluations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.self_evaluations ALTER COLUMN id SET DEFAULT nextval('public.self_evaluations_id_seq'::regclass);


--
-- Name: technologies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technologies ALTER COLUMN id SET DEFAULT nextval('public.technologies_id_seq'::regclass);


--
-- Name: technology_self_evaluations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technology_self_evaluations ALTER COLUMN id SET DEFAULT nextval('public.technology_self_evaluations_id_seq'::regclass);


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
-- Name: interviewees interviewees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interviewees
    ADD CONSTRAINT interviewees_pkey PRIMARY KEY (id);


--
-- Name: job_applications job_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_applications
    ADD CONSTRAINT job_applications_pkey PRIMARY KEY (id);


--
-- Name: role_descriptions role_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_descriptions
    ADD CONSTRAINT role_descriptions_pkey PRIMARY KEY (id);


--
-- Name: role_descriptions_technologies role_descriptions_technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_descriptions_technologies
    ADD CONSTRAINT role_descriptions_technologies_pkey PRIMARY KEY (id);


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
-- Name: technologies technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technologies
    ADD CONSTRAINT technologies_pkey PRIMARY KEY (id);


--
-- Name: technology_self_evaluations technology_self_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technology_self_evaluations
    ADD CONSTRAINT technology_self_evaluations_pkey PRIMARY KEY (id);


--
-- Name: index_interviewees_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_interviewees_on_email ON public.interviewees USING btree (email);


--
-- Name: index_job_applications_on_interviewee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_job_applications_on_interviewee_id ON public.job_applications USING btree (interviewee_id);


--
-- Name: index_job_applications_on_role_description_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_job_applications_on_role_description_id ON public.job_applications USING btree (role_description_id);


--
-- Name: index_role_descriptions_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_role_descriptions_on_company_id ON public.role_descriptions USING btree (company_id);


--
-- Name: index_role_descriptions_technologies_on_role_description_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_role_descriptions_technologies_on_role_description_id ON public.role_descriptions_technologies USING btree (role_description_id);


--
-- Name: index_role_descriptions_technologies_on_technology_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_role_descriptions_technologies_on_technology_id ON public.role_descriptions_technologies USING btree (technology_id);


--
-- Name: index_self_evaluations_on_job_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_self_evaluations_on_job_application_id ON public.self_evaluations USING btree (job_application_id);


--
-- Name: index_tech_self_eval_on_self_eval_id_and_tech_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tech_self_eval_on_self_eval_id_and_tech_id ON public.technology_self_evaluations USING btree (self_evaluation_id, technology_id);


--
-- Name: index_technologies_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_technologies_on_name ON public.technologies USING btree (name);


--
-- Name: index_technology_self_evaluations_on_self_evaluation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_technology_self_evaluations_on_self_evaluation_id ON public.technology_self_evaluations USING btree (self_evaluation_id);


--
-- Name: index_technology_self_evaluations_on_technology_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_technology_self_evaluations_on_technology_id ON public.technology_self_evaluations USING btree (technology_id);


--
-- Name: role_descriptions_technologies fk_rails_2fd880c102; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_descriptions_technologies
    ADD CONSTRAINT fk_rails_2fd880c102 FOREIGN KEY (technology_id) REFERENCES public.technologies(id);


--
-- Name: technology_self_evaluations fk_rails_46b9608c7b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technology_self_evaluations
    ADD CONSTRAINT fk_rails_46b9608c7b FOREIGN KEY (technology_id) REFERENCES public.technologies(id);


--
-- Name: role_descriptions_technologies fk_rails_57cbfcb545; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_descriptions_technologies
    ADD CONSTRAINT fk_rails_57cbfcb545 FOREIGN KEY (role_description_id) REFERENCES public.role_descriptions(id);


--
-- Name: job_applications fk_rails_6c66c006a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_applications
    ADD CONSTRAINT fk_rails_6c66c006a7 FOREIGN KEY (role_description_id) REFERENCES public.role_descriptions(id);


--
-- Name: role_descriptions fk_rails_9b2e57df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_descriptions
    ADD CONSTRAINT fk_rails_9b2e57df05 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: job_applications fk_rails_d4cfbaeb2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_applications
    ADD CONSTRAINT fk_rails_d4cfbaeb2c FOREIGN KEY (interviewee_id) REFERENCES public.interviewees(id);


--
-- Name: self_evaluations fk_rails_e755028ccf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.self_evaluations
    ADD CONSTRAINT fk_rails_e755028ccf FOREIGN KEY (job_application_id) REFERENCES public.job_applications(id);


--
-- Name: technology_self_evaluations fk_rails_fce423a2aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technology_self_evaluations
    ADD CONSTRAINT fk_rails_fce423a2aa FOREIGN KEY (self_evaluation_id) REFERENCES public.self_evaluations(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200125131557'),
('20200125131558'),
('20200125131559'),
('20200125132156'),
('20200125132157'),
('20200125134922'),
('20200125134928'),
('20200125134930'),
('20200125151113'),
('20200130211621');


