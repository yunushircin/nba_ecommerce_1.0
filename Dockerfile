FROM python:3.8-alpine
ENV PYTHONUNBUFFERED=1
WORKDIR /django
COPY requirements.txt requirements.txt
RUN pip3 install --upgrade pip
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
#RUN apt-get update
#RUN apt-get -y install gcc
RUN python -m pip install Pillow
RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn
COPY . .
