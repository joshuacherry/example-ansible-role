# vim: set ft=dockerfile:

# Requires Ansible 1.8+ from jessie-backports.
FROM debian:jessie-backports

# Colour output.
ENV TERM=xterm

# Defaults to graphical.target.
RUN systemctl set-default multi-user.target

RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
    && apt-get update -y \
    && apt-get --no-install-recommends install -y \
      git \
      wget \
      ca-certificates \
      ansible \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN wget https://packages.chef.io/files/stable/inspec/1.23.0/ubuntu/14.04/inspec_1.23.0-1_amd64.deb \
    && dpkg -i inspec_1.23.0-1_amd64.deb \
    && rm inspec_1.23.0-1_amd64.deb
