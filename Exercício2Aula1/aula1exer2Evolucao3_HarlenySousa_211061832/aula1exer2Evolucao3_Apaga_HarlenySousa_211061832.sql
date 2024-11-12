-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE DELEÇÃO (DDL)
--
-- Data Criacao ...........: 20/10/2024
-- Autor(es) ..............: Danilo César Tertuliano Melo, Harleny Angéllica Araújo de Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 tabelas
-- 
-- Ultimas Alteracoes
--   22/10/2024 => Retirada de instrucoes que NAO sao SQL no script
--   28/10/2024 => Adicionando as novas tabelas
--   02/11/2014 => Adicionando novos comandos
--
-- ---------------------------------------------------------

USE aula1exer2Evolucao3;


SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS venda_contem;
DROP TABLE IF EXISTS VENDA;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS AREA;
DROP TABLE IF EXISTS TELEFONE;
DROP TABLE IF EXISTS EMPREGADO;
DROP TABLE IF EXISTS ENDERECO;
DROP TABLE IF EXISTS GERENTE;

SET FOREIGN_KEY_CHECKS = 1;

