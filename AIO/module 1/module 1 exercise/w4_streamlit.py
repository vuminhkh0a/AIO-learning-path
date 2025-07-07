import streamlit as st


status = st.checkbox("I agree")

if status:
    st.write("Great!")

st.radio("Color", ["Yellow", "Blue"], captions=["Vang", "Xanh"])

st.selectbox("Contact", ("Email", "Address"))

#streamlit run "module 1\module 1 exercise\w4_streamlit.py"


