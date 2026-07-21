/*
===============================================================================
Projeto: Banco de Dados E-commerce
Arquivo: 04_queries.sql - Parte 1

Descrição:
Consultas básicas utilizando:

- SELECT
- WHERE
- ORDER BY
- Atributos Derivados
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY
- HAVING
- SUM
- AVG
- COUNT
- MAX
- MIN
- CASE
- IFNULL

Consultas Avançadas

✓ Subconsultas
✓ Consultas envolvendo 4 e 5 tabelas
✓ Questões propostas pela DIO

===============================================================================
*/

USE ecommerce;

-- =====================================================
-- 1. Listar todos os clientes
-- =====================================================

SELECT *
FROM Cliente;

-- =====================================================
-- 2. Listar todos os produtos
-- =====================================================

SELECT *
FROM Produto;

-- =====================================================
-- 3. Listar todos os pedidos
-- =====================================================

SELECT *
FROM Pedido;

-- =====================================================
-- 4. Listar todos os fornecedores
-- =====================================================

SELECT *
FROM Fornecedor;

-- =====================================================
-- 5. Listar todos os estoques
-- =====================================================

SELECT *
FROM Estoque;

-- =====================================================
-- 6. Produtos com valor superior a R$ 1.000
-- =====================================================

SELECT
    Nome,
    Categoria,
    Valor
FROM Produto
WHERE Valor > 1000;

-- =====================================================
-- 7. Produtos da categoria Informática
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Categoria = 'Informática';

-- =====================================================
-- 8. Clientes Pessoa Física
-- =====================================================

SELECT
    Nome,
    Email
FROM Cliente
WHERE TipoPessoa = 'PF';

-- =====================================================
-- 9. Clientes Pessoa Jurídica
-- =====================================================

SELECT
    Nome,
    Email
FROM Cliente
WHERE TipoPessoa = 'PJ';

-- =====================================================
-- 10. Pedidos entregues
-- =====================================================

SELECT
    idPedido,
    StatusPedido
FROM Pedido
WHERE StatusPedido = 'Entregue';

-- =====================================================
-- 11. Pedidos cancelados
-- =====================================================

SELECT *
FROM Pedido
WHERE StatusPedido = 'Cancelado';

-- =====================================================
-- 12. Produtos ordenados pelo maior valor
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
ORDER BY Valor DESC;

-- =====================================================
-- 13. Produtos ordenados pelo menor valor
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
ORDER BY Valor ASC;

-- =====================================================
-- 14. Clientes em ordem alfabética
-- =====================================================

SELECT
    Nome,
    TipoPessoa
FROM Cliente
ORDER BY Nome;

-- =====================================================
-- 15. Pedidos mais recentes
-- =====================================================

SELECT
    idPedido,
    DataPedido,
    StatusPedido
FROM Pedido
ORDER BY DataPedido DESC;

-- =====================================================
-- 16. Produtos ordenados por categoria
-- =====================================================

SELECT
    Nome,
    Categoria,
    Valor
FROM Produto
ORDER BY Categoria, Nome;

-- =====================================================
-- 17. Atributo derivado - Valor com 10% de imposto
-- =====================================================

SELECT
    Nome,
    Valor,
    ROUND(Valor * 1.10,2) AS ValorComImposto
FROM Produto;

-- =====================================================
-- 18. Atributo derivado - Valor com 15% de desconto
-- =====================================================

SELECT
    Nome,
    Valor,
    ROUND(Valor * 0.85,2) AS ValorComDesconto
FROM Produto;

-- =====================================================
-- 19. Atributo derivado - Valor total por item do pedido
-- =====================================================

SELECT
    idPedido,
    idProduto,
    Quantidade,
    ValorUnitario,
    ROUND(Quantidade * ValorUnitario,2) AS ValorTotalItem
FROM PedidoProduto;

-- =====================================================
-- 20. Atributo derivado - Nome e tamanho do nome
-- =====================================================

SELECT
    Nome,
    LENGTH(Nome) AS QuantidadeCaracteres
FROM Cliente;

-- =====================================================
-- 21. Produtos entre R$500 e R$2000
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Valor BETWEEN 500 AND 2000
ORDER BY Valor;

-- =====================================================
-- 22. Produtos cujo nome contém "Notebook"
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Nome LIKE '%Notebook%';

