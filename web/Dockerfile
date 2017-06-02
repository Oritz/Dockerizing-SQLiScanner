FROM alpine

# Setup
RUN mkdir -p /data/web/
WORKDIR /data/web/
COPY . /data/web/

RUN apk update && apk upgrade \
    && apk add --update python python3 python3-dev postgresql-client postgresql-dev build-base openssl
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

# Create unprivileged user
RUN adduser -D -g '' myuser  

# Sqlmap
RUN wget -O sqlmap.zip https://github.com/sqlmapproject/sqlmap/archive/1.1.zip \
    && unzip sqlmap.zip -d /data/ \
    && rm sqlmap.zip

# Clean
RUN apk del -r python3-dev postgresql
