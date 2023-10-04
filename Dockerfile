ARG RELEASE
FROM node:18.15.0-alpine

RUN echo root:root | chpasswd

RUN apk update && apk add nginx openrc openssh \
    && npm i -g pm2 \
    && mkdir /app \
    && chgrp -R www-data /app* \
    && chmod -R g+rw /app \
    && chmod -R g+rws /app \
    && npm i -g pm2
EXPOSE 22
EXPOSE 3000

#RUN echo "root:root" | chpasswd

RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
RUN echo 'root:root' | chpasswd
RUN sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
RUN sed -ie 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo 'cd /app' >> /root/.profile
#COPY ./ssh_init.sh /
#CMD ["/bin/bash", "-c", "/ssh_init.sh"]
#CMD ['/usr/sbin/sshd', '-D']


COPY ./ /app
COPY ./docker /setup
#COPY ./entry.sh /
RUN chmod +x /setup/entry.sh
ENTRYPOINT ["/bin/sh", "-c", "/setup/entry.sh"]

