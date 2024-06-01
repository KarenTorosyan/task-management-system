--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg110+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg110+1)

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

ALTER TABLE ONLY public.webhooks_tenants DROP CONSTRAINT webhooks_tenants_fk_2;
ALTER TABLE ONLY public.webhooks_tenants DROP CONSTRAINT webhooks_tenants_fk_1;
ALTER TABLE ONLY public.webhooks DROP CONSTRAINT webhooks_fk_2;
ALTER TABLE ONLY public.webhooks DROP CONSTRAINT webhooks_fk_1;
ALTER TABLE ONLY public.webauthn_credentials DROP CONSTRAINT webauthn_credentials_fk_2;
ALTER TABLE ONLY public.webauthn_credentials DROP CONSTRAINT webauthn_credentials_fk_1;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_fk_1;
ALTER TABLE ONLY public.user_registrations DROP CONSTRAINT user_registrations_fk_2;
ALTER TABLE ONLY public.user_registrations DROP CONSTRAINT user_registrations_fk_1;
ALTER TABLE ONLY public.user_registrations_application_roles DROP CONSTRAINT user_registrations_application_roles_fk_2;
ALTER TABLE ONLY public.user_registrations_application_roles DROP CONSTRAINT user_registrations_application_roles_fk_1;
ALTER TABLE ONLY public.user_consents DROP CONSTRAINT user_consents_fk_3;
ALTER TABLE ONLY public.user_consents DROP CONSTRAINT user_consents_fk_2;
ALTER TABLE ONLY public.user_consents DROP CONSTRAINT user_consents_fk_1;
ALTER TABLE ONLY public.user_consents_email_plus DROP CONSTRAINT user_consents_email_plus_fk_1;
ALTER TABLE ONLY public.user_comments DROP CONSTRAINT user_comments_fk_2;
ALTER TABLE ONLY public.user_comments DROP CONSTRAINT user_comments_fk_1;
ALTER TABLE ONLY public.user_actions DROP CONSTRAINT user_actions_fk_4;
ALTER TABLE ONLY public.user_actions DROP CONSTRAINT user_actions_fk_3;
ALTER TABLE ONLY public.user_actions DROP CONSTRAINT user_actions_fk_2;
ALTER TABLE ONLY public.user_actions DROP CONSTRAINT user_actions_fk_1;
ALTER TABLE ONLY public.user_action_logs DROP CONSTRAINT user_action_logs_fk_3;
ALTER TABLE ONLY public.user_action_logs DROP CONSTRAINT user_action_logs_fk_2;
ALTER TABLE ONLY public.user_action_logs DROP CONSTRAINT user_action_logs_fk_1;
ALTER TABLE ONLY public.user_action_logs_applications DROP CONSTRAINT user_action_logs_applications_fk_2;
ALTER TABLE ONLY public.user_action_logs_applications DROP CONSTRAINT user_action_logs_applications_fk_1;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_9;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_8;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_7;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_6;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_5;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_4;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_35;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_34;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_33;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_32;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_31;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_30;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_3;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_29;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_28;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_27;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_26;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_25;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_24;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_23;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_22;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_21;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_20;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_2;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_19;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_18;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_17;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_16;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_15;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_14;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_13;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_12;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_11;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_10;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_fk_1;
ALTER TABLE ONLY public.scim_external_id_users DROP CONSTRAINT scim_external_id_users_fk_2;
ALTER TABLE ONLY public.scim_external_id_users DROP CONSTRAINT scim_external_id_users_fk_1;
ALTER TABLE ONLY public.scim_external_id_groups DROP CONSTRAINT scim_external_id_groups_fk_2;
ALTER TABLE ONLY public.scim_external_id_groups DROP CONSTRAINT scim_external_id_groups_fk_1;
ALTER TABLE ONLY public.request_frequencies DROP CONSTRAINT request_frequencies_fk_1;
ALTER TABLE ONLY public.refresh_tokens DROP CONSTRAINT refresh_tokens_fk_3;
ALTER TABLE ONLY public.refresh_tokens DROP CONSTRAINT refresh_tokens_fk_2;
ALTER TABLE ONLY public.refresh_tokens DROP CONSTRAINT refresh_tokens_fk_1;
ALTER TABLE ONLY public.raw_logins DROP CONSTRAINT raw_logins_fk_2;
ALTER TABLE ONLY public.raw_logins DROP CONSTRAINT raw_logins_fk_1;
ALTER TABLE ONLY public.previous_passwords DROP CONSTRAINT previous_passwords_fk_1;
ALTER TABLE ONLY public.identity_providers_tenants DROP CONSTRAINT identity_providers_tenants_fk_2;
ALTER TABLE ONLY public.identity_providers_tenants DROP CONSTRAINT identity_providers_tenants_fk_1;
ALTER TABLE ONLY public.identity_providers DROP CONSTRAINT identity_providers_fk_3;
ALTER TABLE ONLY public.identity_providers DROP CONSTRAINT identity_providers_fk_2;
ALTER TABLE ONLY public.identity_providers DROP CONSTRAINT identity_providers_fk_1;
ALTER TABLE ONLY public.identity_providers_applications DROP CONSTRAINT identity_providers_applications_fk_3;
ALTER TABLE ONLY public.identity_providers_applications DROP CONSTRAINT identity_providers_applications_fk_2;
ALTER TABLE ONLY public.identity_providers_applications DROP CONSTRAINT identity_providers_applications_fk_1;
ALTER TABLE ONLY public.identity_provider_links DROP CONSTRAINT identity_provider_links_fk_3;
ALTER TABLE ONLY public.identity_provider_links DROP CONSTRAINT identity_provider_links_fk_2;
ALTER TABLE ONLY public.identity_provider_links DROP CONSTRAINT identity_provider_links_fk_1;
ALTER TABLE ONLY public.identities DROP CONSTRAINT identities_fk_2;
ALTER TABLE ONLY public.identities DROP CONSTRAINT identities_fk_1;
ALTER TABLE ONLY public.hourly_logins DROP CONSTRAINT hourly_logins_fk_1;
ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_fk_1;
ALTER TABLE ONLY public.group_members DROP CONSTRAINT group_members_fk_2;
ALTER TABLE ONLY public.group_members DROP CONSTRAINT group_members_fk_1;
ALTER TABLE ONLY public.group_application_roles DROP CONSTRAINT group_application_roles_fk_2;
ALTER TABLE ONLY public.group_application_roles DROP CONSTRAINT group_application_roles_fk_1;
ALTER TABLE ONLY public.form_steps DROP CONSTRAINT form_steps_fk_2;
ALTER TABLE ONLY public.form_steps DROP CONSTRAINT form_steps_fk_1;
ALTER TABLE ONLY public.form_fields DROP CONSTRAINT form_fields_fk_1;
ALTER TABLE ONLY public.federated_domains DROP CONSTRAINT federated_domains_fk_1;
ALTER TABLE ONLY public.families DROP CONSTRAINT families_fk_1;
ALTER TABLE ONLY public.external_identifiers DROP CONSTRAINT external_identifiers_fk_3;
ALTER TABLE ONLY public.external_identifiers DROP CONSTRAINT external_identifiers_fk_2;
ALTER TABLE ONLY public.external_identifiers DROP CONSTRAINT external_identifiers_fk_1;
ALTER TABLE ONLY public.entity_user_grants DROP CONSTRAINT entity_user_grants_fk_2;
ALTER TABLE ONLY public.entity_user_grants DROP CONSTRAINT entity_user_grants_fk_1;
ALTER TABLE ONLY public.entity_user_grant_permissions DROP CONSTRAINT entity_user_grant_permissions_fk_2;
ALTER TABLE ONLY public.entity_user_grant_permissions DROP CONSTRAINT entity_user_grant_permissions_fk_1;
ALTER TABLE ONLY public.entity_types DROP CONSTRAINT entity_types_fk_1;
ALTER TABLE ONLY public.entity_type_permissions DROP CONSTRAINT entity_type_permissions_fk_1;
ALTER TABLE ONLY public.entity_entity_grants DROP CONSTRAINT entity_entity_grants_fk_2;
ALTER TABLE ONLY public.entity_entity_grants DROP CONSTRAINT entity_entity_grants_fk_1;
ALTER TABLE ONLY public.entity_entity_grant_permissions DROP CONSTRAINT entity_entity_grant_permissions_fk_2;
ALTER TABLE ONLY public.entity_entity_grant_permissions DROP CONSTRAINT entity_entity_grant_permissions_fk_1;
ALTER TABLE ONLY public.entities DROP CONSTRAINT entities_fk_3;
ALTER TABLE ONLY public.entities DROP CONSTRAINT entities_fk_2;
ALTER TABLE ONLY public.entities DROP CONSTRAINT entities_fk_1;
ALTER TABLE ONLY public.consents DROP CONSTRAINT consents_fk_2;
ALTER TABLE ONLY public.consents DROP CONSTRAINT consents_fk_1;
ALTER TABLE ONLY public.connectors_tenants DROP CONSTRAINT connectors_tenants_fk_2;
ALTER TABLE ONLY public.connectors_tenants DROP CONSTRAINT connectors_tenants_fk_1;
ALTER TABLE ONLY public.connectors DROP CONSTRAINT connectors_fk_2;
ALTER TABLE ONLY public.connectors DROP CONSTRAINT connectors_fk_1;
ALTER TABLE ONLY public.clean_speak_applications DROP CONSTRAINT clean_speak_applications_fk_1;
ALTER TABLE ONLY public.breached_password_metrics DROP CONSTRAINT breached_password_metrics_fk_1;
ALTER TABLE ONLY public.authentication_keys DROP CONSTRAINT authentication_keys_fk_2;
ALTER TABLE ONLY public.authentication_keys DROP CONSTRAINT authentication_keys_fk_1;
ALTER TABLE ONLY public.asynchronous_tasks DROP CONSTRAINT asynchronous_tasks_fk_1;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_9;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_8;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_7;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_6;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_5;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_4;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_35;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_34;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_33;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_32;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_31;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_30;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_3;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_29;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_28;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_27;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_26;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_25;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_24;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_23;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_22;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_21;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_20;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_2;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_19;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_18;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_17;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_16;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_15;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_14;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_13;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_12;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_11;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_10;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_fk_1;
ALTER TABLE ONLY public.application_roles DROP CONSTRAINT application_roles_fk_1;
ALTER TABLE ONLY public.application_registration_counts DROP CONSTRAINT application_registration_counts_fk_1;
ALTER TABLE ONLY public.application_oauth_scopes DROP CONSTRAINT application_oauth_scopes_fk_1;
ALTER TABLE ONLY public.application_monthly_active_users DROP CONSTRAINT application_monthly_active_users_fk_1;
ALTER TABLE ONLY public.application_daily_active_users DROP CONSTRAINT application_daily_active_users_fk_1;
DROP INDEX public.webauthn_credentials_i_1;
DROP INDEX public.users_i_2;
DROP INDEX public.users_i_1;
DROP INDEX public.user_registrations_i_2;
DROP INDEX public.user_registrations_i_1;
DROP INDEX public.user_consents_email_plus_i_1;
DROP INDEX public.user_comments_i_3;
DROP INDEX public.user_comments_i_2;
DROP INDEX public.user_comments_i_1;
DROP INDEX public.user_action_logs_i_2;
DROP INDEX public.user_action_logs_i_1;
DROP INDEX public.scim_external_id_users_i_2;
DROP INDEX public.scim_external_id_users_i_1;
DROP INDEX public.scim_external_id_groups_i_2;
DROP INDEX public.scim_external_id_groups_i_1;
DROP INDEX public.request_frequencies_i_1;
DROP INDEX public.refresh_tokens_i_4;
DROP INDEX public.refresh_tokens_i_3;
DROP INDEX public.refresh_tokens_i_2;
DROP INDEX public.refresh_tokens_i_1;
DROP INDEX public.raw_logins_i_2;
DROP INDEX public.raw_logins_i_1;
DROP INDEX public.identity_provider_links_i_1;
DROP INDEX public.identities_i_1;
DROP INDEX public.group_members_i_1;
DROP INDEX public.families_i_1;
DROP INDEX public.external_identifiers_i_3;
DROP INDEX public.external_identifiers_i_2;
DROP INDEX public.external_identifiers_i_1;
DROP INDEX public.event_logs_i1;
DROP INDEX public.entity_user_grants_i_1;
DROP INDEX public.audit_logs_i1;
DROP INDEX public.applications_i_1;
ALTER TABLE ONLY public.webhooks_tenants DROP CONSTRAINT webhooks_tenants_pkey;
ALTER TABLE ONLY public.webhooks DROP CONSTRAINT webhooks_pkey;
ALTER TABLE ONLY public.webauthn_credentials DROP CONSTRAINT webauthn_credentials_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.user_registrations DROP CONSTRAINT user_registrations_uk_1;
ALTER TABLE ONLY public.user_registrations DROP CONSTRAINT user_registrations_pkey;
ALTER TABLE ONLY public.user_registrations_application_roles DROP CONSTRAINT user_registrations_application_roles_uk_1;
ALTER TABLE ONLY public.user_consents DROP CONSTRAINT user_consents_pkey;
ALTER TABLE ONLY public.user_consents_email_plus DROP CONSTRAINT user_consents_email_plus_pkey;
ALTER TABLE ONLY public.user_comments DROP CONSTRAINT user_comments_pkey;
ALTER TABLE ONLY public.user_actions DROP CONSTRAINT user_actions_uk_1;
ALTER TABLE ONLY public.user_actions DROP CONSTRAINT user_actions_pkey;
ALTER TABLE ONLY public.user_action_reasons DROP CONSTRAINT user_action_reasons_uk_2;
ALTER TABLE ONLY public.user_action_reasons DROP CONSTRAINT user_action_reasons_uk_1;
ALTER TABLE ONLY public.user_action_reasons DROP CONSTRAINT user_action_reasons_pkey;
ALTER TABLE ONLY public.user_action_logs DROP CONSTRAINT user_action_logs_pkey;
ALTER TABLE ONLY public.themes DROP CONSTRAINT themes_uk_1;
ALTER TABLE ONLY public.themes DROP CONSTRAINT themes_pkey;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_uk_1;
ALTER TABLE ONLY public.tenants DROP CONSTRAINT tenants_pkey;
ALTER TABLE ONLY public.request_frequencies DROP CONSTRAINT request_frequencies_uk_1;
ALTER TABLE ONLY public.refresh_tokens DROP CONSTRAINT refresh_tokens_uk_2;
ALTER TABLE ONLY public.refresh_tokens DROP CONSTRAINT refresh_tokens_uk_1;
ALTER TABLE ONLY public.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
ALTER TABLE ONLY public.raw_global_registration_counts DROP CONSTRAINT raw_global_registration_counts_pkey;
ALTER TABLE ONLY public.raw_global_monthly_active_users DROP CONSTRAINT raw_global_monthly_active_users_uk_1;
ALTER TABLE ONLY public.raw_global_daily_active_users DROP CONSTRAINT raw_global_daily_active_users_uk_1;
ALTER TABLE ONLY public.raw_application_registration_counts DROP CONSTRAINT raw_application_registration_counts_pkey;
ALTER TABLE ONLY public.raw_application_monthly_active_users DROP CONSTRAINT raw_application_monthly_active_users_uk_1;
ALTER TABLE ONLY public.raw_application_daily_active_users DROP CONSTRAINT raw_application_daily_active_users_uk_1;
ALTER TABLE ONLY public.previous_passwords DROP CONSTRAINT previous_passwords_uk_1;
ALTER TABLE ONLY public.nodes DROP CONSTRAINT nodes_pkey;
ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
ALTER TABLE ONLY public.messengers DROP CONSTRAINT messengers_uk_1;
ALTER TABLE ONLY public.messengers DROP CONSTRAINT messengers_pkey;
ALTER TABLE ONLY public.message_templates DROP CONSTRAINT message_templates_uk_1;
ALTER TABLE ONLY public.message_templates DROP CONSTRAINT message_templates_pkey;
ALTER TABLE ONLY public.locks DROP CONSTRAINT locks_pkey;
ALTER TABLE ONLY public.lambdas DROP CONSTRAINT lambdas_pkey;
ALTER TABLE ONLY public.kickstart_files DROP CONSTRAINT kickstart_files_pkey;
ALTER TABLE ONLY public.keys DROP CONSTRAINT keys_uk_2;
ALTER TABLE ONLY public.keys DROP CONSTRAINT keys_uk_1;
ALTER TABLE ONLY public.keys DROP CONSTRAINT keys_pkey;
ALTER TABLE ONLY public.ip_location_meta_data DROP CONSTRAINT ip_location_meta_data_pkey;
ALTER TABLE ONLY public.ip_location_database DROP CONSTRAINT ip_location_database_pkey;
ALTER TABLE ONLY public.ip_access_control_lists DROP CONSTRAINT ip_access_control_lists_uk_1;
ALTER TABLE ONLY public.ip_access_control_lists DROP CONSTRAINT ip_access_control_lists_pkey;
ALTER TABLE ONLY public.identity_providers DROP CONSTRAINT identity_providers_uk_1;
ALTER TABLE ONLY public.identity_providers DROP CONSTRAINT identity_providers_pkey;
ALTER TABLE ONLY public.identity_provider_links DROP CONSTRAINT identity_provider_links_uk_1;
ALTER TABLE ONLY public.identities DROP CONSTRAINT identities_uk_2;
ALTER TABLE ONLY public.identities DROP CONSTRAINT identities_uk_1;
ALTER TABLE ONLY public.identities DROP CONSTRAINT identities_pkey;
ALTER TABLE ONLY public.hourly_logins DROP CONSTRAINT hourly_logins_uk_1;
ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_uk_1;
ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
ALTER TABLE ONLY public.group_members DROP CONSTRAINT group_members_uk_1;
ALTER TABLE ONLY public.group_members DROP CONSTRAINT group_members_pkey;
ALTER TABLE ONLY public.group_application_roles DROP CONSTRAINT group_application_roles_uk_1;
ALTER TABLE ONLY public.global_registration_counts DROP CONSTRAINT global_registration_counts_uk_1;
ALTER TABLE ONLY public.global_monthly_active_users DROP CONSTRAINT global_monthly_active_users_uk_1;
ALTER TABLE ONLY public.global_daily_active_users DROP CONSTRAINT global_daily_active_users_uk_1;
ALTER TABLE ONLY public.forms DROP CONSTRAINT forms_uk_1;
ALTER TABLE ONLY public.forms DROP CONSTRAINT forms_pkey;
ALTER TABLE ONLY public.form_steps DROP CONSTRAINT form_steps_pkey;
ALTER TABLE ONLY public.form_fields DROP CONSTRAINT form_fields_uk_1;
ALTER TABLE ONLY public.form_fields DROP CONSTRAINT form_fields_pkey;
ALTER TABLE ONLY public.federated_domains DROP CONSTRAINT federated_domains_uk_1;
ALTER TABLE ONLY public.families DROP CONSTRAINT families_pkey;
ALTER TABLE ONLY public.external_identifiers DROP CONSTRAINT external_identifiers_pkey;
ALTER TABLE ONLY public.event_logs DROP CONSTRAINT event_logs_pkey;
ALTER TABLE ONLY public.entity_user_grants DROP CONSTRAINT entity_user_grants_uk_1;
ALTER TABLE ONLY public.entity_user_grants DROP CONSTRAINT entity_user_grants_pkey;
ALTER TABLE ONLY public.entity_user_grant_permissions DROP CONSTRAINT entity_user_grant_permissions_uk_1;
ALTER TABLE ONLY public.entity_types DROP CONSTRAINT entity_types_uk_1;
ALTER TABLE ONLY public.entity_types DROP CONSTRAINT entity_types_pkey;
ALTER TABLE ONLY public.entity_type_permissions DROP CONSTRAINT entity_type_permissions_uk_1;
ALTER TABLE ONLY public.entity_type_permissions DROP CONSTRAINT entity_type_permissions_pkey;
ALTER TABLE ONLY public.entity_entity_grants DROP CONSTRAINT entity_entity_grants_uk_1;
ALTER TABLE ONLY public.entity_entity_grants DROP CONSTRAINT entity_entity_grants_pkey;
ALTER TABLE ONLY public.entity_entity_grant_permissions DROP CONSTRAINT entity_entity_grant_permissions_uk_1;
ALTER TABLE ONLY public.entities DROP CONSTRAINT entities_uk_1;
ALTER TABLE ONLY public.entities DROP CONSTRAINT entities_pkey;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_uk_1;
ALTER TABLE ONLY public.email_templates DROP CONSTRAINT email_templates_pkey;
ALTER TABLE ONLY public.data_sets DROP CONSTRAINT data_sets_pkey;
ALTER TABLE ONLY public.consents DROP CONSTRAINT consents_uk_1;
ALTER TABLE ONLY public.consents DROP CONSTRAINT consents_pkey;
ALTER TABLE ONLY public.connectors DROP CONSTRAINT connectors_uk_1;
ALTER TABLE ONLY public.connectors_tenants DROP CONSTRAINT connectors_tenants_uk_1;
ALTER TABLE ONLY public.connectors_tenants DROP CONSTRAINT connectors_tenants_pkey;
ALTER TABLE ONLY public.connectors DROP CONSTRAINT connectors_pkey;
ALTER TABLE ONLY public.common_breached_passwords DROP CONSTRAINT common_breached_passwords_pkey;
ALTER TABLE ONLY public.clean_speak_applications DROP CONSTRAINT clean_speak_applications_uk_1;
ALTER TABLE ONLY public.breached_password_metrics DROP CONSTRAINT breached_password_metrics_pkey;
ALTER TABLE ONLY public.authentication_keys DROP CONSTRAINT authentication_keys_uk_1;
ALTER TABLE ONLY public.authentication_keys DROP CONSTRAINT authentication_keys_pkey;
ALTER TABLE ONLY public.audit_logs DROP CONSTRAINT audit_logs_pkey;
ALTER TABLE ONLY public.asynchronous_tasks DROP CONSTRAINT asynchronous_tasks_uk_1;
ALTER TABLE ONLY public.asynchronous_tasks DROP CONSTRAINT asynchronous_tasks_pkey;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_uk_2;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_uk_1;
ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_pkey;
ALTER TABLE ONLY public.application_roles DROP CONSTRAINT application_roles_uk_1;
ALTER TABLE ONLY public.application_roles DROP CONSTRAINT application_roles_pkey;
ALTER TABLE ONLY public.application_registration_counts DROP CONSTRAINT application_registration_counts_uk_1;
ALTER TABLE ONLY public.application_oauth_scopes DROP CONSTRAINT application_oauth_scopes_uk_1;
ALTER TABLE ONLY public.application_oauth_scopes DROP CONSTRAINT application_oauth_scopes_pkey;
ALTER TABLE ONLY public.application_monthly_active_users DROP CONSTRAINT application_monthly_active_users_uk_1;
ALTER TABLE ONLY public.application_daily_active_users DROP CONSTRAINT application_daily_active_users_uk_1;
ALTER TABLE public.user_consents_email_plus ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.raw_global_registration_counts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.raw_application_registration_counts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.identities ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.event_logs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.audit_logs ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.webhooks_tenants;
DROP TABLE public.webhooks;
DROP TABLE public.webauthn_credentials;
DROP TABLE public.version;
DROP TABLE public.users;
DROP TABLE public.user_registrations_application_roles;
DROP TABLE public.user_registrations;
DROP SEQUENCE public.user_consents_email_plus_id_seq;
DROP TABLE public.user_consents_email_plus;
DROP TABLE public.user_consents;
DROP TABLE public.user_comments;
DROP TABLE public.user_actions;
DROP TABLE public.user_action_reasons;
DROP TABLE public.user_action_logs_applications;
DROP TABLE public.user_action_logs;
DROP TABLE public.themes;
DROP TABLE public.tenants;
DROP TABLE public.system_configuration;
DROP TABLE public.scim_external_id_users;
DROP TABLE public.scim_external_id_groups;
DROP TABLE public.request_frequencies;
DROP TABLE public.refresh_tokens;
DROP TABLE public.raw_logins;
DROP SEQUENCE public.raw_global_registration_counts_id_seq;
DROP TABLE public.raw_global_registration_counts;
DROP TABLE public.raw_global_monthly_active_users;
DROP TABLE public.raw_global_daily_active_users;
DROP SEQUENCE public.raw_application_registration_counts_id_seq;
DROP TABLE public.raw_application_registration_counts;
DROP TABLE public.raw_application_monthly_active_users;
DROP TABLE public.raw_application_daily_active_users;
DROP TABLE public.previous_passwords;
DROP TABLE public.nodes;
DROP TABLE public.migrations;
DROP TABLE public.messengers;
DROP TABLE public.message_templates;
DROP TABLE public.master_record;
DROP TABLE public.locks;
DROP TABLE public.last_login_instants;
DROP TABLE public.lambdas;
DROP TABLE public.kickstart_files;
DROP TABLE public.keys;
DROP TABLE public.ip_location_meta_data;
DROP TABLE public.ip_location_database;
DROP TABLE public.ip_access_control_lists;
DROP TABLE public.integrations;
DROP TABLE public.instance;
DROP TABLE public.identity_providers_tenants;
DROP TABLE public.identity_providers_applications;
DROP TABLE public.identity_providers;
DROP TABLE public.identity_provider_links;
DROP SEQUENCE public.identities_id_seq;
DROP TABLE public.identities;
DROP TABLE public.hourly_logins;
DROP TABLE public.groups;
DROP TABLE public.group_members;
DROP TABLE public.group_application_roles;
DROP TABLE public.global_registration_counts;
DROP TABLE public.global_monthly_active_users;
DROP TABLE public.global_daily_active_users;
DROP TABLE public.forms;
DROP TABLE public.form_steps;
DROP TABLE public.form_fields;
DROP TABLE public.federated_domains;
DROP TABLE public.families;
DROP TABLE public.external_identifiers;
DROP SEQUENCE public.event_logs_id_seq;
DROP TABLE public.event_logs;
DROP TABLE public.entity_user_grants;
DROP TABLE public.entity_user_grant_permissions;
DROP TABLE public.entity_types;
DROP TABLE public.entity_type_permissions;
DROP TABLE public.entity_entity_grants;
DROP TABLE public.entity_entity_grant_permissions;
DROP TABLE public.entities;
DROP TABLE public.email_templates;
DROP TABLE public.data_sets;
DROP TABLE public.consents;
DROP TABLE public.connectors_tenants;
DROP TABLE public.connectors;
DROP TABLE public.common_breached_passwords;
DROP TABLE public.clean_speak_applications;
DROP TABLE public.breached_password_metrics;
DROP TABLE public.authentication_keys;
DROP SEQUENCE public.audit_logs_id_seq;
DROP TABLE public.audit_logs;
DROP TABLE public.asynchronous_tasks;
DROP TABLE public.applications;
DROP TABLE public.application_roles;
DROP TABLE public.application_registration_counts;
DROP TABLE public.application_oauth_scopes;
DROP TABLE public.application_monthly_active_users;
DROP TABLE public.application_daily_active_users;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: application_daily_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_daily_active_users (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.application_daily_active_users OWNER TO fusionauth;

--
-- Name: application_monthly_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_monthly_active_users (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    month integer NOT NULL
);


ALTER TABLE public.application_monthly_active_users OWNER TO fusionauth;

--
-- Name: application_oauth_scopes; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_oauth_scopes (
    id uuid NOT NULL,
    applications_id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.application_oauth_scopes OWNER TO fusionauth;

--
-- Name: application_registration_counts; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_registration_counts (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.application_registration_counts OWNER TO fusionauth;

--
-- Name: application_roles; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_roles (
    id uuid NOT NULL,
    applications_id uuid NOT NULL,
    description character varying(255),
    insert_instant bigint NOT NULL,
    is_default boolean NOT NULL,
    is_super_role boolean NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.application_roles OWNER TO fusionauth;

--
-- Name: applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.applications (
    id uuid NOT NULL,
    access_token_populate_lambdas_id uuid,
    access_token_signing_keys_id uuid,
    active boolean NOT NULL,
    admin_registration_forms_id uuid NOT NULL,
    data text NOT NULL,
    email_update_email_templates_id uuid,
    email_verification_email_templates_id uuid,
    email_verified_email_templates_id uuid,
    forgot_password_email_templates_id uuid,
    forms_id uuid,
    id_token_populate_lambdas_id uuid,
    id_token_signing_keys_id uuid,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    login_id_in_use_on_create_email_templates_id uuid,
    login_id_in_use_on_update_email_templates_id uuid,
    login_new_device_email_templates_id uuid,
    login_suspicious_email_templates_id uuid,
    multi_factor_email_message_templates_id uuid,
    multi_factor_sms_message_templates_id uuid,
    name character varying(191) NOT NULL,
    passwordless_email_templates_id uuid,
    password_update_email_templates_id uuid,
    password_reset_success_email_templates_id uuid,
    samlv2_default_verification_keys_id uuid,
    samlv2_issuer character varying(191),
    samlv2_keys_id uuid,
    samlv2_logout_keys_id uuid,
    samlv2_logout_default_verification_keys_id uuid,
    samlv2_populate_lambdas_id uuid,
    samlv2_single_logout_keys_id uuid,
    self_service_registration_validation_lambdas_id uuid,
    self_service_user_forms_id uuid,
    set_password_email_templates_id uuid,
    tenants_id uuid NOT NULL,
    themes_id uuid,
    two_factor_method_add_email_templates_id uuid,
    two_factor_method_remove_email_templates_id uuid,
    ui_ip_access_control_lists_id uuid,
    userinfo_populate_lambdas_id uuid,
    verification_email_templates_id uuid
);


ALTER TABLE public.applications OWNER TO fusionauth;

--
-- Name: asynchronous_tasks; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.asynchronous_tasks (
    id uuid NOT NULL,
    data text,
    entity_id uuid,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    nodes_id uuid,
    status smallint NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.asynchronous_tasks OWNER TO fusionauth;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.audit_logs (
    id bigint NOT NULL,
    insert_instant bigint NOT NULL,
    insert_user character varying(255) NOT NULL,
    message text NOT NULL,
    data text
);


ALTER TABLE public.audit_logs OWNER TO fusionauth;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_logs_id_seq OWNER TO fusionauth;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- Name: authentication_keys; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.authentication_keys (
    id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    ip_access_control_lists_id uuid,
    last_update_instant bigint NOT NULL,
    key_manager boolean NOT NULL,
    key_value character varying(191) NOT NULL,
    permissions text,
    meta_data text,
    tenants_id uuid
);


ALTER TABLE public.authentication_keys OWNER TO fusionauth;

--
-- Name: breached_password_metrics; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.breached_password_metrics (
    tenants_id uuid NOT NULL,
    matched_exact_count integer NOT NULL,
    matched_sub_address_count integer NOT NULL,
    matched_common_password_count integer NOT NULL,
    matched_password_count integer NOT NULL,
    passwords_checked_count integer NOT NULL
);


ALTER TABLE public.breached_password_metrics OWNER TO fusionauth;

--
-- Name: clean_speak_applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.clean_speak_applications (
    applications_id uuid NOT NULL,
    clean_speak_application_id uuid NOT NULL
);


ALTER TABLE public.clean_speak_applications OWNER TO fusionauth;

--
-- Name: common_breached_passwords; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.common_breached_passwords (
    password character varying(191) NOT NULL
);


ALTER TABLE public.common_breached_passwords OWNER TO fusionauth;

--
-- Name: connectors; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.connectors (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    reconcile_lambdas_id uuid,
    ssl_certificate_keys_id uuid,
    type smallint NOT NULL
);


ALTER TABLE public.connectors OWNER TO fusionauth;

--
-- Name: connectors_tenants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.connectors_tenants (
    connectors_id uuid NOT NULL,
    data text NOT NULL,
    sequence smallint NOT NULL,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.connectors_tenants OWNER TO fusionauth;

--
-- Name: consents; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.consents (
    id uuid NOT NULL,
    consent_email_templates_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    email_plus_email_templates_id uuid
);


ALTER TABLE public.consents OWNER TO fusionauth;

--
-- Name: data_sets; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.data_sets (
    name character varying(191) NOT NULL,
    last_update_instant bigint NOT NULL
);


ALTER TABLE public.data_sets OWNER TO fusionauth;

--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.email_templates (
    id uuid NOT NULL,
    default_from_name character varying(255),
    default_html_template text NOT NULL,
    default_subject character varying(255) NOT NULL,
    default_text_template text NOT NULL,
    from_email character varying(255),
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_from_names text,
    localized_html_templates text NOT NULL,
    localized_subjects text NOT NULL,
    localized_text_templates text NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.email_templates OWNER TO fusionauth;

--
-- Name: entities; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.entities (
    id uuid NOT NULL,
    client_id character varying(191) NOT NULL,
    client_secret character varying(255) NOT NULL,
    data text,
    entity_types_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(255) NOT NULL,
    parent_id uuid,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.entities OWNER TO fusionauth;

--
-- Name: entity_entity_grant_permissions; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.entity_entity_grant_permissions (
    entity_entity_grants_id uuid NOT NULL,
    entity_type_permissions_id uuid NOT NULL
);


ALTER TABLE public.entity_entity_grant_permissions OWNER TO fusionauth;

--
-- Name: entity_entity_grants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.entity_entity_grants (
    id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    recipient_id uuid NOT NULL,
    target_id uuid NOT NULL
);


ALTER TABLE public.entity_entity_grants OWNER TO fusionauth;

--
-- Name: entity_type_permissions; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.entity_type_permissions (
    id uuid NOT NULL,
    data text,
    description text,
    entity_types_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    is_default boolean NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.entity_type_permissions OWNER TO fusionauth;

--
-- Name: entity_types; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.entity_types (
    id uuid NOT NULL,
    access_token_signing_keys_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.entity_types OWNER TO fusionauth;

--
-- Name: entity_user_grant_permissions; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.entity_user_grant_permissions (
    entity_user_grants_id uuid NOT NULL,
    entity_type_permissions_id uuid NOT NULL
);


ALTER TABLE public.entity_user_grant_permissions OWNER TO fusionauth;

--
-- Name: entity_user_grants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.entity_user_grants (
    id uuid NOT NULL,
    data text,
    entities_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.entity_user_grants OWNER TO fusionauth;

--
-- Name: event_logs; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.event_logs (
    id bigint NOT NULL,
    insert_instant bigint NOT NULL,
    message text NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.event_logs OWNER TO fusionauth;

--
-- Name: event_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.event_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_logs_id_seq OWNER TO fusionauth;

--
-- Name: event_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.event_logs_id_seq OWNED BY public.event_logs.id;


--
-- Name: external_identifiers; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.external_identifiers (
    id character varying(191) NOT NULL,
    applications_id uuid,
    data text,
    expiration_instant bigint,
    insert_instant bigint NOT NULL,
    tenants_id uuid NOT NULL,
    type smallint NOT NULL,
    users_id uuid
);


ALTER TABLE public.external_identifiers OWNER TO fusionauth;

--
-- Name: families; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.families (
    data text,
    family_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    owner boolean NOT NULL,
    role smallint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.families OWNER TO fusionauth;

--
-- Name: federated_domains; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.federated_domains (
    identity_providers_id uuid NOT NULL,
    domain character varying(191) NOT NULL
);


ALTER TABLE public.federated_domains OWNER TO fusionauth;

--
-- Name: form_fields; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.form_fields (
    id uuid NOT NULL,
    consents_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.form_fields OWNER TO fusionauth;

--
-- Name: form_steps; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.form_steps (
    form_fields_id uuid NOT NULL,
    forms_id uuid NOT NULL,
    sequence smallint NOT NULL,
    step smallint NOT NULL
);


ALTER TABLE public.form_steps OWNER TO fusionauth;

--
-- Name: forms; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.forms (
    id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.forms OWNER TO fusionauth;

--
-- Name: global_daily_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.global_daily_active_users (
    count integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.global_daily_active_users OWNER TO fusionauth;

--
-- Name: global_monthly_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.global_monthly_active_users (
    count integer NOT NULL,
    month integer NOT NULL
);


ALTER TABLE public.global_monthly_active_users OWNER TO fusionauth;

--
-- Name: global_registration_counts; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.global_registration_counts (
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.global_registration_counts OWNER TO fusionauth;

--
-- Name: group_application_roles; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.group_application_roles (
    application_roles_id uuid NOT NULL,
    groups_id uuid NOT NULL
);


ALTER TABLE public.group_application_roles OWNER TO fusionauth;

--
-- Name: group_members; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.group_members (
    id uuid NOT NULL,
    groups_id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.group_members OWNER TO fusionauth;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.groups OWNER TO fusionauth;

--
-- Name: hourly_logins; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.hourly_logins (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    data text,
    hour integer NOT NULL
);


ALTER TABLE public.hourly_logins OWNER TO fusionauth;

--
-- Name: identities; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.identities (
    id bigint NOT NULL,
    breached_password_last_checked_instant bigint,
    breached_password_status smallint,
    connectors_id uuid NOT NULL,
    email character varying(191),
    encryption_scheme character varying(255) NOT NULL,
    factor integer NOT NULL,
    insert_instant bigint NOT NULL,
    last_login_instant bigint,
    last_update_instant bigint NOT NULL,
    password character varying(255) NOT NULL,
    password_change_reason smallint,
    password_change_required boolean NOT NULL,
    password_last_update_instant bigint NOT NULL,
    salt character varying(255) NOT NULL,
    status smallint NOT NULL,
    tenants_id uuid NOT NULL,
    username character varying(191),
    username_index character varying(191),
    username_status smallint NOT NULL,
    users_id uuid NOT NULL,
    verified boolean NOT NULL,
    verified_instant bigint
);


ALTER TABLE public.identities OWNER TO fusionauth;

--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.identities_id_seq OWNER TO fusionauth;

--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.identities_id_seq OWNED BY public.identities.id;


--
-- Name: identity_provider_links; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.identity_provider_links (
    data text NOT NULL,
    identity_providers_id uuid NOT NULL,
    identity_providers_user_id character varying(191) NOT NULL,
    insert_instant bigint NOT NULL,
    last_login_instant bigint NOT NULL,
    tenants_id uuid NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.identity_provider_links OWNER TO fusionauth;

--
-- Name: identity_providers; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.identity_providers (
    id uuid NOT NULL,
    data text NOT NULL,
    enabled boolean NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type character varying(255) NOT NULL,
    keys_id uuid,
    request_signing_keys_id uuid,
    reconcile_lambdas_id uuid
);


ALTER TABLE public.identity_providers OWNER TO fusionauth;

--
-- Name: identity_providers_applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.identity_providers_applications (
    applications_id uuid NOT NULL,
    data text NOT NULL,
    enabled boolean NOT NULL,
    identity_providers_id uuid NOT NULL,
    keys_id uuid
);


ALTER TABLE public.identity_providers_applications OWNER TO fusionauth;

--
-- Name: identity_providers_tenants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.identity_providers_tenants (
    tenants_id uuid NOT NULL,
    data text NOT NULL,
    identity_providers_id uuid NOT NULL
);


ALTER TABLE public.identity_providers_tenants OWNER TO fusionauth;

--
-- Name: instance; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.instance (
    id uuid NOT NULL,
    activate_instant bigint,
    data text,
    license text,
    license_id character varying(255),
    setup_complete boolean NOT NULL
);


ALTER TABLE public.instance OWNER TO fusionauth;

--
-- Name: integrations; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.integrations (
    data text NOT NULL
);


ALTER TABLE public.integrations OWNER TO fusionauth;

--
-- Name: ip_access_control_lists; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.ip_access_control_lists (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.ip_access_control_lists OWNER TO fusionauth;

--
-- Name: ip_location_database; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.ip_location_database (
    data bytea NOT NULL,
    last_modified bigint NOT NULL,
    seq integer NOT NULL
);


ALTER TABLE public.ip_location_database OWNER TO fusionauth;

--
-- Name: ip_location_meta_data; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.ip_location_meta_data (
    digest character varying(255) NOT NULL,
    last_modified bigint NOT NULL
);


ALTER TABLE public.ip_location_meta_data OWNER TO fusionauth;

--
-- Name: keys; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.keys (
    id uuid NOT NULL,
    algorithm character varying(255),
    certificate text,
    expiration_instant bigint,
    insert_instant bigint NOT NULL,
    issuer character varying(255),
    kid character varying(191) NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    private_key text,
    public_key text,
    secret text,
    type character varying(255) NOT NULL
);


ALTER TABLE public.keys OWNER TO fusionauth;

--
-- Name: kickstart_files; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.kickstart_files (
    id uuid NOT NULL,
    kickstart bytea NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.kickstart_files OWNER TO fusionauth;

--
-- Name: lambdas; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.lambdas (
    id uuid NOT NULL,
    body text NOT NULL,
    debug boolean NOT NULL,
    engine_type character varying(255) NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(255) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.lambdas OWNER TO fusionauth;

--
-- Name: last_login_instants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.last_login_instants (
    applications_id uuid,
    registration_last_login_instant bigint,
    users_id uuid,
    user_last_login_instant bigint
);


ALTER TABLE public.last_login_instants OWNER TO fusionauth;

--
-- Name: locks; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.locks (
    type character varying(191) NOT NULL,
    update_instant bigint
);


ALTER TABLE public.locks OWNER TO fusionauth;

--
-- Name: master_record; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.master_record (
    id uuid NOT NULL,
    instant bigint NOT NULL
);


ALTER TABLE public.master_record OWNER TO fusionauth;

--
-- Name: message_templates; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.message_templates (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.message_templates OWNER TO fusionauth;

--
-- Name: messengers; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.messengers (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.messengers OWNER TO fusionauth;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.migrations (
    name character varying(191) NOT NULL,
    run_instant bigint NOT NULL
);


ALTER TABLE public.migrations OWNER TO fusionauth;

--
-- Name: nodes; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.nodes (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_checkin_instant bigint NOT NULL,
    runtime_mode character varying(255) NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE public.nodes OWNER TO fusionauth;

--
-- Name: previous_passwords; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.previous_passwords (
    insert_instant bigint NOT NULL,
    encryption_scheme character varying(255) NOT NULL,
    factor integer NOT NULL,
    password character varying(255) NOT NULL,
    salt character varying(255) NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.previous_passwords OWNER TO fusionauth;

--
-- Name: raw_application_daily_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_application_daily_active_users (
    applications_id uuid NOT NULL,
    day integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_application_daily_active_users OWNER TO fusionauth;

--
-- Name: raw_application_monthly_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_application_monthly_active_users (
    applications_id uuid NOT NULL,
    month integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_application_monthly_active_users OWNER TO fusionauth;

--
-- Name: raw_application_registration_counts; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_application_registration_counts (
    id bigint NOT NULL,
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.raw_application_registration_counts OWNER TO fusionauth;

--
-- Name: raw_application_registration_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.raw_application_registration_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.raw_application_registration_counts_id_seq OWNER TO fusionauth;

--
-- Name: raw_application_registration_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.raw_application_registration_counts_id_seq OWNED BY public.raw_application_registration_counts.id;


--
-- Name: raw_global_daily_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_global_daily_active_users (
    day integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_global_daily_active_users OWNER TO fusionauth;

--
-- Name: raw_global_monthly_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_global_monthly_active_users (
    month integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_global_monthly_active_users OWNER TO fusionauth;

--
-- Name: raw_global_registration_counts; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_global_registration_counts (
    id bigint NOT NULL,
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.raw_global_registration_counts OWNER TO fusionauth;

--
-- Name: raw_global_registration_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.raw_global_registration_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.raw_global_registration_counts_id_seq OWNER TO fusionauth;

--
-- Name: raw_global_registration_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.raw_global_registration_counts_id_seq OWNED BY public.raw_global_registration_counts.id;


--
-- Name: raw_logins; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_logins (
    applications_id uuid,
    instant bigint NOT NULL,
    ip_address character varying(255),
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_logins OWNER TO fusionauth;

--
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.refresh_tokens (
    id uuid NOT NULL,
    applications_id uuid,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    start_instant bigint NOT NULL,
    tenants_id uuid,
    token character varying(191),
    token_hash character(64),
    token_text text,
    users_id uuid NOT NULL
);


ALTER TABLE public.refresh_tokens OWNER TO fusionauth;

--
-- Name: request_frequencies; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.request_frequencies (
    count integer NOT NULL,
    last_update_instant bigint NOT NULL,
    request_id character varying(191) NOT NULL,
    tenants_id uuid NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.request_frequencies OWNER TO fusionauth;

--
-- Name: scim_external_id_groups; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.scim_external_id_groups (
    entities_id uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    groups_id uuid NOT NULL
);


ALTER TABLE public.scim_external_id_groups OWNER TO fusionauth;

--
-- Name: scim_external_id_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.scim_external_id_users (
    entities_id uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.scim_external_id_users OWNER TO fusionauth;

--
-- Name: system_configuration; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.system_configuration (
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    report_timezone character varying(255) NOT NULL
);


ALTER TABLE public.system_configuration OWNER TO fusionauth;

--
-- Name: tenants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.tenants (
    id uuid NOT NULL,
    access_token_signing_keys_id uuid NOT NULL,
    admin_user_forms_id uuid NOT NULL,
    client_credentials_access_token_populate_lambdas_id uuid,
    confirm_child_email_templates_id uuid,
    data text,
    email_update_email_templates_id uuid,
    email_verified_email_templates_id uuid,
    failed_authentication_user_actions_id uuid,
    family_request_email_templates_id uuid,
    forgot_password_email_templates_id uuid,
    id_token_signing_keys_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    login_id_in_use_on_create_email_templates_id uuid,
    login_id_in_use_on_update_email_templates_id uuid,
    login_new_device_email_templates_id uuid,
    login_suspicious_email_templates_id uuid,
    multi_factor_email_message_templates_id uuid,
    multi_factor_sms_message_templates_id uuid,
    multi_factor_sms_messengers_id uuid,
    name character varying(191) NOT NULL,
    password_reset_success_email_templates_id uuid,
    password_update_email_templates_id uuid,
    parent_registration_email_templates_id uuid,
    passwordless_email_templates_id uuid,
    scim_client_entity_types_id uuid,
    scim_enterprise_user_request_converter_lambdas_id uuid,
    scim_enterprise_user_response_converter_lambdas_id uuid,
    scim_group_request_converter_lambdas_id uuid,
    scim_group_response_converter_lambdas_id uuid,
    scim_server_entity_types_id uuid,
    scim_user_request_converter_lambdas_id uuid,
    scim_user_response_converter_lambdas_id uuid,
    set_password_email_templates_id uuid,
    themes_id uuid NOT NULL,
    two_factor_method_add_email_templates_id uuid,
    two_factor_method_remove_email_templates_id uuid,
    ui_ip_access_control_lists_id uuid,
    verification_email_templates_id uuid
);


ALTER TABLE public.tenants OWNER TO fusionauth;

--
-- Name: themes; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.themes (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.themes OWNER TO fusionauth;

--
-- Name: user_action_logs; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_action_logs (
    id uuid NOT NULL,
    actioner_users_id uuid,
    actionee_users_id uuid NOT NULL,
    comment text,
    email_user_on_end boolean NOT NULL,
    end_event_sent boolean,
    expiry bigint,
    history text,
    insert_instant bigint NOT NULL,
    localized_name character varying(191),
    localized_option character varying(255),
    localized_reason character varying(255),
    name character varying(191),
    notify_user_on_end boolean NOT NULL,
    option_name character varying(255),
    reason character varying(255),
    reason_code character varying(255),
    user_actions_id uuid NOT NULL
);


ALTER TABLE public.user_action_logs OWNER TO fusionauth;

--
-- Name: user_action_logs_applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_action_logs_applications (
    applications_id uuid NOT NULL,
    user_action_logs_id uuid NOT NULL
);


ALTER TABLE public.user_action_logs_applications OWNER TO fusionauth;

--
-- Name: user_action_reasons; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_action_reasons (
    id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_texts text,
    text character varying(191) NOT NULL,
    code character varying(191) NOT NULL
);


ALTER TABLE public.user_action_reasons OWNER TO fusionauth;

--
-- Name: user_actions; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_actions (
    id uuid NOT NULL,
    active boolean NOT NULL,
    cancel_email_templates_id uuid,
    end_email_templates_id uuid,
    include_email_in_event_json boolean NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_names text,
    modify_email_templates_id uuid,
    name character varying(191) NOT NULL,
    options text,
    prevent_login boolean NOT NULL,
    send_end_event boolean NOT NULL,
    start_email_templates_id uuid,
    temporal boolean NOT NULL,
    transaction_type smallint NOT NULL,
    user_notifications_enabled boolean NOT NULL,
    user_emailing_enabled boolean NOT NULL
);


ALTER TABLE public.user_actions OWNER TO fusionauth;

--
-- Name: user_comments; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_comments (
    id uuid NOT NULL,
    comment text,
    commenter_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.user_comments OWNER TO fusionauth;

--
-- Name: user_consents; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_consents (
    id uuid NOT NULL,
    consents_id uuid NOT NULL,
    data text,
    giver_users_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.user_consents OWNER TO fusionauth;

--
-- Name: user_consents_email_plus; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_consents_email_plus (
    id bigint NOT NULL,
    next_email_instant bigint NOT NULL,
    user_consents_id uuid NOT NULL
);


ALTER TABLE public.user_consents_email_plus OWNER TO fusionauth;

--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.user_consents_email_plus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_consents_email_plus_id_seq OWNER TO fusionauth;

--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.user_consents_email_plus_id_seq OWNED BY public.user_consents_email_plus.id;


--
-- Name: user_registrations; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_registrations (
    id uuid NOT NULL,
    applications_id uuid NOT NULL,
    authentication_token character varying(255),
    clean_speak_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_login_instant bigint,
    last_update_instant bigint NOT NULL,
    timezone character varying(255),
    username character varying(191),
    username_status smallint NOT NULL,
    users_id uuid NOT NULL,
    verified boolean NOT NULL,
    verified_instant bigint
);


ALTER TABLE public.user_registrations OWNER TO fusionauth;

--
-- Name: user_registrations_application_roles; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_registrations_application_roles (
    application_roles_id uuid NOT NULL,
    user_registrations_id uuid NOT NULL
);


ALTER TABLE public.user_registrations_application_roles OWNER TO fusionauth;

--
-- Name: users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    active boolean NOT NULL,
    birth_date character(10),
    clean_speak_id uuid,
    data text,
    expiry bigint,
    first_name character varying(255),
    full_name character varying(255),
    image_url text,
    insert_instant bigint NOT NULL,
    last_name character varying(255),
    last_update_instant bigint NOT NULL,
    middle_name character varying(255),
    mobile_phone character varying(255),
    parent_email character varying(255),
    tenants_id uuid NOT NULL,
    timezone character varying(255)
);


ALTER TABLE public.users OWNER TO fusionauth;

--
-- Name: version; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.version (
    version character varying(255) NOT NULL
);


ALTER TABLE public.version OWNER TO fusionauth;

--
-- Name: webauthn_credentials; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.webauthn_credentials (
    id uuid NOT NULL,
    credential_id text NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_use_instant bigint NOT NULL,
    tenants_id uuid NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.webauthn_credentials OWNER TO fusionauth;

--
-- Name: webhooks; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.webhooks (
    id uuid NOT NULL,
    connect_timeout integer NOT NULL,
    description character varying(255),
    data text,
    global boolean NOT NULL,
    headers text,
    http_authentication_username character varying(255),
    http_authentication_password character varying(255),
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    read_timeout integer NOT NULL,
    signing_keys_id uuid,
    ssl_certificate text,
    ssl_certificate_keys_id uuid,
    url text NOT NULL
);


ALTER TABLE public.webhooks OWNER TO fusionauth;

--
-- Name: webhooks_tenants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.webhooks_tenants (
    webhooks_id uuid NOT NULL,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.webhooks_tenants OWNER TO fusionauth;

--
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- Name: event_logs id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.event_logs ALTER COLUMN id SET DEFAULT nextval('public.event_logs_id_seq'::regclass);


--
-- Name: identities id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities ALTER COLUMN id SET DEFAULT nextval('public.identities_id_seq'::regclass);


--
-- Name: raw_application_registration_counts id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_application_registration_counts ALTER COLUMN id SET DEFAULT nextval('public.raw_application_registration_counts_id_seq'::regclass);


--
-- Name: raw_global_registration_counts id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_global_registration_counts ALTER COLUMN id SET DEFAULT nextval('public.raw_global_registration_counts_id_seq'::regclass);


--
-- Name: user_consents_email_plus id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents_email_plus ALTER COLUMN id SET DEFAULT nextval('public.user_consents_email_plus_id_seq'::regclass);


--
-- Data for Name: application_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_daily_active_users (applications_id, count, day) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	19875
f3c84053-b5ff-423f-b2b5-af690b7199b0	2	19875
\.


--
-- Data for Name: application_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_monthly_active_users (applications_id, count, month) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	653
f3c84053-b5ff-423f-b2b5-af690b7199b0	2	653
\.


--
-- Data for Name: application_oauth_scopes; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_oauth_scopes (id, applications_id, data, insert_instant, last_update_instant, name) FROM stdin;
\.


--
-- Data for Name: application_registration_counts; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_registration_counts (applications_id, count, decremented_count, hour) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	0	477007
f3c84053-b5ff-423f-b2b5-af690b7199b0	2	0	477007
\.


--
-- Data for Name: application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_roles (id, applications_id, description, insert_instant, is_default, is_super_role, last_update_instant, name) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb8236e2	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Global admin	1717226992187	f	t	1717226992187	admin
631ecd9d-8d40-4c13-8277-80cedb8236e3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	API key manager	1717226992187	f	f	1717226992187	api_key_manager
631ecd9d-8d40-4c13-8277-80cedb8236e4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Application deleter	1717226992187	f	f	1717226992187	application_deleter
631ecd9d-8d40-4c13-8277-80cedb8236e5	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Application manager	1717226992187	f	f	1717226992187	application_manager
631ecd9d-8d40-4c13-8277-80cedb8236e6	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Audit log viewer	1717226992187	f	f	1717226992187	audit_log_viewer
631ecd9d-8d40-4c13-8277-80cedb8236e7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Email template manager	1717226992187	f	f	1717226992187	email_template_manager
631ecd9d-8d40-4c13-8277-80cedb8236e8	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Report viewer	1717226992187	f	f	1717226992187	report_viewer
631ecd9d-8d40-4c13-8277-80cedb8236e9	3c219e58-ed0e-4b18-ad48-f4f92793ae32	System configuration manager	1717226992187	f	f	1717226992187	system_manager
631ecd9d-8d40-4c13-8277-80cedb8236f0	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User action deleter	1717226992187	f	f	1717226992187	user_action_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f1	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User action manager	1717226992187	f	f	1717226992187	user_action_manager
631ecd9d-8d40-4c13-8277-80cedb8236f2	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User deleter	1717226992187	f	f	1717226992187	user_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User manager	1717226992187	f	f	1717226992187	user_manager
631ecd9d-8d40-4c13-8277-80cedb8236f4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Webhook manager	1717226992187	f	f	1717226992187	webhook_manager
631ecd9d-8d40-4c13-8277-80cedb8236f5	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Group manager	1717226992187	f	f	1717226992187	group_manager
631ecd9d-8d40-4c13-8277-80cedb8236f6	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Group deleter	1717226992187	f	f	1717226992187	group_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Tenant manager	1717226992187	f	f	1717226992187	tenant_manager
631ecd9d-8d40-4c13-8277-80cedb8236f8	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Tenant deleter	1717226992187	f	f	1717226992187	tenant_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f9	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Lambda manager	1717226992187	f	f	1717226992187	lambda_manager
631ecd9d-8d40-4c13-8277-80cedb8236fa	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Event log viewer	1717226992187	f	f	1717226992187	event_log_viewer
631ecd9d-8d40-4c13-8277-80cedb8236fb	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Key manager	1717226992187	f	f	1717226992187	key_manager
631ecd9d-8d40-4c13-8277-80cedb8236fc	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Consent deleter	1717226992187	f	f	1717226992187	consent_deleter
631ecd9d-8d40-4c13-8277-80cedb8236fd	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Consent manager	1717226992187	f	f	1717226992187	consent_manager
631ecd9d-8d40-4c13-8277-80cedb8236fe	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Theme manager	1717226992187	f	f	1717226992187	theme_manager
631ecd9d-8d40-4c13-8277-80cedb8236ff	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Reactor manager	1717226992187	f	f	1717226992187	reactor_manager
631ecd9d-8d40-4c13-8277-80cedb823700	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Connector deleter	1717226992187	f	f	1717226992187	connector_deleter
631ecd9d-8d40-4c13-8277-80cedb823701	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Connector manager	1717226992187	f	f	1717226992187	connector_manager
631ecd9d-8d40-4c13-8277-80cedb823702	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Form deleter	1717226992187	f	f	1717226992187	form_deleter
631ecd9d-8d40-4c13-8277-80cedb823703	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Form manager	1717226992187	f	f	1717226992187	form_manager
631ecd9d-8d40-4c13-8277-80cedb823704	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User support manager	1717226992187	f	f	1717226992187	user_support_manager
631ecd9d-8d40-4c13-8277-80cedb823705	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User support viewer	1717226992187	f	f	1717226992187	user_support_viewer
631ecd9d-8d40-4c13-8277-80cedb823706	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Entity manager	1717226992187	f	f	1717226992187	entity_manager
631ecd9d-8d40-4c13-8277-80cedb823707	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Messenger deleter	1717226992187	f	f	1717226992187	messenger_deleter
631ecd9d-8d40-4c13-8277-80cedb823708	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Messenger manager	1717226992187	f	f	1717226992187	messenger_manager
631ecd9d-8d40-4c13-8277-80cedb823709	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Message template deleter	1717226992187	f	f	1717226992187	message_template_deleter
631ecd9d-8d40-4c13-8277-80cedb823710	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Message template manager	1717226992187	f	f	1717226992187	message_template_manager
631ecd9d-8d40-4c13-8277-80cedb823711	3c219e58-ed0e-4b18-ad48-f4f92793ae32	ACL deleter	1717226992187	f	f	1717226992187	acl_deleter
631ecd9d-8d40-4c13-8277-80cedb823712	3c219e58-ed0e-4b18-ad48-f4f92793ae32	ACL manager	1717226992187	f	f	1717226992187	acl_manager
0f477b01-f0e9-4bb1-b54b-218615e7ccbd	f3c84053-b5ff-423f-b2b5-af690b7199b0	\N	1717227148696	t	f	1717227148696	user
da315d84-6988-475a-a9b6-51cc3e3eca90	f3c84053-b5ff-423f-b2b5-af690b7199b0	\N	1717227155896	f	t	1717227155896	admin
\.


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.applications (id, access_token_populate_lambdas_id, access_token_signing_keys_id, active, admin_registration_forms_id, data, email_update_email_templates_id, email_verification_email_templates_id, email_verified_email_templates_id, forgot_password_email_templates_id, forms_id, id_token_populate_lambdas_id, id_token_signing_keys_id, insert_instant, last_update_instant, login_id_in_use_on_create_email_templates_id, login_id_in_use_on_update_email_templates_id, login_new_device_email_templates_id, login_suspicious_email_templates_id, multi_factor_email_message_templates_id, multi_factor_sms_message_templates_id, name, passwordless_email_templates_id, password_update_email_templates_id, password_reset_success_email_templates_id, samlv2_default_verification_keys_id, samlv2_issuer, samlv2_keys_id, samlv2_logout_keys_id, samlv2_logout_default_verification_keys_id, samlv2_populate_lambdas_id, samlv2_single_logout_keys_id, self_service_registration_validation_lambdas_id, self_service_user_forms_id, set_password_email_templates_id, tenants_id, themes_id, two_factor_method_add_email_templates_id, two_factor_method_remove_email_templates_id, ui_ip_access_control_lists_id, userinfo_populate_lambdas_id, verification_email_templates_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	\N	5bf0f697-1c6d-1ad4-f55a-aff1b5319bf3	t	e04a6b91-ec4d-4859-e4b7-21c5453ac1f4	{"jwtConfiguration": {"enabled": true, "timeToLiveInSeconds": 60, "refreshTokenExpirationPolicy": "SlidingWindow", "refreshTokenTimeToLiveInMinutes": 60, "refreshTokenUsagePolicy": "OneTimeUse"},"registrationConfiguration": {"type":"basic"}, "oauthConfiguration": {"authorizedRedirectURLs": ["/admin/login"], "clientId": "3c219e58-ed0e-4b18-ad48-f4f92793ae32", "clientSecret": "ODExY2I5YWIwYzhlZmU2YzMxMWMzOWY0YzI1YzlmYTkwMThjZDAyNzEwNTAzY2QzNGEyNjA2Y2IwNTA2Zjg2YQ==", "enabledGrants": ["authorization_code", "refresh_token"], "logoutURL": "/admin/single-logout", "generateRefreshTokens": true, "clientAuthenticationPolicy": "Required", "proofKeyForCodeExchangePolicy": "Required" },"loginConfiguration": {"allowTokenRefresh": false, "generateRefreshTokens": false, "requireAuthentication": true},"unverified":{ "behavior": "Allow" },"verificationStrategy":"ClickableLink","state": "Active"}	\N	\N	\N	\N	\N	\N	092dbedc-30af-4149-9c61-b578f2c72f59	1717226992187	1717226992187	\N	\N	\N	\N	\N	\N	FusionAuth	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	66596267-5933-e0aa-b3bc-8ac0344bed03	\N	\N	\N	\N	\N	\N
f3c84053-b5ff-423f-b2b5-af690b7199b0	\N	585eb9ca-4621-4040-8725-9ecc0ccce336	t	e04a6b91-ec4d-4859-e4b7-21c5453ac1f4	{"accessControlConfiguration":{},"authenticationTokenConfiguration":{"enabled":false},"data":{},"externalIdentifierConfiguration":{},"formConfiguration":{"selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"jwtConfiguration":{"enabled":true,"refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"oauthConfiguration":{"authorizedRedirectURLs":["http://localhost:8080/swagger-ui/oauth2-redirect.html"],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"NotRequired","clientId":"f3c84053-b5ff-423f-b2b5-af690b7199b0","clientSecret":"IPR50yGsuyc4D3IqeGSEd_BetRWvjKwRseFJvFzbnQc","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":false,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":true,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"state":"Active","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}}	\N	\N	\N	\N	\N	\N	585eb9ca-4621-4040-8725-9ecc0ccce336	1717227095167	1717227649290	\N	\N	\N	\N	\N	\N	tms	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	66596267-5933-e0aa-b3bc-8ac0344bed03	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: asynchronous_tasks; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.asynchronous_tasks (id, data, entity_id, insert_instant, last_update_instant, nodes_id, status, type) FROM stdin;
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.audit_logs (id, insert_instant, insert_user, message, data) FROM stdin;
1	1717227095228	pubappadm@outlook.com	Created the application with Id [f3c84053-b5ff-423f-b2b5-af690b7199b0] and name [tms]	{"data":{},"reason":"FusionAuth First Time Setup"}
2	1717227110015	pubappadm@outlook.com	Created the API key with Id [3d65b476-0ebb-4893-92c8-241a9d259358] and a key ending [*EuRn0MW].	{"data":{},"reason":"FusionAuth First Time Setup"}
3	1717227112685	pubappadm@outlook.com	Updated the tenant with Id [66596267-5933-e0aa-b3bc-8ac0344bed03] and name [Default]	{"data":{},"newValue":{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":false,"connectorPolicies":[{"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","domains":["*"],"migrate":false}],"data":{},"emailConfiguration":{"additionalHeaders":[],"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","host":"localhost","implicitEmailVerificationAllowed":true,"port":25,"security":"TLS","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{"adminUserFormId":"abc2df79-bb94-e8a5-cd38-7db67c28d5ef"},"httpSessionMaxInactiveInterval":3600,"id":"66596267-5933-e0aa-b3bc-8ac0344bed03","insertInstant":1717226991187,"issuer":"localhost:9011","jwtConfiguration":{"accessTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","idTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","refreshTokenExpirationPolicy":"Fixed","refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1717227077857,"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"22b8fc9c-f7f9-42b7-999d-a9f3b6d7b743"},"loginPolicy":"Enabled","sms":{"enabled":false}},"name":"Default","oauthConfiguration":{},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"notifyUserEmailTemplateId":"90ab8419-43f8-4003-a272-9797ad3ae449"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{"blockedDomains":[]},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","themeId":"75a068fd-e94b-451a-9aeb-3ddb9a3b5987","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"any","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}},"oldValue":{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":false,"connectorPolicies":[{"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","domains":["*"],"migrate":false}],"data":{},"emailConfiguration":{"additionalHeaders":[],"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","forgotPasswordEmailTemplateId":"173e61a0-d068-406c-b35f-10a3e63b130c","host":"localhost","implicitEmailVerificationAllowed":true,"passwordlessEmailTemplateId":"97b649d3-1667-4a3c-9d1f-a26a0c5f5bd0","port":25,"setPasswordEmailTemplateId":"ee026357-7611-4a95-b140-1a55951ebec6","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{"adminUserFormId":"abc2df79-bb94-e8a5-cd38-7db67c28d5ef"},"httpSessionMaxInactiveInterval":3600,"id":"66596267-5933-e0aa-b3bc-8ac0344bed03","insertInstant":1717226991187,"issuer":"localhost:9011","jwtConfiguration":{"accessTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","idTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","refreshTokenExpirationPolicy":"Fixed","refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1717227077857,"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"22b8fc9c-f7f9-42b7-999d-a9f3b6d7b743"},"loginPolicy":"Enabled","sms":{"enabled":false}},"name":"Default","oauthConfiguration":{},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"notifyUserEmailTemplateId":"90ab8419-43f8-4003-a272-9797ad3ae449"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{"blockedDomains":[]},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","themeId":"75a068fd-e94b-451a-9aeb-3ddb9a3b5987","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"any","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}},"reason":"FusionAuth First Time Setup"}
4	1717227118847	pubappadm@outlook.com	Completed the first time setup wizard.	{"data":{},"reason":"FusionAuth User Interface"}
5	1717227148742	pubappadm@outlook.com	Added role with Id [0f477b01-f0e9-4bb1-b54b-218615e7ccbd] and name [user] to application with Id [f3c84053-b5ff-423f-b2b5-af690b7199b0] and name [tms]	{"data":{},"reason":"FusionAuth User Interface"}
6	1717227155949	pubappadm@outlook.com	Added role with Id [da315d84-6988-475a-a9b6-51cc3e3eca90] and name [admin] to application with Id [f3c84053-b5ff-423f-b2b5-af690b7199b0] and name [tms]	{"data":{},"reason":"FusionAuth User Interface"}
7	1717227178925	pubappadm@outlook.com	Created the tenant with Id [7fb233aa-b21c-4e9d-84cd-5567df65caf1] and name [tms]	{"data":{},"reason":"FusionAuth User Interface"}
8	1717227192891	pubappadm@outlook.com	Updated the application with Id [f3c84053-b5ff-423f-b2b5-af690b7199b0] and name [tms]	{"data":{},"newValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"e04a6b91-ec4d-4859-e4b7-21c5453ac1f4","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"f3c84053-b5ff-423f-b2b5-af690b7199b0","insertInstant":1717227095167,"jwtConfiguration":{"accessTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","enabled":true,"idTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1717227192831,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"tms","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"f3c84053-b5ff-423f-b2b5-af690b7199b0","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[{"id":"da315d84-6988-475a-a9b6-51cc3e3eca90","insertInstant":1717227155896,"isDefault":false,"isSuperRole":true,"lastUpdateInstant":1717227155896,"name":"admin"},{"id":"0f477b01-f0e9-4bb1-b54b-218615e7ccbd","insertInstant":1717227148696,"isDefault":true,"isSuperRole":false,"lastUpdateInstant":1717227148696,"name":"user"}],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"66596267-5933-e0aa-b3bc-8ac0344bed03","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"oldValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"e04a6b91-ec4d-4859-e4b7-21c5453ac1f4","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"f3c84053-b5ff-423f-b2b5-af690b7199b0","insertInstant":1717227095167,"jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1717227095167,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"tms","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"f3c84053-b5ff-423f-b2b5-af690b7199b0","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[{"id":"da315d84-6988-475a-a9b6-51cc3e3eca90","insertInstant":1717227155896,"isDefault":false,"isSuperRole":true,"lastUpdateInstant":1717227155896,"name":"admin"},{"id":"0f477b01-f0e9-4bb1-b54b-218615e7ccbd","insertInstant":1717227148696,"isDefault":true,"isSuperRole":false,"lastUpdateInstant":1717227148696,"name":"user"}],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"66596267-5933-e0aa-b3bc-8ac0344bed03","unverified":{"behavior":"Allow"},"verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"reason":"FusionAuth User Interface"}
9	1717227206805	pubappadm@outlook.com	Updated the application with Id [f3c84053-b5ff-423f-b2b5-af690b7199b0] and name [tms]	{"data":{},"newValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"e04a6b91-ec4d-4859-e4b7-21c5453ac1f4","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"f3c84053-b5ff-423f-b2b5-af690b7199b0","insertInstant":1717227095167,"jwtConfiguration":{"accessTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","enabled":true,"idTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1717227206748,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"tms","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"f3c84053-b5ff-423f-b2b5-af690b7199b0","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":true,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[{"id":"da315d84-6988-475a-a9b6-51cc3e3eca90","insertInstant":1717227155896,"isDefault":false,"isSuperRole":true,"lastUpdateInstant":1717227155896,"name":"admin"},{"id":"0f477b01-f0e9-4bb1-b54b-218615e7ccbd","insertInstant":1717227148696,"isDefault":true,"isSuperRole":false,"lastUpdateInstant":1717227148696,"name":"user"}],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"66596267-5933-e0aa-b3bc-8ac0344bed03","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"oldValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"e04a6b91-ec4d-4859-e4b7-21c5453ac1f4","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"f3c84053-b5ff-423f-b2b5-af690b7199b0","insertInstant":1717227095167,"jwtConfiguration":{"accessTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","enabled":true,"idTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1717227192831,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"tms","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"f3c84053-b5ff-423f-b2b5-af690b7199b0","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[{"id":"da315d84-6988-475a-a9b6-51cc3e3eca90","insertInstant":1717227155896,"isDefault":false,"isSuperRole":true,"lastUpdateInstant":1717227155896,"name":"admin"},{"id":"0f477b01-f0e9-4bb1-b54b-218615e7ccbd","insertInstant":1717227148696,"isDefault":true,"isSuperRole":false,"lastUpdateInstant":1717227148696,"name":"user"}],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"66596267-5933-e0aa-b3bc-8ac0344bed03","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"reason":"FusionAuth User Interface"}
10	1717227362430	pubappadm@outlook.com	Updated the system configuration	{"data":{},"newValue":{"auditLogConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"corsConfiguration":{"allowCredentials":false,"allowedHeaders":["Accept","Access-Control-Request-Headers","Access-Control-Request-Method","Authorization","Content-Type","Last-Modified","Origin","X-FusionAuth-TenantId","X-Requested-With"],"allowedMethods":["POST","DELETE","GET","PATCH","HEAD","OPTIONS","PUT"],"allowedOrigins":["http://localhost:8080"],"debug":false,"enabled":true,"exposedHeaders":["Access-Control-Allow-Origin","Access-Control-Allow-Credentials"],"preflightMaxAgeInSeconds":1800},"data":{},"eventLogConfiguration":{"numberToRetain":10000},"insertInstant":1717226992187,"lastUpdateInstant":1717227362368,"loginRecordConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"reportTimezone":"America/Denver","trustedProxyConfiguration":{"trustPolicy":"All","trusted":[]},"uiConfiguration":{}},"oldValue":{"auditLogConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"corsConfiguration":{"allowCredentials":false,"allowedHeaders":[],"allowedMethods":[],"allowedOrigins":[],"debug":false,"enabled":false,"exposedHeaders":[],"preflightMaxAgeInSeconds":0},"data":{},"eventLogConfiguration":{"numberToRetain":10000},"insertInstant":1717226992187,"lastUpdateInstant":1717226992187,"loginRecordConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"reportTimezone":"America/Denver","trustedProxyConfiguration":{"trustPolicy":"All","trusted":[]},"uiConfiguration":{}},"reason":"FusionAuth User Interface"}
11	1717227419409	pubappadm@outlook.com	Created the identity provider with Id [82339786-3dff-42a6-aac6-1f1ceecb6c46] and name [null]	{"data":{},"reason":"FusionAuth User Interface"}
12	1717227649343	pubappadm@outlook.com	Updated the application with Id [f3c84053-b5ff-423f-b2b5-af690b7199b0] and name [tms]	{"data":{},"newValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"e04a6b91-ec4d-4859-e4b7-21c5453ac1f4","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"f3c84053-b5ff-423f-b2b5-af690b7199b0","insertInstant":1717227095167,"jwtConfiguration":{"accessTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","enabled":true,"idTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1717227649290,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"tms","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":["http://localhost:8080/swagger-ui/oauth2-redirect.html"],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"NotRequired","clientId":"f3c84053-b5ff-423f-b2b5-af690b7199b0","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":false,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":true,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[{"id":"da315d84-6988-475a-a9b6-51cc3e3eca90","insertInstant":1717227155896,"isDefault":false,"isSuperRole":true,"lastUpdateInstant":1717227155896,"name":"admin"},{"id":"0f477b01-f0e9-4bb1-b54b-218615e7ccbd","insertInstant":1717227148696,"isDefault":true,"isSuperRole":false,"lastUpdateInstant":1717227148696,"name":"user"}],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"66596267-5933-e0aa-b3bc-8ac0344bed03","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"oldValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"e04a6b91-ec4d-4859-e4b7-21c5453ac1f4","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"f3c84053-b5ff-423f-b2b5-af690b7199b0","insertInstant":1717227095167,"jwtConfiguration":{"accessTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","enabled":true,"idTokenKeyId":"585eb9ca-4621-4040-8725-9ecc0ccce336","refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1717227206748,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"tms","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"f3c84053-b5ff-423f-b2b5-af690b7199b0","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":true,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[{"id":"da315d84-6988-475a-a9b6-51cc3e3eca90","insertInstant":1717227155896,"isDefault":false,"isSuperRole":true,"lastUpdateInstant":1717227155896,"name":"admin"},{"id":"0f477b01-f0e9-4bb1-b54b-218615e7ccbd","insertInstant":1717227148696,"isDefault":true,"isSuperRole":false,"lastUpdateInstant":1717227148696,"name":"user"}],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"66596267-5933-e0aa-b3bc-8ac0344bed03","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"reason":"FusionAuth User Interface"}
\.


--
-- Data for Name: authentication_keys; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.authentication_keys (id, insert_instant, ip_access_control_lists_id, last_update_instant, key_manager, key_value, permissions, meta_data, tenants_id) FROM stdin;
8dc48fe9-6d4a-d116-0853-2fee7c97c07d	1717226992187	\N	1717226992187	f	__internal_NzU4Nzk5ZTM2YzI4ZGMwOGFmMzRmNzI2ZTg1ODBjYmNiMTUzMzAwODBhYjgzZGJiOTMwNTY5Y2JjYWNhNmQwNA==	{"endpoints": {"/api/cache/reload": ["POST"], "/api/system/log/export": ["POST"], "/internal/webhook": ["POST"]}}	{"attributes": {"description": "Internal Use Only.", "internalCacheReloader": "true", "internalLogDownloader": "true", "internalWebhook": "true"}}	\N
3d65b476-0ebb-4893-92c8-241a9d259358	1717227109960	\N	1717227109960	f	Hjd_wU5w_Kh4CfzFoEWTNB-YJoMqGJoO_x0kbpKy8M2T4Y6UGEuRn0MW	\N	{"attributes":{"description":"Created by the first time setup wizard."}}	\N
\.


--
-- Data for Name: breached_password_metrics; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.breached_password_metrics (tenants_id, matched_exact_count, matched_sub_address_count, matched_common_password_count, matched_password_count, passwords_checked_count) FROM stdin;
\.


--
-- Data for Name: clean_speak_applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.clean_speak_applications (applications_id, clean_speak_application_id) FROM stdin;
\.


--
-- Data for Name: common_breached_passwords; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.common_breached_passwords (password) FROM stdin;
\.


--
-- Data for Name: connectors; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.connectors (id, data, insert_instant, last_update_instant, name, reconcile_lambdas_id, ssl_certificate_keys_id, type) FROM stdin;
e3306678-a53a-4964-9040-1c96f36dda72	{}	1717226992187	1717226992187	Default	\N	\N	0
\.


--
-- Data for Name: connectors_tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.connectors_tenants (connectors_id, data, sequence, tenants_id) FROM stdin;
e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"domains":["*"],"migrate":false}	0	66596267-5933-e0aa-b3bc-8ac0344bed03
e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"domains":["*"],"migrate":false}	0	7fb233aa-b21c-4e9d-84cd-5567df65caf1
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.consents (id, consent_email_templates_id, data, insert_instant, last_update_instant, name, email_plus_email_templates_id) FROM stdin;
54d9cd88-2a8d-4e9f-8159-1bf590bf570a	\N	{"countryMinimumAgeForSelfConsent":{},"data":{},"defaultMinimumAgeForSelfConsent":13,"emailPlus":{"enabled":true,"maximumTimeToSendEmailInHours":48,"minimumTimeToSendEmailInHours":24},"multipleValuesAllowed":false,"values":[]}	1717227077902	1717227077902	COPPA Email+	\N
f799d4b7-5b99-4a1b-a731-62e866cefc78	\N	{"countryMinimumAgeForSelfConsent":{},"data":{},"defaultMinimumAgeForSelfConsent":13,"emailPlus":{"enabled":false,"maximumTimeToSendEmailInHours":48,"minimumTimeToSendEmailInHours":24},"multipleValuesAllowed":false,"values":[]}	1717227077908	1717227077908	COPPA VPC	\N
\.


--
-- Data for Name: data_sets; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.data_sets (name, last_update_instant) FROM stdin;
BreachPasswords	1581476456155
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.email_templates (id, default_from_name, default_html_template, default_subject, default_text_template, from_email, insert_instant, last_update_instant, localized_from_names, localized_html_templates, localized_subjects, localized_text_templates, name) FROM stdin;
d6b4eefd-34f2-4db2-8e77-3ec9056b6688	\N	<p>\n The following two factor method was added to ${user.email}:\n\n  <br>\n  <strong>Method: ${method.method}</strong>\n  <br>\n  <strong>Identifier: ${method.id}</strong>\n\n</p>\n\n- FusionAuth Admin	A second factor was added	The following two factor method was added to ${user.email}:\n\n- Method: ${method.method}\n- Identifier: ${method.id}\n\n- FusionAuth Admin	\N	1717226996317	1717226996317	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication Method Added
c2716a4d-0a15-421a-9618-f1069fbae940	\N	<p>\n The following two factor method was removed from ${user.email}:\n\n  <br>\n  <strong>Method: ${method.method}</strong>\n  <br>\n  <strong>Identifier: ${method.id}</strong>\n\n</p>\n\n- FusionAuth Admin	A second factor was removed	The following two factor method was removed from ${user.email}:\n\n- Method: ${method.method}\n- Identifier: ${method.id}\n\n- FusionAuth Admin	\N	1717226996324	1717226996324	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication Method Removed
e2b83296-e0a2-4a4c-ac91-ddac56214499	\N	[#-- @ftlvariable name="event" type="io.fusionauth.domain.event.UserLoginSuspiciousEvent" --]\n[#setting url_escaping_charset="UTF-8"]\n[#if event.type == "UserLoginSuspicious"]\n  <p>A suspicious login was made on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.</p>\n[#elseif event.type == "UserLoginNewDevice"]\n  <p>A login from a new device was detected on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.</p>\n[#else]\n  <p>Suspicious activity has been observed on your account. In order to secure your account, it is recommended to change your password at your earliest convenience.</p>\n[/#if]\n\n<p>Device details</p>\n<ul>\n  <li><strong>Device name:</strong> ${(event.info.deviceName)!'&mdash;'}</li>\n  <li><strong>Device description:</strong> ${(event.info.deviceDescription)!'&mdash;'}</li>\n  <li><strong>Device type:</strong> ${(event.info.deviceType)!'&mdash;'}</li>\n  <li><strong>User agent:</strong> ${(event.info.userAgent)!'&mdash;'}</li>\n</ul>\n\n<p>Event details</p>\n<ul>\n  <li><strong>IP address:</strong> ${(event.info.ipAddress)!'&mdash;'}</li>\n  <li><strong>City:</strong> ${(event.info.location.city)!'&mdash;'}</li>\n  <li><strong>Country:</strong> ${(event.info.location.country)!'&mdash;'}</li>\n  <li><strong>Zipcode:</strong> ${(event.info.location.zipcode)!'&mdash;'}</li>\n  <li><strong>Lat/long:</strong> ${(event.info.location.latitude)!'&mdash;'}/${(event.info.location.longitude)!'&mdash;'}</li>\n</ul>\n\n- FusionAuth Admin\n	Threat Detected	[#setting url_escaping_charset="UTF-8"]\n[#if event.type == "UserLoginSuspicious"]\nA suspicious login was made on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.\n[#elseif event.type == "UserLoginNewDevice"]\nA login from a new device was detected on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.\n[#else]\nSuspicious activity has been observed on your account. In order to secure your account, it is recommended to change your password at your earliest convenience.\n[/#if]\n\nDevice details\n\n* Device name: ${(event.info.deviceName)!'&mdash;'}\n* Device description: ${(event.info.deviceDescription)!'&mdash;'}\n* Device type: ${(event.info.deviceType)!'&mdash;'}\n* User agent: ${(event.info.userAgent)!'&mdash;'}\n\nEvent details\n\n* IP address: ${(event.info.ipAddress)!'-'}\n* City: ${(event.info.location.city)!'-'}\n* Country: ${(event.info.location.country)!'-'}\n* Zipcode: ${(event.info.location.zipcode)!'-'}\n* Lat/long: ${(event.info.location.latitude)!'-'}/${(event.info.location.longitude)!'-'}\n\n- FusionAuth Admin\n	\N	1717227077179	1717227077179	{}	{}	{}	{}	[FusionAuth Default] Threat Detected
90ab8419-43f8-4003-a272-9797ad3ae449	\N	[#setting url_escaping_charset="UTF-8"]\n<p>This password was found in the list of vulnerable passwords, and is no longer secure.</p>\n\n<p>In order to secure your account, it is recommended to change your password at your earliest convenience.</p>\n\n<p>Follow this link to change your password.</p>\n\n<a href="http://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}">\n  http://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}\n</a>\n\n- FusionAuth Admin	Your password is not secure	[#setting url_escaping_charset="UTF-8"]\nThis password was found in the list of vulnerable passwords, and is no longer secure.\n\nIn order to secure your account, it is recommended to change your password at your earliest convenience.\n\nFollow this link to change your password.\n\nhttp://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}\n\n- FusionAuth Admin\n\n\n	\N	1717227077181	1717227077181	{}	{}	{}	{}	[FusionAuth Default] Breached Password Notification
173e61a0-d068-406c-b35f-10a3e63b130c	\N	[#setting url_escaping_charset="UTF-8"]\nTo change your password click on the following link.\n<p>\n  [#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state'.\n       If we have an application context, append the client_id to ensure the correct application theme when applicable.\n  --]\n  [#assign url = "http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}" /]\n  [#list state!{} as key, value][#if key != "tenantId" && key != "client_id" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n  <a href="${url}">${url}</a>\n</p>\n- FusionAuth Admin\n	Reset your password	[#setting url_escaping_charset="UTF-8"]\nTo change your password click on the following link.\n\n  [#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state'.\n       If we have an application context, append the client_id to ensure the correct application theme when applicable.\n  --]\n[#assign url = "http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}" /]\n[#list state!{} as key, value][#if key != "tenantId" && key != "client_id" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n\n${url}\n\n- FusionAuth Admin\n	\N	1717227077183	1717227077183	{}	{}	{}	{}	[FusionAuth Default] Forgot Password
3fbed156-bb61-4525-9db2-f66da8c15164	\N	Your child has created an account with us and you need to confirm them before they are added to your family. Click the link below to confirm your child's account.\n<p>\n  <a href="http://example.com/family/confirm-child">http://example.com/family/confirm-child</a>\n</p>\n- FusionAuth Admin	Confirm your child's account	Your child has created an account with us and you need to confirm them before they are added to your family. Click the link below to confirm your child's account.\n\nhttp://example.com/family/confirm-child\n\n- FusionAuth Admin	\N	1717227077186	1717227077186	{}	{}	{}	{}	[FusionAuth Default] Confirm Child Account
3a2738b8-7e63-456c-8b56-f8006e4dafaf	\N	A while ago, you granted your child consent in our system. This email is a second notice of this consent as required by law and also to remind to that you can revoke this consent at anytime on our website or by clicking the link below:\n<p>\n  <a href="http://example.com/consent/manage">http://example.com/consent/manage</a>\n</p>\n- FusionAuth Admin	Reminder: Notice of your consent	A while ago, you granted your child consent in our system. This email is a second notice of this consent as required by law and also to remind to that you can revoke this consent at anytime on our website or by clicking the link below:\n\nhttp://example.com/consent/manage\n\n- FusionAuth Admin	\N	1717227077187	1717227077187	{}	{}	{}	{}	[FusionAuth Default] COPPA Notice Reminder
67833e60-2ce2-47bf-97aa-0e1278c815f9	\N	You recently granted your child consent in our system. This email is to notify you of this consent. If you did not grant this consent or wish to revoke this consent, click the link below:\n<p>\n  <a href="http://example.com/consent/manage">http://example.com/consent/manage</a>\n</p>\n- FusionAuth Admin	Notice of your consent	You recently granted your child consent in our system. This email is to notify you of this consent. If you did not grant this consent or wish to revoke this consent, click the link below:\n\nhttp://example.com/consent/manage\n\n- FusionAuth Admin	\N	1717227077189	1717227077189	{}	{}	{}	{}	[FusionAuth Default] COPPA Notice
89a4cc0f-8740-45bb-81f8-000044ca1209	\N	[#if user.verified]\nPro tip, your email has already been verified, but feel free to complete the verification process to verify your verification of your email address.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the email address can be verified --]\n[#if verificationOneTimeCode??]\n<p>To complete your email verification enter this code into the email verification form.</p>\n<p> ${verificationOneTimeCode} </p>\n[#else]\nTo complete your email verification click on the following link.\n<p>\n  <a href="http://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}">\n    http://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n  </a>\n</p>\n[/#if]\n\n- FusionAuth Admin\n	Verify your FusionAuth email address	[#if user.verified]\nPro tip, your email has already been verified, but feel free to complete the verification process to verify your verification of your email address.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the email address can be verified --]\n[#if verificationOneTimeCode??]\nTo complete your email verification enter this code into the email verification form.\n\n${verificationOneTimeCode}\n[#else]\nTo complete your email verification click on the following link.\n\nhttp://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n[/#if]\n\n- FusionAuth Admin\n	\N	1717227077190	1717227077190	{}	{}	{}	{}	[FusionAuth Default] Email Verification
e814e0a5-93bc-4056-9237-6e3b2783cd83	\N	Your child has created an account with us and needs you to create an account and verify them. You can sign up using the link below:\n<p>\n  <a href="http://example.com/family/confirm-child">http://example.com/family/confirm-child</a>\n</p>\n- FusionAuth Admin	Create your parental account	Your child has created an account with us and needs you to create an account and verify them. You can sign up using the link below:\n\nhttp://example.com/family/confirm-child\n\n- FusionAuth Admin	\N	1717227077191	1717227077191	{}	{}	{}	{}	[FusionAuth Default] Parent Registration
97b649d3-1667-4a3c-9d1f-a26a0c5f5bd0	\N	[#setting url_escaping_charset="UTF-8"]\nYou have requested to log into FusionAuth using this email address. If you do not recognize this request please ignore this email.\n<p>\n  [#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\n  [#assign url = "http://localhost:9011/oauth2/passwordless/${code}?tenantId=${user.tenantId}" /]\n  [#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n  <a href="${url}">${url}</a>\n</p>\n- FusionAuth Admin\n	Log into FusionAuth	[#setting url_escaping_charset="UTF-8"]\nYou have requested to log into FusionAuth using this email address. If you do not recognize this request please ignore this email.\n\n[#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\n[#assign url = "http://localhost:9011/oauth2/passwordless/${code}?tenantId=${user.tenantId}" /]\n[#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n\n${url}\n\n- FusionAuth Admin\n	\N	1717227077193	1717227077193	{}	{}	{}	{}	[FusionAuth Default] Passwordless Login
8675d320-9c24-488f-9d2f-f1bb62c17b60	\N	[#if registration.verified]\nPro tip, your registration has already been verified, but feel free to complete the verification process to verify your verification of your registration.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the registration can be verified --]\n[#if verificationOneTimeCode??]\n<p>To complete your registration verification enter this code into the registration verification form.</p>\n<p> ${verificationOneTimeCode} </p>\n[#else]\nTo complete your registration verification click on the following link.\n<p>\n  <a href="http://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}">\n    http://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n  </a>\n</p>\n[/#if]\n\n- FusionAuth Admin\n	Verify your registration	[#if registration.verified]\nPro tip, your registration has already been verified, but feel free to complete the verification process to verify your verification of your registration.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the registration can be verified --]\n[#if verificationOneTimeCode??]\nTo complete your registration verification enter this code into the registration verification form.\n\n${verificationOneTimeCode}\n[#else]\nTo complete your registration verification click on the following link.\n\nhttp://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n[/#if]\n\n- FusionAuth Admin\n	\N	1717227077194	1717227077194	{}	{}	{}	{}	[FusionAuth Default] Registration Verification
ee026357-7611-4a95-b140-1a55951ebec6	\N	Your account has been created and you must setup a password. Click on the following link to setup your password.\n<p>\n  <a href="http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}">\n    http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n  </a>\n</p>\n- FusionAuth Admin	Setup your password	Your account has been created and you must setup a password. Click on the following link to setup your password.\n\nhttp://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n\n- FusionAuth Admin	\N	1717227077195	1717227077195	{}	{}	{}	{}	[FusionAuth Default] Setup Password
22b8fc9c-f7f9-42b7-999d-a9f3b6d7b743	\N	<p>\n  To complete your login request, enter this one-time code code on the login form when prompted.\n</p>\n<p>\n  <strong>${code}</strong>\n</p>\n\n- FusionAuth Admin	Your second factor code	To complete your login request, enter this one-time code code on the login form when prompted.\n\n${code}\n\n- FusionAuth Admin	\N	1717227077196	1717227077196	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication
\.


--
-- Data for Name: entities; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.entities (id, client_id, client_secret, data, entity_types_id, insert_instant, last_update_instant, name, parent_id, tenants_id) FROM stdin;
\.


--
-- Data for Name: entity_entity_grant_permissions; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.entity_entity_grant_permissions (entity_entity_grants_id, entity_type_permissions_id) FROM stdin;
\.


--
-- Data for Name: entity_entity_grants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.entity_entity_grants (id, data, insert_instant, last_update_instant, recipient_id, target_id) FROM stdin;
\.


--
-- Data for Name: entity_type_permissions; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.entity_type_permissions (id, data, description, entity_types_id, insert_instant, is_default, last_update_instant, name) FROM stdin;
3396b4cb-6125-4925-accc-0f812c899511	{"data":{}}	Create SCIM User	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077161	f	1717227077161	scim:user:create
cf625894-af57-4bbd-9dd5-89ac40443960	{"data":{}}	Read SCIM User	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077163	f	1717227077163	scim:user:read
5a4757b6-50fa-4986-8691-697d2fa90469	{"data":{}}	Update SCIM User	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077164	f	1717227077164	scim:user:update
13cfa60a-c563-4d8a-967d-c2bf3f20528a	{"data":{}}	Delete SCIM User	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077165	f	1717227077165	scim:user:delete
8ca64559-b555-4134-bdd1-b0452a122a6c	{"data":{}}	Create SCIM Enterprise User	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077165	f	1717227077165	scim:enterprise:user:create
44bf8237-b2fe-452e-8dad-96ffb2091a77	{"data":{}}	Read SCIM Enterprise User	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077166	f	1717227077166	scim:enterprise:user:read
f79ea485-1315-42e6-a08d-23be7582f0fe	{"data":{}}	Update SCIM Enterprise User	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077167	f	1717227077167	scim:enterprise:user:update
a5d368eb-1f19-4387-8909-1b1142ffa870	{"data":{}}	Delete SCIM Enterprise User	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077168	f	1717227077168	scim:enterprise:user:delete
7fce1b5d-c3e9-416e-9c12-d7e2483a258c	{"data":{}}	Create SCIM Group	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077169	f	1717227077169	scim:group:create
fc42f9c7-2a1a-4cd0-8bb2-463df383c9a7	{"data":{}}	Read SCIM Group	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077170	f	1717227077170	scim:group:read
673d4a94-6330-445c-8d43-bd5d8bf93f70	{"data":{}}	Update SCIM Group	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077171	f	1717227077171	scim:group:update
9bc37bb6-4887-4481-9264-f47515e75800	{"data":{}}	Delete SCIM Group	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077171	f	1717227077171	scim:group:delete
b995ec44-0b0c-4cb4-a402-dc984a81b754	{"data":{}}	Read SCIM Resource Types	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077172	f	1717227077172	scim:resource-types:read
45794f94-6858-42ef-aa08-7d0f4f7f3b10	{"data":{}}	Read SCIM Schemas	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077173	f	1717227077173	scim:schemas:read
628f0df0-1d07-4523-ab4d-adee39b27431	{"data":{}}	Read SCIM Service Provider Configuration	705bb0c7-6fef-432d-ad3c-7ac997d52d5d	1717227077173	f	1717227077173	scim:service-provider-config:read
\.


--
-- Data for Name: entity_types; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.entity_types (id, access_token_signing_keys_id, data, insert_instant, last_update_instant, name) FROM stdin;
705bb0c7-6fef-432d-ad3c-7ac997d52d5d	\N	{"data":{},"jwtConfiguration":{"enabled":false,"timeToLiveInSeconds":0}}	1717227077159	1717227077159	[FusionAuth Default] SCIM Server
4e0c6123-4576-4a8f-81e0-4bc97ecc2ef5	\N	{"data":{},"jwtConfiguration":{"enabled":false,"timeToLiveInSeconds":0}}	1717227077174	1717227077174	[FusionAuth Default] SCIM Client
\.


--
-- Data for Name: entity_user_grant_permissions; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.entity_user_grant_permissions (entity_user_grants_id, entity_type_permissions_id) FROM stdin;
\.


--
-- Data for Name: entity_user_grants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.entity_user_grants (id, data, entities_id, insert_instant, last_update_instant, users_id) FROM stdin;
\.


--
-- Data for Name: event_logs; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.event_logs (id, insert_instant, message, type) FROM stdin;
\.


--
-- Data for Name: external_identifiers; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.external_identifiers (id, applications_id, data, expiration_instant, insert_instant, tenants_id, type, users_id) FROM stdin;
\.


--
-- Data for Name: families; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.families (data, family_id, insert_instant, last_update_instant, owner, role, users_id) FROM stdin;
\.


--
-- Data for Name: federated_domains; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.federated_domains (identity_providers_id, domain) FROM stdin;
\.


--
-- Data for Name: form_fields; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.form_fields (id, consents_id, data, insert_instant, last_update_instant, name) FROM stdin;
fcf8fcba-456f-e68f-eb95-6c8a80e327d0	\N	{"key": "user.email", "control": "text", "required": true, "type": "email", "data": {"leftAddon": "user"}}	1717226992187	1717226992187	Email
5911df47-6f63-49e2-2d1e-b067969d1a15	\N	{"key": "user.password", "control": "password", "required": true, "type": "string", "data": {"leftAddon": "lock"}}	1717226992187	1717226992187	Password
469c5fc3-6844-351e-c683-16aace90a3a9	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	First name
8bdaebe7-85a4-9542-4d7f-41d84596d51d	\N	{"key": "user.middleName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	Middle name
caaf04ba-8237-7422-76d8-99f0abf841df	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	Last name
0870be1c-0027-a8e4-dfbb-93346f9b9454	\N	{"key": "user.fullName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	Full name
a27eb7fe-94dc-193c-884f-39b804f62d05	\N	{"key": "user.birthDate", "control": "text", "required": false, "type": "date", "data": {"leftAddon": "calendar"}}	1717226992187	1717226992187	Birthdate
d36c37fd-e15f-380a-8760-db22028567b0	\N	{"key": "user.mobilePhone", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "mobile"}}	1717226992187	1717226992187	Mobile phone
171c1487-85a7-da6d-8806-b0c3289474dd	\N	{"key": "user.username", "control": "text", "required": true, "type": "string", "data": {"leftAddon": "user"}}	1717226992187	1717226992187	Username
a2161c1b-3d31-3931-2b9e-6c6a5d05bf72	\N	{"key": "user.parentEmail", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1717226992187	1717226992187	[Registration] parent email
7d282199-d348-7326-aaad-3a863800ad69	\N	{"key": "registration.preferredLanguages", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin Registration] preferred languages
cfda3bf6-4878-d5f4-5743-0bcce6af7c12	\N	{"key": "registration.roles", "control": "checkbox", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin Registration] roles
34d1fa88-57a9-7aeb-9ec2-7115c7311d0c	\N	{"key": "registration.timezone", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin Registration] timezone
99796039-2854-66a0-de71-529769e33b4d	\N	{"key": "registration.username", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "user"}}	1717226992187	1717226992187	[Admin Registration] username
6aeeba26-0582-2122-5d77-9c6d8a315eb0	\N	{"key": "user.birthDate", "control": "text", "required": false, "type": "date", "data": {"leftAddon": "calendar"}}	1717226992187	1717226992187	[Admin User] birthdate
35a0a6c8-57f9-e82d-a1a7-1cf9d9609ecf	\N	{"key": "user.email", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1717226992187	1717226992187	[Admin User] email
5cdfa745-a0cd-f4df-f53a-00901b1abefa	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin User] first name
91501982-33c6-1ffe-3852-4fab38d20d3c	\N	{"key": "user.fullName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin User] full name
597202c0-f82a-abc5-fe25-d1fb383ccf61	\N	{"key": "user.imageUrl", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin User] image URL
c40cdaaf-d092-8b1e-cb9d-49df0b4c5d86	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin User] last name
818e0850-ed45-318e-442b-72abee48d45b	\N	{"key": "user.middleName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin User] middle name
d32f970c-001a-ab9c-751d-4c06ab1f7469	\N	{"key": "user.mobilePhone", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "mobile"}}	1717226992187	1717226992187	[Admin User] mobile phone
3f29675d-d432-9819-e42a-62cb73145a0b	\N	{"key": "user.password", "control": "password", "required": true, "confirm": true, "type": "string", "data": {"leftAddon": "lock"}}	1717226992187	1717226992187	[Admin User] password
0a714409-ef8f-c192-7ecc-213e35da79fe	\N	{"key": "user.preferredLanguages", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin User] preferred languages
ee084b42-4a91-6a2c-65c5-3e28ab2eb301	\N	{"key": "user.timezone", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Admin User] timezone
daf9665a-fb0a-3fe2-97e2-cb604d7f61dd	\N	{"key": "user.username", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "user"}}	1717226992187	1717226992187	[Admin User] username
1778fac2-0e46-f8cc-d8be-6d39b30bf497	\N	{"key": "user.email", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1717226992187	1717226992187	[Self Service User] email
8e8cecb8-4152-abb5-0a91-f0eb966bc2bc	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Self Service User] first name
eed15423-162a-c4ce-a0eb-82c174fa6cf7	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1717226992187	1717226992187	[Self Service User] last name
b938ea38-8439-6e59-a314-8acc50a8383c	\N	{"key": "user.password", "control": "password", "required": true, "confirm": true, "type": "string", "data": {"leftAddon": "lock"}}	1717226992187	1717226992187	[Self Service User] password
\.


--
-- Data for Name: form_steps; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.form_steps (form_fields_id, forms_id, sequence, step) FROM stdin;
99796039-2854-66a0-de71-529769e33b4d	e04a6b91-ec4d-4859-e4b7-21c5453ac1f4	0	0
7d282199-d348-7326-aaad-3a863800ad69	e04a6b91-ec4d-4859-e4b7-21c5453ac1f4	1	0
34d1fa88-57a9-7aeb-9ec2-7115c7311d0c	e04a6b91-ec4d-4859-e4b7-21c5453ac1f4	2	0
cfda3bf6-4878-d5f4-5743-0bcce6af7c12	e04a6b91-ec4d-4859-e4b7-21c5453ac1f4	3	0
35a0a6c8-57f9-e82d-a1a7-1cf9d9609ecf	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	0	0
daf9665a-fb0a-3fe2-97e2-cb604d7f61dd	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	1	0
d32f970c-001a-ab9c-751d-4c06ab1f7469	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	2	0
3f29675d-d432-9819-e42a-62cb73145a0b	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	3	0
6aeeba26-0582-2122-5d77-9c6d8a315eb0	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	0	1
5cdfa745-a0cd-f4df-f53a-00901b1abefa	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	1	1
818e0850-ed45-318e-442b-72abee48d45b	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	2	1
c40cdaaf-d092-8b1e-cb9d-49df0b4c5d86	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	3	1
91501982-33c6-1ffe-3852-4fab38d20d3c	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	4	1
0a714409-ef8f-c192-7ecc-213e35da79fe	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	5	1
ee084b42-4a91-6a2c-65c5-3e28ab2eb301	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	6	1
597202c0-f82a-abc5-fe25-d1fb383ccf61	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	7	1
1778fac2-0e46-f8cc-d8be-6d39b30bf497	3b6d0ab2-2411-9f88-523a-d7467de63b58	0	0
8e8cecb8-4152-abb5-0a91-f0eb966bc2bc	3b6d0ab2-2411-9f88-523a-d7467de63b58	1	0
eed15423-162a-c4ce-a0eb-82c174fa6cf7	3b6d0ab2-2411-9f88-523a-d7467de63b58	2	0
b938ea38-8439-6e59-a314-8acc50a8383c	3b6d0ab2-2411-9f88-523a-d7467de63b58	3	0
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.forms (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
e04a6b91-ec4d-4859-e4b7-21c5453ac1f4	\N	1717226989187	1717226989187	Default Admin Registration provided by FusionAuth	1
abc2df79-bb94-e8a5-cd38-7db67c28d5ef	\N	1717226990187	1717226990187	Default Admin User provided by FusionAuth	2
3b6d0ab2-2411-9f88-523a-d7467de63b58	\N	1717226991187	1717226991187	Default User Self Service provided by FusionAuth	3
\.


--
-- Data for Name: global_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_daily_active_users (count, day) FROM stdin;
3	19875
\.


--
-- Data for Name: global_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_monthly_active_users (count, month) FROM stdin;
3	653
\.


--
-- Data for Name: global_registration_counts; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_registration_counts (count, decremented_count, hour) FROM stdin;
3	0	477007
\.


--
-- Data for Name: group_application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.group_application_roles (application_roles_id, groups_id) FROM stdin;
\.


--
-- Data for Name: group_members; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.group_members (id, groups_id, data, insert_instant, users_id) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.groups (id, data, insert_instant, last_update_instant, name, tenants_id) FROM stdin;
\.


--
-- Data for Name: hourly_logins; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.hourly_logins (applications_id, count, data, hour) FROM stdin;
f3c84053-b5ff-423f-b2b5-af690b7199b0	2	\N	477007
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identities (id, breached_password_last_checked_instant, breached_password_status, connectors_id, email, encryption_scheme, factor, insert_instant, last_login_instant, last_update_instant, password, password_change_reason, password_change_required, password_last_update_instant, salt, status, tenants_id, username, username_index, username_status, users_id, verified, verified_instant) FROM stdin;
1	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	pubappadm@outlook.com	salted-pbkdf2-hmac-sha256	24000	1717227077082	\N	1717227077082	UgYqzsxHHSbijwOMdcVgij/nHP6cl3y++x4Fjr+EirU=	\N	f	1717227077120	kxIG015YWpwvotyEklBHc572/ZMomlFvHAb9Fp44SoY=	0	66596267-5933-e0aa-b3bc-8ac0344bed03	\N	\N	0	60718eb9-85d7-4898-9061-53a9c95d38ac	t	1717227077082
2	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	karen.torosyan@outlook.com	salted-pbkdf2-hmac-sha256	24000	1717227678021	1717227678047	1717227678021	yqX6pz0luUodxEbMtL5sCETwdRi+5VfoXiyx7+/AMTs=	\N	f	1717227678043	j9gSOyyPzfTow+x9FW9IIqEpWSFLcuiJO5qUfBxaT0g=	0	66596267-5933-e0aa-b3bc-8ac0344bed03	\N	\N	0	9d66de7c-6420-43c5-97b6-92814b9dcd40	t	1717227678021
3	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	karen273.20@gmail.com	salted-pbkdf2-hmac-sha256	24000	1717227702987	1717227702987	1717227702987	4XgL3G6RtvrpaG/CSS4dKJ7w6LjlZaQa8VtqiDtpNwg=	\N	f	1717227703010	vbfY1EkHA6dKEW2KWClPbJqvbpJVj106JF4Rs2ktTNo=	0	66596267-5933-e0aa-b3bc-8ac0344bed03	\N	\N	0	860733b0-dc91-43be-b5f1-05a65d7035c9	t	1717227702987
\.


--
-- Data for Name: identity_provider_links; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_provider_links (data, identity_providers_id, identity_providers_user_id, insert_instant, last_login_instant, tenants_id, users_id) FROM stdin;
{"data":{},"displayName":"karen273.20@gmail.com","token":"eyJhbGciOiJSUzI1NiIsImtpZCI6IjY3MTk2NzgzNTFhNWZhZWRjMmU3MDI3NGJiZWE2MmRhMmE4YzRhMTIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI5NjQ0OTMyMTg1MTEtaDlxMWFsZzg5cDhxYnFsOWo5Zzk2YnBkb24zZ3IzNzUuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5NjQ0OTMyMTg1MTEtaDlxMWFsZzg5cDhxYnFsOWo5Zzk2YnBkb24zZ3IzNzUuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIyMzQzNjE4MjU0MjUwMzE5NTUiLCJlbWFpbCI6ImthcmVuMjczLjIwQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiSWZkM2ZEMkN3cTNrbEltdWtrbXhCUSIsIm5hbWUiOiJLYXJlbiBUb3Jvc3lhbiIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NLRWxnUUJIS2gzQloxQS15NzkxNkEzWVVjMHJITlAzaVBwVUNyS0p3TmVtNDREQTBrPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IkthcmVuIiwiZmFtaWx5X25hbWUiOiJUb3Jvc3lhbiIsImlhdCI6MTcxNzIyNzcwMiwiZXhwIjoxNzE3MjMxMzAyfQ.hCDHqFQh0i4q0QIthvzFc42GZxF_L69GmT2GcN6takM59Kbwecc8abXXj0g51kvhmgrQ_sdjHy-U1VkUQ06D_LGDjbz9fGpOm05lQk6KPcqvDkos8V2NPCoR-SN3kbV0jiAXtufODAzws3jjxaRi825lusoTI41Vq1s6XzdjZ_cUwOykOl5Uvat17wvQPKQJe78ekjoXkFnqhBrMEI7Mp_7yOL-ay_obCH6UF2wU3a_G0RPNWoO0HICXEULz2nAnCe5ucteuaKWh4p6R4QozlkOdmDVpuSTDzu3sBtMLuqSOabXjavWHJ9bn3GCmHrZHroyyvNo-cd6Kcz950djJ_g"}	82339786-3dff-42a6-aac6-1f1ceecb6c46	112234361825425031955	1717227703027	1717227703027	66596267-5933-e0aa-b3bc-8ac0344bed03	860733b0-dc91-43be-b5f1-05a65d7035c9
\.


--
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_providers (id, data, enabled, insert_instant, last_update_instant, name, type, keys_id, request_signing_keys_id, reconcile_lambdas_id) FROM stdin;
82339786-3dff-42a6-aac6-1f1ceecb6c46	{"buttonText":"Login with Google","client_id":"964493218511-h9q1alg89p8qbql9j9g96bpdon3gr375.apps.googleusercontent.com","client_secret":"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","data":{},"debug":false,"linkingStrategy":"LinkByEmail","loginMethod":"UseRedirect","properties":{"api":"# Omit the data- prefix\\nauto_prompt=true\\nauto_select=false\\ncancel_on_tap_outside=false\\ncontext=signin\\nitp_support=true","button":"# Omit the data- prefix\\nlogo_alignment=left\\nshape=rectangular\\nsize=large\\ntext=signin_with\\ntheme=outline\\ntype=standard"},"scope":"openid profile email"}	t	1717227419337	1717227419337	Google	Google	\N	\N	\N
\.


--
-- Data for Name: identity_providers_applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_providers_applications (applications_id, data, enabled, identity_providers_id, keys_id) FROM stdin;
f3c84053-b5ff-423f-b2b5-af690b7199b0	{"createRegistration":true,"data":{},"properties":{}}	t	82339786-3dff-42a6-aac6-1f1ceecb6c46	\N
3c219e58-ed0e-4b18-ad48-f4f92793ae32	{"createRegistration":true,"data":{},"properties":{}}	t	82339786-3dff-42a6-aac6-1f1ceecb6c46	\N
\.


--
-- Data for Name: identity_providers_tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_providers_tenants (tenants_id, data, identity_providers_id) FROM stdin;
\.


--
-- Data for Name: instance; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.instance (id, activate_instant, data, license, license_id, setup_complete) FROM stdin;
c9bb120e-dbf6-3836-bff1-15b1983e63b8	\N	{"data":{},"firstTimeSetup":{"apiKeyId":"3d65b476-0ebb-4893-92c8-241a9d259358","applicationId":"f3c84053-b5ff-423f-b2b5-af690b7199b0","complete":true,"emailConfigured":true,"licenseActivated":false}}	\N	\N	t
\.


--
-- Data for Name: integrations; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.integrations (data) FROM stdin;
{}
\.


--
-- Data for Name: ip_access_control_lists; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.ip_access_control_lists (id, data, insert_instant, last_update_instant, name) FROM stdin;
\.


--
-- Data for Name: ip_location_database; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.ip_location_database (data, last_modified, seq) FROM stdin;
\.


--
-- Data for Name: ip_location_meta_data; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.ip_location_meta_data (digest, last_modified) FROM stdin;
\.


--
-- Data for Name: keys; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.keys (id, algorithm, certificate, expiration_instant, insert_instant, issuer, kid, last_update_instant, name, private_key, public_key, secret, type) FROM stdin;
5bf0f697-1c6d-1ad4-f55a-aff1b5319bf3	HS256	\N	\N	1717226988187	\N	0047db636	1717226988187	Default signing key	\N	\N	L2Xm/X/4SN++m45/zN246Z5/J6AVfqMo4H1xB5hS/LU=	HMAC
092dbedc-30af-4149-9c61-b578f2c72f59	HS256	\N	\N	1717226989187	\N	e61c39434	1717226989187	OpenID Connect compliant HMAC using SHA-256	\N	\N	\N	HMAC
4b8f1c06-518e-45bd-9ac5-d549686ae02a	HS384	\N	\N	1717226990187	\N	d583b105d	1717226990187	OpenID Connect compliant HMAC using SHA-384	\N	\N	\N	HMAC
c753a44d-7f2e-48d3-bc4e-c2c16488a23b	HS512	\N	\N	1717226991187	\N	e70bcb3e5	1717226991187	OpenID Connect compliant HMAC using SHA-512	\N	\N	\N	HMAC
585eb9ca-4621-4040-8725-9ecc0ccce336	RS256	-----BEGIN CERTIFICATE-----\nMIICujCCAaKgAwIBAQIQWF65ykYhQECHJZ7MDMzjNjANBgkqhkiG9w0BAQsFADAZ\nMRcwFQYDVQQDEw5sb2NhbGhvc3Q6OTAxMTAeFw0yNDA2MDEwNzMxMTdaFw0zNDA2\nMDEwNzMxMTdaMBkxFzAVBgNVBAMTDmxvY2FsaG9zdDo5MDExMIIBIjANBgkqhkiG\n9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi2lmc5WHXju/8+tOpqB8urgNeNgb0uRcDT06\nkMKb6nEAt3ew4my0G134w1Qe93AztNQBR2Ypvtmer7Qx3jZ/V/90kXY6t9spIM3p\nXd366TneVDQ7dOxnJGPEfOmNak1JlOJfz1PCQ8ttcrj79s60EnmQqjft13EgNftf\nae1vpVpLRsWwgKtgdGUwnwFBJfhuF6/UNBCb4CS7zf8QguhsCRGe8x3SDi66gCw/\nwXDnTu9nnDuubmOHKEJgp0xD21tVNSfsCy9EqglPGOyaLrsH8NVkdwSNdIDrf/0u\nAXCHCLM5V6tKLLzuz2N53N3TFnC9MUQfDYcvHpvxIZNE9oo/EQIDAQABMA0GCSqG\nSIb3DQEBCwUAA4IBAQBMrv53MUjgBc6p7PNF3tF7SuyvXfxayYXDfdjmYuFL4Szl\n14TmE5udJRUVu6O0x6U7X+wwSvBCWkukvi4XkJjwGGs04WhFZWb/T4qpCwzj7qEf\nNGHdtrNUCLBkjEs4alcJo/ZCZlaBPk+bqwXtH1a5Zl1GvwbNppYnlKzu43CYjX8Z\n11FiPQNIZaHuLSMNVVZW9Abp5rpiFfCCVO8WQPKIiGE4gVKw9jgqCtPE1/URZ7W5\nVpPr9bH3F0FEQh6D2hrvlQENlVWwTgXUvQNwcAds9nuENxEJuTkiihfzi11pJx6s\n8urQrzBEU/Jp2jtPuzr2pzo08wppxMhzI2ouyoNO\n-----END CERTIFICATE-----	2032759877230	1717227077230	localhost:9011	wGneq09cXqspF-oR0HdILRaoZ4Y	1717227077230	Default RSA signing key	-----BEGIN PRIVATE KEY-----\nMIIEugIBADANBgkqhkiG9w0BAQEFAASCBKQwggSgAgEAAoIBAQCLaWZzlYdeO7/z\n606moHy6uA142BvS5FwNPTqQwpvqcQC3d7DibLQbXfjDVB73cDO01AFHZim+2Z6v\ntDHeNn9X/3SRdjq32ykgzeld3frpOd5UNDt07GckY8R86Y1qTUmU4l/PU8JDy21y\nuPv2zrQSeZCqN+3XcSA1+19p7W+lWktGxbCAq2B0ZTCfAUEl+G4Xr9Q0EJvgJLvN\n/xCC6GwJEZ7zHdIOLrqALD/BcOdO72ecO65uY4coQmCnTEPbW1U1J+wLL0SqCU8Y\n7Jouuwfw1WR3BI10gOt//S4BcIcIszlXq0osvO7PY3nc3dMWcL0xRB8Nhy8em/Eh\nk0T2ij8RAgMBAAECgf8Lb5n34Uw5bq1QVP0erguNRYvVXeTqZ9ElROCI/23KzXpB\nko/wAvrDQ/IkE8J2ib20F7ADK15BSZi60Q1GLTJFBa+KPyiR7GhzSHDcQllSyGx0\ne9Rkwv+y/HwhwwbWsYBXtjolx7kn1ogj4QjKNiqPWWmEjRH1mlIKG5S4G8IMzjxf\nX+K3oWcJK0Jve72zQeitL32W7yi//pMsbjOspdph0v7k1+LuA2h8F1AhY4oYMq0R\nFSqAT9Euim2hokiCGT5DR1EwinI2eLnuKzrlEj+ilQCITwiullqWl0dV+qyZ2sk+\njOneCNrTAvMgWdjmjBwdoA3w+EmHYn5YrW4DXcUCgYEAumlD46wf8Bd/sDJf7wa6\n3+QvLQ/T3Jlqo0Q7lF8PukK3X1QWLY0mKw9vkMI0Plo5+9/SO8DhmULaKA5Zc/h9\nfUzfMCUhWLUSkCSt9OcOKghJt5768QfFsFMhE4wU1cS4MW5NR2Zh1mFN2JlSsMGj\nYkEE8djwvk1tiCcL/Sy2NvsCgYEAv3SK1+aiXAzJhT8AsWhm5FbsVIzF57KRkGUg\nbqvGEu7bvPZTdoJBZMws3Q8P7DTcygh+/dhx27BIZ0LbeNIFcfpN2sM27vX3fRoY\nHmiSvOqcSeyhLtLfXZs/P+wengCUycCxa2V23TLDDUwRjPqoqDBt3SgZwBIh8ln3\nuUY4NGMCgYBV6gAlJYaOxHXQQldete5ZFDT+AsZ1bKvuVZtUFcAM64TSRdH26pAF\n1pZn1Gn5tuH0iUK+0XXoihw7y+lEfulvX4eaC/LjjIjisFUQg5FOpAU9wOMNRbTC\nQH4FIVHU+FagSaMKXlCHWs9jHb8zwftIZIkf4gmK2+q4jq6C4CGXEwKBgFWW0iMm\ntdqU1No+ih7FX4og2dIKhMbJ640zyEXxgMEiCxX0wOcv3/Ah3sSMYT/lefbPyYXN\n50ihDB0tpFPlAA4uKfPsZXh6eUNyEOo3MbJG58ucf4ohNz3vk10OP7m+5MU04Zvz\nZioI8W3WXdo6jH9z9wlxTeGxuX9QfRBUtfelAoGAY3nSbYHp1WIvOuyLCO45EFx4\nxl/yiyqhm9+WTooD4KsWv86KPqRVMTb+P/3eOPDXfRFwetCHNLtNmgXD4QT+1VaC\nlAe4/asztU2sRflouy0CBbhSl3nEF9kd0T4Wvyo6457ZvDIdboUEky1TZovW+7R0\n8E3yRWBTqmDYFnkETt4=\n-----END PRIVATE KEY-----	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi2lmc5WHXju/8+tOpqB8\nurgNeNgb0uRcDT06kMKb6nEAt3ew4my0G134w1Qe93AztNQBR2Ypvtmer7Qx3jZ/\nV/90kXY6t9spIM3pXd366TneVDQ7dOxnJGPEfOmNak1JlOJfz1PCQ8ttcrj79s60\nEnmQqjft13EgNftfae1vpVpLRsWwgKtgdGUwnwFBJfhuF6/UNBCb4CS7zf8Qguhs\nCRGe8x3SDi66gCw/wXDnTu9nnDuubmOHKEJgp0xD21tVNSfsCy9EqglPGOyaLrsH\n8NVkdwSNdIDrf/0uAXCHCLM5V6tKLLzuz2N53N3TFnC9MUQfDYcvHpvxIZNE9oo/\nEQIDAQAB\n-----END PUBLIC KEY-----	\N	RSA
\.


--
-- Data for Name: kickstart_files; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.kickstart_files (id, kickstart, name) FROM stdin;
\.


--
-- Data for Name: lambdas; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.lambdas (id, body, debug, engine_type, insert_instant, last_update_instant, name, type) FROM stdin;
c9ad4b14-abad-4546-8e0e-fa6ce6f2ed85	// This is the default SCIM Group request converter, modify this to your liking.\nfunction convert(group, members, options, scimGroup) {\n\n  // Un-comment this line to see the scimGroup object printed to the event log\n  // console.info(JSON.stringify(scimGroup, null, 2));\n\n  // Request options\n  // FusionAuth allows you to assign one or more application roles to a group.\n  // To use this feature, assign one or more application Ids here.\n  // options.roleIds = [];\n\n  // Set the name of the group using the SCIM Group displayName\n  // Note, the group.name field is required.\n  group.name = scimGroup.displayName;\n\n  // Build a members array with a userId and a $ref in custom data\n  if (scimGroup.members) {\n    for (var i = 0; i < scimGroup.members.length; i++) {\n      members.push({\n        userId: scimGroup.members[i].value,\n        data: {\n          $ref: scimGroup.members[i]['$ref']\n        }\n      });\n    }\n  }\n}\n	f	GraalJS	1717227077154	1717227077154	[FusionAuth Default] SCIM Group Request Converter	19
d71e40aa-076c-4ebb-bcfc-fffc9024a301	// This is the default SCIM Group response converter, modify this to your liking.\nfunction convert(scimGroup, group, members) {\n  // Un-comment this line to see the group object printed to the event log\n  // console.info(JSON.stringify(group, null, 2));\n\n  // Set the outgoing displayName on the SCIM group using the FusionAuth group name.\n  scimGroup.displayName = group.name;\n}\n	f	GraalJS	1717227077156	1717227077156	[FusionAuth Default] SCIM Group Response Converter	20
d051b6c5-77a6-4f09-b174-af03225c86da	// This is the default SCIM User request converter, modify this to your liking.\nfunction convert(user, options, scimUser) {\n  // Un-comment this line to see the scimUser object printed to the event log\n  // console.info(JSON.stringify(scimUser, null, 2));\n\n  // Request options\n  // Note, sendSetPasswordEmail is only utilized during a user create request.\n  // options.applicationId = null;\n  // options.disableDomainBlock = false;\n  // options.sendSetPasswordEmail = false;\n  // options.skipVerification = false;\n\n  user.active = scimUser.active;\n  user.data.honorificPrefix = scimUser.name && scimUser.name.honorificPrefix;\n  user.data.honorificSuffix = scimUser.name && scimUser.name.honorificSuffix;\n  user.firstName = scimUser.name && scimUser.name.givenName;\n  user.fullName = scimUser.name && scimUser.name.formatted;\n  user.lastName = scimUser.name && scimUser.name.familyName;\n  user.middleName = scimUser.name && scimUser.name.middleName;\n  user.password = scimUser.password;\n  user.username = scimUser.userName;\n\n  // user.email\n  if (scimUser.emails) {\n    for (var i = 0; i < scimUser.emails.length; i++) {\n      if (scimUser.emails[i].primary) {\n        user.email = scimUser.emails[i].value;\n      }\n    }\n  }\n\n  // user.mobilePhone\n  if (scimUser.phoneNumbers) {\n    for (var j = 0; j < scimUser.phoneNumbers.length; j++) {\n      if (scimUser.phoneNumbers[j].primary) {\n        user.mobilePhone = scimUser.phoneNumbers[j].value;\n      }\n    }\n  }\n\n  // Handle the Enterprise User extension and other custom extensions\n  if (scimUser.schemas) {\n    for (var k = 0; k < scimUser.schemas.length; k++) {\n      var schema = scimUser.schemas[k];\n      if (schema !== 'urn:ietf:params:scim:schemas:core:2.0:User') {\n        user.data = user.data || {};\n        user.data.extensions = user.data.extensions || {};\n        user.data.extensions[schema] = scimUser[schema] || {};\n      }\n    }\n  }\n}\n	f	GraalJS	1717227077157	1717227077157	[FusionAuth Default] SCIM User Request Converter	21
b72f7dc1-b185-4a01-8c5d-ba0314093f07	// This is the default SCIM User response converter, modify this to your liking.\nfunction convert(scimUser, user) {\n  // Un-comment this line to see the user object printed to the event log\n  // console.info(JSON.stringify(user, null, 2));\n\n  scimUser.active = user.active;\n  scimUser.userName = user.username;\n  scimUser.name = {\n    formatted: user.fullName,\n    familyName: user.lastName,\n    givenName: user.firstName,\n    middleName: user.middleName,\n    honorificPrefix: user.data.honorificPrefix,\n    honorificSuffix: user.data.honorificSuffix\n  };\n\n  scimUser.phoneNumbers = [{\n    primary: true,\n    value: user.mobilePhone,\n    type: "mobile"\n  }];\n\n  scimUser.emails = [{\n    primary: true,\n    value: user.email,\n    type: "work"\n  }];\n\n  // Optionally return any custom extensions stored in user.data\n  if (user.data && user.data.extensions) {\n    for (var extension in user.data.extensions) {\n      if (scimUser.schemas.indexOf(extension) === -1) {\n        scimUser.schemas.push(extension);\n      }\n      scimUser[extension] = user.data.extensions[extension];\n    }\n  }\n}\n	f	GraalJS	1717227077158	1717227077158	[FusionAuth Default] SCIM User Response Converter	22
3f04d50e-9050-4406-b5e2-65e447a703d5	/**\n* This is the default Apple reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} idToken - the decoded JSON payload of the id_token returned by Apple.\n*/\nfunction reconcile(user, registration, idToken) {\n  // Un-comment this line to see the idToken object printed to the event log\n  // console.info(JSON.stringify(idToken, null, 2));\n\n  // During the first login attempt, the user object will be available which may contain first and last name.\n  if (idToken.user && idToken.user.name) {\n    user.firstName = idToken.user.name.firstName || user.firstName;\n    user.lastName = idToken.user.name.lastName || user.lastName;\n  }\n}\n	f	GraalJS	1717227077197	1717227077197	[FusionAuth Default] Apple Reconcile	4
376e9c08-adfe-4b40-97ad-6d6344c2762c	/**\n* This is the default Facebook reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} facebookUser - the decoded JSON payload returned by the Facebook Me API.\n*/\nfunction reconcile(user, registration, facebookUser) {\n  // Un-comment this line to see the facebookUser object printed to the event log\n  // console.info(JSON.stringify(facebookUser, null, 2));\n\n  user.firstName = facebookUser.first_name;\n  user.middleName = facebookUser.middle_name;\n  user.lastName = facebookUser.last_name;\n  user.fullName = facebookUser.name;\n\n  if (facebookUser.picture && !facebookUser.picture.data.is_silhouette) {\n    user.imageUrl = facebookUser.picture.data.url;\n  }\n\n  if (facebookUser.birthday) {\n    // Convert MM/dd/yyyy -> YYYY-MM-DD\n    var parts = facebookUser.birthday.split('/');\n    user.birthDate = parts[2] + '-' + parts[0] + '-' + parts[1];\n  }\n}\n	f	GraalJS	1717227077198	1717227077198	[FusionAuth Default] Facebook Reconcile	6
07822e3e-286f-42c4-bf01-dac3796b22d7	/**\n* This is the default Google reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} idToken - the decoded JSON payload returned by the Google Token Info API.\n*/\nfunction reconcile(user, registration, idToken) {\n  // Un-comment this line to see the idToken object printed to the event log\n  // console.info(JSON.stringify(idToken, null, 2));\n\n  // The idToken is the response from the tokeninfo endpoint\n  // https://developers.google.com/identity/sign-in/web/backend-auth#calling-the-tokeninfo-endpoint\n  user.firstName = idToken.given_name;\n  user.lastName = idToken.family_name;\n  user.fullName = idToken.name;\n  user.imageUrl = idToken.picture;\n}\n	f	GraalJS	1717227077199	1717227077199	[FusionAuth Default] Google Reconcile	7
c554dbfb-cc79-4985-abe8-a77e6db9a149	/**\n* This is the default LinkedIn reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} linkedInUser - the decoded JSON payload returned by the LinkedIn Me API or the LinkedIn UserInfo API\n*/\nfunction reconcile(user, registration, linkedInUser) {\n  // Un-comment this line to see the linkedInUser object printed to the event log\n  // console.info(JSON.stringify(linkedInUser, null, ' '));\n\n  // Depending on how and when you have set up your LinkedIn application you may get a different response back in the linkedInUser.\n  //\n  // The first checks apply if you are using the "openid", "email", and "profile" scopes.\n  // If so FusionAuth will call the LinkedIn UserInfo API.\n  // See https://learn.microsoft.com/en-us/linkedin/consumer/integrations/self-serve/sign-in-with-linkedin-v2#api-request-to-retreive-member-details\n  //\n  // The second checks apply if you are using the legacy program and Profile API with the "r_liteprofile" or "r_basicprofile" scopes.\n  // See https://learn.microsoft.com/en-us/linkedin/shared/integrations/people/profile-api\n\n  if (linkedInUser.given_name) {\n    user.firstName = linkedInUser.given_name;\n  } else if (linkedInUser.localizedFirstName) {\n    user.firstName = linkedInUser.localizedFirstName;\n  }\n\n  if (linkedInUser.family_name) {\n    user.lastName = linkedInUser.family_name;\n  } else if (linkedInUser.localizedLastName) {\n    user.lastName = linkedInUser.localizedLastName;\n  }\n\n  if (linkedInUser.picture) {\n    // UserInfo will only supply one image size\n    user.imageUrl = linkedInUser.picture;\n  } else if (linkedInUser.profilePicture){\n    // LinkedIn may return several images sizes.\n    // See https://docs.microsoft.com/en-us/linkedin/shared/references/v2/profile/profile-picture\n    // We'll sort the array by descending size and then grab the largest one.\n    var images = linkedInUser.profilePicture['displayImage~'].elements || [];\n    images.sort(function(a, b) {\n      return b.data["com.linkedin.digitalmedia.mediaartifact.StillImage"].displaySize.width - a.data["com.linkedin.digitalmedia.mediaartifact.StillImage"].displaySize.width;\n    });\n    if (images.length > 0) {\n      user.imageUrl = images[0].identifiers[0].identifier;\n    }\n  }\n}\n	f	GraalJS	1717227077200	1717227077200	[FusionAuth Default] LinkedIn Reconcile	11
41598985-0477-444a-bbaf-1a2e1260b446	/**\n* This is the default OpenID Connect reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} jwt - the JSON response from the UserInfo endpoint\n* @param {Object} [idToken] - the decoded JSON payload of the id_token. The id_token is available when the\n*                             'openid' scope was requested, and the signature can be successfully verified.\n* @param {Object} tokens an object containing the encoded access_token and when available the id_token. The\n*                        id_token is only available when returned by the IdP and the signature has been verified.\n*/\nfunction reconcile(user, registration, jwt, idToken, tokens) {\n  // Un-comment this line to see the jwt object printed to the event log\n  // console.info(JSON.stringify(jwt, null, 2));\n\n  user.firstName = jwt.given_name;\n  user.middleName = jwt.middle_name;\n  user.lastName = jwt.family_name;\n  user.fullName = jwt.name;\n  user.imageUrl = jwt.picture;\n  user.mobilePhone = jwt.phone_number;\n\n  // https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims\n  if (jwt.birthdate && jwt.birthdate !== '0000') {\n    if (jwt.birthdate.length === 4) {\n      // Only a year was provided, set to January 1.\n      user.birthDate = jwt.birthdate + '-01-01';\n    } else {\n      user.birthDate = jwt.birthdate;\n    }\n  }\n\n  // https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims\n  if (jwt.locale) {\n    user.preferredLanguages = user.preferredLanguages || [];\n    // Replace the dash with an under_score.\n    user.preferredLanguages.push(jwt.locale.replace('-', '_'));\n  }\n\n  // Set preferred_username in registration.\n  // - This is just for display purposes, this value cannot be used to uniquely identify\n  //   the user in FusionAuth.\n  registration.username = jwt.preferred_username;\n}\n	f	GraalJS	1717227077202	1717227077202	[FusionAuth Default] OpenID Connect Reconcile	1
3456bfa1-1e42-4d6e-ac20-1035931e8997	/**\n* This is the default SAML v2 reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} samlResponse - the SAML AuthN response returned by the SAML v2 Identity Provider. This\n*                                object is a parsed version of the actual XML document returned. See\n*                                the FusionAuth documentation for more details, or print the contents of this\n*                                object to the event log to assist in debugging.\n*/\nfunction reconcile(user, registration, samlResponse) {\n  // Un-comment this line to see the samlResponse object printed to the event log\n  // console.info(JSON.stringify(samlResponse, null, 2));\n\n  var getAttribute = function(samlResponse, attribute) {\n    var values = samlResponse.assertion.attributes[attribute];\n    if (values && values.length > 0) {\n      return values[0];\n    }\n\n    return null;\n  };\n\n  // Retrieve an attribute from the samlResponse\n  // - Arguments [2 .. ] provide a preferred order of attribute names to lookup the value in the response.\n  var defaultIfNull = function(samlResponse) {\n    for (var i = 1; i < arguments.length; i++) {\n      var value = getAttribute(samlResponse, arguments[i]);\n      if (value !== null) {\n        return value;\n      }\n    }\n  };\n\n  user.birthDate = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth', 'birthdate', 'date_of_birth');\n  user.firstName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname', 'first_name');\n  user.lastName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname', 'last_name');\n  user.fullName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', 'name', 'full_name');\n  user.mobilePhone = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone', 'mobile_phone');\n}\n	f	GraalJS	1717227077203	1717227077203	[FusionAuth Default] SAML v2 Reconcile	2
189da63a-03b1-4675-83a3-3c0e49ea45f2	/**\n* This is the default Twitter reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} twitterUser - the decoded JSON payload returned by the Twitter Verify Credentials API.\n*/\nfunction reconcile(user, registration, twitterUser) {\n  // Un-comment this line to see the twitterUser object printed to the event log\n  // console.info(JSON.stringify(twitterUser, null, 2));\n\n  // Set name if available in the response\n  if (twitterUser.name) {\n    user.fullName = twitterUser.name;\n  }\n\n  // https://developer.twitter.com/en/docs/accounts-and-users/user-profile-images-and-banners.html\n  if (twitterUser.profile_image_url_https) {\n    // Remove the _normal suffix to get the original size.\n    user.imageUrl = twitterUser.profile_image_url_https.replace('_normal.png', '.png');\n  }\n\n  // Set twitter screen_name in registration.\n  // - This is just for display purposes, this value cannot be used to uniquely identify\n  //   the user in FusionAuth.\n  registration.username = twitterUser.screen_name;\n}\n	f	GraalJS	1717227077204	1717227077204	[FusionAuth Default] Twitter Reconcile	9
\.


--
-- Data for Name: last_login_instants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.last_login_instants (applications_id, registration_last_login_instant, users_id, user_last_login_instant) FROM stdin;
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.locks (type, update_instant) FROM stdin;
UserActionEndEvent	\N
EmailPlus	\N
Family	\N
com.inversoft.migration.Migrator	\N
Reindex	\N
Reset	\N
AsyncTaskManager	\N
ProcessLastLoginInstants	\N
\.


--
-- Data for Name: master_record; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.master_record (id, instant) FROM stdin;
97c9cf36-3021-44b9-b089-7d0c82537d57	1717232564124
\.


--
-- Data for Name: message_templates; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.message_templates (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
8f72e142-fd0d-cfbd-c3ff-8c8eb6e67330	{ "defaultTemplate": "Two Factor Code: ${code}" }	1717226992187	1717226992187	Default Two Factor Request	0
\.


--
-- Data for Name: messengers; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.messengers (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.migrations (name, run_instant) FROM stdin;
io.fusionauth.api.migration.guice.Migration_1_8_0	0
io.fusionauth.api.migration.guice.Migration_1_9_2	0
io.fusionauth.api.migration.guice.Migration_1_10_0	0
io.fusionauth.api.migration.guice.Migration_1_13_0	0
io.fusionauth.api.migration.guice.Migration_1_15_3	0
io.fusionauth.api.migration.guice.Migration_1_30_0	0
io.fusionauth.api.migration.guice.Migration_1_42_0	1717226996325
\.


--
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.nodes (id, data, insert_instant, last_checkin_instant, runtime_mode, url) FROM stdin;
97c9cf36-3021-44b9-b089-7d0c82537d57	{"data":{},"ipAddresses":{"eth0":["192.168.48.3"],"eth1":["172.31.0.2"],"eth2":["192.168.80.3"]},"platform":{"arch":"amd64","name":"Linux","version":"6.4.16-linuxkit"}}	1717226995642	1717232694121	development	http://fusionauth:9011
\.


--
-- Data for Name: previous_passwords; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.previous_passwords (insert_instant, encryption_scheme, factor, password, salt, users_id) FROM stdin;
\.


--
-- Data for Name: raw_application_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_application_daily_active_users (applications_id, day, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	19875	60718eb9-85d7-4898-9061-53a9c95d38ac
f3c84053-b5ff-423f-b2b5-af690b7199b0	19875	9d66de7c-6420-43c5-97b6-92814b9dcd40
f3c84053-b5ff-423f-b2b5-af690b7199b0	19875	860733b0-dc91-43be-b5f1-05a65d7035c9
\.


--
-- Data for Name: raw_application_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_application_monthly_active_users (applications_id, month, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	653	60718eb9-85d7-4898-9061-53a9c95d38ac
f3c84053-b5ff-423f-b2b5-af690b7199b0	653	9d66de7c-6420-43c5-97b6-92814b9dcd40
f3c84053-b5ff-423f-b2b5-af690b7199b0	653	860733b0-dc91-43be-b5f1-05a65d7035c9
\.


--
-- Data for Name: raw_application_registration_counts; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_application_registration_counts (id, applications_id, count, decremented_count, hour) FROM stdin;
\.


--
-- Data for Name: raw_global_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_global_daily_active_users (day, users_id) FROM stdin;
19875	60718eb9-85d7-4898-9061-53a9c95d38ac
19875	9d66de7c-6420-43c5-97b6-92814b9dcd40
19875	860733b0-dc91-43be-b5f1-05a65d7035c9
\.


--
-- Data for Name: raw_global_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_global_monthly_active_users (month, users_id) FROM stdin;
653	60718eb9-85d7-4898-9061-53a9c95d38ac
653	9d66de7c-6420-43c5-97b6-92814b9dcd40
653	860733b0-dc91-43be-b5f1-05a65d7035c9
\.


--
-- Data for Name: raw_global_registration_counts; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_global_registration_counts (id, count, decremented_count, hour) FROM stdin;
\.


--
-- Data for Name: raw_logins; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_logins (applications_id, instant, ip_address, users_id) FROM stdin;
f3c84053-b5ff-423f-b2b5-af690b7199b0	1717227678047	192.168.48.1	9d66de7c-6420-43c5-97b6-92814b9dcd40
f3c84053-b5ff-423f-b2b5-af690b7199b0	1717227702987	192.168.48.1	860733b0-dc91-43be-b5f1-05a65d7035c9
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.refresh_tokens (id, applications_id, data, insert_instant, start_instant, tenants_id, token, token_hash, token_text, users_id) FROM stdin;
9a83e230-3a8b-4fd8-bd31-71b2968fec26	3c219e58-ed0e-4b18-ad48-f4f92793ae32	{"data":{},"metaData":{"device":{"lastAccessedAddress":"192.168.48.1","lastAccessedInstant":1717227804580,"name":"Setup Wizard","type":"Browser"}}}	1717227077146	1717227804580	\N	\N	jBeXNchjWYAgmpqCFMJgCtadBRdR3Ee714+BYv+T/Ks=                    	LAkBueDuiXIE6tBD7HCfpL9WBoIzydQgt4-e4aL9l4_vHB_2wkRhaw	60718eb9-85d7-4898-9061-53a9c95d38ac
\.


--
-- Data for Name: request_frequencies; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.request_frequencies (count, last_update_instant, request_id, tenants_id, type) FROM stdin;
\.


--
-- Data for Name: scim_external_id_groups; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.scim_external_id_groups (entities_id, external_id, groups_id) FROM stdin;
\.


--
-- Data for Name: scim_external_id_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.scim_external_id_users (entities_id, external_id, users_id) FROM stdin;
\.


--
-- Data for Name: system_configuration; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.system_configuration (data, insert_instant, last_update_instant, report_timezone) FROM stdin;
{"auditLogConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"cookieEncryptionKey":"pr+ichrZ6KBrjhTllsBolA==","corsConfiguration":{"allowCredentials":false,"allowedHeaders":["Accept","Access-Control-Request-Headers","Access-Control-Request-Method","Authorization","Content-Type","Last-Modified","Origin","X-FusionAuth-TenantId","X-Requested-With"],"allowedMethods":["POST","DELETE","GET","PATCH","HEAD","OPTIONS","PUT"],"allowedOrigins":["http://localhost:8080"],"debug":false,"enabled":true,"exposedHeaders":["Access-Control-Allow-Origin","Access-Control-Allow-Credentials"],"preflightMaxAgeInSeconds":1800},"data":{},"eventLogConfiguration":{"numberToRetain":10000},"loginRecordConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"trustedProxyConfiguration":{"trustPolicy":"All"},"uiConfiguration":{}}	1717226992187	1717226992187	America/Denver
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.tenants (id, access_token_signing_keys_id, admin_user_forms_id, client_credentials_access_token_populate_lambdas_id, confirm_child_email_templates_id, data, email_update_email_templates_id, email_verified_email_templates_id, failed_authentication_user_actions_id, family_request_email_templates_id, forgot_password_email_templates_id, id_token_signing_keys_id, insert_instant, last_update_instant, login_id_in_use_on_create_email_templates_id, login_id_in_use_on_update_email_templates_id, login_new_device_email_templates_id, login_suspicious_email_templates_id, multi_factor_email_message_templates_id, multi_factor_sms_message_templates_id, multi_factor_sms_messengers_id, name, password_reset_success_email_templates_id, password_update_email_templates_id, parent_registration_email_templates_id, passwordless_email_templates_id, scim_client_entity_types_id, scim_enterprise_user_request_converter_lambdas_id, scim_enterprise_user_response_converter_lambdas_id, scim_group_request_converter_lambdas_id, scim_group_response_converter_lambdas_id, scim_server_entity_types_id, scim_user_request_converter_lambdas_id, scim_user_response_converter_lambdas_id, set_password_email_templates_id, themes_id, two_factor_method_add_email_templates_id, two_factor_method_remove_email_templates_id, ui_ip_access_control_lists_id, verification_email_templates_id) FROM stdin;
66596267-5933-e0aa-b3bc-8ac0344bed03	585eb9ca-4621-4040-8725-9ecc0ccce336	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	\N	\N	{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":true,"data":{},"emailConfiguration":{"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","host":"localhost","implicitEmailVerificationAllowed":true,"port":25,"security":"TLS","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{},"httpSessionMaxInactiveInterval":3600,"issuer":"localhost:9011","jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"22b8fc9c-f7f9-42b7-999d-a9f3b6d7b743"},"loginPolicy":"Enabled","sms":{"enabled":false}},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"notifyUserEmailTemplateId":"90ab8419-43f8-4003-a272-9797ad3ae449"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"any","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}}	\N	\N	\N	\N	\N	585eb9ca-4621-4040-8725-9ecc0ccce336	1717226991187	1717227112614	\N	\N	\N	\N	22b8fc9c-f7f9-42b7-999d-a9f3b6d7b743	\N	\N	Default	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75a068fd-e94b-451a-9aeb-3ddb9a3b5987	\N	\N	\N	\N
7fb233aa-b21c-4e9d-84cd-5567df65caf1	585eb9ca-4621-4040-8725-9ecc0ccce336	abc2df79-bb94-e8a5-cd38-7db67c28d5ef	\N	\N	{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":true,"data":{},"emailConfiguration":{"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","host":"localhost","implicitEmailVerificationAllowed":true,"port":25,"security":"TLS","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{"jwt.public-key.update":{"enabled":false,"transactionType":"None"},"jwt.refresh-token.revoke":{"enabled":false,"transactionType":"None"},"jwt.refresh":{"enabled":false,"transactionType":"None"},"group.create":{"enabled":false,"transactionType":"None"},"group.create.complete":{"enabled":false,"transactionType":"None"},"group.delete":{"enabled":false,"transactionType":"None"},"group.delete.complete":{"enabled":false,"transactionType":"None"},"group.member.add":{"enabled":false,"transactionType":"None"},"group.member.add.complete":{"enabled":false,"transactionType":"None"},"group.member.remove":{"enabled":false,"transactionType":"None"},"group.member.remove.complete":{"enabled":false,"transactionType":"None"},"group.member.update":{"enabled":false,"transactionType":"None"},"group.member.update.complete":{"enabled":false,"transactionType":"None"},"group.update":{"enabled":false,"transactionType":"None"},"group.update.complete":{"enabled":false,"transactionType":"None"},"user.action":{"enabled":false,"transactionType":"None"},"user.bulk.create":{"enabled":false,"transactionType":"None"},"user.create":{"enabled":false,"transactionType":"None"},"user.create.complete":{"enabled":false,"transactionType":"None"},"user.deactivate":{"enabled":false,"transactionType":"None"},"user.delete":{"enabled":false,"transactionType":"None"},"user.delete.complete":{"enabled":false,"transactionType":"None"},"user.email.update":{"enabled":false,"transactionType":"None"},"user.email.verified":{"enabled":false,"transactionType":"None"},"user.identity-provider.link":{"enabled":false,"transactionType":"None"},"user.identity-provider.unlink":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.create":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.update":{"enabled":false,"transactionType":"None"},"user.login.failed":{"enabled":false,"transactionType":"None"},"user.login.new-device":{"enabled":false,"transactionType":"None"},"user.login.success":{"enabled":false,"transactionType":"None"},"user.login.suspicious":{"enabled":false,"transactionType":"None"},"user.password.breach":{"enabled":false,"transactionType":"None"},"user.password.reset.send":{"enabled":false,"transactionType":"None"},"user.password.reset.start":{"enabled":false,"transactionType":"None"},"user.password.reset.success":{"enabled":false,"transactionType":"None"},"user.password.update":{"enabled":false,"transactionType":"None"},"user.reactivate":{"enabled":false,"transactionType":"None"},"user.registration.create":{"enabled":false,"transactionType":"None"},"user.registration.create.complete":{"enabled":false,"transactionType":"None"},"user.registration.delete":{"enabled":false,"transactionType":"None"},"user.registration.delete.complete":{"enabled":false,"transactionType":"None"},"user.registration.update":{"enabled":false,"transactionType":"None"},"user.registration.update.complete":{"enabled":false,"transactionType":"None"},"user.registration.verified":{"enabled":false,"transactionType":"None"},"user.two-factor.method.add":{"enabled":false,"transactionType":"None"},"user.two-factor.method.remove":{"enabled":false,"transactionType":"None"},"user.update":{"enabled":false,"transactionType":"None"},"user.update.complete":{"enabled":false,"transactionType":"None"}}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{},"httpSessionMaxInactiveInterval":3600,"issuer":"localhost:9011","jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"22b8fc9c-f7f9-42b7-999d-a9f3b6d7b743"},"loginPolicy":"Enabled","sms":{"enabled":false}},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"matchMode":"High","notifyUserEmailTemplateId":"90ab8419-43f8-4003-a272-9797ad3ae449","onLogin":"Off"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}}	\N	\N	\N	\N	\N	585eb9ca-4621-4040-8725-9ecc0ccce336	1717227178863	1717227178863	\N	\N	\N	\N	22b8fc9c-f7f9-42b7-999d-a9f3b6d7b743	\N	\N	tms	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75a068fd-e94b-451a-9aeb-3ddb9a3b5987	\N	\N	\N	\N
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.themes (id, data, insert_instant, last_update_instant, name) FROM stdin;
75a068fd-e94b-451a-9aeb-3ddb9a3b5987	{}	1717226992187	1717226992187	FusionAuth
3c717291-5d83-4014-bd51-97c76475dc86	{"type":"simple"}	1717226992187	1717226992187	FusionAuth - Simple
\.


--
-- Data for Name: user_action_logs; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_action_logs (id, actioner_users_id, actionee_users_id, comment, email_user_on_end, end_event_sent, expiry, history, insert_instant, localized_name, localized_option, localized_reason, name, notify_user_on_end, option_name, reason, reason_code, user_actions_id) FROM stdin;
\.


--
-- Data for Name: user_action_logs_applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_action_logs_applications (applications_id, user_action_logs_id) FROM stdin;
\.


--
-- Data for Name: user_action_reasons; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_action_reasons (id, insert_instant, last_update_instant, localized_texts, text, code) FROM stdin;
\.


--
-- Data for Name: user_actions; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_actions (id, active, cancel_email_templates_id, end_email_templates_id, include_email_in_event_json, insert_instant, last_update_instant, localized_names, modify_email_templates_id, name, options, prevent_login, send_end_event, start_email_templates_id, temporal, transaction_type, user_notifications_enabled, user_emailing_enabled) FROM stdin;
\.


--
-- Data for Name: user_comments; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_comments (id, comment, commenter_id, insert_instant, users_id) FROM stdin;
\.


--
-- Data for Name: user_consents; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_consents (id, consents_id, data, giver_users_id, insert_instant, last_update_instant, users_id) FROM stdin;
\.


--
-- Data for Name: user_consents_email_plus; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_consents_email_plus (id, next_email_instant, user_consents_id) FROM stdin;
\.


--
-- Data for Name: user_registrations; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_registrations (id, applications_id, authentication_token, clean_speak_id, data, insert_instant, last_login_instant, last_update_instant, timezone, username, username_status, users_id, verified, verified_instant) FROM stdin;
c5637129-53de-4384-941c-fd56c7ed80b3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1717227077130	\N	1717227077130	\N	\N	0	60718eb9-85d7-4898-9061-53a9c95d38ac	t	1717227077130
c5db12d8-afd2-4d9e-bacd-b2c68a19dc7c	f3c84053-b5ff-423f-b2b5-af690b7199b0	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1717227678047	1717227678047	1717227678047	\N	\N	0	9d66de7c-6420-43c5-97b6-92814b9dcd40	t	1717227678047
2a81f893-a67d-4c02-9851-db0671d2342c	f3c84053-b5ff-423f-b2b5-af690b7199b0	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1717227703015	1717227702987	1717227703015	\N	\N	0	860733b0-dc91-43be-b5f1-05a65d7035c9	t	1717227703015
\.


--
-- Data for Name: user_registrations_application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_registrations_application_roles (application_roles_id, user_registrations_id) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb8236e2	c5637129-53de-4384-941c-fd56c7ed80b3
0f477b01-f0e9-4bb1-b54b-218615e7ccbd	c5db12d8-afd2-4d9e-bacd-b2c68a19dc7c
0f477b01-f0e9-4bb1-b54b-218615e7ccbd	2a81f893-a67d-4c02-9851-db0671d2342c
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.users (id, active, birth_date, clean_speak_id, data, expiry, first_name, full_name, image_url, insert_instant, last_name, last_update_instant, middle_name, mobile_phone, parent_email, tenants_id, timezone) FROM stdin;
60718eb9-85d7-4898-9061-53a9c95d38ac	t	\N	\N	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	Admin	\N	\N	1717227077082	[Admins]	1717227077082	\N	\N	\N	66596267-5933-e0aa-b3bc-8ac0344bed03	\N
9d66de7c-6420-43c5-97b6-92814b9dcd40	t	\N	\N	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	\N	\N	\N	1717227678021	\N	1717227678021	\N	\N	\N	66596267-5933-e0aa-b3bc-8ac0344bed03	\N
860733b0-dc91-43be-b5f1-05a65d7035c9	t	\N	\N	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	\N	\N	\N	1717227702987	\N	1717227702987	\N	\N	\N	66596267-5933-e0aa-b3bc-8ac0344bed03	\N
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.version (version) FROM stdin;
1.51.0
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.webauthn_credentials (id, credential_id, data, insert_instant, last_use_instant, tenants_id, users_id) FROM stdin;
\.


--
-- Data for Name: webhooks; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.webhooks (id, connect_timeout, description, data, global, headers, http_authentication_username, http_authentication_password, insert_instant, last_update_instant, read_timeout, signing_keys_id, ssl_certificate, ssl_certificate_keys_id, url) FROM stdin;
\.


--
-- Data for Name: webhooks_tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.webhooks_tenants (webhooks_id, tenants_id) FROM stdin;
\.


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 12, true);


--
-- Name: event_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.event_logs_id_seq', 1, false);


--
-- Name: identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.identities_id_seq', 3, true);


--
-- Name: raw_application_registration_counts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.raw_application_registration_counts_id_seq', 3, true);


--
-- Name: raw_global_registration_counts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.raw_global_registration_counts_id_seq', 3, true);


--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.user_consents_email_plus_id_seq', 1, false);


--
-- Name: application_daily_active_users application_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_daily_active_users
    ADD CONSTRAINT application_daily_active_users_uk_1 UNIQUE (applications_id, day);


--
-- Name: application_monthly_active_users application_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_monthly_active_users
    ADD CONSTRAINT application_monthly_active_users_uk_1 UNIQUE (applications_id, month);


--
-- Name: application_oauth_scopes application_oauth_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_oauth_scopes
    ADD CONSTRAINT application_oauth_scopes_pkey PRIMARY KEY (id);


--
-- Name: application_oauth_scopes application_oauth_scopes_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_oauth_scopes
    ADD CONSTRAINT application_oauth_scopes_uk_1 UNIQUE (applications_id, name);


--
-- Name: application_registration_counts application_registration_counts_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_registration_counts
    ADD CONSTRAINT application_registration_counts_uk_1 UNIQUE (applications_id, hour);


--
-- Name: application_roles application_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_pkey PRIMARY KEY (id);


--
-- Name: application_roles application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_uk_1 UNIQUE (name, applications_id);


--
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: applications applications_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_uk_1 UNIQUE (name, tenants_id);


--
-- Name: applications applications_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_uk_2 UNIQUE (samlv2_issuer, tenants_id);


--
-- Name: asynchronous_tasks asynchronous_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_pkey PRIMARY KEY (id);


--
-- Name: asynchronous_tasks asynchronous_tasks_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_uk_1 UNIQUE (entity_id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: authentication_keys authentication_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_pkey PRIMARY KEY (id);


--
-- Name: authentication_keys authentication_keys_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_uk_1 UNIQUE (key_value);


--
-- Name: breached_password_metrics breached_password_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.breached_password_metrics
    ADD CONSTRAINT breached_password_metrics_pkey PRIMARY KEY (tenants_id);


--
-- Name: clean_speak_applications clean_speak_applications_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.clean_speak_applications
    ADD CONSTRAINT clean_speak_applications_uk_1 UNIQUE (applications_id, clean_speak_application_id);


--
-- Name: common_breached_passwords common_breached_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.common_breached_passwords
    ADD CONSTRAINT common_breached_passwords_pkey PRIMARY KEY (password);


--
-- Name: connectors connectors_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_pkey PRIMARY KEY (id);


--
-- Name: connectors_tenants connectors_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_pkey PRIMARY KEY (connectors_id, tenants_id);


--
-- Name: connectors_tenants connectors_tenants_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_uk_1 UNIQUE (connectors_id, tenants_id, sequence);


--
-- Name: connectors connectors_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_uk_1 UNIQUE (name);


--
-- Name: consents consents_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_pkey PRIMARY KEY (id);


--
-- Name: consents consents_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_uk_1 UNIQUE (name);


--
-- Name: data_sets data_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.data_sets
    ADD CONSTRAINT data_sets_pkey PRIMARY KEY (name);


--
-- Name: email_templates email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (id);


--
-- Name: email_templates email_templates_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_uk_1 UNIQUE (name);


--
-- Name: entities entities_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (id);


--
-- Name: entities entities_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_uk_1 UNIQUE (client_id);


--
-- Name: entity_entity_grant_permissions entity_entity_grant_permissions_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_entity_grant_permissions
    ADD CONSTRAINT entity_entity_grant_permissions_uk_1 UNIQUE (entity_entity_grants_id, entity_type_permissions_id);


--
-- Name: entity_entity_grants entity_entity_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_entity_grants
    ADD CONSTRAINT entity_entity_grants_pkey PRIMARY KEY (id);


--
-- Name: entity_entity_grants entity_entity_grants_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_entity_grants
    ADD CONSTRAINT entity_entity_grants_uk_1 UNIQUE (recipient_id, target_id);


--
-- Name: entity_type_permissions entity_type_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_type_permissions
    ADD CONSTRAINT entity_type_permissions_pkey PRIMARY KEY (id);


--
-- Name: entity_type_permissions entity_type_permissions_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_type_permissions
    ADD CONSTRAINT entity_type_permissions_uk_1 UNIQUE (entity_types_id, name);


--
-- Name: entity_types entity_types_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_types
    ADD CONSTRAINT entity_types_pkey PRIMARY KEY (id);


--
-- Name: entity_types entity_types_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_types
    ADD CONSTRAINT entity_types_uk_1 UNIQUE (name);


--
-- Name: entity_user_grant_permissions entity_user_grant_permissions_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_user_grant_permissions
    ADD CONSTRAINT entity_user_grant_permissions_uk_1 UNIQUE (entity_user_grants_id, entity_type_permissions_id);


--
-- Name: entity_user_grants entity_user_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_user_grants
    ADD CONSTRAINT entity_user_grants_pkey PRIMARY KEY (id);


--
-- Name: entity_user_grants entity_user_grants_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_user_grants
    ADD CONSTRAINT entity_user_grants_uk_1 UNIQUE (entities_id, users_id);


--
-- Name: event_logs event_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.event_logs
    ADD CONSTRAINT event_logs_pkey PRIMARY KEY (id);


--
-- Name: external_identifiers external_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_pkey PRIMARY KEY (id);


--
-- Name: families families_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_pkey PRIMARY KEY (family_id, users_id);


--
-- Name: federated_domains federated_domains_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.federated_domains
    ADD CONSTRAINT federated_domains_uk_1 UNIQUE (domain);


--
-- Name: form_fields form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_pkey PRIMARY KEY (id);


--
-- Name: form_fields form_fields_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_uk_1 UNIQUE (name);


--
-- Name: form_steps form_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_pkey PRIMARY KEY (forms_id, form_fields_id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: forms forms_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_uk_1 UNIQUE (name);


--
-- Name: global_daily_active_users global_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.global_daily_active_users
    ADD CONSTRAINT global_daily_active_users_uk_1 UNIQUE (day);


--
-- Name: global_monthly_active_users global_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.global_monthly_active_users
    ADD CONSTRAINT global_monthly_active_users_uk_1 UNIQUE (month);


--
-- Name: global_registration_counts global_registration_counts_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.global_registration_counts
    ADD CONSTRAINT global_registration_counts_uk_1 UNIQUE (hour);


--
-- Name: group_application_roles group_application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_uk_1 UNIQUE (groups_id, application_roles_id);


--
-- Name: group_members group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_pkey PRIMARY KEY (id);


--
-- Name: group_members group_members_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_uk_1 UNIQUE (groups_id, users_id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: groups groups_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_uk_1 UNIQUE (name, tenants_id);


--
-- Name: hourly_logins hourly_logins_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.hourly_logins
    ADD CONSTRAINT hourly_logins_uk_1 UNIQUE (applications_id, hour);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_uk_1 UNIQUE (email, tenants_id);


--
-- Name: identities identities_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_uk_2 UNIQUE (username_index, tenants_id);


--
-- Name: identity_provider_links identity_provider_links_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_provider_links
    ADD CONSTRAINT identity_provider_links_uk_1 UNIQUE (identity_providers_id, identity_providers_user_id, tenants_id);


--
-- Name: identity_providers identity_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_pkey PRIMARY KEY (id);


--
-- Name: identity_providers identity_providers_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_uk_1 UNIQUE (name);


--
-- Name: ip_access_control_lists ip_access_control_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.ip_access_control_lists
    ADD CONSTRAINT ip_access_control_lists_pkey PRIMARY KEY (id);


--
-- Name: ip_access_control_lists ip_access_control_lists_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.ip_access_control_lists
    ADD CONSTRAINT ip_access_control_lists_uk_1 UNIQUE (name);


--
-- Name: ip_location_database ip_location_database_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.ip_location_database
    ADD CONSTRAINT ip_location_database_pkey PRIMARY KEY (last_modified, seq);


--
-- Name: ip_location_meta_data ip_location_meta_data_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.ip_location_meta_data
    ADD CONSTRAINT ip_location_meta_data_pkey PRIMARY KEY (last_modified);


--
-- Name: keys keys_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_pkey PRIMARY KEY (id);


--
-- Name: keys keys_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_uk_1 UNIQUE (kid);


--
-- Name: keys keys_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_uk_2 UNIQUE (name);


--
-- Name: kickstart_files kickstart_files_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.kickstart_files
    ADD CONSTRAINT kickstart_files_pkey PRIMARY KEY (id);


--
-- Name: lambdas lambdas_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.lambdas
    ADD CONSTRAINT lambdas_pkey PRIMARY KEY (id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (type);


--
-- Name: message_templates message_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.message_templates
    ADD CONSTRAINT message_templates_pkey PRIMARY KEY (id);


--
-- Name: message_templates message_templates_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.message_templates
    ADD CONSTRAINT message_templates_uk_1 UNIQUE (name);


--
-- Name: messengers messengers_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.messengers
    ADD CONSTRAINT messengers_pkey PRIMARY KEY (id);


--
-- Name: messengers messengers_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.messengers
    ADD CONSTRAINT messengers_uk_1 UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (name);


--
-- Name: nodes nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- Name: previous_passwords previous_passwords_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.previous_passwords
    ADD CONSTRAINT previous_passwords_uk_1 UNIQUE (users_id, insert_instant);


--
-- Name: raw_application_daily_active_users raw_application_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_application_daily_active_users
    ADD CONSTRAINT raw_application_daily_active_users_uk_1 UNIQUE (applications_id, day, users_id);


--
-- Name: raw_application_monthly_active_users raw_application_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_application_monthly_active_users
    ADD CONSTRAINT raw_application_monthly_active_users_uk_1 UNIQUE (applications_id, month, users_id);


--
-- Name: raw_application_registration_counts raw_application_registration_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_application_registration_counts
    ADD CONSTRAINT raw_application_registration_counts_pkey PRIMARY KEY (id);


--
-- Name: raw_global_daily_active_users raw_global_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_global_daily_active_users
    ADD CONSTRAINT raw_global_daily_active_users_uk_1 UNIQUE (day, users_id);


--
-- Name: raw_global_monthly_active_users raw_global_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_global_monthly_active_users
    ADD CONSTRAINT raw_global_monthly_active_users_uk_1 UNIQUE (month, users_id);


--
-- Name: raw_global_registration_counts raw_global_registration_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_global_registration_counts
    ADD CONSTRAINT raw_global_registration_counts_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_uk_1 UNIQUE (token);


--
-- Name: refresh_tokens refresh_tokens_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_uk_2 UNIQUE (token_hash);


--
-- Name: request_frequencies request_frequencies_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.request_frequencies
    ADD CONSTRAINT request_frequencies_uk_1 UNIQUE (tenants_id, type, request_id);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: tenants tenants_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_uk_1 UNIQUE (name);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: themes themes_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_uk_1 UNIQUE (name);


--
-- Name: user_action_logs user_action_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_pkey PRIMARY KEY (id);


--
-- Name: user_action_reasons user_action_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_pkey PRIMARY KEY (id);


--
-- Name: user_action_reasons user_action_reasons_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_uk_1 UNIQUE (text);


--
-- Name: user_action_reasons user_action_reasons_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_uk_2 UNIQUE (code);


--
-- Name: user_actions user_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_pkey PRIMARY KEY (id);


--
-- Name: user_actions user_actions_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_uk_1 UNIQUE (name);


--
-- Name: user_comments user_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_pkey PRIMARY KEY (id);


--
-- Name: user_consents_email_plus user_consents_email_plus_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents_email_plus
    ADD CONSTRAINT user_consents_email_plus_pkey PRIMARY KEY (id);


--
-- Name: user_consents user_consents_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_pkey PRIMARY KEY (id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_uk_1 UNIQUE (user_registrations_id, application_roles_id);


--
-- Name: user_registrations user_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_pkey PRIMARY KEY (id);


--
-- Name: user_registrations user_registrations_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_uk_1 UNIQUE (applications_id, users_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: webhooks webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_pkey PRIMARY KEY (id);


--
-- Name: webhooks_tenants webhooks_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks_tenants
    ADD CONSTRAINT webhooks_tenants_pkey PRIMARY KEY (webhooks_id, tenants_id);


--
-- Name: applications_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX applications_i_1 ON public.applications USING btree (tenants_id);


--
-- Name: audit_logs_i1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX audit_logs_i1 ON public.audit_logs USING btree (insert_instant);


--
-- Name: entity_user_grants_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX entity_user_grants_i_1 ON public.entity_user_grants USING btree (users_id);


--
-- Name: event_logs_i1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX event_logs_i1 ON public.event_logs USING btree (insert_instant);


--
-- Name: external_identifiers_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX external_identifiers_i_1 ON public.external_identifiers USING btree (tenants_id, type, insert_instant);


--
-- Name: external_identifiers_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX external_identifiers_i_2 ON public.external_identifiers USING btree (type, users_id, applications_id);


--
-- Name: external_identifiers_i_3; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX external_identifiers_i_3 ON public.external_identifiers USING btree (expiration_instant);


--
-- Name: families_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX families_i_1 ON public.families USING btree (users_id);


--
-- Name: group_members_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX group_members_i_1 ON public.group_members USING btree (users_id);


--
-- Name: identities_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX identities_i_1 ON public.identities USING btree (users_id);


--
-- Name: identity_provider_links_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX identity_provider_links_i_1 ON public.identity_provider_links USING btree (users_id);


--
-- Name: raw_logins_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX raw_logins_i_1 ON public.raw_logins USING btree (instant);


--
-- Name: raw_logins_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX raw_logins_i_2 ON public.raw_logins USING btree (users_id, instant);


--
-- Name: refresh_tokens_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX refresh_tokens_i_1 ON public.refresh_tokens USING btree (start_instant);


--
-- Name: refresh_tokens_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX refresh_tokens_i_2 ON public.refresh_tokens USING btree (applications_id);


--
-- Name: refresh_tokens_i_3; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX refresh_tokens_i_3 ON public.refresh_tokens USING btree (users_id);


--
-- Name: refresh_tokens_i_4; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX refresh_tokens_i_4 ON public.refresh_tokens USING btree (tenants_id);


--
-- Name: request_frequencies_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX request_frequencies_i_1 ON public.request_frequencies USING btree (tenants_id, type, last_update_instant);


--
-- Name: scim_external_id_groups_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX scim_external_id_groups_i_1 ON public.scim_external_id_groups USING btree (entities_id, external_id);


--
-- Name: scim_external_id_groups_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX scim_external_id_groups_i_2 ON public.scim_external_id_groups USING btree (entities_id, groups_id);


--
-- Name: scim_external_id_users_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX scim_external_id_users_i_1 ON public.scim_external_id_users USING btree (entities_id, external_id);


--
-- Name: scim_external_id_users_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX scim_external_id_users_i_2 ON public.scim_external_id_users USING btree (entities_id, users_id);


--
-- Name: user_action_logs_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_action_logs_i_1 ON public.user_action_logs USING btree (insert_instant);


--
-- Name: user_action_logs_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_action_logs_i_2 ON public.user_action_logs USING btree (expiry, end_event_sent);


--
-- Name: user_comments_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_comments_i_1 ON public.user_comments USING btree (insert_instant);


--
-- Name: user_comments_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_comments_i_2 ON public.user_comments USING btree (users_id);


--
-- Name: user_comments_i_3; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_comments_i_3 ON public.user_comments USING btree (commenter_id);


--
-- Name: user_consents_email_plus_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_consents_email_plus_i_1 ON public.user_consents_email_plus USING btree (next_email_instant);


--
-- Name: user_registrations_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_registrations_i_1 ON public.user_registrations USING btree (clean_speak_id);


--
-- Name: user_registrations_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_registrations_i_2 ON public.user_registrations USING btree (users_id);


--
-- Name: users_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX users_i_1 ON public.users USING btree (clean_speak_id);


--
-- Name: users_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX users_i_2 ON public.users USING btree (parent_email);


--
-- Name: webauthn_credentials_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX webauthn_credentials_i_1 ON public.webauthn_credentials USING btree (tenants_id, users_id);


--
-- Name: application_daily_active_users application_daily_active_users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_daily_active_users
    ADD CONSTRAINT application_daily_active_users_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_monthly_active_users application_monthly_active_users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_monthly_active_users
    ADD CONSTRAINT application_monthly_active_users_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_oauth_scopes application_oauth_scopes_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_oauth_scopes
    ADD CONSTRAINT application_oauth_scopes_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_registration_counts application_registration_counts_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_registration_counts
    ADD CONSTRAINT application_registration_counts_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_roles application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: applications applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_1 FOREIGN KEY (verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_10; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_10 FOREIGN KEY (email_verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_11; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_11 FOREIGN KEY (forgot_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_12; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_12 FOREIGN KEY (passwordless_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_13; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_13 FOREIGN KEY (set_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_14; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_14 FOREIGN KEY (samlv2_default_verification_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_15; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_15 FOREIGN KEY (admin_registration_forms_id) REFERENCES public.forms(id);


--
-- Name: applications applications_fk_16; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_16 FOREIGN KEY (samlv2_logout_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_17; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_17 FOREIGN KEY (samlv2_logout_default_verification_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_18; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_18 FOREIGN KEY (samlv2_single_logout_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_19; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_19 FOREIGN KEY (multi_factor_email_message_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: applications applications_fk_20; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_20 FOREIGN KEY (multi_factor_sms_message_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_21; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_21 FOREIGN KEY (self_service_user_forms_id) REFERENCES public.forms(id);


--
-- Name: applications applications_fk_22; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_22 FOREIGN KEY (themes_id) REFERENCES public.themes(id);


--
-- Name: applications applications_fk_23; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_23 FOREIGN KEY (email_verified_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_24; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_24 FOREIGN KEY (login_new_device_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_25; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_25 FOREIGN KEY (login_suspicious_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_26; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_26 FOREIGN KEY (password_reset_success_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_27; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_27 FOREIGN KEY (ui_ip_access_control_lists_id) REFERENCES public.ip_access_control_lists(id);


--
-- Name: applications applications_fk_28; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_28 FOREIGN KEY (email_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_29; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_29 FOREIGN KEY (login_id_in_use_on_create_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_3 FOREIGN KEY (access_token_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_30; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_30 FOREIGN KEY (login_id_in_use_on_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_31; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_31 FOREIGN KEY (password_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_32; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_32 FOREIGN KEY (two_factor_method_add_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_33; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_33 FOREIGN KEY (two_factor_method_remove_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_34; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_34 FOREIGN KEY (self_service_registration_validation_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_35; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_35 FOREIGN KEY (userinfo_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_4 FOREIGN KEY (id_token_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_5; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_5 FOREIGN KEY (samlv2_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_6; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_6 FOREIGN KEY (samlv2_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_7; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_7 FOREIGN KEY (access_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_8; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_8 FOREIGN KEY (id_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_9; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_9 FOREIGN KEY (forms_id) REFERENCES public.forms(id);


--
-- Name: asynchronous_tasks asynchronous_tasks_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_fk_1 FOREIGN KEY (nodes_id) REFERENCES public.nodes(id);


--
-- Name: authentication_keys authentication_keys_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: authentication_keys authentication_keys_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_fk_2 FOREIGN KEY (ip_access_control_lists_id) REFERENCES public.ip_access_control_lists(id);


--
-- Name: breached_password_metrics breached_password_metrics_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.breached_password_metrics
    ADD CONSTRAINT breached_password_metrics_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: clean_speak_applications clean_speak_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.clean_speak_applications
    ADD CONSTRAINT clean_speak_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: connectors connectors_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_fk_1 FOREIGN KEY (ssl_certificate_keys_id) REFERENCES public.keys(id);


--
-- Name: connectors connectors_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_fk_2 FOREIGN KEY (reconcile_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: connectors_tenants connectors_tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_fk_1 FOREIGN KEY (connectors_id) REFERENCES public.connectors(id);


--
-- Name: connectors_tenants connectors_tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: consents consents_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_fk_1 FOREIGN KEY (consent_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: consents consents_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_fk_2 FOREIGN KEY (email_plus_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: entities entities_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_fk_1 FOREIGN KEY (entity_types_id) REFERENCES public.entity_types(id) ON DELETE CASCADE;


--
-- Name: entities entities_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_fk_2 FOREIGN KEY (parent_id) REFERENCES public.entities(id) ON DELETE CASCADE;


--
-- Name: entities entities_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_fk_3 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: entity_entity_grant_permissions entity_entity_grant_permissions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_entity_grant_permissions
    ADD CONSTRAINT entity_entity_grant_permissions_fk_1 FOREIGN KEY (entity_entity_grants_id) REFERENCES public.entity_entity_grants(id) ON DELETE CASCADE;


--
-- Name: entity_entity_grant_permissions entity_entity_grant_permissions_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_entity_grant_permissions
    ADD CONSTRAINT entity_entity_grant_permissions_fk_2 FOREIGN KEY (entity_type_permissions_id) REFERENCES public.entity_type_permissions(id) ON DELETE CASCADE;


--
-- Name: entity_entity_grants entity_entity_grants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_entity_grants
    ADD CONSTRAINT entity_entity_grants_fk_1 FOREIGN KEY (recipient_id) REFERENCES public.entities(id) ON DELETE CASCADE;


--
-- Name: entity_entity_grants entity_entity_grants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_entity_grants
    ADD CONSTRAINT entity_entity_grants_fk_2 FOREIGN KEY (target_id) REFERENCES public.entities(id) ON DELETE CASCADE;


--
-- Name: entity_type_permissions entity_type_permissions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_type_permissions
    ADD CONSTRAINT entity_type_permissions_fk_1 FOREIGN KEY (entity_types_id) REFERENCES public.entity_types(id) ON DELETE CASCADE;


--
-- Name: entity_types entity_types_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_types
    ADD CONSTRAINT entity_types_fk_1 FOREIGN KEY (access_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: entity_user_grant_permissions entity_user_grant_permissions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_user_grant_permissions
    ADD CONSTRAINT entity_user_grant_permissions_fk_1 FOREIGN KEY (entity_user_grants_id) REFERENCES public.entity_user_grants(id) ON DELETE CASCADE;


--
-- Name: entity_user_grant_permissions entity_user_grant_permissions_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_user_grant_permissions
    ADD CONSTRAINT entity_user_grant_permissions_fk_2 FOREIGN KEY (entity_type_permissions_id) REFERENCES public.entity_type_permissions(id) ON DELETE CASCADE;


--
-- Name: entity_user_grants entity_user_grants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_user_grants
    ADD CONSTRAINT entity_user_grants_fk_1 FOREIGN KEY (entities_id) REFERENCES public.entities(id) ON DELETE CASCADE;


--
-- Name: entity_user_grants entity_user_grants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.entity_user_grants
    ADD CONSTRAINT entity_user_grants_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: external_identifiers external_identifiers_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: external_identifiers external_identifiers_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_2 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: external_identifiers external_identifiers_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_3 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: families families_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: federated_domains federated_domains_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.federated_domains
    ADD CONSTRAINT federated_domains_fk_1 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: form_fields form_fields_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_fk_1 FOREIGN KEY (consents_id) REFERENCES public.consents(id);


--
-- Name: form_steps form_steps_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_fk_1 FOREIGN KEY (forms_id) REFERENCES public.forms(id);


--
-- Name: form_steps form_steps_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_fk_2 FOREIGN KEY (form_fields_id) REFERENCES public.form_fields(id);


--
-- Name: group_application_roles group_application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_fk_1 FOREIGN KEY (groups_id) REFERENCES public.groups(id);


--
-- Name: group_application_roles group_application_roles_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_fk_2 FOREIGN KEY (application_roles_id) REFERENCES public.application_roles(id);


--
-- Name: group_members group_members_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: group_members group_members_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_fk_2 FOREIGN KEY (groups_id) REFERENCES public.groups(id);


--
-- Name: groups groups_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: hourly_logins hourly_logins_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.hourly_logins
    ADD CONSTRAINT hourly_logins_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: identities identities_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: identities identities_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: identity_provider_links identity_provider_links_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_provider_links
    ADD CONSTRAINT identity_provider_links_fk_1 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: identity_provider_links identity_provider_links_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_provider_links
    ADD CONSTRAINT identity_provider_links_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: identity_provider_links identity_provider_links_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_provider_links
    ADD CONSTRAINT identity_provider_links_fk_3 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_2 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_3 FOREIGN KEY (keys_id) REFERENCES public.keys(id);


--
-- Name: identity_providers identity_providers_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_1 FOREIGN KEY (keys_id) REFERENCES public.keys(id);


--
-- Name: identity_providers identity_providers_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_2 FOREIGN KEY (reconcile_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: identity_providers identity_providers_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_3 FOREIGN KEY (request_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: identity_providers_tenants identity_providers_tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers_tenants
    ADD CONSTRAINT identity_providers_tenants_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: identity_providers_tenants identity_providers_tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers_tenants
    ADD CONSTRAINT identity_providers_tenants_fk_2 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: previous_passwords previous_passwords_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.previous_passwords
    ADD CONSTRAINT previous_passwords_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: raw_logins raw_logins_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_logins
    ADD CONSTRAINT raw_logins_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: raw_logins raw_logins_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_logins
    ADD CONSTRAINT raw_logins_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: refresh_tokens refresh_tokens_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: refresh_tokens refresh_tokens_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_fk_2 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: refresh_tokens refresh_tokens_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_fk_3 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: request_frequencies request_frequencies_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.request_frequencies
    ADD CONSTRAINT request_frequencies_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: scim_external_id_groups scim_external_id_groups_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.scim_external_id_groups
    ADD CONSTRAINT scim_external_id_groups_fk_1 FOREIGN KEY (entities_id) REFERENCES public.entities(id);


--
-- Name: scim_external_id_groups scim_external_id_groups_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.scim_external_id_groups
    ADD CONSTRAINT scim_external_id_groups_fk_2 FOREIGN KEY (groups_id) REFERENCES public.groups(id);


--
-- Name: scim_external_id_users scim_external_id_users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.scim_external_id_users
    ADD CONSTRAINT scim_external_id_users_fk_1 FOREIGN KEY (entities_id) REFERENCES public.entities(id);


--
-- Name: scim_external_id_users scim_external_id_users_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.scim_external_id_users
    ADD CONSTRAINT scim_external_id_users_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: tenants tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_1 FOREIGN KEY (forgot_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_10; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_10 FOREIGN KEY (access_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: tenants tenants_fk_11; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_11 FOREIGN KEY (id_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: tenants tenants_fk_12; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_12 FOREIGN KEY (admin_user_forms_id) REFERENCES public.forms(id);


--
-- Name: tenants tenants_fk_13; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_13 FOREIGN KEY (multi_factor_email_message_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_14; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_14 FOREIGN KEY (multi_factor_sms_message_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_15; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_15 FOREIGN KEY (multi_factor_sms_messengers_id) REFERENCES public.messengers(id);


--
-- Name: tenants tenants_fk_16; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_16 FOREIGN KEY (client_credentials_access_token_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_17; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_17 FOREIGN KEY (email_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_18; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_18 FOREIGN KEY (email_verified_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_19; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_19 FOREIGN KEY (login_id_in_use_on_create_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_2 FOREIGN KEY (set_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_20; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_20 FOREIGN KEY (login_id_in_use_on_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_21; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_21 FOREIGN KEY (login_new_device_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_22; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_22 FOREIGN KEY (login_suspicious_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_23; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_23 FOREIGN KEY (password_reset_success_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_24; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_24 FOREIGN KEY (password_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_25; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_25 FOREIGN KEY (two_factor_method_add_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_26; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_26 FOREIGN KEY (two_factor_method_remove_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_27; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_27 FOREIGN KEY (ui_ip_access_control_lists_id) REFERENCES public.ip_access_control_lists(id);


--
-- Name: tenants tenants_fk_28; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_28 FOREIGN KEY (scim_client_entity_types_id) REFERENCES public.entity_types(id);


--
-- Name: tenants tenants_fk_29; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_29 FOREIGN KEY (scim_enterprise_user_request_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_3 FOREIGN KEY (verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_30; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_30 FOREIGN KEY (scim_enterprise_user_response_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_31; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_31 FOREIGN KEY (scim_group_request_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_32; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_32 FOREIGN KEY (scim_group_response_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_33; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_33 FOREIGN KEY (scim_server_entity_types_id) REFERENCES public.entity_types(id);


--
-- Name: tenants tenants_fk_34; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_34 FOREIGN KEY (scim_user_request_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_35; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_35 FOREIGN KEY (scim_user_response_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_4 FOREIGN KEY (passwordless_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_5; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_5 FOREIGN KEY (confirm_child_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_6; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_6 FOREIGN KEY (family_request_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_7; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_7 FOREIGN KEY (parent_registration_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_8; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_8 FOREIGN KEY (failed_authentication_user_actions_id) REFERENCES public.user_actions(id);


--
-- Name: tenants tenants_fk_9; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_9 FOREIGN KEY (themes_id) REFERENCES public.themes(id);


--
-- Name: user_action_logs_applications user_action_logs_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs_applications
    ADD CONSTRAINT user_action_logs_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id) ON DELETE CASCADE;


--
-- Name: user_action_logs_applications user_action_logs_applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs_applications
    ADD CONSTRAINT user_action_logs_applications_fk_2 FOREIGN KEY (user_action_logs_id) REFERENCES public.user_action_logs(id) ON DELETE CASCADE;


--
-- Name: user_action_logs user_action_logs_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_1 FOREIGN KEY (actioner_users_id) REFERENCES public.users(id);


--
-- Name: user_action_logs user_action_logs_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_2 FOREIGN KEY (actionee_users_id) REFERENCES public.users(id);


--
-- Name: user_action_logs user_action_logs_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_3 FOREIGN KEY (user_actions_id) REFERENCES public.user_actions(id);


--
-- Name: user_actions user_actions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_1 FOREIGN KEY (cancel_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_2 FOREIGN KEY (end_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_3 FOREIGN KEY (modify_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_4 FOREIGN KEY (start_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_comments user_comments_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: user_comments user_comments_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_fk_2 FOREIGN KEY (commenter_id) REFERENCES public.users(id);


--
-- Name: user_consents_email_plus user_consents_email_plus_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents_email_plus
    ADD CONSTRAINT user_consents_email_plus_fk_1 FOREIGN KEY (user_consents_id) REFERENCES public.user_consents(id);


--
-- Name: user_consents user_consents_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_1 FOREIGN KEY (consents_id) REFERENCES public.consents(id);


--
-- Name: user_consents user_consents_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_2 FOREIGN KEY (giver_users_id) REFERENCES public.users(id);


--
-- Name: user_consents user_consents_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_3 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_fk_1 FOREIGN KEY (user_registrations_id) REFERENCES public.user_registrations(id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_fk_2 FOREIGN KEY (application_roles_id) REFERENCES public.application_roles(id);


--
-- Name: user_registrations user_registrations_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: user_registrations user_registrations_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: users users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: webauthn_credentials webauthn_credentials_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: webauthn_credentials webauthn_credentials_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: webhooks webhooks_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_fk_1 FOREIGN KEY (ssl_certificate_keys_id) REFERENCES public.keys(id);


--
-- Name: webhooks webhooks_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_fk_2 FOREIGN KEY (signing_keys_id) REFERENCES public.keys(id);


--
-- Name: webhooks_tenants webhooks_tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks_tenants
    ADD CONSTRAINT webhooks_tenants_fk_1 FOREIGN KEY (webhooks_id) REFERENCES public.webhooks(id);


--
-- Name: webhooks_tenants webhooks_tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks_tenants
    ADD CONSTRAINT webhooks_tenants_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT CREATE ON SCHEMA public TO fusionauth;


--
-- PostgreSQL database dump complete
--

