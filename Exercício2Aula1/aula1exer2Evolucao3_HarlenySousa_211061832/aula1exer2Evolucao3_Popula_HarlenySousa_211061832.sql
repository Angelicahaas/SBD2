-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE POPULAR (DML)
--
-- Data Criacao ..........: 20/10/2024
-- Autor(es) ..............: Danilo César Tertuliano Melo, Harleny Angéllica Araújo de Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 tabelas
-- 
-- Ultimas Alteracoes
--   28/10/2024 => Modificando as tuplas e adicionando mais dados;
--   02/11/2024 => Apagando tabela PESSOA, gerencia, inserido;
--              => Adicionando tabelas empregado, gerente, endereco;
--              => Adicionando mais dados
-- ---------------------------------------------------------

 USE aula1exer2Evolucao3;

-- POPULANDO AS TABELAS

INSERT INTO GERENTE (idGerente, cpf, senha, nome, email, formacao) VALUES
(1001, '12345678909', 'sen12332', 'João Silva', 'joao.silva@example.com', 'Administração'),
(1002, '98765432100', 'seneff44', 'Maria Santos', 'maria.santos@example.com', 'TI'),
(1003, '45678912345', '123ha123', 'Pedro Lima', 'pedro.lima@example.com', 'Engenharia'),
(1004, '32165498700', '2143a123', 'Ana Costa', 'ana.costa@example.com', 'Marketing'),
(1005, '23456789012', '12332123', 'Lucas Frazão', 'lucas.frazao@example.com', 'Financeiro'),
(1006, '34567890123', '5645a123', 'Rafaela Dias', 'rafaela.dias@example.com', 'RH'),
(1007, '56789012345', 'se456543', 'Carlos Mendes', 'carlos.mendes@example.com', 'Vendas'),
(1008, '67890123456', 'se123245', 'Clara Souza', 'clara.souza@example.com', 'Logística'),
(1009, '78901234567', '123gsfg4', 'Thiago Santos', 'thiago.santos@example.com', 'Qualidade'),
(1010, '89012345678', 's1235esa', 'Beatriz Lima', 'beatriz.lima@example.com', 'Segurança');



INSERT INTO ENDERECO (idEndereco, cep, numero, complemento, bairro, cidade, estado) VALUES
(1001, '70000000', 10, 'Apto 101', 'Centro', 'Brasília', 'DF'),
(1002, '70000001', 20, 'Casa', 'Centro', 'Brasília', 'DF'),
(1003, '70000002', 30, 'Apto 202', 'Asa Sul', 'Brasília', 'DF'),
(1004, '70000003', 40, 'Casa', 'Asa Norte', 'Brasília', 'DF'),
(1005, '70000004', 50, 'Apto 303', 'Centro', 'Brasília', 'DF'),
(1006, '70000005', 60, 'Casa', 'Taguatinga', 'Brasília', 'DF'),
(1007, '70000006', 70, 'Apto 404', 'Guará', 'Brasília', 'DF'),
(1008, '70000007', 80, 'Apto 101', 'Centro', 'Brasília', 'DF'),
(1009, '70000008', 90, 'Casa', 'Centro', 'Brasília', 'DF'),
(1010, '70000009', 100, 'Apto 102', 'Asa Sul', 'Brasília', 'DF');


-- Ana Costa é GERENTE e EMPREGADO (CPF igual ao da tabela GERENTE)
INSERT INTO EMPREGADO (cpf, senha, nome, matricula, idEndereco) VALUES
('32165498700', 's1223445', 'Ana Costa', 1101, 1001), -- Ana Costa
('98765432101', 's234546e', 'Maria Santos', 1201, 1002),
('12345678902', 'sen32323', 'Pedro Lima', 1301, 1003),
('23456789003', 'se221323', 'Lucas Lopes', 1401, 1004),
('34567890104', 's353a123', 'Raquel Fernandes', 1601, 1006),
('45678901205', 's141a123', 'Carlos Amadeu', 1701, 1007),
('56789012306', 's524a123', 'Maria Souza', 1801, 1008),
('67890123407', 'senh4223', 'Tadeu Santos', 1901, 1009),
('78901234508', 'sen24523', 'Bianca Lima', 2001, 1010),
('98765432331', 'se221323', 'Ana Maria', 1768, 1005);


INSERT INTO TELEFONE (matricula, telefone) VALUES
(1101, '61910912345'),
(1201, '61999923456'),
(1301, '61899934567'),
(1401, '61938945678'),
(1768, '61998956789'),
(1601, '61359967890'),
(1701, '61349978901'),
(1801, '61933389012'),
(1901, '61987990123'),
(2001, '61912901234');


-- João Silva é gerente de duas áreas, sendo 'Administração' e 'Logística'
INSERT INTO AREA (idArea, nome, idGerente) VALUES
(101, 'Administração', 1001), 
(102, 'TI', 1002),
(103, 'Engenharia', 1003),
(104, 'Marketing', 1004),
(105, 'Financeiro', 1005),
(106, 'RH', 1006),
(107, 'Vendas', 1007),
(108, 'Logística', 1001),  -- João Silva também é Gerente de Logística
(109, 'Qualidade', 1002),  -- Maria Santos também é Gerente de Qualidade
(110, 'Pesquisa e Desenvolvimento', 1008),
(111, 'Segurança', 1010),
(112, 'Manutenção', 1009);


INSERT INTO VENDA (idVenda, datavenda, FK_PESSOA_cpf) VALUES
(1001, '2024-10-25', '32165498700'),
(1002, '2024-10-26', '98765432101'),  
(1003, '2024-10-27', '12345678902'),  
(1004, '2024-10-28', '23456789003'),  
(1005, '2024-10-29', '34567890104'),  
(1006, '2024-10-30', '45678901205'),  
(1007, '2024-10-31', '56789012306'),  
(1008, '2024-11-01', '67890123407'), 
(1009, '2024-11-02', '78901234508'),
(1010, '2024-08-08', '98765432331');


INSERT INTO PRODUTO (idProduto, nome, valor, idArea) VALUES
(201, 'Produto A', 50.00, 101),
(202, 'Produto B', 75.00, 102),
(203, 'Produto C', 100.00, 103),
(204, 'Produto D', 150.00, 104),
(205, 'Produto E', 200.00, 105),
(206, 'Produto F', 250.00, 106),
(207, 'Produto G', 300.00, 107),
(208, 'Produto H', 350.00, 108),
(209, 'Produto I', 400.00, 109),
(210, 'Produto J', 450.00, 112);


INSERT INTO venda_contem (idVenda, idProduto) VALUES
(1001, 201),   
(1001, 202),   -- Venda 1001 com dois itens diferentes
(1002, 203),
(1003, 204),
(1004, 205),
(1005, 205),
(1006, 207),
(1007, 208),
(1008, 201),
(1009, 210);
