import streamlit as st
import os

USERS = ['admin', 'admin1']

def fact(n):
    if n == 0 or n == 1:
        return 1
    return n * fact(n - 1)

def login():
    st.title("Login Page")
    username = st.text_input("Enter your username")
    if st.button("Login"):
        if username:
            if username in USERS:
                st.session_state.logged_in = True
                st.session_state.user_name = username
            else:
                st.session_state.logged_in = False
                st.session_state.user_name = username
        else:
            st.warning("Please enter your username")

def factorial_cal():
    st.write(f"Hi {st.session_state.user_name}!")

    if st.button('Logout'):
        st.session_state.logged_in = False
        st.session_state.user_name = ""
        st.rerun()

    st.divider()

    number = st.number_input('Choose a number', min_value=0, max_value=1000)

    if st.button("Compute factorial"):
        st.write(f"The factorial of {number} is {fact(number)}")


def main():
    st.title("Factorial calculator app")

    if "logged_in" not in st.session_state:
        st.session_state.logged_in = False

    if "user_name" not in st.session_state:
        st.session_state.user_name = ""

    if st.session_state.logged_in:
        factorial_cal()
    else:
        login()

if __name__ == "__main__":
    main()

# streamlit run factorial_app.py