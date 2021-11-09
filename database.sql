/* clears tables so that it doesnt just skip over edits */
#SET FOREIGN_KEY_CHECKS=0;
# DROP TABLE IF EXISTS  user ,  sightings ,   recent_ visit ,  admin ;
# SET FOREIGN_KEY_CHECKS=1;

USE BigFootDatabase;

/*create schemas*/
CREATE SCHEMA site_access;
CREATE SCHEMA site_data;
CREATE SCHEMA site_admins
CREATE SCHEMA background_research;

/* create user logins */

CREATE LOGIN AndrewDuckworth 
    WITH PASSWORD = 'password';  
GO  
CREATE USER AndrewDuckworth FOR LOGIN AndrewDuckworth;  
GO  

CREATE LOGIN ViConrad
    WITH PASSWORD = 'password1';  
GO  
CREATE USER ViConrad FOR LOGIN ViConrad;  
GO  

CREATE LOGIN SamerAl-khateeb
    WITH PASSWORD = 'password2';  
GO  
CREATE USER SamerAl-khateeb FOR LOGIN SamerAl-khateeb;  
GO  

/* Create tables */
CREATE TABLE IF NOT EXISTS  site_access.users (
  user_id  INT NOT NULL AUTO_INCREMENT,
  username  VARCHAR(10) NOT NULL,
  NAME VARCHAR(60) not null,
  email VARCHAR(30),
  tel VARCHAR(14),
  PRIMARY KEY ( username , user_id )
); 


CREATE TABLE IF NOT EXISTS  site_access.admin  (
  admin_id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME VARCHAR(60),
  email VARCHAR(30),
  tel VARCHAR(14)
); 

CREATE TABLE IF NOT EXISTS  site_data.sightings  (
  sighting_id  INT NOT NULL,
  username  VARCHAR(10) NOT NULL,
  location  VARCHAR(60) NOT NULL,
  times_spotted INTEGER NOT NULL,
  first_sighting DATE NOT NULL,
  most_recent_sighting DATE NOT NULL,
  city VARCHAR(20),
  state VARCHAR(2),
  history VARCHAR(255),
  title VARCHAR(40),
  PRIMARY KEY ( username , sighting_id )
); 

CREATE TABLE if not exists  site_data. recent_ visit  (
  most_recent_sighting  date primary key not null,
  location  VARCHAR(60) NOT NULL,
  user_id  VARCHAR(10));

CREATE TABLE background_research.additional_resources
(
  source_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Title varchar(40) NOT NULL,
  author varchar(32),
  media_type varchar(10) not NULL,
  description varchar(255) NOT NULL,
  ISBN varchar(20)
);

CREATE TABLE sources
(
  source_id int NOT NULL AUTO_INCREMENT,
  title varchar(60) NOT NULL,
  author varchar(32),
  media_type varchar(10) not NULL,
  description varchar(255) NOT NULL,
  ISBN varchar(20),
  PRIMARY KEY ( source_id , title )
);

ALTER TABLE sightings
	ADD CONSTRAINT  sightings_fk  FOREIGN KEY (username) REFERENCES  users(username) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT sightings_fk2  FOREIGN KEY ( most_recent_sighting ) REFERENCES   recent_ visit(most_recent_sighting ) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT  sightings_fk3  FOREIGN KEY (title) REFERENCES sources(title) ON DELETE CASCADE ON UPDATE CASCADE;

/* fill  tables */
INSERT INTO  users  ( name ,  username ,  email )
VALUES ('Michael Jordan', 'Bulls24', 'mjordan@gmail.com'),
('Shaquille O''Neal', 'Lakers34', 'shaq@gmail.com'),
('Karl Malone', 'Jazz32', 'jazz@gmail.com');

INSERT INTO sightings ( location ,  times_spotted ,  first_sighting ,  most_recent_sighting )
  ('Oklahoma', 3, '1953-05-29', '2020-02-19'),
  ('Texas', 6, '1923-12-02', '2009-12-20'),
  ('Nebraska', 9, '1999-01-28', '2021-08-10'),
  ('New York', 2, '2007-06-12', '2015-07-02');

UPDATE  users 
SET email = 'shaq.the.best@gmail.com'
WHERE username = 'Lakers34';

INSERT INTO users (name,Email,tel) VALUES ('Samer Al-khateeb','sameral-khateeb1@creighton.edu','501-000-0000');

INSERT INTO additional_resources (Title, author, media_type) 
VALUES ('Large feet','Dave Davidson', 'Book'),
('Large feet2','Dave Davidson', 'Book'),
('Bigfoot Sightings in North America','Rich Richardson', 'Website')
;

DROP SCHEMA IF EXISTS site_admins;

delete from sightings where location = 'Nebraska';

.print 'average sighting amount'
SELECT avg(times_spotted) AS avg_sightings
FROM sightings;

.print
.print 'number of encounters per century'
SELECT
  strftime(
    '%Y',
    date(first_sighting)
  ) / 100 + 1 AS century,
  count(*) AS first_time
FROM sightings
GROUP BY century;