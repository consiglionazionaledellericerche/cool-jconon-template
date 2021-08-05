-- concorsi.condition_seq definition

-- DROP SEQUENCE condition_seq;

CREATE SEQUENCE condition_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.seq_attachments definition

-- DROP SEQUENCE seq_attachments;

CREATE SEQUENCE seq_attachments
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.seq_category definition

-- DROP SEQUENCE seq_category;

CREATE SEQUENCE seq_category
	INCREMENT BY 1
	MINVALUE 555
	MAXVALUE 9223372036854775807;


-- concorsi.seq_faq definition

-- DROP SEQUENCE seq_faq;

CREATE SEQUENCE seq_faq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.seq_messaggi definition

-- DROP SEQUENCE seq_messaggi;

CREATE SEQUENCE seq_messaggi
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.seq_segnalazione definition

-- DROP SEQUENCE seq_segnalazione;

CREATE SEQUENCE seq_segnalazione
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.seq_setting definition

-- DROP SEQUENCE seq_setting;

CREATE SEQUENCE seq_setting
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.seq_strutture definition

-- DROP SEQUENCE seq_strutture;

CREATE SEQUENCE seq_strutture
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.task_seq definition

-- DROP SEQUENCE task_seq;

CREATE SEQUENCE task_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.temp_segnalazione_seq definition

-- DROP SEQUENCE temp_segnalazione_seq;

CREATE SEQUENCE temp_segnalazione_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.transition_seq definition

-- DROP SEQUENCE transition_seq;

CREATE SEQUENCE transition_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807;


-- concorsi.attachments definition

-- Drop table

-- DROP TABLE attachments;

CREATE TABLE attachments (
	id numeric(20) NOT NULL,
	id_segnalazione numeric(18) NULL,
	attachment bytea NULL,
	descrizione varchar(1024) NULL,
	nome_file varchar(100) NULL,
	CONSTRAINT attachments_pk PRIMARY KEY (id)
);


-- concorsi.categoria definition

-- Drop table

-- DROP TABLE categoria;

CREATE TABLE categoria (
	id_categoria numeric(9) NOT NULL,
	nome varchar(50) NULL,
	categoria_padre numeric(9) NULL,
	descrizione varchar(100) NULL,
	enabled bpchar(1) NOT NULL DEFAULT 'y'::bpchar,
	CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria)
);


-- concorsi."condition" definition

-- Drop table

-- DROP TABLE "condition";

CREATE TABLE "condition" (
	id numeric(4) NOT NULL,
	descrizione varchar(1024) NULL,
	condition_class varchar(255) NULL,
	CONSTRAINT condition_pk PRIMARY KEY (id)
);


-- concorsi.main_settings definition

-- Drop table

-- DROP TABLE main_settings;

CREATE TABLE main_settings (
	id_main_settings numeric(9) NOT NULL,
	"name" varchar(100) NOT NULL,
	value varchar(500) NOT NULL,
	CONSTRAINT main_settings_pk PRIMARY KEY (id_main_settings)
);


-- concorsi.priorita definition

-- Drop table

-- DROP TABLE priorita;

CREATE TABLE priorita (
	livello numeric(2) NOT NULL,
	descrizione varchar(30) NULL,
	predefinito bpchar(1) NULL,
	CONSTRAINT pk_priorita PRIMARY KEY (livello),
	CONSTRAINT priorita_predefinito_key UNIQUE (predefinito)
);


-- concorsi.profilo definition

-- Drop table

-- DROP TABLE profilo;

CREATE TABLE profilo (
	id_profilo numeric(2) NOT NULL,
	nome varchar(20) NULL,
	CONSTRAINT profilo_pkey PRIMARY KEY (id_profilo)
);


-- concorsi.repository definition

-- Drop table

-- DROP TABLE repository;

CREATE TABLE repository (
	mese numeric(6) NOT NULL,
	categoria numeric(9) NOT NULL,
	attachment bytea NULL,
	stato bpchar(1) NOT NULL,
	CONSTRAINT pk_repository PRIMARY KEY (mese, categoria)
);


-- concorsi.stato definition

-- Drop table

-- DROP TABLE stato;

