FROM python:3

MAINTAINER José Luis Patiño Andrés <jose.lpa@gmail.com>

ENV PYTHONUNBUFFERED 1

EXPOSE 8001

RUN pip install crossbar

# Custom node configuration.
RUN mkdir -p /node/web
RUN mkdir -p /node/.crossbar/session/
COPY ./crossbar/config.json /node/.crossbar
COPY ./www/index.html /node/web
COPY ./crossbar/session/ /node/.crossbar/session

# Create a system user.
RUN useradd -d /node -r crossbar
RUN chown -R crossbar:crossbar /node

USER crossbar

WORKDIR /node
ENTRYPOINT ["crossbar", "start", "--cbdir", "/node/.crossbar"]
