/*
===============================================================================
Projeto: Banco de Dados E-commerce
Arquivo: 03_insert_data.sql - Parte 1

Descrição:
Inserção de dados nas tabelas:

- Cliente
- ClientePF
- ClientePJ

===============================================================================
*/

USE ecommerce;

-- =====================================================
-- CLIENTES
-- =====================================================

INSERT INTO Cliente (Nome, Email, Telefone, TipoPessoa)
VALUES
('João da Silva', 'joao.silva@email.com', '(11)99999-1111', 'PF'),
('Maria Oliveira', 'maria.oliveira@email.com', '(11)99999-2222', 'PF'),
('Carlos Pereira', 'carlos.pereira@email.com', '(21)98888-3333', 'PF'),
('Fernanda Souza', 'fernanda.souza@email.com', '(31)97777-4444', 'PF'),
('Lucas Santos', 'lucas.santos@email.com', '(41)96666-5555', 'PF'),
('Juliana Costa', 'juliana.costa@email.com', '(51)95555-6666', 'PF'),

('Tech Solutions LTDA', 'contato@techsolutions.com.br', '(11)4002-8922', 'PJ'),
('Mercado Brasil LTDA', 'financeiro@mercadobrasil.com.br', '(21)3555-4444', 'PJ'),
('Alpha Comércio S.A.', 'contato@alphacomercio.com.br', '(31)3222-1111', 'PJ'),
('Global Imports LTDA', 'vendas@globalimports.com.br', '(41)3444-5555', 'PJ');

-- =====================================================
-- CLIENTES PESSOA FÍSICA
-- =====================================================

INSERT INTO ClientePF
(idCliente, CPF, DataNascimento)
VALUES
(1, '11111111111', '1990-03-15'),
(2, '22222222222', '1988-07-10'),
(3, '33333333333', '1995-11-28'),
(4, '44444444444', '1992-05-20'),
(5, '55555555555', '1985-09-02'),
(6, '66666666666', '1998-01-30');

-- =====================================================
-- CLIENTES PESSOA JURÍDICA
-- =====================================================

INSERT INTO ClientePJ
(idCliente, CNPJ, RazaoSocial)
VALUES
(7, '12345678000190', 'Tech Solutions LTDA'),
(8, '98765432000110', 'Mercado Brasil LTDA'),
(9, '11222333000155', 'Alpha Comércio S.A.'),
(10,'55444333000177', 'Global Imports LTDA');

-- =====================================================
-- CONSULTAS PARA VALIDAÇÃO (OPCIONAL)
-- =====================================================

-- Todos os clientes
SELECT *
FROM Cliente;

-- Apenas clientes PF
SELECT
    c.idCliente,
    c.Nome,
    pf.CPF,
    pf.DataNascimento
FROM Cliente c
INNER JOIN ClientePF pf
    ON c.idCliente = pf.idCliente;

-- Apenas clientes PJ
SELECT
    c.idCliente,
    c.Nome,
    pj.CNPJ,
    pj.RazaoSocial
FROM Cliente c
INNER JOIN ClientePJ pj
    ON c.idCliente = pj.idCliente;
	
	-- =====================================================
-- PRODUTOS
-- =====================================================

INSERT INTO Produto (Nome, Categoria, Descricao, Valor)
VALUES
('Notebook Dell Inspiron 15', 'Informática', 'Notebook Dell Core i5 16GB SSD 512GB', 4599.90),
('Notebook Lenovo IdeaPad 3', 'Informática', 'Notebook Lenovo Ryzen 7 16GB SSD 512GB', 4299.90),
('Mouse Logitech G203', 'Periféricos', 'Mouse Gamer RGB USB', 149.90),
('Teclado Mecânico Redragon Kumara', 'Periféricos', 'Teclado Mecânico Switch Blue', 289.90),
('Monitor LG UltraWide 29"', 'Monitores', 'Monitor IPS Full HD', 1399.90),
('SSD Kingston NV2 1TB', 'Armazenamento', 'SSD NVMe PCIe Gen4', 499.90),
('HD Externo Seagate 2TB', 'Armazenamento', 'HD USB 3.0 Portátil', 549.90),
('Headset HyperX Cloud II', 'Áudio', 'Headset Gamer 7.1', 599.90),
('Webcam Logitech C920', 'Acessórios', 'Webcam Full HD', 429.90),
('Impressora Epson EcoTank L3250', 'Impressoras', 'Multifuncional Wi-Fi', 1249.90),
('Smartphone Samsung Galaxy S24', 'Celulares', '256GB 5G', 4699.90),
('Smartphone Motorola Edge 50', 'Celulares', '256GB OLED', 3199.90),
('Tablet Samsung Galaxy Tab S9 FE', 'Tablets', '128GB Wi-Fi', 2599.90),
('Cadeira Gamer ThunderX3', 'Móveis', 'Cadeira Ergonômica Gamer', 1599.90),
('Roteador TP-Link Archer AX55', 'Redes', 'Wi-Fi 6 Dual Band', 699.90);