CREATE TABLE stato (
	id_stato numeric(2) NOT NULL,
	descrizione varchar(20) NULL,
	CONSTRAINT stato_pkey PRIMARY KEY (id_stato)
);


-- concorsi.stato_report definition

-- Drop table

-- DROP TABLE stato_report;

CREATE TABLE stato_report (
	stato bpchar(1) NOT NULL,
	descrizione varchar(30) NULL,
	CONSTRAINT pk_stato_report PRIMARY KEY (stato)
);


-- concorsi.strutture definition

-- Drop table

-- DROP TABLE strutture;

CREATE TABLE strutture (
	codice_struttura varchar(10) NOT NULL,
	descrizione varchar(100) NULL,
	acronimo varchar(10) NULL,
	evidenza varchar(1) NOT NULL DEFAULT 'n'::character varying,
	enabled char(1) NOT NULL DEFAULT 'y'::"char",
	CONSTRAINT pk_struttura PRIMARY KEY (codice_struttura)
);


-- concorsi.task definition

-- Drop table

-- DROP TABLE task;

CREATE TABLE task (
	id numeric(4) NOT NULL,
	descrizione varchar(100) NULL,
	taskclass varchar(1024) NULL,
	CONSTRAINT task_pk PRIMARY KEY (id)
);


-- concorsi.temp_segnalazione definition

-- Drop table

-- DROP TABLE temp_segnalazione;

CREATE TABLE temp_segnalazione (
	id_temp_segnalazione int4 NOT NULL DEFAULT nextval('temp_segnalazione_seq'::regclass),
	email varchar(50) NOT NULL,
	titolo varchar(1024) NULL,
	categoria int4 NULL,
	nome varchar(50) NULL,
	cognome varchar(50) NULL,
	descrizione varchar NULL,
	data_sottomissione varchar(30) NULL,
	flag_conferma_effettuata bool NOT NULL DEFAULT false,
	codice_attivazione varchar(18) NOT NULL,
	id_segnalazione numeric(18) NULL DEFAULT NULL::numeric,
	CONSTRAINT temp_segnalazione_pkey PRIMARY KEY (id_temp_segnalazione)
);


-- concorsi."template" definition

-- Drop table

-- DROP TABLE "template";

CREATE TABLE "template" (
	id_template numeric(2) NOT NULL,
	template_email varchar(4000) NULL,
	CONSTRAINT template_pkey PRIMARY KEY (id_template)
);


-- concorsi.tipo_evento definition

-- Drop table

-- DROP TABLE tipo_evento;

CREATE TABLE tipo_evento (
	id_tipoevento numeric(2) NOT NULL,
	nome_tipo_evento varchar(20) NULL,
	"template" numeric(2) NULL,
	CONSTRAINT tipo_evento_pkey PRIMARY KEY (id_tipoevento)
);


-- concorsi.page_security_mappings definition

-- Drop table

-- DROP TABLE page_security_mappings;

CREATE TABLE page_security_mappings (
	uri varchar(255) NOT NULL,
	profile_id numeric(2) NOT NULL,
	CONSTRAINT page_security_mappings_pk PRIMARY KEY (uri, profile_id),
	CONSTRAINT profilo_fk FOREIGN KEY (profile_id) REFERENCES profilo(id_profilo)
);


-- concorsi.tipo_evento_task definition

-- Drop table

-- DROP TABLE tipo_evento_task;

CREATE TABLE tipo_evento_task (
	tipo_evento numeric(4) NOT NULL,
	task numeric(4) NOT NULL,
	transaction_required bpchar(1) NULL,
	CONSTRAINT tipo_evento_task_pk PRIMARY KEY (tipo_evento, task),
	CONSTRAINT tipo_evento_task_t_e_fk FOREIGN KEY (tipo_evento) REFERENCES tipo_evento(id_tipoevento),
	CONSTRAINT tipo_evento_task_task_fk FOREIGN KEY (task) REFERENCES task(id)
);


-- concorsi.transition definition

-- Drop table

-- DROP TABLE transition;

