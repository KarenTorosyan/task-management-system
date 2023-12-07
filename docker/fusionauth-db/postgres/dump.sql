--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Debian 12.9-1.pgdg110+1)
-- Dumped by pg_dump version 12.9 (Debian 12.9-1.pgdg110+1)

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


ALTER TABLE public.audit_logs_id_seq OWNER TO fusionauth;

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


ALTER TABLE public.event_logs_id_seq OWNER TO fusionauth;

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


ALTER TABLE public.identities_id_seq OWNER TO fusionauth;

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


ALTER TABLE public.raw_application_registration_counts_id_seq OWNER TO fusionauth;

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


ALTER TABLE public.raw_global_registration_counts_id_seq OWNER TO fusionauth;

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


ALTER TABLE public.user_consents_email_plus_id_seq OWNER TO fusionauth;

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
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	19697
22adff03-0643-4cc9-9747-57284615c848	1	19697
\.


--
-- Data for Name: application_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_monthly_active_users (applications_id, count, month) FROM stdin;
22adff03-0643-4cc9-9747-57284615c848	1	647
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	647
\.


--
-- Data for Name: application_registration_counts; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_registration_counts (applications_id, count, decremented_count, hour) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	0	472738
22adff03-0643-4cc9-9747-57284615c848	1	0	472745
\.


