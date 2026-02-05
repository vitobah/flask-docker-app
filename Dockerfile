# Use Python slim image as base
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Upgrade pip first (helps avoid missing packages)
RUN python -m pip install --upgrade pip

# Copy dependencies file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Command to run the app using Gunicorn
CMD ["python", "-m", "gunicorn", "--bind", "0.0.0.0:5000", "app:app"]


