# Use an official Python runtime as the base image
FROM python:3.11

# Set environment variables for Python to not write bytecode and to not buffer output
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set the working directory in the container
WORKDIR /app

# Copy the poetry files
COPY pyproject.toml poetry.lock /app/

# Install poetry
RUN pip install --no-cache-dir poetry

# Install project dependencies
RUN poetry install --no-root

# Copy the project files into the container
COPY . /app/

# Run the main.py when the container launches
CMD ["poetry", "run", "python", "main.py"]
