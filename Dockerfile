# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI app code into the container
COPY . .

# Set environment variables for production
ENV HOSTNAME=0.0.0.0
ENV PORT=8000
ENV DB_HOST=some-mysql
ENV DB_USER=root
ENV DB_PASSWORD=my-secret-pw
ENV DB_NAME=mysql
ENV DB_PORT=3306

# Expose port
EXPOSE 8000

# Command to run FastAPI using Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
