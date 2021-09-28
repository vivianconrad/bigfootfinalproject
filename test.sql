.header on
.mode column

-- CREATE USER `db_user`
-- IDENTIFIED BY 'db_password'

-- GRANT all
-- on 
-- to

CREATE TABLE if not exists sightings (
  location VARCHAR,
  times_spotted INTEGER,
  first_sighting DATE,
  most_recent_sighting DATE
);

INSERT INTO sightings VALUES
  ('Oklahoma', 3, '1953-05-29', '2020-02-19'),
  ('Texas', 6, '1923-12-02', '2009-12-20'),
  ('Nebraska', 9, '1999-01-28', '2021-08-10'),
  ('New York', 2, '2007-06-12', '2015-07-02');

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