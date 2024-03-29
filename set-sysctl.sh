#!/usr/bin/env bash

echo "
## set by shell
# max open files
fs.file-max = 1024000
# max read buffer
net.core.rmem_max = 67108864
# max write buffer
net.core.wmem_max = 67108864
# default read buffer
net.core.rmem_default = 65536
# default write buffer
net.core.wmem_default = 65536
# max processor input queue
net.core.netdev_max_backlog = 4096
# max backlog
net.core.somaxconn = 4096

# resist SYN flood attacks
net.ipv4.tcp_syncookies = 1
# reuse timewait sockets when safe
net.ipv4.tcp_tw_reuse = 1
# short FIN timeout
net.ipv4.tcp_fin_timeout = 30
# short keepalive time
net.ipv4.tcp_keepalive_time = 1200
# outbound port range
net.ipv4.ip_local_port_range = 10000 65000
# max SYN backlog
net.ipv4.tcp_max_syn_backlog = 4096
# max timewait sockets held by system simultaneously
net.ipv4.tcp_max_tw_buckets = 5000
# TCP receive buffer
net.ipv4.tcp_rmem = 16384 16777216 536870912
# TCP write buffer
net.ipv4.tcp_wmem = 16384 16777216 536870912
# turn on path MTU discovery
net.ipv4.tcp_mtu_probing = 1

# turn on TCP Fast Open on both client and server side
net.ipv4.tcp_fastopen = 3
net.core.default_qdisc=fq
# for high-latency network
net.ipv4.tcp_congestion_control = bbr
# forward ipv4
net.ipv4.ip_forward = 1
" >> /etc/sysctl.conf

echo "
*               soft    nofile           512000
*               hard    nofile          1024000
" >> /etc/security/limits.conf

echo "
ulimit -SHn 1024000

" >> /etc/profile
