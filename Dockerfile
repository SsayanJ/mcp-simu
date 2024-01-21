# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements file into the container at /usr/src/app
COPY requirements.txt .

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Install specific version of NumPy compatible with Python 3.11
RUN pip install --no-cache-dir numpy==1.26.2

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# Copy the local code to the container at /usr/src/app
COPY app/ /usr/src/app

# Expose the port that FastAPI will run on
EXPOSE 8000

# Command to run the application
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port 8000 & streamlit run streamlit_app.py"]
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port 8000 & streamlit run --server.port 8501 --server.address 0.0.0.0 streamlit_app.py"]



