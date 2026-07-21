/*
===============================================================================
Projeto: Banco de Dados E-commerce
Autor: Letícia Carvalho
Descrição:
Script responsável pela criação do banco de dados utilizado no projeto
de modelagem lógica de um sistema de E-commerce.

Este script deve ser executado antes dos demais.

Ordem de execução:

1 - 01_create_database.sql
2 - 02_create_tables.sql
3 - 03_insert_data.sql
4 - 04_queries.sql
===============================================================================
*/

-- Remove o banco caso já exista
DROP DATABASE IF EXISTS ecommerce;

-- Cria o banco de dados
CREATE DATABASE ecommerce
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- Seleciona o banco
USE ecommerce;

-- Confirmação
SELECT 'Banco de dados "ecommerce" criado com sucesso!' AS Mensagem;