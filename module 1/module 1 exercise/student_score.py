import io
import streamlit as st
import pandas as pd
import numpy as np

import matplotlib.pyplot as plt
from PIL import Image

# streamlit run student_score.py

st.header("Student score analysis")

file = st.file_uploader('Please import the xlsx file format and including the "Score" column', type=['xlsx'])

def mean(data):
    return sum(data) / len(data)

def analysis(data):
    score_lst = {'>90' : 0, '70-90' : 0, '50-70' : 0, '<50': 0}
    for score in data:
        if score > 90:
            score_lst['>90'] += 1
        elif 70 < score < 90:
            score_lst['70-90'] += 1   
        elif 50 < score < 70:
            score_lst['50-70'] += 1
        else:
            score_lst['<50'] += 1    

    return score_lst

if __name__ == "__main__":
    if file:
        df = pd.read_excel(file)
        scores = df["Score"].dropna().astype(float).tolist()

        if scores:
            st.write("Total number of students:", len(scores), "Average score:", round(mean(scores), 2))

            score_dis = analysis(scores)
            labels = list(score_dis.keys())
            values = list(score_dis.values())

            fig, ax = plt.subplots(figsize=(1, 1))
            ax.pie(values, labels=labels, autopct='%1.1f%%', textprops={'fontsize': 3.5},)
            
            ax.axis('equal')
            plt.tight_layout(pad=0.1)

            buf = io.BytesIO()
            fig.savefig(buf, format='png', dpi=300)
            buf.seek(0)

            st.markdown("Score distribution:")
            img = Image.open(buf)

            
            x = np.arange(len(labels))
            
            fig2, ax2 = plt.subplots(figsize=(6, 4))
            ax2.bar(height=values, x=x)

            

            ax2.set_xlabel("Score Range", fontsize=8)
            ax2.set_ylabel("Number of Students", fontsize=8)
            ax2.tick_params(axis='x', labelsize=7, rotation=15)
            ax2.tick_params(axis='y', labelsize=7)

            
            ax2.axis('equal')
            plt.tight_layout(pad=0.1)

            buf2 = io.BytesIO()
            fig2.savefig(buf2, format='png', dpi=1000)
            buf2.seek(0)

            st.markdown("Score distribution:")
            img2 = Image.open(buf2)

            col1, col2, col3 = st.columns([1, 2, 1]) 
            with col2:
                st.image(img, width=300) 
                st.image(img2, width = 30000) 
                st.markdown("Score distribution")

            


# streamlit run student_score.py
