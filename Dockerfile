# Image
FROM illallangi/ansible:latest as image

LABEL maintainer="Andrew Cole <andrew.cole@illallangi.com>"

COPY image/ /etc/ansible.d/image/
RUN /usr/local/bin/ansible-runner.sh image

# Container

ENV USER=ara
ENV UID=1024

COPY container/* /etc/ansible.d/container/
CMD ["/usr/local/bin/ara-entrypoint.sh"]