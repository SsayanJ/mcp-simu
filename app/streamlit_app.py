import streamlit as st
import requests

# create the streamlit app

st.title("Machine Simulator")

if st.button("Turn on"):
    # send a request to the fastapi app to change the status
    requests.post("http://127.0.0.1:8000/on")
    st.write("Machine is on")

if st.button("Turn off"):
    requests.post("http://127.0.0.1:8000/off")
    st.write("Machine is off")