-- =====================================================
-- 23. Produtos cujo nome inicia com "Smart"
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Nome LIKE 'Smart%';

-- =====================================================
-- 24. Pedidos realizados em fevereiro
-- =====================================================

SELECT
    idPedido,
    DataPedido
FROM Pedido
WHERE MONTH(DataPedido)=2;

-- =====================================================
-- 25. Produtos com preço acima da média de R$2.000
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Valor > 2000
ORDER BY Valor DESC;

USE ecommerce;

-- =====================================================
-- 1. Listar pedidos e seus respectivos clientes
-- =====================================================

SELECT
    p.idPedido,
    c.Nome AS Cliente,
    p.DataPedido,
    p.StatusPedido
FROM Pedido p
INNER JOIN Cliente c
    ON p.idCliente = c.idCliente
ORDER BY p.idPedido;

-- =====================================================
-- 2. Produtos presentes em cada pedido
-- =====================================================

SELECT
    pp.idPedido,
    pr.Nome AS Produto,
    pp.Quantidade,
    pp.ValorUnitario
FROM PedidoProduto pp
INNER JOIN Produto pr
    ON pp.idProduto = pr.idProduto
ORDER BY pp.idPedido;

-- =====================================================
-- 3. Produtos e seus fornecedores
-- =====================================================

SELECT
    pr.Nome AS Produto,
    f.Nome AS Fornecedor
FROM ProdutoFornecedor pf
INNER JOIN Produto pr
    ON pf.idProduto = pr.idProduto
INNER JOIN Fornecedor f
    ON pf.idFornecedor = f.idFornecedor
ORDER BY pr.Nome;

-- =====================================================
-- 4. Produtos disponíveis em cada estoque
-- =====================================================

SELECT
    pr.Nome AS Produto,
    e.Localizacao,
    pe.Quantidade
FROM ProdutoEstoque pe
INNER JOIN Produto pr
    ON pe.idProduto = pr.idProduto
INNER JOIN Estoque e
    ON pe.idEstoque = e.idEstoque
ORDER BY e.Localizacao;

-- =====================================================
-- 5. Entregas e seus respectivos clientes
-- =====================================================

SELECT
    e.idPedido,
    c.Nome,
    e.StatusEntrega,
    e.CodigoRastreio
FROM Entrega e
INNER JOIN Pedido p
    ON e.idPedido = p.idPedido
INNER JOIN Cliente c
    ON p.idCliente = c.idCliente
ORDER BY e.idPedido;

-- =====================================================
-- 6. Clientes e quantidade de pedidos
-- =====================================================

SELECT
    c.Nome,
    COUNT(p.idPedido) AS TotalPedidos
FROM Cliente c
INNER JOIN Pedido p
    ON c.idCliente = p.idCliente
GROUP BY c.Nome
ORDER BY TotalPedidos DESC;

-- =====================================================
-- 7. Produtos mais vendidos
-- =====================================================

SELECT
    pr.Nome,
    SUM(pp.Quantidade) AS QuantidadeVendida
FROM PedidoProduto pp
INNER JOIN Produto pr
    ON pp.idProduto = pr.idProduto
GROUP BY pr.Nome
ORDER BY QuantidadeVendida DESC;

-- =====================================================
-- 8. Valor vendido por produto
-- =====================================================

SELECT
    pr.Nome,
    SUM(pp.Quantidade * pp.ValorUnitario) AS ValorVendido
FROM PedidoProduto pp
INNER JOIN Produto pr
    ON pp.idProduto = pr.idProduto
GROUP BY pr.Nome
ORDER BY ValorVendido DESC;

-- =====================================================
-- 9. Quantidade de produtos por fornecedor
-- =====================================================

SELECT
    f.Nome,
    COUNT(pf.idProduto) AS TotalProdutos
FROM Fornecedor f
INNER JOIN ProdutoFornecedor pf
    ON f.idFornecedor = pf.idFornecedor
GROUP BY f.Nome
ORDER BY TotalProdutos DESC;

-- =====================================================
-- 10. Quantidade total em estoque
-- =====================================================

SELECT
    e.Localizacao,
    SUM(pe.Quantidade) AS QuantidadeTotal