-- =====================================================
-- FORNECEDORES
-- =====================================================

INSERT INTO Fornecedor (Nome, CNPJ, Email, Telefone)
VALUES
('Dell Technologies Brasil', '11222333000101', 'contato@dell.com.br', '(11)4004-1000'),
('Lenovo Brasil', '22333444000102', 'vendas@lenovo.com.br', '(11)4004-2000'),
('Logitech Brasil', '33444555000103', 'contato@logitech.com.br', '(11)4004-3000'),
('Samsung Eletrônicos', '44555666000104', 'atendimento@samsung.com.br', '(11)4004-4000'),
('Kingston Technology', '55666777000105', 'contato@kingston.com.br', '(11)4004-5000'),
('Seagate Brasil', '66777888000106', 'vendas@seagate.com.br', '(11)4004-6000'),
('Epson Brasil', '77888999000107', 'suporte@epson.com.br', '(11)4004-7000'),
('TP-Link Brasil', '88999000000108', 'comercial@tplink.com.br', '(11)4004-8000');

-- =====================================================
-- ESTOQUES
-- =====================================================

INSERT INTO Estoque (Localizacao, Responsavel)
VALUES
('São Paulo - SP', 'Ricardo Almeida'),
('Rio de Janeiro - RJ', 'Marcos Oliveira'),
('Curitiba - PR', 'Fernanda Lopes'),
('Porto Alegre - RS', 'Juliana Martins'),
('Belo Horizonte - MG', 'Carlos Henrique');

-- =====================================================
-- VENDEDORES
-- =====================================================

INSERT INTO Vendedor (Nome, CNPJ, Email, Telefone)
VALUES
('Loja Tech Center', '99888777000111', 'contato@techcenter.com.br', '(11)3555-1111'),
('Info Store', '88777666000122', 'vendas@infostore.com.br', '(21)3555-2222'),
('Mega Eletrônicos', '77666555000133', 'contato@megaeletronicos.com.br', '(31)3555-3333'),
('Digital Prime', '66555444000144', 'vendas@digitalprime.com.br', '(41)3555-4444'),
('Connect Shop', '55444333000155', 'atendimento@connectshop.com.br', '(51)3555-5555');

-- =====================================================
-- CONSULTAS DE VALIDAÇÃO
-- =====================================================

-- Produtos cadastrados
SELECT *
FROM Produto;

-- Fornecedores
SELECT *
FROM Fornecedor;

-- Estoques
SELECT *
FROM Estoque;

-- Vendedores
SELECT *
FROM Vendedor;

-- =====================================================
-- PRODUTO x FORNECEDOR
-- =====================================================

INSERT INTO ProdutoFornecedor (idProduto, idFornecedor)
VALUES
(1,1),
(2,2),
(3,3),
(4,3),
(5,4),
(6,5),
(7,6),
(8,3),
(9,3),
(10,7),
(11,4),
(12,4),
(13,4),
(14,2),
(15,8),

-- Produtos com mais de um fornecedor
(1,2),
(5,1),
(6,1),
(8,4),
(15,4);

-- =====================================================
-- PRODUTO x ESTOQUE
-- =====================================================

INSERT INTO ProdutoEstoque (idProduto, idEstoque, Quantidade)
VALUES

-- Estoque São Paulo
(1,1,12),
(2,1,8),
(3,1,50),
(4,1,30),
(5,1,10),
(6,1,25),

-- Estoque Rio de Janeiro
(1,2,6),
(7,2,15),
(8,2,20),
(9,2,18),
(10,2,8),
(11,2,5),

-- Estoque Curitiba
(2,3,7),
(6,3,30),
(12,3,10),
(13,3,6),
(14,3,12),
(15,3,15),

-- Estoque Porto Alegre
(3,4,40),
(4,4,25),
(8,4,15),
(10,4,4),
(11,4,3),
(15,4,9),

-- Estoque Belo Horizonte
(5,5,12),
(6,5,18),
(7,5,10),
(9,5,11),
(12,5,8),
(14,5,7);

-- =====================================================
-- CONSULTAS DE VALIDAÇÃO
-- =====================================================

-- Produtos e seus fornecedores
SELECT
    p.idProduto,
    p.Nome AS Produto,
    f.Nome AS Fornecedor
FROM ProdutoFornecedor pf
INNER JOIN Produto p
    ON pf.idProduto = p.idProduto
