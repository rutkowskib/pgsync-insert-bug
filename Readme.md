How to reproduce the issue

1. Clone the repo
2. Run `docker compose up --build`
3. Execute `INSERT INTO public.room_users (room_id, user_id) VALUES ((SELECT "id" FROM "public"."room"), (SELECT "id" FROM "public"."users"));`
