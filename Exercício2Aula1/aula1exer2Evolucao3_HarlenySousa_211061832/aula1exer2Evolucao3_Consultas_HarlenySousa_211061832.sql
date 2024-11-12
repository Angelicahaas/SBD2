-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE CONSULTAS (DML)
--
-- Data Criacao ...........: 28/10/2024
-- Autor(es) ..............: Harleny Angéllica Araújo de Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 tabelas
-- 
-- Ultimas Alteracoes
--         03/11/2024 => criação de script com as demandas A,B,C,D e E
--         
-- ---------------------------------------------------------
USE aula1exer2Evolucao3;

-- A
SELECT V.idVenda, V.datavenda, E.cpf AS cpf_empregado, E.nome AS nome_empregado
FROM VENDA V
JOIN EMPREGADO E ON V.FK_PESSOA_cpf = E.cpf
WHERE E.cpf = '32165498700';

-- B
SELECT 
    v.idVenda,
    v.datavenda,
    v.FK_PESSOA_cpf,
    p.idProduto,
    p.nome AS nome_produto,
    p.valor AS preco_unitario,
    COUNT(vc.idProduto) AS quantidade,
    (COUNT(vc.idProduto) * p.valor) AS total_item,
    SUM(COUNT(vc.idProduto) * p.valor) OVER (PARTITION BY v.idVenda) AS total_venda
FROM VENDA v
JOIN venda_contem vc ON v.idVenda = vc.idVenda
JOIN PRODUTO p ON vc.idProduto = p.idProduto
WHERE v.idVenda = 1001
GROUP BY  v.idVenda, p.idProduto, v.datavenda, v.FK_PESSOA_cpf, p.idProduto, p.nome, p.valor;

-- C
SELECT e.cpf, e.nome, e.matricula
from EMPREGADO e
LEFT JOIN GERENTE g ON e.cpf = g.cpf
WHERE g.cpf IS NULL 
ORDER BY e.nome ASC;

-- D

CREATE VIEW quantidade_produtos_vendidos AS
SELECT 
    p.idProduto,
    p.nome AS nome_produto,
    p.valor AS preco_unitario,
    COUNT(vc.idProduto) AS quantidade
FROM PRODUTO p
JOIN venda_contem vc ON p.idProduto = vc.idProduto
GROUP BY p.idProduto, p.nome, p.valor
ORDER BY p.nome ASC; 


SELECT * FROM quantidade_produtos_vendidos;

-- E

SELECT p.idProduto, p.nome AS nome_produto, COUNT(vc.idProduto) AS quantidade_vendida
FROM PRODUTO p
JOIN venda_contem vc ON p.idProduto = vc.idProduto
WHERE p.nome LIKE CONCAT('%PRODU%')  
GROUP BY p.idProduto, p.nome
ORDER BY p.nome DESC;  

