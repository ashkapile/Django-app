FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code


# Install dependencies
COPY app/requirements.txt /code/

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ /code/

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]



