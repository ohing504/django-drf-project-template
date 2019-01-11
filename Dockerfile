# Pull base image
FROM python:3.7

ARG DJANGO_SECRET_KEY=dont-tell-eve

# Set environment variables
# Disable python output buffering
ENV PYTHONUNBUFFERED 1
# Set virtual environment location in project/.venv
ENV PIPENV_VENV_IN_PROJECT 1

ADD Pipfile Pipfile.lock /var/app/

# Set work directory
WORKDIR /var/app

RUN pip install -U pip
RUN pip install -U pipenv
RUN pipenv install --dev
RUN pipenv install uwsgi

# Copy all related app files
ADD . /var/app

# Django
RUN pipenv run python manage.py collectstatic --noinput

# Expose
EXPOSE 8000

# Entry point
ENTRYPOINT ["/var/app/docker-entrypoint.sh"]

# Run
CMD ["pipenv", "run", "uwsgi", "--http", "0.0.0.0:8000", "--ini", "uwsgi.ini"]