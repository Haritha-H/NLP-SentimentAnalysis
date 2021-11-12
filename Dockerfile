FROM python:3.8-slim-buster

RUN pip install --upgrade pip

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt
RUN python -m nltk.downloader punkt


ENTRYPOINT  ["python"]

CMD ["app.py"]
