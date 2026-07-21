# 🛒 Projeto Lógico de Banco de Dados para E-commerce

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)
![SQL](https://img.shields.io/badge/SQL-DDL%20%7C%20DML-orange)
![Status](https://img.shields.io/badge/Status-Concluído-success)
![DIO](https://img.shields.io/badge/DIO-Desafio%20de%20Projeto-purple)

## 📖 Sobre o Projeto

Este projeto foi desenvolvido como solução para o desafio de modelagem lógica de banco de dados da **Digital Innovation One (DIO)**.

O objetivo consiste em transformar um modelo conceitual de um sistema de **E-commerce** em um modelo lógico relacional, implementando o banco de dados em SQL e realizando consultas para extração de informações relevantes.

Durante o desenvolvimento foram aplicados conceitos de:

- Modelagem Relacional
- Normalização
- Integridade Referencial
- Chaves Primárias
- Chaves Estrangeiras
- Constraints
- Relacionamentos 1:1
- Relacionamentos 1:N
- Relacionamentos N:N
- Consultas SQL

---

# 🎯 Objetivos do Projeto

Implementar um banco de dados capaz de gerenciar:

- Clientes Pessoa Física e Pessoa Jurídica
- Produtos
- Pedidos
- Itens do Pedido
- Pagamentos
- Entregas
- Fornecedores
- Estoque
- Vendedores

Além disso, realizar consultas utilizando recursos avançados da linguagem SQL.

---

# 📌 Regras de Negócio

O sistema considera as seguintes regras:

## Cliente

Uma conta pode ser:

- Pessoa Física (PF)
- Pessoa Jurídica (PJ)

Porém, **nunca poderá ser as duas ao mesmo tempo.**

---

## Pedido

Um cliente pode possuir vários pedidos.

Cada pedido pertence a apenas um cliente.

---

## Pagamento

Um pedido pode possuir uma ou mais formas de pagamento.

Exemplo:

- Cartão
- PIX
- Boleto

---

## Entrega

Cada pedido possui:

- Status
- Código de rastreio

---

## Produto

Um produto pode:

- estar em vários estoques;
- ser fornecido por vários fornecedores.

---

## Fornecedor

Um fornecedor pode fornecer diversos produtos.

---

## Estoque

Um estoque pode armazenar diversos produtos.

---

# 🗂 Estrutura do Projeto

```
ecommerce-banco-dados
│
├── README.md
│
├── docs
│   ├── DR - Ecommerce.png
│
└── sql
    ├── 01_create_database.sql
    ├── 02_create_tables.sql
    ├── 03_insert_data.sql
    └── 04_queries.sql
```

---

# 🗄 Modelo Lógico

O banco de dados é composto pelas seguintes entidades:

| Tabela |
|---------|
| Cliente |
| ClientePF |
| ClientePJ |
| Produto |
| Pedido |
| PedidoProduto |
| Pagamento |
| Entrega |
| Estoque |
| ProdutoEstoque |
| Fornecedor |
| ProdutoFornecedor |
| Vendedor |

---

# 🔗 Relacionamentos

## Cliente

Cliente (1) ---- (N) Pedido

---

## Pedido

Pedido (1) ---- (N) Pagamento

Pedido (1) ---- (1) Entrega

Pedido (N) ---- (N) Produto

---

## Produto

Produto (N) ---- (N) Estoque

Produto (N) ---- (N) Fornecedor

---

## Cliente PF/PJ

Cliente

↓

ClientePF

ou

ClientePJ

---

# 🛠 Tecnologias Utilizadas

- MySQL 8
- SQL
- MySQL Workbench

---

# 📚 Conceitos Aplicados

Durante o desenvolvimento foram utilizados:

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- CHECK
- UNIQUE
- AUTO_INCREMENT
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY
- HAVING
- ORDER BY
- COUNT
- SUM
- AVG
- MAX
- MIN
- CASE
- Subqueries

---

# 📊 Estrutura das Tabelas

## Cliente

Armazena os dados básicos dos clientes.

---

## ClientePF

Armazena informações exclusivas de clientes Pessoa Física.

---

## ClientePJ

Armazena informações exclusivas de clientes Pessoa Jurídica.

---

## Produto

Cadastro dos produtos comercializados.

---

## Pedido

Registra todas as compras realizadas.

---

## PedidoProduto

Tabela responsável pelo relacionamento entre pedidos e produtos.

---

## Pagamento

Controla as formas de pagamento utilizadas em cada pedido.

---

## Entrega

Armazena informações de entrega e rastreamento.

---

## Estoque

Representa os locais físicos onde os produtos são armazenados.

---

## ProdutoEstoque

Relaciona produtos aos estoques.

---

## Fornecedor

Cadastro dos fornecedores.

---

## ProdutoFornecedor

Relaciona fornecedores aos produtos.

---

## Vendedor

Cadastro dos vendedores parceiros do marketplace.

---

# 📋 Consultas Implementadas

O projeto contempla consultas utilizando:

## SELECT

Recuperação simples de dados.

---

## WHERE

Filtragem de registros.

---

## ORDER BY

Ordenação crescente e decrescente.

---

## GROUP BY

Agrupamento de registros.

---

## HAVING

Filtragem sobre agrupamentos.

---

## JOIN

Relacionamento entre diversas tabelas.

---

## Funções de Agregação

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

---

## Atributos Derivados

Exemplo:

Valor do produto com imposto.

---

## Subconsultas

Consultas utilizando SELECT dentro de SELECT.

---

# 📈 Exemplos de Perguntas Respondidas

O banco responde perguntas como:

- Quantos pedidos cada cliente realizou?
- Qual cliente mais comprou?
- Quanto cada cliente gastou?
- Quais produtos nunca foram vendidos?
- Qual fornecedor fornece mais produtos?
- Quais produtos estão em estoque?
- Quais pedidos ainda estão em transporte?
- Quais clientes são Pessoa Física?
- Quais clientes são Pessoa Jurídica?
- Qual produto possui maior valor?
- Qual produto foi mais vendido?
- Existe vendedor que também seja fornecedor?
- Qual o valor médio dos pedidos?
- Quais pedidos possuem mais de uma forma de pagamento?

---

# ▶ Como Executar

1. Clone o repositório

```bash
git clone https://github.com/seuusuario/ecommerce-banco-dados.git
```

---

2. Abra o MySQL Workbench.

---

3. Execute os scripts na seguinte ordem:

```
01_create_database.sql

↓

02_create_tables.sql

↓

03_insert_data.sql

↓

04_queries.sql
```

---

# 📷 Modelo do Banco

Adicionar nesta seção a imagem:

```
docs/modelo_logico.png
```

---

# 📖 Aprendizados

Este projeto permitiu aplicar conceitos fundamentais de Banco de Dados Relacionais, como:

- Modelagem Conceitual
- Modelo Lógico
- Integridade Referencial
- Relacionamentos
- SQL DDL
- SQL DML
- SQL DQL
- Consultas Avançadas

---

# 🚀 Melhorias Futuras

- Controle de categorias
- Histórico de pedidos
- Cupons de desconto
- Avaliações de produtos
- Transportadoras
- Endereços de entrega
- Controle de carrinho
- Controle de devoluções

---

# 👩‍💻 Autor

**Letícia Carvalho**

Analista de Sistemas | Suporte MES | SQL | Banco de Dados | Desenvolvimento de Software

LinkedIn:
> [Letícia Carvalho](https://www.linkedin.com/in/letiabreuc/).

GitHub:
> [Letícia Carvalho - Portfólio](https://github.com/abreuleticia/).

---

# 📄 Licença

Este projeto foi desenvolvido exclusivamente para fins educacionais como parte do desafio da **Digital Innovation One (DIO)**.
