-- create database ph;

-- Creating a table 

-- create table person(
-- person_id SERIAL,
-- first_name VARCHAR(50),
-- last_name VARCHAR(50),
-- age INTEGER,
-- is_active BOOLEAN,
-- dob DATE
-- )

-- alter table person rename to "user";

-- drop table "user";

-- CREATE TABLE person2 (
-- id serial PRIMARY KEY,
-- user_name VARCHAR(20) NOT NULL,
-- age INTEGER CHECK(age>=18)
-- )

-- CREATE TABLE person4 (
--   id serial,
--   user_name VARCHAR(20) NOT NULL,
--   age INTEGER CHECK(age >= 18),
--   PRIMARY KEY(id,user_name),
--   UNIQUE(user_name, age)
-- );

-- insert into person2(id,user_name,age) values(1,'sazid', 26);

-- INSERT INTO person2(id,user_name,age) VALUES(3,'lisa', 28), (4,'shakil', 29);

INSERT INTO person2 VALUES(7,'Firoza', 14);