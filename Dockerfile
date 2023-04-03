# Set the base image
FROM python:3.8

# Set the file maintainer
LABEL maintainer="Zulfi Ali <zulfikharali650@gmail.com>" 

# Set the work directory
WORKDIR /app

# Copy project to the work directory
COPY . /app

# Install Python dependencies
RUN pip install -r requirements.txt

# Port to expose
EXPOSE $PORT

# Intend gunicorn to be the entrypoint command for this image
# Used FLASK (WSGI), so gunicorn is needed for interfacing
# FastAPI (ASGI), uvicorn is needed
ENTRYPOINT [ "gunicorn" ]
CMD ["--workers=2", "--threads=2", "--bind", "0.0.0.0:$PORT", "app:app"]