CREATE TABLE transition (
	id numeric(4) NOT NULL,
	origine numeric(2) NULL,
	destinazione numeric(2) NULL,
	CONSTRAINT transition_pk PRIMARY KEY (id),
	CONSTRAINT destination_state_fk FOREIGN KEY (destinazione) REFERENCES stato(id_stato),
	CONSTRAINT origin_state_fk FOREIGN KEY (origine) REFERENCES stato(id_stato)
);


-- concorsi.transition_task definition

-- Drop table

-- DROP TABLE transition_task;

CREATE TABLE transition_task (
	transition numeric(4) NOT NULL,
	task numeric(4) NOT NULL,
	profilo numeric(2) NOT NULL,
	transaction_required bpchar(1) NULL,
	CONSTRAINT transition_task_pk PRIMARY KEY (transition, task, profilo),
	CONSTRAINT transition_task_profilo_fk FOREIGN KEY (profilo) REFERENCES profilo(id_profilo),
	CONSTRAINT transition_task_task_fk FOREIGN KEY (task) REFERENCES task(id),
	CONSTRAINT transition_task_transition_fk FOREIGN KEY (transition) REFERENCES transition(id)
);


-- concorsi.transition_template definition

-- Drop table

-- DROP TABLE transition_template;

CREATE TABLE transition_template (
	transition numeric(4) NOT NULL,
	"template" numeric(4) NOT NULL,
	profilo numeric(2) NOT NULL,
	CONSTRAINT transition_template_pk PRIMARY KEY (transition, profilo),
	CONSTRAINT transition_template_profilo_fk FOREIGN KEY (profilo) REFERENCES profilo(id_profilo),
	CONSTRAINT transition_template_template_fk FOREIGN KEY (template) REFERENCES template(id_template),
	CONSTRAINT transition_template_transition_fk FOREIGN KEY (transition) REFERENCES transition(id)
);


-- concorsi.utente definition

-- Drop table

-- DROP TABLE utente;

CREATE TABLE utente (
	userid varchar(50) NOT NULL,
	"password" varchar(32) NULL,
	nome varchar(20) NULL,
	cognome varchar(20) NULL,
	profilo numeric(2) NOT NULL,
	e_mail varchar(50) NULL,
	telefono varchar(40) NULL,
	struttura varchar(10) NULL,
	enabled bpchar(1) NOT NULL DEFAULT 'y'::bpchar,
	note varchar(100) NULL,
	mail_stop bpchar(1) NOT NULL DEFAULT 'n'::bpchar,
	blurred varchar(100) NULL,
	CONSTRAINT utente_pkey PRIMARY KEY (userid),
	CONSTRAINT struttura FOREIGN KEY (struttura) REFERENCES strutture(codice_struttura)
);


-- concorsi."_authorization" definition

-- Drop table

-- DROP TABLE "_authorization";

CREATE TABLE "_authorization" (
	profilo numeric(2) NOT NULL,
	transition numeric(5) NOT NULL,
	CONSTRAINT authorization_pk PRIMARY KEY (profilo, transition),
	CONSTRAINT authorization_profilo_fk FOREIGN KEY (profilo) REFERENCES profilo(id_profilo),
	CONSTRAINT authorization_transition_fk FOREIGN KEY (transition) REFERENCES transition(id)
);


-- concorsi.esperto_categoria definition

-- Drop table

-- DROP TABLE esperto_categoria;

CREATE TABLE esperto_categoria (
	esperto varchar(50) NOT NULL,
	categoria numeric(9) NOT NULL,
	CONSTRAINT esperto_categoria_pkey PRIMARY KEY (esperto, categoria),
	CONSTRAINT categoria_fk FOREIGN KEY (categoria) REFERENCES categoria(id_categoria),
	CONSTRAINT utente_fk FOREIGN KEY (esperto) REFERENCES utente(userid)
);


-- concorsi.faq definition

-- Drop table

-- DROP TABLE faq;

CREATE TABLE faq (
	id_faq numeric(9) NOT NULL,
	titolo varchar(50) NULL,
	descrizione varchar(4000) NULL,
	categoria numeric(9) NULL,
	originatore varchar(50) NULL,
	CONSTRAINT faq_pkey PRIMARY KEY (id_faq),
	CONSTRAINT categoria_fk FOREIGN KEY (categoria) REFERENCES categoria(id_categoria),
	CONSTRAINT utente_fk FOREIGN KEY (originatore) REFERENCES utente(userid)
);


