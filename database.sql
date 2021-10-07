CREATE TABLE `player` (
  `player_id` INTEGER(5)NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `team` VARCHAR(30) NOT NULL,
  `number`INTEGER(3) NOT NULL,
  `name`VARCHAR(50) NOT NULL
);
INSERT INTO `player` (team, number, name)
VALUES ('Bulls', 24, 'Michael Jordan');

INSERT INTO `player` (`team`, `number`, `name`)
VALUES ('Lakers', 34, 'Shaquille O''Neal'), ('Jazz', 32, 'Karl Malone');
# Note that it is two-single quotes between O and Neal

UPDATE `player`
SET `number` = 23
WHERE `player_id` = 1;

DELETE FROM `player`
WHERE `player_id` = 1;

TRUNCATE TABLE `player`;