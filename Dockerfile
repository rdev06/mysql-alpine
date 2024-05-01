FROM alpine:latest

WORKDIR /app
VOLUME /app

RUN apk add --update mysql && rm -f /var/cache/apk/*

# These lines moved to the end allow us to rebuild image quickly after only these files were modified.
COPY startup.sh /startup.sh
COPY my.cnf /etc/my.cnf

EXPOSE 3306
CMD ["/startup.sh"]
