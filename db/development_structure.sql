--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_aliases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_aliases (
    id integer NOT NULL,
    account_id integer,
    destroyed_account_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: account_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_aliases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: account_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_aliases_id_seq OWNED BY account_aliases.id;


--
-- Name: account_contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_contacts (
    id integer NOT NULL,
    account_id integer,
    contact_id integer,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: account_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: account_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_contacts_id_seq OWNED BY account_contacts.id;


--
-- Name: account_opportunities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_opportunities (
    id integer NOT NULL,
    account_id integer,
    opportunity_id integer,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: account_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: account_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_opportunities_id_seq OWNED BY account_opportunities.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    user_id integer,
    assigned_to integer,
    name character varying(128) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Private'::character varying,
    website character varying(64),
    toll_free_phone character varying(32),
    phone character varying(32),
    fax character varying(32),
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    email character varying(64),
    background_info character varying(255)
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    user_id integer,
    subject_id integer,
    subject_type character varying(255),
    action character varying(32) DEFAULT 'created'::character varying,
    info character varying(255) DEFAULT ''::character varying,
    private boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    street1 character varying(255),
    street2 character varying(255),
    city character varying(64),
    state character varying(64),
    zipcode character varying(16),
    country character varying(64),
    full_address character varying(255),
    address_type character varying(16),
    addressable_id integer,
    addressable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: avatars; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE avatars (
    id integer NOT NULL,
    user_id integer,
    entity_id integer,
    entity_type character varying(255),
    image_file_size integer,
    image_file_name character varying(255),
    image_content_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: avatars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE avatars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: avatars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE avatars_id_seq OWNED BY avatars.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    user_id integer,
    assigned_to integer,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Private'::character varying,
    status character varying(64),
    budget numeric(12,2),
    target_leads integer,
    target_conversion double precision,
    target_revenue numeric(12,2),
    leads_count integer,
    opportunities_count integer,
    revenue numeric(12,2),
    starts_on date,
    ends_on date,
    objectives text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    background_info character varying(255)
);


--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    commentable_id integer,
    commentable_type character varying(255),
    private boolean,
    title character varying(255) DEFAULT ''::character varying,
    comment text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state character varying(16) DEFAULT 'Expanded'::character varying NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: contact_aliases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contact_aliases (
    id integer NOT NULL,
    contact_id integer,
    destroyed_contact_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: contact_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_aliases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: contact_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_aliases_id_seq OWNED BY contact_aliases.id;


--
-- Name: contact_opportunities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contact_opportunities (
    id integer NOT NULL,
    contact_id integer,
    opportunity_id integer,
    role character varying(32),
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: contact_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: contact_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_opportunities_id_seq OWNED BY contact_opportunities.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    user_id integer,
    lead_id integer,
    assigned_to integer,
    reports_to integer,
    first_name character varying(64) DEFAULT ''::character varying NOT NULL,
    last_name character varying(64) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Private'::character varying,
    title character varying(64),
    department character varying(64),
    source character varying(32),
    email character varying(64),
    alt_email character varying(64),
    phone character varying(32),
    mobile character varying(32),
    fax character varying(32),
    blog character varying(128),
    linkedin character varying(128),
    facebook character varying(128),
    twitter character varying(128),
    born_on date,
    do_not_call boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    background_info character varying(255),
    octopus character varying(255)
);


--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: customfields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customfields (
    id integer NOT NULL,
    uuid character varying(36),
    user_id integer,
    tag_id integer,
    field_name character varying(64),
    field_type character varying(32),
    field_label character varying(64),
    table_name character varying(32),
    display_sequence integer,
    display_block integer,
    display_width integer,
    max_size integer,
    required boolean,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    form_field_type character varying(255),
    field_info character varying(255),
    select_options text
);


--
-- Name: customfields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE customfields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: customfields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE customfields_id_seq OWNED BY customfields.id;


--
-- Name: emails; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE emails (
    id integer NOT NULL,
    imap_message_id character varying(255) NOT NULL,
    user_id integer,
    mediator_id integer,
    mediator_type character varying(255),
    sent_from character varying(255) NOT NULL,
    sent_to character varying(255) NOT NULL,
    cc character varying(255),
    bcc character varying(255),
    subject character varying(255),
    body text,
    header text,
    sent_at timestamp without time zone,
    received_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state character varying(16) DEFAULT 'Expanded'::character varying NOT NULL
);


--
-- Name: emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE emails_id_seq OWNED BY emails.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE leads (
    id integer NOT NULL,
    user_id integer,
    campaign_id integer,
    assigned_to integer,
    first_name character varying(64) DEFAULT ''::character varying NOT NULL,
    last_name character varying(64) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Private'::character varying,
    title character varying(64),
    company character varying(64),
    source character varying(32),
    status character varying(32),
    referred_by character varying(64),
    email character varying(64),
    alt_email character varying(64),
    phone character varying(32),
    mobile character varying(32),
    blog character varying(128),
    linkedin character varying(128),
    facebook character varying(128),
    twitter character varying(128),
    rating integer DEFAULT 0 NOT NULL,
    do_not_call boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    background_info character varying(255)
);


--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE leads_id_seq OWNED BY leads.id;


--
-- Name: opportunities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE opportunities (
    id integer NOT NULL,
    user_id integer,
    campaign_id integer,
    assigned_to integer,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Private'::character varying,
    source character varying(32),
    stage character varying(32),
    probability integer,
    amount numeric(12,2),
    discount numeric(12,2),
    closes_on date,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    background_info character varying(255)
);


--
-- Name: opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE opportunities_id_seq OWNED BY opportunities.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    user_id integer,
    asset_id integer,
    asset_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: preferences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE preferences (
    id integer NOT NULL,
    user_id integer,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE preferences_id_seq OWNED BY preferences.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    value text,
    default_value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: tag1s; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tag1s (
    id integer NOT NULL,
    customizable_id integer,
    customizable_type character varying(255),
    main_activity character varying(255),
    follow_up_permitted boolean,
    swd_client_id character varying(255),
    swd_reference character varying(255),
    swd_client_name character varying(255),
    collect_date date
);


--
-- Name: tag1s_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tag1s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tag1s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tag1s_id_seq OWNED BY tag1s.id;


--
-- Name: tag2s; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tag2s (
    id integer NOT NULL,
    customizable_id integer,
    customizable_type character varying(255),
    description text
);


--
-- Name: tag2s_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tag2s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tag2s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tag2s_id_seq OWNED BY tag2s.id;


--
-- Name: tag3s; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tag3s (
    id integer NOT NULL,
    customizable_id integer,
    customizable_type character varying(255),
    description text,
    registration text
);


--
-- Name: tag3s_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tag3s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tag3s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tag3s_id_seq OWNED BY tag3s.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    tagger_id integer,
    tagger_type character varying(255),
    taggable_type character varying(255),
    context character varying(255),
    created_at timestamp without time zone
);


--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    user_id integer,
    assigned_to integer,
    completed_by integer,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    asset_id integer,
    asset_type character varying(255),
    priority character varying(32),
    category character varying(32),
    bucket character varying(32),
    due_at timestamp without time zone,
    completed_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    background_info character varying(255)
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(32) DEFAULT ''::character varying NOT NULL,
    email character varying(64) DEFAULT ''::character varying NOT NULL,
    first_name character varying(32),
    last_name character varying(32),
    title character varying(64),
    company character varying(64),
    alt_email character varying(64),
    phone character varying(32),
    mobile character varying(32),
    aim character varying(32),
    yahoo character varying(32),
    google character varying(32),
    skype character varying(32),
    password_hash character varying(255) DEFAULT ''::character varying NOT NULL,
    password_salt character varying(255) DEFAULT ''::character varying NOT NULL,
    persistence_token character varying(255) DEFAULT ''::character varying NOT NULL,
    perishable_token character varying(255) DEFAULT ''::character varying NOT NULL,
    last_request_at timestamp without time zone,
    last_login_at timestamp without time zone,
    current_login_at timestamp without time zone,
    last_login_ip character varying(255),
    current_login_ip character varying(255),
    login_count integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean DEFAULT false NOT NULL,
    suspended_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE account_aliases ALTER COLUMN id SET DEFAULT nextval('account_aliases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE account_contacts ALTER COLUMN id SET DEFAULT nextval('account_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE account_opportunities ALTER COLUMN id SET DEFAULT nextval('account_opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE avatars ALTER COLUMN id SET DEFAULT nextval('avatars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE contact_aliases ALTER COLUMN id SET DEFAULT nextval('contact_aliases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE contact_opportunities ALTER COLUMN id SET DEFAULT nextval('contact_opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE customfields ALTER COLUMN id SET DEFAULT nextval('customfields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE emails ALTER COLUMN id SET DEFAULT nextval('emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE leads ALTER COLUMN id SET DEFAULT nextval('leads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE opportunities ALTER COLUMN id SET DEFAULT nextval('opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE preferences ALTER COLUMN id SET DEFAULT nextval('preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tag1s ALTER COLUMN id SET DEFAULT nextval('tag1s_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tag2s ALTER COLUMN id SET DEFAULT nextval('tag2s_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tag3s ALTER COLUMN id SET DEFAULT nextval('tag3s_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: account_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_aliases
    ADD CONSTRAINT account_aliases_pkey PRIMARY KEY (id);


--
-- Name: account_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_contacts
    ADD CONSTRAINT account_contacts_pkey PRIMARY KEY (id);


--
-- Name: account_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_opportunities
    ADD CONSTRAINT account_opportunities_pkey PRIMARY KEY (id);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: avatars_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY avatars
    ADD CONSTRAINT avatars_pkey PRIMARY KEY (id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: contact_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contact_aliases
    ADD CONSTRAINT contact_aliases_pkey PRIMARY KEY (id);


--
-- Name: contact_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contact_opportunities
    ADD CONSTRAINT contact_opportunities_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: customfields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customfields
    ADD CONSTRAINT customfields_pkey PRIMARY KEY (id);


--
-- Name: emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id);


--
-- Name: leads_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY opportunities
    ADD CONSTRAINT opportunities_pkey PRIMARY KEY (id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: tag1s_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tag1s
    ADD CONSTRAINT tag1s_pkey PRIMARY KEY (id);


--
-- Name: tag2s_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tag2s
    ADD CONSTRAINT tag2s_pkey PRIMARY KEY (id);


--
-- Name: tag3s_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tag3s
    ADD CONSTRAINT tag3s_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_accounts_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_accounts_on_assigned_to ON accounts USING btree (assigned_to);


--
-- Name: index_accounts_on_user_id_and_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_accounts_on_user_id_and_name_and_deleted_at ON accounts USING btree (user_id, name, deleted_at);


--
-- Name: index_activities_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_created_at ON activities USING btree (created_at);


--
-- Name: index_activities_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_user_id ON activities USING btree (user_id);


--
-- Name: index_addresses_on_addressable_id_and_addressable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_addressable_id_and_addressable_type ON addresses USING btree (addressable_id, addressable_type);


--
-- Name: index_campaigns_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaigns_on_assigned_to ON campaigns USING btree (assigned_to);


--
-- Name: index_campaigns_on_user_id_and_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_campaigns_on_user_id_and_name_and_deleted_at ON campaigns USING btree (user_id, name, deleted_at);


--
-- Name: index_contacts_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_contacts_on_assigned_to ON contacts USING btree (assigned_to);


--
-- Name: index_contacts_on_user_id_and_last_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_contacts_on_user_id_and_last_name_and_deleted_at ON contacts USING btree (user_id, last_name, deleted_at);


--
-- Name: index_customfields_on_field_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_customfields_on_field_name ON customfields USING btree (field_name);


--
-- Name: index_emails_on_mediator_id_and_mediator_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_emails_on_mediator_id_and_mediator_type ON emails USING btree (mediator_id, mediator_type);


--
-- Name: index_leads_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_leads_on_assigned_to ON leads USING btree (assigned_to);


--
-- Name: index_leads_on_user_id_and_last_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_leads_on_user_id_and_last_name_and_deleted_at ON leads USING btree (user_id, last_name, deleted_at);


--
-- Name: index_opportunities_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_opportunities_on_assigned_to ON opportunities USING btree (assigned_to);


--
-- Name: index_opportunities_on_user_id_and_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_opportunities_on_user_id_and_name_and_deleted_at ON opportunities USING btree (user_id, name, deleted_at);


--
-- Name: index_permissions_on_asset_id_and_asset_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_permissions_on_asset_id_and_asset_type ON permissions USING btree (asset_id, asset_type);


--
-- Name: index_permissions_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_permissions_on_user_id ON permissions USING btree (user_id);


--
-- Name: index_preferences_on_user_id_and_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_preferences_on_user_id_and_name ON preferences USING btree (user_id, name);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sessions_on_session_id ON sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sessions_on_updated_at ON sessions USING btree (updated_at);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_settings_on_name ON settings USING btree (name);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_tasks_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tasks_on_assigned_to ON tasks USING btree (assigned_to);


--
-- Name: index_tasks_on_user_id_and_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_tasks_on_user_id_and_name_and_deleted_at ON tasks USING btree (user_id, name, deleted_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_last_request_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_last_request_at ON users USING btree (last_request_at);


--
-- Name: index_users_on_perishable_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_perishable_token ON users USING btree (perishable_token);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (persistence_token);


--
-- Name: index_users_on_username_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_username_and_deleted_at ON users USING btree (username, deleted_at);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

