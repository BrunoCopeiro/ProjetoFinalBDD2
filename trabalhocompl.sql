CREATE DATABASE coworking;
USE coworking;

-- ====================
-- Tabela de Cargos
-- ====================
CREATE TABLE Cargos (
    id_cargos INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- ====================
-- Tabela de Usuários
-- ====================
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    id_cargos INT NOT NULL,
    data_criacao DATE NOT NULL,
    FOREIGN KEY (id_cargos) REFERENCES Cargos(id_cargos)
);

-- ====================
-- Tabela de Membros
-- ====================
CREATE TABLE Membros (
    id_membro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- ====================
-- Tabela de Planos
-- ====================
CREATE TABLE Planos (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    acesso_mes INT NOT NULL
);

-- ====================
-- Tabela de Assinaturas
-- ====================
CREATE TABLE Assinaturas (
    id_assinatura INT AUTO_INCREMENT PRIMARY KEY,
    id_membro INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    status ENUM('ativo', 'inativo', 'cancelado') NOT NULL,
    FOREIGN KEY (id_membro) REFERENCES Membros(id_membro),
    FOREIGN KEY (id_plano) REFERENCES Planos(id_plano)
);

-- ====================
-- Tabela de Espaços
-- ====================
CREATE TABLE Espaco (
    id_espaco INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('mesa_compartilhada','escritorio_privativo','sala_reuniao') NOT NULL,
    capacidade INT NOT NULL,
    valor_hora DECIMAL(10,2) NOT NULL
);

-- ====================
-- Tabela de Reservas
-- ====================
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_membro INT NOT NULL,
    id_espaco INT NOT NULL,
    data_reserva DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    data_criacao DATETIME NOT NULL,
    status ENUM('confirmada','cancelada','concluida') NOT NULL,
    FOREIGN KEY (id_membro) REFERENCES Membros(id_membro),
    FOREIGN KEY (id_espaco) REFERENCES Espaco(id_espaco)
);

-- ====================
-- Tabela de Registro de Presença
-- ====================
CREATE TABLE Registro_presenca (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT UNIQUE NOT NULL,
    hora_checkin DATETIME,
    hora_checkout DATETIME,
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);

-- ====================
-- Tabela de Pagamentos
-- ====================
CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_assinatura INT NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    metodo ENUM('cartao','boleto','transferencia') NOT NULL,
    FOREIGN KEY (id_assinatura) REFERENCES Assinaturas(id_assinatura)
);

-- Inserir Cargos
INSERT INTO Cargos (nome) VALUES
('Administrador'),
('Gerente'),
('Membro'),
('Financeiro'),
('Suporte');

-- Inserir Usuários
INSERT INTO Usuarios (login, senha, id_cargos, data_criacao) VALUES
('admin1', 'senha123', 1, '2025-01-10'),
('gerente1', 'senha123', 2, '2025-02-01'),
('membro1', 'senha123', 3, '2025-03-05'),
('membro2', 'senha123', 3, '2025-03-07'),
('financeiro1', 'senha123', 4, '2025-03-10');

-- Inserir Membros
INSERT INTO Membros (id_usuario, nome, email, telefone, data_cadastro) VALUES
(3, 'Henrique Oliveira', 'henrique@email.com', '51999999999', '2025-03-05'),
(4, 'Ana Souza', 'ana@email.com', '51988888888', '2025-03-07'),
(5, 'Carlos Lima', 'carlos@email.com', '51977777777', '2025-03-10'),
(2, 'Mariana Costa', 'mariana@email.com', '51966666666', '2025-02-01'),
(1, 'João Admin', 'admin@email.com', '51955555555', '2025-01-10');

-- Inserir Planos
INSERT INTO Planos (nome, preco, acesso_mes) VALUES
('Básico', 199.90, 10),
('Intermediário', 349.90, 20),
('Premium', 499.90, 40),
('Executivo', 699.90, 60),
('Empresarial', 999.90, 100);

-- Inserir Assinaturas
INSERT INTO Assinaturas (id_membro, id_plano, data_inicio, data_fim, status) VALUES
(1, 3, '2025-03-05', '2025-06-05', 'ativo'),
(2, 1, '2025-03-07', '2025-06-07', 'ativo'),
(3, 2, '2025-03-10', '2025-06-10', 'ativo'),
(4, 4, '2025-02-01', '2025-05-01', 'inativo'),
(5, 5, '2025-01-10', '2025-04-10', 'cancelado');

-- Inserir Espaços
INSERT INTO Espaco (tipo, capacidade, valor_hora) VALUES
('mesa_compartilhada', 6, 25.00),
('mesa_compartilhada', 8, 30.00),
('escritorio_privativo', 3, 80.00),
('sala_reuniao', 10, 120.00),
('sala_reuniao', 20, 200.00);

-- Inserir Reservas
INSERT INTO Reservas (id_membro, id_espaco, data_reserva, hora_inicio, hora_fim, data_criacao, status) VALUES
(1, 1, '2025-04-01', '09:00', '12:00', '2025-03-25 10:00:00', 'confirmada'),
(2, 3, '2025-04-02', '14:00', '16:00', '2025-03-26 11:00:00', 'confirmada'),
(3, 2, '2025-04-03', '10:00', '13:00', '2025-03-27 12:00:00', 'cancelada'),
(4, 4, '2025-04-04', '15:00', '18:00', '2025-03-28 13:00:00', 'confirmada'),
(5, 5, '2025-04-05', '08:00', '12:00', '2025-03-29 14:00:00', 'concluida');

