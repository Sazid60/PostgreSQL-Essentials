# PostgreSQL-Essentials

## 7-1 Solving The First Case Study

### Case Study Example

A Medical Database System is needed to enhance the efficiency and effectiveness of healthcare services. This system will be able to seamlessly integrates the information of patients, doctors, appointments, medical records, and medical facilities.

**Entities:**

1. **Patients:**
   - Attributes: PatientID (Primary Key), FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email
2. **Doctors:**
   - Attributes: DoctorID (Primary Key), FirstName, LastName, Specialization, ContactNumber, Email
3. **Appointments:**
   - Attributes: AppointmentID (Primary Key), PatientID (Foreign Key), DoctorID (Foreign Key), AppointmentDate, AppointmentTime, Status
4. **Medical Records:**
   - Attributes: RecordID (Primary Key), AppointmentID (Foreign Key), Diagnosis, Prescription, TestResults, createdAt
5. **Medical Facilities:**
   - Attributes: FacilityID (Primary Key), FacilityName, Location, ContactNumber

**Relationships:**

- Patients can have multiple appointments with different doctors.
- Doctors can have multiple appointments with different patients.
- Each appointment may have a corresponding medical record, and vice versa.
- A medical facility can have multiple doctors, and a doctor can work in multiple medical facilities.
- This relationship is represented through a junction table.

![alt text](image.png)

## 7-2 Exploring PSQL and Its Default Behavior

- we can run PSQL in our windows terminal as well.
- open the powershell in administrator mode.
- If the powershell do not run the psql command then we have to set the environment variable.

![alt text](image-1.png)
![alt text](image-2.png)
![alt text](image-3.png)
![alt text](image-4.png)

- `psql -U postgres` use this command to set the psql user. here we are not giving the database name and this will take us to the postgres named user names database postgres by default.

![alt text](image-5.png)

![alt text](image-6.png)

- We will not use the postgres database as it is admin type database. so we will use different created database.

![alt text](image-7.png)

- Here the templates re the blue print of the database that we are going to create. In the templates there is already added what functionalities a database will have and what will be the constrains and how the features of a database is implemented all are built in the templates. using the templates the regular database are created. Here template0 is used to create template1. We will use template1 to create the database. and the template0 is given for backup. postgres database is also made on the template1. If we make any changes in the template1 All the database made will get the change.

- `\c template1` lets move to the template1

![alt text](image-9.png)

- `create database test_db;` - this will create a database using the template1. as the template1 is used in another terminal there will be error

![alt text](image-8.png)

- Switch to postgres

![alt text](image-10.png)

- `create database test_db;` will now create a database.

![alt text](image-11.png)

![alt text](image-12.png)

- While creating the database we can tell all the things that are by default to modify them while creating.

```ts
  CREATE DATABASE name
[ WITH ] [ OWNER [=] user_name ]
       [ TEMPLATE [=] template ]
       [ ENCODING [=] encoding ]
       [ STRATEGY [=] strategy ]
       [ LOCALE [=] locale ]
       [ LC_COLLATE [=] lc_collate ]
       [ LC_CTYPE [=] lc_ctype ]
       [ BUILTIN_LOCALE [=] builtin_locale ]
       [ ICU_LOCALE [=] icu_locale ]
       [ ICU_RULES [=] icu_rules ]
       [ LOCALE_PROVIDER [=] locale_provider ]
       [ COLLATION_VERSION = collation_version ]
       [ TABLESPACE [=] tablespace_name ]
       [ ALLOW_CONNECTIONS [=] allowconn ]
       [ CONNECTION LIMIT [=] connlimit ] // at a time how many users
       [ IS_TEMPLATE [=] istemplate ]
       [ OID [=] oid ]

```

- this is not that necessary but we can do. `create database test_db2 with template template0;` we have used this to change the database template. `[ CONNECTION LIMIT [=] connlimit ]` this field is for limiting the users.
- `psql -U postgres -d test_db` This will take us to the test_db database

## 7-3 User, Role And Privilege Management In Postgres

### Schema

- lets understand the database schema. When we create a database a public schema is created b y default. If we want we can make other schema under the public schema. under the schema we can create the tables. `/dn` will show the available schema of the database.

![alt text](image-13.png)

- basically we will do all the works in public schema.
- Schema is like a box. A database might have multiple table. the tables are separated in schema box. suppose we have a table named employee under public employee. if we want to access we will say `public.employee`, here is public is schema name. and if we do not give any schema name it will grab the public schema by default.

### User Management in Postgres

- `\du` this will show the users of the database

![alt text](image-14.png)

- Here are some attributes which are some privilege collection. the privileges are like we are giving permission for doing something. A user can update, delete, insert anything or not those are called privilege. some privilege all together makes attributes. we always skip the super user and make it like small work access to a user. since if anyone gets the access of the postgres access he will ruin our database as the postgres is super user.

- `create user user1` this will create a user.
- `create user user1 with login encrypted password '123456';` this will create a user who will have login attribute and will have a encrypted password .

![alt text](image-15.png)

![alt text](image-16.png)

- `create role user1 with login encrypted password '123456';` this will create a role same like user.

![alt text](image-17.png)

- We can login the created user using the created one in psql

![alt text](image-18.png)

- If we use powershell we have to write `psql -U user1 -U postgres`

![alt text](image-19.png)

- as there is no table lets make a table using `create table test_table(name varchar(50));`

![alt text](image-20.png)

- using `\d` we can see the tables
- lets insert a data to the table using `insert into test_table(name) values('Sazid');`
- if we ant to see everything inside the table `select * from test_table;`

