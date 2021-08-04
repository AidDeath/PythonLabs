DELETE FROM participants WHERE FullName = 'Newebie AlterEgo';

INSERT INTO participants (FullName, Address, ParticipateDate, IsActiveMember)
  VALUES ('Newebie AlterEgo', 'Meadow Shade lane 33', CURDATE(), 1);

UPDATE participants p SET p.Address = 'NY, international park square, 12' WHERE p.FullName = 'Newebie AlterEgo';

-- Список собак и хозяев
SELECT p.FullName, p.Address, d.Name, b.BreedName 
FROM participants p 
JOIN dogs d ON p.Id = d.OwnerId 
JOIN breeds b ON d.BreedId = b.Id;

-- Люди, учавствовавшие в выставках
SELECT DISTINCT FullName
FROM participatorsofexcibition p 
JOIN participants p1 ON p.ParticipantId = p1.Id;

-- Выставки с 01,01,2021 и до текущего момента
SELECT e.ExcibitionName, e.Date FROM excibitions e WHERE e.Date BETWEEN '2021-01-01' AND NOW();

-- Члены клуба без собак
SELECT p.FullName FROM participants p WHERE (SELECT 1 FROM dogs WHERE OwnerId = p.Id)  IS NULL