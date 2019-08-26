CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "blogs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "content" text, "title" text, "category" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "picture" varchar, "impressions_count" integer DEFAULT 0, "images" json);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" text, "email" text, "category" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "impressions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "impressionable_type" varchar, "impressionable_id" integer, "user_id" integer, "controller_name" varchar, "action_name" varchar, "view_name" varchar, "request_hash" varchar, "ip_address" varchar, "session_hash" varchar, "message" text, "referrer" text, "params" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "impressionable_type_message_index" ON "impressions" ("impressionable_type", "message", "impressionable_id");
CREATE INDEX "poly_request_index" ON "impressions" ("impressionable_type", "impressionable_id", "request_hash");
CREATE INDEX "poly_ip_index" ON "impressions" ("impressionable_type", "impressionable_id", "ip_address");
CREATE INDEX "poly_session_index" ON "impressions" ("impressionable_type", "impressionable_id", "session_hash");
CREATE INDEX "controlleraction_request_index" ON "impressions" ("controller_name", "action_name", "request_hash");
CREATE INDEX "controlleraction_ip_index" ON "impressions" ("controller_name", "action_name", "ip_address");
CREATE INDEX "controlleraction_session_index" ON "impressions" ("controller_name", "action_name", "session_hash");
CREATE INDEX "poly_params_request_index" ON "impressions" ("impressionable_type", "impressionable_id", "params");
CREATE INDEX "index_impressions_on_user_id" ON "impressions" ("user_id");
CREATE TABLE "images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "blog_id" integer, "picture" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20190801164435'),
('20190801164517'),
('20190807115815'),
('20190818181538'),
('20190818183220'),
('20190819111948'),
('20190826180013');