-- concorsi.messaggio definition

-- Drop table

-- DROP TABLE messaggio;

CREATE TABLE messaggio (
	id_msg numeric(5) NOT NULL,
	testo varchar(4000) NOT NULL,
	"data" timestamp NOT NULL,
	enabled bpchar(1) NOT NULL DEFAULT 'y'::bpchar,
	originatore varchar(50) NOT NULL,
	CONSTRAINT pk_messaggio PRIMARY KEY (id_msg),
	CONSTRAINT utente_fk FOREIGN KEY (originatore) REFERENCES utente(userid)
);


-- concorsi.post_conditions definition

-- Drop table

-- DROP TABLE post_conditions;

CREATE TABLE post_conditions (
	transition numeric(4) NOT NULL,
	"condition" numeric(4) NOT NULL,
	CONSTRAINT post_conditions_pk PRIMARY KEY (transition, condition),
	CONSTRAINT post_conditions_condition_fk FOREIGN KEY (condition) REFERENCES condition(id),
	CONSTRAINT post_conditions_transition_fk FOREIGN KEY (transition) REFERENCES transition(id)
);


-- concorsi.pre_conditions definition

-- Drop table

-- DROP TABLE pre_conditions;

CREATE TABLE pre_conditions (
	transition numeric(4) NOT NULL,
	"condition" numeric(4) NOT NULL,
	CONSTRAINT pre_conditions_pk PRIMARY KEY (transition, condition),
	CONSTRAINT pre_conditions_condition_fk FOREIGN KEY (condition) REFERENCES condition(id),
	CONSTRAINT pre_conditions_transition_fk FOREIGN KEY (transition) REFERENCES transition(id)
);


-- concorsi.segnalazione definition

-- Drop table

-- DROP TABLE segnalazione;

CREATE TABLE segnalazione (
	id_segnalazione numeric(18) NOT NULL,
	titolo varchar(1024) NULL,
	descrizione varchar NOT NULL,
	categoria numeric(9) NOT NULL,
	stato numeric(2) NULL,
	originatore varchar(50) NULL,
	esperto varchar(50) NULL,
	flagfaq numeric(2) NULL,
	priorita numeric(2) NULL,
	validatore varchar(50) NULL,
	CONSTRAINT segnalazione_pkey PRIMARY KEY (id_segnalazione),
	CONSTRAINT categoria_fk FOREIGN KEY (categoria) REFERENCES categoria(id_categoria),
	CONSTRAINT esperto_fk FOREIGN KEY (esperto) REFERENCES utente(userid),
	CONSTRAINT originatore_fk FOREIGN KEY (originatore) REFERENCES utente(userid),
	CONSTRAINT stato_fk FOREIGN KEY (stato) REFERENCES stato(id_stato),
	CONSTRAINT validatore_fk FOREIGN KEY (validatore) REFERENCES utente(userid)
);


-- concorsi.evento definition

-- Drop table

-- DROP TABLE evento;

CREATE TABLE evento (
	segnalazione numeric(18) NOT NULL,
	datetime timestamp NOT NULL,
	tipo_evento numeric(2) NOT NULL,
	stato numeric(2) NOT NULL,
	categoria numeric(9) NOT NULL,
	nota varchar(4000) NULL,
	originatore varchar(50) NULL,
	hidden bpchar(1) NOT NULL DEFAULT 'n'::bpchar,
	alterable bpchar(1) NOT NULL DEFAULT 'n'::bpchar,
	CONSTRAINT evento_pkey PRIMARY KEY (segnalazione, datetime),
	CONSTRAINT segnalazione_fk FOREIGN KEY (segnalazione) REFERENCES segnalazione(id_segnalazione),
	CONSTRAINT tipo_evento_fk FOREIGN KEY (tipo_evento) REFERENCES tipo_evento(id_tipoevento),
	CONSTRAINT utente_fk FOREIGN KEY (originatore) REFERENCES utente(userid)
);
