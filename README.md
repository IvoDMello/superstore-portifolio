🏬 Superstore Data Engineering & Analytics Portfolio

Projeto em desenvolvimento focado na construção de uma base analítica a partir de dados brutos da Superstore, passando por ingestão, limpeza, transformação e, futuramente, análise e visualização de KPIs.

📋 Objetivo

Construir um pipeline de dados confiável para análise de vendas, simulando um cenário real onde os dados chegam em formato CSV com inconsistências e precisam ser tratados antes do uso analítico.

🧠 Tecnologias utilizadas (até o momento)

MySQL

Criação de schemas

Staging tables

Limpeza e transformação de dados via SQL

SQL (DDL e DML)

MySQL Workbench

CSV

🔄 Etapas futuras incluirão Python, dashboards e visualização de dados.

🏗️ Status do Projeto
✔️ Etapas concluídas

Importação de dados brutos a partir de CSV

Criação de tabela de staging (superstore_stage)

Criação de tabela tipada (superstore_raw)

Tratamento de:

Datas em formatos inconsistentes

Valores monetários com separadores de milhar

Erros de tipo (CAST, STR_TO_DATE)

Colunas textuais com tamanho inadequado

Implementação de fluxo stage → raw

🚧 Próximas etapas planejadas

Criação da camada superstore_clean

Consultas analíticas em SQL (KPIs de negócio)

Análise exploratória em Python

Dashboard interativo (Streamlit ou Power BI)


🧩 Motivação

Este projeto foi desenvolvido com foco em problemas reais de dados, priorizando:

Robustez do pipeline

Qualidade da base analítica

Tomada de decisão baseada em dados confiáveis

🎯 Observação

Este repositório está em constante evolução e reflete um processo incremental de aprendizado e aplicação prática em engenharia e análise de dados.