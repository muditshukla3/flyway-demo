CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "flyway-test".authors
(
  id uuid NOT NULL,
  name character varying COLLATE pg_catalog."default" NOT NULL,
  active boolean NOT NULL,
  CONSTRAINT authors_pkey PRIMARY KEY (id)
);