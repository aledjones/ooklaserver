#!/bin/bash

set -e
echo "#
# This is a sample configuration file for OoklaServer
#

#
# OoklaServer Options
#

# The server listens to TCP port 5060 and 8080 by default. These ports are required for
# speedtest.net servers, although more can be added.
#
# For Speedtest Custom, this can be changed to other ports if desired; you will need to
# contact support to update your server record.
#
# At least one port is required for this setting.
#
OoklaServer.tcpPorts = ${OOKLASERVER_TCPPORTS}

# The server listens to UDP port 5060 and 8080 by default. These ports are required for
# speedtest.net servers, although more can be added.
#
# For Speedtest Custom, this can be changed to other ports if desired; you will need to
# contact support to update your server record.
#
# At least one port is required for this setting.
#
OoklaServer.udpPorts = ${OOKLASERVER_UDPPORTS}

# Uncomment to bind OoklaServer to IPv6
#
# OoklaServer.useIPv6 = true

# OoklaServer.allowedDomains allows you to limit access to your OoklaServer.
#
# The default ("*") allows all domains access.
# Uncomment to allow access from ookla.com, speedtest.net, and simply add your
# own domain(s):
#
OoklaServer.allowedDomains = ${OOKLASERVER_ALLOWEDDOMAINS}

# Uncomment this to enable filtering of known bad user agents. This can help alleviate traffic
# from non-official client sources.
#
# OoklaServer.userAgentFilterEnabled = true

# Max size of worker thread pool. Might be smaller if the number of open files allows
# is smaller (i.e it is at most `ulimit -n -H`).
#
# OoklaServer.workerThreadPool.capacity = 30000

# Thread stack size for worker threads.
#
# OoklaServer.workerThreadPool.stackSizeBytes = 102400

# Enable auto updates (default)
#
OoklaServer.enableAutoUpdate = true

#####
# IP Tracking / Blocking settings
#####
# Time between garbage collecting ip statistics.
#
# OoklaServer.ipTracking.gcIntervalMinutes = 5

# Max amount of time to keep statistics for a specific ip address after its last connection was recorded.
#
# OoklaServer.ipTracking.maxIdleAgeMinutes = 35

# Size in minutes of the buckets used to collect ip statistics. This is used to keep a
# sliding window of statistics for an ip when accumulating data. Max number of
# buckets is maxIdleAgeMinutes / slidingWindowBucketLengthMinutes.
#
# OoklaServer.ipTracking.slidingWindowBucketLengthMinutes = 5

# Number of ip's to include when upload metrics.
#
# OoklaServer.ipTracking.metricTopIpCount = 5
#

# Max concurrent connections allowed for a single ip address. The actual number
# is at least 50, and at most 10% of OoklaServer.workerThreadPool.capacity.
#
# OoklaServer.ipTracking.maxConnPerIp = 500

# SSL Options
#

# Enable Let's Encrypt certificate generation (default)
#
#OoklaServer.ssl.useLetsEncrypt = false

# To use a custom certificate, create a certificate and private key and set the path to them here:
# (Note, this will disable Let's Encrypt certificate generation)
openSSL.server.certificateFile = ${OPENSSL_SERVER_CERTIFICATEFILE}
openSSL.server.privateKeyFile = ${OPENSSL_SERVER_PRIVATEKEYFILE}


#
# Logging Options
#

# Log to the Console
#
logging.loggers.app.name = Application
logging.loggers.app.channel.class = ConsoleChannel
logging.loggers.app.channel.pattern = %Y-%m-%d %H:%M:%S [%P - %I] [%p] %t
logging.loggers.app.level = information
" > /srv/ooklaserver/OoklaServer.properties

/srv/ooklaserver/OoklaServer