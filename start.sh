#!/bin/bash

chown _graphite:_graphite /var/lib/graphite

/usr/bin/python /usr/bin/carbon-cache --nodaemon --config=/etc/carbon/carbon.conf start
