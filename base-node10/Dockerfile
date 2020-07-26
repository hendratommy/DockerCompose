FROM node:10.17-jessie

LABEL version="0.0.1"
LABEL originRepo="node:10.17-jessie"

# Args
ARG TIMEZONE="Asia/Jakarta"
# Env
ENV version="0.0.1"
ENV TIMEZONE=${TIMEZONE}

RUN echo "building image version ${version} based on node:10.17-jessie"

# set timezone
RUN echo ${TIMEZONE} > /etc/timezone
RUN apt-get update && apt-get install -y libaio1 && dpkg-reconfigure -f noninteractive tzdata && rm -rf /var/lib/apt/lists/* && apt-get clean

# install pm2
RUN npm install -g pm2
RUN pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:compress true
RUN pm2 set pm2-logrotate:max_size 150M
RUN pm2 set pm2-logrotate:workerInterval 30
