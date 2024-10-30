# Datetime API

A simple Django application that provides an API endpoint to get the current date and time in JSON format.

## Features

- `GET /api/current_datetime/` returns the current server date and time in JSON format.
- `GET /api/` returns {message: Hello world}.

## Requirements

- Python 3.12

## Setup

1. **Create and activate a virtual environment**:

   ```bash
   python -m venv .venv
   source .venv/bin/activate  # For Windows use `venv\Scripts\activate`
   ```

2. **Install dependencies**:

   ```bash
   pip install django
   ```

3. **Run migrations**:

   ```bash
   python manage.py migrate
   ```

4. **Start the server**:
   ```bash
   python manage.py runserver
   ```

## Usage

Once the server is running, visit the following endpoint to get the current date and time:

```
GET http://127.0.0.1:8000/api/current_datetime/
```

### Response

The API responds with JSON in the following format:

```json
{
  "current_datetime": "YYYY-MM-DD HH:MM:SS"
}
```

## Project Structure

```plaintext
datetime_api/
├── api/
│   ├── __init__.py
│   ├── views.py             # Contains the current_datetime API view
│   ├── urls.py              # URL configuration for the api app
├── datetime_api/
│   ├── __init__.py
│   ├── settings.py          # Project settings
│   ├── urls.py              # Main project URL configuration
│   ├── wsgi.py
├── manage.py
└── README.md                # Project README
```

## Docker File

Docker image has been build and push to Docker Hub. Available at:

```
https://hub.docker.com/repository/docker/hammad2024/datetime-api/general
```