FROM ProdutoEstoque pe
INNER JOIN Estoque e
    ON pe.idEstoque = e.idEstoque
GROUP BY e.Localizacao
ORDER BY QuantidadeTotal DESC;

-- =====================================================
-- 11. Clientes que fizeram mais de um pedido
-- =====================================================

SELECT
    c.Nome,
    COUNT(p.idPedido) AS TotalPedidos
FROM Cliente c
INNER JOIN Pedido p
    ON c.idCliente = p.idCliente
GROUP BY c.Nome
HAVING COUNT(p.idPedido) > 1;

-- =====================================================
-- 12. Produtos vendidos mais de duas unidades
-- =====================================================

SELECT
    pr.Nome,
    SUM(pp.Quantidade) AS Quantidade
FROM Produto pr
INNER JOIN PedidoProduto pp
    ON pr.idProduto = pp.idProduto
GROUP BY pr.Nome
HAVING SUM(pp.Quantidade) > 2
ORDER BY Quantidade DESC;

-- =====================================================
-- 13. Fornecedores que fornecem mais de um produto
-- =====================================================

SELECT
    f.Nome,
    COUNT(*) AS QuantidadeProdutos
FROM Fornecedor f
INNER JOIN ProdutoFornecedor pf
    ON f.idFornecedor = pf.idFornecedor
GROUP BY f.Nome
HAVING COUNT(*) > 1;

-- =====================================================
-- 14. Estoques com mais de 50 itens
-- =====================================================

SELECT
    e.Localizacao,
    SUM(pe.Quantidade) AS TotalItens
FROM Estoque e
INNER JOIN ProdutoEstoque pe
    ON e.idEstoque = pe.idEstoque
GROUP BY e.Localizacao
HAVING SUM(pe.Quantidade) > 50;

-- =====================================================
-- 15. Clientes sem pedidos (LEFT JOIN)
-- =====================================================

SELECT
    c.idCliente,
    c.Nome
FROM Cliente c
LEFT JOIN Pedido p
    ON c.idCliente = p.idCliente
WHERE p.idPedido IS NULL;

-- =====================================================
-- 16. Produtos nunca vendidos (LEFT JOIN)
-- =====================================================

SELECT
    pr.idProduto,
    pr.Nome
FROM Produto pr
LEFT JOIN PedidoProduto pp
    ON pr.idProduto = pp.idProduto
WHERE pp.idProduto IS NULL;

-- =====================================================
-- 17. Fornecedores sem produtos (LEFT JOIN)
-- =====================================================

SELECT
    f.idFornecedor,
    f.Nome
FROM Fornecedor f
LEFT JOIN ProdutoFornecedor pf
    ON f.idFornecedor = pf.idFornecedor
WHERE pf.idFornecedor IS NULL;

-- =====================================================
-- 18. Estoques sem produtos (LEFT JOIN)
-- =====================================================

SELECT
    e.idEstoque,
    e.Localizacao
FROM Estoque e
LEFT JOIN ProdutoEstoque pe
    ON e.idEstoque = pe.idEstoque
WHERE pe.idEstoque IS NULL;

-- =====================================================
-- 19. Produtos e seus fornecedores (RIGHT JOIN)
-- =====================================================

SELECT
    pr.Nome,
    f.Nome AS Fornecedor
FROM ProdutoFornecedor pf
RIGHT JOIN Fornecedor f
    ON pf.idFornecedor = f.idFornecedor
LEFT JOIN Produto pr
    ON pf.idProduto = pr.idProduto
ORDER BY f.Nome;

-- =====================================================
-- 20. Pedidos e clientes (RIGHT JOIN)
-- =====================================================

SELECT
    c.Nome,
    p.idPedido
FROM Pedido p
RIGHT JOIN Cliente c
    ON p.idCliente = c.idCliente
ORDER BY c.Nome;

-- =====================================================
-- 21. Valor total vendido por cliente
-- =====================================================

SELECT
    c.Nome,
    SUM(pp.Quantidade * pp.ValorUnitario) AS TotalComprado
FROM Cliente c
INNER JOIN Pedido p
    ON c.idCliente = p.idCliente
INNER JOIN PedidoProduto pp
    ON p.idPedido = pp.idPedido
GROUP BY c.Nome
ORDER BY TotalComprado DESC;

