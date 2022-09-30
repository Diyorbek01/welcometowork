--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: paymeuz_transaction; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.paymeuz_transaction (
    id bigint NOT NULL,
    trans_id character varying(255) NOT NULL,
    amount numeric(10,2) NOT NULL,
    account text,
    status character varying(10) NOT NULL,
    create_time timestamp with time zone NOT NULL,
    pay_time timestamp with time zone NOT NULL,
    request_id integer NOT NULL
);


ALTER TABLE public.paymeuz_transaction OWNER TO newupworkuser;

--
-- Name: paymeuz_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

ALTER TABLE public.paymeuz_transaction ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.paymeuz_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
-- Name: post_timer; Type: TABLE; Schema: public; Owner: newupworkuser
--

CREATE TABLE public.post_timer (
    id bigint NOT NULL,
    start timestamp with time zone,
    pause timestamp with time zone,
    finish timestamp with time zone,
    price bigint,
    total_price bigint,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.post_timer OWNER TO newupworkuser;

--
-- Name: post_timer_id_seq; Type: SEQUENCE; Schema: public; Owner: newupworkuser
--

ALTER TABLE public.post_timer ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.post_timer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
    user_id bigint NOT NULL,
    portfolio_id bigint
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
93	Can add timer	24	add_timer
94	Can change timer	24	change_timer
95	Can delete timer	24	delete_timer
96	Can view timer	24	view_timer
97	Can add transaction	25	add_transaction
98	Can change transaction	25	change_transaction
99	Can delete transaction	25	delete_transaction
100	Can view transaction	25	view_transaction
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
b2c41c424a0ad58b480205cd194f1dde609efff9	2022-08-06 13:46:53.621933+00	6
b65d3412f89d9489a27f16d001085ea3baa26e70	2022-08-18 09:48:31.137833+00	48
22c8378b83762e4fe454cbec9cd287cc4de62608	2022-08-19 13:48:03.342876+00	58
43f783acd910a7fc7264b8624d2bdc86f12c212f	2022-08-20 06:34:47.090396+00	59
e88690053ddb18f892b17b2d85f865c6d065a5d9	2022-08-20 06:50:03.091393+00	60
cab708f47e6e04d18c10e258b97751989f645d01	2022-08-20 06:52:39.040487+00	61
939cfb253e57e1daf6207035fe97d069e99912f7	2022-08-20 06:54:54.794132+00	62
b2547f9c4ee2af8f69f8eeb362ff12d0c9654846	2022-08-20 07:01:48.269335+00	63
0993335e7c913aec782e7397569e9ac41a9d3e66	2022-08-20 07:03:22.4216+00	64
033e0746d728e99597c26684e462b51d05523285	2022-08-20 09:16:20.666295+00	65
015daf2c2fbc2bcad2f994eb6db3270cb6bb5b19	2022-08-29 08:13:04.210877+00	70
62127249049397357a3d61775d130a0ae84423f7	2022-08-29 08:14:48.378339+00	71
993ff7159f7fe8539776b73adc9957f67a699d56	2022-08-29 08:18:39.072474+00	72
ec2bca61fddb966c7699ed0cf84cda08858f7f82	2022-08-30 06:19:02.929864+00	73
34c2dc5fa789ef1d372fbe4eeb7839007bb4bd1d	2022-08-30 09:38:22.0758+00	74
a6bb16da8b1866269066995c8c34b62813fe8dbf	2022-08-30 11:57:03.186742+00	75
a20c0be6ad4c88cc36db1da4715b66715a39673a	2022-08-30 13:46:50.954018+00	76
7512a73b68c3e728e758ff76b16324e162055fd5	2022-08-31 05:53:04.381162+00	77
6ea6a8dd7e16366991d57e330363e0c55e26ce5d	2022-08-31 08:02:36.123995+00	78
c688eaff41db57ad37b9709afb2e9b9fd0245501	2022-08-31 11:39:54.769861+00	79
2f8c17cf685d4f4f70bf84ba0178a1d41a51ec82	2022-09-19 16:31:00.083726+00	80
19bee7f9d25fa53e495f2ccb79b2b993a60d6ab1	2022-09-19 16:39:44.868499+00	81
776f02e53959c29c930d943bce1e3783531b50f9	2022-09-19 16:49:13.722834+00	82
12b0328dd5a75f38b08813cb0290f7cde7c8e238	2022-09-19 17:15:39.592556+00	83
7c4661fcab0558d97e8b6165929eb3b1cf33ec1e	2022-09-19 19:57:19.398853+00	84
7a7527420b2f7907bff876ae2b504eb3a148c36f	2022-09-23 10:11:01.00152+00	85
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-08-16 10:14:43.28317+00	15	+998901234568	2	[{"changed": {"fields": ["Password", "Telegram", "Experience"]}}]	11	1
2	2022-08-16 10:16:02.712621+00	15	+998901234568	2	[]	11	1
3	2022-08-16 10:23:14.139892+00	6	UI Design needed	2	[{"changed": {"fields": ["Extra skills", "Is active", "Maximum project budget", "Duration"]}}]	14	1
4	2022-08-16 10:26:05.388961+00	3	UI Design needed	2	[{"changed": {"fields": ["Is active"]}}]	14	1
5	2022-08-16 10:26:12.002423+00	5	UI Design needed	2	[{"changed": {"fields": ["Is active"]}}]	14	1
6	2022-08-16 13:15:32.255744+00	6	hello	2	[{"changed": {"fields": ["Headline"]}}]	14	1
7	2022-08-16 13:15:39.790849+00	5	say	2	[{"changed": {"fields": ["Headline"]}}]	14	1
8	2022-08-16 13:15:47.045074+00	4	one more	2	[{"changed": {"fields": ["Headline"]}}]	14	1
9	2022-08-16 13:17:47.465561+00	5	say	2	[{"changed": {"fields": ["Status"]}}]	14	1
10	2022-08-16 13:17:56.490582+00	3	UI Design needed	2	[{"changed": {"fields": ["Status"]}}]	14	1
11	2022-08-16 13:18:07.110864+00	1	UI Design needed	2	[{"changed": {"fields": ["Status"]}}]	14	1
12	2022-08-16 13:18:16.592777+00	6	hello	2	[{"changed": {"fields": ["Status"]}}]	14	1
13	2022-08-16 13:20:20.340616+00	7	+998932429263	2	[{"changed": {"fields": ["First name", "Telegram"]}}]	11	1
14	2022-08-16 13:20:56.618449+00	8	+998932429264	2	[{"changed": {"fields": ["First name", "Last name", "Telegram"]}}]	11	1
15	2022-08-16 13:21:23.25549+00	6	+998932429262	2	[{"changed": {"fields": ["First name", "Telegram"]}}]	11	1
16	2022-08-17 08:24:36.237219+00	6	hello	2	[{"changed": {"fields": ["Categories"]}}]	14	1
17	2022-08-17 08:24:46.784697+00	5	say	2	[{"changed": {"fields": ["Categories"]}}]	14	1
18	2022-08-17 10:25:57.91579+00	16	+998887803635	3		11	1
19	2022-08-17 10:31:24.489465+00	6	+998932429268	2	[{"changed": {"fields": ["Username"]}}]	11	1
20	2022-08-17 10:40:52.037751+00	17	+998 88 780-36-35	3		11	1
21	2022-08-17 12:11:39.758607+00	18	+998 88 780-36-35	3		11	1
22	2022-08-17 12:18:21.163305+00	19	+998 88 780-36-35	3		11	1
23	2022-08-17 12:29:52.058495+00	20	+998 88 780-36-35	3		11	1
24	2022-08-17 12:35:06.535675+00	21	+998 88 780-36-35	3		11	1
25	2022-08-17 12:46:32.167873+00	23	+998887803635	3		11	1
26	2022-08-17 12:46:32.171198+00	22	+998 88 780-36-35	3		11	1
27	2022-08-17 12:54:43.104621+00	24	+998887803635	3		11	1
28	2022-08-17 13:00:08.002713+00	25	+998887803635	3		11	1
29	2022-08-17 13:05:42.577048+00	26	+998887803635	3		11	1
30	2022-08-17 13:08:19.685048+00	27	+998887803635	3		11	1
31	2022-08-17 13:09:44.572104+00	29	Anvar	1	[{"added": {}}]	11	1
32	2022-08-17 13:15:09.488517+00	28	+998887803635	3		11	1
33	2022-08-17 13:18:36.116323+00	30	+998887803635	3		11	1
34	2022-08-17 13:22:00.5623+00	31	+998887803635	3		11	1
35	2022-08-17 13:28:16.159875+00	32	+998887803635	3		11	1
36	2022-08-17 13:30:41.852564+00	33	+998887803635	3		11	1
37	2022-08-17 13:36:51.79352+00	35	+998887803735	3		11	1
38	2022-08-17 13:36:51.80099+00	34	+998887803635	3		11	1
39	2022-08-17 13:39:04.894466+00	37	+998887803835	3		11	1
40	2022-08-17 13:39:04.956545+00	36	+998887803635	3		11	1
41	2022-08-17 13:58:22.501684+00	38	+998887803635	3		11	1
42	2022-08-18 07:30:47.704146+00	39	+998887803635	3		11	1
43	2022-08-18 07:37:20.091727+00	8	dadada	1	[{"added": {}}]	8	1
44	2022-08-18 07:37:29.902542+00	9	aaaaa	1	[{"added": {}}]	8	1
45	2022-08-18 07:37:39.450097+00	10	ssssss	1	[{"added": {}}]	8	1
46	2022-08-18 07:37:47.050697+00	11	ssssss	1	[{"added": {}}]	8	1
47	2022-08-18 07:37:53.495209+00	12	dddd	1	[{"added": {}}]	8	1
48	2022-08-18 07:38:00.118926+00	13	ddddddfff	1	[{"added": {}}]	8	1
49	2022-08-18 07:38:06.089494+00	14	gggggg	1	[{"added": {}}]	8	1
50	2022-08-18 07:38:11.196796+00	15	hhhhh	1	[{"added": {}}]	8	1
51	2022-08-18 07:38:16.674005+00	16	uuuu	1	[{"added": {}}]	8	1
52	2022-08-18 07:38:21.92058+00	17	lllll	1	[{"added": {}}]	8	1
53	2022-08-18 07:38:27.619749+00	18	lllllll	1	[{"added": {}}]	8	1
54	2022-08-18 07:38:34.725983+00	19	shhhhh	1	[{"added": {}}]	8	1
55	2022-08-18 07:38:42.892898+00	20	shuuuuu	1	[{"added": {}}]	8	1
56	2022-08-18 07:38:49.229356+00	21	assasaa	1	[{"added": {}}]	8	1
57	2022-08-18 07:38:54.282308+00	22	aaddddd	1	[{"added": {}}]	8	1
58	2022-08-18 07:39:13.575851+00	41	+998887803635	3		11	1
59	2022-08-18 08:30:39.558339+00	42	+998887803635	3		11	1
60	2022-08-18 08:48:14.865666+00	43	+998887803635	3		11	1
61	2022-08-18 09:15:39.758635+00	44	+998887803635	3		11	1
62	2022-08-18 09:24:30.187683+00	45	+998887803635	3		11	1
63	2022-08-18 09:29:10.76427+00	46	+998887803635	3		11	1
64	2022-08-18 09:33:19.904297+00	47	+998887803635	3		11	1
65	2022-08-18 10:09:46.550801+00	48	+998887803635	2	[{"changed": {"fields": ["Telegram", "Role"]}}]	11	1
66	2022-08-18 12:24:31.573546+00	5	say	2	[{"changed": {"fields": ["Hourly from budget"]}}]	14	1
67	2022-08-18 12:31:41.751158+00	6	hello	2	[{"changed": {"fields": ["Status"]}}]	14	1
68	2022-08-18 12:31:49.071974+00	5	say	2	[{"changed": {"fields": ["Status"]}}]	14	1
69	2022-08-18 12:31:59.484756+00	4	one more	2	[{"changed": {"fields": ["Status"]}}]	14	1
70	2022-08-18 13:48:39.080392+00	10	hello | posts/photo_2022-07-23_01-51-28.jpg	1	[{"added": {}}]	15	1
71	2022-08-19 06:12:46.368061+00	2	Ddsfnafj Dhehr | say	1	[{"added": {}}]	19	1
72	2022-08-19 06:13:37.009442+00	3	Akmal Yuldashev | hello	1	[{"added": {}}]	19	1
73	2022-08-19 06:16:46.175802+00	54	Gulomjon	1	[{"added": {}}]	11	1
74	2022-08-19 06:21:47.045719+00	54	Gulomjon	2	[{"changed": {"fields": ["Avatar"]}}]	11	1
75	2022-08-19 06:41:26.762638+00	54	Gulomjon	2	[{"changed": {"fields": ["Is online"]}}]	11	1
76	2022-08-19 06:51:10.968517+00	50	+998333333333	2	[{"changed": {"fields": ["Telegram", "Is online"]}}]	11	1
77	2022-08-19 06:51:27.285195+00	52	+998222222222	2	[{"changed": {"fields": ["Telegram", "Is online"]}}]	11	1
78	2022-08-19 06:51:57.478911+00	53	+998594545454	2	[{"changed": {"fields": ["Telegram", "Is online"]}}]	11	1
79	2022-08-19 09:26:53.123675+00	48	+998887803635	2	[{"changed": {"fields": ["Role"]}}]	11	1
80	2022-08-19 13:35:49.24614+00	7	+998932429263 | 7	2	[{"changed": {"fields": ["Is online"]}}]	11	1
81	2022-08-19 13:38:35.324119+00	7	+998932429263 | 7	2	[{"changed": {"fields": ["Avatar"]}}]	11	1
82	2022-08-20 07:05:16.662314+00	3	Review object (3)	1	[{"added": {}}]	21	1
83	2022-08-20 07:09:45.158112+00	4	Sardor Saidov | comment here	1	[{"added": {}}]	21	1
84	2022-08-20 07:10:17.274446+00	5	 | Lorem ipsum — классический текст-«рыба». Является искажённым отрывком из философского трактата Марка Туллия Цицерона «О пределах добра и зла», написанного в 45 году до н. э. на латинском языке, обн	1	[{"added": {}}]	21	1
85	2022-08-20 07:12:10.696851+00	8	Sardor Saidov | Lorem ipsum — классический текст-«рыба». Является искажённым отрывком из философского трактата Марка Туллия Цицерона «О пределах добра и зла», написанного в 45 году до н. э. на латинск	1	[{"added": {}}]	21	1
86	2022-08-20 07:16:31.640144+00	9	Sardor Saidov | JA zo'r ishlamas ekan	1	[{"added": {}}]	21	1
87	2022-08-20 09:58:32.004698+00	10	Asgf Rhhr | asdfhghj	1	[{"added": {}}]	21	1
88	2022-08-20 10:08:15.852832+00	65	+998623552622 | 65	2	[{"changed": {"fields": ["Telegram", "Categories", "Skills", "Role", "Is online"]}}]	11	1
89	2022-08-20 12:24:24.941637+00	29	Anvar | 29	2	[{"changed": {"fields": ["Avatar"]}}]	11	1
90	2022-08-22 08:16:46.585736+00	69	ds | 69	1	[{"added": {}}]	11	1
91	2022-08-24 08:41:56.27593+00	7	Amila Yuldasheva | one more	2	[{"changed": {"fields": ["Admin status"]}}]	19	1
92	2022-08-24 08:42:05.852962+00	6	Diyorbek Yuldashev | one more	2	[{"changed": {"fields": ["Admin status"]}}]	19	1
93	2022-08-24 08:42:11.898307+00	5	Someone Mr | one more	2	[{"changed": {"fields": ["Admin status"]}}]	19	1
94	2022-09-16 12:53:39.508906+00	6	+998932429268 | 6	2	[{"changed": {"fields": ["Phone number"]}}]	11	1
95	2022-09-26 11:16:29.078553+00	60	+998777777777 | 60	2	[{"changed": {"fields": ["Telegram"]}}]	11	1
96	2022-09-26 11:17:01.128932+00	8	+998932429264 | 8	2	[{"changed": {"fields": ["Avatar"]}}]	11	1
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
24	post	timer
25	paymeuz	transaction
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	registration	0001_initial	2022-08-06 10:11:40.604081+00
2	contenttypes	0001_initial	2022-08-06 10:11:40.619778+00
3	contenttypes	0002_remove_content_type_name	2022-08-06 10:11:40.634466+00
4	auth	0001_initial	2022-08-06 10:11:40.693645+00
5	auth	0002_alter_permission_name_max_length	2022-08-06 10:11:40.70298+00
6	auth	0003_alter_user_email_max_length	2022-08-06 10:11:40.712205+00
7	auth	0004_alter_user_username_opts	2022-08-06 10:11:40.720883+00
8	auth	0005_alter_user_last_login_null	2022-08-06 10:11:40.729198+00
9	auth	0006_require_contenttypes_0002	2022-08-06 10:11:40.732038+00
10	auth	0007_alter_validators_add_error_messages	2022-08-06 10:11:40.742252+00
11	auth	0008_alter_user_username_max_length	2022-08-06 10:11:40.751305+00
12	auth	0009_alter_user_last_name_max_length	2022-08-06 10:11:40.761496+00
13	auth	0010_alter_group_name_max_length	2022-08-06 10:11:40.769944+00
14	auth	0011_update_proxy_permissions	2022-08-06 10:11:40.783983+00
15	auth	0012_alter_user_first_name_max_length	2022-08-06 10:11:40.791376+00
16	user	0001_initial	2022-08-06 10:11:40.885943+00
17	admin	0001_initial	2022-08-06 10:11:40.917201+00
18	admin	0002_logentry_remove_auto_add	2022-08-06 10:11:40.930305+00
19	admin	0003_logentry_add_action_flag_choices	2022-08-06 10:11:40.945726+00
20	authtoken	0001_initial	2022-08-06 10:11:40.975593+00
21	authtoken	0002_auto_20160226_1747	2022-08-06 10:11:41.022883+00
22	authtoken	0003_tokenproxy	2022-08-06 10:11:41.029007+00
23	sessions	0001_initial	2022-08-06 10:11:41.045935+00
24	user	0002_alter_user_skills	2022-08-06 10:11:41.066874+00
25	user	0003_alter_user_password	2022-08-06 10:16:10.688226+00
26	user	0004_user_street	2022-08-06 12:44:34.628336+00
27	user	0005_rename_create_at_user_created_at_and_more	2022-08-06 12:51:58.146709+00
28	registration	0002_category_image_category_status	2022-08-06 13:37:38.039012+00
29	user	0006_alter_user_password	2022-08-06 14:33:14.357265+00
30	user	0007_rename_projects_user_overview_and_more	2022-08-06 14:44:44.375848+00
31	post	0001_initial	2022-08-15 08:21:14.988678+00
32	post	0002_post_is_delete	2022-08-15 10:16:30.049942+00
33	post	0003_post_address_post_categories_post_is_active	2022-08-15 11:40:00.6518+00
34	post	0004_remove_post_file_postimage	2022-08-15 11:56:10.317322+00
35	user	0008_user_is_delete	2022-08-15 12:44:06.49984+00
36	user	0009_user_total_earnings_user_total_spent	2022-08-15 13:23:31.84754+00
37	user	0010_user_telegram	2022-08-15 13:47:13.24252+00
38	worker	0001_initial	2022-08-15 14:03:57.912715+00
39	worker	0002_proposal	2022-08-16 07:05:05.673144+00
40	worker	0003_proposal_status	2022-08-16 07:16:46.079885+00
41	post	0005_post_duration	2022-08-16 10:11:33.076016+00
42	user	0011_user_experience	2022-08-16 10:11:33.125487+00
43	post	0006_alter_post_address_alter_post_description_and_more	2022-08-16 10:25:51.632353+00
44	user	0012_alter_user_avatar_alter_user_city_and_more	2022-08-16 10:25:51.918765+00
45	proposals	0001_initial	2022-08-16 11:07:03.69002+00
46	worker	0004_delete_proposal	2022-08-16 11:07:03.698116+00
47	post	0007_post_status	2022-08-16 11:50:31.757615+00
48	registration	0003_alter_category_image	2022-08-17 09:24:35.120317+00
49	user	0013_alter_user_phone_number	2022-08-17 10:25:31.10782+00
50	post	0008_wishlist	2022-08-17 10:40:38.434852+00
51	proposals	0002_remove_proposal_status_proposal_admin_status_and_more	2022-08-17 11:36:07.387801+00
52	user	0014_user_categories	2022-08-18 07:07:21.287264+00
53	proposals	0003_review	2022-08-18 09:15:23.058195+00
54	proposals	0004_review_rate_alter_review_comment	2022-08-18 09:23:01.068373+00
55	post	0009_post_is_new	2022-08-18 09:47:54.364104+00
56	proposals	0005_proposal_is_new	2022-08-18 09:47:54.437954+00
57	user	0015_user_is_new	2022-08-18 09:47:54.50226+00
58	worker	0005_portfolio_is_new	2022-08-18 09:47:54.557447+00
59	post	0010_alter_post_status	2022-08-19 06:26:28.573576+00
60	user	0016_user_is_online	2022-08-19 06:29:46.437775+00
61	worker	0006_portfolio_status	2022-08-19 10:32:00.77404+00
62	proposals	0006_review_is_for_post_alter_review_rate	2022-08-20 06:40:16.065115+00
63	proposals	0007_rename_is_for_post_review_is_client	2022-08-20 06:55:09.246189+00
64	proposals	0008_invoice	2022-08-22 05:50:09.555478+00
65	proposals	0009_invoice_date_alter_invoice_card	2022-08-22 06:03:26.479021+00
66	proposals	0010_alter_invoice_date	2022-08-22 06:08:43.239287+00
67	user	0017_user_balance	2022-08-22 06:15:03.224431+00
68	post	0011_alter_postimage_image	2022-08-22 11:46:03.332892+00
69	worker	0007_alter_portfolio_date	2022-08-23 08:31:33.138471+00
70	proposals	0011_statuschanges	2022-08-24 10:13:52.367439+00
71	paymeuz	0001_initial	2022-08-29 13:28:09.559379+00
72	paymeuz	0002_auto_20200826_1127	2022-08-29 13:28:09.591437+00
73	paymeuz	0003_remove_transaction_state	2022-08-29 13:28:09.597628+00
74	paymeuz	0004_alter_transaction_id	2022-08-29 13:28:09.610924+00
75	post	0012_timer	2022-08-29 13:28:09.660195+00
76	post	0013_timer_created_at_timer_updated_at	2022-08-29 13:28:09.723331+00
77	proposals	0012_statuschanges_portfolio	2022-08-29 13:28:09.759351+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
4ji99mxdclxu46pzhuv9bs3i9p47hguh	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oNtYa:91dNPypE9pRtjH13_-uej_Bc2hn3yXQUoC8Tkoy5ESQ	2022-08-30 10:12:20.26855+00
5qrdbwkkbuuj6egawjp1icaa5kyg9yu5	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oNtiD:FWkC68EVmNxd6AnU77IaZjQg9IE-W08-7heIZPlDHTY	2022-08-30 10:22:17.762992+00
6p97pw6acvflwx93ubbd4atgkguv4ln6	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oOELR:uBo0_eqdQpBA9rulk8bZtosh2Q5YdX0cKa-dfzYTNPc	2022-08-31 08:24:09.687547+00
bori9cd26yj52m915r1ik3fhxaxvgmbf	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oOHsV:4Th-p6v15ghWY_b2pbqtlL2QWFYrJlPT8rnxrFm-pGw	2022-08-31 12:10:31.974168+00
3el95zl81xr52grrael8v9xbchsek7i3	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oOegM:iEbqxUfWYgbDSM0xDpwgwWnLuBXFcNcg2nyBSSFB5z8	2022-09-01 12:31:30.743756+00
yhsl0476k82o80x1dl4vm7hzaj1c8tzm	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oOuz0:gv52cp0TNnf7viY1a6vvDINmX_G9DZaNITlr-C2j_Hc	2022-09-02 05:55:50.14257+00
95rwcw12x8c2w4ozsnddxwnx8hhwyjx6	.eJxVjEEOwiAQRe_C2pDOMFhw6b5nIANMpWpoUtqV8e7apAvd_vfef6nA21rC1mQJU1YXBer0u0VOD6k7yHeut1mnua7LFPWu6IM2PcxZntfD_Tso3Mq3RksSsXMmAXHve3ROIBsAMiww8tmJgTGDF-mMo0TWWzQ5EVCKKKjeH8KWNzM:1oQ1e9:EYHNr1r4fIJbfbjTM8W20mn8mBohkYBu_gjqpveUJfI	2022-09-05 07:14:53.204084+00
dl4taeuuve71emovggpoucac9enrvfo2	.eJxVjMsOwiAURP-FtSG8Hy7d9xvIBS5SNZCUdmX8d9ukC13OnDPzJgG2tYZt4BLmTK6Ek8tvFyE9sR0gP6DdO029rcsc6aHQkw469Yyv2-n-HVQYdV_bJDljHqMWmnHukgXhsxbJWO_2bAGFNKq4YpJWBYCjxFic4156VJF8vrszN04:1oR6li:Q_XdyrsgxBZThRwVFsGgffCYgNzIxriJfpL22_zWnvA	2022-09-08 06:55:10.247772+00
owmxov9cibur5cgxkwc2rla9bgm4wqqo	.eJxVjMsOwiAURP-FtSG8Hy7d9xvIBS5SNZCUdmX8d9ukC13OnDPzJgG2tYZt4BLmTK6Ek8tvFyE9sR0gP6DdO029rcsc6aHQkw469Yyv2-n-HVQYdV_bJDljHqMWmnHukgXhsxbJWO_2bAGFNKq4YpJWBYCjxFic4156VJF8vrszN04:1oZAqU:Sa6KFCprZa3YP7QFuHBhi89NbHwHh6S-mVdEYiVYt50	2022-09-30 12:53:26.414172+00
45r4kq4jvfpo6w63yyq0uc8e52bqdv5r	.eJxVjMsOwiAURP-FtSG8Hy7d9xvIBS5SNZCUdmX8d9ukC13OnDPzJgG2tYZt4BLmTK6Ek8tvFyE9sR0gP6DdO029rcsc6aHQkw469Yyv2-n-HVQYdV_bJDljHqMWmnHukgXhsxbJWO_2bAGFNKq4YpJWBYCjxFic4156VJF8vrszN04:1ocm2v:dKmH6y6Z3pnBMPCVOKhtUHPuw3JpZMOv-Bv-bwmOIBw	2022-10-10 11:13:09.668462+00
\.


--
-- Data for Name: paymeuz_transaction; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.paymeuz_transaction (id, trans_id, amount, account, status, create_time, pay_time, request_id) FROM stdin;
\.


--
-- Data for Name: post_post; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_post (id, created_at, updated_at, headline, extra_skills, is_hourly, hourly_from_budget, hourly_to_budget, maximum_project_budget, description, latitude, longitude, user_id, is_delete, address, is_active, duration, status, is_new) FROM stdin;
2	2022-08-15 11:57:52.734377+00	2022-08-15 12:18:55.397303+00	UI Design needed	2	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	t	Tashkent viloyati	f	\N	sent	t
3	2022-08-15 12:01:34.6106+00	2022-08-16 13:17:56.479993+00	UI Design needed	2	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	t	\N	going	t
5	2022-08-15 12:04:44.049612+00	2022-08-22 06:41:29.489755+00	say	\N	t	70000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	t	\N	going	t
1	2022-08-15 11:44:52.565448+00	2022-08-16 13:18:07.104934+00	UI Design needed	2	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	finished	t
8	2022-08-22 08:38:33.853034+00	2022-08-22 08:38:33.853072+00	Ggg	\N	t	55555	33333	\N	Geegeg	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
4	2022-08-15 12:02:08.298627+00	2022-08-18 12:31:59.476037+00	one more	\N	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	approved	t
9	2022-08-22 09:54:40.476422+00	2022-08-22 09:54:40.476452+00	G	\N	t	45	88	\N	Fr	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
18	2022-08-22 11:27:48.370487+00	2022-08-22 11:27:48.370586+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
7	2022-08-20 05:38:19.165316+00	2022-08-20 05:38:19.165548+00	UI Design needed	\N	t	50000	100000	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	sent	f
6	2022-08-15 12:05:02.640643+00	2022-08-18 12:31:41.741078+00	hello	as	t	50000	100000	150000	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	t	2	approved	t
10	2022-08-22 10:00:20.965869+00	2022-08-22 10:00:20.9659+00	Rg	\N	t	45	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
11	2022-08-22 10:01:49.975108+00	2022-08-22 10:01:49.975139+00	Rg	\N	t	45	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
12	2022-08-22 10:54:47.751338+00	2022-08-22 10:54:47.751367+00	G	\N	t	5	2	\N	G	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
13	2022-08-22 11:10:43.246161+00	2022-08-22 11:10:43.246192+00	Ft	\N	t	5	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
14	2022-08-22 11:12:21.081772+00	2022-08-22 11:12:21.081804+00	Ft	\N	t	5	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
15	2022-08-22 11:13:21.690776+00	2022-08-22 11:13:21.690801+00	Ft	\N	t	5	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
16	2022-08-22 11:13:26.738385+00	2022-08-22 11:13:26.738418+00	Ft	\N	t	5	55	\N	Ff	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
17	2022-08-22 11:17:29.690744+00	2022-08-22 11:17:29.690773+00	Er	\N	t	99	99	\N	Jh	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
19	2022-08-22 11:27:48.372185+00	2022-08-22 11:27:48.372206+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
20	2022-08-22 11:27:49.871814+00	2022-08-22 11:27:49.871845+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
21	2022-08-22 11:27:50.263038+00	2022-08-22 11:27:50.263068+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
22	2022-08-22 11:27:50.308872+00	2022-08-22 11:27:50.308901+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
23	2022-08-22 11:27:50.462514+00	2022-08-22 11:27:50.462551+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
24	2022-08-22 11:27:50.688395+00	2022-08-22 11:27:50.688428+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
25	2022-08-22 11:27:50.79325+00	2022-08-22 11:27:50.793275+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
26	2022-08-22 11:27:52.47171+00	2022-08-22 11:27:52.471734+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
27	2022-08-22 11:28:23.333187+00	2022-08-22 11:28:23.333211+00	Get	\N	f	\N	\N	10	Rt	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
28	2022-08-22 11:34:40.680486+00	2022-08-22 11:34:40.680511+00	D	\N	t	55	556	\N	D	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
29	2022-08-22 11:36:12.941375+00	2022-08-22 11:36:12.941401+00	D	\N	t	55	556	\N	D	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
30	2022-08-22 11:36:58.236149+00	2022-08-22 11:36:58.2362+00	D	\N	t	55	556	\N	D	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
31	2022-08-22 11:39:23.071751+00	2022-08-22 11:39:23.071784+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
32	2022-08-22 11:39:34.037464+00	2022-08-22 11:39:34.037492+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
33	2022-08-22 11:40:22.204441+00	2022-08-22 11:40:22.204475+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
34	2022-08-22 11:43:25.255418+00	2022-08-22 11:43:25.255446+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
35	2022-08-22 11:46:18.472727+00	2022-08-22 11:46:18.472755+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
36	2022-08-22 11:49:01.855766+00	2022-08-22 11:49:01.855859+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
37	2022-08-22 11:51:08.196014+00	2022-08-22 11:51:08.196037+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
38	2022-08-22 11:57:04.313915+00	2022-08-22 11:57:04.313953+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
39	2022-08-22 11:57:19.709271+00	2022-08-22 11:57:19.709297+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
40	2022-08-22 11:57:53.292619+00	2022-08-22 11:57:53.292654+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
41	2022-08-22 11:58:31.302699+00	2022-08-22 11:58:31.302723+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
42	2022-08-22 11:59:58.798947+00	2022-08-22 11:59:58.799038+00	Yu	\N	t	66	56	\N	Yy	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
43	2022-08-22 12:01:24.705252+00	2022-08-22 12:01:24.705287+00	UI Design needed	\N	t	50000	100000	0	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	sent	f
44	2022-08-22 12:02:57.119867+00	2022-08-22 12:02:57.120287+00	UI Design needed	\N	t	50000	100000	0	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	sent	f
45	2022-08-31 08:23:06.525494+00	2022-08-31 08:23:06.525565+00	UI Design needed	\N	t	50000	100000	0	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	sent	f
46	2022-09-21 06:56:48.457561+00	2022-09-21 06:56:48.457656+00	A	\N	f	\N	\N	10	Hhhhh	12	12	6	f	_myPostNotifier!.address	f	\N	sent	t
47	2022-09-21 07:50:20.592521+00	2022-09-21 07:50:20.592628+00	UI Design needed	\N	t	50000	100000	0	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	46.124523	57.124523	6	f	Tashkent viloyati	f	\N	sent	f
48	2022-09-21 07:51:42.813422+00	2022-09-21 07:51:42.813506+00	E	\N	t	1	2	\N	S	12	12	6	f	_myPostNotifier!.address	f	\N	sent	f
49	2022-09-21 09:44:17.355269+00	2022-09-21 09:44:17.355334+00	Y	\N	f	\N	\N	8	T	12	12	6	f	_myPostNotifier!.address	f	\N	sent	f
50	2022-09-21 09:52:47.037798+00	2022-09-21 09:52:47.037906+00	Y	\N	f	\N	\N	8	T	12	12	6	f	_myPostNotifier!.address	f	\N	sent	f
51	2022-09-22 12:18:34.963587+00	2022-09-22 12:18:34.9637+00	G	\N	f	\N	\N	5	Y	41.34119794093286	69.29688373471751	84	f	Oʻzbekiston, Toshkent, Bodomzor ko'chasi, 98	f	\N	sent	f
52	2022-09-22 13:37:47.559823+00	2022-09-22 13:37:47.559867+00	A	\N	t	4	4	\N	S	41.34128029962422	69.29702519999998	84	f	Oʻzbekiston, Toshkent, Bodomzor ko'chasi, 98	f	\N	sent	f
53	2022-09-22 13:59:29.613328+00	2022-09-22 13:59:29.613416+00	D	\N	f	\N	\N	55	S	41.34111609962425	69.29695500000003	84	f	Oʻzbekiston, Toshkent, Bodomzor ko'chasi, 98	f	\N	sent	f
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
125	45	2
126	46	4
127	46	5
128	47	2
129	48	8
130	48	5
131	48	6
132	48	7
133	49	4
134	49	5
135	49	6
136	49	8
137	49	9
138	49	10
139	49	11
140	49	12
141	50	4
142	50	5
143	50	6
144	50	8
145	50	9
146	50	10
147	50	11
148	50	12
149	51	8
150	51	5
151	51	6
152	51	7
153	52	18
154	52	19
155	52	13
156	52	14
157	53	8
158	53	5
159	53	6
160	53	7
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
145	45	2
146	45	3
147	46	14
148	47	2
149	47	3
150	48	8
151	48	17
152	48	14
153	48	15
154	49	17
155	49	35
156	50	17
157	50	35
158	51	8
159	51	14
160	51	15
161	52	22
162	53	8
163	53	17
\.


--
-- Data for Name: post_postimage; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_postimage (id, created_at, updated_at, image, post_id) FROM stdin;
1	2022-08-15 12:05:02.662528+00	2022-08-15 12:05:02.662562+00	posts/Screenshot_from_2022-08-14_22-19-40.png	6
2	2022-08-15 12:05:02.667339+00	2022-08-15 12:05:02.667365+00	posts/Screenshot_from_2022-08-13_22-07-53.png	6
3	2022-08-15 12:05:02.670388+00	2022-08-15 12:05:02.670409+00	posts/Screenshot_from_2022-08-08_09-23-38.png	6
4	2022-08-15 12:05:02.675345+00	2022-08-15 12:05:02.675366+00	posts/Screenshot_from_2022-07-24_14-57-04.png	6
5	2022-08-16 09:44:57.282872+00	2022-08-16 09:44:57.282903+00	posts/Screenshot_from_2022-08-03_18-01-03.png	4
6	2022-08-16 09:45:00.808116+00	2022-08-16 09:45:00.80821+00	posts/Screenshot_from_2022-08-03_18-01-03_qJ5FTcH.png	4
7	2022-08-16 09:45:02.008476+00	2022-08-16 09:45:02.008514+00	posts/Screenshot_from_2022-08-03_18-01-03_MDVbyb4.png	4
8	2022-08-16 09:45:03.341083+00	2022-08-16 09:45:03.341104+00	posts/Screenshot_from_2022-08-03_18-01-03_AnlAeAO.png	4
9	2022-08-16 09:45:04.419362+00	2022-08-16 09:45:04.419384+00	posts/Screenshot_from_2022-08-03_18-01-03_igb0huw.png	4
10	2022-08-18 13:48:39.072591+00	2022-08-18 13:48:39.072617+00	posts/photo_2022-07-23_01-51-28.jpg	6
11	2022-08-22 11:36:58.500852+00	2022-08-22 11:36:58.500878+00	some_image.jpg	30
12	2022-08-22 11:39:35.485235+00	2022-08-22 11:39:35.485273+00	media/posts/some_image2022-08-22 11:39:35.476559+00:00.jpg	32
13	2022-08-22 11:57:19.732931+00	2022-08-22 11:57:19.732955+00	posts/image_name.jpg	39
14	2022-08-22 11:57:53.314403+00	2022-08-22 11:57:53.314428+00	posts/image_name_hQFQmkn.jpg	40
15	2022-08-22 11:58:31.333464+00	2022-08-22 11:58:31.333493+00	posts/image_name_nArBEAU.jpg	41
16	2022-08-22 12:00:01.1138+00	2022-08-22 12:00:01.113825+00	posts/image_name_h8N3Mwf.jpg	42
17	2022-09-21 07:51:43.039459+00	2022-09-21 07:51:43.039515+00	posts/image_picker1786958681165562467.jpg	48
18	2022-09-22 12:18:35.174491+00	2022-09-22 12:18:35.174545+00	posts/image_picker7676247540309691092.jpg	51
19	2022-09-22 13:37:47.660354+00	2022-09-22 13:37:47.660392+00	posts/image_picker967274061726669974.jpg	52
20	2022-09-22 13:59:29.642312+00	2022-09-22 13:59:29.642333+00	posts/image_picker6728123965235184348.jpg	53
21	2022-09-22 13:59:29.650194+00	2022-09-22 13:59:29.650211+00	posts/image_picker2610682742697329491.jpg	53
\.


--
-- Data for Name: post_timer; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_timer (id, start, pause, finish, price, total_price, post_id, user_id, created_at, updated_at) FROM stdin;
1	2022-08-26 04:26:03.478039+00	2022-08-26 06:26:03.478039+00	\N	15000	\N	5	6	2022-09-27 12:52:11.513642+00	2022-09-27 12:52:11.513723+00
\.


--
-- Data for Name: post_wishlist; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.post_wishlist (id, created_at, updated_at, is_like, post_id, user_id) FROM stdin;
2	2022-08-17 10:51:20.616823+00	2022-08-17 10:51:35.612834+00	f	\N	9
1	2022-08-17 10:50:56.951712+00	2022-08-30 12:01:57.131913+00	f	3	9
11	2022-08-30 13:47:32.918658+00	2022-08-30 13:48:01.287528+00	f	1	75
\.


--
-- Data for Name: proposals_invoice; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.proposals_invoice (id, created_at, updated_at, card, is_withdraw, amount, user_id, date) FROM stdin;
2	2022-08-22 06:09:04.544733+00	2022-08-22 06:09:04.544767+00	9860350109483742	f	50000	6	0227
3	2022-08-22 06:17:39.993883+00	2022-08-22 06:17:39.993915+00	9860350109483742	f	50000	6	0227
4	2022-08-22 06:18:04.619868+00	2022-08-22 06:18:04.619951+00	9860350109483742	f	50000	6	0227
5	2022-08-22 07:32:48.314911+00	2022-08-22 07:32:48.314939+00	9860350109483742	f	50000	6	0227
6	2022-08-22 07:33:12.480304+00	2022-08-22 07:33:12.480333+00	\N	t	5000	6	\N
\.


--
-- Data for Name: proposals_proposal; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.proposals_proposal (id, created_at, updated_at, description, price, post_id, user_id, admin_status, client_status, is_new) FROM stdin;
1	2022-08-16 11:57:47.319654+00	2022-08-16 12:16:28.099086+00	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	2	9	pending	pending	t
3	2022-08-19 06:13:37.005201+00	2022-08-19 06:13:37.005236+00	there are some descriptions here.	500000	6	7	approved	approved	t
4	2022-08-22 07:05:40.179215+00	2022-08-22 07:05:40.179243+00	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	2	6	pending	pending	f
7	2022-08-24 08:39:23.985035+00	2022-08-24 08:41:56.272928+00	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	4	8	approved	pending	f
2	2022-08-19 06:12:46.364087+00	2022-08-24 10:35:17.042007+00	desc here	120000	5	53	approved	archived	t
5	2022-08-24 08:39:08.679737+00	2022-08-24 10:44:32.126136+00	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	4	9	approved	archived	f
6	2022-08-24 08:39:15.251924+00	2022-08-27 12:21:47.159417+00	Uzun description bor  buyerda, Judayam uuuzuuuun	2500000	4	6	approved	archived	f
\.


--
-- Data for Name: proposals_review; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.proposals_review (id, created_at, updated_at, comment, post_id, user_id, rate, is_client) FROM stdin;
1	2022-08-19 11:15:23.386862+00	2022-08-19 11:15:23.386892+00	Ish yaxshi bo'ldi	3	9	0	t
2	2022-08-19 11:15:42.737064+00	2022-08-19 11:15:42.737087+00	Ish yaxshi bo'ldi	4	6	5	t
3	2022-08-20 07:05:16.656399+00	2022-08-20 07:05:16.656426+00	Shunaqa Gaplar	3	50	5	f
4	2022-08-20 07:09:45.1547+00	2022-08-20 07:09:45.154821+00	comment here	5	54	5	t
5	2022-08-20 07:10:17.272803+00	2022-08-20 07:10:17.272833+00	Lorem ipsum — классический текст-«рыба». Является искажённым отрывком из философского трактата Марка Туллия Цицерона «О пределах добра и зла», написанного в 45 году до н. э. на латинском языке, обнаружение сходства	1	57	3	f
6	2022-08-20 07:10:33.219062+00	2022-08-20 07:10:33.219172+00	Ish yaxshi bo'ldi	4	6	5	t
7	2022-08-20 07:10:49.563933+00	2022-08-20 07:10:49.563957+00	Ish yaxshi bo'ldi	4	6	5	f
8	2022-08-20 07:12:10.695459+00	2022-08-20 07:12:10.695486+00	Lorem ipsum — классический текст-«рыба». Является искажённым отрывком из философского трактата Марка Туллия Цицерона «О пределах добра и зла», написанного в 45 году до н. э. на латинском языке, обнаружение сходства	7	54	2	t
9	2022-08-20 07:16:31.637861+00	2022-08-20 07:16:31.637885+00	JA zo'r ishlamas ekan	1	54	3	t
10	2022-08-20 09:58:32.001485+00	2022-08-20 09:58:32.001522+00	asdfhghj	3	52	5	t
\.


--
-- Data for Name: proposals_statuschanges; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.proposals_statuschanges (id, from_status, to_status, is_post, post_id, proposal_id, user_id, portfolio_id) FROM stdin;
\.


--
-- Data for Name: registration_category; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.registration_category (id, created_at, updated_at, name, image, status) FROM stdin;
2	2022-08-06 13:38:49.193262+00	2022-08-06 13:38:49.193289+00	Santexnika	category/Screenshot_from_2022-07-21_18-27-11.png	active
1	2022-08-06 10:31:37.76837+00	2022-08-06 13:39:07.214385+00	Qurilish	category/Screenshot_from_2022-07-20_10-58-44.png	active
3	2022-08-06 14:21:44.463287+00	2022-08-06 14:21:44.463325+00	Usta	category/Screenshot_from_2022-07-21_18-27-11_mMhScYt.png	active
4	2022-08-16 09:17:55.318194+00	2022-08-16 09:17:55.318223+00	Usta		active
5	2022-08-17 09:13:38.223211+00	2022-08-17 09:13:38.223244+00	Oynachi		active
6	2022-08-17 09:14:37.558862+00	2022-08-17 09:14:37.55889+00	taxtachi		active
12	2022-08-17 09:25:40.97316+00	2022-08-17 09:25:40.973272+00	as	category/so-h-align-left.svg	active
11	2022-08-17 09:24:40.774916+00	2022-08-18 08:52:42.217803+00	Shuvoqchi2	category/so-folder-structure.svg	active
7	2022-08-17 09:15:31.331337+00	2022-08-18 08:53:03.932405+00	Usta2	category/so-pen-tool.svg	active
8	2022-08-17 09:15:55.611395+00	2022-08-18 09:06:15.860289+00	Loykashbek	category/so-cube.svg	active
9	2022-08-17 09:17:29.179808+00	2022-08-18 09:14:18.918653+00	Loy	category/img.png	active
10	2022-08-17 09:20:40.80607+00	2022-08-18 09:14:45.847857+00	Shuvoqchi	category/so-brush.svg	active
15	2022-08-19 07:32:12.246894+00	2022-08-19 07:32:12.246922+00	NEW KATEGORY	category/so-braidshirt.svg	active
14	2022-08-19 07:31:24.765612+00	2022-08-19 10:59:19.730077+00	yangi kategoriya shekilli	category/img_r5v41ps.svg	active
13	2022-08-17 09:27:51.414365+00	2022-08-19 10:59:31.391589+00	narmalna	category/img_sd3ePPE.svg	active
16	2022-08-19 11:00:37.875855+00	2022-08-19 11:00:37.875891+00	Bugalter	category/so-toll.svg	active
17	2022-08-19 11:04:26.403062+00	2022-08-19 11:04:26.403096+00	lol	category/so-qr-code.svg	active
18	2022-08-19 11:06:35.338676+00	2022-08-19 11:06:35.338707+00	soldier	category/so-description.svg	active
19	2022-08-19 11:07:09.782656+00	2022-08-19 11:07:09.782688+00	asal	category/so-seo.svg	active
20	2022-08-19 11:08:29.555682+00	2022-08-19 11:08:29.555713+00	categorr19	category/so-workflow.svg	active
21	2022-08-19 11:09:05.245357+00	2022-08-19 11:09:05.245393+00	lol 2	category/so-select-all.svg	active
\.


--
-- Data for Name: registration_city; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.registration_city (id, created_at, updated_at, name, region_id) FROM stdin;
15	2022-08-06 11:07:27.510987+00	2022-08-06 11:07:27.511027+00	Amudaryo tumani	1
16	2022-08-06 11:07:27.807873+00	2022-08-06 11:07:27.8079+00	Beruniy tumani	1
17	2022-08-06 11:07:27.814047+00	2022-08-06 11:07:27.814078+00	Kegayli tumani	1
18	2022-08-06 11:07:27.819972+00	2022-08-06 11:07:27.819999+00	Qonliko‘l tumani	1
19	2022-08-06 11:07:27.823756+00	2022-08-06 11:07:27.823779+00	Qorao‘zak tumani	1
20	2022-08-06 11:07:27.826352+00	2022-08-06 11:07:27.826375+00	Qo‘ng‘irot tumani	1
21	2022-08-06 11:07:27.829165+00	2022-08-06 11:07:27.829191+00	Mo‘ynoq tumani	1
22	2022-08-06 11:07:27.831606+00	2022-08-06 11:07:27.83163+00	Nukus tumani	1
23	2022-08-06 11:07:27.834184+00	2022-08-06 11:07:27.834206+00	Nukus shahri	1
24	2022-08-06 11:07:27.839915+00	2022-08-06 11:07:27.839939+00	Taxtako‘pir tumani	1
25	2022-08-06 11:07:27.843561+00	2022-08-06 11:07:27.843586+00	To‘rtko‘l tumani	1
26	2022-08-06 11:07:27.845774+00	2022-08-06 11:07:27.845797+00	Xo‘jayli tumani	1
27	2022-08-06 11:07:27.848552+00	2022-08-06 11:07:27.848575+00	Chimboy tumani	1
28	2022-08-06 11:07:27.85109+00	2022-08-06 11:07:27.851113+00	Shumanay tumani	1
29	2022-08-06 11:07:27.854402+00	2022-08-06 11:07:27.854431+00	Ellikqal‘a tumani	1
30	2022-08-06 11:07:27.858721+00	2022-08-06 11:07:27.858746+00	Andijon shahri	2
31	2022-08-06 11:07:27.861436+00	2022-08-06 11:07:27.86146+00	Andijon tumani	2
32	2022-08-06 11:07:27.86428+00	2022-08-06 11:07:27.864308+00	Asaka tumani	2
33	2022-08-06 11:07:27.869481+00	2022-08-06 11:07:27.869506+00	Baliqchi tumani	2
34	2022-08-06 11:07:27.871993+00	2022-08-06 11:07:27.872017+00	Buloqboshi tumani	2
35	2022-08-06 11:07:27.875588+00	2022-08-06 11:07:27.875613+00	Bo‘z tumani	2
36	2022-08-06 11:07:27.878765+00	2022-08-06 11:07:27.878789+00	Jalaquduq tumani	2
37	2022-08-06 11:07:27.88198+00	2022-08-06 11:07:27.882006+00	Izbosgan tumani	2
38	2022-08-06 11:07:27.888078+00	2022-08-06 11:07:27.888105+00	Qorasuv shahri	2
39	2022-08-06 11:07:27.894248+00	2022-08-06 11:07:27.894273+00	Qo‘rg‘ontepa tumani	2
40	2022-08-06 11:07:27.897144+00	2022-08-06 11:07:27.897172+00	Marhamat tumani	2
41	2022-08-06 11:07:27.900242+00	2022-08-06 11:07:27.900268+00	Oltinko‘l tumani	2
42	2022-08-06 11:07:27.905133+00	2022-08-06 11:07:27.905162+00	Paxtaobod tumani	2
43	2022-08-06 11:07:27.907976+00	2022-08-06 11:07:27.908002+00	Ulug‘nor tumani	2
44	2022-08-06 11:07:27.911453+00	2022-08-06 11:07:27.911478+00	Xonabod tumani	2
45	2022-08-06 11:07:27.915584+00	2022-08-06 11:07:27.915608+00	Xo‘jaobod tumani	2
46	2022-08-06 11:07:27.92023+00	2022-08-06 11:07:27.920258+00	Shahrixon tumani	2
47	2022-08-06 11:07:27.924017+00	2022-08-06 11:07:27.924041+00	Buxoro shahri	3
48	2022-08-06 11:07:27.926883+00	2022-08-06 11:07:27.926908+00	Buxoro tumani	3
49	2022-08-06 11:07:27.931218+00	2022-08-06 11:07:27.931246+00	Vobkent tumani	3
50	2022-08-06 11:07:27.934396+00	2022-08-06 11:07:27.93442+00	G‘ijduvon tumani	3
51	2022-08-06 11:07:27.938417+00	2022-08-06 11:07:27.938441+00	Jondor tumani	3
52	2022-08-06 11:07:27.941218+00	2022-08-06 11:07:27.941245+00	Kogon tumani	3
53	2022-08-06 11:07:27.944267+00	2022-08-06 11:07:27.944291+00	Kogon shahri	3
54	2022-08-06 11:07:27.947941+00	2022-08-06 11:07:27.947968+00	Qorako‘l tumani	3
55	2022-08-06 11:07:27.95065+00	2022-08-06 11:07:27.950695+00	Qorovulbozor tumani	3
56	2022-08-06 11:07:27.954617+00	2022-08-06 11:07:27.954641+00	Olot tumani	3
57	2022-08-06 11:07:27.958073+00	2022-08-06 11:07:27.958099+00	Peshku tumani	3
58	2022-08-06 11:07:27.960604+00	2022-08-06 11:07:27.96063+00	Romitan tumani	3
59	2022-08-06 11:07:27.965493+00	2022-08-06 11:07:27.965518+00	Shofirkon tumani	3
60	2022-08-06 11:07:27.968481+00	2022-08-06 11:07:27.968503+00	Arnasoy tumani	4
61	2022-08-06 11:07:27.971399+00	2022-08-06 11:07:27.971425+00	Baxmal tumani	4
62	2022-08-06 11:07:27.974769+00	2022-08-06 11:07:27.974796+00	G‘allaorol tumani	4
63	2022-08-06 11:07:27.977461+00	2022-08-06 11:07:27.977485+00	Do‘stlik tumani	4
64	2022-08-06 11:07:27.98162+00	2022-08-06 11:07:27.981645+00	Sh.Rashidov tumani	4
65	2022-08-06 11:07:27.991059+00	2022-08-06 11:07:27.991082+00	Jizzax shahri	4
66	2022-08-06 11:07:27.995355+00	2022-08-06 11:07:27.99538+00	Zarbdor tumani	4
67	2022-08-06 11:07:27.998746+00	2022-08-06 11:07:27.998776+00	Zafarobod tumani	4
68	2022-08-06 11:07:28.005891+00	2022-08-06 11:07:28.005918+00	Zomin tumani	4
69	2022-08-06 11:07:28.01546+00	2022-08-06 11:07:28.015487+00	Mirzacho‘l tumani	4
70	2022-08-06 11:07:28.020376+00	2022-08-06 11:07:28.020405+00	Paxtakor tumani	4
71	2022-08-06 11:07:28.030906+00	2022-08-06 11:07:28.030953+00	Forish tumani	4
72	2022-08-06 11:07:28.034458+00	2022-08-06 11:07:28.034487+00	Yangiobod tumani	4
73	2022-08-06 11:07:28.039233+00	2022-08-06 11:07:28.039259+00	G‘uzor tumani	5
74	2022-08-06 11:07:28.044005+00	2022-08-06 11:07:28.044031+00	Dehqonobod tumani	5
75	2022-08-06 11:07:28.049667+00	2022-08-06 11:07:28.049694+00	Qamashi tumani	5
76	2022-08-06 11:07:28.053853+00	2022-08-06 11:07:28.053886+00	Qarshi tumani	5
77	2022-08-06 11:07:28.060928+00	2022-08-06 11:07:28.060954+00	Qarshi shahri	5
78	2022-08-06 11:07:28.07178+00	2022-08-06 11:07:28.071809+00	Kasbi tumani	5
79	2022-08-06 11:07:28.075217+00	2022-08-06 11:07:28.075245+00	Kitob tumani	5
80	2022-08-06 11:07:28.088065+00	2022-08-06 11:07:28.088093+00	Koson tumani	5
81	2022-08-06 11:07:28.094239+00	2022-08-06 11:07:28.094264+00	Mirishkor tumani	5
82	2022-08-06 11:07:28.097908+00	2022-08-06 11:07:28.097932+00	Muborak tumani	5
83	2022-08-06 11:07:28.104322+00	2022-08-06 11:07:28.104347+00	Nishon tumani	5
84	2022-08-06 11:07:28.106981+00	2022-08-06 11:07:28.107003+00	Chiroqchi tumani	5
85	2022-08-06 11:07:28.111906+00	2022-08-06 11:07:28.111929+00	Shahrisabz tumani	5
86	2022-08-06 11:07:28.116767+00	2022-08-06 11:07:28.116789+00	Yakkabog‘ tumani	5
87	2022-08-06 11:07:28.12614+00	2022-08-06 11:07:28.126164+00	Zarafshon shahri	6
88	2022-08-06 11:07:28.13149+00	2022-08-06 11:07:28.131518+00	Karmana tumani	6
89	2022-08-06 11:07:28.1383+00	2022-08-06 11:07:28.138326+00	Qiziltepa tumani	6
90	2022-08-06 11:07:28.144236+00	2022-08-06 11:07:28.144259+00	Konimex tumani	6
91	2022-08-06 11:07:28.148171+00	2022-08-06 11:07:28.148195+00	Navbahor tumani	6
92	2022-08-06 11:07:28.152004+00	2022-08-06 11:07:28.15203+00	Navoiy shahri	6
93	2022-08-06 11:07:28.164738+00	2022-08-06 11:07:28.164762+00	Nurota tumani	6
94	2022-08-06 11:07:28.169644+00	2022-08-06 11:07:28.16967+00	Tomdi tumani	6
95	2022-08-06 11:07:28.174268+00	2022-08-06 11:07:28.174293+00	Uchquduq tumani	6
96	2022-08-06 11:07:28.180879+00	2022-08-06 11:07:28.180909+00	Xatirchi tumani	6
97	2022-08-06 11:07:28.184372+00	2022-08-06 11:07:28.184396+00	Kosonsoy tumani	7
98	2022-08-06 11:07:28.187329+00	2022-08-06 11:07:28.18736+00	Mingbuloq tumani	7
99	2022-08-06 11:07:28.195027+00	2022-08-06 11:07:28.195054+00	Namangan tumani	7
100	2022-08-06 11:07:28.200023+00	2022-08-06 11:07:28.200046+00	Namangan shahri	7
101	2022-08-06 11:07:28.205507+00	2022-08-06 11:07:28.205534+00	Norin tumani	7
102	2022-08-06 11:07:28.210537+00	2022-08-06 11:07:28.210565+00	Pop tumani	7
103	2022-08-06 11:07:28.223181+00	2022-08-06 11:07:28.223208+00	To‘raqo‘rg‘on tumani	7
104	2022-08-06 11:07:28.226612+00	2022-08-06 11:07:28.226636+00	Uychi tumani	7
105	2022-08-06 11:07:28.231306+00	2022-08-06 11:07:28.231331+00	Uchqo‘rg‘on tumani	7
106	2022-08-06 11:07:28.234925+00	2022-08-06 11:07:28.234954+00	Chortoq tumani	7
107	2022-08-06 11:07:28.238875+00	2022-08-06 11:07:28.2389+00	Chust tumani	7
108	2022-08-06 11:07:28.246294+00	2022-08-06 11:07:28.246335+00	Yangiqo‘rg‘on tumani	7
109	2022-08-06 11:07:28.249919+00	2022-08-06 11:07:28.249943+00	Bulung‘ur tumani	8
110	2022-08-06 11:07:28.254699+00	2022-08-06 11:07:28.254726+00	Jomboy tumani	8
111	2022-08-06 11:07:28.259287+00	2022-08-06 11:07:28.259312+00	Ishtixon tumani	8
112	2022-08-06 11:07:28.263178+00	2022-08-06 11:07:28.263206+00	Kattaqo‘rg‘on tumani	8
113	2022-08-06 11:07:28.266652+00	2022-08-06 11:07:28.266692+00	Kattaqo‘rg‘on shahri	8
114	2022-08-06 11:07:28.269639+00	2022-08-06 11:07:28.269665+00	Qo‘shrabot tumani	8
115	2022-08-06 11:07:28.275969+00	2022-08-06 11:07:28.275995+00	Narpay tumani	8
116	2022-08-06 11:07:28.282094+00	2022-08-06 11:07:28.283086+00	Nurabod tumani	8
117	2022-08-06 11:07:28.287247+00	2022-08-06 11:07:28.287271+00	Oqdaryo tumani	8
118	2022-08-06 11:07:28.290815+00	2022-08-06 11:07:28.29084+00	Payariq tumani	8
119	2022-08-06 11:07:28.293479+00	2022-08-06 11:07:28.293501+00	Pastarg‘om tumani	8
120	2022-08-06 11:07:28.295909+00	2022-08-06 11:07:28.29593+00	Paxtachi tumani	8
121	2022-08-06 11:07:28.298664+00	2022-08-06 11:07:28.298702+00	Samarqand tumani	8
122	2022-08-06 11:07:28.300858+00	2022-08-06 11:07:28.300878+00	Samarqand shahri	8
123	2022-08-06 11:07:28.303629+00	2022-08-06 11:07:28.303654+00	Toyloq tumani	8
124	2022-08-06 11:07:28.327899+00	2022-08-06 11:07:28.327921+00	Urgut tumani	8
125	2022-08-06 11:07:28.331444+00	2022-08-06 11:07:28.331467+00	Angor tumani	9
126	2022-08-06 11:07:28.334336+00	2022-08-06 11:07:28.334358+00	Boysun tumani	9
127	2022-08-06 11:07:28.336864+00	2022-08-06 11:07:28.336887+00	Denov tumani	9
128	2022-08-06 11:07:28.33949+00	2022-08-06 11:07:28.339511+00	Jarqo‘rg‘on tumani	9
129	2022-08-06 11:07:28.345451+00	2022-08-06 11:07:28.345473+00	Qiziriq tumani	9
130	2022-08-06 11:07:28.348053+00	2022-08-06 11:07:28.348074+00	Qo‘mqo‘rg‘on tumani	9
131	2022-08-06 11:07:28.350422+00	2022-08-06 11:07:28.350442+00	Muzrabot tumani	9
132	2022-08-06 11:07:28.352778+00	2022-08-06 11:07:28.352798+00	Oltinsoy tumani	9
133	2022-08-06 11:07:28.355319+00	2022-08-06 11:07:28.355341+00	Sariosiyo tumani	9
134	2022-08-06 11:07:28.359519+00	2022-08-06 11:07:28.359542+00	Termiz tumani	9
135	2022-08-06 11:07:28.362011+00	2022-08-06 11:07:28.362032+00	Termiz shahri	9
136	2022-08-06 11:07:28.364799+00	2022-08-06 11:07:28.364823+00	Uzun tumani	9
137	2022-08-06 11:07:28.367354+00	2022-08-06 11:07:28.367376+00	Sherobod tumani	9
138	2022-08-06 11:07:28.369779+00	2022-08-06 11:07:28.369802+00	Sho‘rchi tumani	9
139	2022-08-06 11:07:28.372642+00	2022-08-06 11:07:28.372663+00	Boyovut tumani	10
140	2022-08-06 11:07:28.376002+00	2022-08-06 11:07:28.376025+00	Guliston tumani	10
141	2022-08-06 11:07:28.381489+00	2022-08-06 11:07:28.381514+00	Guliston shahri	10
142	2022-08-06 11:07:28.384201+00	2022-08-06 11:07:28.384224+00	Mirzaobod tumani	10
143	2022-08-06 11:07:28.386475+00	2022-08-06 11:07:28.386495+00	Oqoltin tumani	10
144	2022-08-06 11:07:28.388913+00	2022-08-06 11:07:28.388932+00	Sayxunobod tumani	10
145	2022-08-06 11:07:28.390834+00	2022-08-06 11:07:28.390853+00	Sardoba tumani	10
146	2022-08-06 11:07:28.393154+00	2022-08-06 11:07:28.393172+00	Sirdaryo tumani	10
147	2022-08-06 11:07:28.395476+00	2022-08-06 11:07:28.395495+00	Xavos tumani	10
148	2022-08-06 11:07:28.398112+00	2022-08-06 11:07:28.398137+00	Shirin shahri	10
149	2022-08-06 11:07:28.400276+00	2022-08-06 11:07:28.400296+00	Yangiyer shahri	10
150	2022-08-06 11:07:28.402534+00	2022-08-06 11:07:28.402555+00	Angiren shahri	11
151	2022-08-06 11:07:28.404991+00	2022-08-06 11:07:28.405011+00	Bekabod tumani	11
152	2022-08-06 11:07:28.407243+00	2022-08-06 11:07:28.407261+00	Bekabod shahri	11
153	2022-08-06 11:07:28.40915+00	2022-08-06 11:07:28.409166+00	Bo‘ka tumani	11
154	2022-08-06 11:07:28.411458+00	2022-08-06 11:07:28.411477+00	Bo‘stonliq tumani	11
155	2022-08-06 11:07:28.41455+00	2022-08-06 11:07:28.414571+00	Zangiota tumani	11
156	2022-08-06 11:07:28.416838+00	2022-08-06 11:07:28.416854+00	Qibray tumani	11
157	2022-08-06 11:07:28.41833+00	2022-08-06 11:07:28.418343+00	Quyichirchiq tumani	11
158	2022-08-06 11:07:28.420263+00	2022-08-06 11:07:28.420279+00	Oqqo‘rg‘on tumani	11
159	2022-08-06 11:07:28.422121+00	2022-08-06 11:07:28.422139+00	Olmaliq shahri	11
160	2022-08-06 11:07:28.424463+00	2022-08-06 11:07:28.42448+00	Ohangaron tumani	11
161	2022-08-06 11:07:28.426315+00	2022-08-06 11:07:28.42633+00	Parkent tumani	11
162	2022-08-06 11:07:28.428387+00	2022-08-06 11:07:28.428403+00	Piskent tumani	11
163	2022-08-06 11:07:28.430564+00	2022-08-06 11:07:28.430586+00	O‘rtachirchiq tumani	11
164	2022-08-06 11:07:28.432955+00	2022-08-06 11:07:28.432972+00	Chinoz tumani	11
165	2022-08-06 11:07:28.434637+00	2022-08-06 11:07:28.434652+00	Chirchiq shahri	11
166	2022-08-06 11:07:28.436651+00	2022-08-06 11:07:28.436675+00	Yuqorichirchiq tumani	11
167	2022-08-06 11:07:28.438541+00	2022-08-06 11:07:28.438555+00	Yangiyo‘l tumani	11
168	2022-08-06 11:07:28.440592+00	2022-08-06 11:07:28.440608+00	Beshariq tumani	12
169	2022-08-06 11:07:28.442271+00	2022-08-06 11:07:28.442287+00	Bog‘dod tumani	12
170	2022-08-06 11:07:28.444714+00	2022-08-06 11:07:28.444732+00	Buvayda tumani	12
171	2022-08-06 11:07:28.447328+00	2022-08-06 11:07:28.447355+00	Dang‘ara tumani	12
172	2022-08-06 11:07:28.449931+00	2022-08-06 11:07:28.449951+00	Yozyovon tumani	12
173	2022-08-06 11:07:28.451652+00	2022-08-06 11:07:28.451671+00	Quva tumani	12
174	2022-08-06 11:07:28.45374+00	2022-08-06 11:07:28.453758+00	Quvasoy shahri	12
175	2022-08-06 11:07:28.455641+00	2022-08-06 11:07:28.455656+00	Qo‘qon shahri	12
176	2022-08-06 11:07:28.457935+00	2022-08-06 11:07:28.457957+00	Qo‘shtepa tumani	12
177	2022-08-06 11:07:28.459757+00	2022-08-06 11:07:28.459774+00	Marg‘ilon shahri	12
178	2022-08-06 11:07:28.461778+00	2022-08-06 11:07:28.461796+00	Oltiariq tumani	12
179	2022-08-06 11:07:28.464375+00	2022-08-06 11:07:28.464401+00	Rishton tumani	12
180	2022-08-06 11:07:28.466886+00	2022-08-06 11:07:28.466905+00	So‘x tumani	12
181	2022-08-06 11:07:28.468637+00	2022-08-06 11:07:28.468654+00	Toshloq tumani	12
182	2022-08-06 11:07:28.470939+00	2022-08-06 11:07:28.47096+00	Uchko‘prik tumani	12
183	2022-08-06 11:07:28.472916+00	2022-08-06 11:07:28.472932+00	O‘zbekiston tumani	12
184	2022-08-06 11:07:28.475119+00	2022-08-06 11:07:28.475137+00	Farg‘ona tumani	12
185	2022-08-06 11:07:28.476819+00	2022-08-06 11:07:28.476834+00	Farg‘ona shahri	12
186	2022-08-06 11:07:28.478683+00	2022-08-06 11:07:28.478703+00	Furqat tumani	12
187	2022-08-06 11:07:28.481238+00	2022-08-06 11:07:28.481257+00	Bog‘ot tumani	13
188	2022-08-06 11:07:28.483317+00	2022-08-06 11:07:28.483334+00	Gurlan tumani	13
189	2022-08-06 11:07:28.485231+00	2022-08-06 11:07:28.485246+00	Qo‘shko‘pir tumani	13
190	2022-08-06 11:07:28.487292+00	2022-08-06 11:07:28.487309+00	Urganch tumani	13
191	2022-08-06 11:07:28.489239+00	2022-08-06 11:07:28.489254+00	Urganch shahri	13
192	2022-08-06 11:07:28.491284+00	2022-08-06 11:07:28.4913+00	Xiva tumani	13
193	2022-08-06 11:07:28.493205+00	2022-08-06 11:07:28.493221+00	Xazarasp tumani	13
194	2022-08-06 11:07:28.495134+00	2022-08-06 11:07:28.49515+00	Xonqa tumani	13
195	2022-08-06 11:07:28.497747+00	2022-08-06 11:07:28.497771+00	Shavot tumani	13
196	2022-08-06 11:07:28.499915+00	2022-08-06 11:07:28.499931+00	Yangiariq tumani	13
197	2022-08-06 11:07:28.501379+00	2022-08-06 11:07:28.501395+00	Yangibozor tumani	13
198	2022-08-06 11:07:28.503301+00	2022-08-06 11:07:28.50332+00	Bektimer tumani	14
199	2022-08-06 11:07:28.505359+00	2022-08-06 11:07:28.505375+00	Mirzo Ulug'bek tumani	14
200	2022-08-06 11:07:28.507291+00	2022-08-06 11:07:28.507308+00	Mirobod tumani	14
201	2022-08-06 11:07:28.509064+00	2022-08-06 11:07:28.509079+00	Olmazor tumani	14
202	2022-08-06 11:07:28.510884+00	2022-08-06 11:07:28.510898+00	Sirg'ali tumani	14
203	2022-08-06 11:07:28.51266+00	2022-08-06 11:07:28.512681+00	Uchtepa tumani	14
204	2022-08-06 11:07:28.515754+00	2022-08-06 11:07:28.515771+00	Yashnobod tumani	14
205	2022-08-06 11:07:28.517507+00	2022-08-06 11:07:28.517522+00	Chilonzor tumani	14
206	2022-08-06 11:07:28.519446+00	2022-08-06 11:07:28.51946+00	Shayxontohur tumani	14
207	2022-08-06 11:07:28.521511+00	2022-08-06 11:07:28.521525+00	Yunusobod tumani	14
208	2022-08-06 11:07:28.523504+00	2022-08-06 11:07:28.523524+00	Yakkasaroy tumani	14
209	2022-08-06 11:07:28.525267+00	2022-08-06 11:07:28.525283+00	Taxiatosh shahri	1
210	2022-08-06 11:07:28.527168+00	2022-08-06 11:07:28.527184+00	Asaka shahri	2
211	2022-08-06 11:07:28.529026+00	2022-08-06 11:07:28.529041+00	Bandixon tumani	9
212	2022-08-06 11:07:28.531767+00	2022-08-06 11:07:28.531786+00	Ohangaron shahri	11
213	2022-08-06 11:07:28.533812+00	2022-08-06 11:07:28.533829+00	Yangiyo‘l shahri	11
215	2022-08-06 11:07:28.535781+00	2022-08-06 11:07:28.535797+00	Toshkent tumani	11
216	2022-08-06 11:07:28.537803+00	2022-08-06 11:07:28.537824+00	Xiva shahri	13
217	2022-08-06 11:07:28.539661+00	2022-08-06 11:07:28.539677+00	Do'stlik shahri	13
218	2022-08-06 11:07:28.541641+00	2022-08-06 11:07:28.541659+00	Yangihayot tumani	14
219	2022-08-06 11:07:28.543781+00	2022-08-06 11:07:28.543799+00	Tuproqqala tumani	13
220	2022-08-06 11:07:28.545758+00	2022-08-06 11:07:28.545775+00	Davlatobod tumani	7
221	2022-08-06 11:07:28.548344+00	2022-08-06 11:07:28.548363+00	G‘ozg‘on shahri	6
222	2022-08-06 11:07:28.550162+00	2022-08-06 11:07:28.550179+00	Bo‘zatov tumani	1
224	2022-08-06 11:07:28.552024+00	2022-08-06 11:07:28.55204+00	Shahrisabz shahri	5
225	2022-08-06 11:07:28.554127+00	2022-08-06 11:07:28.554146+00	Ko‘kdala tumani	5
\.


--
-- Data for Name: registration_region; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.registration_region (id, created_at, updated_at, name) FROM stdin;
1	2022-08-06 11:04:39.655295+00	2022-08-06 11:04:39.655339+00	Qoraqalpog‘iston Respublikasi
2	2022-08-06 11:04:39.888686+00	2022-08-06 11:04:39.888714+00	Andijon viloyati
3	2022-08-06 11:04:39.896007+00	2022-08-06 11:04:39.896034+00	Buxoro viloyati
4	2022-08-06 11:04:39.899515+00	2022-08-06 11:04:39.899544+00	Jizzax viloyati
5	2022-08-06 11:04:39.902955+00	2022-08-06 11:04:39.90298+00	Qashqadaryo viloyati
6	2022-08-06 11:04:39.906237+00	2022-08-06 11:04:39.906264+00	Navoiy viloyati
7	2022-08-06 11:04:39.909347+00	2022-08-06 11:04:39.909374+00	Namangan viloyati
8	2022-08-06 11:04:39.913708+00	2022-08-06 11:04:39.913733+00	Samarqand viloyati
9	2022-08-06 11:04:39.916657+00	2022-08-06 11:04:39.916683+00	Surxandaryo viloyati
10	2022-08-06 11:04:39.919389+00	2022-08-06 11:04:39.919423+00	Sirdaryo viloyati
11	2022-08-06 11:04:39.923943+00	2022-08-06 11:04:39.923968+00	Toshkent viloyati
12	2022-08-06 11:04:39.927195+00	2022-08-06 11:04:39.927227+00	Farg‘ona viloyati
13	2022-08-06 11:04:39.932157+00	2022-08-06 11:04:39.932183+00	Xorazm viloyati
14	2022-08-06 11:04:39.934901+00	2022-08-06 11:04:39.93493+00	Toshkent shahri
\.


--
-- Data for Name: registration_subcategory; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.registration_subcategory (id, created_at, updated_at, name, category_id) FROM stdin;
1	2022-08-06 10:32:06.564753+00	2022-08-06 10:32:06.564782+00	Rakvina	1
2	2022-08-06 10:32:23.65081+00	2022-08-06 10:32:23.650839+00	Quvur tortish	1
3	2022-08-06 10:32:34.64783+00	2022-08-06 10:32:34.647863+00	Kanalizatsiya	1
7	2022-08-06 14:24:05.715053+00	2022-08-06 14:24:05.715089+00	Tom qurish	3
8	2022-08-18 07:37:20.089578+00	2022-08-18 07:37:20.089603+00	dadada	8
9	2022-08-18 07:37:29.900536+00	2022-08-18 07:37:29.900574+00	aaaaa	2
10	2022-08-18 07:37:39.447183+00	2022-08-18 07:37:39.447216+00	ssssss	1
11	2022-08-18 07:37:47.046165+00	2022-08-18 07:37:47.046186+00	ssssss	1
12	2022-08-18 07:37:53.493595+00	2022-08-18 07:37:53.493615+00	dddd	3
13	2022-08-18 07:38:00.1174+00	2022-08-18 07:38:00.117425+00	ddddddfff	4
14	2022-08-18 07:38:06.087783+00	2022-08-18 07:38:06.087804+00	gggggg	5
15	2022-08-18 07:38:11.19507+00	2022-08-18 07:38:11.195148+00	hhhhh	6
16	2022-08-18 07:38:16.672499+00	2022-08-18 07:38:16.67253+00	uuuu	3
17	2022-08-18 07:38:21.919027+00	2022-08-18 07:38:21.919056+00	lllll	8
18	2022-08-18 07:38:27.617999+00	2022-08-18 07:38:27.618021+00	lllllll	9
19	2022-08-18 07:38:34.724349+00	2022-08-18 07:38:34.724379+00	shhhhh	10
20	2022-08-18 07:38:42.88775+00	2022-08-18 07:38:42.887773+00	shuuuuu	11
21	2022-08-18 07:38:49.227488+00	2022-08-18 07:38:49.227516+00	assasaa	12
22	2022-08-18 07:38:54.281192+00	2022-08-18 07:38:54.281218+00	aaddddd	13
26	2022-08-18 09:54:41.169437+00	2022-08-18 09:54:41.169478+00	Tom qurish	3
27	2022-08-18 09:54:56.562402+00	2022-08-18 09:54:56.562424+00	new	12
28	2022-08-18 09:57:53.420419+00	2022-08-18 09:57:53.420445+00	tozalik	12
29	2022-08-18 09:58:34.378512+00	2022-08-18 09:58:34.378533+00	toza ishlash	12
30	2022-08-18 10:15:50.662167+00	2022-08-18 10:15:50.662191+00	tozalik	12
31	2022-08-18 10:16:04.67173+00	2022-08-18 10:16:04.671759+00	tozalik 2	12
32	2022-08-18 10:16:11.575903+00	2022-08-18 10:16:11.575928+00	adasdadasdad adasada	12
33	2022-08-18 10:16:17.359303+00	2022-08-18 10:16:17.359333+00	ada adadasadd	12
34	2022-08-18 10:16:22.833522+00	2022-08-18 10:16:22.83355+00	a dasd	12
35	2022-08-18 10:16:26.927571+00	2022-08-18 10:16:26.9276+00	asda sd	12
36	2022-08-18 10:16:32.573575+00	2022-08-18 10:16:32.573601+00	adad	12
41	2022-08-19 11:16:48.026455+00	2022-08-19 11:16:48.026475+00	mahorat	16
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public."user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, phone_number, overview, payment_hourly, role, avatar, created_at, updated_at, city_id, region_id, street, title, is_delete, total_earnings, total_spent, telegram, experience, is_new, is_online, balance) FROM stdin;
69	123	2022-08-22 08:15:27+00	f	ds	halil	halilov	adad@gmailc.om	f	t	2022-08-22 08:15:25+00	+998909876544		999	freelancer		2022-08-22 08:16:46.559243+00	2022-08-22 08:16:46.55926+00	24	5	tashkent	adad	f	100000	100000	213	3	t	f	100
59	q1111111	\N	f	+998121212112	Sherzod	Shermatov		f	t	2022-08-20 06:34:47.020635+00	+998121212112	jjjd	999	freelancer		2022-08-20 06:34:47.021925+00	2022-08-20 06:41:28.465729+00	202	14	kkfkf	li	f	0	0	\N	\N	t	f	0
54	123	2022-08-19 06:14:00+00	f	Gulomjon	Sardor	Saidov	saidov@gmail.com	f	t	2022-08-19 06:13:57+00	+998908762345	Overview here	100000	freelancer	profile/original_yuang-stive-680x453.jpg	2022-08-19 06:16:46.115247+00	2022-08-19 06:41:26.750907+00	28	1	toy tepa	Menga yaxwi iw kerak	f	100000	50000	@sari	3	t	t	0
50	00000000	\N	f	+998333333333	Xd	Vc		f	t	2022-08-18 10:14:01+00	+998333333333		\N	client		2022-08-18 10:14:01.268434+00	2022-08-19 06:51:10.955179+00	93	6	Dvw		f	0	0	a	\N	t	t	0
52	1111111a	\N	f	+998222222222	Asgf	Rhhr		f	t	2022-08-18 12:04:53+00	+998222222222	Wgege	758	freelancer		2022-08-18 12:04:53.262774+00	2022-08-19 06:51:27.269221+00	79	5	Ggg	Scdvv	f	0	0	as	\N	t	t	0
53	Dddddddd	\N	f	+998594545454	Ddsfnafj	Dhehr		f	t	2022-08-18 12:44:00+00	+998594545454		\N	client		2022-08-18 12:44:00.466645+00	2022-08-19 06:51:57.457951+00	90	6	Ddd		f	0	0	@tele	\N	t	t	0
48	66666666	\N	f	+998887803635	pppp	llllll		f	t	2022-08-18 09:34:43+00	+998887803635	ssjjs	5555555	freelancer		2022-08-18 09:34:43.126436+00	2022-08-19 09:26:53.114081+00	65	4	hhhhh	jjjjjj	f	0	0	L	\N	t	f	0
9	\N	\N	f	+998901234567	Someone	Mr		f	f	2022-08-15 12:36:47.864159+00	+998901234567	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	\N	freelancer	profile/profile.jpg	2022-08-15 12:36:47.865474+00	2022-08-15 12:36:47.865489+00	32	3	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	\N	\N	t	f	0
55	\N	\N	f	+998111111111				f	t	2022-08-19 13:29:14.716521+00	+998111111111	\N	\N	client		2022-08-19 13:29:14.717093+00	2022-08-19 13:29:14.717105+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
7	\N	\N	f	+998932429263	Akmal	Yuldashev		f	t	2022-08-06 14:34:04+00	+998932429263		\N	client	profile/Image_19.jpg	2022-08-06 14:34:04.646209+00	2022-08-19 13:38:35.313406+00	33	2	Olmabog' ko'chasi, 1-uy		f	0	0	hello	\N	t	t	0
13	\N	\N	f		Diyorbek	Yuldashev		f	t	2022-08-16 07:23:08.50606+00	+998932429266	\N	\N	client		2022-08-16 07:23:08.507536+00	2022-08-16 07:23:08.507545+00	\N	\N	Olmabog' ko'chasi, 1-uy	\N	f	0	0	\N	\N	t	f	0
14	\N	\N	f	+998932429261	Diyorbek	Yuldashev		f	t	2022-08-16 07:24:23.224656+00	+998932429261	\N	\N	client		2022-08-16 07:24:23.226498+00	2022-08-16 07:24:23.226531+00	33	2	Olmabog' ko'chasi, 1-uy	\N	f	0	0	\N	\N	t	f	0
56	\N	\N	f	+998444444444				f	t	2022-08-19 13:44:37.166551+00	+998444444444	\N	\N	client		2022-08-19 13:44:37.167018+00	2022-08-19 13:44:37.167027+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
57	\N	\N	f	+998444444446				f	t	2022-08-19 13:46:25.541233+00	+998444444446	\N	\N	client		2022-08-19 13:46:25.541707+00	2022-08-19 13:46:25.541715+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
15	123	\N	f	+998901234568	Someone	Mr		f	f	2022-08-16 07:26:39+00	+998901234568	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer	profile/profile_KsAtv4H.jpg	2022-08-16 07:26:39.818599+00	2022-08-16 10:16:02.693003+00	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	salom	3	t	f	0
61	\N	\N	f	+998777777775				f	t	2022-08-20 06:52:38.980867+00	+998777777775	\N	\N	freelancer		2022-08-20 06:52:38.981542+00	2022-08-20 06:52:38.981556+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
58	Aaaaaaaa	\N	f	+998444444449	Gdhd	Vjfjf		f	t	2022-08-19 13:48:03.336044+00	+998444444449	\N	\N	client		2022-08-19 13:48:03.336684+00	2022-08-19 14:00:09.980177+00	103	7	H	\N	f	0	0	\N	\N	t	f	0
67	\N	\N	f	+998901234574	Someone	Mr		f	f	2022-08-20 13:12:35.586356+00	+998901234574	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer		2022-08-20 13:12:35.587021+00	2022-08-20 13:12:35.587035+00	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	\N	\N	f	f	0
68	\N	\N	f	+998901234573	Someone	Mr		f	f	2022-08-20 13:13:04.976504+00	+998901234573	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer		2022-08-20 13:13:04.977144+00	2022-08-20 13:13:04.977159+00	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	\N	\N	f	f	0
62	pppppppp	\N	f	+998777777778	11ww	www		f	t	2022-08-20 06:54:54.787189+00	+998777777778	kkk	5555	freelancer		2022-08-20 06:54:54.787807+00	2022-08-20 06:57:49.022129+00	64	4	ww	aloo	f	0	0	\N	\N	t	f	0
63	\N	\N	f	+998232323233				f	t	2022-08-20 07:01:48.260428+00	+998232323233	\N	\N	freelancer		2022-08-20 07:01:48.261808+00	2022-08-20 07:01:48.261885+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
64	\N	\N	f	+998232323235				f	t	2022-08-20 07:03:22.414442+00	+998232323235	\N	\N	freelancer		2022-08-20 07:03:22.415005+00	2022-08-20 07:03:22.415017+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
65	22222222	\N	f	+998623552622	Ggh	Htg		f	t	2022-08-20 09:16:20+00	+998623552622		\N	freelancer		2022-08-20 09:16:20.662633+00	2022-08-20 10:08:15.831698+00	52	3	Dr		f	0	0	adminn	\N	t	t	0
29	123	2022-08-17 13:07:22+00	f	Anvar	Anvar	Akmalov	hello@gmail.com	f	t	2022-08-17 13:07:18+00	+998909876543	desc here	9999	freelancer	profile/Image_20.jpg	2022-08-17 13:09:44.558317+00	2022-08-20 12:24:24.922671+00	25	2	tashkent	title	f	100000	150000	@hello	2	t	f	0
66	\N	\N	f	+998901234575	Someone	Mr		f	f	2022-08-20 13:11:38.418455+00	+998901234575	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	freelancer		2022-08-20 13:11:38.419235+00	2022-08-20 13:11:38.419247+00	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga	f	0	0	\N	\N	f	f	0
49	\N	\N	f	+998000000000	SHER	PPPP		f	t	2022-08-18 10:11:35.59725+00	+998000000000	\N	\N	client		2022-08-18 10:11:35.597862+00	2022-08-18 10:11:54.236022+00	51	3	JJJJ	\N	f	0	0	\N	\N	t	f	0
51	11111111	\N	f	+998666666666	652h4hbfhth	Hn4u		f	t	2022-08-18 10:15:49.297158+00	+998666666666	Gg	5555	freelancer		2022-08-18 10:15:49.298125+00	2022-08-18 10:16:04.329174+00	64	4	Hh	Re	f	0	0	\N	\N	t	f	0
70	\N	\N	f	+998888856565				f	t	2022-08-29 08:13:04.17921+00	+998888856565	\N	\N	client		2022-08-29 08:13:04.182055+00	2022-08-29 08:13:04.182094+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
71	\N	\N	f	+998888856563				f	t	2022-08-29 08:14:48.373878+00	+998888856563	\N	\N	client		2022-08-29 08:14:48.374669+00	2022-08-29 08:14:48.374682+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
72	\N	\N	f	+998444444466				f	t	2022-08-29 08:18:39.057572+00	+998444444466	\N	\N	client		2022-08-29 08:18:39.060731+00	2022-08-29 08:18:39.060766+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
6	123	\N	f	+998932429268	Diyorbek	Yuldashev		f	t	2022-08-06 12:15:24+00	+998932429268		\N	client		2022-08-06 12:15:24.045901+00	2022-09-22 13:31:19.897637+00	33	2	Olmabog' ko'chasi, 1-uy		f	0	10000	dostik	\N	t	t	90000
73	11111111	\N	f	+998112121212	Aaa	Aaa		f	t	2022-08-30 06:19:02.924639+00	+998112121212	\N	\N	client		2022-08-30 06:19:02.925441+00	2022-08-30 06:19:24.212014+00	64	4	A	\N	f	0	0	\N	\N	t	f	0
60	\N	\N	f	+998777777777				f	t	2022-08-20 06:50:03+00	+998777777777		\N	freelancer		2022-08-20 06:50:03.087539+00	2022-09-26 11:16:29.057399+00	\N	\N	\N		f	0	0	adminn	\N	t	f	0
1	pbkdf2_sha256$390000$fYgYU8An1qSm6b0JrPEYyP$l1Ithdi5MDeiuGHLt9XyU8+3IowTB2UiOXVOK6JSpAo=	2022-09-26 11:13:09.662817+00	t	admin				t	t	2022-08-06 10:12:07.051927+00		\N	\N	freelancer		2022-08-06 10:12:07.316603+00	2022-08-06 10:12:07.316615+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
8	\N	\N	f	+998932429264	Amila	Yuldasheva		f	t	2022-08-06 15:34:44+00	+998932429264	Overview for Freelancer	10	freelancer	profile/images_17.jpg	2022-08-06 15:34:44.363195+00	2022-09-26 11:17:01.109212+00	33	2	Olmabog' ko'chasi, 1-uy	Title for Freelancer	f	0	0	joy	\N	t	f	0
84	11111111	\N	f	+998882222000	Alisher	ll		f	t	2022-09-19 19:57:19.388098+00	+998882222000	\N	\N	client		2022-09-19 19:57:19.389579+00	2022-09-20 07:18:42.798014+00	65	4	kkk	\N	f	0	0	\N	\N	t	f	0
40	11111111	\N	f	+998901234569	ass	assssss		f	f	2022-08-18 07:22:16.378927+00	+998901234569	Chiroyli gaplar bilan o'zim haqimda ma'lumot berib o'tdim	75000	client		2022-08-18 07:22:16.38213+00	2022-08-30 09:52:28.915866+00	32	2	Katta ko'cha, 2--uy	Sarlavha yozildi shuyerga ha	f	0	0	\N	\N	t	f	0
74	22222222	\N	f	+998121212121	ass	assssss		f	t	2022-08-30 09:38:22.070545+00	+998121212121	\N	\N	client		2022-08-30 09:38:22.071337+00	2022-08-30 10:04:10.442887+00	64	4	sss	\N	f	0	0	\N	\N	t	t	0
75	11111111	\N	f	+998222232323	4h	F		f	t	2022-08-30 11:57:03.17401+00	+998222232323	\N	\N	client		2022-08-30 11:57:03.17604+00	2022-08-30 11:57:15.14477+00	64	4	D	\N	f	0	0	\N	\N	t	f	0
76	11111111	\N	f	+998666325565	Gy	E		f	t	2022-08-30 13:46:50.939454+00	+998666325565	\N	\N	client		2022-08-30 13:46:50.941415+00	2022-08-30 13:47:02.467812+00	64	4	Er	\N	f	0	0	\N	\N	t	f	0
77	88888888	\N	f	+998233325635	D	G		f	t	2022-08-31 05:53:04.37243+00	+998233325635	\N	\N	client		2022-08-31 05:53:04.373399+00	2022-08-31 05:55:03.603962+00	65	4	V	\N	f	0	0	\N	\N	t	f	0
78	77777777	\N	f	+998545945596	A	S		f	t	2022-08-31 08:02:36.118021+00	+998545945596	\N	\N	client		2022-08-31 08:02:36.118754+00	2022-08-31 08:02:49.97507+00	78	5	A	\N	f	0	0	\N	\N	t	f	0
79	Qqqqqqqq	\N	f	+998745869556	Aa	A		f	t	2022-08-31 11:39:54.76363+00	+998745869556	\N	\N	client		2022-08-31 11:39:54.764708+00	2022-08-31 11:40:11.098916+00	80	5	E	\N	f	0	0	\N	\N	t	f	0
80	\N	\N	f	+998887803637				f	t	2022-09-19 16:31:00.06733+00	+998887803637	\N	\N	client		2022-09-19 16:31:00.069426+00	2022-09-19 16:31:00.069459+00	\N	\N	\N	\N	f	0	0	\N	\N	t	f	0
81	11111111	\N	f	+998880000000	aa	aaa		f	t	2022-09-19 16:39:44.857892+00	+998880000000	\N	\N	client		2022-09-19 16:39:44.859357+00	2022-09-19 16:43:04.399676+00	90	6	ddd	\N	f	0	0	\N	\N	t	f	0
82	88888888	\N	f	+998999999999	jjh	jjjj		f	t	2022-09-19 16:49:13.710393+00	+998999999999	\N	\N	client		2022-09-19 16:49:13.712572+00	2022-09-19 16:49:28.741422+00	80	5	bdb	\N	f	0	0	\N	\N	t	f	0
83	99999999	\N	f	+998944444444	jjjsjs	jaaj		f	t	2022-09-19 17:15:39.579457+00	+998944444444	bbdd	8388383	freelancer		2022-09-19 17:15:39.581437+00	2022-09-19 17:16:02.642536+00	90	6	nnnsnsn	cc	f	0	0	\N	\N	t	f	0
85	\N	\N	f	+998940000835				f	t	2022-09-23 10:11:00.991066+00	+998940000835	\N	\N	freelancer		2022-09-23 10:11:00.992641+00	2022-09-28 06:56:32.002144+00	\N	\N	\N	\N	f	0	0	\N	\N	t	t	0
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
39	83	1
40	83	4
41	83	8
42	83	13
43	83	14
44	83	17
45	83	19
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
46	83	1
47	83	3
48	83	10
49	83	11
50	83	13
51	83	17
52	83	22
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
67	+998363636363	2111	\N
68	+998363636363	5039	\N
69	+998363636363	7372	\N
70	+998888856565	7250	\N
71	+998888856565	0599	\N
72	+998888856563	6348	\N
73	+998444444466	1160	\N
74	+998112121212	6644	\N
75	+998121212121	9484	\N
76	+998222232323	3315	\N
77	+998666325565	0196	\N
78	+998233325635	9896	\N
79	+998545945596	8679	\N
80	+998745869556	8269	\N
81	+998932429262	3547	\N
82	+998940000835	2560	\N
83	+998940000835	8643	\N
84	+998940000835	4898	\N
85	+998940000835	8718	\N
86	+998940000836	1451	\N
87	+998887803637	1427	\N
88	+998880000000	7688	\N
89	+998880000000	7066	\N
90	+998999999999	5033	\N
91	+998944444444	0526	\N
92	+998887803635	3264	\N
93	+998887803635	1061	\N
94	+998887803635	8367	\N
95	+998887803635	7266	\N
96	+998887803635	2189	\N
97	+998887803635	2069	\N
98	+998887803635	0782	\N
99	+998882222000	6924	\N
100	+998940000835	4752	\N
101	+998940000835	2498	\N
\.


--
-- Data for Name: worker_portfolio; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.worker_portfolio (id, created_at, updated_at, headline, description, date, user_id, is_new, status) FROM stdin;
1	2022-08-15 14:15:40.88436+00	2022-08-15 14:15:40.884389+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 00:00:00+00	7	t	pending
3	2022-08-16 06:20:08.024502+00	2022-08-16 06:20:08.024605+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 00:00:00+00	9	t	pending
4	2022-08-16 06:25:43.616986+00	2022-08-16 06:25:43.617014+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 00:00:00+00	9	t	pending
5	2022-08-16 06:36:06.402867+00	2022-08-16 06:36:06.402958+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 00:00:00+00	8	t	pending
6	2022-08-16 06:36:23.711348+00	2022-08-16 06:36:23.711378+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 00:00:00+00	9	t	pending
2	2022-08-15 14:16:05.646143+00	2022-08-19 10:36:01.470875+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-15 00:00:00+00	7	t	approved
7	2022-09-26 12:04:47.466689+00	2022-09-26 12:04:47.466782+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-14 19:00:00+00	9	f	pending
8	2022-09-26 13:05:04.005649+00	2022-09-26 13:05:04.005733+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-14 19:00:00+00	9	f	pending
9	2022-09-26 13:07:43.481992+00	2022-09-26 13:07:43.482029+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-14 19:00:00+00	9	f	pending
10	2022-09-26 13:18:13.333336+00	2022-09-26 13:18:13.333386+00	Portfolio nomi	Uzun description bor  buyerda, Judayam uuuzuuuun	2022-08-14 19:00:00+00	9	f	pending
11	2022-09-26 13:21:15.69598+00	2022-09-26 13:21:15.696129+00	E	T	2022-09-26 13:21:13.918891+00	85	f	pending
12	2022-09-26 13:24:16.387697+00	2022-09-26 13:24:16.387781+00	E	T	2022-09-26 13:24:15.084958+00	85	f	pending
13	2022-09-26 13:29:40.676519+00	2022-09-26 13:29:40.676587+00	E	T	2022-09-26 13:29:39.31424+00	85	f	pending
14	2022-09-26 13:29:48.604357+00	2022-09-26 13:29:48.604417+00	E	T	2022-09-26 13:29:47.543949+00	85	f	pending
15	2022-09-26 13:30:19.816431+00	2022-09-26 13:30:19.816454+00	E	T	2022-09-26 13:30:18.693476+00	85	f	pending
16	2022-09-26 13:30:44.717858+00	2022-09-26 13:30:44.717935+00	E	T	2022-09-26 13:30:43.629783+00	85	f	pending
17	2022-09-26 13:31:04.677547+00	2022-09-26 13:31:04.67757+00	E	T	2022-09-26 13:31:03.462269+00	85	f	pending
18	2022-09-26 13:42:50.376684+00	2022-09-26 13:42:50.376804+00	E	E	2022-09-26 13:42:48.453286+00	85	f	pending
19	2022-09-26 13:45:48.587058+00	2022-09-26 13:45:48.587083+00	E	E	2022-09-26 13:45:47.362324+00	85	f	pending
20	2022-09-26 13:46:54.404674+00	2022-09-26 13:46:54.404843+00	E	E	2022-09-26 13:46:53.154194+00	85	f	pending
21	2022-09-26 13:46:57.967661+00	2022-09-26 13:46:57.96774+00	E	E	2022-09-26 13:46:56.723783+00	85	f	pending
22	2022-09-26 13:50:05.664968+00	2022-09-26 13:50:05.665044+00	E	J	2022-09-26 13:50:04.454276+00	85	f	pending
\.


--
-- Data for Name: worker_portfolioimage; Type: TABLE DATA; Schema: public; Owner: newupworkuser
--

COPY public.worker_portfolioimage (id, created_at, updated_at, image, portfolio_id, user_id) FROM stdin;
1	2022-08-15 14:16:05.651829+00	2022-08-15 14:16:05.651849+00	portfolio/Screenshot_from_2022-08-08_09-23-38.png	2	7
2	2022-08-15 14:16:05.657183+00	2022-08-15 14:16:05.657204+00	portfolio/Screenshot_from_2022-08-04_12-59-30.png	2	7
3	2022-08-15 14:16:05.660667+00	2022-08-15 14:16:05.660687+00	portfolio/Screenshot_from_2022-08-03_18-01-03.png	2	7
4	2022-08-15 14:16:05.663787+00	2022-08-15 14:16:05.663808+00	portfolio/Screenshot_from_2022-07-27_12-46-00.png	2	7
5	2022-08-16 06:36:06.416298+00	2022-08-16 06:36:06.416326+00	portfolio/Screenshot_from_2022-07-27_12-42-57.png	5	8
6	2022-08-16 06:36:06.430738+00	2022-08-16 06:36:06.430766+00	portfolio/Screenshot_from_2022-08-04_12-59-30_pgzCwfI.png	5	8
7	2022-08-16 06:36:06.434763+00	2022-08-16 06:36:06.434785+00	portfolio/Screenshot_from_2022-07-23_15-29-21.png	5	8
8	2022-08-16 06:36:23.718308+00	2022-08-16 06:36:23.718333+00	portfolio/Screenshot_from_2022-07-27_12-42-57_WsjcQWR.png	6	9
9	2022-08-16 06:36:23.722852+00	2022-08-16 06:36:23.72288+00	portfolio/Screenshot_from_2022-08-04_12-59-30_feymeap.png	6	9
10	2022-08-16 06:36:23.726978+00	2022-08-16 06:36:23.727009+00	portfolio/Screenshot_from_2022-07-23_15-29-21_3p5oOjZ.png	6	9
11	2022-09-26 13:07:43.48587+00	2022-09-26 13:07:43.485886+00	portfolio/download.jpg	9	9
12	2022-09-26 13:07:43.490209+00	2022-09-26 13:07:43.490225+00	portfolio/images_2.jpg	9	9
13	2022-09-26 13:07:43.491881+00	2022-09-26 13:07:43.491896+00	portfolio/images.jpg	9	9
14	2022-09-26 13:18:13.342205+00	2022-09-26 13:18:13.342245+00	portfolio/download_Dmu3zBC.jpg	10	9
15	2022-09-26 13:18:13.348155+00	2022-09-26 13:18:13.348191+00	portfolio/images_2_dpvXjik.jpg	10	9
16	2022-09-26 13:18:13.351375+00	2022-09-26 13:18:13.351412+00	portfolio/images_Lr8lusQ.jpg	10	9
17	2022-09-26 13:21:15.706526+00	2022-09-26 13:21:15.706591+00	portfolio/image_picker3610133770901136057.jpg	11	85
18	2022-09-26 13:24:16.396047+00	2022-09-26 13:24:16.396087+00	portfolio/image_picker3610133770901136057_5soiLlj.jpg	12	85
19	2022-09-26 13:29:40.685764+00	2022-09-26 13:29:40.685806+00	portfolio/image_picker3610133770901136057_gDpVeHh.jpg	13	85
20	2022-09-26 13:29:48.609406+00	2022-09-26 13:29:48.609423+00	portfolio/image_picker3610133770901136057_UYHvQ4j.jpg	14	85
21	2022-09-26 13:30:19.819626+00	2022-09-26 13:30:19.819644+00	portfolio/image_picker3610133770901136057_Tsk6l0I.jpg	15	85
22	2022-09-26 13:30:44.725312+00	2022-09-26 13:30:44.725351+00	portfolio/image_picker3610133770901136057_25FoycB.jpg	16	85
23	2022-09-26 13:31:04.680661+00	2022-09-26 13:31:04.680678+00	portfolio/image_picker3610133770901136057_idarUgd.jpg	17	85
24	2022-09-26 13:42:50.386472+00	2022-09-26 13:42:50.386512+00	portfolio/image_picker4936962929894481958.heic	18	85
25	2022-09-26 13:45:48.592827+00	2022-09-26 13:45:48.592844+00	portfolio/image_picker4936962929894481958_noNPCZT.heic	19	85
26	2022-09-26 13:46:54.412324+00	2022-09-26 13:46:54.412365+00	portfolio/image_picker4936962929894481958_2b4ZnNs.heic	20	85
27	2022-09-26 13:46:57.975326+00	2022-09-26 13:46:57.975366+00	portfolio/image_picker4936962929894481958_zl5sxtT.heic	21	85
28	2022-09-26 13:50:05.674269+00	2022-09-26 13:50:05.674308+00	portfolio/image_picker4936962929894481958_i8TrgFh.heic	22	85
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 96, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 77, true);


