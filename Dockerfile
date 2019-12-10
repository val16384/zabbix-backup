FROM alpine:3.9

RUN apk add --update 'mariadb-client>10.3.15' mariadb-connector-c bash perl  && \
    rm -rf /var/cache/apk/* 

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY get-table-list.pl /
COPY zabbix-dump /zabbix-dump
COPY entrypoint /entrypoint
RUN  chmod +x /zabbix-dump /get-table-list.pl /entrypoint

USER appuser

ENTRYPOINT ["/entrypoint"]
