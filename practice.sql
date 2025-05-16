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


-- more practice_____________________________________________________________


CREATE TABLE patient (
patient_id serial PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
dob Date NOT NULL
)

CREATE TABLE doctor (
doctor_id serial,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
specialization TEXT NOT NULL,
contact_number VARCHAR(20) NOT NULL,
email VARCHAR(20) NOT NULL UNIQUE,
PRIMARY KEY(doctor_id)
)

CREATE TABLE appointment (
  appointment_id SERIAL PRIMARY KEY,
  patient_id INTEGER NOT NULL REFERENCES patient(patient_id) ON DELETE CASCADE,
  doctor_id INTEGER NOT NULL REFERENCES doctor(doctor_id) ON DELETE CASCADE,
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL,
  status BOOLEAN NOT NULL DEFAULT FALSE,
  UNIQUE (doctor_id, appointment_date, appointment_time)
);

INSERT INTO patient (first_name, last_name, dob)
VALUES 
  ('Sazid', 'Khan', '1998-06-15'),
  ('Fatima', 'Rahman', '2000-01-25'),
  ('Aamir', 'Ali', '1995-09-10');




ALTER TABLE doctor ALTER COLUMN email TYPE VARCHAR(90);

INSERT INTO doctor (first_name, last_name, specialization, contact_number, email)
VALUES 
  ('Dr. Sarah', 'Malik', 'Cardiology', '1234567890', 'sarah.malik@hospital.com'),
  ('Dr. Ahmed', 'Khan', 'Dermatology', '0987654321', 'ahmed.khan@hospital.com'),
  ('Dr. Anjali', 'Mehta', 'Pediatrics', '1122334455', 'anjali.mehta@hospital.com');

INSERT INTO appointment (patient_id, doctor_id, appointment_date, appointment_time, status)
VALUES 
  (1, 1, '2025-05-20', '10:00:00', FALSE),
  (2, 2, '2025-05-21', '11:30:00', TRUE),
  (3, 3, '2025-05-22', '09:15:00', FALSE),
  (1, 2, '2025-05-23', '14:00:00', FALSE);