--
-- Name: paymeuz_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.paymeuz_transaction_id_seq', 1, false);


--
-- Name: post_post_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_post_categories_id_seq', 160, true);


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_post_id_seq', 53, true);


--
-- Name: post_post_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_post_skills_id_seq', 163, true);


--
-- Name: post_postimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_postimage_id_seq', 21, true);


--
-- Name: post_timer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_timer_id_seq', 1, true);


--
-- Name: post_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.post_wishlist_id_seq', 14, true);


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

SELECT pg_catalog.setval('public.user_categories_id_seq', 45, true);


--
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_id_seq', 85, true);


--
-- Name: user_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_skills_id_seq', 52, true);


--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_user_permissions_id_seq', 3, true);


--
-- Name: user_usertoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.user_usertoken_id_seq', 101, true);


--
-- Name: worker_portfolio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.worker_portfolio_id_seq', 22, true);


--
-- Name: worker_portfolioimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newupworkuser
--

SELECT pg_catalog.setval('public.worker_portfolioimage_id_seq', 28, true);


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
-- Name: paymeuz_transaction paymeuz_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.paymeuz_transaction
    ADD CONSTRAINT paymeuz_transaction_pkey PRIMARY KEY (id);


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
-- Name: post_timer post_timer_pkey; Type: CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_timer
    ADD CONSTRAINT post_timer_pkey PRIMARY KEY (id);


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
-- Name: post_timer_post_id_1f9114ad; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_timer_post_id_1f9114ad ON public.post_timer USING btree (post_id);


