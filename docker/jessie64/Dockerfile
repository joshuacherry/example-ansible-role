# vim: set ft=dockerfile:

# Requires Ansible 1.8+ from jessie-backports.
FROM debian:jessie-backports

# Colour output.
ENV TERM=xterm

# Defaults to graphical.target.
RUN systemctl set-default multi-user.target

RUN apt-get update -y \
    && apt-get --no-install-recommends install -y \
      git \
      wget \
      libffi-dev \
      libssl-dev \
      python-dev \
      python-pip \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U setuptools

# A newish version of ansible is required, so install from pip instead of from
# the old Debian package.
RUN pip install ansible

RUN wget https://packages.chef.io/files/stable/inspec/1.23.0/ubuntu/14.04/inspec_1.23.0-1_amd64.deb \
    && dpkg -i inspec_1.23.0-1_amd64.deb \
    && rm inspec_1.23.0-1_amd64.deb