INNER JOIN Fornecedor f
    ON pf.idFornecedor = f.idFornecedor
ORDER BY p.idProduto;

-- Produtos por estoque
SELECT
    p.Nome AS Produto,
    e.Localizacao,
    pe.Quantidade
FROM ProdutoEstoque pe
INNER JOIN Produto p
    ON pe.idProduto = p.idProduto
INNER JOIN Estoque e
    ON pe.idEstoque = e.idEstoque
ORDER BY e.Localizacao, p.Nome;

-- Quantidade total de produtos por estoque
SELECT
    e.Localizacao,
    SUM(pe.Quantidade) AS QuantidadeTotal
FROM ProdutoEstoque pe
INNER JOIN Estoque e
    ON pe.idEstoque = e.idEstoque
GROUP BY e.Localizacao
ORDER BY QuantidadeTotal DESC;

-- =====================================================
-- PEDIDOS
-- =====================================================

INSERT INTO Pedido (idCliente, DataPedido, StatusPedido)
VALUES
(1, '2025-01-05 09:30:00', 'Entregue'),
(2, '2025-01-08 14:20:00', 'Entregue'),
(3, '2025-01-10 11:45:00', 'Pago'),
(4, '2025-01-12 16:10:00', 'Enviado'),
(5, '2025-01-15 08:15:00', 'Cancelado'),
(6, '2025-01-18 13:40:00', 'Entregue'),
(7, '2025-01-20 10:00:00', 'Enviado'),
(8, '2025-01-22 17:25:00', 'Pago'),
(9, '2025-01-24 15:10:00', 'Em processamento'),
(10,'2025-01-26 09:50:00', 'Entregue'),
(1, '2025-02-01 11:00:00', 'Pago'),
(2, '2025-02-03 14:45:00', 'Enviado'),
(3, '2025-02-05 18:20:00', 'Entregue'),
(5, '2025-02-08 08:30:00', 'Em processamento'),
(8, '2025-02-10 16:40:00', 'Pago');

-- =====================================================
-- ITENS DOS PEDIDOS
-- =====================================================

INSERT INTO PedidoProduto
(idPedido, idProduto, Quantidade, ValorUnitario)
VALUES

-- Pedido 1
(1,1,1,4599.90),
(1,3,2,149.90),

-- Pedido 2
(2,5,1,1399.90),
(2,6,1,499.90),

-- Pedido 3
(3,2,1,4299.90),
(3,4,1,289.90),

-- Pedido 4
(4,8,1,599.90),
(4,9,1,429.90),

-- Pedido 5
(5,10,1,1249.90),
(5,3,1,149.90),

-- Pedido 6
(6,11,1,4699.90),
(6,15,1,699.90),

-- Pedido 7
(7,12,2,3199.90),
(7,6,1,499.90),

-- Pedido 8
(8,13,1,2599.90),
(8,14,1,1599.90),

-- Pedido 9
(9,7,1,549.90),
(9,8,2,599.90),

-- Pedido 10
(10,1,1,4599.90),
(10,5,2,1399.90),

-- Pedido 11
(11,4,1,289.90),
(11,15,1,699.90),

-- Pedido 12
(12,3,3,149.90),
(12,9,1,429.90),

-- Pedido 13
(13,2,1,4299.90),
(13,11,1,4699.90),

-- Pedido 14
(14,6,2,499.90),
(14,10,1,1249.90),

-- Pedido 15
(15,12,1,3199.90),
(15,13,1,2599.90);

-- =====================================================
-- CONSULTAS DE VALIDAÇÃO
-- =====================================================

-- Todos os pedidos
SELECT
    p.idPedido,
    c.Nome AS Cliente,
    p.DataPedido,
    p.StatusPedido
FROM Pedido p
INNER JOIN Cliente c
    ON c.idCliente = p.idCliente
ORDER BY p.idPedido;

-- Itens de cada pedido
SELECT
    pp.idPedido,
    pr.Nome AS Produto,
    pp.Quantidade,
    pp.ValorUnitario
FROM PedidoProduto pp
INNER JOIN Produto pr
    ON pr.idProduto = pp.idProduto
ORDER BY pp.idPedido;

-- Valor total de cada pedido
SELECT
    pp.idPedido,
    SUM(pp.Quantidade * pp.ValorUnitario) AS ValorTotal
FROM PedidoProduto pp
GROUP BY pp.idPedido
ORDER BY ValorTotal DESC;

-- =====================================================
-- PAGAMENTOS
-- =====================================================

INSERT INTO Pagamento
(idPedido, FormaPagamento, Valor, DataPagamento)
VALUES

