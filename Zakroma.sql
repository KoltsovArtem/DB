--drop table if exists groups;
--drop table if exists groups_meals;
--drop table if exists groups_meals_created_by_groups;
--drop table if exists groups_products;
--drop table if exists meals;
--drop table if exists meals_created_by_groups;
--drop table if exists products;
--drop table if exists products_meals;
--drop table if exists products_meals_created_by_groups;
--drop table if exists users;

CREATE TABLE "users" (
  "user_id" integer PRIMARY KEY,
  "group_id" integer,
  "user_name" varchar,
  "password_hash" varchar(64),
  "birth_date" date
);

CREATE TABLE "groups" (
  "group_id" integer PRIMARY KEY,
  "group_name" varchar
);

CREATE TABLE "meals" (
  "meal_id" integer PRIMARY KEY,
  "meal_name" varchar,
  "meal_name_short" varchar,
  "receipt" varchar,
  "proteins" numeric,
  "carbs" numeric,
  "fats" numeric,
  "calories" numeric
);

CREATE TABLE "groups_meals" (
  "meal_id" integer,
  "group_id" integer,
  "time_of_consumption" timestamp,
  "favorites" boolean,
  PRIMARY KEY ("meal_id", "group_id")
);

CREATE TABLE "products" (
  "product_id" integer PRIMARY KEY,
  "product_name" varchar,
  "proteins" numeric,
  "carbs" numeric,
  "fats" numeric,
  "calories" numeric
);

CREATE TABLE "products_meals" (
  "product_id" integer,
  "meal_id" integer,
  "weight" numeric,
  PRIMARY KEY ("product_id", "meal_id")
);

CREATE TABLE "groups_products" (
  "product_id" integer,
  "group_id" integer,
  "product_count" smallint,
  "expiration_date" date,
  PRIMARY KEY ("product_id", "group_id")
);

CREATE TABLE "meals_created_by_groups" (
  "meal_id" integer PRIMARY KEY,
  "meal_name" varchar,
  "meal_name_short" varchar,
  "receipt" varchar,
  "proteins" numeric,
  "carbs" numeric,
  "fats" numeric,
  "calories" numeric
);

CREATE TABLE "groups_meals_created_by_groups" (
  "meal_id" integer,
  "group_id" integer,
  PRIMARY KEY ("meal_id", "group_id")
);

CREATE TABLE "products_meals_created_by_groups" (
  "product_id" integer,
  "meal_id" integer,
  "weight" numeric,
  PRIMARY KEY ("product_id", "meal_id")
);

ALTER TABLE "users" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "groups_meals" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "groups_meals" ADD FOREIGN KEY ("meal_id") REFERENCES "meals" ("meal_id");

ALTER TABLE "products_meals" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");

ALTER TABLE "products_meals" ADD FOREIGN KEY ("meal_id") REFERENCES "meals" ("meal_id");

ALTER TABLE "groups_products" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "groups_products" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");

ALTER TABLE "groups_meals_created_by_groups" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "groups_meals_created_by_groups" ADD FOREIGN KEY ("meal_id") REFERENCES "meals_created_by_groups" ("meal_id");

ALTER TABLE "products_meals_created_by_groups" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");

ALTER TABLE "products_meals_created_by_groups" ADD FOREIGN KEY ("meal_id") REFERENCES "meals_created_by_groups" ("meal_id");

ALTER TABLE "groups_meals" ADD FOREIGN KEY ("meal_id") REFERENCES "meals_created_by_groups" ("meal_id");
