/*
===============================================================================
Projeto: Banco de Dados E-commerce
Arquivo: 02_create_tables.sql

Descrição:
Criação de todas as tabelas do banco de dados.

Ordem de execução:

1 - 01_create_database.sql
2 - 02_create_tables.sql
3 - 03_insert_data.sql
4 - 04_queries.sql
===============================================================================
*/

USE ecommerce;

-- =====================================================
-- CLIENTE
-- =====================================================

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefone VARCHAR(20),
    TipoPessoa ENUM('PF','PJ') NOT NULL
);

-- =====================================================
-- CLIENTE PF
-- =====================================================

CREATE TABLE ClientePF (
    idCliente INT PRIMARY KEY,
    CPF CHAR(11) NOT NULL UNIQUE,
    DataNascimento DATE,

    CONSTRAINT fk_pf_cliente
        FOREIGN KEY (idCliente)
        REFERENCES Cliente(idCliente)
        ON DELETE CASCADE
);

-- =====================================================
-- CLIENTE PJ
-- =====================================================

CREATE TABLE ClientePJ (
    idCliente INT PRIMARY KEY,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    RazaoSocial VARCHAR(150) NOT NULL,

    CONSTRAINT fk_pj_cliente
        FOREIGN KEY (idCliente)
        REFERENCES Cliente(idCliente)
        ON DELETE CASCADE
);

-- =====================================================
-- PRODUTO
-- =====================================================

CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(120) NOT NULL,
    Categoria VARCHAR(80),
    Descricao VARCHAR(255),
    Valor DECIMAL(10,2) NOT NULL CHECK (Valor >= 0)
);

-- =====================================================
-- PEDIDO
-- =====================================================

CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    DataPedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    StatusPedido ENUM(
        'Em processamento',
        'Pago',
        'Enviado',
        'Entregue',
        'Cancelado'
    ) DEFAULT 'Em processamento',

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY(idCliente)
        REFERENCES Cliente(idCliente)
);

-- =====================================================
-- PRODUTO x PEDIDO
-- =====================================================

CREATE TABLE PedidoProduto (

    idPedido INT,
    idProduto INT,

    Quantidade INT NOT NULL CHECK (Quantidade > 0),

    ValorUnitario DECIMAL(10,2) NOT NULL,

    PRIMARY KEY(idPedido,idProduto),

    CONSTRAINT fk_pp_pedido
        FOREIGN KEY(idPedido)
        REFERENCES Pedido(idPedido)
        ON DELETE CASCADE,

    CONSTRAINT fk_pp_produto
        FOREIGN KEY(idProduto)
        REFERENCES Produto(idProduto)
);

-- =====================================================
-- PAGAMENTO
-- =====================================================

CREATE TABLE Pagamento (

    idPagamento INT AUTO_INCREMENT PRIMARY KEY,

    idPedido INT NOT NULL,

    FormaPagamento ENUM(
        'PIX',
        'Cartão de Crédito',
        'Cartão de Débito',
        'Boleto'
    ) NOT NULL,

    Valor DECIMAL(10,2) NOT NULL,

    DataPagamento DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY(idPedido)
        REFERENCES Pedido(idPedido)
);

-- =====================================================
-- ENTREGA
-- =====================================================

CREATE TABLE Entrega (

    idEntrega INT AUTO_INCREMENT PRIMARY KEY,

    idPedido INT NOT NULL,

    CodigoRastreio VARCHAR(60),

    StatusEntrega ENUM(
        'Aguardando Postagem',
        'Em Transporte',
        'Saiu para Entrega',
        'Entregue',
        'Cancelada'
    ),

    DataEnvio DATE,

    DataEntrega DATE,

    CONSTRAINT fk_entrega_pedido
        FOREIGN KEY(idPedido)
        REFERENCES Pedido(idPedido)
);

-- =====================================================
-- FORNECEDOR
-- =====================================================

CREATE TABLE Fornecedor (

    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,

    Nome VARCHAR(120) NOT NULL,

    CNPJ CHAR(14) UNIQUE,

    Email VARCHAR(120),

    Telefone VARCHAR(20)
);

-- =====================================================
-- VENDEDOR
-- =====================================================

CREATE TABLE Vendedor (

    idVendedor INT AUTO_INCREMENT PRIMARY KEY,

    Nome VARCHAR(120) NOT NULL,

    CNPJ CHAR(14) UNIQUE,

    Email VARCHAR(120),

    Telefone VARCHAR(20)
);

-- =====================================================
-- ESTOQUE
-- =====================================================

CREATE TABLE Estoque (

    idEstoque INT AUTO_INCREMENT PRIMARY KEY,

    Localizacao VARCHAR(120),

    Responsavel VARCHAR(100)
);

-- =====================================================
-- PRODUTO x ESTOQUE
-- =====================================================

CREATE TABLE ProdutoEstoque (

    idProduto INT,

    idEstoque INT,

    Quantidade INT NOT NULL CHECK (Quantidade >= 0),

    PRIMARY KEY(idProduto,idEstoque),

    CONSTRAINT fk_pe_produto
        FOREIGN KEY(idProduto)
        REFERENCES Produto(idProduto),

    CONSTRAINT fk_pe_estoque
        FOREIGN KEY(idEstoque)
        REFERENCES Estoque(idEstoque)
);

-- =====================================================
-- PRODUTO x FORNECEDOR
-- =====================================================

CREATE TABLE ProdutoFornecedor (

    idProduto INT,

    idFornecedor INT,

    PRIMARY KEY(idProduto,idFornecedor),

    CONSTRAINT fk_pf_produto
        FOREIGN KEY(idProduto)
        REFERENCES Produto(idProduto),

    CONSTRAINT fk_pf_fornecedor
        FOREIGN KEY(idFornecedor)
        REFERENCES Fornecedor(idFornecedor)
);

-- =====================================================
-- ÍNDICES
-- =====================================================

CREATE INDEX idx_cliente_nome
ON Cliente(Nome);

CREATE INDEX idx_produto_nome
ON Produto(Nome);

CREATE INDEX idx_pedido_data
ON Pedido(DataPedido);

CREATE INDEX idx_entrega_status
ON Entrega(StatusEntrega);

CREATE INDEX idx_produto_categoria
ON Produto(Categoria);

-- =====================================================
-- FIM DO SCRIPT
-- =====================================================