-- =====================================================
-- 22. Quantidade de pedidos por status
-- =====================================================

SELECT
    StatusPedido,
    COUNT(*) AS Quantidade
FROM Pedido
GROUP BY StatusPedido
ORDER BY Quantidade DESC;

-- =====================================================
-- 23. Produtos cadastrados por categoria
-- =====================================================

SELECT
    Categoria,
    COUNT(*) AS TotalProdutos
FROM Produto
GROUP BY Categoria
ORDER BY TotalProdutos DESC;

-- =====================================================
-- 24. Produtos com faturamento superior a R$5.000
-- =====================================================

SELECT
    pr.Nome,
    SUM(pp.Quantidade * pp.ValorUnitario) AS Faturamento
FROM Produto pr
INNER JOIN PedidoProduto pp
    ON pr.idProduto = pp.idProduto
GROUP BY pr.Nome
HAVING SUM(pp.Quantidade * pp.ValorUnitario) > 5000
ORDER BY Faturamento DESC;

-- =====================================================
-- 25. Relação completa entre Cliente, Pedido e Entrega
-- =====================================================

SELECT
    c.Nome,
    p.idPedido,
    p.StatusPedido,
    e.StatusEntrega,
    e.CodigoRastreio
FROM Cliente c
INNER JOIN Pedido p
    ON c.idCliente = p.idCliente
INNER JOIN Entrega e
    ON p.idPedido = e.idPedido
ORDER BY p.idPedido;

-- =====================================================
-- 1. Quantidade total de clientes cadastrados
-- =====================================================

SELECT
    COUNT(*) AS TotalClientes
FROM Cliente;

-- =====================================================
-- 2. Quantidade total de produtos cadastrados
-- =====================================================

SELECT
    COUNT(*) AS TotalProdutos
FROM Produto;

-- =====================================================
-- 3. Quantidade total de pedidos
-- =====================================================

SELECT
    COUNT(*) AS TotalPedidos
FROM Pedido;

-- =====================================================
-- 4. Quantidade de pedidos por status
-- =====================================================

SELECT
    StatusPedido,
    COUNT(*) AS Quantidade
FROM Pedido
GROUP BY StatusPedido
ORDER BY Quantidade DESC;

-- =====================================================
-- 5. Quantidade de clientes PF e PJ
-- =====================================================

SELECT
    TipoPessoa,
    COUNT(*) AS Quantidade
FROM Cliente
GROUP BY TipoPessoa;

-- =====================================================
-- 6. Valor total do estoque
-- =====================================================

SELECT
    ROUND(SUM(Quantidade * Valor),2) AS ValorTotalEstoque
FROM ProdutoEstoque pe
INNER JOIN Produto p
ON pe.idProduto = p.idProduto;

-- =====================================================
-- 7. Valor total vendido
-- =====================================================

SELECT
    ROUND(SUM(Quantidade * ValorUnitario),2) AS TotalVendido
FROM PedidoProduto;

-- =====================================================
-- 8. Valor médio dos produtos
-- =====================================================

SELECT
    ROUND(AVG(Valor),2) AS MediaProdutos
FROM Produto;

-- =====================================================
-- 9. Ticket médio dos pagamentos
-- =====================================================

SELECT
    ROUND(AVG(Valor),2) AS TicketMedio
FROM Pagamento;

-- =====================================================
-- 10. Quantidade média de produtos por pedido
-- =====================================================

SELECT
    ROUND(AVG(Quantidade),2) AS MediaItens
FROM PedidoProduto;

-- =====================================================
-- 11. Produto mais caro
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Valor =
(
    SELECT MAX(Valor)
    FROM Produto
);

-- =====================================================
-- 12. Produto mais barato
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Valor =
(
    SELECT MIN(Valor)
    FROM Produto
);

-- =====================================================
-- 13. Maior pagamento realizado
-- =====================================================

SELECT
    MAX(Valor) AS MaiorPagamento
FROM Pagamento;

-- =====================================================
-- 14. Menor pagamento realizado
-- =====================================================

SELECT
    MIN(Valor) AS MenorPagamento
FROM Pagamento;

-- =====================================================
-- 15. Quantidade de produtos por categoria
-- =====================================================

SELECT
    Categoria,
    COUNT(*) AS Total
