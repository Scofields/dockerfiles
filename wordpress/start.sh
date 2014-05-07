#!/bin/bash

# execute the provisioning
. /etc/cron.hourly/puppet

# start all services
/usr/bin/supervisord
