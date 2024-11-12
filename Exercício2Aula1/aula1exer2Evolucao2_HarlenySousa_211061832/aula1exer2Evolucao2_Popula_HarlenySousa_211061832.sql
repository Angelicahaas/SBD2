-- -------- < aula1exer2Evolucao2 > --------
--
--                    SCRIPT DE POPULAÇÃO (DDL)
--
-- Data Criacao ...........: 20/10/2024
-- Autor(es) ..............: Lucas Lopes Frazão e Harleny Angéllica Araújo de Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 09 tabelas
-- 
-- Ultimas Alteracoes
--   28/10/2024 => Alteração de dados e tabela
--              => Exclusão da tabela gerencia e venda
--              => Adicionando dados
--              => Adicionando tabela Area
-- ---------------------------------------------------------


INSERT INTO PESSOA (cpf, senha, nome) VALUES
('12345678909', 'senhaSegura123', 'João Silva'),
('98765432100', 'senhaFortificada456', 'Maria Souza'),
('12312312312', 'senhaConfiavel789', 'Carlos Pereira'),
('87398237435', 'senhaAna123', 'Ana Braga'),
('56312357575', 'senhaJose123', 'Jose Carlos'),
('43543252312', 'senhaDaniel123', 'Daniel Ferreira'),
('11122233344', 'senhaMario123', 'Mario Santos');


INSERT INTO GERENTE (idGerente, formacao, email, cpfPessoa) VALUES
(1, 'Administração de Empresas', 'joao.silva@email.com', '12345678909'),
(2, 'Gestão de Pessoas', 'maria.souza@email.com', '98765432100'),
(3, 'Engenharia de Produção', 'carlos.pereira@email.com', '12312312312'),
(4, 'Engenharia de Produção', 'ana.braga@email.com', '87398237435'),
(5, 'Administração', 'jose.carlos@email.com', '56312357575'),
(6, 'Marketing', 'daniel.ferreira@email.com', '43543252312'),
(7, 'Finanças', 'mario.santos@email.com', '11122233344');


INSERT INTO ENDERECO (idEndereco, cep, numero, complemento, bairro, cidade, estado) VALUES
(1, '01001000', 100, 'Bloco A', 'Centro', 'São Paulo', 'SP'),
(2, '22041010', 200, 'Casa 2', 'Botafogo', 'Rio de Janeiro', 'RJ'),
(3, '30130000', 300, 'Ap 303', 'Savassi', 'Belo Horizonte', 'MG'),
(4, '40020000', 400, NULL, 'Centro', 'Salvador', 'BA'),
(5, '50030000', 500, 'Bloco B', 'Boa Viagem', 'Recife', 'PE'),
(6, '60040000', 600, 'Ap 101', 'Aldeota', 'Fortaleza', 'CE'),
(7, '70050000', 700, 'Casa 1', 'Centro', 'Brasília', 'DF');


INSERT INTO EMPREGADO (matricula, idEndereco, cpfPessoa) VALUES
('EMP1001', 1, '12345678909'), -- João Silva, também Gerente
('EMP1002', 2, '98765432100'),
('EMP1003', 3, '12312312312'),
('EMP1004', 4, '87398237435'),
('EMP1005', 5, '56312357575'),
('EMP1006', 6, '43543252312'),
('EMP1007', 7, '11122233344');


INSERT INTO TELEFONE (matricula, numeroTel) VALUES
('EMP1001', 11999999999),
('EMP1002', 21988888888),
('EMP1003', 31977777777),
('EMP1004', 71966666666),
('EMP1005', 81955555555),
('EMP1006', 85944444444),
('EMP1007', 61933333333);


INSERT INTO AREA (idArea, idGerente, nome) VALUES
(1, 1, 'Vendas'),
(2, 2, 'RH'),
(3, 3, 'Produção'),
(4, 4, 'Logística'),
(5, 5, 'Administração'),
(6, 6, 'Marketing'),
(7, 7, 'Financeiro');


INSERT INTO PRODUTO (idProduto, nomeProduto, valor, idArea) VALUES
(1, 'Notebook', 3500.00, 1),
(2, 'Smartphone', 2500.00, 1),
(3, 'Headset Gamer', 300.00, 3),
(4, 'Teclado Mecânico', 200.00, 3),
(5, 'Mouse Gamer', 150.00, 3),
(6, 'Monitor 4K', 1200.00, 2),
(7, 'Impressora', 700.00, 4);


INSERT INTO VENDA (idVenda, dataVenda, FK_PESSOA_cpf, FK_PESSOA_idGerente) VALUES
(1, '2024-10-20', '12345678909', 1), -- João Silva como comprador e gerente
(2, '2024-10-21', '98765432100', 2),
(3, '2024-10-22', '12312312312', 3),
(4, '2024-10-23', '87398237435', 4),
(5, '2024-10-24', '56312357575', 5),
(6, '2024-10-25', '43543252312', 6),
(7, '2024-10-26', '11122233344', 7);

-- Inserindo dados na tabela VENDACONTEM (Uma venda com mais de um produto)
INSERT INTO VENDACONTEM (fk_VENDA_idVenda, fk_PRODUTO_idProduto) VALUES
(1, 1), 
(1, 2), 
(2, 3), 
(3, 4), 
(4, 5), 
(5, 6), 
(6, 7); 
