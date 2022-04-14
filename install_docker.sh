#!/bin/bash


wget https://download.docker.com/linux/static/stable/aarch64/docker-18.09.0.tgz
tar -xzvf docker-18.09.0.tgz
cp docker/* /usr/sbin/
vi /usr/lib/systemd/system/docker.service
```
[Unit]

Description=Docker Application Container Engine

Documentation=https://docs.docker.com

After=network-online.target firewalld.service

Wants=network-online.target


[Service]

Type=notify

# the default is not to use systemd for cgroups because the delegate issues still

# exists and systemd currently does not support the cgroup feature set required

# for containers run by docker

ExecStart=/usr/sbin/dockerd --data-root /data/docker

ExecReload=/bin/kill -s HUP $MAINPID

# Having non-zero Limit*s causes performance problems due to accounting overhead

# in the kernel. We recommend using cgroups to do container-local accounting.

LimitNOFILE=infinity

LimitNPROC=infinity

LimitCORE=infinity

# Uncomment TasksMax if your systemd version supports it.

# Only systemd 226 and above support this version.

#TasksMax=infinity

TimeoutStartSec=0

# set delegate yes so that systemd does not reset the cgroups of docker containers

Delegate=yes

# kill only the docker process, not all processes in the cgroup

KillMode=process

# restart the docker process if it exits prematurely

Restart=on-failure

StartLimitBurst=3

StartLimitInterval=60s


[Install]

WantedBy=multi-user.target
```
chmod +x /usr/lib/systemd/system/docker.service
mv /etc/docker/daemon.json /etc/docker/daemon.json.bak
systemctl daemon-reload
systemctl start docker