--
-- Name: post_timer_user_id_c9336313; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX post_timer_user_id_c9336313 ON public.post_timer USING btree (user_id);


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
-- Name: proposals_statuschanges_portfolio_id_7c7acaf5; Type: INDEX; Schema: public; Owner: newupworkuser
--

CREATE INDEX proposals_statuschanges_portfolio_id_7c7acaf5 ON public.proposals_statuschanges USING btree (portfolio_id);


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
-- Name: post_timer post_timer_post_id_1f9114ad_fk_post_post_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_timer
    ADD CONSTRAINT post_timer_post_id_1f9114ad_fk_post_post_id FOREIGN KEY (post_id) REFERENCES public.post_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_timer post_timer_user_id_c9336313_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.post_timer
    ADD CONSTRAINT post_timer_user_id_c9336313_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: proposals_statuschanges proposals_statuschan_portfolio_id_7c7acaf5_fk_worker_po; Type: FK CONSTRAINT; Schema: public; Owner: newupworkuser
--

ALTER TABLE ONLY public.proposals_statuschanges
    ADD CONSTRAINT proposals_statuschan_portfolio_id_7c7acaf5_fk_worker_po FOREIGN KEY (portfolio_id) REFERENCES public.worker_portfolio(id) DEFERRABLE INITIALLY DEFERRED;


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