FROM Produto
GROUP BY Categoria
ORDER BY Total DESC;

-- =====================================================
-- 16. Quantidade total vendida por produto
-- =====================================================

SELECT
    p.Nome,
    SUM(pp.Quantidade) AS TotalVendido
FROM PedidoProduto pp
INNER JOIN Produto p
ON pp.idProduto = p.idProduto
GROUP BY p.Nome
ORDER BY TotalVendido DESC;

-- =====================================================
-- 17. Valor faturado por produto
-- =====================================================

SELECT
    p.Nome,
    ROUND(SUM(pp.Quantidade * pp.ValorUnitario),2) AS Faturamento
FROM PedidoProduto pp
INNER JOIN Produto p
ON pp.idProduto = p.idProduto
GROUP BY p.Nome
ORDER BY Faturamento DESC;

-- =====================================================
-- 18. Classificação dos produtos (CASE)
-- =====================================================

SELECT
    Nome,
    Valor,

    CASE

        WHEN Valor >= 4000 THEN 'Premium'

        WHEN Valor >= 1500 THEN 'Intermediário'

        ELSE 'Básico'

    END AS CategoriaPreco

FROM Produto
ORDER BY Valor DESC;

-- =====================================================
-- 19. Classificação dos pedidos (CASE)
-- =====================================================

SELECT

    idPedido,

    StatusPedido,

    CASE

        WHEN StatusPedido='Entregue'
            THEN 'Finalizado'

        WHEN StatusPedido='Cancelado'
            THEN 'Não concluído'

        ELSE 'Em andamento'

    END AS Situacao

FROM Pedido;

-- =====================================================
-- 20. Status das entregas (CASE)
-- =====================================================

SELECT

    idPedido,

    StatusEntrega,

    CASE

        WHEN StatusEntrega='Entregue'
            THEN 'Cliente recebeu'

        WHEN StatusEntrega='Em Transporte'
            THEN 'Transportadora'

        WHEN StatusEntrega='Saiu para Entrega'
            THEN 'Última etapa'

        ELSE 'Pendente'

    END AS SituacaoEntrega

FROM Entrega;

-- =====================================================
-- 21. Código de rastreio (IFNULL)
-- =====================================================

SELECT

    idPedido,

    IFNULL(CodigoRastreio,'Aguardando geração') AS CodigoRastreio

FROM Entrega;

-- =====================================================
-- 22. Data de entrega (IFNULL)
-- =====================================================

SELECT

    idPedido,

    IFNULL(
        DATE_FORMAT(DataEntrega,'%d/%m/%Y'),
        'Ainda não entregue'
    ) AS DataEntrega

FROM Entrega;

-- =====================================================
-- 23. Responsável pelo estoque (IFNULL)
-- =====================================================

SELECT

    Localizacao,

    IFNULL(Responsavel,'Não informado') AS Responsavel

FROM Estoque;

-- =====================================================
-- 24. Valor vendido por pedido
-- =====================================================

SELECT

    idPedido,

    ROUND(SUM(Quantidade * ValorUnitario),2) AS ValorPedido

FROM PedidoProduto

GROUP BY idPedido

ORDER BY ValorPedido DESC;

-- =====================================================
-- 25. Resumo geral do banco
-- =====================================================

SELECT

    (SELECT COUNT(*) FROM Cliente) AS Clientes,

    (SELECT COUNT(*) FROM Produto) AS Produtos,

    (SELECT COUNT(*) FROM Pedido) AS Pedidos,

    (SELECT COUNT(*) FROM Fornecedor) AS Fornecedores,

    (SELECT COUNT(*) FROM Estoque) AS Estoques,

    (SELECT ROUND(SUM(Valor),2) FROM Pagamento) AS TotalRecebido;
	
	-- =====================================================
-- 1. Quantos pedidos foram feitos por cada cliente?
-- =====================================================

SELECT
    c.idCliente,
    c.Nome,
    COUNT(p.idPedido) AS TotalPedidos
FROM Cliente c
LEFT JOIN Pedido p
    ON c.idCliente = p.idCliente
GROUP BY c.idCliente, c.Nome
ORDER BY TotalPedidos DESC;

-- =====================================================
-- 2. Algum vendedor também é fornecedor?
-- =====================================================

