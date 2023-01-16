CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.room
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT room_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.room
    OWNER to db_user;

CREATE TABLE IF NOT EXISTS public.users
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    name character varying COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.room_users
(
    room_id uuid NOT NULL,
    user_id uuid NOT NULL,
    CONSTRAINT room_users_pkey PRIMARY KEY (room_id, user_id),
    CONSTRAINT room_fk FOREIGN KEY (room_id)
        REFERENCES public.room (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_fk FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE IF EXISTS public.room_users
    OWNER to db_user;

INSERT INTO public.room (name) VALUES ('room1');
INSERT INTO public.users (name) VALUES ('user1');
--INSERT INTO public.room_users (room_id, user_id) VALUES ((SELECT "id" FROM "public"."room"), (SELECT "id" FROM "public"."users"));
