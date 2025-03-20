CREATE DATABASE entregaIndividual;
use entregaIndividual;

CREATE TABLE usuarioCNPJ (
idUsuarioCNPJ int primary key auto_increment,
nome VARCHAR(30),
email VARCHAR(30),
telefone VARCHAR(30),
senha VARCHAR(30)
);

INSERT INTO usuarioCNPJ (nome, email, telefone, senha) VALUES
('Hospital São Lucas', 'contato@saolucas.com', '1134567890', 'Hosp123@'),
('Hospital Santa Maria', 'atendimento@santamaria.com', '2198765432', 'Santa#456'),
('Clínica Vida', 'info@clinicavida.com', '3191234567', 'Vida!789'),
('Hospital do Coração', 'suporte@hcor.com', '1192345678', 'Coração$321'),
('Hospital Central', 'contato@hospitalcentral.com', '2195678901', 'Central@654');

ALTER TABLE usuarioCNPJ ADD COLUMN filiais varchar(20)
constraint chkfiliais
check (filiais IN ('sim', 'não'));

UPDATE usuarioCNPJ set filiais = 'sim'
where idUsuarioCNPJ = 5;

UPDATE usuarioCNPJ set filiais = 'sim'
where idUsuarioCNPJ = 4;

UPDATE usuarioCNPJ set filiais = 'não'
where idUsuarioCNPJ = 3;

UPDATE usuarioCNPJ set filiais = 'sim'
where idUsuarioCNPJ = 2;

UPDATE usuarioCNPJ set filiais = 'não'
where idUsuarioCNPJ = 1;

 ALTER TABLE usuarioCNPJ 
ADD COLUMN CNPJ VARCHAR(18);

ALTER TABLE usuarioCNPJ 
ADD COLUMN endereco VARCHAR(100);

UPDATE usuarioCNPJ 
SET CNPJ = '12.345.678/0001-90', endereco = 'Rua das Flores, 123 - São Paulo, SP'
WHERE idUsuarioCNPJ = 1;

UPDATE usuarioCNPJ 
SET CNPJ = '98.765.432/0001-10', endereco = 'Av. Central, 456 - Rio de Janeiro, RJ'
WHERE idUsuarioCNPJ = 2;

UPDATE usuarioCNPJ 
SET CNPJ = '56.789.123/0001-55', endereco = 'Rua da Saúde, 789 - Belo Horizonte, MG'
WHERE idUsuarioCNPJ = 3;

UPDATE usuarioCNPJ 
SET CNPJ = '23.456.789/0001-77', endereco = 'Praça da Esperança, 101 - Salvador, BA'
WHERE idUsuarioCNPJ = 4;

UPDATE usuarioCNPJ 
SET CNPJ = '34.567.890/0001-88', endereco = 'Alameda Médica, 202 - Curitiba, PR'
WHERE idUsuarioCNPJ = 5;

SELECT * FROM usuarioCNPJ;

SELECT nome, CNPJ FROM usuarioCNPJ;

SELECT * FROM usuarioCNPJ WHERE filiais = 'sim';

SELECT * FROM usuarioCNPJ WHERE filiais = 'não';

SELECT * FROM usuarioCNPJ WHERE nome LIKE '%C%';


CREATE TABLE usuarioCPF (
idUsuarioCPF int primary key auto_increment,
nome VARCHAR(30),
email VARCHAR(30),
whatsapp VARCHAR(30),
senha VARCHAR(30)
);

ALTER TABLE usuarioCPF 
ADD COLUMN hospital VARCHAR(30);

INSERT INTO usuarioCPF (nome, email, whatsapp, senha, hospital) VALUES
('João Silva', 'joao.silva@email.com', '11987654321', 'Senha@123', 'Hospital Central'),
('Beatriz Lima', 'beatriz.lima@email.com', '11955554444', 'Bia@789', 'Hospital Central'),
('Gustavo Mendes', 'gustavo.mendes@email.com', '11988887777', 'Guga#321', 'Hospital Central'),
('Maria Souza', 'maria.souza@email.com', '21976543210', 'Segura!456', 'Hospital do Coração'),
('Roberto Nunes', 'roberto.nunes@email.com', '21999998888', 'Robo@123', 'Hospital do Coração'),
('Clara Ferreira', 'clara.ferreira@email.com', '21966667777', 'Clara#654', 'Hospital do Coração'),
('Carlos Oliveira', 'carlos.oliveira@email.com', '31965432109', 'Pass#789', 'Clínica Vida'),
('Juliana Ramos', 'juliana.ramos@email.com', '31977776666', 'Juju!987', 'Clínica Vida'),
('Fernando Alves', 'fernando.alves@email.com', '31922223333', 'Fê@741', 'Clínica Vida'),
('Ana Pereira', 'ana.pereira@email.com', '11954321098', 'Chave$321', 'Hospital São Lucas'),
('Ricardo Martins', 'ricardo.martins@email.com', '11933334444', 'Rick#852', 'Hospital São Lucas'),
('Tatiane Borges', 'tatiane.borges@email.com', '11911112222', 'Tati@963', 'Hospital São Lucas'),
('Fernanda Costa', 'fernanda.costa@email.com', '21943210987', 'Acesso!654', 'Hospital Santa Maria'),
('Lucas Vieira', 'lucas.vieira@email.com', '21955556666', 'Luk#159', 'Hospital Santa Maria'),
('Camila Rocha', 'camila.rocha@email.com', '21988889999', 'Cam@357', 'Hospital Santa Maria');

SELECT * FROM usuarioCPF;

SELECT nome, whatsapp FROM usuarioCPF;

SELECT * FROM usuarioCPF WHERE hospital = '%ção%';

SELECT * FROM usuarioCPF WHERE whatsapp = '21976543210';

SELECT * FROM usuarioCPF ORDER BY nome ASC;

SELECT * FROM usuarioCPF WHERE nome LIKE '%Ricardo%';

SELECT * FROM usuarioCPF WHERE senha LIKE '%@%';

CREATE TABLE medicao (
idMedicao INT primary key auto_increment,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2)
);

ALTER TABLE medicao ADD COLUMN statusSensor varchar(20)
constraint chkstatusSensor
check (statusSensor IN ('funcionando', 'não funcionando'));


INSERT INTO medicao (temperatura, umidade, statusSensor) VALUES
(23.5, 60.0, 'funcionando'),
(24.2, 58.5, 'funcionando'),
(0.0, 0.0, 'não funcionando'),
(21.4, 70.2, 'funcionando'),
(25.1, 50.0, 'funcionando');

SELECT * FROM medicao;

SELECT * FROM medicao WHERE statusSensor = 'funcionando';

SELECT * FROM medicao WHERE statusSensor = 'não funcionando';

SELECT temperatura, umidade FROM medicao;

SELECT * FROM medicao WHERE temperatura > 24;

SELECT * FROM medicao WHERE umidade > 60;

SELECT * FROM medicao WHERE statusSensor = 'não funcionando' AND umidade > 60;