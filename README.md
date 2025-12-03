# superstore-portifolio

# 🏬 Superstore Analytics Portfolio

Análise completa de dados de vendas da Superstore — do ETL à visualização interativa de KPIs de negócio.

## 📋 Objetivo
Identificar padrões de desempenho, lucratividade e oportunidades de otimização operacional em uma base de dados de vendas.

## 🧠 Tecnologias utilizadas
- Python (pandas, numpy, plotly, seaborn)
- SQL (consultas analíticas)
- Streamlit (dashboard)
- Jupyter Notebook
- Power BI (opcional)

## 📂 Estrutura do projeto
- `data/`: datasets originais e tratados  
- `notebooks/`: análise exploratória e visualizações  
- `dashboard/`: app interativo em Streamlit  
- `sql/`: consultas e KPIs SQL  
- `README.md`: documentação principal  

## 📊 Principais insights
- Categoria “Technology” é a mais lucrativa.
- Região Oeste tem melhor performance média de lucro.
- Frete elevado reduz margens em até 15%.

## 🚀 Como executar
```bash
git clone https://github.com/seu-usuario/Superstore-Portifolio.git
cd Superstore-Portifolio/dashboard
pip install -r requirements.txt
streamlit run app.py
