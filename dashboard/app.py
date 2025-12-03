# app.py
import pandas as pd
import streamlit as st
import plotly.express as px

st.title("📊 Superstore Analytics Dashboard")

df = pd.read_csv("../data/processed/superstore_clean.csv")

# KPIs
st.metric("Lucro Total", f"${df['Profit'].sum():,.2f}")
st.metric("Receita Total", f"${df['Sales'].sum():,.2f}")

# Gráficos
fig = px.bar(df.groupby('Category')['Profit'].sum().reset_index(),
             x='Category', y='Profit', title='Lucro por Categoria')
st.plotly_chart(fig)
