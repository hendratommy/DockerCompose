FROM azul/zulu-openjdk:11

LABEL version="0.0.1"
LABEL originRepo="azul/zulu-openjdk:11"

# Args
ARG TIMEZONE="Asia/Jakarta"
# Env
ENV version="0.0.1"
ENV TIMEZONE=${TIMEZONE}

RUN echo "building image version ${version} based on azul/zulu-openjdk:11"

# set timezone
RUN echo ${TIMEZONE} > /etc/timezone
RUN apt-get update && apt-get install -y tzdata libaio1 && rm /etc/localtime &&  ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && dpkg-reconfigure -f noninteractive tzdata && apt-get clean
