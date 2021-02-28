# -*- coding: utf-8 -*-
"""
@author: Roberto
"""

import pandas as pd
import numpy as np
import os
from matplotlib import pyplot as plt
import seaborn as sns

sns.set(style='darkgrid')
"""
TO NOTICE:
    sns.set_theme(style='darkgrid')
    https://github.com/mwaskom/seaborn/issues/2301
"""

df_meta = pd.read_csv('Indicators_metadata.csv', index_col='INDICATOR')
e = pd.DataFrame(columns=(['Year', 'Country']))

csv_list = os.listdir('csv/')
#csv_list = [file.replace('csv/', '').replace('.csv', '') 
            #for file in csv_list if file.split('.')[1]== 'csv' ]

for indic in csv_list:
    df_p = pd.read_csv(f"csv/{indic}")
    e = e.merge(df_p,how="outer")

df_Big = e #.groupby('Year').sum()
    
# Proceed to plot
for col in df_Big.columns:
    if col in ['Country', 'Year']:
        continue
    
    # Adjust DF if necessary
    df_graph = df_Big
    df_graph['Year'] = pd.to_datetime(df_graph['Year'] , format='%Y')
    # Set figure size (width, height) in inches 
    fig, ax = plt.subplots(figsize = ( 15 , 6 )) 
    # Plot the scatterplot 
    sns.lineplot(ax = ax , x='Year', y=col, data=df_graph, hue='Country')
    # Set label for x-axis 
    ax.set_xlabel( 'Year' , size = 12 ) 
    # Set label for y-axis 
    if col in df_meta.index:
        ax.set_ylabel( df_meta['UNIT'][col] , size = 12 ) 
    # Set title for plot 
    ax.set_title( col , size = 24 ) 
    # Save the figure
    if col in df_meta.index:
        plt.savefig(f"plotting_samples/En-{col.replace(' ','_')}.jpg")
    else:
        plt.savefig(f"plotting_samples/Fin-{col.replace(' ','_').replace('.','').replace('/','').replace(':','_')}.jpg")