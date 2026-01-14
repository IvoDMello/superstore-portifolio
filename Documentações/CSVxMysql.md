# estrutura 
CSV (mundo real, bagunçado)
   ↓
STAGE  → receber dados sem quebrar
   ↓
RAW    → garantir tipo e estrutura
   ↓
CLEAN  → garantir significado e confiança
   ↓
ANALYTICS → responder perguntas

# CSV x Banco de dados relacional (MySQL)
 Este CSV eu encontrei no site:
 https://www.kaggle.com/datasets/vivek468/superstore-dataset-final/data
 
 Apenas fiz o Download e anexei na pasta data do projeto

Para tratar o csv, fizemos da seguinte forma: 
Com o ambiente do mysql já instalado na máquina, criamos o banco de dados 'SUPERSTORE' e nele criamos a tabela superstore_stage com todos os campos como varchar com a finalidade de facilitar a importação do arquivo csv desta forma: 

``` sql
CREATE TABLE superstore_stage (
    row_id VARCHAR(50),
    order_id VARCHAR(50),
    order_date VARCHAR(50),
    ship_date VARCHAR(50),
    ship_mode VARCHAR(50),

    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),

    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(50),
    region VARCHAR(50),

    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),

    sales VARCHAR(50),
    quantity VARCHAR(50),
    discount VARCHAR(50),
    profit VARCHAR(50)
);
```
após a criação da tabela tentei fazer um load data infile no mysql mas percebi que o csv estava todo na coluna 1 do excel. isso ocorreu porque o separador não estava sendo reconhecido

fui no excel: 
    Dados → Texto para Colunas 
        Delimitado > ☑ Vírgula
Arquivo → Salvar como → CSV (separado por vírgulas)

assim consegui importar sem problemas. o próximo passo foi converter da tabela stage para a raw. fiz isso com o seguinte comando sql:

``` sql
INSERT INTO superstore_raw (
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    row_id,
    order_id,

    -- datas híbridas
    CASE
        WHEN order_date IS NULL OR order_date = '' THEN NULL
        WHEN CAST(SUBSTRING_INDEX(order_date, '/', 1) AS UNSIGNED) > 12
        THEN STR_TO_DATE(order_date, '%d/%m/%Y')
        ELSE STR_TO_DATE(order_date, '%m/%d/%Y')
    END,

    CASE
        WHEN ship_date IS NULL OR ship_date = '' THEN NULL
        WHEN CAST(SUBSTRING_INDEX(ship_date, '/', 1) AS UNSIGNED) > 12
        THEN STR_TO_DATE(ship_date, '%d/%m/%Y')
        ELSE STR_TO_DATE(ship_date, '%m/%d/%Y')
    END,

    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,

    -- números protegidos
    NULLIF(REPLACE(sales, '.', ''), '') + 0,
    NULLIF(quantity, '') + 0,
    NULLIF(discount, '') + 0,
    NULLIF(REPLACE(profit, '.', ''), '') + 0

FROM superstore_stage;

```


superstore_clean

O papel da superstore_clean:

👉 Dados confiáveis + padronizados + semanticamente corretos

Ou seja:

Datas já válidas

Números coerentes

Textos normalizados

Regras de negócio aplicadas

Sem surpresas em análise

🧱 Diferença mental entre RAW e CLEAN
RAW	CLEAN
Tipos corretos	Tipos + regras
Pode ter duplicata	Sem duplicata
Texto inconsistente	Texto padronizado
Valores estranhos	Valores tratados
Dados “aceitáveis”	Dados “usáveis”