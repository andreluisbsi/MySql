CREATE DATABASE IF NOT EXISTS hospital
DEFAULT CHARACTER SET utf8;
USE hospital;
CREATE TABLE IF NOT EXISTS 	Medico (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
crm VARCHAR(45) NOT NULL,
cpf CHAR(11) NOT NULL,
telefone CHAR(11) NOT NULL,
datanasc DATE NOT NULL,
residente ENUM('S', 'N') NOT NULL
);
CREATE TABLE IF NOT EXISTS Paciente (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nome VARCHAR(45) NOT NULL,
cpf CHAR(11) NOT NULL,
planosaude ENUM('S', 'N') NOT NULL DEFAULT 'N'
);
CREATE TABLE IF NOT EXISTS Consulta (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
horario DATETIME NOT NULL,
diagnostico VARCHAR(45) NOT NULL,
Medico_id INT NOT NULL,
Paciente_id INT NOT NULL,
FOREIGN KEY (Medico_id) REFERENCES Medico(id),
FOREIGN KEY (Paciente_id) REFERENCES Paciente(id)
);
INSERT INTO Medico VALUES 
(0, 'Joao','12345','111111111','11122655676','2022-09-25','N'),
(0, 'Andre','12345','11222222','11122655696','2022-02-20','N');

INSERT INTO Paciente VALUES 
(0, 'Ana V.', '123456566', 'S'),
(0, 'Henrique.', '738278372', 'N'),
(0, 'Fabio.', '1234567867', 'S');
INSERT INTO Consulta VALUES 
(0, '2022-11-16 14:00:00', 'refluxo', 1, 2),
(0, '2022-12-03 15:00:00', 'gastrite', 1, 4);

select * FROM hospital.medico;

SELECT 
consulta.id,
consulta.horario,
Medico.nome,
Paciente.nome,
Consulta.diagnostico
FROM Consulta INNER JOIN Medico
ON Consulta.Medico_id = Medico.id
INNER JOIN Paciente
ON Consulta.Paciente_id = Paciente.id
ORDER BY horario;
SELECT 
Medico.nome,
Consulta.horario
FROM Consulta RIGHT JOIN Medico
ON Consulta.Medico_id= Medico.id;

SELECT COUNT(*) FROM Consulta;
SELECT COUNT(DISTINCT Medico_id) FROM Consulta;
SELECT COUNT(DISTINCT Medico_id) FROM Consulta;
SELECT Paciente.nome
FROM Paciente 
WHERE nome NOT IN (SELECT Paciente.nome FROM Consulta INNER JOIN Paciente ON consulta.Paciente_id = Paciente.id);
SELECT Paciente.nome
FROM Paciente
WHERE nome IN (SELECT Paciente.nome FROM Consulta INNER JOIN Paciente ON Consulta.Paiente_id = Paciente.id);


