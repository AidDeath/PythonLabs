CREATE DATABASE lab1_sql
CHARACTER SET latin1
COLLATE latin1_swedish_ci;


-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE lab1_sql;

--
-- Create table `breeds`
--
CREATE TABLE breeds (
  Id int(11) NOT NULL AUTO_INCREMENT,
  BreedName varchar(255) NOT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create table `participants`
--
CREATE TABLE participants (
  Id int(11) NOT NULL AUTO_INCREMENT,
  FullName varchar(255) DEFAULT NULL,
  Address varchar(255) DEFAULT NULL,
  ParticipateDate date DEFAULT NULL,
  IsActiveMember varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 2340,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create table `dogs`
--
CREATE TABLE dogs (
  Id int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(50) DEFAULT NULL,
  OwnerId int(11) NOT NULL,
  BreedId int(11) NOT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 3276,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create foreign key
--
ALTER TABLE dogs
ADD CONSTRAINT FK_dogs_BreedId FOREIGN KEY (BreedId)
REFERENCES breeds (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE dogs
ADD CONSTRAINT FK_dogs_OwnerId FOREIGN KEY (OwnerId)
REFERENCES participants (Id) ON DELETE NO ACTION;

--
-- Create table `excibitions`
--
CREATE TABLE excibitions (
  Id int(11) NOT NULL AUTO_INCREMENT,
  ExcibitionName varchar(255) DEFAULT NULL,
  Date datetime DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create table `participatorsofexcibition`
--
CREATE TABLE participatorsofexcibition (
  ParticipantId int(11) NOT NULL,
  DogId int(11) NOT NULL,
  ExcibitionId int(11) NOT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2730,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create foreign key
--
ALTER TABLE participatorsofexcibition
ADD CONSTRAINT FK_participatorsofexcibition_ExcibitionId FOREIGN KEY (ExcibitionId)
REFERENCES excibitions (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE participatorsofexcibition
ADD CONSTRAINT FK_participatorsofexcibition_DogId FOREIGN KEY (DogId)
REFERENCES dogs (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE participatorsofexcibition
ADD CONSTRAINT FK_participatorsofexcibition_ParticipantId FOREIGN KEY (ParticipantId)
REFERENCES participants (Id) ON DELETE NO ACTION;

SET NAMES 'utf8';

INSERT INTO lab1_sql.breeds(Id, BreedName) VALUES
(1, 'Toy-terrier'),
(2, 'Setbernar'),
(3, 'French bulldog'),
(4, 'Mops'),
(5, 'Piccinease');

INSERT INTO lab1_sql.participants(Id, FullName, Address, ParticipateDate, IsActiveMember) VALUES
(2, 'Ioksha Dzmitry', 'Builders  4 / 15', '2021-04-26', '1'),
(3, 'Petrashkevich Pavel', 'Figutive 3 / 45', '2021-04-22', '1'),
(4, 'Semashkevich Alexander', 'Mary Park Lane 14 / 99', '2021-04-19', '1'),
(5, 'Vasilyev Victor', 'Jersey str. build 54', '2021-01-01', '1'),
(6, 'Filler Mark', 'NY, Lessor str 45 / 996', '2021-04-20', '1'),
(7, 'Finn Geklberry', 'Neverland std. 404', '2021-04-11', '0'),
(10, 'Newebie AlterEgo', 'NY, international park square, 12', '2021-04-26', '1');

INSERT INTO lab1_sql.dogs(Id, Name, OwnerId, BreedId) VALUES
(2, 'Header', 2, 3),
(4, 'Locky', 6, 5),
(5, 'Lifter', 3, 2),
(6, 'Nancy', 4, 4),
(7, 'Pickles', 7, 1);


INSERT INTO lab1_sql.excibitions(Id, ExcibitionName, Date) VALUES
(1, 'Global Dog Offencise', '2020-04-00 00:00:00'),
(2, 'Competitions for fun', '2021-04-10 00:00:00'),
(3, 'Lottery for a bag of food prize', '2021-04-02 00:00:00'),
(4, 'March of a immorlality (Dogs part)', '2010-10-10 00:00:00'),
(5, 'Dog fight', '2021-02-11 00:00:00');


INSERT INTO lab1_sql.participatorsofexcibition(ParticipantId, DogId, ExcibitionId) VALUES
(6, 5, 4),
(2, 2, 2),
(6, 4, 5),
(5, 5, 2),
(7, 5, 5),
(4, 6, 4);