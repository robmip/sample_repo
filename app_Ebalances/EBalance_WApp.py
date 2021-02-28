# -*- coding: utf-8 -*-
"""
Created on Wed Feb 10 19:38:27 2021

@author: Roberto
"""

import streamlit as st
import pandas as pd
import altair as alt

def get_data(file_name):
    df = pd.read_csv("source_data//" + file_name + ".csv")
    df=df.drop(columns=['NoCountry','NoProduct','NoFlow'])
    return df

df = get_data("web_ener_balance")

countries = st.multiselect(
    "Choose countries", list(df.Country.unique()), ["United States"]
)
products = st.multiselect(
    "Choose Product (*not in use yet*)", list(df.Product.unique()), ["Total"]
)
flows = st.multiselect(
    "Choose Flow", list(df.Flow.unique()), ["Total energy supply (ktoe)"]
)
if not (countries or products or flows):
    st.error("Please select at least one country.")
else:
    for c_i in countries:
        data = df[df["Country"]==c_i][df["Product"].isin(products)][df["Flow"].isin(flows)]
        #df.set_index('Country').loc[countries]
        #data /= 1000000.0
        st.write("### Energy Balance for " + c_i, data.sort_index())
    
        data = data.reset_index()
        data = data[data["Product"]=="Total"][data["Flow"].isin(flows)]
        data = pd.melt(data, id_vars=['Country','Product','Flow']).rename(
            columns={"variable": "year", "value": "Total (ktoe)"})
        chart = (
            alt.Chart(data)
            .mark_area(opacity=0.3)
            .encode(
                x="year",
                y=alt.Y("Total (ktoe)", stack=None),
                color="Flow",
            )
        )
        st.altair_chart(chart, use_container_width=True)
    
