# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Freqtrade
RUN pip install freqtrade

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run Freqtrade when the container launches
CMD ["freqtrade", "trade", "--config", "config.json", "--logfile", "/app/freqtrade.log"]

