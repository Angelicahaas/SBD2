-- -------- < aula1exer2Evolucao2 > --------
--
--                    SCRIPT DE IMPLEMENTAÇÃO DO CONTROLE DE ACESSO
--
-- Data Criacao ...........: 28/10/2024
-- Autor(es) ..............: Harleny Angéllica Araújo de Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--        
-- Ultimas Alteracoes
--   28/11/2024 => Criação de Script

-- Criação dos usuários
CREATE USER empregado IDENTIFIED BY 'senha_empregado';
CREATE USER gerente IDENTIFIED BY 'senha_gerente';
CREATE USER superior IDENTIFIED BY 'senha_superior';

GRANT SELECT ON nome_da_base.* TO empregado;
GRANT INSERT ON nome_da_base.venda TO empregado;
GRANT INSERT ON nome_da_base.itens_venda TO empregado;

GRANT SELECT, INSERT, UPDATE, DELETE ON nome_da_base.tabela1 TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON nome_da_base.tabela2 TO gerente;

GRANT SELECT ON nome_da_base.PESSOA TO gerente;
GRANT SELECT ON nome_da_base.EMPREGADO TO gerente;
GRANT SELECT ON nome_da_base.GERENTE TO gerente;

GRANT ALL PRIVILEGES ON nome_da_base.* TO superior;

FLUSH PRIVILEGES;
