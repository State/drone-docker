FROM fedora:20

RUN yum update -y -q; yum clean all
RUN yum install -y -q git wget docker-io; yum clean all
RUN yum install -y -q http://downloads.drone.io/master/drone.rpm; yum clean all

# RUN wget https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz \
#   -O - | tar -xz -C /tmp; \
#   mv /tmp/etcd*/etcdctl /usr/bin; \
#   rm -f /tmp/etcd*

ADD drone.sh /usr/local/bin/drone.sh

ENV DRONE_SERVER_PORT :80
EXPOSE 80
VOLUME /var/lib/drone
WORKDIR /var/lib/drone

ENTRYPOINT ["/usr/local/bin/drone.sh"]
