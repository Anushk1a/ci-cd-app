FROM python:3.9

# Set working directory inside the container
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy all other application files
COPY . .

# Run the app
CMD ["python", "app.py"]
