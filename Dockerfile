FROM mwaeckerlin/ubuntu-base
MAINTAINER mwaeckerlin

RUN apt-get update -y && apt-get install -y wget graphite-carbon
RUN echo "" >> /etc/carbon/storage-schemas.conf
RUN echo "[icinga2_internals]" >> /etc/carbon/storage-schemas.conf
RUN echo "pattern = ^icinga2\..*\.(max_check_attempts|reachable|current_attempt|execution_time|latency|state|state_type)" >> /etc/carbon/storage-schemas.conf
RUN echo "retentions = 5m:7d" >> /etc/carbon/storage-schemas.conf
RUN echo "" >> /etc/carbon/storage-schemas.conf
RUN echo "[icinga2_default]" >> /etc/carbon/storage-schemas.conf
RUN echo "pattern = ^icinga2\." >> /etc/carbon/storage-schemas.conf
RUN echo "retentions = 5m:10d,30m:90d,360m:4y" >> /etc/carbon/storage-schemas.conf

CMD /usr/bin/python /usr/bin/carbon-cache --nodaemon --config=/etc/carbon/carbon.conf