--
-- Data for Name: application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_roles (id, applications_id, description, insert_instant, is_default, is_super_role, last_update_instant, name) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb8236e2	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Global admin	1701859008467	f	t	1701859008467	admin
631ecd9d-8d40-4c13-8277-80cedb8236e3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	API key manager	1701859008467	f	f	1701859008467	api_key_manager
631ecd9d-8d40-4c13-8277-80cedb8236e4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Application deleter	1701859008467	f	f	1701859008467	application_deleter
631ecd9d-8d40-4c13-8277-80cedb8236e5	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Application manager	1701859008467	f	f	1701859008467	application_manager
631ecd9d-8d40-4c13-8277-80cedb8236e6	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Audit log viewer	1701859008467	f	f	1701859008467	audit_log_viewer
631ecd9d-8d40-4c13-8277-80cedb8236e7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Email template manager	1701859008467	f	f	1701859008467	email_template_manager
631ecd9d-8d40-4c13-8277-80cedb8236e8	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Report viewer	1701859008467	f	f	1701859008467	report_viewer
631ecd9d-8d40-4c13-8277-80cedb8236e9	3c219e58-ed0e-4b18-ad48-f4f92793ae32	System configuration manager	1701859008467	f	f	1701859008467	system_manager
631ecd9d-8d40-4c13-8277-80cedb8236f0	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User action deleter	1701859008467	f	f	1701859008467	user_action_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f1	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User action manager	1701859008467	f	f	1701859008467	user_action_manager
631ecd9d-8d40-4c13-8277-80cedb8236f2	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User deleter	1701859008467	f	f	1701859008467	user_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User manager	1701859008467	f	f	1701859008467	user_manager
631ecd9d-8d40-4c13-8277-80cedb8236f4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Webhook manager	1701859008467	f	f	1701859008467	webhook_manager
631ecd9d-8d40-4c13-8277-80cedb8236f5	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Group manager	1701859008467	f	f	1701859008467	group_manager
631ecd9d-8d40-4c13-8277-80cedb8236f6	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Group deleter	1701859008467	f	f	1701859008467	group_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Tenant manager	1701859008467	f	f	1701859008467	tenant_manager
631ecd9d-8d40-4c13-8277-80cedb8236f8	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Tenant deleter	1701859008467	f	f	1701859008467	tenant_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f9	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Lambda manager	1701859008467	f	f	1701859008467	lambda_manager
631ecd9d-8d40-4c13-8277-80cedb8236fa	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Event log viewer	1701859008467	f	f	1701859008467	event_log_viewer
631ecd9d-8d40-4c13-8277-80cedb8236fb	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Key manager	1701859008467	f	f	1701859008467	key_manager
631ecd9d-8d40-4c13-8277-80cedb8236fc	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Consent deleter	1701859008467	f	f	1701859008467	consent_deleter
631ecd9d-8d40-4c13-8277-80cedb8236fd	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Consent manager	1701859008467	f	f	1701859008467	consent_manager
631ecd9d-8d40-4c13-8277-80cedb8236fe	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Theme manager	1701859008467	f	f	1701859008467	theme_manager
631ecd9d-8d40-4c13-8277-80cedb8236ff	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Reactor manager	1701859008467	f	f	1701859008467	reactor_manager
631ecd9d-8d40-4c13-8277-80cedb823700	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Connector deleter	1701859008467	f	f	1701859008467	connector_deleter
631ecd9d-8d40-4c13-8277-80cedb823701	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Connector manager	1701859008467	f	f	1701859008467	connector_manager
631ecd9d-8d40-4c13-8277-80cedb823702	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Form deleter	1701859008467	f	f	1701859008467	form_deleter
631ecd9d-8d40-4c13-8277-80cedb823703	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Form manager	1701859008467	f	f	1701859008467	form_manager
631ecd9d-8d40-4c13-8277-80cedb823704	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User support manager	1701859008467	f	f	1701859008467	user_support_manager
631ecd9d-8d40-4c13-8277-80cedb823705	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User support viewer	1701859008467	f	f	1701859008467	user_support_viewer
631ecd9d-8d40-4c13-8277-80cedb823706	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Entity manager	1701859008467	f	f	1701859008467	entity_manager
631ecd9d-8d40-4c13-8277-80cedb823707	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Messenger deleter	1701859008467	f	f	1701859008467	messenger_deleter
631ecd9d-8d40-4c13-8277-80cedb823708	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Messenger manager	1701859008467	f	f	1701859008467	messenger_manager
631ecd9d-8d40-4c13-8277-80cedb823709	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Message template deleter	1701859008467	f	f	1701859008467	message_template_deleter
631ecd9d-8d40-4c13-8277-80cedb823710	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Message template manager	1701859008467	f	f	1701859008467	message_template_manager
631ecd9d-8d40-4c13-8277-80cedb823711	3c219e58-ed0e-4b18-ad48-f4f92793ae32	ACL deleter	1701859008467	f	f	1701859008467	acl_deleter
631ecd9d-8d40-4c13-8277-80cedb823712	3c219e58-ed0e-4b18-ad48-f4f92793ae32	ACL manager	1701859008467	f	f	1701859008467	acl_manager
ecc7fd2d-099e-4ca1-b03a-025b2a2dc6b7	22adff03-0643-4cc9-9747-57284615c848	Role for administrators	1701861866625	f	t	1701861866625	admin
e67f18fc-45a3-499a-8ef2-d6865270ecca	22adff03-0643-4cc9-9747-57284615c848	Role for users	1701861866625	t	f	1701861866625	user
\.


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.applications (id, access_token_populate_lambdas_id, access_token_signing_keys_id, active, admin_registration_forms_id, data, email_update_email_templates_id, email_verification_email_templates_id, email_verified_email_templates_id, forgot_password_email_templates_id, forms_id, id_token_populate_lambdas_id, id_token_signing_keys_id, insert_instant, last_update_instant, login_id_in_use_on_create_email_templates_id, login_id_in_use_on_update_email_templates_id, login_new_device_email_templates_id, login_suspicious_email_templates_id, multi_factor_email_message_templates_id, multi_factor_sms_message_templates_id, name, passwordless_email_templates_id, password_update_email_templates_id, password_reset_success_email_templates_id, samlv2_default_verification_keys_id, samlv2_issuer, samlv2_keys_id, samlv2_logout_keys_id, samlv2_logout_default_verification_keys_id, samlv2_populate_lambdas_id, samlv2_single_logout_keys_id, self_service_registration_validation_lambdas_id, self_service_user_forms_id, set_password_email_templates_id, tenants_id, themes_id, two_factor_method_add_email_templates_id, two_factor_method_remove_email_templates_id, ui_ip_access_control_lists_id, verification_email_templates_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	\N	7bf52868-38db-81b7-ca8c-ab898afc721c	t	ebdba871-f2af-c17d-0249-702b24fe4213	{"jwtConfiguration": {"enabled": true, "timeToLiveInSeconds": 60, "refreshTokenExpirationPolicy": "SlidingWindow", "refreshTokenTimeToLiveInMinutes": 60, "refreshTokenUsagePolicy": "OneTimeUse"},"registrationConfiguration": {"type":"basic"}, "oauthConfiguration": {"authorizedRedirectURLs": ["/admin/login"], "clientId": "3c219e58-ed0e-4b18-ad48-f4f92793ae32", "clientSecret": "YzA4ZjcwOGU3YThjN2Q5ZDViN2RmMzdkOTY0Y2ZiNmI3NThmZDk1YmQ3NzMzYmFmMjZmMjMwZjBmOGU4ZWExNQ==", "enabledGrants": ["authorization_code", "refresh_token"], "logoutURL": "/admin/single-logout", "generateRefreshTokens": true, "clientAuthenticationPolicy": "Required", "proofKeyForCodeExchangePolicy": "Required" },"loginConfiguration": {"allowTokenRefresh": false, "generateRefreshTokens": false, "requireAuthentication": true},"unverified":{ "behavior": "Allow" },"verificationStrategy":"ClickableLink","state": "Active"}	\N	\N	\N	\N	\N	\N	092dbedc-30af-4149-9c61-b578f2c72f59	1701859008467	1701859008467	\N	\N	\N	\N	\N	\N	FusionAuth	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	c860edcc-cf1a-a78f-bfa1-81853ade8216	\N	\N	\N	\N	\N
22adff03-0643-4cc9-9747-57284615c848	\N	5d0c5b8c-d7c5-46cc-b19a-3917d5335f43	t	ebdba871-f2af-c17d-0249-702b24fe4213	{"accessControlConfiguration":{},"authenticationTokenConfiguration":{"enabled":false},"data":{},"externalIdentifierConfiguration":{},"formConfiguration":{"selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"jwtConfiguration":{"enabled":true,"refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"oauthConfiguration":{"authorizedOriginURLs":["http://localhost:8080"],"authorizedRedirectURLs":["http://localhost:8080","http://localhost:8080/swagger-ui/oauth2-redirect.html"],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"NotRequiredWhenUsingPKCE","clientId":"22adff03-0643-4cc9-9747-57284615c848","clientSecret":"AGCQcibgnx3yxsxyubricntNYQXbklrTsp5dz0kWOCQ","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"Required","requireClientAuthentication":true,"requireRegistration":false},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":true,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"state":"Active","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}}	\N	\N	\N	\N	\N	\N	092dbedc-30af-4149-9c61-b578f2c72f59	1701861866625	1701884759344	\N	\N	\N	\N	\N	\N	Task Management System	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ead085c7-7183-4ac7-8356-f3dab5316ad0	\N	\N	\N	\N	\N
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
1	1701861439934	admin@email.com	Updated the system configuration	{"data":{},"newValue":{"auditLogConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"corsConfiguration":{"allowCredentials":false,"allowedHeaders":["Accept","Access-Control-Request-Headers","Access-Control-Request-Method","Authorization","Content-Type","Last-Modified","Origin","X-FusionAuth-TenantId","X-Requested-With"],"allowedMethods":["OPTIONS","HEAD","POST","PATCH","DELETE","PUT","GET"],"allowedOrigins":["http://localhost:8080"],"debug":false,"enabled":true,"exposedHeaders":[],"preflightMaxAgeInSeconds":0},"data":{},"eventLogConfiguration":{"numberToRetain":10000},"insertInstant":1701859008467,"lastUpdateInstant":1701861439867,"loginRecordConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"reportTimezone":"America/Denver","uiConfiguration":{}},"oldValue":{"auditLogConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"corsConfiguration":{"allowCredentials":false,"allowedHeaders":[],"allowedMethods":[],"allowedOrigins":[],"debug":false,"enabled":false,"exposedHeaders":[],"preflightMaxAgeInSeconds":0},"data":{},"eventLogConfiguration":{"numberToRetain":10000},"insertInstant":1701859008467,"lastUpdateInstant":1701859008467,"loginRecordConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"reportTimezone":"America/Denver","uiConfiguration":{}},"reason":"FusionAuth User Interface"}
2	1701861498837	admin@email.com	Generated new key with Id [5d0c5b8c-d7c5-46cc-b19a-3917d5335f43]	{"data":{},"reason":"FusionAuth User Interface"}
3	1701861568115	admin@email.com	Created the identity provider with Id [82339786-3dff-42a6-aac6-1f1ceecb6c46] and name [null]	{"data":{},"reason":"FusionAuth User Interface"}
4	1701861630957	admin@email.com	Created the API key with Id [5021c383-eea2-4acc-a5ee-b5b957a18005] and a key ending [*lNwEzSM].	{"data":{},"reason":"FusionAuth User Interface"}
5	1701861713709	admin@email.com	Created the tenant with Id [ead085c7-7183-4ac7-8356-f3dab5316ad0] and name [Task Management System]	{"data":{},"reason":"FusionAuth User Interface"}
6	1701861866685	admin@email.com	Created the application with Id [22adff03-0643-4cc9-9747-57284615c848] and name [Task Management System]	{"data":{},"reason":"FusionAuth User Interface"}
7	1701861906954	admin@email.com	Updated the user with Id [0bfd843b-1b16-45e1-ba3f-0daf5da16971] and loginId [admin@email.com]	{"data":{},"newValue":{"active":true,"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","data":{},"firstName":"Chief","id":"0bfd843b-1b16-45e1-ba3f-0daf5da16971","insertInstant":1701859089368,"lastName":"[ADMIN]","lastUpdateInstant":1701861906773,"memberships":[],"passwordChangeRequired":false,"passwordLastUpdateInstant":1701859089516,"preferredLanguages":[],"registrations":[{"applicationId":"3c219e58-ed0e-4b18-ad48-f4f92793ae32","data":{},"id":"87994797-da79-4cd9-922b-d65b3d6668ce","insertInstant":1701859089526,"lastUpdateInstant":1701859089526,"preferredLanguages":[],"roles":["admin"],"tokens":{},"usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1701859089526}],"tenantId":"c860edcc-cf1a-a78f-bfa1-81853ade8216","twoFactor":{"methods":[],"recoveryCodes":[]},"uniqueUsername":"admin","username":"admin","usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1701859089368},"oldValue":{"active":true,"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","data":{},"email":"admin@email.com","encryptionScheme":"salted-pbkdf2-hmac-sha256","factor":24000,"firstName":"Chief","id":"0bfd843b-1b16-45e1-ba3f-0daf5da16971","insertInstant":1701859089368,"lastName":"[ADMIN]","lastUpdateInstant":1701859089368,"memberships":[],"passwordChangeRequired":false,"passwordLastUpdateInstant":1701859089516,"preferredLanguages":[],"registrations":[{"applicationId":"3c219e58-ed0e-4b18-ad48-f4f92793ae32","data":{},"id":"87994797-da79-4cd9-922b-d65b3d6668ce","insertInstant":1701859089526,"lastUpdateInstant":1701859089526,"preferredLanguages":[],"roles":["admin"],"tokens":{},"usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1701859089526}],"tenantId":"c860edcc-cf1a-a78f-bfa1-81853ade8216","twoFactor":{"methods":[],"recoveryCodes":[]},"usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1701859089368},"reason":"FusionAuth User Interface"}
8	1701862478573	admin	Created user with Id [2dddb481-aa03-47a7-b926-9eec08bf1d39], name [null] and loginId [testuser]	{"data":{},"reason":"FusionAuth User Interface"}
9	1701862518323	admin	Created the group with Id [64eeac28-ac34-4719-a00b-12468ad940af] and name [admins]	{"data":{},"reason":"FusionAuth User Interface"}
10	1701862534404	admin	Created the group with Id [f45d191f-f0ce-469f-aa06-cca9ae524c81] and name [users]	{"data":{},"reason":"FusionAuth User Interface"}
11	1701862577760	admin	Updated the user with Id [2dddb481-aa03-47a7-b926-9eec08bf1d39] and loginId [testuser]	{"data":{},"newValue":{"active":true,"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","data":{},"fullName":"User","id":"2dddb481-aa03-47a7-b926-9eec08bf1d39","insertInstant":1701862478227,"lastLoginInstant":1701862478227,"lastUpdateInstant":1701862577680,"memberships":[],"passwordChangeRequired":false,"passwordLastUpdateInstant":1701862478408,"preferredLanguages":[],"registrations":[],"tenantId":"ead085c7-7183-4ac7-8356-f3dab5316ad0","twoFactor":{"methods":[],"recoveryCodes":[]},"uniqueUsername":"testuser","username":"testuser","usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1701862478227},"oldValue":{"active":true,"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","data":{},"encryptionScheme":"salted-pbkdf2-hmac-sha256","factor":24000,"id":"2dddb481-aa03-47a7-b926-9eec08bf1d39","insertInstant":1701862478227,"lastLoginInstant":1701862478227,"lastUpdateInstant":1701862478227,"memberships":[],"passwordChangeRequired":false,"passwordLastUpdateInstant":1701862478408,"preferredLanguages":[],"registrations":[],"tenantId":"ead085c7-7183-4ac7-8356-f3dab5316ad0","twoFactor":{"methods":[],"recoveryCodes":[]},"uniqueUsername":"testuser","username":"testuser","usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1701862478227},"reason":"FusionAuth User Interface"}
12	1701862597303	admin	Updated the user with Id [2dddb481-aa03-47a7-b926-9eec08bf1d39] and loginId [testuser]	{"data":{},"newValue":{"active":true,"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","data":{},"firstName":"User","fullName":"User","id":"2dddb481-aa03-47a7-b926-9eec08bf1d39","insertInstant":1701862478227,"lastLoginInstant":1701862478227,"lastUpdateInstant":1701862597229,"memberships":[],"passwordChangeRequired":false,"passwordLastUpdateInstant":1701862478408,"preferredLanguages":[],"registrations":[],"tenantId":"ead085c7-7183-4ac7-8356-f3dab5316ad0","twoFactor":{"methods":[],"recoveryCodes":[]},"uniqueUsername":"testuser","username":"testuser","usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1701862478227},"oldValue":{"active":true,"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","data":{},"encryptionScheme":"salted-pbkdf2-hmac-sha256","factor":24000,"fullName":"User","id":"2dddb481-aa03-47a7-b926-9eec08bf1d39","insertInstant":1701862478227,"lastLoginInstant":1701862478227,"lastUpdateInstant":1701862577680,"memberships":[],"passwordChangeRequired":false,"passwordLastUpdateInstant":1701862478408,"preferredLanguages":[],"registrations":[],"tenantId":"ead085c7-7183-4ac7-8356-f3dab5316ad0","twoFactor":{"methods":[],"recoveryCodes":[]},"uniqueUsername":"testuser","username":"testuser","usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1701862478227},"reason":"FusionAuth User Interface"}
13	1701884759408	admin	Updated the application with Id [22adff03-0643-4cc9-9747-57284615c848] and name [Task Management System]	{"data":{},"newValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"ebdba871-f2af-c17d-0249-702b24fe4213","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"22adff03-0643-4cc9-9747-57284615c848","insertInstant":1701861866625,"jwtConfiguration":{"accessTokenKeyId":"5d0c5b8c-d7c5-46cc-b19a-3917d5335f43","enabled":true,"idTokenKeyId":"092dbedc-30af-4149-9c61-b578f2c72f59","refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1701884759344,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"Task Management System","oauthConfiguration":{"authorizedOriginURLs":["http://localhost:8080"],"authorizedRedirectURLs":["http://localhost:8080","http://localhost:8080/swagger-ui/oauth2-redirect.html"],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"NotRequiredWhenUsingPKCE","clientId":"22adff03-0643-4cc9-9747-57284615c848","clientSecret":"AGCQcibgnx3yxsxyubricntNYQXbklrTsp5dz0kWOCQ","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"Required","requireClientAuthentication":true,"requireRegistration":false},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":true,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[{"description":"Role for administrators","id":"ecc7fd2d-099e-4ca1-b03a-025b2a2dc6b7","insertInstant":1701861866625,"isDefault":false,"isSuperRole":true,"lastUpdateInstant":1701861866625,"name":"admin"},{"description":"Role for users","id":"e67f18fc-45a3-499a-8ef2-d6865270ecca","insertInstant":1701861866625,"isDefault":true,"isSuperRole":false,"lastUpdateInstant":1701861866625,"name":"user"}],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"state":"Active","tenantId":"ead085c7-7183-4ac7-8356-f3dab5316ad0","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"oldValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"ebdba871-f2af-c17d-0249-702b24fe4213","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"22adff03-0643-4cc9-9747-57284615c848","insertInstant":1701861866625,"jwtConfiguration":{"accessTokenKeyId":"5d0c5b8c-d7c5-46cc-b19a-3917d5335f43","enabled":true,"idTokenKeyId":"092dbedc-30af-4149-9c61-b578f2c72f59","refreshTokenExpirationPolicy":"Fixed","refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1701861866625,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"Task Management System","oauthConfiguration":{"authorizedOriginURLs":["http://localhost:8080"],"authorizedRedirectURLs":["http://localhost:8080"],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"NotRequiredWhenUsingPKCE","clientId":"22adff03-0643-4cc9-9747-57284615c848","clientSecret":"AGCQcibgnx3yxsxyubricntNYQXbklrTsp5dz0kWOCQ","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"Required","requireClientAuthentication":true,"requireRegistration":false},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":true,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[{"description":"Role for administrators","id":"ecc7fd2d-099e-4ca1-b03a-025b2a2dc6b7","insertInstant":1701861866625,"isDefault":false,"isSuperRole":true,"lastUpdateInstant":1701861866625,"name":"admin"},{"description":"Role for users","id":"e67f18fc-45a3-499a-8ef2-d6865270ecca","insertInstant":1701861866625,"isDefault":true,"isSuperRole":false,"lastUpdateInstant":1701861866625,"name":"user"}],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"state":"Active","tenantId":"ead085c7-7183-4ac7-8356-f3dab5316ad0","unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"reason":"FusionAuth User Interface"}
14	1701885386486	admin	Updated identity provider with Id [82339786-3dff-42a6-aac6-1f1ceecb6c46] and name [null]	{"data":{},"newValue":{"applicationConfiguration":{"22adff03-0643-4cc9-9747-57284615c848":{"createRegistration":true,"enabled":true,"properties":{}},"3c219e58-ed0e-4b18-ad48-f4f92793ae32":{"createRegistration":false,"enabled":false,"properties":{}}},"buttonText":"Login with Google","client_id":"964493218511-ifim2rv4cbfto067oru7v014tmfrflrs.apps.googleusercontent.com","client_secret":"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","debug":false,"enabled":true,"lambdaConfiguration":{},"linkingStrategy":"LinkByEmail","loginMethod":"UseRedirect","properties":{"api":"# Omit the data- prefix\\r\\nauto_prompt=true\\r\\nauto_select=false\\r\\ncancel_on_tap_outside=false\\r\\ncontext=signin\\r\\nitp_support=true","button":"# Omit the data- prefix\\r\\nlogo_alignment=left\\r\\nshape=rectangular\\r\\nsize=large\\r\\ntext=signin_with\\r\\ntheme=outline\\r\\ntype=standard"},"scope":"openid profile email","tenantConfiguration":{},"type":"Google"},"oldValue":{"applicationConfiguration":{"3c219e58-ed0e-4b18-ad48-f4f92793ae32":{"createRegistration":false,"enabled":false,"properties":{}}},"buttonText":"Login with Google","client_id":"964493218511-ifim2rv4cbfto067oru7v014tmfrflrs.apps.googleusercontent.com","client_secret":"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","debug":false,"enabled":true,"id":"82339786-3dff-42a6-aac6-1f1ceecb6c46","insertInstant":1701861568038,"lambdaConfiguration":{},"lastUpdateInstant":1701861568038,"linkingStrategy":"LinkByEmail","loginMethod":"UseRedirect","name":"Google","properties":{"api":"# Omit the data- prefix\\nauto_prompt=true\\nauto_select=false\\ncancel_on_tap_outside=false\\ncontext=signin\\nitp_support=true","button":"# Omit the data- prefix\\nlogo_alignment=left\\nshape=rectangular\\nsize=large\\ntext=signin_with\\ntheme=outline\\ntype=standard"},"scope":"openid profile email","tenantConfiguration":{},"type":"Google"},"reason":"FusionAuth User Interface"}
\.


--
-- Data for Name: authentication_keys; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.authentication_keys (id, insert_instant, ip_access_control_lists_id, last_update_instant, key_manager, key_value, permissions, meta_data, tenants_id) FROM stdin;
0b97b217-68cd-bbc7-66ae-f69bf3eee6a5	1701859008467	\N	1701859008467	f	__internal_YTRkZTAyMDE2OWM0YzRiNzZhMGZjYzdhYTNhOGEyYjM3MDE2NTZkNDYxZjE1ZTU3OGRiNmI0YjEyY2M1NTRkNQ==	{"endpoints": {"/api/cache/reload": ["POST"], "/api/system/log/export": ["POST"], "/internal/webhook": ["POST"]}}	{"attributes": {"description": "Internal Use Only.", "internalCacheReloader": "true", "internalLogDownloader": "true", "internalWebhook": "true"}}	\N
5021c383-eea2-4acc-a5ee-b5b957a18005	1701861630944	\N	1701861630944	f	BXbhUu0bNhpq9Of30JKbaGlDi6gKsY9jLgrLOOYHB1yAyTRcplNwEzSM	\N	{"attributes":{"description":"Key for access sso endpoints"}}	\N
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
e3306678-a53a-4964-9040-1c96f36dda72	{}	1701859008467	1701859008467	Default	\N	\N	0
\.


--
-- Data for Name: connectors_tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.connectors_tenants (connectors_id, data, sequence, tenants_id) FROM stdin;
e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"domains":["*"],"migrate":false}	0	c860edcc-cf1a-a78f-bfa1-81853ade8216
e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"domains":["*"],"migrate":false}	0	ead085c7-7183-4ac7-8356-f3dab5316ad0
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.consents (id, consent_email_templates_id, data, insert_instant, last_update_instant, name, email_plus_email_templates_id) FROM stdin;
aa2fa106-2d9b-44da-8f0a-dce53531c3ad	\N	{"countryMinimumAgeForSelfConsent":{},"data":{},"defaultMinimumAgeForSelfConsent":13,"emailPlus":{"enabled":true,"maximumTimeToSendEmailInHours":48,"minimumTimeToSendEmailInHours":24},"multipleValuesAllowed":false,"values":[]}	1701859089637	1701859089637	COPPA Email+	\N
22933851-740e-47d4-923a-48a7f6e418cc	\N	{"countryMinimumAgeForSelfConsent":{},"data":{},"defaultMinimumAgeForSelfConsent":13,"emailPlus":{"enabled":false,"maximumTimeToSendEmailInHours":48,"minimumTimeToSendEmailInHours":24},"multipleValuesAllowed":false,"values":[]}	1701859089643	1701859089643	COPPA VPC	\N
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
db0d480d-4dc3-4bcb-9e9a-76cab3add573	\N	<p>\n The following two factor method was added to ${user.email}:\n\n  <br>\n  <strong>Method: ${method.method}</strong>\n  <br>\n  <strong>Identifier: ${method.id}</strong>\n\n</p>\n\n- FusionAuth Admin	A second factor was added	The following two factor method was added to ${user.email}:\n\n- Method: ${method.method}\n- Identifier: ${method.id}\n\n- FusionAuth Admin	\N	1701859013785	1701859013785	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication Method Added
c8046279-12e9-4962-bbc7-3fdb2015bd1e	\N	<p>\n The following two factor method was removed from ${user.email}:\n\n  <br>\n  <strong>Method: ${method.method}</strong>\n  <br>\n  <strong>Identifier: ${method.id}</strong>\n\n</p>\n\n- FusionAuth Admin	A second factor was removed	The following two factor method was removed from ${user.email}:\n\n- Method: ${method.method}\n- Identifier: ${method.id}\n\n- FusionAuth Admin	\N	1701859013791	1701859013791	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication Method Removed
06439347-0fac-4adb-a718-7122bbce1079	\N	[#-- @ftlvariable name="event" type="io.fusionauth.domain.event.UserLoginSuspiciousEvent" --]\n[#setting url_escaping_charset="UTF-8"]\n[#if event.type == "UserLoginSuspicious"]\n  <p>A suspicious login was made on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.</p>\n[#elseif event.type == "UserLoginNewDevice"]\n  <p>A login from a new device was detected on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.</p>\n[#else]\n  <p>Suspicious activity has been observed on your account. In order to secure your account, it is recommended to change your password at your earliest convenience.</p>\n[/#if]\n\n<p>Device details</p>\n<ul>\n  <li><strong>Device name:</strong> ${(event.info.deviceName)!'&mdash;'}</li>\n  <li><strong>Device description:</strong> ${(event.info.deviceDescription)!'&mdash;'}</li>\n  <li><strong>Device type:</strong> ${(event.info.deviceType)!'&mdash;'}</li>\n  <li><strong>User agent:</strong> ${(event.info.userAgent)!'&mdash;'}</li>\n</ul>\n\n<p>Event details</p>\n<ul>\n  <li><strong>IP address:</strong> ${(event.info.ipAddress)!'&mdash;'}</li>\n  <li><strong>City:</strong> ${(event.info.location.city)!'&mdash;'}</li>\n  <li><strong>Country:</strong> ${(event.info.location.country)!'&mdash;'}</li>\n  <li><strong>Zipcode:</strong> ${(event.info.location.zipcode)!'&mdash;'}</li>\n  <li><strong>Lat/long:</strong> ${(event.info.location.latitude)!'&mdash;'}/${(event.info.location.longitude)!'&mdash;'}</li>\n</ul>\n\n- FusionAuth Admin\n	Threat Detected	[#setting url_escaping_charset="UTF-8"]\n[#if event.type == "UserLoginSuspicious"]\nA suspicious login was made on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.\n[#elseif event.type == "UserLoginNewDevice"]\nA login from a new device was detected on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.\n[#else]\nSuspicious activity has been observed on your account. In order to secure your account, it is recommended to change your password at your earliest convenience.\n[/#if]\n\nDevice details\n\n* Device name: ${(event.info.deviceName)!'&mdash;'}\n* Device description: ${(event.info.deviceDescription)!'&mdash;'}\n* Device type: ${(event.info.deviceType)!'&mdash;'}\n* User agent: ${(event.info.userAgent)!'&mdash;'}\n\nEvent details\n\n* IP address: ${(event.info.ipAddress)!'-'}\n* City: ${(event.info.location.city)!'-'}\n* Country: ${(event.info.location.country)!'-'}\n* Zipcode: ${(event.info.location.zipcode)!'-'}\n* Lat/long: ${(event.info.location.latitude)!'-'}/${(event.info.location.longitude)!'-'}\n\n- FusionAuth Admin\n	\N	1701859089581	1701859089581	{}	{}	{}	{}	[FusionAuth Default] Threat Detected
4a811b12-3c9b-47b2-b745-29cf8b97bfb8	\N	[#setting url_escaping_charset="UTF-8"]\n<p>This password was found in the list of vulnerable passwords, and is no longer secure.</p>\n\n<p>In order to secure your account, it is recommended to change your password at your earliest convenience.</p>\n\n<p>Follow this link to change your password.</p>\n\n<a href="http://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}">\n  http://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}\n</a>\n\n- FusionAuth Admin	Your password is not secure	[#setting url_escaping_charset="UTF-8"]\nThis password was found in the list of vulnerable passwords, and is no longer secure.\n\nIn order to secure your account, it is recommended to change your password at your earliest convenience.\n\nFollow this link to change your password.\n\nhttp://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}\n\n- FusionAuth Admin\n\n\n	\N	1701859089583	1701859089583	{}	{}	{}	{}	[FusionAuth Default] Breached Password Notification
dc75209f-cc0f-486a-8db4-b064cb0f8383	\N	[#setting url_escaping_charset="UTF-8"]\nTo change your password click on the following link.\n<p>\n  [#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state'.\n       If we have an application context, append the client_id to ensure the correct application theme when applicable.\n  --]\n  [#assign url = "http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}" /]\n  [#list state!{} as key, value][#if key != "tenantId" && key != "client_id" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n  <a href="${url}">${url}</a>\n</p>\n- FusionAuth Admin\n	Reset your password	[#setting url_escaping_charset="UTF-8"]\nTo change your password click on the following link.\n\n  [#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state'.\n       If we have an application context, append the client_id to ensure the correct application theme when applicable.\n  --]\n[#assign url = "http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}" /]\n[#list state!{} as key, value][#if key != "tenantId" && key != "client_id" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n\n${url}\n\n- FusionAuth Admin\n	\N	1701859089584	1701859089584	{}	{}	{}	{}	[FusionAuth Default] Forgot Password
9a4dbe0b-11e7-4752-8350-40716898072a	\N	Your child has created an account with us and you need to confirm them before they are added to your family. Click the link below to confirm your child's account.\n<p>\n  <a href="http://example.com/family/confirm-child">http://example.com/family/confirm-child</a>\n</p>\n- FusionAuth Admin	Confirm your child's account	Your child has created an account with us and you need to confirm them before they are added to your family. Click the link below to confirm your child's account.\n\nhttp://example.com/family/confirm-child\n\n- FusionAuth Admin	\N	1701859089586	1701859089586	{}	{}	{}	{}	[FusionAuth Default] Confirm Child Account
f6990a70-b7fd-4e27-a889-8311fe6c1de1	\N	A while ago, you granted your child consent in our system. This email is a second notice of this consent as required by law and also to remind to that you can revoke this consent at anytime on our website or by clicking the link below:\n<p>\n  <a href="http://example.com/consent/manage">http://example.com/consent/manage</a>\n</p>\n- FusionAuth Admin	Reminder: Notice of your consent	A while ago, you granted your child consent in our system. This email is a second notice of this consent as required by law and also to remind to that you can revoke this consent at anytime on our website or by clicking the link below:\n\nhttp://example.com/consent/manage\n\n- FusionAuth Admin	\N	1701859089588	1701859089588	{}	{}	{}	{}	[FusionAuth Default] COPPA Notice Reminder
e64a3713-0c83-4b03-9a8b-4d05c908d857	\N	You recently granted your child consent in our system. This email is to notify you of this consent. If you did not grant this consent or wish to revoke this consent, click the link below:\n<p>\n  <a href="http://example.com/consent/manage">http://example.com/consent/manage</a>\n</p>\n- FusionAuth Admin	Notice of your consent	You recently granted your child consent in our system. This email is to notify you of this consent. If you did not grant this consent or wish to revoke this consent, click the link below:\n\nhttp://example.com/consent/manage\n\n- FusionAuth Admin	\N	1701859089590	1701859089590	{}	{}	{}	{}	[FusionAuth Default] COPPA Notice
813c7ce9-0d6c-4f3b-9fde-928a47b6b914	\N	[#if user.verified]\nPro tip, your email has already been verified, but feel free to complete the verification process to verify your verification of your email address.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the email address can be verified --]\n[#if verificationOneTimeCode??]\n<p>To complete your email verification enter this code into the email verification form.</p>\n<p> ${verificationOneTimeCode} </p>\n[#else]\nTo complete your email verification click on the following link.\n<p>\n  <a href="http://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&postMethod=true&tenantId=${user.tenantId}">\n    http://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&postMethod=true&tenantId=${user.tenantId}\n  </a>\n</p>\n[/#if]\n\n- FusionAuth Admin	Verify your FusionAuth email address	[#if user.verified]\nPro tip, your email has already been verified, but feel free to complete the verification process to verify your verification of your email address.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the email address can be verified --]\n[#if verificationOneTimeCode??]\nTo complete your email verification enter this code into the email verification form.\n\n${verificationOneTimeCode}\n[#else]\nTo complete your email verification click on the following link.\n\nhttp://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&postMethod=true&tenantId=${user.tenantId}\n[/#if]\n\n- FusionAuth Admin	\N	1701859089591	1701859089591	{}	{}	{}	{}	[FusionAuth Default] Email Verification
621ad8ec-cff9-4b91-b4e1-2d0b9c7f4b53	\N	Your child has created an account with us and needs you to create an account and verify them. You can sign up using the link below:\n<p>\n  <a href="http://example.com/family/confirm-child">http://example.com/family/confirm-child</a>\n</p>\n- FusionAuth Admin	Create your parental account	Your child has created an account with us and needs you to create an account and verify them. You can sign up using the link below:\n\nhttp://example.com/family/confirm-child\n\n- FusionAuth Admin	\N	1701859089593	1701859089593	{}	{}	{}	{}	[FusionAuth Default] Parent Registration
4d75f20f-7402-4a10-adfa-bb926d525345	\N	[#setting url_escaping_charset="UTF-8"]\nYou have requested to log into FusionAuth using this email address. If you do not recognize this request please ignore this email.\n<p>\n  [#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\n  [#assign url = "http://localhost:9011/oauth2/passwordless/${code}?postMethod=true&tenantId=${user.tenantId}" /]\n  [#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n  <a href="${url}">${url}</a>\n</p>\n- FusionAuth Admin\n	Log into FusionAuth	[#setting url_escaping_charset="UTF-8"]\nYou have requested to log into FusionAuth using this email address. If you do not recognize this request please ignore this email.\n\n[#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\n[#assign url = "http://localhost:9011/oauth2/passwordless/${code}?postMethod=true&tenantId=${user.tenantId}" /]\n[#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n\n${url}\n\n- FusionAuth Admin\n	\N	1701859089594	1701859089594	{}	{}	{}	{}	[FusionAuth Default] Passwordless Login
95fc7371-a15d-4ef6-884f-f73eb4d44a07	\N	[#if registration.verified]\nPro tip, your registration has already been verified, but feel free to complete the verification process to verify your verification of your registration.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the registration can be verified --]\n[#if verificationOneTimeCode??]\n<p>To complete your registration verification enter this code into the registration verification form.</p>\n<p> ${verificationOneTimeCode} </p>\n[#else]\nTo complete your registration verification click on the following link.\n<p>\n  <a href="http://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&postMethod=true&tenantId=${user.tenantId}">\n    http://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&postMethod=true&tenantId=${user.tenantId}\n  </a>\n</p>\n[/#if]\n\n- FusionAuth Admin	Verify your registration	[#if registration.verified]\nPro tip, your registration has already been verified, but feel free to complete the verification process to verify your verification of your registration.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the registration can be verified --]\n[#if verificationOneTimeCode??]\nTo complete your registration verification enter this code into the registration verification form.\n\n${verificationOneTimeCode}\n[#else]\nTo complete your registration verification click on the following link.\n\nhttp://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&postMethod=true&tenantId=${user.tenantId}\n[/#if]\n\n- FusionAuth Admin	\N	1701859089595	1701859089595	{}	{}	{}	{}	[FusionAuth Default] Registration Verification
462a18b7-9642-48f5-95aa-0edac6ab8938	\N	Your account has been created and you must setup a password. Click on the following link to setup your password.\n<p>\n  <a href="http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}">\n    http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n  </a>\n</p>\n- FusionAuth Admin	Setup your password	Your account has been created and you must setup a password. Click on the following link to setup your password.\n\nhttp://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n\n- FusionAuth Admin	\N	1701859089596	1701859089596	{}	{}	{}	{}	[FusionAuth Default] Setup Password
46f811f0-1d9f-4a11-910c-d6430692ad9b	\N	<p>\n  To complete your login request, enter this one-time code code on the login form when prompted.\n</p>\n<p>\n  <strong>${code}</strong>\n</p>\n\n- FusionAuth Admin	Your second factor code	To complete your login request, enter this one-time code code on the login form when prompted.\n\n${code}\n\n- FusionAuth Admin	\N	1701859089596	1701859089596	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication
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
a1fd31c8-447d-4a1b-a982-ccddc363dcb0	{"data":{}}	Create SCIM User	aff9c570-cfac-4201-8383-d7b89880b236	1701859089562	f	1701859089562	scim:user:create
42aed4c8-8356-4f16-a7e8-278a0fcef61e	{"data":{}}	Read SCIM User	aff9c570-cfac-4201-8383-d7b89880b236	1701859089566	f	1701859089566	scim:user:read
161c3ce8-ba34-4ee5-88f3-886a05db44f4	{"data":{}}	Update SCIM User	aff9c570-cfac-4201-8383-d7b89880b236	1701859089568	f	1701859089568	scim:user:update
0ac9a7ea-6d6b-46a6-88e4-ae9b6a8e0c75	{"data":{}}	Delete SCIM User	aff9c570-cfac-4201-8383-d7b89880b236	1701859089569	f	1701859089569	scim:user:delete
08b7fe83-201f-4517-abd1-53a73479abf4	{"data":{}}	Create SCIM Enterprise User	aff9c570-cfac-4201-8383-d7b89880b236	1701859089570	f	1701859089570	scim:enterprise:user:create
8c6f84ca-c85d-4f7a-98f6-84fb1922324c	{"data":{}}	Read SCIM Enterprise User	aff9c570-cfac-4201-8383-d7b89880b236	1701859089570	f	1701859089570	scim:enterprise:user:read
9e0ae6bc-8bbf-4b0d-a3ee-e8835b701e45	{"data":{}}	Update SCIM Enterprise User	aff9c570-cfac-4201-8383-d7b89880b236	1701859089571	f	1701859089571	scim:enterprise:user:update
02928238-e7fa-4f28-9dd1-bfd3322a8612	{"data":{}}	Delete SCIM Enterprise User	aff9c570-cfac-4201-8383-d7b89880b236	1701859089572	f	1701859089572	scim:enterprise:user:delete
81d763bf-6a07-4f36-a8ac-bad6df7a510d	{"data":{}}	Create SCIM Group	aff9c570-cfac-4201-8383-d7b89880b236	1701859089572	f	1701859089572	scim:group:create
6eb48e7f-bb27-45f3-87b1-345cb1ab8cf4	{"data":{}}	Read SCIM Group	aff9c570-cfac-4201-8383-d7b89880b236	1701859089573	f	1701859089573	scim:group:read
2ae71860-5151-4de9-afac-df8ebcb529f3	{"data":{}}	Update SCIM Group	aff9c570-cfac-4201-8383-d7b89880b236	1701859089574	f	1701859089574	scim:group:update
9ccd9de2-b1ae-4ddc-b72f-780973cd1ab9	{"data":{}}	Delete SCIM Group	aff9c570-cfac-4201-8383-d7b89880b236	1701859089574	f	1701859089574	scim:group:delete
eba99444-5a14-4162-a9a1-80c0a245be41	{"data":{}}	Read SCIM Resource Types	aff9c570-cfac-4201-8383-d7b89880b236	1701859089575	f	1701859089575	scim:resource-types:read
87ad534a-16bf-4883-a1ed-f5a33db0f0c9	{"data":{}}	Read SCIM Schemas	aff9c570-cfac-4201-8383-d7b89880b236	1701859089575	f	1701859089575	scim:schemas:read
96173307-22e1-44bb-a62a-3d3f94bcf14e	{"data":{}}	Read SCIM Service Provider Configuration	aff9c570-cfac-4201-8383-d7b89880b236	1701859089576	f	1701859089576	scim:service-provider-config:read
\.


--
-- Data for Name: entity_types; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.entity_types (id, access_token_signing_keys_id, data, insert_instant, last_update_instant, name) FROM stdin;
aff9c570-cfac-4201-8383-d7b89880b236	\N	{"data":{},"jwtConfiguration":{"enabled":false,"timeToLiveInSeconds":0}}	1701859089560	1701859089560	[FusionAuth Default] SCIM Server
53dd44f0-acc3-453d-8217-fa2317fe7247	\N	{"data":{},"jwtConfiguration":{"enabled":false,"timeToLiveInSeconds":0}}	1701859089576	1701859089576	[FusionAuth Default] SCIM Client
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
2dd46ca2-06bc-6d59-e3e2-a03dd3c5b7e4	\N	{"key": "user.email", "control": "text", "required": true, "type": "email", "data": {"leftAddon": "user"}}	1701859008467	1701859008467	Email
5e8b065d-11c9-58d7-17d9-ebd055544461	\N	{"key": "user.password", "control": "password", "required": true, "type": "string", "data": {"leftAddon": "lock"}}	1701859008467	1701859008467	Password
6df5bb8d-37fa-818d-3166-d5e65919989f	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	First name
cbda35f9-a9bf-b600-5488-4b7add1422cb	\N	{"key": "user.middleName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	Middle name
eb139156-68c5-f3f3-b5b1-214302a04307	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	Last name
26ff87c9-0445-163f-cc7a-aa084100b72d	\N	{"key": "user.fullName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	Full name
5f2e3edd-673e-f711-5637-393f44b9b4fe	\N	{"key": "user.birthDate", "control": "text", "required": false, "type": "date", "data": {"leftAddon": "calendar"}}	1701859008467	1701859008467	Birthdate
208d99af-852c-ac1a-30bc-23a5db21ea7d	\N	{"key": "user.mobilePhone", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "mobile"}}	1701859008467	1701859008467	Mobile phone
5347a4a8-662c-64e4-e845-690f5c0eff50	\N	{"key": "user.username", "control": "text", "required": true, "type": "string", "data": {"leftAddon": "user"}}	1701859008467	1701859008467	Username
87131480-38a5-397d-04e4-1a1854eed920	\N	{"key": "user.parentEmail", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1701859008467	1701859008467	[Registration] parent email
dede9f77-98bb-1b2c-7416-dcc4816b765f	\N	{"key": "registration.preferredLanguages", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin Registration] preferred languages
ab5a3ccd-d604-6bd3-29a5-2c9be4873635	\N	{"key": "registration.roles", "control": "checkbox", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin Registration] roles
ed45f642-3a35-4675-129b-6fd3f6ab79d4	\N	{"key": "registration.timezone", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin Registration] timezone
eb2b3e7f-0a73-7ddf-373b-1d3456c3a315	\N	{"key": "registration.username", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "user"}}	1701859008467	1701859008467	[Admin Registration] username
f1830ce3-613d-c509-3c5d-a7d7c889059b	\N	{"key": "user.birthDate", "control": "text", "required": false, "type": "date", "data": {"leftAddon": "calendar"}}	1701859008467	1701859008467	[Admin User] birthdate
f10f347c-d579-221f-80bd-0c9e4a9044e3	\N	{"key": "user.email", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1701859008467	1701859008467	[Admin User] email
f4add726-6746-a575-a91d-48fcc2bdcba7	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin User] first name
7ec24246-67fe-ca89-2225-a34a34c9dc80	\N	{"key": "user.fullName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin User] full name
b1b3b8b8-1676-4e65-7c3a-79141d1c94d1	\N	{"key": "user.imageUrl", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin User] image URL
7d04b5d4-d910-11ee-b378-eb3ce0072f93	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin User] last name
ac9de579-a54f-14e6-32a1-850a6fe4740b	\N	{"key": "user.middleName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin User] middle name
570051fd-13e4-9235-5384-f8ad5c29b642	\N	{"key": "user.mobilePhone", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "mobile"}}	1701859008467	1701859008467	[Admin User] mobile phone
e866dc8f-cc16-4681-e62a-1459ffa46888	\N	{"key": "user.password", "control": "password", "required": true, "confirm": true, "type": "string", "data": {"leftAddon": "lock"}}	1701859008467	1701859008467	[Admin User] password
21163898-3b61-5e7f-4621-40746e95c5a6	\N	{"key": "user.preferredLanguages", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin User] preferred languages
8583d648-4eaa-39e7-b934-b95c796bc959	\N	{"key": "user.timezone", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Admin User] timezone
8a14ab09-321c-ad63-8191-eb1e29e837db	\N	{"key": "user.username", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "user"}}	1701859008467	1701859008467	[Admin User] username
c2493d71-9c4b-b43d-6d54-2a970ee4860d	\N	{"key": "user.email", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1701859008467	1701859008467	[Self Service User] email
bf96bd4e-78a6-d5a7-ed16-4ebcad470d70	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Self Service User] first name
ace00b7e-21e5-37ae-6603-118b82ee76cf	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1701859008467	1701859008467	[Self Service User] last name
7d063d43-e0aa-8cc5-a9bb-d3381afa2f74	\N	{"key": "user.password", "control": "password", "required": true, "confirm": true, "type": "string", "data": {"leftAddon": "lock"}}	1701859008467	1701859008467	[Self Service User] password
\.


--
-- Data for Name: form_steps; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.form_steps (form_fields_id, forms_id, sequence, step) FROM stdin;
eb2b3e7f-0a73-7ddf-373b-1d3456c3a315	ebdba871-f2af-c17d-0249-702b24fe4213	0	0
dede9f77-98bb-1b2c-7416-dcc4816b765f	ebdba871-f2af-c17d-0249-702b24fe4213	1	0
ed45f642-3a35-4675-129b-6fd3f6ab79d4	ebdba871-f2af-c17d-0249-702b24fe4213	2	0
ab5a3ccd-d604-6bd3-29a5-2c9be4873635	ebdba871-f2af-c17d-0249-702b24fe4213	3	0
f10f347c-d579-221f-80bd-0c9e4a9044e3	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	0	0
8a14ab09-321c-ad63-8191-eb1e29e837db	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	1	0
570051fd-13e4-9235-5384-f8ad5c29b642	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	2	0
e866dc8f-cc16-4681-e62a-1459ffa46888	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	3	0
f1830ce3-613d-c509-3c5d-a7d7c889059b	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	0	1
f4add726-6746-a575-a91d-48fcc2bdcba7	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	1	1
ac9de579-a54f-14e6-32a1-850a6fe4740b	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	2	1
7d04b5d4-d910-11ee-b378-eb3ce0072f93	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	3	1
7ec24246-67fe-ca89-2225-a34a34c9dc80	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	4	1
21163898-3b61-5e7f-4621-40746e95c5a6	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	5	1
8583d648-4eaa-39e7-b934-b95c796bc959	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	6	1
b1b3b8b8-1676-4e65-7c3a-79141d1c94d1	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	7	1
c2493d71-9c4b-b43d-6d54-2a970ee4860d	80784766-db7a-1108-9d0e-584df4a4d054	0	0
bf96bd4e-78a6-d5a7-ed16-4ebcad470d70	80784766-db7a-1108-9d0e-584df4a4d054	1	0
ace00b7e-21e5-37ae-6603-118b82ee76cf	80784766-db7a-1108-9d0e-584df4a4d054	2	0
7d063d43-e0aa-8cc5-a9bb-d3381afa2f74	80784766-db7a-1108-9d0e-584df4a4d054	3	0
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.forms (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
ebdba871-f2af-c17d-0249-702b24fe4213	\N	1701859005467	1701859005467	Default Admin Registration provided by FusionAuth	1
e5890dac-6cac-33e8-2c9f-8308e88ee1a0	\N	1701859006467	1701859006467	Default Admin User provided by FusionAuth	2
80784766-db7a-1108-9d0e-584df4a4d054	\N	1701859007467	1701859007467	Default User Self Service provided by FusionAuth	3
\.


--
-- Data for Name: global_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_daily_active_users (count, day) FROM stdin;
2	19697
\.


--
-- Data for Name: global_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_monthly_active_users (count, month) FROM stdin;
2	647
\.


--
-- Data for Name: global_registration_counts; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_registration_counts (count, decremented_count, hour) FROM stdin;
1	0	472738
1	0	472739
\.


--
-- Data for Name: group_application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.group_application_roles (application_roles_id, groups_id) FROM stdin;
ecc7fd2d-099e-4ca1-b03a-025b2a2dc6b7	64eeac28-ac34-4719-a00b-12468ad940af
e67f18fc-45a3-499a-8ef2-d6865270ecca	64eeac28-ac34-4719-a00b-12468ad940af
e67f18fc-45a3-499a-8ef2-d6865270ecca	f45d191f-f0ce-469f-aa06-cca9ae524c81
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
64eeac28-ac34-4719-a00b-12468ad940af	{}	1701862518267	1701862518267	admins	ead085c7-7183-4ac7-8356-f3dab5316ad0
f45d191f-f0ce-469f-aa06-cca9ae524c81	{}	1701862534356	1701862534356	users	ead085c7-7183-4ac7-8356-f3dab5316ad0
\.


--
-- Data for Name: hourly_logins; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.hourly_logins (applications_id, count, data, hour) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	\N	472745
22adff03-0643-4cc9-9747-57284615c848	2	\N	472745
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identities (id, breached_password_last_checked_instant, breached_password_status, connectors_id, email, encryption_scheme, factor, insert_instant, last_login_instant, last_update_instant, password, password_change_reason, password_change_required, password_last_update_instant, salt, status, tenants_id, username, username_index, username_status, users_id, verified, verified_instant) FROM stdin;
1	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	\N	salted-pbkdf2-hmac-sha256	24000	1701859089368	1701884734029	1701861906773	x6UIZ1dopV/q7iHH3jtvkLcpiw+UHkOSCGuXu3+4lII=	\N	f	1701859089516	in1dsHdrQJQE5YlqJIpBd7oX9RTdrCJpiWv5u/vFSxo=	0	c860edcc-cf1a-a78f-bfa1-81853ade8216	admin	ADMIN	0	0bfd843b-1b16-45e1-ba3f-0daf5da16971	t	1701859089368
2	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	\N	salted-pbkdf2-hmac-sha256	24000	1701862478227	1701884959358	1701862597229	wuAg+61c9w5eDY6qVD3212iRnS4R4U08vs8w9oGSkF0=	\N	f	1701862478408	pquHkxbc9NuVChDw5JNAN7Yno0mAR3ogmUSgo9rdQiY=	0	ead085c7-7183-4ac7-8356-f3dab5316ad0	testuser	TESTUSER	0	2dddb481-aa03-47a7-b926-9eec08bf1d39	t	1701862478227
\.


--
-- Data for Name: identity_provider_links; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_provider_links (data, identity_providers_id, identity_providers_user_id, insert_instant, last_login_instant, tenants_id, users_id) FROM stdin;
\.


--
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_providers (id, data, enabled, insert_instant, last_update_instant, name, type, keys_id, request_signing_keys_id, reconcile_lambdas_id) FROM stdin;
82339786-3dff-42a6-aac6-1f1ceecb6c46	{"buttonText":"Login with Google","client_id":"964493218511-ifim2rv4cbfto067oru7v014tmfrflrs.apps.googleusercontent.com","client_secret":"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","data":{},"debug":false,"linkingStrategy":"LinkByEmail","loginMethod":"UseRedirect","properties":{"api":"# Omit the data- prefix\\nauto_prompt=true\\nauto_select=false\\ncancel_on_tap_outside=false\\ncontext=signin\\nitp_support=true","button":"# Omit the data- prefix\\nlogo_alignment=left\\nshape=rectangular\\nsize=large\\ntext=signin_with\\ntheme=outline\\ntype=standard"},"scope":"openid profile email"}	t	1701861568038	1701885386419	Google	Google	\N	\N	\N
\.


--
-- Data for Name: identity_providers_applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_providers_applications (applications_id, data, enabled, identity_providers_id, keys_id) FROM stdin;
22adff03-0643-4cc9-9747-57284615c848	{"createRegistration":true,"data":{},"properties":{}}	t	82339786-3dff-42a6-aac6-1f1ceecb6c46	\N
3c219e58-ed0e-4b18-ad48-f4f92793ae32	{"createRegistration":false,"data":{},"properties":{}}	f	82339786-3dff-42a6-aac6-1f1ceecb6c46	\N
\.


--
-- Data for Name: identity_providers_tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_providers_tenants (tenants_id, data, identity_providers_id) FROM stdin;
\.


--
-- Data for Name: instance; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.instance (id, activate_instant, license, license_id, setup_complete) FROM stdin;
aa1b3487-f586-690e-fdc3-757bd4b2826f	\N	\N	\N	t
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
7bf52868-38db-81b7-ca8c-ab898afc721c	HS256	\N	\N	1701859004467	\N	0bf444ff0	1701859004467	Default signing key	\N	\N	+QZU0o/WJChf5yuTRRAa4ZKQF5TYKy0K0gbwKgic1hg=	HMAC
092dbedc-30af-4149-9c61-b578f2c72f59	HS256	\N	\N	1701859005467	\N	58e76d0e7	1701859005467	OpenID Connect compliant HMAC using SHA-256	\N	\N	\N	HMAC
4b8f1c06-518e-45bd-9ac5-d549686ae02a	HS384	\N	\N	1701859006467	\N	866c7c767	1701859006467	OpenID Connect compliant HMAC using SHA-384	\N	\N	\N	HMAC
c753a44d-7f2e-48d3-bc4e-c2c16488a23b	HS512	\N	\N	1701859007467	\N	9b55d95d6	1701859007467	OpenID Connect compliant HMAC using SHA-512	\N	\N	\N	HMAC
5d0c5b8c-d7c5-46cc-b19a-3917d5335f43	ES384	-----BEGIN CERTIFICATE-----\nMIIBVDCB26ADAgEBAhBdDFuM18VGzLGaORfVM19DMAoGCCqGSM49BAMDMA4xDDAK\nBgNVBAMTA3RtczAeFw0yMzEyMDYxMTE4MThaFw0zMzEyMDYxMTE4MThaMA4xDDAK\nBgNVBAMTA3RtczB2MBAGByqGSM49AgEGBSuBBAAiA2IABJ4174NKuCjfp9WzsF12\nOMs0UxT7dIsIlzLREN6m1v6u0sh0axolggTEFe+CvCcdmDMxRlaMkWcwFnOas6sT\nW96lM8w2R4jJTjxpUr/2436RTNxKLp7G+la5D4SwfUvipjAKBggqhkjOPQQDAwNo\nADBlAjB5SlxVJEJpXAi+bacdnvMm8Tp7o6HqiHwTabfrcsZVm7SYroD4yzM9gNBt\nib+iDCECMQD63k6ylf/GCmdy4qFVXgJLzzJ6x8i1eSbICD/3FtF6AMjq/M2OsDPx\nhRMYD/70h9M=\n-----END CERTIFICATE-----	2017480698753	1701861498753	tms	RzEWV1sL3S8yjDSbKeW9OK6JWwU	1701861498753	Task Management System	-----BEGIN PRIVATE KEY-----\nMIG2AgEAMBAGByqGSM49AgEGBSuBBAAiBIGeMIGbAgEBBDAuj4TxNUU8OXraBZri\nPRs8p65pEyUZ5ipCT+0J/5cSTB4krrkYL+u608rE28KMTMyhZANiAASeNe+DSrgo\n36fVs7BddjjLNFMU+3SLCJcy0RDeptb+rtLIdGsaJYIExBXvgrwnHZgzMUZWjJFn\nMBZzmrOrE1vepTPMNkeIyU48aVK/9uN+kUzcSi6exvpWuQ+EsH1L4qY=\n-----END PRIVATE KEY-----	-----BEGIN PUBLIC KEY-----\nMHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEnjXvg0q4KN+n1bOwXXY4yzRTFPt0iwiX\nMtEQ3qbW/q7SyHRrGiWCBMQV74K8Jx2YMzFGVoyRZzAWc5qzqxNb3qUzzDZHiMlO\nPGlSv/bjfpFM3Eounsb6VrkPhLB9S+Km\n-----END PUBLIC KEY-----	\N	EC
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
1e3ce37c-5103-4355-9cd6-7fe988f7f773	// This is the default SCIM Group response converter, modify this to your liking.\nfunction convert(group, members, options, scimGroup) {\n\n  // Un-comment this line to see the scimGroup object printed to the event log\n  // console.info(JSON.stringify(scimGroup, null, 2));\n\n  // Request options\n  // FusionAuth allows you to assign one or more application roles to a group.\n  // To use this feature, assign one or more application Ids here.\n  // options.roleIds = [];\n\n  // Set the name of the group using the SCIM Group displayName\n  group.name = scimGroup.displayName;\n\n  // Build a members array with a userId and a $ref in custom data\n  if (scimGroup.members) {\n    for (var i = 0; i < scimGroup.members.length; i++) {\n      members.push({\n        userId: scimGroup.members[i].value,\n        data: {\n          $ref: scimGroup.members[i]['$ref']\n        }\n      });\n    }\n  }\n}	f	GraalJS	1701859089555	1701859089555	[FusionAuth Default] SCIM Group Request Converter	19
1ba5969d-344a-4a95-98e3-4a3bcbdba2dd	// This is the default SCIM Group request converter, modify this to your liking.\nfunction convert(scimGroup, group, members) {\n  // Un-comment this line to see the group object printed to the event log\n  // console.info(JSON.stringify(group, null, 2));\n\n  // Set the outgoing displayName on the SCIM group using the FusionAuth group name.\n  scimGroup.displayName = group.name;\n}\n	f	GraalJS	1701859089557	1701859089557	[FusionAuth Default] SCIM Group Response Converter	20
393c60ba-befd-46af-b639-1e23b03f91c6	// This is the default SCIM User request converter, modify this to your liking.\nfunction convert(user, options, scimUser) {\n  // Un-comment this line to see the scimUser object printed to the event log\n  // console.info(JSON.stringify(scimUser, null, 2));\n\n  // Request options\n  // Note, sendSetPasswordEmail is only utilized during a user create request.\n  // options.applicationId = null;\n  // options.disableDomainBlock = false;\n  // options.sendSetPasswordEmail = false;\n  // options.skipVerification = false;\n\n  user.active = scimUser.active;\n  user.data.honorificPrefix = scimUser.name && scimUser.name.honorificPrefix;\n  user.data.honorificSuffix = scimUser.name && scimUser.name.honorificSuffix;\n  user.firstName = scimUser.name && scimUser.name.givenName;\n  user.fullName = scimUser.name && scimUser.name.formatted;\n  user.lastName = scimUser.name && scimUser.name.familyName;\n  user.middleName = scimUser.name && scimUser.name.middleName;\n  user.password = scimUser.password;\n  user.username = scimUser.userName;\n\n  // user.email\n  if (scimUser.emails) {\n    for (var i = 0; i < scimUser.emails.length; i++) {\n      if (scimUser.emails[i].primary) {\n        user.email = scimUser.emails[i].value;\n      }\n    }\n  }\n\n  // user.mobilePhone\n  if (scimUser.phoneNumbers) {\n    for (var j = 0; j < scimUser.phoneNumbers.length; j++) {\n      if (scimUser.phoneNumbers[j].primary) {\n        user.mobilePhone = scimUser.phoneNumbers[j].value;\n      }\n    }\n  }\n\n  // Handle the Enterprise User extension and other custom extensions\n  if (scimUser.schemas) {\n    for (var k = 0; k < scimUser.schemas.length; k++) {\n      var schema = scimUser.schemas[k];\n      if (schema !== 'urn:ietf:params:scim:schemas:core:2.0:User') {\n        user.data = user.data || {};\n        user.data.extensions = user.data.extensions || {};\n        user.data.extensions[schema] = scimUser[schema];\n      }\n    }\n  }\n}\n	f	GraalJS	1701859089558	1701859089558	[FusionAuth Default] SCIM User Request Converter	21
724e701c-9217-4791-b3ca-1ad1791861fa	// This is the default SCIM User response converter, modify this to your liking.\nfunction convert(scimUser, user) {\n  // Un-comment this line to see the user object printed to the event log\n  // console.info(JSON.stringify(user, null, 2));\n\n  scimUser.active = user.active;\n  scimUser.userName = user.username;\n  scimUser.name = {\n    formatted: user.fullName,\n    familyName: user.lastName,\n    givenName: user.firstName,\n    middleName: user.middleName,\n    honorificPrefix: user.data.honorificPrefix,\n    honorificSuffix: user.data.honorificSuffix\n  };\n\n  scimUser.phoneNumbers = [{\n    primary: true,\n    value: user.mobilePhone,\n    type: "mobile"\n  }];\n\n  scimUser.emails = [{\n    primary: true,\n    value: user.email,\n    type: "work"\n  }];\n\n  // Optionally return any custom extensions stored in user.data\n  if (user.data && user.data.extensions) {\n    for (var extension in user.data.extensions) {\n      if (scimUser.schemas.indexOf(extension) === -1) {\n        scimUser.schemas.push(extension);\n      }\n      scimUser[extension] = user.data.extensions[extension];\n    }\n  }\n}\n	f	GraalJS	1701859089558	1701859089558	[FusionAuth Default] SCIM User Response Converter	22
c3fc70b9-cf29-4a2d-b32f-92dce323177f	/**\n* This is the default Apple reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} idToken - the decoded JSON payload of the id_token returned by Apple.\n*/\nfunction reconcile(user, registration, idToken) {\n  // Un-comment this line to see the idToken object printed to the event log\n  // console.info(JSON.stringify(idToken, null, 2));\n\n  // During the first login attempt, the user object will be available which may contain first and last name.\n  if (idToken.user && idToken.user.name) {\n    user.firstName = idToken.user.name.firstName || user.firstName;\n    user.lastName = idToken.user.name.lastName || user.lastName;\n  }\n}\n	f	GraalJS	1701859089597	1701859089597	[FusionAuth Default] Apple Reconcile	4
510baaa5-80b4-4ba1-b239-871c3571adf0	/**\n* This is the default Facebook reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} facebookUser - the decoded JSON payload returned by the Facebook Me API.\n*/\nfunction reconcile(user, registration, facebookUser) {\n  // Un-comment this line to see the facebookUser object printed to the event log\n  // console.info(JSON.stringify(facebookUser, null, 2));\n\n  user.firstName = facebookUser.first_name;\n  user.middleName = facebookUser.middle_name;\n  user.lastName = facebookUser.last_name;\n  user.fullName = facebookUser.name;\n\n  if (facebookUser.picture && !facebookUser.picture.data.is_silhouette) {\n    user.imageUrl = facebookUser.picture.data.url;\n  }\n\n  if (facebookUser.birthday) {\n    // Convert MM/dd/yyyy -> YYYY-MM-DD\n    var parts = facebookUser.birthday.split('/');\n    user.birthDate = parts[2] + '-' + parts[0] + '-' + parts[1];\n  }\n}\n	f	GraalJS	1701859089598	1701859089598	[FusionAuth Default] Facebook Reconcile	6
4738398c-5c30-483a-8620-f7d7a7b43448	/**\n* This is the default Google reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} idToken - the decoded JSON payload returned by the Google Token Info API.\n*/\nfunction reconcile(user, registration, idToken) {\n  // Un-comment this line to see the idToken object printed to the event log\n  // console.info(JSON.stringify(idToken, null, 2));\n\n  // The idToken is the response from the tokeninfo endpoint\n  // https://developers.google.com/identity/sign-in/web/backend-auth#calling-the-tokeninfo-endpoint\n  user.firstName = idToken.given_name;\n  user.lastName = idToken.family_name;\n  user.fullName = idToken.name;\n  user.imageUrl = idToken.picture;\n}\n	f	GraalJS	1701859089598	1701859089598	[FusionAuth Default] Google Reconcile	7
8bb50acf-8a26-4e45-86c9-b1b3b68908c7	/**\n* This is the default LinkedIn reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} linkedInUser - the decoded JSON payload returned by the LinkedIn Me API.\n*/\nfunction reconcile(user, registration, linkedInUser) {\n  // Un-comment this line to see the linkedInUser object printed to the event log\n  // console.info(JSON.stringify(linkedInUser, null, ' '));\n\n  user.firstName = linkedInUser.localizedFirstName || user.firstName;\n  user.lastName = linkedInUser.localizedLastName || user.lastName;\n\n  // LinkedIn returns several images sizes.\n  // See https://docs.microsoft.com/en-us/linkedin/shared/references/v2/profile/profile-picture\n  var images = linkedInUser.profilePicture['displayImage~'].elements || [];\n  var image100 = images.length >= 1 ? images[0].identifiers[0].identifier : null;\n  var image200 = images.length >= 2 ? images[1].identifiers[0].identifier : null;\n  var image400 = images.length >= 3 ? images[2].identifiers[0].identifier : null;\n  var image800 = images.length >= 4 ? images[3].identifiers[0].identifier : null;\n\n  // Use the largest image.\n  user.imageUrl = image800;\n\n  // Record the LinkedIn Id\n  registration.data.linkedIn = registration.data.linkedIn || {};\n  registration.data.linkedIn.id = linkedInUser.id;\n}\n	f	GraalJS	1701859089598	1701859089598	[FusionAuth Default] LinkedIn Reconcile	11
76aac5ba-c1f8-4ec4-96ce-f099b0d256b2	/**\n* This is the default OpenID Connect reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} jwt - the JSON response from the UserInfo endpoint\n* @param {Object} [idToken] - the decoded JSON payload of the id_token. The id_token is available when the\n*                             'openid' scope was requested, and the signature can be successfully verified.\n* @param {Object} tokens an object containing the encoded access_token and when available the id_token. The\n*                        id_token is only available when returned by the IdP and the signature has been verified.\n*/\nfunction reconcile(user, registration, jwt, idToken, tokens) {\n  // Un-comment this line to see the jwt object printed to the event log\n  // console.info(JSON.stringify(jwt, null, 2));\n\n  user.firstName = jwt.given_name;\n  user.middleName = jwt.middle_name;\n  user.lastName = jwt.family_name;\n  user.fullName = jwt.name;\n  user.imageUrl = jwt.picture;\n  user.mobilePhone = jwt.phone_number;\n\n  // https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims\n  if (jwt.birthdate && jwt.birthdate !== '0000') {\n    if (jwt.birthdate.length === 4) {\n      // Only a year was provided, set to January 1.\n      user.birthDate = jwt.birthdate + '-01-01';\n    } else {\n      user.birthDate = jwt.birthdate;\n    }\n  }\n\n  // https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims\n  if (jwt.locale) {\n    user.preferredLanguages = user.preferredLanguages || [];\n    // Replace the dash with an under_score.\n    user.preferredLanguages.push(jwt.locale.replace('-', '_'));\n  }\n\n  // Set preferred_username in registration.\n  // - This is just for display purposes, this value cannot be used to uniquely identify\n  //   the user in FusionAuth.\n  registration.username = jwt.preferred_username;\n}\n	f	GraalJS	1701859089600	1701859089600	[FusionAuth Default] OpenID Connect Reconcile	1
d73bad13-622e-47a4-840b-49d7d10ecc63	/**\n* This is the default SAML v2 reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} samlResponse - the SAML AuthN response returned by the SAML v2 Identity Provider. This\n*                                object is a parsed version of the actual XML document returned. See\n*                                the FusionAuth documentation for more details, or print the contents of this\n*                                object to the event log to assist in debugging.\n*/\nfunction reconcile(user, registration, samlResponse) {\n  // Un-comment this line to see the samlResponse object printed to the event log\n  // console.info(JSON.stringify(samlResponse, null, 2));\n\n  var getAttribute = function(samlResponse, attribute) {\n    var values = samlResponse.assertion.attributes[attribute];\n    if (values && values.length > 0) {\n      return values[0];\n    }\n\n    return null;\n  };\n\n  // Retrieve an attribute from the samlResponse\n  // - Arguments [2 .. ] provide a preferred order of attribute names to lookup the value in the response.\n  var defaultIfNull = function(samlResponse) {\n    for (var i = 1; i < arguments.length; i++) {\n      var value = getAttribute(samlResponse, arguments[i]);\n      if (value !== null) {\n        return value;\n      }\n    }\n  };\n\n  user.birthDate = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth', 'birthdate', 'date_of_birth');\n  user.firstName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname', 'first_name');\n  user.lastName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname', 'last_name');\n  user.fullName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', 'name', 'full_name');\n  user.mobilePhone = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone', 'mobile_phone');\n}\n	f	GraalJS	1701859089601	1701859089601	[FusionAuth Default] SAML v2 Reconcile	2
2cf03de2-94bc-456b-934d-c883244fe143	/**\n* This is the default Twitter reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} twitterUser - the decoded JSON payload returned by the Twitter Verify Credentials API.\n*/\nfunction reconcile(user, registration, twitterUser) {\n  // Un-comment this line to see the twitterUser object printed to the event log\n  // console.info(JSON.stringify(twitterUser, null, 2));\n\n  // Set name if available in the response\n  if (twitterUser.name) {\n    user.fullName = twitterUser.name;\n  }\n\n  // https://developer.twitter.com/en/docs/accounts-and-users/user-profile-images-and-banners.html\n  if (twitterUser.profile_image_url_https) {\n    // Remove the _normal suffix to get the original size.\n    user.imageUrl = twitterUser.profile_image_url_https.replace('_normal.png', '.png');\n  }\n\n  // Set twitter screen_name in registration.\n  // - This is just for display purposes, this value cannot be used to uniquely identify\n  //   the user in FusionAuth.\n  registration.username = twitterUser.screen_name;\n}\n	f	GraalJS	1701859089601	1701859089601	[FusionAuth Default] Twitter Reconcile	9
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
2489611d-8fbf-4c15-922e-422c5fcb7d36	1701885328459
\.


--
-- Data for Name: message_templates; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.message_templates (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
1dfe9f6a-2164-5bb7-855a-353b524d6b43	{ "defaultTemplate": "Two Factor Code: ${code}" }	1701859008467	1701859008467	Default Two Factor Request	0
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
io.fusionauth.api.migration.guice.Migration_1_42_0	1701859013792
\.


--
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.nodes (id, data, insert_instant, last_checkin_instant, runtime_mode, url) FROM stdin;
2489611d-8fbf-4c15-922e-422c5fcb7d36	{"data":{},"ipAddresses":{"eth0":["172.23.0.3"],"eth1":["172.24.0.3"]},"platform":{"arch":"amd64","name":"Linux","version":"6.4.16-linuxkit"}}	1701883934563	1701885379458	development	http://fusionauth:9011
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
3c219e58-ed0e-4b18-ad48-f4f92793ae32	19697	0bfd843b-1b16-45e1-ba3f-0daf5da16971
22adff03-0643-4cc9-9747-57284615c848	19697	2dddb481-aa03-47a7-b926-9eec08bf1d39
\.


--
-- Data for Name: raw_application_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_application_monthly_active_users (applications_id, month, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	647	0bfd843b-1b16-45e1-ba3f-0daf5da16971
22adff03-0643-4cc9-9747-57284615c848	647	2dddb481-aa03-47a7-b926-9eec08bf1d39
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
19697	0bfd843b-1b16-45e1-ba3f-0daf5da16971
19697	2dddb481-aa03-47a7-b926-9eec08bf1d39
\.


--
-- Data for Name: raw_global_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_global_monthly_active_users (month, users_id) FROM stdin;
647	0bfd843b-1b16-45e1-ba3f-0daf5da16971
647	2dddb481-aa03-47a7-b926-9eec08bf1d39
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
\N	1701862478227	172.23.0.1	2dddb481-aa03-47a7-b926-9eec08bf1d39
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1701884734029	172.23.0.1	0bfd843b-1b16-45e1-ba3f-0daf5da16971
\N	1701884860306	172.23.0.1	2dddb481-aa03-47a7-b926-9eec08bf1d39
22adff03-0643-4cc9-9747-57284615c848	1701884860375	172.23.0.1	2dddb481-aa03-47a7-b926-9eec08bf1d39
22adff03-0643-4cc9-9747-57284615c848	1701884959358	172.23.0.1	2dddb481-aa03-47a7-b926-9eec08bf1d39
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.refresh_tokens (id, applications_id, data, insert_instant, start_instant, tenants_id, token, token_hash, token_text, users_id) FROM stdin;
231ac2bf-8595-4f3e-a5f1-d8693886b2f4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	{"data":{},"metaData":{"device":{"lastAccessedAddress":"172.21.0.1","lastAccessedInstant":1701863163377,"name":"Setup Wizard","type":"Browser"}}}	1701859089547	1701863163377	\N	\N	KGioJrbXHeFWRaVSUaKnxqB3RLuDlMdnAAwyEBQaTo8=                    	f8aNhx_WeGzV6zZQB3EXs2FK_kCf7M9zhF1d3cCSHdlxg1bOUKtcHA	0bfd843b-1b16-45e1-ba3f-0daf5da16971
c8914975-e443-4d84-b302-2e8a5f2a9306	\N	{"data":{},"metaData":{"device":{"lastAccessedAddress":"172.23.0.1","lastAccessedInstant":1701884959400,"name":"Linux Chrome","type":"BROWSER"}}}	1701884959400	1701884959400	ead085c7-7183-4ac7-8356-f3dab5316ad0	\N	RfI9+7RoYqBU9dRYqBczEVegTAvQMqkNgmVP3qJPrVQ=                    	bAQj_gTuq-X8TF4pggEJqf9huSsNLP2ySPJylwc7HtSLtYJNcWznfw	2dddb481-aa03-47a7-b926-9eec08bf1d39
80e26d3a-63ca-4ce0-aae9-665aa4f5944f	22adff03-0643-4cc9-9747-57284615c848	{"data":{"auth_time":1701884959,"grants":["authorization_code"]},"metaData":{"device":{"lastAccessedAddress":"172.23.0.1","lastAccessedInstant":1701884959732,"name":"Linux Chrome","type":"BROWSER"},"scopes":["openid","email","offline_access"]}}	1701884959732	1701884959732	\N	\N	QWEhcFvueMMVocQVSc+OqXgiuoO8yyUVA+JQyM9ZosY=                    	kvVVd7ubqF8ngwW0WaBronMviHwnYfwaccsDDT9UagIWMKAJCYMIlQ	2dddb481-aa03-47a7-b926-9eec08bf1d39
73d0da90-2ec8-43f1-8982-4f9a9315072f	3c219e58-ed0e-4b18-ad48-f4f92793ae32	{"data":{"auth_time":1701884734,"grants":["authorization_code"]},"metaData":{"device":{"lastAccessedAddress":"172.23.0.1","lastAccessedInstant":1701885343893,"name":"Linux Chrome","type":"BROWSER"},"scopes":["offline_access"]}}	1701884734208	1701885343893	\N	\N	6ZM3iw0TXd3Bv0ANTa39pQLFESiQjRok2x7kjTLBsts=                    	q7qDqYwublCssd0qJByx0ZIGIH2ClE5HyHw6A7IcClI_5V8epKku5g	0bfd843b-1b16-45e1-ba3f-0daf5da16971
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
{"auditLogConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"cookieEncryptionKey":"mikxg6gY9ocmvNfhSh/UwA==","corsConfiguration":{"allowCredentials":false,"allowedHeaders":["Accept","Access-Control-Request-Headers","Access-Control-Request-Method","Authorization","Content-Type","Last-Modified","Origin","X-FusionAuth-TenantId","X-Requested-With"],"allowedMethods":["OPTIONS","HEAD","POST","PATCH","DELETE","PUT","GET"],"allowedOrigins":["http://localhost:8080"],"debug":false,"enabled":true,"preflightMaxAgeInSeconds":0},"data":{},"eventLogConfiguration":{"numberToRetain":10000},"loginRecordConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"uiConfiguration":{}}	1701859008467	1701859008467	America/Denver
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.tenants (id, access_token_signing_keys_id, admin_user_forms_id, client_credentials_access_token_populate_lambdas_id, confirm_child_email_templates_id, data, email_update_email_templates_id, email_verified_email_templates_id, failed_authentication_user_actions_id, family_request_email_templates_id, forgot_password_email_templates_id, id_token_signing_keys_id, insert_instant, last_update_instant, login_id_in_use_on_create_email_templates_id, login_id_in_use_on_update_email_templates_id, login_new_device_email_templates_id, login_suspicious_email_templates_id, multi_factor_email_message_templates_id, multi_factor_sms_message_templates_id, multi_factor_sms_messengers_id, name, password_reset_success_email_templates_id, password_update_email_templates_id, parent_registration_email_templates_id, passwordless_email_templates_id, scim_client_entity_types_id, scim_enterprise_user_request_converter_lambdas_id, scim_enterprise_user_response_converter_lambdas_id, scim_group_request_converter_lambdas_id, scim_group_response_converter_lambdas_id, scim_server_entity_types_id, scim_user_request_converter_lambdas_id, scim_user_response_converter_lambdas_id, set_password_email_templates_id, themes_id, two_factor_method_add_email_templates_id, two_factor_method_remove_email_templates_id, ui_ip_access_control_lists_id, verification_email_templates_id) FROM stdin;
c860edcc-cf1a-a78f-bfa1-81853ade8216	7bf52868-38db-81b7-ca8c-ab898afc721c	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	\N	\N	{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":false,"data":{},"emailConfiguration":{"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","host":"localhost","implicitEmailVerificationAllowed":true,"port":25,"unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{},"httpSessionMaxInactiveInterval":3600,"issuer":"acme.com","jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"46f811f0-1d9f-4a11-910c-d6430692ad9b"},"loginPolicy":"Enabled","sms":{"enabled":false}},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"notifyUserEmailTemplateId":"4a811b12-3c9b-47b2-b745-29cf8b97bfb8"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"any","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}}	\N	\N	\N	\N	dc75209f-cc0f-486a-8db4-b064cb0f8383	092dbedc-30af-4149-9c61-b578f2c72f59	1701859007467	1701859089607	\N	\N	\N	\N	46f811f0-1d9f-4a11-910c-d6430692ad9b	\N	\N	Default	\N	\N	\N	4d75f20f-7402-4a10-adfa-bb926d525345	\N	\N	\N	\N	\N	\N	\N	\N	462a18b7-9642-48f5-95aa-0edac6ab8938	75a068fd-e94b-451a-9aeb-3ddb9a3b5987	\N	\N	\N	\N
ead085c7-7183-4ac7-8356-f3dab5316ad0	5d0c5b8c-d7c5-46cc-b19a-3917d5335f43	e5890dac-6cac-33e8-2c9f-8308e88ee1a0	\N	\N	{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":true,"data":{},"emailConfiguration":{"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","host":"localhost","implicitEmailVerificationAllowed":true,"port":25,"security":"NONE","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{"jwt.public-key.update":{"enabled":false,"transactionType":"None"},"jwt.refresh-token.revoke":{"enabled":false,"transactionType":"None"},"jwt.refresh":{"enabled":false,"transactionType":"None"},"group.create":{"enabled":false,"transactionType":"None"},"group.create.complete":{"enabled":false,"transactionType":"None"},"group.delete":{"enabled":false,"transactionType":"None"},"group.delete.complete":{"enabled":false,"transactionType":"None"},"group.member.add":{"enabled":false,"transactionType":"None"},"group.member.add.complete":{"enabled":false,"transactionType":"None"},"group.member.remove":{"enabled":false,"transactionType":"None"},"group.member.remove.complete":{"enabled":false,"transactionType":"None"},"group.member.update":{"enabled":false,"transactionType":"None"},"group.member.update.complete":{"enabled":false,"transactionType":"None"},"group.update":{"enabled":false,"transactionType":"None"},"group.update.complete":{"enabled":false,"transactionType":"None"},"user.action":{"enabled":false,"transactionType":"None"},"user.bulk.create":{"enabled":false,"transactionType":"None"},"user.create":{"enabled":false,"transactionType":"None"},"user.create.complete":{"enabled":false,"transactionType":"None"},"user.deactivate":{"enabled":false,"transactionType":"None"},"user.delete":{"enabled":false,"transactionType":"None"},"user.delete.complete":{"enabled":false,"transactionType":"None"},"user.email.update":{"enabled":false,"transactionType":"None"},"user.email.verified":{"enabled":false,"transactionType":"None"},"user.identity-provider.link":{"enabled":false,"transactionType":"None"},"user.identity-provider.unlink":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.create":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.update":{"enabled":false,"transactionType":"None"},"user.login.failed":{"enabled":false,"transactionType":"None"},"user.login.new-device":{"enabled":false,"transactionType":"None"},"user.login.success":{"enabled":false,"transactionType":"None"},"user.login.suspicious":{"enabled":false,"transactionType":"None"},"user.password.breach":{"enabled":false,"transactionType":"None"},"user.password.reset.send":{"enabled":false,"transactionType":"None"},"user.password.reset.start":{"enabled":false,"transactionType":"None"},"user.password.reset.success":{"enabled":false,"transactionType":"None"},"user.password.update":{"enabled":false,"transactionType":"None"},"user.reactivate":{"enabled":false,"transactionType":"None"},"user.registration.create":{"enabled":false,"transactionType":"None"},"user.registration.create.complete":{"enabled":false,"transactionType":"None"},"user.registration.delete":{"enabled":false,"transactionType":"None"},"user.registration.delete.complete":{"enabled":false,"transactionType":"None"},"user.registration.update":{"enabled":false,"transactionType":"None"},"user.registration.update.complete":{"enabled":false,"transactionType":"None"},"user.registration.verified":{"enabled":false,"transactionType":"None"},"user.two-factor.method.add":{"enabled":false,"transactionType":"None"},"user.two-factor.method.remove":{"enabled":false,"transactionType":"None"},"user.update":{"enabled":false,"transactionType":"None"},"user.update.complete":{"enabled":false,"transactionType":"None"}}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{},"httpSessionMaxInactiveInterval":3600,"issuer":"tms","jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"46f811f0-1d9f-4a11-910c-d6430692ad9b"},"loginPolicy":"Enabled","sms":{"enabled":false}},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"matchMode":"High","notifyUserEmailTemplateId":"4a811b12-3c9b-47b2-b745-29cf8b97bfb8","onLogin":"Off"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}}	\N	\N	\N	\N	dc75209f-cc0f-486a-8db4-b064cb0f8383	092dbedc-30af-4149-9c61-b578f2c72f59	1701861713642	1701861713642	\N	\N	\N	\N	46f811f0-1d9f-4a11-910c-d6430692ad9b	\N	\N	Task Management System	\N	\N	\N	4d75f20f-7402-4a10-adfa-bb926d525345	\N	\N	\N	\N	\N	\N	\N	\N	462a18b7-9642-48f5-95aa-0edac6ab8938	75a068fd-e94b-451a-9aeb-3ddb9a3b5987	\N	\N	\N	\N
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.themes (id, data, insert_instant, last_update_instant, name) FROM stdin;
75a068fd-e94b-451a-9aeb-3ddb9a3b5987	{}	1701859008467	1701859008467	FusionAuth
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
87994797-da79-4cd9-922b-d65b3d6668ce	3c219e58-ed0e-4b18-ad48-f4f92793ae32	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1701859089526	1701884734029	1701859089526	\N	\N	0	0bfd843b-1b16-45e1-ba3f-0daf5da16971	t	1701859089526
2daa61b3-b2db-4319-8474-50f50fb089e5	22adff03-0643-4cc9-9747-57284615c848	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1701884860375	1701884959358	1701884860375	\N	\N	0	2dddb481-aa03-47a7-b926-9eec08bf1d39	t	1701884860375
\.


--
-- Data for Name: user_registrations_application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_registrations_application_roles (application_roles_id, user_registrations_id) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb8236e2	87994797-da79-4cd9-922b-d65b3d6668ce
e67f18fc-45a3-499a-8ef2-d6865270ecca	2daa61b3-b2db-4319-8474-50f50fb089e5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.users (id, active, birth_date, clean_speak_id, data, expiry, first_name, full_name, image_url, insert_instant, last_name, last_update_instant, middle_name, mobile_phone, parent_email, tenants_id, timezone) FROM stdin;
0bfd843b-1b16-45e1-ba3f-0daf5da16971	t	\N	\N	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	Chief	\N	\N	1701859089368	[ADMIN]	1701861906773	\N	\N	\N	c860edcc-cf1a-a78f-bfa1-81853ade8216	\N
2dddb481-aa03-47a7-b926-9eec08bf1d39	t	\N	\N	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	User	User	\N	1701862478227	\N	1701862597229	\N	\N	\N	ead085c7-7183-4ac7-8356-f3dab5316ad0	\N
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.version (version) FROM stdin;
1.48.2
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

SELECT pg_catalog.setval('public.audit_logs_id_seq', 14, true);


--
-- Name: event_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.event_logs_id_seq', 1, false);


--
-- Name: identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.identities_id_seq', 2, true);


--
-- Name: raw_application_registration_counts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.raw_application_registration_counts_id_seq', 2, true);


--
-- Name: raw_global_registration_counts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.raw_global_registration_counts_id_seq', 2, true);


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
-- PostgreSQL database dump complete
--