(1,'Cartão de Crédito',4899.70,'2025-01-05 09:40:00'),

(2,'PIX',1899.80,'2025-01-08 14:25:00'),

(3,'Boleto',4589.80,'2025-01-10 11:55:00'),

(4,'Cartão de Débito',1029.80,'2025-01-12 16:20:00'),

(5,'PIX',1399.80,'2025-01-15 08:25:00'),

(6,'Cartão de Crédito',5399.80,'2025-01-18 13:50:00'),

-- Pedido pago em duas parcelas/formas
(7,'PIX',3499.90,'2025-01-20 10:10:00'),
(7,'Cartão de Crédito',3399.80,'2025-01-20 10:15:00'),

(8,'Cartão de Crédito',4199.80,'2025-01-22 17:30:00'),

(9,'PIX',1749.70,'2025-01-24 15:20:00'),

(10,'Cartão de Crédito',7399.70,'2025-01-26 10:00:00'),

(11,'PIX',989.80,'2025-02-01 11:10:00'),

(12,'Cartão de Débito',879.60,'2025-02-03 15:00:00'),

-- Pedido pago em duas formas
(13,'PIX',4500.00,'2025-02-05 18:30:00'),
(13,'Cartão de Crédito',4499.80,'2025-02-05 18:35:00'),

(14,'Boleto',2249.70,'2025-02-08 08:40:00'),

(15,'Cartão de Crédito',5799.80,'2025-02-10 16:50:00');

-- =====================================================
-- ENTREGAS
-- =====================================================

INSERT INTO Entrega
(idPedido,
CodigoRastreio,
StatusEntrega,
DataEnvio,
DataEntrega)

VALUES

(1,'BR123456789','Entregue','2025-01-06','2025-01-09'),

(2,'BR123456790','Entregue','2025-01-09','2025-01-13'),

(3,'BR123456791','Em Transporte','2025-01-11',NULL),

(4,'BR123456792','Em Transporte','2025-01-13',NULL),

(5,NULL,'Cancelada',NULL,NULL),

(6,'BR123456793','Entregue','2025-01-19','2025-01-23'),

(7,'BR123456794','Em Transporte','2025-01-21',NULL),

(8,'BR123456795','Em Transporte','2025-01-23',NULL),

(9,NULL,'Aguardando Postagem',NULL,NULL),

(10,'BR123456796','Entregue','2025-01-27','2025-01-31'),

(11,'BR123456797','Em Transporte','2025-02-02',NULL),

(12,'BR123456798','Saiu para Entrega','2025-02-04',NULL),

(13,'BR123456799','Entregue','2025-02-06','2025-02-10'),

(14,NULL,'Aguardando Postagem',NULL,NULL),

(15,'BR123456800','Saiu para Entrega','2025-02-11',NULL);

-- =====================================================
-- CONSULTAS DE VALIDAÇÃO
-- =====================================================

-- Pagamentos realizados
SELECT
    idPagamento,
    idPedido,
    FormaPagamento,
    Valor,
    DataPagamento
FROM Pagamento;

----------------------------------------------------------

-- Pedidos que possuem mais de um pagamento

SELECT
    idPedido,
    COUNT(*) AS QuantidadePagamentos
FROM Pagamento
GROUP BY idPedido
HAVING COUNT(*) > 1;

----------------------------------------------------------

-- Situação das entregas

SELECT
    e.idPedido,
    c.Nome,
    e.StatusEntrega,
    e.CodigoRastreio
FROM Entrega e
INNER JOIN Pedido p
ON e.idPedido=p.idPedido
INNER JOIN Cliente c
ON p.idCliente=c.idCliente
ORDER BY e.idPedido;

----------------------------------------------------------

-- Pedidos entregues

SELECT
    idPedido,
    CodigoRastreio
FROM Entrega
WHERE StatusEntrega='Entregue';

----------------------------------------------------------

-- Pedidos aguardando postagem

SELECT
    idPedido
FROM Entrega
WHERE StatusEntrega='Aguardando Postagem';

----------------------------------------------------------

-- Pedidos cancelados

SELECT
    idPedido
FROM Entrega
WHERE StatusEntrega='Cancelada';

----------------------------------------------------------

-- Valor arrecadado

SELECT
SUM(Valor) AS TotalRecebido
FROM Pagamento;

----------------------------------------------------------

-- Ticket médio

SELECT
ROUND(AVG(Valor),2) AS TicketMedio
FROM Pagamento;

----------------------------------------------------------

-- Quantidade por forma de pagamento

SELECT
FormaPagamento,
COUNT(*) AS Quantidade
FROM Pagamento
GROUP BY FormaPagamento
ORDER BY Quantidade DESC;