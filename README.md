🚀 # Simple Django Project with Docker #

This is a minimal Django project configured to run inside a Docker container. It uses SQLite as the default database and serves a basic "Hello from Dockerized Django!" homepage.

🧱 Tech Stack

Python 3.11

Django 4.2+

Docker

📦 Setup Instructions
1. Clone the Repository
git clone <repo-url>
cd <project-folder>

2. Build the Docker Image
docker build -t simple-django .

3. Run the Container
docker run -p 8000:8000 simple-django

4. Visit in Browser

Go to http://localhost:8000 to see the running Django app.

📁 Project Structure
.
├── app/
│   ├── manage.py
│   ├── requirements.txt
│   └── app/
│       ├── __init__.py
│       ├── settings.py
│       ├── urls.py
│       └── wsgi.py
├── Dockerfile
└── .dockerignore

🔧 Notes

This project uses SQLite for simplicity. You can easily switch to PostgreSQL by modifying the database settings and using Docker Compose.

Development server runs on 0.0.0.0:8000 to allow access from outside the container.