SELECT
    v.Nome AS Vendedor,
    f.Nome AS Fornecedor,
    v.CNPJ
FROM Vendedor v
INNER JOIN Fornecedor f
    ON v.CNPJ = f.CNPJ;

-- =====================================================
-- 3. Relação de produtos, fornecedores e estoques
-- =====================================================

SELECT
    p.Nome AS Produto,
    f.Nome AS Fornecedor,
    e.Localizacao,
    pe.Quantidade
FROM Produto p
INNER JOIN ProdutoFornecedor pf
    ON p.idProduto = pf.idProduto
INNER JOIN Fornecedor f
    ON pf.idFornecedor = f.idFornecedor
INNER JOIN ProdutoEstoque pe
    ON p.idProduto = pe.idProduto
INNER JOIN Estoque e
    ON pe.idEstoque = e.idEstoque
ORDER BY p.Nome;

-- =====================================================
-- 4. Relação dos fornecedores e seus produtos
-- =====================================================

SELECT
    f.Nome AS Fornecedor,
    p.Nome AS Produto
FROM Fornecedor f
INNER JOIN ProdutoFornecedor pf
    ON f.idFornecedor = pf.idFornecedor
INNER JOIN Produto p
    ON pf.idProduto = p.idProduto
ORDER BY f.Nome, p.Nome;

-- =====================================================
-- 5. Produtos nunca vendidos
-- =====================================================

SELECT
    p.idProduto,
    p.Nome,
    p.Valor
FROM Produto p
LEFT JOIN PedidoProduto pp
    ON p.idProduto = pp.idProduto
WHERE pp.idProduto IS NULL;

-- =====================================================
-- 6. Clientes que mais compraram (valor gasto)
-- =====================================================

SELECT
    c.Nome,
    ROUND(SUM(pp.Quantidade * pp.ValorUnitario),2) AS TotalGasto
FROM Cliente c
INNER JOIN Pedido ped
    ON c.idCliente = ped.idCliente
INNER JOIN PedidoProduto pp
    ON ped.idPedido = pp.idPedido
GROUP BY c.idCliente, c.Nome
ORDER BY TotalGasto DESC;

-- =====================================================
-- 7. Valor total gasto por cliente
-- =====================================================

SELECT
    c.Nome,
    IFNULL(ROUND(SUM(pg.Valor),2),0) AS ValorTotal
FROM Cliente c
LEFT JOIN Pedido p
    ON c.idCliente = p.idCliente
LEFT JOIN Pagamento pg
    ON p.idPedido = pg.idPedido
GROUP BY c.idCliente, c.Nome
ORDER BY ValorTotal DESC;

-- =====================================================
-- 8. Produtos mais vendidos
-- =====================================================

SELECT
    pr.Nome,
    SUM(pp.Quantidade) AS QuantidadeVendida
FROM Produto pr
INNER JOIN PedidoProduto pp
    ON pr.idProduto = pp.idProduto
GROUP BY pr.idProduto, pr.Nome
ORDER BY QuantidadeVendida DESC;

-- =====================================================
-- 9. Pedidos com múltiplos pagamentos
-- =====================================================

SELECT
    idPedido,
    COUNT(*) AS QuantidadePagamentos,
    ROUND(SUM(Valor),2) AS ValorPago
FROM Pagamento
GROUP BY idPedido
HAVING COUNT(*) > 1;

-- =====================================================
-- 10. Situação das entregas
-- =====================================================

SELECT
    c.Nome,
    p.idPedido,
    e.StatusEntrega,
    IFNULL(e.CodigoRastreio,'Não disponível') AS CodigoRastreio
FROM Cliente c
INNER JOIN Pedido p
    ON c.idCliente = p.idCliente
INNER JOIN Entrega e
    ON p.idPedido = e.idPedido
ORDER BY p.idPedido;

-- =====================================================
-- 11. Produto mais caro (Subconsulta)
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Valor =
(
    SELECT MAX(Valor)
    FROM Produto
);

-- =====================================================
-- 12. Produto mais barato (Subconsulta)
-- =====================================================

SELECT
    Nome,
    Valor
FROM Produto
WHERE Valor =
(
    SELECT MIN(Valor)
    FROM Produto
);