![alt text](image-21.png)

## 7-4 Granting and Revoking Privileges

![alt text](image-22.png)

- here we are as user who have no permission given. thats why we can not select all the columns of table using `select * from test_table;`.
- now we want to give permission to the user1 from where we have logged in as postgres super user.
- `grant all privileges on test_table to user1;` this will give the user1 all the access of doing read write and all.

![alt text](image-23.png)

- now from where we are logged in we are getting the access of the table.

- `insert into test_table(name) values('Shakil');` we can insert as well by using User1.

![alt text](image-24.png)

- now make a user who will not get all the access. he just can see the data. `create user user2 with encrypted password '123456';`

- open another tab and access using user2

![alt text](image-25.png)

- from the main postgres logged in terminal `grant select on test_table to user2` using this will allow the user2 to just select and show.

![alt text](image-26.png)

- From here we can see the table but can not insert as we have not gave te access to write.
- we can take back the permission as well using `revoke select on test_table from user2;`.

![alt text](image-27.png)

- `grant all privileges on all tables in schema public to user2;` this command will give all the access of the all the tables of the public schema to user2. u7ser2 can insert update delete on public schema.
- we can create role can act as user or a role can be given as privilege/attribute to a user.
- `grant select on all tables in schema public to role1;` we are giving selecting permission for all tables of public schema to role1

- `create user user3 with encrypted password '123456';` now creating a user and give the privileges of role1.

![alt text](image-28.png)

- `grant role1 to user3;` this will give the role1 access to the user3. and now on user3 can access all the tables of the public schema.

![alt text](image-29.png)

- now user3 can access the tables but can not insert in the table

![alt text](image-30.png)

- this is supposed to happen.
- we can use a user as the privilege/attribute of another user

## 7-5 Structured Query Language(SQL)

#### What is Structured Query Language(SQL)?

- It is a query language by using this we can do queries. This is specific domain language. By using this language we do communication with database. this is also called `sequel` at the early stage and the full form was standard english query language then the name is changed to sql. this do the query in database, this can grab data can post data, can update data, can delete data and manipulate data. This is a standardized language which works on relational database model. here query means a sql statement.

- `SELECT * FROM test_table` this sis sql statement `SELECT` `FROM` is a sql keyword, `test_table` is a identifier.

- SQL is a declarative language. There are some language that are imperative.
- In declarative language we just have to say what to do. and we do not need to tell how to do.(sql)
- In imperative language we have to tell everything step by step. (java). python is hybrid of imperative and declarative.

![alt text](<WhatsApp Image 2025-05-15 at 13.23.56_01fb1615.jpg>)

#### SQL Commands Are divided into different categories.

![alt text](<WhatsApp Image 2025-05-15 at 13.33.41_33ae5ca6.jpg>)

- **DDL** - Database Definition Language. Used to define and manage database structure(tables, schemas, etc). Think of DDL as "building or breaking the structure of your house".

| Command    | Description                     | Example                                   |
| ---------- | ------------------------------- | ----------------------------------------- |
| `CREATE`   | Creates a new table or database | `CREATE TABLE users (id INT, name TEXT);` |
| `DROP`     | Deletes a table or database     | `DROP TABLE users;`                       |
| `ALTER`    | Modifies an existing table      | `ALTER TABLE users ADD email TEXT;`       |
| `TRUNCATE` | Deletes all data in a table     | `TRUNCATE TABLE users;`                   |

- **DML** - Database Manipulation/Modification Language. Used for modifying data inside existing tables. DML is like cleaning or changing the items inside your house.

| Command  | Description            | Example                                        |
| -------- | ---------------------- | ---------------------------------------------- |
| `INSERT` | Adds new data          | `INSERT INTO users (name) VALUES ('Ali');`     |
| `UPDATE` | Modifies existing data | `UPDATE users SET name = 'Ayan' WHERE id = 1;` |
| `DELETE` | Removes data           | `DELETE FROM users WHERE id = 1;`              |

- **DCL** - Database Control Language for controlling user access. Used for access control — who can see or modify what. DCL is like giving or taking back keys to your house.

| Command  | Description                  | Example                                       |
| -------- | ---------------------------- | --------------------------------------------- |
| `GRANT`  | Gives user access privileges | `GRANT SELECT ON users TO read_only_user;`    |
| `REVOKE` | Removes access privileges    | `REVOKE SELECT ON users FROM read_only_user;` |

- **TCL** - Transaction Control Language. Used to control transactions, especially in cases where multiple steps must succeed together.TCL is like Undo/Redo for your data changes.
- | Command     | Description                                   | Example               |
  | ----------- | --------------------------------------------- | --------------------- |
  | `COMMIT`    | Saves all changes made during the transaction | `COMMIT;`             |
  | `ROLLBACK`  | Undoes changes if something goes wrong        | `ROLLBACK;`           |
  | `SAVEPOINT` | Sets a point to roll back to later            | `SAVEPOINT my_point;` |

- DQL - Data Query Language. Used to fetch data from the database. DQL is like asking questions: "Hey DB, show me this!"

| Command  | Description                 | Example                |
| -------- | --------------------------- | ---------------------- |
| `SELECT` | Retrieves data from a table | `SELECT * FROM users;` |

![alt text](<WhatsApp Image 2025-05-15 at 15.22.12_4b8f9c9d.jpg>)

- sql will be written in backend. sql can be written in raw or we can use orm.
- SQL is a standardized query language and postgres is made based on SQL which is implementation Of SQL. While implementing it changes slightly.