-- Inserir Registro de Presença
INSERT INTO Registro_presenca (id_reserva, hora_checkin, hora_checkout) VALUES
(1, '2025-04-01 08:55:00', '2025-04-01 12:05:00'),
(2, '2025-04-02 13:50:00', '2025-04-02 16:10:00'),
(3, NULL, NULL),
(4, '2025-04-04 14:55:00', '2025-04-04 18:05:00'),
(5, '2025-04-05 07:50:00', '2025-04-05 12:10:00');

-- Inserir Pagamentos
INSERT INTO Pagamentos (id_assinatura, valor_pago, data_pagamento, metodo) VALUES
(1, 499.90, '2025-03-06', 'cartao'),
(2, 199.90, '2025-03-08', 'boleto'),
(3, 349.90, '2025-03-11', 'transferencia'),
(4, 699.90, '2025-02-02', 'cartao'),
(5, 999.90, '2025-01-11', 'cartao');


-- Exemplo de UPDATE
UPDATE Reservas SET status = 'concluida' WHERE id_reserva = 1;

-- Exemplo de DELETE
DELETE FROM Reservas WHERE status = 'cancelada';



-- CRUD para Membros



INSERT INTO Membros (id_usuario, nome, email, telefone, data_cadastro)
VALUES (6, 'Lucas Pereira', 'lucas@email.com', '51944444444', CURDATE());


SELECT * FROM Membros WHERE nome LIKE '%Ana Souza%';

UPDATE Membros SET telefone = '51933333333' WHERE nome = 'Henrique Oliverira';
-- DELETE
DELETE FROM Membros WHERE nome = 'Lucas Pereira';


-- ====================
-- CRUD para Reservas
-- ====================


INSERT INTO Reservas (id_membro, id_espaco, data_reserva, hora_inicio, hora_fim, data_criacao, status)
VALUES (1, 2, '2025-04-10', '09:00', '11:00', NOW(), 'confirmada');


SELECT r.id_reserva, m.nome, e.tipo, r.data_reserva, r.hora_inicio, r.hora_fim, r.status
FROM Reservas r
JOIN Membros m ON r.id_membro = m.id_membro
JOIN Espaco e ON r.id_espaco = e.id_espaco;


UPDATE Reservas SET status = 'concluida' WHERE id_reserva = 1;

DELETE FROM Reservas WHERE status = 'cancelada';


-- ====================
-- CRUD para Planos
-- ====================


INSERT INTO Planos (nome, preco, acesso_mes)
VALUES ('StartUp', 299.90, 15);


SELECT * FROM Planos;

UPDATE Planos SET preco = 329.90 WHERE nome = 'StartUp';

DELETE FROM Planos WHERE nome = 'StartUp';



-- CRUD para Pagamentos



INSERT INTO Pagamentos (id_assinatura, valor_pago, data_pagamento, metodo)
VALUES (1, 499.90, CURDATE(), 'cartao');


SELECT p.id_pagamento, m.nome, p.valor_pago, p.metodo, p.data_pagamento
FROM Pagamentos p
JOIN Assinaturas a ON p.id_assinatura = a.id_assinatura
JOIN Membros m ON a.id_membro = m.id_membro;


UPDATE Pagamentos SET metodo = 'boleto' WHERE id_pagamento = 1;

DELETE FROM Pagamentos WHERE id_pagamento = 1;



-- Consultas Avançadas

-- 1. Listar membros com suas assinaturas e planos
SELECT m.nome, p.nome AS plano, a.status, a.data_inicio, a.data_fim
FROM Assinaturas a
JOIN Membros m ON a.id_membro = m.id_membro
JOIN Planos p ON a.id_plano = p.id_plano;

-- 2. Total arrecadado por método de pagamento
SELECT metodo, SUM(valor_pago) AS total_recebido
FROM Pagamentos
GROUP BY metodo
HAVING SUM(valor_pago) > 500;

-- 3. Espaços mais reservados
SELECT e.tipo, COUNT(r.id_reserva) AS total_reservas
FROM Reservas r
JOIN Espaco e ON r.id_espaco = e.id_espaco
GROUP BY e.tipo
ORDER BY total_reservas DESC;

-- 4. Reservas concluídas por membro
SELECT m.nome, COUNT(r.id_reserva) AS reservas_concluidas
FROM Reservas r
JOIN Membros m ON r.id_membro = m.id_membro
WHERE r.status = 'concluida'
GROUP BY m.nome
ORDER BY reservas_concluidas DESC;

-- 5. Subconsulta – Membros sem reservas
SELECT nome
FROM Membros
WHERE id_membro NOT IN (SELECT id_membro FROM Reservas);

-- 6. UNION – Relatório de atividades (reservas + pagamentos)
SELECT 'Reserva' AS tipo, r.id_reserva AS id, m.nome, r.data_reserva AS data
FROM Reservas r
JOIN Membros m ON r.id_membro = m.id_membro
UNION
SELECT 'Pagamento', p.id_pagamento, m.nome, p.data_pagamento
FROM Pagamentos p
JOIN Assinaturas a ON p.id_assinatura = a.id_assinatura
JOIN Membros m ON a.id_membro = m.id_membro
ORDER BY data DESC;