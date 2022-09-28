--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO newupworkuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO newupworkuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO newupworkuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO newupworkuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO newupworkuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO newupworkuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO newupworkuser;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO newupworkuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO newupworkuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO newupworkuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO newupworkuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO newupworkuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO newupworkuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO newupworkuser;

--
-- Name: post_post; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.post_post (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    headline character varying(300) NOT NULL,
    extra_skills character varying(300),
    is_hourly boolean NOT NULL,
    hourly_from_budget bigint,
    hourly_to_budget bigint,
    maximum_project_budget bigint,
    description text,
    latitude double precision,
    longitude double precision,
    user_id bigint NOT NULL,
    is_delete boolean NOT NULL,
    address character varying(350),
    is_active boolean NOT NULL,
    duration double precision,
    status character varying(20) NOT NULL,
    is_new boolean NOT NULL
);


ALTER TABLE public.post_post OWNER TO newupworkuser;

--
-- Name: post_post_categories; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.post_post_categories (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.post_post_categories OWNER TO newupworkuser;

--
-- Name: post_post_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.post_post_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_post_categories_id_seq OWNER TO newupworkuser;

--
-- Name: post_post_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.post_post_categories_id_seq OWNED BY public.post_post_categories.id;


--
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.post_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_post_id_seq OWNER TO newupworkuser;

--
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.post_post_id_seq OWNED BY public.post_post.id;


--
-- Name: post_post_skills; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.post_post_skills (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    subcategory_id bigint NOT NULL
);


ALTER TABLE public.post_post_skills OWNER TO newupworkuser;

--
-- Name: post_post_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.post_post_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_post_skills_id_seq OWNER TO newupworkuser;

--
-- Name: post_post_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.post_post_skills_id_seq OWNED BY public.post_post_skills.id;


--
-- Name: post_postimage; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.post_postimage (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    image character varying(100),
    post_id bigint NOT NULL
);


ALTER TABLE public.post_postimage OWNER TO newupworkuser;

--
-- Name: post_postimage_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.post_postimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_postimage_id_seq OWNER TO newupworkuser;

--
-- Name: post_postimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.post_postimage_id_seq OWNED BY public.post_postimage.id;


--
-- Name: post_wishlist; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.post_wishlist (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_like boolean NOT NULL,
    post_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.post_wishlist OWNER TO newupworkuser;

--
-- Name: post_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.post_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_wishlist_id_seq OWNER TO newupworkuser;

--
-- Name: post_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.post_wishlist_id_seq OWNED BY public.post_wishlist.id;


--
-- Name: proposals_invoice; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.proposals_invoice (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    card bigint,
    is_withdraw boolean NOT NULL,
    amount bigint NOT NULL,
    user_id bigint NOT NULL,
    date character varying(5)
);


ALTER TABLE public.proposals_invoice OWNER TO newupworkuser;

--
-- Name: proposals_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.proposals_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proposals_invoice_id_seq OWNER TO newupworkuser;

--
-- Name: proposals_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.proposals_invoice_id_seq OWNED BY public.proposals_invoice.id;


--
-- Name: proposals_proposal; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.proposals_proposal (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    description text NOT NULL,
    price bigint NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    admin_status character varying(25) NOT NULL,
    client_status character varying(25) NOT NULL,
    is_new boolean NOT NULL
);


ALTER TABLE public.proposals_proposal OWNER TO newupworkuser;

--
-- Name: proposals_proposal_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.proposals_proposal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proposals_proposal_id_seq OWNER TO newupworkuser;

--
-- Name: proposals_proposal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.proposals_proposal_id_seq OWNED BY public.proposals_proposal.id;


--
-- Name: proposals_review; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.proposals_review (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    comment text NOT NULL,
    post_id bigint,
    user_id bigint NOT NULL,
    rate integer NOT NULL,
    is_client boolean NOT NULL,
    CONSTRAINT proposals_review_rate_check CHECK ((rate >= 0))
);


ALTER TABLE public.proposals_review OWNER TO newupworkuser;

--
-- Name: proposals_review_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.proposals_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proposals_review_id_seq OWNER TO newupworkuser;

--
-- Name: proposals_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.proposals_review_id_seq OWNED BY public.proposals_review.id;


--
-- Name: proposals_statuschanges; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.proposals_statuschanges (
    id bigint NOT NULL,
    from_status character varying(25) NOT NULL,
    to_status character varying(25) NOT NULL,
    is_post boolean NOT NULL,
    post_id bigint,
    proposal_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.proposals_statuschanges OWNER TO newupworkuser;

--
-- Name: proposals_statuschanges_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.proposals_statuschanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proposals_statuschanges_id_seq OWNER TO newupworkuser;

--
-- Name: proposals_statuschanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.proposals_statuschanges_id_seq OWNED BY public.proposals_statuschanges.id;


--
-- Name: registration_category; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.registration_category (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    image character varying(200),
    status character varying(20) NOT NULL
);


ALTER TABLE public.registration_category OWNER TO newupworkuser;

--
-- Name: registration_category_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.registration_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_category_id_seq OWNER TO newupworkuser;

--
-- Name: registration_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.registration_category_id_seq OWNED BY public.registration_category.id;


--
-- Name: registration_city; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.registration_city (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(150) NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE public.registration_city OWNER TO newupworkuser;

--
-- Name: registration_city_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.registration_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_city_id_seq OWNER TO newupworkuser;

--
-- Name: registration_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.registration_city_id_seq OWNED BY public.registration_city.id;


--
-- Name: registration_region; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.registration_region (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.registration_region OWNER TO newupworkuser;

--
-- Name: registration_region_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.registration_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_region_id_seq OWNER TO newupworkuser;

--
-- Name: registration_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.registration_region_id_seq OWNED BY public.registration_region.id;


--
-- Name: registration_subcategory; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.registration_subcategory (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(150) NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.registration_subcategory OWNER TO newupworkuser;

--
-- Name: registration_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.registration_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_subcategory_id_seq OWNER TO newupworkuser;

--
-- Name: registration_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.registration_subcategory_id_seq OWNED BY public.registration_subcategory.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    password character varying(100),
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    phone_number character varying(20) NOT NULL,
    overview text,
    payment_hourly double precision,
    role character varying(10),
    avatar character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    city_id bigint,
    region_id bigint,
    street character varying(300),
    title text,
    is_delete boolean NOT NULL,
    total_earnings bigint NOT NULL,
    total_spent bigint NOT NULL,
    telegram character varying(100),
    experience integer,
    is_new boolean NOT NULL,
    is_online boolean NOT NULL,
    balance bigint NOT NULL
);


ALTER TABLE public."user" OWNER TO newupworkuser;

--
-- Name: user_categories; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.user_categories (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.user_categories OWNER TO newupworkuser;

--
-- Name: user_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.user_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_categories_id_seq OWNER TO newupworkuser;

--
-- Name: user_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.user_categories_id_seq OWNED BY public.user_categories.id;


--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_groups OWNER TO newupworkuser;

--
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_groups_id_seq OWNER TO newupworkuser;

--
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.user_groups_id_seq OWNED BY public.user_groups.id;


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO newupworkuser;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_skills; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.user_skills (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    subcategory_id bigint NOT NULL
);


ALTER TABLE public.user_skills OWNER TO newupworkuser;

--
-- Name: user_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.user_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_skills_id_seq OWNER TO newupworkuser;

--
-- Name: user_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.user_skills_id_seq OWNED BY public.user_skills.id;


--
-- Name: user_user_permissions; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_permissions OWNER TO newupworkuser;

--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_permissions_id_seq OWNER TO newupworkuser;

--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.user_user_permissions_id_seq OWNED BY public.user_user_permissions.id;


--
-- Name: user_usertoken; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.user_usertoken (
    id bigint NOT NULL,
    phone_number character varying(20),
    token character varying(10),
    password character varying(30)
);


ALTER TABLE public.user_usertoken OWNER TO newupworkuser;

--
-- Name: user_usertoken_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.user_usertoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_usertoken_id_seq OWNER TO newupworkuser;

--
-- Name: user_usertoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.user_usertoken_id_seq OWNED BY public.user_usertoken.id;


--
-- Name: worker_portfolio; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.worker_portfolio (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    headline character varying(300) NOT NULL,
    description text NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    is_new boolean NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.worker_portfolio OWNER TO newupworkuser;

--
-- Name: worker_portfolio_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.worker_portfolio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worker_portfolio_id_seq OWNER TO newupworkuser;

--
-- Name: worker_portfolio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.worker_portfolio_id_seq OWNED BY public.worker_portfolio.id;


--
-- Name: worker_portfolioimage; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.worker_portfolioimage (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    image character varying(100) NOT NULL,
    portfolio_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.worker_portfolioimage OWNER TO newupworkuser;

--
-- Name: worker_portfolioimage_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

CREATE SEQUENCE public.worker_portfolioimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worker_portfolioimage_id_seq OWNER TO newupworkuser;

--
-- Name: worker_portfolioimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newupworkuser
--

ALTER SEQUENCE public.worker_portfolioimage_id_seq OWNED BY public.worker_portfolioimage.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: post_post id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post ALTER COLUMN id SET DEFAULT nextval('public.post_post_id_seq'::regclass);


--
-- Name: post_post_categories id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_categories ALTER COLUMN id SET DEFAULT nextval('public.post_post_categories_id_seq'::regclass);


--
-- Name: post_post_skills id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_skills ALTER COLUMN id SET DEFAULT nextval('public.post_post_skills_id_seq'::regclass);


--
-- Name: post_postimage id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_postimage ALTER COLUMN id SET DEFAULT nextval('public.post_postimage_id_seq'::regclass);


--
-- Name: post_wishlist id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_wishlist ALTER COLUMN id SET DEFAULT nextval('public.post_wishlist_id_seq'::regclass);


--
-- Name: proposals_invoice id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_invoice ALTER COLUMN id SET DEFAULT nextval('public.proposals_invoice_id_seq'::regclass);


--
-- Name: proposals_proposal id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_proposal ALTER COLUMN id SET DEFAULT nextval('public.proposals_proposal_id_seq'::regclass);


--
-- Name: proposals_review id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_review ALTER COLUMN id SET DEFAULT nextval('public.proposals_review_id_seq'::regclass);


--
-- Name: proposals_statuschanges id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_statuschanges ALTER COLUMN id SET DEFAULT nextval('public.proposals_statuschanges_id_seq'::regclass);


--
-- Name: registration_category id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_category ALTER COLUMN id SET DEFAULT nextval('public.registration_category_id_seq'::regclass);


--
-- Name: registration_city id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_city ALTER COLUMN id SET DEFAULT nextval('public.registration_city_id_seq'::regclass);


--
-- Name: registration_region id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_region ALTER COLUMN id SET DEFAULT nextval('public.registration_region_id_seq'::regclass);


--
-- Name: registration_subcategory id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_subcategory ALTER COLUMN id SET DEFAULT nextval('public.registration_subcategory_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_categories id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_categories ALTER COLUMN id SET DEFAULT nextval('public.user_categories_id_seq'::regclass);


--
-- Name: user_groups id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq'::regclass);


--
-- Name: user_skills id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_skills ALTER COLUMN id SET DEFAULT nextval('public.user_skills_id_seq'::regclass);


--
-- Name: user_user_permissions id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_permissions_id_seq'::regclass);


--
-- Name: user_usertoken id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_usertoken ALTER COLUMN id SET DEFAULT nextval('public.user_usertoken_id_seq'::regclass);


--
-- Name: worker_portfolio id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.worker_portfolio ALTER COLUMN id SET DEFAULT nextval('public.worker_portfolio_id_seq'::regclass);


--
-- Name: worker_portfolioimage id; Type: DEFAULT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.worker_portfolioimage ALTER COLUMN id SET DEFAULT nextval('public.worker_portfolioimage_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add category	6	add_category
22	Can change category	6	change_category
23	Can delete category	6	delete_category
24	Can view category	6	view_category
25	Can add region	7	add_region
26	Can change region	7	change_region
27	Can delete region	7	delete_region
28	Can view region	7	view_region
29	Can add sub category	8	add_subcategory
30	Can change sub category	8	change_subcategory
31	Can delete sub category	8	delete_subcategory
32	Can view sub category	8	view_subcategory
33	Can add city	9	add_city
34	Can change city	9	change_city
35	Can delete city	9	delete_city
36	Can view city	9	view_city
37	Can add user token	10	add_usertoken
38	Can change user token	10	change_usertoken
39	Can delete user token	10	delete_usertoken
40	Can view user token	10	view_usertoken
41	Can add user	11	add_user
42	Can change user	11	change_user
43	Can delete user	11	delete_user
44	Can view user	11	view_user
45	Can add Token	12	add_token
46	Can change Token	12	change_token
47	Can delete Token	12	delete_token
48	Can view Token	12	view_token
49	Can add token	13	add_tokenproxy
50	Can change token	13	change_tokenproxy
51	Can delete token	13	delete_tokenproxy
52	Can view token	13	view_tokenproxy
53	Can add post	14	add_post
54	Can change post	14	change_post
55	Can delete post	14	delete_post
56	Can view post	14	view_post
57	Can add post image	15	add_postimage
58	Can change post image	15	change_postimage
59	Can delete post image	15	delete_postimage
60	Can view post image	15	view_postimage
61	Can add portfolio image	16	add_portfolioimage
62	Can change portfolio image	16	change_portfolioimage
63	Can delete portfolio image	16	delete_portfolioimage
64	Can view portfolio image	16	view_portfolioimage
65	Can add portfolio	17	add_portfolio
66	Can change portfolio	17	change_portfolio
67	Can delete portfolio	17	delete_portfolio
68	Can view portfolio	17	view_portfolio
69	Can add proposal	18	add_proposal
70	Can change proposal	18	change_proposal
71	Can delete proposal	18	delete_proposal
72	Can view proposal	18	view_proposal
73	Can add proposal	19	add_proposal
74	Can change proposal	19	change_proposal
75	Can delete proposal	19	delete_proposal
76	Can view proposal	19	view_proposal
77	Can add wishlist	20	add_wishlist
78	Can change wishlist	20	change_wishlist
79	Can delete wishlist	20	delete_wishlist
80	Can view wishlist	20	view_wishlist
81	Can add review	21	add_review
82	Can change review	21	change_review
83	Can delete review	21	delete_review
84	Can view review	21	view_review
85	Can add invoice	22	add_invoice
86	Can change invoice	22	change_invoice
87	Can delete invoice	22	delete_invoice
88	Can view invoice	22	view_invoice
89	Can add status changes	23	add_statuschanges
90	Can change status changes	23	change_statuschanges
91	Can delete status changes	23	delete_statuschanges
92	Can view status changes	23	view_statuschanges
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
b2c41c424a0ad58b480205cd194f1dde609efff9	2022-08-06 18:46:53.621933+05	6
b65d3412f89d9489a27f16d001085ea3baa26e70	2022-08-18 14:48:31.137833+05	48
22c8378b83762e4fe454cbec9cd287cc4de62608	2022-08-19 18:48:03.342876+05	58
43f783acd910a7fc7264b8624d2bdc86f12c212f	2022-08-20 11:34:47.090396+05	59
e88690053ddb18f892b17b2d85f865c6d065a5d9	2022-08-20 11:50:03.091393+05	60
cab708f47e6e04d18c10e258b97751989f645d01	2022-08-20 11:52:39.040487+05	61
939cfb253e57e1daf6207035fe97d069e99912f7	2022-08-20 11:54:54.794132+05	62
b2547f9c4ee2af8f69f8eeb362ff12d0c9654846	2022-08-20 12:01:48.269335+05	63
0993335e7c913aec782e7397569e9ac41a9d3e66	2022-08-20 12:03:22.4216+05	64
033e0746d728e99597c26684e462b51d05523285	2022-08-20 14:16:20.666295+05	65
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-08-16 15:14:43.28317+05	15	+998901234568	2	[{"changed": {"fields": ["Password", "Telegram", "Experience"]}}]	11	1
2	2022-08-16 15:16:02.712621+05	15	+998901234568	2	[]	11	1
3	2022-08-16 15:23:14.139892+05	6	UI Design needed	2	[{"changed": {"fields": ["Extra skills", "Is active", "Maximum project budget", "Duration"]}}]	14	1
4	2022-08-16 15:26:05.388961+05	3	UI Design needed	2	[{"changed": {"fields": ["Is active"]}}]	14	1
5	2022-08-16 15:26:12.002423+05	5	UI Design needed	2	[{"changed": {"fields": ["Is active"]}}]	14	1
6	2022-08-16 18:15:32.255744+05	6	hello	2	[{"changed": {"fields": ["Headline"]}}]	14	1
7	2022-08-16 18:15:39.790849+05	5	say	2	[{"changed": {"fields": ["Headline"]}}]	14	1
8	2022-08-16 18:15:47.045074+05	4	one more	2	[{"changed": {"fields": ["Headline"]}}]	14	1
9	2022-08-16 18:17:47.465561+05	5	say	2	[{"changed": {"fields": ["Status"]}}]	14	1
10	2022-08-16 18:17:56.490582+05	3	UI Design needed	2	[{"changed": {"fields": ["Status"]}}]	14	1
11	2022-08-16 18:18:07.110864+05	1	UI Design needed	2	[{"changed": {"fields": ["Status"]}}]	14	1
12	2022-08-16 18:18:16.592777+05	6	hello	2	[{"changed": {"fields": ["Status"]}}]	14	1
13	2022-08-16 18:20:20.340616+05	7	+998932429263	2	[{"changed": {"fields": ["First name", "Telegram"]}}]	11	1
14	2022-08-16 18:20:56.618449+05	8	+998932429264	2	[{"changed": {"fields": ["First name", "Last name", "Telegram"]}}]	11	1
15	2022-08-16 18:21:23.25549+05	6	+998932429262	2	[{"changed": {"fields": ["First name", "Telegram"]}}]	11	1
16	2022-08-17 13:24:36.237219+05	6	hello	2	[{"changed": {"fields": ["Categories"]}}]	14	1
17	2022-08-17 13:24:46.784697+05	5	say	2	[{"changed": {"fields": ["Categories"]}}]	14	1
18	2022-08-17 15:25:57.91579+05	16	+998887803635	3		11	1
19	2022-08-17 15:31:24.489465+05	6	+998932429268	2	[{"changed": {"fields": ["Username"]}}]	11	1
20	2022-08-17 15:40:52.037751+05	17	+998 88 780-36-35	3		11	1
21	2022-08-17 17:11:39.758607+05	18	+998 88 780-36-35	3		11	1
22	2022-08-17 17:18:21.163305+05	19	+998 88 780-36-35	3		11	1
23	2022-08-17 17:29:52.058495+05	20	+998 88 780-36-35	3		11	1
24	2022-08-17 17:35:06.535675+05	21	+998 88 780-36-35	3		11	1
25	2022-08-17 17:46:32.167873+05	23	+998887803635	3		11	1
26	2022-08-17 17:46:32.171198+05	22	+998 88 780-36-35	3		11	1
27	2022-08-17 17:54:43.104621+05	24	+998887803635	3		11	1
28	2022-08-17 18:00:08.002713+05	25	+998887803635	3		11	1
29	2022-08-17 18:05:42.577048+05	26	+998887803635	3		11	1
30	2022-08-17 18:08:19.685048+05	27	+998887803635	3		11	1
31	2022-08-17 18:09:44.572104+05	29	Anvar	1	[{"added": {}}]	11	1
32	2022-08-17 18:15:09.488517+05	28	+998887803635	3		11	1
33	2022-08-17 18:18:36.116323+05	30	+998887803635	3		11	1
34	2022-08-17 18:22:00.5623+05	31	+998887803635	3		11	1
35	2022-08-17 18:28:16.159875+05	32	+998887803635	3		11	1
36	2022-08-17 18:30:41.852564+05	33	+998887803635	3		11	1
37	2022-08-17 18:36:51.79352+05	35	+998887803735	3		11	1
38	2022-08-17 18:36:51.80099+05	34	+998887803635	3		11	1
39	2022-08-17 18:39:04.894466+05	37	+998887803835	3		11	1
40	2022-08-17 18:39:04.956545+05	36	+998887803635	3		11	1
41	2022-08-17 18:58:22.501684+05	38	+998887803635	3		11	1
42	2022-08-18 12:30:47.704146+05	39	+998887803635	3		11	1
43	2022-08-18 12:37:20.091727+05	8	dadada	1	[{"added": {}}]	8	1
44	2022-08-18 12:37:29.902542+05	9	aaaaa	1	[{"added": {}}]	8	1
45	2022-08-18 12:37:39.450097+05	10	ssssss	1	[{"added": {}}]	8	1
46	2022-08-18 12:37:47.050697+05	11	ssssss	1	[{"added": {}}]	8	1
47	2022-08-18 12:37:53.495209+05	12	dddd	1	[{"added": {}}]	8	1
48	2022-08-18 12:38:00.118926+05	13	ddddddfff	1	[{"added": {}}]	8	1
49	2022-08-18 12:38:06.089494+05	14	gggggg	1	[{"added": {}}]	8	1
50	2022-08-18 12:38:11.196796+05	15	hhhhh	1	[{"added": {}}]	8	1
51	2022-08-18 12:38:16.674005+05	16	uuuu	1	[{"added": {}}]	8	1
52	2022-08-18 12:38:21.92058+05	17	lllll	1	[{"added": {}}]	8	1
53	2022-08-18 12:38:27.619749+05	18	lllllll	1	[{"added": {}}]	8	1
54	2022-08-18 12:38:34.725983+05	19	shhhhh	1	[{"added": {}}]	8	1
55	2022-08-18 12:38:42.892898+05	20	shuuuuu	1	[{"added": {}}]	8	1
56	2022-08-18 12:38:49.229356+05	21	assasaa	1	[{"added": {}}]	8	1
57	2022-08-18 12:38:54.282308+05	22	aaddddd	1	[{"added": {}}]	8	1
58	2022-08-18 12:39:13.575851+05	41	+998887803635	3		11	1
59	2022-08-18 13:30:39.558339+05	42	+998887803635	3		11	1
60	2022-08-18 13:48:14.865666+05	43	+998887803635	3		11	1
61	2022-08-18 14:15:39.758635+05	44	+998887803635	3		11	1
62	2022-08-18 14:24:30.187683+05	45	+998887803635	3		11	1
63	2022-08-18 14:29:10.76427+05	46	+998887803635	3		11	1
64	2022-08-18 14:33:19.904297+05	47	+998887803635	3		11	1
65	2022-08-18 15:09:46.550801+05	48	+998887803635	2	[{"changed": {"fields": ["Telegram", "Role"]}}]	11	1
66	2022-08-18 17:24:31.573546+05	5	say	2	[{"changed": {"fields": ["Hourly from budget"]}}]	14	1
67	2022-08-18 17:31:41.751158+05	6	hello	2	[{"changed": {"fields": ["Status"]}}]	14	1
68	2022-08-18 17:31:49.071974+05	5	say	2	[{"changed": {"fields": ["Status"]}}]	14	1
69	2022-08-18 17:31:59.484756+05	4	one more	2	[{"changed": {"fields": ["Status"]}}]	14	1
70	2022-08-18 18:48:39.080392+05	10	hello | posts/photo_2022-07-23_01-51-28.jpg	1	[{"added": {}}]	15	1
71	2022-08-19 11:12:46.368061+05	2	Ddsfnafj Dhehr | say	1	[{"added": {}}]	19	1
72	2022-08-19 11:13:37.009442+05	3	Akmal Yuldashev | hello	1	[{"added": {}}]	19	1
73	2022-08-19 11:16:46.175802+05	54	Gulomjon	1	[{"added": {}}]	11	1
74	2022-08-19 11:21:47.045719+05	54	Gulomjon	2	[{"changed": {"fields": ["Avatar"]}}]	11	1
75	2022-08-19 11:41:26.762638+05	54	Gulomjon	2	[{"changed": {"fields": ["Is online"]}}]	11	1
76	2022-08-19 11:51:10.968517+05	50	+998333333333	2	[{"changed": {"fields": ["Telegram", "Is online"]}}]	11	1
77	2022-08-19 11:51:27.285195+05	52	+998222222222	2	[{"changed": {"fields": ["Telegram", "Is online"]}}]	11	1
78	2022-08-19 11:51:57.478911+05	53	+998594545454	2	[{"changed": {"fields": ["Telegram", "Is online"]}}]	11	1
79	2022-08-19 14:26:53.123675+05	48	+998887803635	2	[{"changed": {"fields": ["Role"]}}]	11	1
80	2022-08-19 18:35:49.24614+05	7	+998932429263 | 7	2	[{"changed": {"fields": ["Is online"]}}]	11	1
81	2022-08-19 18:38:35.324119+05	7	+998932429263 | 7	2	[{"changed": {"fields": ["Avatar"]}}]	11	1
82	2022-08-20 12:05:16.662314+05	3	Review object (3)	1	[{"added": {}}]	21	1
83	2022-08-20 12:09:45.158112+05	4	Sardor Saidov | comment here	1	[{"added": {}}]	21	1
84	2022-08-20 12:10:17.274446+05	5	 | Lorem ipsum — классический текст-«рыба». Является искажённым отрывком из философского трактата Марка Туллия Цицерона «О пределах добра и зла», написанного в 45 году до н. э. на латинском языке, обн	1	[{"added": {}}]	21	1
85	2022-08-20 12:12:10.696851+05	8	Sardor Saidov | Lorem ipsum — классический текст-«рыба». Является искажённым отрывком из философского трактата Марка Туллия Цицерона «О пределах добра и зла», написанного в 45 году до н. э. на латинск	1	[{"added": {}}]	21	1
86	2022-08-20 12:16:31.640144+05	9	Sardor Saidov | JA zo'r ishlamas ekan	1	[{"added": {}}]	21	1
87	2022-08-20 14:58:32.004698+05	10	Asgf Rhhr | asdfhghj	1	[{"added": {}}]	21	1
88	2022-08-20 15:08:15.852832+05	65	+998623552622 | 65	2	[{"changed": {"fields": ["Telegram", "Categories", "Skills", "Role", "Is online"]}}]	11	1
89	2022-08-20 17:24:24.941637+05	29	Anvar | 29	2	[{"changed": {"fields": ["Avatar"]}}]	11	1
90	2022-08-22 13:16:46.585736+05	69	ds | 69	1	[{"added": {}}]	11	1
91	2022-08-24 13:41:56.27593+05	7	Amila Yuldasheva | one more	2	[{"changed": {"fields": ["Admin status"]}}]	19	1
92	2022-08-24 13:42:05.852962+05	6	Diyorbek Yuldashev | one more	2	[{"changed": {"fields": ["Admin status"]}}]	19	1
93	2022-08-24 13:42:11.898307+05	5	Someone Mr | one more	2	[{"changed": {"fields": ["Admin status"]}}]	19	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	registration	category
7	registration	region
8	registration	subcategory
9	registration	city
10	user	usertoken
11	user	user
12	authtoken	token
13	authtoken	tokenproxy
14	post	post
15	post	postimage
16	worker	portfolioimage
17	worker	portfolio
18	worker	proposal
19	proposals	proposal
20	post	wishlist
21	proposals	review
22	proposals	invoice
23	proposals	statuschanges
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	registration	0001_initial	2022-08-06 15:11:40.604081+05
2	contenttypes	0001_initial	2022-08-06 15:11:40.619778+05
3	contenttypes	0002_remove_content_type_name	2022-08-06 15:11:40.634466+05
4	auth	0001_initial	2022-08-06 15:11:40.693645+05
5	auth	0002_alter_permission_name_max_length	2022-08-06 15:11:40.70298+05
6	auth	0003_alter_user_email_max_length	2022-08-06 15:11:40.712205+05
7	auth	0004_alter_user_username_opts	2022-08-06 15:11:40.720883+05
8	auth	0005_alter_user_last_login_null	2022-08-06 15:11:40.729198+05
9	auth	0006_require_contenttypes_0002	2022-08-06 15:11:40.732038+05
10	auth	0007_alter_validators_add_error_messages	2022-08-06 15:11:40.742252+05
11	auth	0008_alter_user_username_max_length	2022-08-06 15:11:40.751305+05
12	auth	0009_alter_user_last_name_max_length	2022-08-06 15:11:40.761496+05
13	auth	0010_alter_group_name_max_length	2022-08-06 15:11:40.769944+05
14	auth	0011_update_proxy_permissions	2022-08-06 15:11:40.783983+05
15	auth	0012_alter_user_first_name_max_length	2022-08-06 15:11:40.791376+05
16	user	0001_initial	2022-08-06 15:11:40.885943+05
17	admin	0001_initial	2022-08-06 15:11:40.917201+05
18	admin	0002_logentry_remove_auto_add	2022-08-06 15:11:40.930305+05
19	admin	0003_logentry_add_action_flag_choices	2022-08-06 15:11:40.945726+05
20	authtoken	0001_initial	2022-08-06 15:11:40.975593+05
21	authtoken	0002_auto_20160226_1747	2022-08-06 15:11:41.022883+05
22	authtoken	0003_tokenproxy	2022-08-06 15:11:41.029007+05
23	sessions	0001_initial	2022-08-06 15:11:41.045935+05
24	user	0002_alter_user_skills	2022-08-06 15:11:41.066874+05
25	user	0003_alter_user_password	2022-08-06 15:16:10.688226+05
26	user	0004_user_street	2022-08-06 17:44:34.628336+05
27	user	0005_rename_create_at_user_created_at_and_more	2022-08-06 17:51:58.146709+05
28	registration	0002_category_image_category_status	2022-08-06 18:37:38.039012+05
29	user	0006_alter_user_password	2022-08-06 19:33:14.357265+05
30	user	0007_rename_projects_user_overview_and_more	2022-08-06 19:44:44.375848+05
31	post	0001_initial	2022-08-15 13:21:14.988678+05
32	post	0002_post_is_delete	2022-08-15 15:16:30.049942+05
33	post	0003_post_address_post_categories_post_is_active	2022-08-15 16:40:00.6518+05
34	post	0004_remove_post_file_postimage	2022-08-15 16:56:10.317322+05
35	user	0008_user_is_delete	2022-08-15 17:44:06.49984+05
36	user	0009_user_total_earnings_user_total_spent	2022-08-15 18:23:31.84754+05
37	user	0010_user_telegram	2022-08-15 18:47:13.24252+05
38	worker	0001_initial	2022-08-15 19:03:57.912715+05
39	worker	0002_proposal	2022-08-16 12:05:05.673144+05
40	worker	0003_proposal_status	2022-08-16 12:16:46.079885+05
41	post	0005_post_duration	2022-08-16 15:11:33.076016+05
42	user	0011_user_experience	2022-08-16 15:11:33.125487+05
43	post	0006_alter_post_address_alter_post_description_and_more	2022-08-16 15:25:51.632353+05
44	user	0012_alter_user_avatar_alter_user_city_and_more	2022-08-16 15:25:51.918765+05
45	proposals	0001_initial	2022-08-16 16:07:03.69002+05
46	worker	0004_delete_proposal	2022-08-16 16:07:03.698116+05
47	post	0007_post_status	2022-08-16 16:50:31.757615+05
48	registration	0003_alter_category_image	2022-08-17 14:24:35.120317+05
49	user	0013_alter_user_phone_number	2022-08-17 15:25:31.10782+05
50	post	0008_wishlist	2022-08-17 15:40:38.434852+05
51	proposals	0002_remove_proposal_status_proposal_admin_status_and_more	2022-08-17 16:36:07.387801+05
52	user	0014_user_categories	2022-08-18 12:07:21.287264+05
53	proposals	0003_review	2022-08-18 14:15:23.058195+05
54	proposals	0004_review_rate_alter_review_comment	2022-08-18 14:23:01.068373+05
55	post	0009_post_is_new	2022-08-18 14:47:54.364104+05
56	proposals	0005_proposal_is_new	2022-08-18 14:47:54.437954+05
57	user	0015_user_is_new	2022-08-18 14:47:54.50226+05
58	worker	0005_portfolio_is_new	2022-08-18 14:47:54.557447+05
59	post	0010_alter_post_status	2022-08-19 11:26:28.573576+05
60	user	0016_user_is_online	2022-08-19 11:29:46.437775+05
61	worker	0006_portfolio_status	2022-08-19 15:32:00.77404+05
62	proposals	0006_review_is_for_post_alter_review_rate	2022-08-20 11:40:16.065115+05
63	proposals	0007_rename_is_for_post_review_is_client	2022-08-20 11:55:09.246189+05
64	proposals	0008_invoice	2022-08-22 10:50:09.555478+05
65	proposals	0009_invoice_date_alter_invoice_card	2022-08-22 11:03:26.479021+05
66	proposals	0010_alter_invoice_date	2022-08-22 11:08:43.239287+05
67	user	0017_user_balance	2022-08-22 11:15:03.224431+05
68	post	0011_alter_postimage_image	2022-08-22 16:46:03.332892+05
69	worker	0007_alter_portfolio_date	2022-08-23 13:31:33.138471+05
70	proposals	0011_statuschanges	2022-08-24 15:13:52.367439+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
4ji99mxdclxu46pzhuv9bs3i9p47hguh	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oNtYa:91dNPypE9pRtjH13_-uej_Bc2hn3yXQUoC8Tkoy5ESQ	2022-08-30 15:12:20.26855+05
5qrdbwkkbuuj6egawjp1icaa5kyg9yu5	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oNtiD:FWkC68EVmNxd6AnU77IaZjQg9IE-W08-7heIZPlDHTY	2022-08-30 15:22:17.762992+05
6p97pw6acvflwx93ubbd4atgkguv4ln6	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oOELR:uBo0_eqdQpBA9rulk8bZtosh2Q5YdX0cKa-dfzYTNPc	2022-08-31 13:24:09.687547+05
bori9cd26yj52m915r1ik3fhxaxvgmbf	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oOHsV:4Th-p6v15ghWY_b2pbqtlL2QWFYrJlPT8rnxrFm-pGw	2022-08-31 17:10:31.974168+05
3el95zl81xr52grrael8v9xbchsek7i3	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oOegM:iEbqxUfWYgbDSM0xDpwgwWnLuBXFcNcg2nyBSSFB5z8	2022-09-01 17:31:30.743756+05
yhsl0476k82o80x1dl4vm7hzaj1c8tzm	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oOuz0:gv52cp0TNnf7viY1a6vvDINmX_G9DZaNITlr-C2j_Hc	2022-09-02 10:55:50.14257+05
95rwcw12x8c2w4ozsnddxwnx8hhwyjx6	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oQ1e9:EYHNr1r4fIJbfbjTM8W20mn8mBohkYBu_gjqpveUJfI	2022-09-05 12:14:53.204084+05
\.


--
-- Data for Name: post_post; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_post (id, created_at, updated_at, headline, extra_skills, is_hourly, hourly_from_budget, hourly_to_budget, maximum_project_budget, description, latitude, longitude, user_id, is_delete, address, is_active, duration, status, is_new) FROM stdin;
2	2022-08-15 16:57:52.734377+05	2022-08-15 17:18:55.397303+05	UI Design needed	2	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	t	Tashkent viloyati	f	\N	sent	t
3	2022-08-15 17:01:34.6106+05	2022-08-16 18:17:56.479993+05	UI Design needed	2	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	t	\N	going	t
5	2022-08-15 17:04:44.049612+05	2022-08-22 11:41:29.489755+05	say	\N	t	70000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	t	\N	going	t
1	2022-08-15 16:44:52.565448+05	2022-08-16 18:18:07.104934+05	UI Design needed	2	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	finished	t
8	2022-08-22 13:38:33.853034+05	2022-08-22 13:38:33.853072+05	Ggg	\N	t	55555	33333	\N	Geegeg	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
4	2022-08-15 17:02:08.298627+05	2022-08-18 17:31:59.476037+05	one more	\N	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	approved	t
9	2022-08-22 14:54:40.476422+05	2022-08-22 14:54:40.476452+05	G	\N	t	45	88	\N	Fr	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
18	2022-08-22 16:27:48.370487+05	2022-08-22 16:27:48.370586+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
7	2022-08-20 10:38:19.165316+05	2022-08-20 10:38:19.165548+05	UI Design needed	\N	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	sent	f
6	2022-08-15 17:05:02.640643+05	2022-08-18 17:31:41.741078+05	hello	as	t	50000	100000	150000	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	t	2	approved	t
10	2022-08-22 15:00:20.965869+05	2022-08-22 15:00:20.9659+05	Rg	\N	t	45	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
11	2022-08-22 15:01:49.975108+05	2022-08-22 15:01:49.975139+05	Rg	\N	t	45	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
12	2022-08-22 15:54:47.751338+05	2022-08-22 15:54:47.751367+05	G	\N	t	5	2	\N	G	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
13	2022-08-22 16:10:43.246161+05	2022-08-22 16:10:43.246192+05	Ft	\N	t	5	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
14	2022-08-22 16:12:21.081772+05	2022-08-22 16:12:21.081804+05	Ft	\N	t	5	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
15	2022-08-22 16:13:21.690776+05	2022-08-22 16:13:21.690801+05	Ft	\N	t	5	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
16	2022-08-22 16:13:26.738385+05	2022-08-22 16:13:26.738418+05	Ft	\N	t	5	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
17	2022-08-22 16:17:29.690744+05	2022-08-22 16:17:29.690773+05	Er	\N	t	99	99	\N	Jh	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
19	2022-08-22 16:27:48.372185+05	2022-08-22 16:27:48.372206+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
20	2022-08-22 16:27:49.871814+05	2022-08-22 16:27:49.871845+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
21	2022-08-22 16:27:50.263038+05	2022-08-22 16:27:50.263068+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
22	2022-08-22 16:27:50.308872+05	2022-08-22 16:27:50.308901+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
23	2022-08-22 16:27:50.462514+05	2022-08-22 16:27:50.462551+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
24	2022-08-22 16:27:50.688395+05	2022-08-22 16:27:50.688428+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
25	2022-08-22 16:27:50.79325+05	2022-08-22 16:27:50.793275+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
26	2022-08-22 16:27:52.47171+05	2022-08-22 16:27:52.471734+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
27	2022-08-22 16:28:23.333187+05	2022-08-22 16:28:23.333211+05	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
28	2022-08-22 16:34:40.680486+05	2022-08-22 16:34:40.680511+05	D	\N	t	55	556	\N	D	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
29	2022-08-22 16:36:12.941375+05	2022-08-22 16:36:12.941401+05	D	\N	t	55	556	\N	D	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
30	2022-08-22 16:36:58.236149+05	2022-08-22 16:36:58.2362+05	D	\N	t	55	556	\N	D	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
31	2022-08-22 16:39:23.071751+05	2022-08-22 16:39:23.071784+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
32	2022-08-22 16:39:34.037464+05	2022-08-22 16:39:34.037492+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
33	2022-08-22 16:40:22.204441+05	2022-08-22 16:40:22.204475+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
34	2022-08-22 16:43:25.255418+05	2022-08-22 16:43:25.255446+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
35	2022-08-22 16:46:18.472727+05	2022-08-22 16:46:18.472755+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
36	2022-08-22 16:49:01.855766+05	2022-08-22 16:49:01.855859+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
37	2022-08-22 16:51:08.196014+05	2022-08-22 16:51:08.196037+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
38	2022-08-22 16:57:04.313915+05	2022-08-22 16:57:04.313953+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
39	2022-08-22 16:57:19.709271+05	2022-08-22 16:57:19.709297+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
40	2022-08-22 16:57:53.292619+05	2022-08-22 16:57:53.292654+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
41	2022-08-22 16:58:31.302699+05	2022-08-22 16:58:31.302723+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
42	2022-08-22 16:59:58.798947+05	2022-08-22 16:59:58.799038+05	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
43	2022-08-22 17:01:24.705252+05	2022-08-22 17:01:24.705287+05	UI Design needed	\N	t	50000	100000	0	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	sent	f
44	2022-08-22 17:02:57.119867+05	2022-08-22 17:02:57.120287+05	UI Design needed	\N	t	50000	100000	0	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	sent	f
\.


--
-- Data for Name: post_post_categories; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_post_categories (id, post_id, category_id) FROM stdin;
1	4	2
2	5	2
4	6	1
5	6	4
6	5	1
7	7	2
8	8	3
9	8	4
10	8	5
11	9	2
12	9	3
13	9	4
14	10	2
15	10	3
16	11	2
17	11	3
18	12	2
19	12	3
20	12	4
21	13	2
22	13	3
23	13	4
24	13	5
25	14	2
26	14	3
27	14	4
28	14	5
29	15	2
30	15	3
31	15	4
32	15	5
33	16	2
34	16	3
35	16	4
36	16	5
37	17	2
38	17	3
39	17	4
40	17	5
41	18	2
42	18	3
43	18	4
44	18	5
45	19	2
46	19	3
47	19	4
48	19	5
49	20	2
50	20	3
51	20	4
52	20	5
53	21	2
54	21	3
55	21	4
56	21	5
57	22	2
58	22	3
59	22	4
60	22	5
61	23	2
62	23	3
63	23	4
64	23	5
65	24	2
66	24	3
67	24	4
68	24	5
69	25	2
70	25	3
71	25	4
72	25	5
73	26	2
74	26	3
75	26	4
76	26	5
77	27	2
78	27	3
79	27	4
80	27	5
81	28	3
82	28	4
83	29	3
84	29	4
85	30	3
86	30	4
87	31	2
88	31	3
89	31	4
90	32	2
91	32	3
92	32	4
93	33	2
94	33	3
95	33	4
96	34	2
97	34	3
98	34	4
99	35	2
100	35	3
101	35	4
102	36	2
103	36	3
104	36	4
105	37	2
106	37	3
107	37	4
108	38	2
109	38	3
110	38	4
111	39	2
112	39	3
113	39	4
114	40	2
115	40	3
116	40	4
117	41	2
118	41	3
119	41	4
120	42	2
121	42	3
122	42	4
123	43	2
124	44	2
\.


--
-- Data for Name: post_post_skills; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_post_skills (id, post_id, subcategory_id) FROM stdin;
1	4	2
2	4	3
3	5	2
4	5	3
5	6	2
6	6	3
7	7	2
8	7	3
9	8	7
10	8	12
11	8	13
12	8	14
13	8	16
14	8	26
15	9	16
16	9	26
17	9	13
18	10	16
19	10	26
20	10	7
21	11	16
22	11	26
23	11	7
24	12	16
25	12	26
26	12	13
27	12	7
28	13	7
29	13	13
30	13	14
31	13	16
32	13	26
33	14	7
34	14	13
35	14	14
36	14	16
37	14	26
38	15	7
39	15	13
40	15	14
41	15	16
42	15	26
43	16	7
44	16	13
45	16	14
46	16	16
47	16	26
48	17	7
49	17	9
50	17	13
51	17	14
52	17	16
53	17	26
54	18	7
56	18	9
55	19	7
57	19	9
58	19	13
59	19	14
60	18	13
61	19	16
62	18	14
63	18	16
64	19	26
65	18	26
66	20	7
67	20	9
68	20	13
69	20	14
70	20	16
71	20	26
72	21	7
73	21	9
74	21	13
75	21	14
76	21	16
77	21	26
78	22	7
79	22	9
80	22	13
81	22	14
82	22	16
83	22	26
84	23	7
85	23	9
86	23	13
87	23	14
88	23	16
89	23	26
90	24	7
91	24	9
92	24	13
93	24	14
94	24	16
95	24	26
96	25	7
97	25	9
98	25	13
99	25	14
100	25	16
101	25	26
102	26	7
103	26	9
104	26	13
105	26	14
106	26	16
107	26	26
108	27	7
109	27	9
110	27	13
111	27	14
112	27	16
113	27	26
114	28	7
115	29	7
116	30	7
117	31	9
118	31	7
119	32	9
120	32	7
121	33	9
122	33	7
123	34	9
124	34	7
125	35	9
126	35	7
127	36	9
128	36	7
129	37	9
130	37	7
131	38	9
132	38	7
133	39	9
134	39	7
135	40	9
136	40	7
137	41	9
138	41	7
139	42	9
140	42	7
141	43	2
142	43	3
143	44	2
144	44	3
\.


--
-- Data for Name: post_postimage; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_postimage (id, created_at, updated_at, image, post_id) FROM stdin;
1	2022-08-15 17:05:02.662528+05	2022-08-15 17:05:02.662562+05	posts/Screenshot_from_2022-08-14_22-19-40.png	6
2	2022-08-15 17:05:02.667339+05	2022-08-15 17:05:02.667365+05	posts/Screenshot_from_2022-08-13_22-07-53.png	6
3	2022-08-15 17:05:02.670388+05	2022-08-15 17:05:02.670409+05	posts/Screenshot_from_2022-08-08_09-23-38.png	6
4	2022-08-15 17:05:02.675345+05	2022-08-15 17:05:02.675366+05	posts/Screenshot_from_2022-07-24_14-57-04.png	6
5	2022-08-16 14:44:57.282872+05	2022-08-16 14:44:57.282903+05	posts/Screenshot_from_2022-08-03_18-01-03.png	4
6	2022-08-16 14:45:00.808116+05	2022-08-16 14:45:00.80821+05	posts/Screenshot_from_2022-08-03_18-01-03_qJ5FTcH.png	4
7	2022-08-16 14:45:02.008476+05	2022-08-16 14:45:02.008514+05	posts/Screenshot_from_2022-08-03_18-01-03_MDVbyb4.png	4
8	2022-08-16 14:45:03.341083+05	2022-08-16 14:45:03.341104+05	posts/Screenshot_from_2022-08-03_18-01-03_AnlAeAO.png	4
9	2022-08-16 14:45:04.419362+05	2022-08-16 14:45:04.419384+05	posts/Screenshot_from_2022-08-03_18-01-03_igb0huw.png	4
10	2022-08-18 18:48:39.072591+05	2022-08-18 18:48:39.072617+05	posts/photo_2022-07-23_01-51-28.jpg	6
11	2022-08-22 16:36:58.500852+05	2022-08-22 16:36:58.500878+05	some_image.jpg	30
12	2022-08-22 16:39:35.485235+05	2022-08-22 16:39:35.485273+05	media/posts/some_image2022-08-22 11:39:35.476559+00:00.jpg	32
13	2022-08-22 16:57:19.732931+05	2022-08-22 16:57:19.732955+05	posts/image_name.jpg	39
14	2022-08-22 16:57:53.314403+05	2022-08-22 16:57:53.314428+05	posts/image_name_hQFQmkn.jpg	40
15	2022-08-22 16:58:31.333464+05	2022-08-22 16:58:31.333493+05	posts/image_name_nArBEAU.jpg	41
16	2022-08-22 17:00:01.1138+05	2022-08-22 17:00:01.113825+05	posts/image_name_h8N3Mwf.jpg	42
\.


--
-- Data for Name: post_wishlist; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_wishlist (id, created_at, updated_at, is_like, post_id, user_id) FROM stdin;
2	2022-08-17 15:51:20.616823+05	2022-08-17 15:51:35.612834+05	f	\N	9
1	2022-08-17 15:50:56.951712+05	2022-08-17 15:54:30.739259+05	f	3	9
\.


--
-- Data for Name: proposals_invoice; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.proposals_invoice (id, created_at, updated_at, card, is_withdraw, amount, user_id, date) FROM stdin;
2	2022-08-22 11:09:04.544733+05	2022-08-22 11:09:04.544767+05	9860350109483742	f	50000	6	0227
3	2022-08-22 11:17:39.993883+05	2022-08-22 11:17:39.993915+05	9860350109483742	f	50000	6	0227
4	2022-08-22 11:18:04.619868+05	2022-08-22 11:18:04.619951+05	9860350109483742	f	50000	6	0227
5	2022-08-22 12:32:48.314911+05	2022-08-22 12:32:48.314939+05	9860350109483742	f	50000	6	0227
6	2022-08-22 12:33:12.480304+05	2022-08-22 12:33:12.480333+05	\N	t	5000	6	\N
\.


--
-- Data for Name: proposals_proposal; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.proposals_proposal (id, created_at, updated_at, description, price, post_id, user_id, admin_status, client_status, is_new) FROM stdin;
1	2022-08-16 16:57:47.319654+05	2022-08-16 17:16:28.099086+05	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	2	9	pending	pending	t
3	2022-08-19 11:13:37.005201+05	2022-08-19 11:13:37.005236+05	there are some descriptions here.	500000	6	7	approved	approved	t
4	2022-08-22 12:05:40.179215+05	2022-08-22 12:05:40.179243+05	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	2	6	pending	pending	f
7	2022-08-24 13:39:23.985035+05	2022-08-24 13:41:56.272928+05	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	4	8	approved	pending	f
6	2022-08-24 13:39:15.251924+05	2022-08-24 13:42:05.847483+05	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	4	6	approved	pending	f
2	2022-08-19 11:12:46.364087+05	2022-08-24 15:35:17.042007+05	desc here	120000	5	53	approved	archived	t
5	2022-08-24 13:39:08.679737+05	2022-08-24 15:44:32.126136+05	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	4	9	approved	archived	f
\.


--
-- Data for Name: proposals_review; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.proposals_review (id, created_at, updated_at, comment, post_id, user_id, rate, is_client) FROM stdin;
1	2022-08-19 16:15:23.386862+05	2022-08-19 16:15:23.386892+05	Ish yaxshi bo'ldi	3	9	0	t
2	2022-08-19 16:15:42.737064+05	2022-08-19 16:15:42.737087+05	Ish yaxshi bo'ldi	4	6	5	t
3	2022-08-20 12:05:16.656399+05	2022-08-20 12:05:16.656426+05	Shunaqa Gaplar	3	50	5	f
4	2022-08-20 12:09:45.1547+05	2022-08-20 12:09:45.154821+05	comment here	5	54	5	t
5	2022-08-20 12:10:17.272803+05	2022-08-20 12:10:17.272833+05	Lorem ipsum — классический текст-«рыба». Является искажённым отрывком из философского трактата Марка Туллия Цицерона «О пределах добра и зла», написанного в 45 году до н. э. на латинском языке, обнаружение сходства	1	57	3	f
6	2022-08-20 12:10:33.219062+05	2022-08-20 12:10:33.219172+05	Ish yaxshi bo'ldi	4	6	5	t
7	2022-08-20 12:10:49.563933+05	2022-08-20 12:10:49.563957+05	Ish yaxshi bo'ldi	4	6	5	f
8	2022-08-20 12:12:10.695459+05	2022-08-20 12:12:10.695486+05	Lorem ipsum — классический текст-«рыба». Является искажённым отрывком из философского трактата Марка Туллия Цицерона «О пределах добра и зла», написанного в 45 году до н. э. на латинском языке, обнаружение сходства	7	54	2	t
9	2022-08-20 12:16:31.637861+05	2022-08-20 12:16:31.637885+05	JA zo'r ishlamas ekan	1	54	3	t
10	2022-08-20 14:58:32.001485+05	2022-08-20 14:58:32.001522+05	asdfhghj	3	52	5	t
\.


--
-- Data for Name: proposals_statuschanges; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.proposals_statuschanges (id, from_status, to_status, is_post, post_id, proposal_id, user_id) FROM stdin;
\.


--
-- Data for Name: registration_category; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.registration_category (id, created_at, updated_at, name, image, status) FROM stdin;
2	2022-08-06 18:38:49.193262+05	2022-08-06 18:38:49.193289+05	Santexnika	category/Screenshot_from_2022-07-21_18-27-11.png	active
1	2022-08-06 15:31:37.76837+05	2022-08-06 18:39:07.214385+05	Qurilish	category/Screenshot_from_2022-07-20_10-58-44.png	active
3	2022-08-06 19:21:44.463287+05	2022-08-06 19:21:44.463325+05	Usta	category/Screenshot_from_2022-07-21_18-27-11_mMhScYt.png	active
4	2022-08-16 14:17:55.318194+05	2022-08-16 14:17:55.318223+05	Usta		active
5	2022-08-17 14:13:38.223211+05	2022-08-17 14:13:38.223244+05	Oynachi		active
6	2022-08-17 14:14:37.558862+05	2022-08-17 14:14:37.55889+05	taxtachi		active
12	2022-08-17 14:25:40.97316+05	2022-08-17 14:25:40.973272+05	as	category/so-h-align-left.svg	active
11	2022-08-17 14:24:40.774916+05	2022-08-18 13:52:42.217803+05	Shuvoqchi2	category/so-folder-structure.svg	active
7	2022-08-17 14:15:31.331337+05	2022-08-18 13:53:03.932405+05	Usta2	category/so-pen-tool.svg	active
8	2022-08-17 14:15:55.611395+05	2022-08-18 14:06:15.860289+05	Loykashbek	category/so-cube.svg	active
9	2022-08-17 14:17:29.179808+05	2022-08-18 14:14:18.918653+05	Loy	category/img.png	active
10	2022-08-17 14:20:40.80607+05	2022-08-18 14:14:45.847857+05	Shuvoqchi	category/so-brush.svg	active
15	2022-08-19 12:32:12.246894+05	2022-08-19 12:32:12.246922+05	NEW KATEGORY	category/so-braidshirt.svg	active
14	2022-08-19 12:31:24.765612+05	2022-08-19 15:59:19.730077+05	yangi kategoriya shekilli	category/img_r5v41ps.svg	active
13	2022-08-17 14:27:51.414365+05	2022-08-19 15:59:31.391589+05	narmalna	category/img_sd3ePPE.svg	active
16	2022-08-19 16:00:37.875855+05	2022-08-19 16:00:37.875891+05	Bugalter	category/so-toll.svg	active
17	2022-08-19 16:04:26.403062+05	2022-08-19 16:04:26.403096+05	lol	category/so-qr-code.svg	active
18	2022-08-19 16:06:35.338676+05	2022-08-19 16:06:35.338707+05	soldier	category/so-description.svg	active
19	2022-08-19 16:07:09.782656+05	2022-08-19 16:07:09.782688+05	asal	category/so-seo.svg	active
20	2022-08-19 16:08:29.555682+05	2022-08-19 16:08:29.555713+05	categorr19	category/so-workflow.svg	active
21	2022-08-19 16:09:05.245357+05	2022-08-19 16:09:05.245393+05	lol 2	category/so-select-all.svg	active
\.


--
-- Data for Name: registration_city; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.registration_city (id, created_at, updated_at, name, region_id) FROM stdin;
15	2022-08-06 16:07:27.510987+05	2022-08-06 16:07:27.511027+05	Amudaryo tumani	1
16	2022-08-06 16:07:27.807873+05	2022-08-06 16:07:27.8079+05	Beruniy tumani	1
17	2022-08-06 16:07:27.814047+05	2022-08-06 16:07:27.814078+05	Kegayli tumani	1
18	2022-08-06 16:07:27.819972+05	2022-08-06 16:07:27.819999+05	Qonliko‘l tumani	1
19	2022-08-06 16:07:27.823756+05	2022-08-06 16:07:27.823779+05	Qorao‘zak tumani	1
20	2022-08-06 16:07:27.826352+05	2022-08-06 16:07:27.826375+05	Qo‘ng‘irot tumani	1
21	2022-08-06 16:07:27.829165+05	2022-08-06 16:07:27.829191+05	Mo‘ynoq tumani	1
22	2022-08-06 16:07:27.831606+05	2022-08-06 16:07:27.83163+05	Nukus tumani	1
23	2022-08-06 16:07:27.834184+05	2022-08-06 16:07:27.834206+05	Nukus shahri	1
24	2022-08-06 16:07:27.839915+05	2022-08-06 16:07:27.839939+05	Taxtako‘pir tumani	1
25	2022-08-06 16:07:27.843561+05	2022-08-06 16:07:27.843586+05	To‘rtko‘l tumani	1
26	2022-08-06 16:07:27.845774+05	2022-08-06 16:07:27.845797+05	Xo‘jayli tumani	1
27	2022-08-06 16:07:27.848552+05	2022-08-06 16:07:27.848575+05	Chimboy tumani	1
28	2022-08-06 16:07:27.85109+05	2022-08-06 16:07:27.851113+05	Shumanay tumani	1
29	2022-08-06 16:07:27.854402+05	2022-08-06 16:07:27.854431+05	Ellikqal‘a tumani	1
30	2022-08-06 16:07:27.858721+05	2022-08-06 16:07:27.858746+05	Andijon shahri	2
31	2022-08-06 16:07:27.861436+05	2022-08-06 16:07:27.86146+05	Andijon tumani	2
32	2022-08-06 16:07:27.86428+05	2022-08-06 16:07:27.864308+05	Asaka tumani	2
33	2022-08-06 16:07:27.869481+05	2022-08-06 16:07:27.869506+05	Baliqchi tumani	2
34	2022-08-06 16:07:27.871993+05	2022-08-06 16:07:27.872017+05	Buloqboshi tumani	2
35	2022-08-06 16:07:27.875588+05	2022-08-06 16:07:27.875613+05	Bo‘z tumani	2
36	2022-08-06 16:07:27.878765+05	2022-08-06 16:07:27.878789+05	Jalaquduq tumani	2
37	2022-08-06 16:07:27.88198+05	2022-08-06 16:07:27.882006+05	Izbosgan tumani	2
38	2022-08-06 16:07:27.888078+05	2022-08-06 16:07:27.888105+05	Qorasuv shahri	2
39	2022-08-06 16:07:27.894248+05	2022-08-06 16:07:27.894273+05	Qo‘rg‘ontepa tumani	2
40	2022-08-06 16:07:27.897144+05	2022-08-06 16:07:27.897172+05	Marhamat tumani	2
41	2022-08-06 16:07:27.900242+05	2022-08-06 16:07:27.900268+05	Oltinko‘l tumani	2
42	2022-08-06 16:07:27.905133+05	2022-08-06 16:07:27.905162+05	Paxtaobod tumani	2
43	2022-08-06 16:07:27.907976+05	2022-08-06 16:07:27.908002+05	Ulug‘nor tumani	2
44	2022-08-06 16:07:27.911453+05	2022-08-06 16:07:27.911478+05	Xonabod tumani	2
45	2022-08-06 16:07:27.915584+05	2022-08-06 16:07:27.915608+05	Xo‘jaobod tumani	2
46	2022-08-06 16:07:27.92023+05	2022-08-06 16:07:27.920258+05	Shahrixon tumani	2
47	2022-08-06 16:07:27.924017+05	2022-08-06 16:07:27.924041+05	Buxoro shahri	3
48	2022-08-06 16:07:27.926883+05	2022-08-06 16:07:27.926908+05	Buxoro tumani	3
49	2022-08-06 16:07:27.931218+05	2022-08-06 16:07:27.931246+05	Vobkent tumani	3
50	2022-08-06 16:07:27.934396+05	2022-08-06 16:07:27.93442+05	G‘ijduvon tumani	3
51	2022-08-06 16:07:27.938417+05	2022-08-06 16:07:27.938441+05	Jondor tumani	3
52	2022-08-06 16:07:27.941218+05	2022-08-06 16:07:27.941245+05	Kogon tumani	3
53	2022-08-06 16:07:27.944267+05	2022-08-06 16:07:27.944291+05	Kogon shahri	3
54	2022-08-06 16:07:27.947941+05	2022-08-06 16:07:27.947968+05	Qorako‘l tumani	3
55	2022-08-06 16:07:27.95065+05	2022-08-06 16:07:27.950695+05	Qorovulbozor tumani	3
56	2022-08-06 16:07:27.954617+05	2022-08-06 16:07:27.954641+05	Olot tumani	3
57	2022-08-06 16:07:27.958073+05	2022-08-06 16:07:27.958099+05	Peshku tumani	3
58	2022-08-06 16:07:27.960604+05	2022-08-06 16:07:27.96063+05	Romitan tumani	3
59	2022-08-06 16:07:27.965493+05	2022-08-06 16:07:27.965518+05	Shofirkon tumani	3
60	2022-08-06 16:07:27.968481+05	2022-08-06 16:07:27.968503+05	Arnasoy tumani	4
61	2022-08-06 16:07:27.971399+05	2022-08-06 16:07:27.971425+05	Baxmal tumani	4
62	2022-08-06 16:07:27.974769+05	2022-08-06 16:07:27.974796+05	G‘allaorol tumani	4
63	2022-08-06 16:07:27.977461+05	2022-08-06 16:07:27.977485+05	Do‘stlik tumani	4
64	2022-08-06 16:07:27.98162+05	2022-08-06 16:07:27.981645+05	Sh.Rashidov tumani	4
65	2022-08-06 16:07:27.991059+05	2022-08-06 16:07:27.991082+05	Jizzax shahri	4
66	2022-08-06 16:07:27.995355+05	2022-08-06 16:07:27.99538+05	Zarbdor tumani	4
67	2022-08-06 16:07:27.998746+05	2022-08-06 16:07:27.998776+05	Zafarobod tumani	4
68	2022-08-06 16:07:28.005891+05	2022-08-06 16:07:28.005918+05	Zomin tumani	4
69	2022-08-06 16:07:28.01546+05	2022-08-06 16:07:28.015487+05	Mirzacho‘l tumani	4
70	2022-08-06 16:07:28.020376+05	2022-08-06 16:07:28.020405+05	Paxtakor tumani	4
71	2022-08-06 16:07:28.030906+05	2022-08-06 16:07:28.030953+05	Forish tumani	4
72	2022-08-06 16:07:28.034458+05	2022-08-06 16:07:28.034487+05	Yangiobod tumani	4
73	2022-08-06 16:07:28.039233+05	2022-08-06 16:07:28.039259+05	G‘uzor tumani	5
74	2022-08-06 16:07:28.044005+05	2022-08-06 16:07:28.044031+05	Dehqonobod tumani	5
75	2022-08-06 16:07:28.049667+05	2022-08-06 16:07:28.049694+05	Qamashi tumani	5
76	2022-08-06 16:07:28.053853+05	2022-08-06 16:07:28.053886+05	Qarshi tumani	5
77	2022-08-06 16:07:28.060928+05	2022-08-06 16:07:28.060954+05	Qarshi shahri	5
78	2022-08-06 16:07:28.07178+05	2022-08-06 16:07:28.071809+05	Kasbi tumani	5
79	2022-08-06 16:07:28.075217+05	2022-08-06 16:07:28.075245+05	Kitob tumani	5
80	2022-08-06 16:07:28.088065+05	2022-08-06 16:07:28.088093+05	Koson tumani	5
81	2022-08-06 16:07:28.094239+05	2022-08-06 16:07:28.094264+05	Mirishkor tumani	5
82	2022-08-06 16:07:28.097908+05	2022-08-06 16:07:28.097932+05	Muborak tumani	5
83	2022-08-06 16:07:28.104322+05	2022-08-06 16:07:28.104347+05	Nishon tumani	5
84	2022-08-06 16:07:28.106981+05	2022-08-06 16:07:28.107003+05	Chiroqchi tumani	5
85	2022-08-06 16:07:28.111906+05	2022-08-06 16:07:28.111929+05	Shahrisabz tumani	5
86	2022-08-06 16:07:28.116767+05	2022-08-06 16:07:28.116789+05	Yakkabog‘ tumani	5
87	2022-08-06 16:07:28.12614+05	2022-08-06 16:07:28.126164+05	Zarafshon shahri	6
88	2022-08-06 16:07:28.13149+05	2022-08-06 16:07:28.131518+05	Karmana tumani	6
89	2022-08-06 16:07:28.1383+05	2022-08-06 16:07:28.138326+05	Qiziltepa tumani	6
90	2022-08-06 16:07:28.144236+05	2022-08-06 16:07:28.144259+05	Konimex tumani	6
91	2022-08-06 16:07:28.148171+05	2022-08-06 16:07:28.148195+05	Navbahor tumani	6
92	2022-08-06 16:07:28.152004+05	2022-08-06 16:07:28.15203+05	Navoiy shahri	6
93	2022-08-06 16:07:28.164738+05	2022-08-06 16:07:28.164762+05	Nurota tumani	6
94	2022-08-06 16:07:28.169644+05	2022-08-06 16:07:28.16967+05	Tomdi tumani	6
95	2022-08-06 16:07:28.174268+05	2022-08-06 16:07:28.174293+05	Uchquduq tumani	6
96	2022-08-06 16:07:28.180879+05	2022-08-06 16:07:28.180909+05	Xatirchi tumani	6
97	2022-08-06 16:07:28.184372+05	2022-08-06 16:07:28.184396+05	Kosonsoy tumani	7
98	2022-08-06 16:07:28.187329+05	2022-08-06 16:07:28.18736+05	Mingbuloq tumani	7
99	2022-08-06 16:07:28.195027+05	2022-08-06 16:07:28.195054+05	Namangan tumani	7
100	2022-08-06 16:07:28.200023+05	2022-08-06 16:07:28.200046+05	Namangan shahri	7
101	2022-08-06 16:07:28.205507+05	2022-08-06 16:07:28.205534+05	Norin tumani	7
102	2022-08-06 16:07:28.210537+05	2022-08-06 16:07:28.210565+05	Pop tumani	7
103	2022-08-06 16:07:28.223181+05	2022-08-06 16:07:28.223208+05	To‘raqo‘rg‘on tumani	7
104	2022-08-06 16:07:28.226612+05	2022-08-06 16:07:28.226636+05	Uychi tumani	7
105	2022-08-06 16:07:28.231306+05	2022-08-06 16:07:28.231331+05	Uchqo‘rg‘on tumani	7
106	2022-08-06 16:07:28.234925+05	2022-08-06 16:07:28.234954+05	Chortoq tumani	7
107	2022-08-06 16:07:28.238875+05	2022-08-06 16:07:28.2389+05	Chust tumani	7
108	2022-08-06 16:07:28.246294+05	2022-08-06 16:07:28.246335+05	Yangiqo‘rg‘on tumani	7
109	2022-08-06 16:07:28.249919+05	2022-08-06 16:07:28.249943+05	Bulung‘ur tumani	8
110	2022-08-06 16:07:28.254699+05	2022-08-06 16:07:28.254726+05	Jomboy tumani	8
111	2022-08-06 16:07:28.259287+05	2022-08-06 16:07:28.259312+05	Ishtixon tumani	8
112	2022-08-06 16:07:28.263178+05	2022-08-06 16:07:28.263206+05	Kattaqo‘rg‘on tumani	8
113	2022-08-06 16:07:28.266652+05	2022-08-06 16:07:28.266692+05	Kattaqo‘rg‘on shahri	8
114	2022-08-06 16:07:28.269639+05	2022-08-06 16:07:28.269665+05	Qo‘shrabot tumani	8
115	2022-08-06 16:07:28.275969+05	2022-08-06 16:07:28.275995+05	Narpay tumani	8
116	2022-08-06 16:07:28.282094+05	2022-08-06 16:07:28.283086+05	Nurabod tumani	8
117	2022-08-06 16:07:28.287247+05	2022-08-06 16:07:28.287271+05	Oqdaryo tumani	8
118	2022-08-06 16:07:28.290815+05	2022-08-06 16:07:28.29084+05	Payariq tumani	8
119	2022-08-06 16:07:28.293479+05	2022-08-06 16:07:28.293501+05	Pastarg‘om tumani	8
120	2022-08-06 16:07:28.295909+05	2022-08-06 16:07:28.29593+05	Paxtachi tumani	8
121	2022-08-06 16:07:28.298664+05	2022-08-06 16:07:28.298702+05	Samarqand tumani	8
122	2022-08-06 16:07:28.300858+05	2022-08-06 16:07:28.300878+05	Samarqand shahri	8
123	2022-08-06 16:07:28.303629+05	2022-08-06 16:07:28.303654+05	Toyloq tumani	8
124	2022-08-06 16:07:28.327899+05	2022-08-06 16:07:28.327921+05	Urgut tumani	8
125	2022-08-06 16:07:28.331444+05	2022-08-06 16:07:28.331467+05	Angor tumani	9
126	2022-08-06 16:07:28.334336+05	2022-08-06 16:07:28.334358+05	Boysun tumani	9
127	2022-08-06 16:07:28.336864+05	2022-08-06 16:07:28.336887+05	Denov tumani	9
128	2022-08-06 16:07:28.33949+05	2022-08-06 16:07:28.339511+05	Jarqo‘rg‘on tumani	9
129	2022-08-06 16:07:28.345451+05	2022-08-06 16:07:28.345473+05	Qiziriq tumani	9
130	2022-08-06 16:07:28.348053+05	2022-08-06 16:07:28.348074+05	Qo‘mqo‘rg‘on tumani	9
131	2022-08-06 16:07:28.350422+05	2022-08-06 16:07:28.350442+05	Muzrabot tumani	9
132	2022-08-06 16:07:28.352778+05	2022-08-06 16:07:28.352798+05	Oltinsoy tumani	9
133	2022-08-06 16:07:28.355319+05	2022-08-06 16:07:28.355341+05	Sariosiyo tumani	9
134	2022-08-06 16:07:28.359519+05	2022-08-06 16:07:28.359542+05	Termiz tumani	9
135	2022-08-06 16:07:28.362011+05	2022-08-06 16:07:28.362032+05	Termiz shahri	9
136	2022-08-06 16:07:28.364799+05	2022-08-06 16:07:28.364823+05	Uzun tumani	9
137	2022-08-06 16:07:28.367354+05	2022-08-06 16:07:28.367376+05	Sherobod tumani	9
138	2022-08-06 16:07:28.369779+05	2022-08-06 16:07:28.369802+05	Sho‘rchi tumani	9
139	2022-08-06 16:07:28.372642+05	2022-08-06 16:07:28.372663+05	Boyovut tumani	10
140	2022-08-06 16:07:28.376002+05	2022-08-06 16:07:28.376025+05	Guliston tumani	10
141	2022-08-06 16:07:28.381489+05	2022-08-06 16:07:28.381514+05	Guliston shahri	10
142	2022-08-06 16:07:28.384201+05	2022-08-06 16:07:28.384224+05	Mirzaobod tumani	10
143	2022-08-06 16:07:28.386475+05	2022-08-06 16:07:28.386495+05	Oqoltin tumani	10
144	2022-08-06 16:07:28.388913+05	2022-08-06 16:07:28.388932+05	Sayxunobod tumani	10
145	2022-08-06 16:07:28.390834+05	2022-08-06 16:07:28.390853+05	Sardoba tumani	10
146	2022-08-06 16:07:28.393154+05	2022-08-06 16:07:28.393172+05	Sirdaryo tumani	10
147	2022-08-06 16:07:28.395476+05	2022-08-06 16:07:28.395495+05	Xavos tumani	10
148	2022-08-06 16:07:28.398112+05	2022-08-06 16:07:28.398137+05	Shirin shahri	10
149	2022-08-06 16:07:28.400276+05	2022-08-06 16:07:28.400296+05	Yangiyer shahri	10
150	2022-08-06 16:07:28.402534+05	2022-08-06 16:07:28.402555+05	Angiren shahri	11
151	2022-08-06 16:07:28.404991+05	2022-08-06 16:07:28.405011+05	Bekabod tumani	11
152	2022-08-06 16:07:28.407243+05	2022-08-06 16:07:28.407261+05	Bekabod shahri	11
153	2022-08-06 16:07:28.40915+05	2022-08-06 16:07:28.409166+05	Bo‘ka tumani	11
154	2022-08-06 16:07:28.411458+05	2022-08-06 16:07:28.411477+05	Bo‘stonliq tumani	11
155	2022-08-06 16:07:28.41455+05	2022-08-06 16:07:28.414571+05	Zangiota tumani	11
156	2022-08-06 16:07:28.416838+05	2022-08-06 16:07:28.416854+05	Qibray tumani	11
157	2022-08-06 16:07:28.41833+05	2022-08-06 16:07:28.418343+05	Quyichirchiq tumani	11
158	2022-08-06 16:07:28.420263+05	2022-08-06 16:07:28.420279+05	Oqqo‘rg‘on tumani	11
159	2022-08-06 16:07:28.422121+05	2022-08-06 16:07:28.422139+05	Olmaliq shahri	11
160	2022-08-06 16:07:28.424463+05	2022-08-06 16:07:28.42448+05	Ohangaron tumani	11
161	2022-08-06 16:07:28.426315+05	2022-08-06 16:07:28.42633+05	Parkent tumani	11
162	2022-08-06 16:07:28.428387+05	2022-08-06 16:07:28.428403+05	Piskent tumani	11
163	2022-08-06 16:07:28.430564+05	2022-08-06 16:07:28.430586+05	O‘rtachirchiq tumani	11
164	2022-08-06 16:07:28.432955+05	2022-08-06 16:07:28.432972+05	Chinoz tumani	11
165	2022-08-06 16:07:28.434637+05	2022-08-06 16:07:28.434652+05	Chirchiq shahri	11
166	2022-08-06 16:07:28.436651+05	2022-08-06 16:07:28.436675+05	Yuqorichirchiq tumani	11
167	2022-08-06 16:07:28.438541+05	2022-08-06 16:07:28.438555+05	Yangiyo‘l tumani	11
168	2022-08-06 16:07:28.440592+05	2022-08-06 16:07:28.440608+05	Beshariq tumani	12
169	2022-08-06 16:07:28.442271+05	2022-08-06 16:07:28.442287+05	Bog‘dod tumani	12
170	2022-08-06 16:07:28.444714+05	2022-08-06 16:07:28.444732+05	Buvayda tumani	12
171	2022-08-06 16:07:28.447328+05	2022-08-06 16:07:28.447355+05	Dang‘ara tumani	12
172	2022-08-06 16:07:28.449931+05	2022-08-06 16:07:28.449951+05	Yozyovon tumani	12
173	2022-08-06 16:07:28.451652+05	2022-08-06 16:07:28.451671+05	Quva tumani	12
174	2022-08-06 16:07:28.45374+05	2022-08-06 16:07:28.453758+05	Quvasoy shahri	12
175	2022-08-06 16:07:28.455641+05	2022-08-06 16:07:28.455656+05	Qo‘qon shahri	12
176	2022-08-06 16:07:28.457935+05	2022-08-06 16:07:28.457957+05	Qo‘shtepa tumani	12
177	2022-08-06 16:07:28.459757+05	2022-08-06 16:07:28.459774+05	Marg‘ilon shahri	12
178	2022-08-06 16:07:28.461778+05	2022-08-06 16:07:28.461796+05	Oltiariq tumani	12
179	2022-08-06 16:07:28.464375+05	2022-08-06 16:07:28.464401+05	Rishton tumani	12
180	2022-08-06 16:07:28.466886+05	2022-08-06 16:07:28.466905+05	So‘x tumani	12
181	2022-08-06 16:07:28.468637+05	2022-08-06 16:07:28.468654+05	Toshloq tumani	12
182	2022-08-06 16:07:28.470939+05	2022-08-06 16:07:28.47096+05	Uchko‘prik tumani	12
183	2022-08-06 16:07:28.472916+05	2022-08-06 16:07:28.472932+05	O‘zbekiston tumani	12
184	2022-08-06 16:07:28.475119+05	2022-08-06 16:07:28.475137+05	Farg‘ona tumani	12
185	2022-08-06 16:07:28.476819+05	2022-08-06 16:07:28.476834+05	Farg‘ona shahri	12
186	2022-08-06 16:07:28.478683+05	2022-08-06 16:07:28.478703+05	Furqat tumani	12
187	2022-08-06 16:07:28.481238+05	2022-08-06 16:07:28.481257+05	Bog‘ot tumani	13
188	2022-08-06 16:07:28.483317+05	2022-08-06 16:07:28.483334+05	Gurlan tumani	13
189	2022-08-06 16:07:28.485231+05	2022-08-06 16:07:28.485246+05	Qo‘shko‘pir tumani	13
190	2022-08-06 16:07:28.487292+05	2022-08-06 16:07:28.487309+05	Urganch tumani	13
191	2022-08-06 16:07:28.489239+05	2022-08-06 16:07:28.489254+05	Urganch shahri	13
192	2022-08-06 16:07:28.491284+05	2022-08-06 16:07:28.4913+05	Xiva tumani	13
193	2022-08-06 16:07:28.493205+05	2022-08-06 16:07:28.493221+05	Xazarasp tumani	13
194	2022-08-06 16:07:28.495134+05	2022-08-06 16:07:28.49515+05	Xonqa tumani	13
195	2022-08-06 16:07:28.497747+05	2022-08-06 16:07:28.497771+05	Shavot tumani	13
196	2022-08-06 16:07:28.499915+05	2022-08-06 16:07:28.499931+05	Yangiariq tumani	13
197	2022-08-06 16:07:28.501379+05	2022-08-06 16:07:28.501395+05	Yangibozor tumani	13
198	2022-08-06 16:07:28.503301+05	2022-08-06 16:07:28.50332+05	Bektimer tumani	14
199	2022-08-06 16:07:28.505359+05	2022-08-06 16:07:28.505375+05	Mirzo Ulug'bek tumani	14
200	2022-08-06 16:07:28.507291+05	2022-08-06 16:07:28.507308+05	Mirobod tumani	14
201	2022-08-06 16:07:28.509064+05	2022-08-06 16:07:28.509079+05	Olmazor tumani	14
202	2022-08-06 16:07:28.510884+05	2022-08-06 16:07:28.510898+05	Sirg'ali tumani	14
203	2022-08-06 16:07:28.51266+05	2022-08-06 16:07:28.512681+05	Uchtepa tumani	14
204	2022-08-06 16:07:28.515754+05	2022-08-06 16:07:28.515771+05	Yashnobod tumani	14
205	2022-08-06 16:07:28.517507+05	2022-08-06 16:07:28.517522+05	Chilonzor tumani	14
206	2022-08-06 16:07:28.519446+05	2022-08-06 16:07:28.51946+05	Shayxontohur tumani	14
207	2022-08-06 16:07:28.521511+05	2022-08-06 16:07:28.521525+05	Yunusobod tumani	14
208	2022-08-06 16:07:28.523504+05	2022-08-06 16:07:28.523524+05	Yakkasaroy tumani	14
209	2022-08-06 16:07:28.525267+05	2022-08-06 16:07:28.525283+05	Taxiatosh shahri	1
210	2022-08-06 16:07:28.527168+05	2022-08-06 16:07:28.527184+05	Asaka shahri	2
211	2022-08-06 16:07:28.529026+05	2022-08-06 16:07:28.529041+05	Bandixon tumani	9
212	2022-08-06 16:07:28.531767+05	2022-08-06 16:07:28.531786+05	Ohangaron shahri	11
213	2022-08-06 16:07:28.533812+05	2022-08-06 16:07:28.533829+05	Yangiyo‘l shahri	11
215	2022-08-06 16:07:28.535781+05	2022-08-06 16:07:28.535797+05	Toshkent tumani	11
216	2022-08-06 16:07:28.537803+05	2022-08-06 16:07:28.537824+05	Xiva shahri	13
217	2022-08-06 16:07:28.539661+05	2022-08-06 16:07:28.539677+05	Do'stlik shahri	13
218	2022-08-06 16:07:28.541641+05	2022-08-06 16:07:28.541659+05	Yangihayot tumani	14
219	2022-08-06 16:07:28.543781+05	2022-08-06 16:07:28.543799+05	Tuproqqala tumani	13
220	2022-08-06 16:07:28.545758+05	2022-08-06 16:07:28.545775+05	Davlatobod tumani	7
221	2022-08-06 16:07:28.548344+05	2022-08-06 16:07:28.548363+05	G‘ozg‘on shahri	6
222	2022-08-06 16:07:28.550162+05	2022-08-06 16:07:28.550179+05	Bo‘zatov tumani	1
224	2022-08-06 16:07:28.552024+05	2022-08-06 16:07:28.55204+05	Shahrisabz shahri	5
225	2022-08-06 16:07:28.554127+05	2022-08-06 16:07:28.554146+05	Ko‘kdala tumani	5
\.


--
-- Data for Name: registration_region; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.registration_region (id, created_at, updated_at, name) FROM stdin;
1	2022-08-06 16:04:39.655295+05	2022-08-06 16:04:39.655339+05	Qoraqalpog‘iston Respublikasi
2	2022-08-06 16:04:39.888686+05	2022-08-06 16:04:39.888714+05	Andijon viloyati
3	2022-08-06 16:04:39.896007+05	2022-08-06 16:04:39.896034+05	Buxoro viloyati
4	2022-08-06 16:04:39.899515+05	2022-08-06 16:04:39.899544+05	Jizzax viloyati
5	2022-08-06 16:04:39.902955+05	2022-08-06 16:04:39.90298+05	Qashqadaryo viloyati
6	2022-08-06 16:04:39.906237+05	2022-08-06 16:04:39.906264+05	Navoiy viloyati
7	2022-08-06 16:04:39.909347+05	2022-08-06 16:04:39.909374+05	Namangan viloyati
8	2022-08-06 16:04:39.913708+05	2022-08-06 16:04:39.913733+05	Samarqand viloyati
9	2022-08-06 16:04:39.916657+05	2022-08-06 16:04:39.916683+05	Surxandaryo viloyati
10	2022-08-06 16:04:39.919389+05	2022-08-06 16:04:39.919423+05	Sirdaryo viloyati
11	2022-08-06 16:04:39.923943+05	2022-08-06 16:04:39.923968+05	Toshkent viloyati
12	2022-08-06 16:04:39.927195+05	2022-08-06 16:04:39.927227+05	Farg‘ona viloyati
13	2022-08-06 16:04:39.932157+05	2022-08-06 16:04:39.932183+05	Xorazm viloyati
14	2022-08-06 16:04:39.934901+05	2022-08-06 16:04:39.93493+05	Toshkent shahri
\.


--
-- Data for Name: registration_subcategory; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.registration_subcategory (id, created_at, updated_at, name, category_id) FROM stdin;
1	2022-08-06 15:32:06.564753+05	2022-08-06 15:32:06.564782+05	Rakvina	1
2	2022-08-06 15:32:23.65081+05	2022-08-06 15:32:23.650839+05	Quvur tortish	1
3	2022-08-06 15:32:34.64783+05	2022-08-06 15:32:34.647863+05	Kanalizatsiya	1
7	2022-08-06 19:24:05.715053+05	2022-08-06 19:24:05.715089+05	Tom qurish	3
8	2022-08-18 12:37:20.089578+05	2022-08-18 12:37:20.089603+05	dadada	8
9	2022-08-18 12:37:29.900536+05	2022-08-18 12:37:29.900574+05	aaaaa	2
10	2022-08-18 12:37:39.447183+05	2022-08-18 12:37:39.447216+05	ssssss	1
11	2022-08-18 12:37:47.046165+05	2022-08-18 12:37:47.046186+05	ssssss	1
12	2022-08-18 12:37:53.493595+05	2022-08-18 12:37:53.493615+05	dddd	3
13	2022-08-18 12:38:00.1174+05	2022-08-18 12:38:00.117425+05	ddddddfff	4
14	2022-08-18 12:38:06.087783+05	2022-08-18 12:38:06.087804+05	gggggg	5
15	2022-08-18 12:38:11.19507+05	2022-08-18 12:38:11.195148+05	hhhhh	6
16	2022-08-18 12:38:16.672499+05	2022-08-18 12:38:16.67253+05	uuuu	3
17	2022-08-18 12:38:21.919027+05	2022-08-18 12:38:21.919056+05	lllll	8
18	2022-08-18 12:38:27.617999+05	2022-08-18 12:38:27.618021+05	lllllll	9
19	2022-08-18 12:38:34.724349+05	2022-08-18 12:38:34.724379+05	shhhhh	10
20	2022-08-18 12:38:42.88775+05	2022-08-18 12:38:42.887773+05	shuuuuu	11
21	2022-08-18 12:38:49.227488+05	2022-08-18 12:38:49.227516+05	assasaa	12
22	2022-08-18 12:38:54.281192+05	2022-08-18 12:38:54.281218+05	aaddddd	13
26	2022-08-18 14:54:41.169437+05	2022-08-18 14:54:41.169478+05	Tom qurish	3
27	2022-08-18 14:54:56.562402+05	2022-08-18 14:54:56.562424+05	new	12
28	2022-08-18 14:57:53.420419+05	2022-08-18 14:57:53.420445+05	tozalik	12
29	2022-08-18 14:58:34.378512+05	2022-08-18 14:58:34.378533+05	toza ishlash	12
30	2022-08-18 15:15:50.662167+05	2022-08-18 15:15:50.662191+05	tozalik	12
31	2022-08-18 15:16:04.67173+05	2022-08-18 15:16:04.671759+05	tozalik 2	12
32	2022-08-18 15:16:11.575903+05	2022-08-18 15:16:11.575928+05	adasdadasdad adasada	12
33	2022-08-18 15:16:17.359303+05	2022-08-18 15:16:17.359333+05	ada adadasadd	12
34	2022-08-18 15:16:22.833522+05	2022-08-18 15:16:22.83355+05	a dasd	12
35	2022-08-18 15:16:26.927571+05	2022-08-18 15:16:26.9276+05	asda sd	12
36	2022-08-18 15:16:32.573575+05	2022-08-18 15:16:32.573601+05	adad	12
41	2022-08-19 16:16:48.026455+05	2022-08-19 16:16:48.026475+05	mahorat	16
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public."user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, phone_number, overview, payment_hourly, role, avatar, created_at, updated_at, city_id, region_id, street, title, is_delete, total_earnings, total_spent, telegram, experience, is_new, is_online, balance) FROM stdin;
40	\N	\N	f	+998901234569	Someone	Mr		f	f	2022-08-18 12:22:16.378927+05	+998901234569	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer	profile/profile_uxytVKg.jpg	2022-08-18 12:22:16.38213+05	2022-08-18 12:23:17.29474+05	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga ha	f	0	0	\N	\N	t	f	0
69	123	2022-08-22 13:15:27+05	f	ds	halil	halilov	adad@gmailc.om	f	t	2022-08-22 13:15:25+05	+998909876544		999	freelancer		2022-08-22 13:16:46.559243+05	2022-08-22 13:16:46.55926+05	24	5	tashkent	adad	f	100000	100000	213	3	t	f	100
59	q1111111	\N	f	+998121212112	Sherzod	Shermatov		f	t	2022-08-20 11:34:47.020635+05	+998121212112	jjjd	999	freelancer		2022-08-20 11:34:47.021925+05	2022-08-20 11:41:28.465729+05	202	14	kkfkf	li	f	0	0	\N	\N	t	f	0
54	123	2022-08-19 11:14:00+05	f	Gulomjon	Sardor	Saidov	saidov@gmail.com	f	t	2022-08-19 11:13:57+05	+998908762345	Overview here	100000	freelancer	profile/original_yuang-stive-680x453.jpg	2022-08-19 11:16:46.115247+05	2022-08-19 11:41:26.750907+05	28	1	toy tepa	Menga yaxwi iw kerak	f	100000	50000	@sari	3	t	t	0
50	00000000	\N	f	+998333333333	Xd	Vc		f	t	2022-08-18 15:14:01+05	+998333333333		\N	client		2022-08-18 15:14:01.268434+05	2022-08-19 11:51:10.955179+05	93	6	Dvw		f	0	0	a	\N	t	t	0
52	1111111a	\N	f	+998222222222	Asgf	Rhhr		f	t	2022-08-18 17:04:53+05	+998222222222	Wgege	758	freelancer		2022-08-18 17:04:53.262774+05	2022-08-19 11:51:27.269221+05	79	5	Ggg	Scdvv	f	0	0	as	\N	t	t	0
53	Dddddddd	\N	f	+998594545454	Ddsfnafj	Dhehr		f	t	2022-08-18 17:44:00+05	+998594545454		\N	client		2022-08-18 17:44:00.466645+05	2022-08-19 11:51:57.457951+05	90	6	Ddd		f	0	0	@tele	\N	t	t	0
48	66666666	\N	f	+998887803635	pppp	llllll		f	t	2022-08-18 14:34:43+05	+998887803635	ssjjs	5555555	freelancer		2022-08-18 14:34:43.126436+05	2022-08-19 14:26:53.114081+05	65	4	hhhhh	jjjjjj	f	0	0	L	\N	t	f	0
9	\N	\N	f	+998901234567	Someone	Mr		f	f	2022-08-15 17:36:47.864159+05	+998901234567	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	\N	freelancer	profile/profile.jpg	2022-08-15 17:36:47.865474+05	2022-08-15 17:36:47.865489+05	32	3	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	\N	\N	t	f	0
55	\N	\N	f	+998111111111				f	t	2022-08-19 18:29:14.716521+05	+998111111111	\N	\N	client		2022-08-19 18:29:14.717093+05	2022-08-19 18:29:14.717105+05	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
60	\N	\N	f	+998777777777				f	t	2022-08-20 11:50:03.086956+05	+998777777777	\N	\N	freelancer		2022-08-20 11:50:03.087539+05	2022-08-20 11:50:03.087553+05	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
7	\N	\N	f	+998932429263	Akmal	Yuldashev		f	t	2022-08-06 19:34:04+05	+998932429263		\N	client	profile/Image_19.jpg	2022-08-06 19:34:04.646209+05	2022-08-19 18:38:35.313406+05	33	2	Olmabog' ko'chasi, 1-uy		f	0	0	hello	\N	t	t	0
13	\N	\N	f		Diyorbek	Yuldashev		f	t	2022-08-16 12:23:08.50606+05	+998932429266	\N	\N	client		2022-08-16 12:23:08.507536+05	2022-08-16 12:23:08.507545+05	\N	\N	Olmabog' ko'chasi, 1-uy	\N	f	0	0	\N	\N	t	f	0
14	\N	\N	f	+998932429261	Diyorbek	Yuldashev		f	t	2022-08-16 12:24:23.224656+05	+998932429261	\N	\N	client		2022-08-16 12:24:23.226498+05	2022-08-16 12:24:23.226531+05	33	2	Olmabog' ko'chasi, 1-uy	\N	f	0	0	\N	\N	t	f	0
56	\N	\N	f	+998444444444				f	t	2022-08-19 18:44:37.166551+05	+998444444444	\N	\N	client		2022-08-19 18:44:37.167018+05	2022-08-19 18:44:37.167027+05	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
57	\N	\N	f	+998444444446				f	t	2022-08-19 18:46:25.541233+05	+998444444446	\N	\N	client		2022-08-19 18:46:25.541707+05	2022-08-19 18:46:25.541715+05	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
15	123	\N	f	+998901234568	Someone	Mr		f	f	2022-08-16 12:26:39+05	+998901234568	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer	profile/profile_KsAtv4H.jpg	2022-08-16 12:26:39.818599+05	2022-08-16 15:16:02.693003+05	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	salom	3	t	f	0
61	\N	\N	f	+998777777775				f	t	2022-08-20 11:52:38.980867+05	+998777777775	\N	\N	freelancer		2022-08-20 11:52:38.981542+05	2022-08-20 11:52:38.981556+05	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
8	\N	\N	f	+998932429264	Amila	Yuldasheva		f	t	2022-08-06 20:34:44+05	+998932429264	Overview for Freelancer	10	freelancer		2022-08-06 20:34:44.363195+05	2022-08-16 18:20:56.607578+05	33	2	Olmabog' ko'chasi, 1-uy	Title for Freelancer	f	0	0	joy	\N	t	f	0
58	Aaaaaaaa	\N	f	+998444444449	Gdhd	Vjfjf		f	t	2022-08-19 18:48:03.336044+05	+998444444449	\N	\N	client		2022-08-19 18:48:03.336684+05	2022-08-19 19:00:09.980177+05	103	7	H	\N	f	0	0	\N	\N	t	f	0
67	\N	\N	f	+998901234574	Someone	Mr		f	f	2022-08-20 18:12:35.586356+05	+998901234574	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer		2022-08-20 18:12:35.587021+05	2022-08-20 18:12:35.587035+05	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	\N	\N	f	f	0
68	\N	\N	f	+998901234573	Someone	Mr		f	f	2022-08-20 18:13:04.976504+05	+998901234573	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer		2022-08-20 18:13:04.977144+05	2022-08-20 18:13:04.977159+05	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	\N	\N	f	f	0
62	pppppppp	\N	f	+998777777778	11ww	www		f	t	2022-08-20 11:54:54.787189+05	+998777777778	kkk	5555	freelancer		2022-08-20 11:54:54.787807+05	2022-08-20 11:57:49.022129+05	64	4	ww	aloo	f	0	0	\N	\N	t	f	0
63	\N	\N	f	+998232323233				f	t	2022-08-20 12:01:48.260428+05	+998232323233	\N	\N	freelancer		2022-08-20 12:01:48.261808+05	2022-08-20 12:01:48.261885+05	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
64	\N	\N	f	+998232323235				f	t	2022-08-20 12:03:22.414442+05	+998232323235	\N	\N	freelancer		2022-08-20 12:03:22.415005+05	2022-08-20 12:03:22.415017+05	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
65	22222222	\N	f	+998623552622	Ggh	Htg		f	t	2022-08-20 14:16:20+05	+998623552622		\N	freelancer		2022-08-20 14:16:20.662633+05	2022-08-20 15:08:15.831698+05	52	3	Dr		f	0	0	adminn	\N	t	t	0
29	123	2022-08-17 18:07:22+05	f	Anvar	Anvar	Akmalov	hello@gmail.com	f	t	2022-08-17 18:07:18+05	+998909876543	desc here	9999	freelancer	profile/Image_20.jpg	2022-08-17 18:09:44.558317+05	2022-08-20 17:24:24.922671+05	25	2	tashkent	title	f	100000	150000	@hello	2	t	f	0
66	\N	\N	f	+998901234575	Someone	Mr		f	f	2022-08-20 18:11:38.418455+05	+998901234575	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer		2022-08-20 18:11:38.419235+05	2022-08-20 18:11:38.419247+05	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	\N	\N	f	f	0
6	123	\N	f	+998932429268	Diyorbek	Yuldashev		f	t	2022-08-06 17:15:24+05	+998932429262		\N	client		2022-08-06 17:15:24.045901+05	2022-08-24 15:44:32.123972+05	33	2	Olmabog' ko'chasi, 1-uy		f	0	10000	dostik	\N	t	f	90000
1	pbkdf2_sha256$320000$HYwEH5kS07mYkql2w4wlRN$W5NlaiC7PCbTmJ49T3w7vZQeVphjGdFHwIzhdh9rvao=	2022-08-22 12:14:53.135113+05	t	admin				t	t	2022-08-06 15:12:07.051927+05		\N	\N	freelancer		2022-08-06 15:12:07.316603+05	2022-08-06 15:12:07.316615+05	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
49	\N	\N	f	+998000000000	SHER	PPPP		f	t	2022-08-18 15:11:35.59725+05	+998000000000	\N	\N	client		2022-08-18 15:11:35.597862+05	2022-08-18 15:11:54.236022+05	51	3	JJJJ	\N	f	0	0	\N	\N	t	f	0
51	11111111	\N	f	+998666666666	652h4hbfhth	Hn4u		f	t	2022-08-18 15:15:49.297158+05	+998666666666	Gg	5555	freelancer		2022-08-18 15:15:49.298125+05	2022-08-18 15:16:04.329174+05	64	4	Hh	Re	f	0	0	\N	\N	t	f	0
\.


--
-- Data for Name: user_categories; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.user_categories (id, user_id, category_id) FROM stdin;
1	40	2
7	48	11
8	48	12
9	48	13
10	51	10
11	51	11
12	51	12
13	51	13
14	52	13
15	54	4
16	54	5
17	59	16
18	59	17
19	59	19
20	59	20
21	59	21
22	62	14
23	62	15
24	62	16
25	62	17
26	62	18
27	62	19
28	62	20
29	65	1
30	65	18
31	65	11
32	65	5
33	66	2
34	67	2
35	67	3
36	68	2
37	68	3
38	69	2
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_skills; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.user_skills (id, user_id, subcategory_id) FROM stdin;
1	8	2
2	8	3
3	9	2
4	9	3
5	15	2
6	15	3
7	40	2
8	40	3
24	48	20
25	48	21
26	51	29
27	51	28
28	51	20
29	51	22
30	52	22
31	54	1
32	54	2
33	54	3
34	59	41
35	62	41
36	65	10
37	65	2
38	65	3
39	66	2
40	66	3
41	67	2
42	67	3
43	68	2
44	68	3
45	69	1
\.


--
-- Data for Name: user_user_permissions; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.user_user_permissions (id, user_id, permission_id) FROM stdin;
1	29	4
2	54	10
3	69	1
\.


--
-- Data for Name: user_usertoken; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.user_usertoken (id, phone_number, token, password) FROM stdin;
1	+998932429262	7535	\N
2	+998932429262	9010	\N
3	+998932429262	6803	\N
4	+998932429262	9016	\N
5	+998932429263	7986	\N
6	+998932429262	3032	\N
7	+998932429262	3788	\N
8	+998932429262	8867	\N
9	+998932429262	5311	\N
10	+998932429262	3208	\N
11	+998932429270	5987	\N
12	+998932429260	2695	\N
13	+998932429260	0392	\N
14	+998887803635	0500	\N
15	+998887803635	6393	\N
16	+998 88 780-36-35	7200	\N
17	+998 88 780-36-35	1499	\N
18	+998 88 780-36-35	7595	\N
19	+998887803635	8647	\N
20	+998 88 780-36-35	3289	\N
21	+998 88 780-36-35	0383	\N
22	+998 88 780-36-35	1106	\N
23	+998887803635	2048	\N
24	+998 88 780-36-35	6900	\N
25	+998932429277	7530	\N
26	+998 88 780-36-35	4384	\N
27	+998 88 780-36-35	2966	\N
28	+998 88 780-36-35	8257	\N
29	+998 88 780-36-35	7961	\N
30	+998 88 780-36-35	1153	\N
31	+998887803635	9687	\N
32	+998887803635	5105	\N
33	+998887803635	2215	\N
34	+998887803635	1626	\N
35	+998887803635	2376	\N
36	+998887803635	3678	\N
37	+998887803635	0326	\N
38	+998887803635	9431	\N
39	+998887803635	9207	\N
40	+998887803635	9667	\N
41	+998887803635	7501	\N
42	+998887803635	8439	\N
43	+998887803635	3209	\N
44	+998887803635	1150	\N
45	+998887803635	0722	\N
46	+998887803635	0826	\N
47	+998887803635	4444	\N
48	+998000000000	3664	\N
49	+998333333333	9438	\N
50	+998666666666	0559	\N
51	+998887803635	5316	\N
52	+998887803635	6183	\N
53	+998887803635	2793	\N
54	+998222222222	6207	\N
55	+998594545454	9624	\N
56	+998111111111	0755	\N
57	+998444444444	9389	\N
58	+998444444446	3833	\N
59	+998444444449	0321	\N
60	+998121212112	3772	\N
61	+998777777777	9636	\N
62	+998777777775	7734	\N
63	+998777777778	9361	\N
64	+998232323233	9071	\N
65	+998232323235	0449	\N
66	+998623552622	4135	\N
\.


--
-- Data for Name: worker_portfolio; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.worker_portfolio (id, created_at, updated_at, headline, description, date, user_id, is_new, status) FROM stdin;
1	2022-08-15 19:15:40.88436+05	2022-08-15 19:15:40.884389+05	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 05:00:00+05	7	t	pending
3	2022-08-16 11:20:08.024502+05	2022-08-16 11:20:08.024605+05	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 05:00:00+05	9	t	pending
4	2022-08-16 11:25:43.616986+05	2022-08-16 11:25:43.617014+05	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 05:00:00+05	9	t	pending
5	2022-08-16 11:36:06.402867+05	2022-08-16 11:36:06.402958+05	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 05:00:00+05	8	t	pending
6	2022-08-16 11:36:23.711348+05	2022-08-16 11:36:23.711378+05	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 05:00:00+05	9	t	pending
2	2022-08-15 19:16:05.646143+05	2022-08-19 15:36:01.470875+05	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 05:00:00+05	7	t	approved
\.


--
-- Data for Name: worker_portfolioimage; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.worker_portfolioimage (id, created_at, updated_at, image, portfolio_id, user_id) FROM stdin;
1	2022-08-15 19:16:05.651829+05	2022-08-15 19:16:05.651849+05	portfolio/Screenshot_from_2022-08-08_09-23-38.png	2	7
2	2022-08-15 19:16:05.657183+05	2022-08-15 19:16:05.657204+05	portfolio/Screenshot_from_2022-08-04_12-59-30.png	2	7
3	2022-08-15 19:16:05.660667+05	2022-08-15 19:16:05.660687+05	portfolio/Screenshot_from_2022-08-03_18-01-03.png	2	7
4	2022-08-15 19:16:05.663787+05	2022-08-15 19:16:05.663808+05	portfolio/Screenshot_from_2022-07-27_12-46-00.png	2	7
5	2022-08-16 11:36:06.416298+05	2022-08-16 11:36:06.416326+05	portfolio/Screenshot_from_2022-07-27_12-42-57.png	5	8
6	2022-08-16 11:36:06.430738+05	2022-08-16 11:36:06.430766+05	portfolio/Screenshot_from_2022-08-04_12-59-30_pgzCwfI.png	5	8
7	2022-08-16 11:36:06.434763+05	2022-08-16 11:36:06.434785+05	portfolio/Screenshot_from_2022-07-23_15-29-21.png	5	8
8	2022-08-16 11:36:23.718308+05	2022-08-16 11:36:23.718333+05	portfolio/Screenshot_from_2022-07-27_12-42-57_WsjcQWR.png	6	9
9	2022-08-16 11:36:23.722852+05	2022-08-16 11:36:23.72288+05	portfolio/Screenshot_from_2022-08-04_12-59-30_feymeap.png	6	9
10	2022-08-16 11:36:23.726978+05	2022-08-16 11:36:23.727009+05	portfolio/Screenshot_from_2022-07-23_15-29-21_3p5oOjZ.png	6	9
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 93, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 70, true);


--
-- Name: post_post_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_post_categories_id_seq', 124, true);


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_post_id_seq', 44, true);


--
-- Name: post_post_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_post_skills_id_seq', 144, true);


--
-- Name: post_postimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_postimage_id_seq', 16, true);


--
-- Name: post_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_wishlist_id_seq', 2, true);


--
-- Name: proposals_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.proposals_invoice_id_seq', 6, true);


--
-- Name: proposals_proposal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.proposals_proposal_id_seq', 7, true);


--
-- Name: proposals_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.proposals_review_id_seq', 10, true);


--
-- Name: proposals_statuschanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.proposals_statuschanges_id_seq', 1, false);


--
-- Name: registration_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.registration_category_id_seq', 21, true);


--
-- Name: registration_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.registration_city_id_seq', 1, false);


--
-- Name: registration_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.registration_region_id_seq', 1, false);


--
-- Name: registration_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.registration_subcategory_id_seq', 41, true);


--
-- Name: user_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_categories_id_seq', 38, true);


--
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_id_seq', 69, true);


--
-- Name: user_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_skills_id_seq', 45, true);


--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_user_permissions_id_seq', 3, true);


--
-- Name: user_usertoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_usertoken_id_seq', 66, true);


--
-- Name: worker_portfolio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.worker_portfolio_id_seq', 6, true);


--
-- Name: worker_portfolioimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.worker_portfolioimage_id_seq', 10, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: post_post_categories post_post_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_categories
    ADD CONSTRAINT post_post_categories_pkey PRIMARY KEY (id);


--
-- Name: post_post_categories post_post_categories_post_id_category_id_a3046e59_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_categories
    ADD CONSTRAINT post_post_categories_post_id_category_id_a3046e59_uniq UNIQUE (post_id, category_id);


--
-- Name: post_post post_post_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post
    ADD CONSTRAINT post_post_pkey PRIMARY KEY (id);


--
-- Name: post_post_skills post_post_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_skills
    ADD CONSTRAINT post_post_skills_pkey PRIMARY KEY (id);


--
-- Name: post_post_skills post_post_skills_post_id_subcategory_id_b21adc97_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_skills
    ADD CONSTRAINT post_post_skills_post_id_subcategory_id_b21adc97_uniq UNIQUE (post_id, subcategory_id);


--
-- Name: post_postimage post_postimage_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_postimage
    ADD CONSTRAINT post_postimage_pkey PRIMARY KEY (id);


--
-- Name: post_wishlist post_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_wishlist
    ADD CONSTRAINT post_wishlist_pkey PRIMARY KEY (id);


--
-- Name: proposals_invoice proposals_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_invoice
    ADD CONSTRAINT proposals_invoice_pkey PRIMARY KEY (id);


--
-- Name: proposals_proposal proposals_proposal_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_proposal
    ADD CONSTRAINT proposals_proposal_pkey PRIMARY KEY (id);


--
-- Name: proposals_review proposals_review_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_review
    ADD CONSTRAINT proposals_review_pkey PRIMARY KEY (id);


--
-- Name: proposals_statuschanges proposals_statuschanges_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_statuschanges
    ADD CONSTRAINT proposals_statuschanges_pkey PRIMARY KEY (id);


--
-- Name: registration_category registration_category_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_category
    ADD CONSTRAINT registration_category_pkey PRIMARY KEY (id);


--
-- Name: registration_city registration_city_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_city
    ADD CONSTRAINT registration_city_pkey PRIMARY KEY (id);


--
-- Name: registration_region registration_region_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_region
    ADD CONSTRAINT registration_region_pkey PRIMARY KEY (id);


--
-- Name: registration_subcategory registration_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_subcategory
    ADD CONSTRAINT registration_subcategory_pkey PRIMARY KEY (id);


--
-- Name: user_categories user_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_categories_pkey PRIMARY KEY (id);


--
-- Name: user_categories user_categories_user_id_category_id_bfd1431d_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_categories_user_id_category_id_bfd1431d_uniq UNIQUE (user_id, category_id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_groups user_groups_user_id_group_id_40beef00_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_user_id_group_id_40beef00_uniq UNIQUE (user_id, group_id);


--
-- Name: user user_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_number_key UNIQUE (phone_number);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_skills user_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_pkey PRIMARY KEY (id);


--
-- Name: user_skills user_skills_user_id_subcategory_id_eef2d691_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_user_id_subcategory_id_eef2d691_uniq UNIQUE (user_id, subcategory_id);


--
-- Name: user_user_permissions user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_permissions user_user_permissions_user_id_permission_id_7dc6e2e0_uniq; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_user_id_permission_id_7dc6e2e0_uniq UNIQUE (user_id, permission_id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: user_usertoken user_usertoken_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_usertoken
    ADD CONSTRAINT user_usertoken_pkey PRIMARY KEY (id);


--
-- Name: worker_portfolio worker_portfolio_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.worker_portfolio
    ADD CONSTRAINT worker_portfolio_pkey PRIMARY KEY (id);


--
-- Name: worker_portfolioimage worker_portfolioimage_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.worker_portfolioimage
    ADD CONSTRAINT worker_portfolioimage_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: post_post_categories_category_id_c3484c55; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_post_categories_category_id_c3484c55 ON public.post_post_categories USING btree (category_id);


--
-- Name: post_post_categories_post_id_4e6b60a6; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_post_categories_post_id_4e6b60a6 ON public.post_post_categories USING btree (post_id);


--
-- Name: post_post_skills_post_id_2ec7fac6; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_post_skills_post_id_2ec7fac6 ON public.post_post_skills USING btree (post_id);


--
-- Name: post_post_skills_subcategory_id_0c5162c6; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_post_skills_subcategory_id_0c5162c6 ON public.post_post_skills USING btree (subcategory_id);


--
-- Name: post_post_user_id_b9c97aef; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_post_user_id_b9c97aef ON public.post_post USING btree (user_id);


--
-- Name: post_postimage_post_id_3ac67285; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_postimage_post_id_3ac67285 ON public.post_postimage USING btree (post_id);


--
-- Name: post_wishlist_post_id_43845645; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_wishlist_post_id_43845645 ON public.post_wishlist USING btree (post_id);


--
-- Name: post_wishlist_user_id_fdca769a; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_wishlist_user_id_fdca769a ON public.post_wishlist USING btree (user_id);


--
-- Name: proposals_invoice_user_id_60193160; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_invoice_user_id_60193160 ON public.proposals_invoice USING btree (user_id);


--
-- Name: proposals_proposal_post_id_f9ce096a; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_proposal_post_id_f9ce096a ON public.proposals_proposal USING btree (post_id);


--
-- Name: proposals_proposal_user_id_9c64bb21; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_proposal_user_id_9c64bb21 ON public.proposals_proposal USING btree (user_id);


--
-- Name: proposals_review_post_id_064b2361; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_review_post_id_064b2361 ON public.proposals_review USING btree (post_id);


--
-- Name: proposals_review_user_id_dfdab5b5; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_review_user_id_dfdab5b5 ON public.proposals_review USING btree (user_id);


--
-- Name: proposals_statuschanges_post_id_8c053c26; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_statuschanges_post_id_8c053c26 ON public.proposals_statuschanges USING btree (post_id);


--
-- Name: proposals_statuschanges_proposal_id_8b416bef; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_statuschanges_proposal_id_8b416bef ON public.proposals_statuschanges USING btree (proposal_id);


--
-- Name: proposals_statuschanges_user_id_d4aa0e52; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_statuschanges_user_id_d4aa0e52 ON public.proposals_statuschanges USING btree (user_id);


--
-- Name: registration_city_region_id_45925e74; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX registration_city_region_id_45925e74 ON public.registration_city USING btree (region_id);


--
-- Name: registration_subcategory_category_id_f5bbc9b0; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX registration_subcategory_category_id_f5bbc9b0 ON public.registration_subcategory USING btree (category_id);


--
-- Name: user_categories_category_id_75c7d068; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_categories_category_id_75c7d068 ON public.user_categories USING btree (category_id);


--
-- Name: user_categories_user_id_7175a3ba; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_categories_user_id_7175a3ba ON public.user_categories USING btree (user_id);


--
-- Name: user_city_id_62c8c5db; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_city_id_62c8c5db ON public."user" USING btree (city_id);


--
-- Name: user_groups_group_id_b76f8aba; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_groups_group_id_b76f8aba ON public.user_groups USING btree (group_id);


--
-- Name: user_groups_user_id_abaea130; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_groups_user_id_abaea130 ON public.user_groups USING btree (user_id);


--
-- Name: user_phone_number_181d522d_like; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_phone_number_181d522d_like ON public."user" USING btree (phone_number varchar_pattern_ops);


--
-- Name: user_region_id_3c72303d; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_region_id_3c72303d ON public."user" USING btree (region_id);


--
-- Name: user_skills_subcategory_id_f3094283; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_skills_subcategory_id_f3094283 ON public.user_skills USING btree (subcategory_id);


--
-- Name: user_skills_user_id_8140060b; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_skills_user_id_8140060b ON public.user_skills USING btree (user_id);


--
-- Name: user_user_permissions_permission_id_9deb68a3; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_user_permissions_permission_id_9deb68a3 ON public.user_user_permissions USING btree (permission_id);


--
-- Name: user_user_permissions_user_id_ed4a47ea; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_user_permissions_user_id_ed4a47ea ON public.user_user_permissions USING btree (user_id);


--
-- Name: user_username_cf016618_like; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX user_username_cf016618_like ON public."user" USING btree (username varchar_pattern_ops);


--
-- Name: worker_portfolio_user_id_a9cc6426; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX worker_portfolio_user_id_a9cc6426 ON public.worker_portfolio USING btree (user_id);


--
-- Name: worker_portfolioimage_portfolio_id_a8fe93f7; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX worker_portfolioimage_portfolio_id_a8fe93f7 ON public.worker_portfolioimage USING btree (portfolio_id);


--
-- Name: worker_portfolioimage_user_id_5f01f05f; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX worker_portfolioimage_user_id_5f01f05f ON public.worker_portfolioimage USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_post_categories post_post_categories_category_id_c3484c55_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_categories
    ADD CONSTRAINT post_post_categories_category_id_c3484c55_fk_registrat FOREIGN KEY (category_id) REFERENCES public.registration_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_post_categories post_post_categories_post_id_4e6b60a6_fk_post_post_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_categories
    ADD CONSTRAINT post_post_categories_post_id_4e6b60a6_fk_post_post_id FOREIGN KEY (post_id) REFERENCES public.post_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_post_skills post_post_skills_post_id_2ec7fac6_fk_post_post_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_skills
    ADD CONSTRAINT post_post_skills_post_id_2ec7fac6_fk_post_post_id FOREIGN KEY (post_id) REFERENCES public.post_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_post_skills post_post_skills_subcategory_id_0c5162c6_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post_skills
    ADD CONSTRAINT post_post_skills_subcategory_id_0c5162c6_fk_registrat FOREIGN KEY (subcategory_id) REFERENCES public.registration_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_post post_post_user_id_b9c97aef_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_post
    ADD CONSTRAINT post_post_user_id_b9c97aef_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_postimage post_postimage_post_id_3ac67285_fk_post_post_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_postimage
    ADD CONSTRAINT post_postimage_post_id_3ac67285_fk_post_post_id FOREIGN KEY (post_id) REFERENCES public.post_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_wishlist post_wishlist_post_id_43845645_fk_post_post_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_wishlist
    ADD CONSTRAINT post_wishlist_post_id_43845645_fk_post_post_id FOREIGN KEY (post_id) REFERENCES public.post_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_wishlist post_wishlist_user_id_fdca769a_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_wishlist
    ADD CONSTRAINT post_wishlist_user_id_fdca769a_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proposals_invoice proposals_invoice_user_id_60193160_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_invoice
    ADD CONSTRAINT proposals_invoice_user_id_60193160_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proposals_proposal proposals_proposal_post_id_f9ce096a_fk_post_post_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_proposal
    ADD CONSTRAINT proposals_proposal_post_id_f9ce096a_fk_post_post_id FOREIGN KEY (post_id) REFERENCES public.post_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proposals_proposal proposals_proposal_user_id_9c64bb21_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_proposal
    ADD CONSTRAINT proposals_proposal_user_id_9c64bb21_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proposals_review proposals_review_post_id_064b2361_fk_post_post_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_review
    ADD CONSTRAINT proposals_review_post_id_064b2361_fk_post_post_id FOREIGN KEY (post_id) REFERENCES public.post_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proposals_review proposals_review_user_id_dfdab5b5_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_review
    ADD CONSTRAINT proposals_review_user_id_dfdab5b5_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proposals_statuschanges proposals_statuschan_proposal_id_8b416bef_fk_proposals; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_statuschanges
    ADD CONSTRAINT proposals_statuschan_proposal_id_8b416bef_fk_proposals FOREIGN KEY (proposal_id) REFERENCES public.proposals_proposal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proposals_statuschanges proposals_statuschanges_post_id_8c053c26_fk_post_post_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_statuschanges
    ADD CONSTRAINT proposals_statuschanges_post_id_8c053c26_fk_post_post_id FOREIGN KEY (post_id) REFERENCES public.post_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proposals_statuschanges proposals_statuschanges_user_id_d4aa0e52_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_statuschanges
    ADD CONSTRAINT proposals_statuschanges_user_id_d4aa0e52_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_city registration_city_region_id_45925e74_fk_registration_region_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_city
    ADD CONSTRAINT registration_city_region_id_45925e74_fk_registration_region_id FOREIGN KEY (region_id) REFERENCES public.registration_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_subcategory registration_subcate_category_id_f5bbc9b0_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.registration_subcategory
    ADD CONSTRAINT registration_subcate_category_id_f5bbc9b0_fk_registrat FOREIGN KEY (category_id) REFERENCES public.registration_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_categories user_categories_category_id_75c7d068_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_categories_category_id_75c7d068_fk_registrat FOREIGN KEY (category_id) REFERENCES public.registration_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_categories user_categories_user_id_7175a3ba_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_categories_user_id_7175a3ba_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user user_city_id_62c8c5db_fk_registration_city_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_city_id_62c8c5db_fk_registration_city_id FOREIGN KEY (city_id) REFERENCES public.registration_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_groups user_groups_group_id_b76f8aba_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_groups user_groups_user_id_abaea130_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_user_id_abaea130_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user user_region_id_3c72303d_fk_registration_region_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_region_id_3c72303d_fk_registration_region_id FOREIGN KEY (region_id) REFERENCES public.registration_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_skills user_skills_subcategory_id_f3094283_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_subcategory_id_f3094283_fk_registrat FOREIGN KEY (subcategory_id) REFERENCES public.registration_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_skills user_skills_user_id_8140060b_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_user_id_8140060b_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_permissions user_user_permission_permission_id_9deb68a3_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_permissions user_user_permissions_user_id_ed4a47ea_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_user_id_ed4a47ea_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_portfolio worker_portfolio_user_id_a9cc6426_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.worker_portfolio
    ADD CONSTRAINT worker_portfolio_user_id_a9cc6426_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_portfolioimage worker_portfolioimag_portfolio_id_a8fe93f7_fk_worker_po; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.worker_portfolioimage
    ADD CONSTRAINT worker_portfolioimag_portfolio_id_a8fe93f7_fk_worker_po FOREIGN KEY (portfolio_id) REFERENCES public.worker_portfolio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_portfolioimage worker_portfolioimage_user_id_5f01f05f_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.worker_portfolioimage
    ADD CONSTRAINT worker_portfolioimage_user_id_5f01f05f_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