-- =====================================================
-- 13. Clientes acima da média de gastos
-- =====================================================

SELECT
    c.Nome,
    ROUND(SUM(pg.Valor),2) AS TotalGasto
FROM Cliente c
INNER JOIN Pedido p
    ON c.idCliente = p.idCliente
INNER JOIN Pagamento pg
    ON p.idPedido = pg.idPedido
GROUP BY c.idCliente, c.Nome
HAVING SUM(pg.Valor) >
(
    SELECT AVG(Valor)
    FROM Pagamento
);

-- =====================================================
-- 14. Pedidos acima do ticket médio
-- =====================================================

SELECT
    idPedido,
    SUM(Valor) AS TotalPedido
FROM Pagamento
GROUP BY idPedido
HAVING SUM(Valor) >
(
    SELECT AVG(Valor)
    FROM Pagamento
);

-- =====================================================
-- 15. Produto com maior quantidade em estoque
-- =====================================================

SELECT
    p.Nome,
    SUM(pe.Quantidade) AS Quantidade
FROM Produto p
INNER JOIN ProdutoEstoque pe
    ON p.idProduto = pe.idProduto
GROUP BY p.idProduto, p.Nome
ORDER BY Quantidade DESC
LIMIT 1;

-- =====================================================
-- 16. Fornecedor que fornece mais produtos
-- =====================================================

SELECT
    f.Nome,
    COUNT(*) AS TotalProdutos
FROM Fornecedor f
INNER JOIN ProdutoFornecedor pf
    ON f.idFornecedor = pf.idFornecedor
GROUP BY f.idFornecedor, f.Nome
ORDER BY TotalProdutos DESC
LIMIT 1;

-- =====================================================
-- 17. Estoque com maior quantidade de itens
-- =====================================================

SELECT
    e.Localizacao,
    SUM(pe.Quantidade) AS TotalItens
FROM Estoque e
INNER JOIN ProdutoEstoque pe
    ON e.idEstoque = pe.idEstoque
GROUP BY e.idEstoque, e.Localizacao
ORDER BY TotalItens DESC
LIMIT 1;

-- =====================================================
-- 18. Consulta envolvendo 5 tabelas
-- =====================================================

SELECT
    c.Nome AS Cliente,
    p.idPedido,
    pr.Nome AS Produto,
    pp.Quantidade,
    pg.FormaPagamento,
    e.StatusEntrega
FROM Cliente c
INNER JOIN Pedido p
    ON c.idCliente = p.idCliente
INNER JOIN PedidoProduto pp
    ON p.idPedido = pp.idPedido
INNER JOIN Produto pr
    ON pp.idProduto = pr.idProduto
INNER JOIN Pagamento pg
    ON p.idPedido = pg.idPedido
INNER JOIN Entrega e
    ON p.idPedido = e.idPedido
ORDER BY c.Nome;

-- =====================================================
-- 19. Consulta completa Produto x Fornecedor x Estoque
-- =====================================================

SELECT
    p.Nome,
    f.Nome AS Fornecedor,
    e.Localizacao,
    pe.Quantidade,
    p.Valor
FROM Produto p
INNER JOIN ProdutoFornecedor pf
    ON p.idProduto = pf.idProduto
INNER JOIN Fornecedor f
    ON pf.idFornecedor = f.idFornecedor
INNER JOIN ProdutoEstoque pe
    ON p.idProduto = pe.idProduto
INNER JOIN Estoque e
    ON pe.idEstoque = e.idEstoque
ORDER BY p.Nome;

-- =====================================================
-- 20. Dashboard Geral do E-commerce
-- =====================================================

SELECT

    (SELECT COUNT(*) FROM Cliente) AS Clientes,

    (SELECT COUNT(*) FROM Produto) AS Produtos,

    (SELECT COUNT(*) FROM Pedido) AS Pedidos,

    (SELECT COUNT(*) FROM Fornecedor) AS Fornecedores,

    (SELECT COUNT(*) FROM Estoque) AS Estoques,

    (SELECT COUNT(*) FROM Pagamento) AS Pagamentos,

    (SELECT ROUND(SUM(Valor),2) FROM Pagamento) AS TotalRecebido,

    (SELECT ROUND(AVG(Valor),2) FROM Produto) AS PrecoMedioProdutos;